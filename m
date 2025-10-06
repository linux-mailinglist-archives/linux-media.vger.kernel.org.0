Return-Path: <linux-media+bounces-43794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D03BBE846
	for <lists+linux-media@lfdr.de>; Mon, 06 Oct 2025 17:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 744BF3498A3
	for <lists+linux-media@lfdr.de>; Mon,  6 Oct 2025 15:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E7D2D877A;
	Mon,  6 Oct 2025 15:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b="dSA3plS7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx12.kaspersky-labs.com (mx12.kaspersky-labs.com [91.103.66.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E163D18FDBD;
	Mon,  6 Oct 2025 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.103.66.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759765278; cv=none; b=QJtjLNm/QKS5lYYe49vB+7MaVEqpe9LAkFULVoh/WtzydZHtXdzFpIcojMz+GGXTp7WsKkUyJ5aSNy2cMZoV6DPpmLLDfmTt5jPrrJMGFFWIEJ0WhhzrKnh/B/M1eW/Exxqe+X91BbLJDNrMWP5DUXvHSIt4bJgxchV2Q+u+Q4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759765278; c=relaxed/simple;
	bh=R+sN6ADGlt2sSI1kf77k/uVsIU5tLFT2ohjqAkS9vX4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iq1fNEDy8LzaynCjHWMF+t/lrtxCE9o5UeJp6sFSxnJzv4roNEDEGW9e6cTeuTq8f8NoP6BjpkP9IFzc4yhnugYBAeEfvRRTu8GXwcxcFAgNboEmaql0oLRwUSYFRg/fy1wqCYSte1r6haLA/jdFb9LOMEFvqMqipP1J5zRpCas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com; spf=pass smtp.mailfrom=kaspersky.com; dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b=dSA3plS7; arc=none smtp.client-ip=91.103.66.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaspersky.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
	s=mail202505; t=1759765266;
	bh=V6hz1B4mtJdzT98ieCSTKsGH6x9KhsbT0+TQ+ObugME=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dSA3plS7an6tlB67+hp2tdvPlNOHq9yz33iq9hbkVsMYumqj0Fm218g9tqcXxpFKJ
	 pGR93brh5LChoqtTSb8tSYitOLJDq7wcO83m6wwkQvP0gYoX8DEThDo6JEmuU8xFmu
	 eLCxllc3AC6xzo7z4PIc65qYWayPzAdNHSSJG5EmXxDzYIuUgEjO2x3C5O7LHGMRVp
	 BGVRKFVp6CPqwOGfTD/w60B34RQfFlVA2YXNpF/qsnlo35tbhqV0RvaNN1Gfh2qP25
	 0UYpUVwpqizLg1ntvUm4E2ns1NfznVBlPSYHFx88zMKty5h4CgGhvPtgxF931jdVoR
	 L+6eK3jqhl43A==
Received: from relay12.kaspersky-labs.com (localhost [127.0.0.1])
	by relay12.kaspersky-labs.com (Postfix) with ESMTP id DCEFC5A48E2;
	Mon,  6 Oct 2025 18:41:06 +0300 (MSK)
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail-hq2.kaspersky.com", Issuer "Kaspersky MailRelays CA G3" (verified OK))
	by mailhub12.kaspersky-labs.com (Postfix) with ESMTPS id C4EDD5A5600;
	Mon,  6 Oct 2025 18:41:05 +0300 (MSK)
Received: from zhigulin-p.avp.ru (10.16.104.190) by HQMAILSRV2.avp.ru
 (10.64.57.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.36; Mon, 6 Oct
 2025 18:41:05 +0300
From: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
CC: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>, Dikshita Agarwal
	<dikshita.agarwal@oss.qualcomm.com>, Bryan O'Donoghue <bod@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov
	<stanimir.varbanov@linaro.org>, <linux-media@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH] media: venus: prevent potential integer overflow in decide_core()
Date: Mon, 6 Oct 2025 18:40:39 +0300
Message-ID: <20251006154041.1804800-1-Pavel.Zhigulin@kaspersky.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HQMAILSRV3.avp.ru (10.64.57.53) To HQMAILSRV2.avp.ru
 (10.64.57.52)
X-KSE-ServerInfo: HQMAILSRV2.avp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 10/06/2025 15:29:05
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 196845 [Oct 06 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: Pavel.Zhigulin@kaspersky.com
X-KSE-AntiSpam-Info: LuaCore: 69 0.3.69
 3c9ee7b2dda8a12f0d3dc9d3a59fa717913bd018
X-KSE-AntiSpam-Info: {Tracking_cluster_exceptions}
X-KSE-AntiSpam-Info: {Tracking_real_kaspersky_domains}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: zhigulin-p.avp.ru:5.0.1,7.1.1;kaspersky.com:5.0.1,7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {Tracking_white_helo}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/06/2025 15:32:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/6/2025 2:38:00 PM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/10/06 14:52:00 #27885947
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 52

The function 'decide_core()' contains the following code:

	cur_inst_load = load_per_instance(inst);
	cur_inst_load *= inst->clk_data.vpp_freq;
	...
	cur_inst_lp_load = load_per_instance(inst);
	cur_inst_lp_load *= inst->clk_data.low_power_freq;

This can lead to an integer overflow because the variables
'cur_inst_load' and 'cur_inst_lp_load' are of type u32.

The overflow can occur in the following scenario:

  1. The current FPS is 240 (VENUS_MAX_FPS constant).
     The processed image frame has a resolution of 4096x4096 pixels.
  2. According to 'codec_freq_data':
       - 'inst->clk_data.low_power_freq' can be up to 320
       - 'inst->clk_data.vpp_freq' can be up to 675
     (see drivers/media/platform/qcom/venus/hfi_platform_v4.c
      and drivers/media/platform/qcom/venus/hfi_platform_v6.c)
  3. 'load_per_instance()' returns 15728640 under these conditions.
  4. As a result:
       cur_inst_load *= inst->clk_data.vpp_freq → 10616832000
       cur_inst_lp_load *= inst->clk_data.low_power_freq → 5033164800

The proposed fix changes the type of these variables from u32 to u64
to prevent overflow.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 3cfe5815ce0e ("media: venus: Enable low power setting for encoder")
Signed-off-by: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f0269524ac70..caaab097a04d 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -582,9 +582,9 @@ static int move_core_to_power_save_mode(struct venus_core *core,
 }

 static void
-min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load, bool low_power)
+min_loaded_core(struct venus_inst *inst, u64 *min_coreid, u64 *min_load, bool low_power)
 {
-	u32 mbs_per_sec, load, core1_load = 0, core2_load = 0;
+	u64 mbs_per_sec, load, core1_load = 0, core2_load = 0;
 	u32 cores_max = core_num_max(inst);
 	struct venus_core *core = inst->core;
 	struct venus_inst *inst_pos;
@@ -639,8 +639,8 @@ static int decide_core(struct venus_inst *inst)
 {
 	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
 	struct venus_core *core = inst->core;
-	u32 min_coreid, min_load, cur_inst_load;
-	u32 min_lp_coreid, min_lp_load, cur_inst_lp_load;
+	u64 min_coreid, min_load, cur_inst_load;
+	u64 min_lp_coreid, min_lp_load, cur_inst_lp_load;
 	struct hfi_videocores_usage_type cu;
 	unsigned long max_freq = ULONG_MAX;
 	struct device *dev = core->dev;
--
2.43.0


