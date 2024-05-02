Return-Path: <linux-media+bounces-10609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B24FB8B9A2A
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 13:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E35001C20D7C
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 11:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC7A75802;
	Thu,  2 May 2024 11:40:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2AB42044
	for <linux-media@vger.kernel.org>; Thu,  2 May 2024 11:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714650011; cv=none; b=gU2kb1x+vEv6Rxk0rcvbaAKttOZiWcFTKAsg7EHOnyhY0ZVvnWYXrMbQBnti3oQE1/TrEwC+VhiyRIsxnxC1ZhQ1teAqRkb1Jh7+jM3SoH3hH1vVVHGzxTqDBs27ZyQKljilrbphqZwVNy+465b+Tlo3JI2QGi3T6B6qF1BGkNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714650011; c=relaxed/simple;
	bh=oz/kHA1GN13RsL69d5OjezLReqkEAfvQ61QcvOqwfoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tmOdTnRfcRame1sbvsMYQYQdEjeuYolHI9TsH0J2+5ZYPem1B8yHcarLBkcOB9AR4MVbJ0miJ46SBss10OTWZFC5XOlOvwn0nugonbFdCbk4EQAjSEMJ0MMF3/WW6AWK66UhvVWGCfQN95p1kn01PGxGyQ/MLXJiRK823iOppTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0324FC4AF19;
	Thu,  2 May 2024 11:40:09 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Yang@web.codeaurora.org, Chenyuan <cy54@illinois.edu>,
	Takashi Iwai <tiwai@suse.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH for v6.10 3/4] media: cec: core: avoid recursive cec_claim_log_addrs
Date: Thu,  2 May 2024 13:38:43 +0200
Message-ID: <171a0747fe4a63e8e85fb747738dfd528162843c.1714649924.git.hverkuil-cisco@xs4all.nl>
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

Keep track if cec_claim_log_addrs() is running, and return -EBUSY
if it is when calling CEC_ADAP_S_LOG_ADDRS.

This prevents a case where cec_claim_log_addrs() could be called
while it was still in progress.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Yang, Chenyuan <cy54@illinois.edu>
Fixes: ca684386e6e2 ("[media] cec: add HDMI CEC framework (api)")
Closes: https://lore.kernel.org/linux-media/PH7PR11MB57688E64ADE4FE82E658D86DA09EA@PH7PR11MB5768.namprd11.prod.outlook.com/
---
 drivers/media/cec/core/cec-adap.c | 6 +++++-
 drivers/media/cec/core/cec-api.c  | 2 +-
 include/media/cec.h               | 1 +
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 6fc7de744ee9a..a493cbce24567 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -1574,9 +1574,12 @@ static int cec_config_thread_func(void *arg)
  */
 static void cec_claim_log_addrs(struct cec_adapter *adap, bool block)
 {
-	if (WARN_ON(adap->is_configuring || adap->is_configured))
+	if (WARN_ON(adap->is_claiming_log_addrs ||
+		    adap->is_configuring || adap->is_configured))
 		return;
 
+	adap->is_claiming_log_addrs = true;
+
 	init_completion(&adap->config_completion);
 
 	/* Ready to kick off the thread */
@@ -1591,6 +1594,7 @@ static void cec_claim_log_addrs(struct cec_adapter *adap, bool block)
 		wait_for_completion(&adap->config_completion);
 		mutex_lock(&adap->lock);
 	}
+	adap->is_claiming_log_addrs = false;
 }
 
 /*
diff --git a/drivers/media/cec/core/cec-api.c b/drivers/media/cec/core/cec-api.c
index d64bb716f9c68..3ef9153443044 100644
--- a/drivers/media/cec/core/cec-api.c
+++ b/drivers/media/cec/core/cec-api.c
@@ -178,7 +178,7 @@ static long cec_adap_s_log_addrs(struct cec_adapter *adap, struct cec_fh *fh,
 			   CEC_LOG_ADDRS_FL_ALLOW_RC_PASSTHRU |
 			   CEC_LOG_ADDRS_FL_CDC_ONLY;
 	mutex_lock(&adap->lock);
-	if (!adap->is_configuring &&
+	if (!adap->is_claiming_log_addrs && !adap->is_configuring &&
 	    (!log_addrs.num_log_addrs || !adap->is_configured) &&
 	    !cec_is_busy(adap, fh)) {
 		err = __cec_s_log_addrs(adap, &log_addrs, block);
diff --git a/include/media/cec.h b/include/media/cec.h
index c8350258f10af..d3abe84c9c9e5 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -258,6 +258,7 @@ struct cec_adapter {
 	u16 phys_addr;
 	bool needs_hpd;
 	bool is_enabled;
+	bool is_claiming_log_addrs;
 	bool is_configuring;
 	bool must_reconfigure;
 	bool is_configured;
-- 
2.43.0


