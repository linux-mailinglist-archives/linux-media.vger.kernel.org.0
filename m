Return-Path: <linux-media+bounces-10607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E6B8B9A28
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 13:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D9B91F21A55
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 11:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51EB69944;
	Thu,  2 May 2024 11:40:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A2D42044
	for <linux-media@vger.kernel.org>; Thu,  2 May 2024 11:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714650008; cv=none; b=qFr1dKlbmBjC01W1vnzuBGe1f0ks1rD0ssYeVThSHIkFMX8MuEG33VgBAfIWmLtAL2xySUB8/5O3JLxtPcyCkku/d1GpFUJA4f18UImqujRRYkAC5zQ2M57gkq+mLDvDPT3w5M+9fHEBk5gtI/kB5WYX/G8Wu/9UPwNB/HV7OHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714650008; c=relaxed/simple;
	bh=RTFy8zQW55Cx7n1Ay0Gu4qa7jplIYCQqMVCptBa45Qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bpOMMWN3xYqdaJZ+GLjuK6M/VI+RlpAlExwoo+Gp6jXjp8oqlSvPEdXT3o/Oe0oMCVea0Te31gToYPh2JUQUB5tM7oxcP5/zQfJOf6Ljw215z+25IZoOCo80dj9PSgHukEMba/goLCyzy5jql/wwnAT6Bonn6PpYZch4fPjlnho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3FDC4AF18;
	Thu,  2 May 2024 11:40:06 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Yang@web.codeaurora.org, Chenyuan <cy54@illinois.edu>,
	Takashi Iwai <tiwai@suse.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH for v6.10 1/4] media: cec: cec-adap: always cancel work in cec_transmit_msg_fh
Date: Thu,  2 May 2024 13:38:41 +0200
Message-ID: <ee47a5df845643f3eee272b951535d7b43547074.1714649924.git.hverkuil-cisco@xs4all.nl>
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

Do not check for !data->completed, just always call
cancel_delayed_work_sync(). This fixes a small race condition.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Yang, Chenyuan <cy54@illinois.edu>
Fixes: 490d84f6d73c ("media: cec: forgot to cancel delayed work")
Closes: https://lore.kernel.org/linux-media/PH7PR11MB57688E64ADE4FE82E658D86DA09EA@PH7PR11MB5768.namprd11.prod.outlook.com/
---
 drivers/media/cec/core/cec-adap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 559a172ebc6cb..6fc7de744ee9a 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -936,8 +936,7 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 	 */
 	mutex_unlock(&adap->lock);
 	wait_for_completion_killable(&data->c);
-	if (!data->completed)
-		cancel_delayed_work_sync(&data->work);
+	cancel_delayed_work_sync(&data->work);
 	mutex_lock(&adap->lock);
 
 	/* Cancel the transmit if it was interrupted */
-- 
2.43.0


