Return-Path: <linux-media+bounces-10610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A338B9A2B
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 13:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08DF51F21B84
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 11:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97173762E8;
	Thu,  2 May 2024 11:40:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4248942044
	for <linux-media@vger.kernel.org>; Thu,  2 May 2024 11:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714650013; cv=none; b=NFfkhaJ8aJiaNJSqb10yPCKCUdL+Q6Hra+Dt8ZUTMBFW2LA1AqtfG32TjS+Lzco6pt6XlNWt/EeQJsSQAYH3b3GgSddKIBQU3y7IuQ9MWpZ+geyBTYkaCWBMsag3YyD1+ZVuP+WqcggSZtwaNj6wyW8KRdciKUIdh6RdmgnsOl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714650013; c=relaxed/simple;
	bh=901TALhbGZrRgq1DIhVpSvuYy4QnaG9XUMO2wUCLjc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BRqHW0ahuLRRF7pSgCPzxmLfrnuLLv8KztHffwZxGVMkYrn2xn9YnYLZjPFSOfymi9beIbogTiZyrBtjhFLMr2jlB5dSUYx2Uy6ISV67hdLLiAfKNkFRML+5UmfiatEXajqOjS7E8r/+Iips0zitm4G15GwL6WvksCk1T07xPoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD40C113CC;
	Thu,  2 May 2024 11:40:11 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Yang@web.codeaurora.org, Chenyuan <cy54@illinois.edu>,
	Takashi Iwai <tiwai@suse.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH for v6.10 4/4] media: cec: core: avoid confusing "transmit timed out" message
Date: Thu,  2 May 2024 13:38:44 +0200
Message-ID: <70b13fcf5d43b567595fd7d4b25157ae793ab09c.1714649924.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1714649924.git.hverkuil-cisco@xs4all.nl>
References: <cover.1714649924.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If, when waiting for a transmit to finish, the wait is interrupted,
then you might get a "transmit timed out" message, even though the
transmit was interrupted and did not actually time out.

Set transmit_in_progress_aborted to true if the
wait_for_completion_killable() call was interrupted and ensure
that the transmit is properly marked as ABORTED.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Yang, Chenyuan <cy54@illinois.edu>
Fixes: 590a8e564c6ef ("media: cec: abort if the current transmit was canceled")
Closes: https://lore.kernel.org/linux-media/PH7PR11MB57688E64ADE4FE82E658D86DA09EA@PH7PR11MB5768.namprd11.prod.outlook.com/
---
 drivers/media/cec/core/cec-adap.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index a493cbce24567..da09834990b87 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -490,6 +490,15 @@ int cec_thread_func(void *_adap)
 			goto unlock;
 		}
 
+		if (adap->transmit_in_progress &&
+		    adap->transmit_in_progress_aborted) {
+			if (adap->transmitting)
+				cec_data_cancel(adap->transmitting,
+						CEC_TX_STATUS_ABORTED, 0);
+			adap->transmit_in_progress = false;
+			adap->transmit_in_progress_aborted = false;
+			goto unlock;
+		}
 		if (adap->transmit_in_progress && timeout) {
 			/*
 			 * If we timeout, then log that. Normally this does
@@ -771,6 +780,7 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 {
 	struct cec_data *data;
 	bool is_raw = msg_is_raw(msg);
+	int err;
 
 	if (adap->devnode.unregistered)
 		return -ENODEV;
@@ -935,10 +945,13 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 	 * Release the lock and wait, retake the lock afterwards.
 	 */
 	mutex_unlock(&adap->lock);
-	wait_for_completion_killable(&data->c);
+	err = wait_for_completion_killable(&data->c);
 	cancel_delayed_work_sync(&data->work);
 	mutex_lock(&adap->lock);
 
+	if (err)
+		adap->transmit_in_progress_aborted = true;
+
 	/* Cancel the transmit if it was interrupted */
 	if (!data->completed) {
 		if (data->msg.tx_status & CEC_TX_STATUS_OK)
-- 
2.43.0


