Return-Path: <linux-media+bounces-43830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D16F7BC1050
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 12:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86C233B349D
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 10:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2281D2D949E;
	Tue,  7 Oct 2025 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b="drC/lRH6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx13.kaspersky-labs.com (mx13.kaspersky-labs.com [91.103.66.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279FE2D7DCC;
	Tue,  7 Oct 2025 10:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.103.66.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759833051; cv=none; b=nRikPXm5dO4oWQoQU2MRe9bh24VsyOIjz/fkigZrAJUIgWcnZhJkL1rAYELZjqLogiRHkNGns+PjSO6wRv7tRnUV/RnXTEUmJFfLOTu16BFhBosP+50hSNuONU5k7TbVvgKRe0Cg9Fs1xt2NMmwcOPe/9Un0BPnVE8TJC+3HfI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759833051; c=relaxed/simple;
	bh=BAUAh6z7TbSDesEOQqnrWYB8Q8VlkNfaY4AmSsvhzT0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jMeOO08Kbqtr/1uC6MoAejmuCZ81XRxoIO1CG3VSL1QnBwaclolnf3NDiPrO9Xq928DTwmBzXOby7RwOmlR2hECpAfjmQO7nCwfIPNchEO7jo+Yrz9iN1aWive7YRMsVOuQGJxQWGKq+1Rd5qQZ2qeoEL9l2nikhHdopZGpqJn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com; spf=pass smtp.mailfrom=kaspersky.com; dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b=drC/lRH6; arc=none smtp.client-ip=91.103.66.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaspersky.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
	s=mail202505; t=1759833047;
	bh=v21aBvSKnK7Vjsw81h0NFIikszr/E66UtyOGyhKph24=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=drC/lRH6cYqVCIrqTZzEoeg9u0rKa6Tu26fgzIbkC325/BAuF23ZUddufL65ysov0
	 M7dz3mFTC5OZxdM5iywzIH/2uNgNjLPQYxhy6pY8Wy330hBqrQHx1pUqlnpfLUCXhK
	 hmjquJor8oSkHfjtAxH0CQ36lfnAct7LfTsxgb/GwnI6BtII7L/4bfCNaIgBF5mvP7
	 ulnBk+F5lDCes04pU+Tz/h95d30v5stDJ00BgukBTldgmETbp6NvQZBjblylKq1LLq
	 UMd+cNT6dr+Qgy6kBl/CpG80RarpymtboHM0JoS2aio+DvX5I6xO2CRKM8YbDBhav7
	 CQuprkoxJDHxQ==
Received: from relay13.kaspersky-labs.com (localhost [127.0.0.1])
	by relay13.kaspersky-labs.com (Postfix) with ESMTP id 23F663E21B0;
	Tue,  7 Oct 2025 13:30:47 +0300 (MSK)
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail-hq2.kaspersky.com", Issuer "Kaspersky MailRelays CA G3" (verified OK))
	by mailhub13.kaspersky-labs.com (Postfix) with ESMTPS id 5E5F93E35EF;
	Tue,  7 Oct 2025 13:30:46 +0300 (MSK)
Received: from zhigulin-p.avp.ru (10.16.104.190) by HQMAILSRV2.avp.ru
 (10.64.57.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.36; Tue, 7 Oct
 2025 13:30:45 +0300
From: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
CC: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>, Vikash Garodia
	<vikash.garodia@oss.qualcomm.com>, Bryan O'Donoghue <bod@kernel.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov
	<stanimir.varbanov@linaro.org>, <linux-media@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH v2] media: venus: prevent potential integer overflow in decide_core()
Date: Tue, 7 Oct 2025 13:30:40 +0300
Message-ID: <20251007103043.1969715-1-Pavel.Zhigulin@kaspersky.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HQMAILSRV4.avp.ru (10.64.57.54) To HQMAILSRV2.avp.ru
 (10.64.57.52)
X-KSE-ServerInfo: HQMAILSRV2.avp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 10/07/2025 10:21:52
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 196857 [Oct 07 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: Pavel.Zhigulin@kaspersky.com
X-KSE-AntiSpam-Info: LuaCore: 69 0.3.69
 3c9ee7b2dda8a12f0d3dc9d3a59fa717913bd018
X-KSE-AntiSpam-Info: {Tracking_cluster_exceptions}
X-KSE-AntiSpam-Info: {Tracking_real_kaspersky_domains}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: lore.kernel.org:7.1.1;kaspersky.com:7.1.1,5.0.1;zhigulin-p.avp.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {Tracking_white_helo}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/07/2025 10:24:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/7/2025 9:03:00 AM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSMG-AntiPhishing: NotDetected, bases: 2025/10/07 08:54:00
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/10/07 09:28:00 #27888718
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2025/10/07 08:54:00
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
v2: Revert min_coreid and min_lp_coreid to u32 as
    Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com> suggested
	during review
v1: https://lore.kernel.org/all/20251006154041.1804800-1-Pavel.Zhigulin@kaspersky.com/
 drivers/media/platform/qcom/venus/pm_helpers.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f0269524ac70..eec49590e806 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -582,9 +582,9 @@ static int move_core_to_power_save_mode(struct venus_core *core,
 }

 static void
-min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load, bool low_power)
+min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u64 *min_load, bool low_power)
 {
-	u32 mbs_per_sec, load, core1_load = 0, core2_load = 0;
+	u64 mbs_per_sec, load, core1_load = 0, core2_load = 0;
 	u32 cores_max = core_num_max(inst);
 	struct venus_core *core = inst->core;
 	struct venus_inst *inst_pos;
@@ -639,8 +639,9 @@ static int decide_core(struct venus_inst *inst)
 {
 	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
 	struct venus_core *core = inst->core;
-	u32 min_coreid, min_load, cur_inst_load;
-	u32 min_lp_coreid, min_lp_load, cur_inst_lp_load;
+	u32 min_coreid, min_lp_coreid;
+	u64 min_load, cur_inst_load;
+	u64 min_lp_load, cur_inst_lp_load;
 	struct hfi_videocores_usage_type cu;
 	unsigned long max_freq = ULONG_MAX;
 	struct device *dev = core->dev;
--
2.43.0


