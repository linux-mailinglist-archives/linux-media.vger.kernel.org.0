Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB7B15924D5
	for <lists+linux-media@lfdr.de>; Sun, 14 Aug 2022 18:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242856AbiHNQfj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Aug 2022 12:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242731AbiHNQeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Aug 2022 12:34:13 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F002FFD6;
        Sun, 14 Aug 2022 09:27:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id E7A37CE0B5E;
        Sun, 14 Aug 2022 16:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361D0C433D6;
        Sun, 14 Aug 2022 16:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660494451;
        bh=OVXPhBDlAN+6wBq/lN4PTOu1yqd5ybIqomdkt/gXbqA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JNpkWmsKxhCuADfNeA+WcHz8eY0n9QABbqOLuO2oToRKBWf0pyU5sHBclmh7Bfkjs
         rIWkllefYmT3WA8nD5VkzbynrDaCpj/VTPSyOs42qy1x8hPCCz2AdT7BX2duq/Lf3B
         xGUz0FB+2zR0rqYcOBJTrW7A/YJcYTopsv+zcX6BbMbO57riT+ddJLnm9KKPhTKECB
         FiUyNU2z79xlRdqqhscbsIS1z1kWPAFAIUs4fYLeLdElwKwJZR91GHcBi948V+tz7A
         oX249SSlIvCgA3HSKPrDc9USeuYbCCUPNGWWDKaIWKy7U2xXKJN6j++gkllEz2gQ7P
         HAnS0GkVl4GaA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Kernel Functional Testing <lkft@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sasha Levin <sashal@kernel.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 26/28] venus: pm_helpers: Fix warning in OPP during probe
Date:   Sun, 14 Aug 2022 12:26:06 -0400
Message-Id: <20220814162610.2397644-26-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162610.2397644-1-sashal@kernel.org>
References: <20220814162610.2397644-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Stanimir Varbanov <stanimir.varbanov@linaro.org>

[ Upstream commit 1d95af02f23031c2e1cca7607c514b86ce85bc6e ]

Fix the following WARN triggered during Venus driver probe on
5.19.0-rc8-next-20220728:

 WARNING: CPU: 7 PID: 339 at drivers/opp/core.c:2471 dev_pm_opp_set_config+0x49c/0x610
 Modules linked in: qcom_spmi_adc5 rtc_pm8xxx qcom_spmi_adc_tm5 leds_qcom_lpg led_class_multicolor
  qcom_pon qcom_vadc_common venus_core(+) qcom_spmi_temp_alarm v4l2_mem2mem videobuf2_v4l2 msm(+)
  videobuf2_common crct10dif_ce spi_geni_qcom snd_soc_sm8250 i2c_qcom_geni gpu_sched
  snd_soc_qcom_common videodev qcom_q6v5_pas soundwire_qcom drm_dp_aux_bus qcom_stats
  drm_display_helper qcom_pil_info soundwire_bus snd_soc_lpass_va_macro mc qcom_q6v5
  phy_qcom_snps_femto_v2 qcom_rng snd_soc_lpass_macro_common snd_soc_lpass_wsa_macro
  lpass_gfm_sm8250 slimbus qcom_sysmon qcom_common qcom_glink_smem qmi_helpers
  qcom_wdt mdt_loader socinfo icc_osm_l3 display_connector
  drm_kms_helper qnoc_sm8250 drm fuse ip_tables x_tables ipv6
 CPU: 7 PID: 339 Comm: systemd-udevd Not tainted 5.19.0-rc8-next-20220728 #4
 Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
 pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 pc : dev_pm_opp_set_config+0x49c/0x610
 lr : dev_pm_opp_set_config+0x58/0x610
 sp : ffff8000093c3710
 x29: ffff8000093c3710 x28: ffffbca3959d82b8 x27: ffff8000093c3d00
 x26: ffffbca3959d8e08 x25: ffff4396cac98118 x24: ffff4396c0e24810
 x23: ffff4396c4272c40 x22: ffff4396c0e24810 x21: ffff8000093c3810
 x20: ffff4396cac36800 x19: ffff4396cac96800 x18: 0000000000000000
 x17: 0000000000000003 x16: ffffbca3f4edf198 x15: 0000001cba64a858
 x14: 0000000000000180 x13: 000000000000017e x12: 0000000000000000
 x11: 0000000000000002 x10: 0000000000000a60 x9 : ffff8000093c35c0
 x8 : ffff4396c4273700 x7 : ffff43983efca6c0 x6 : ffff43983efca640
 x5 : 00000000410fd0d0 x4 : ffff4396c4272c40 x3 : ffffbca3f5d1e008
 x2 : 0000000000000000 x1 : ffff4396c2421600 x0 : ffff4396cac96860
 Call trace:
  dev_pm_opp_set_config+0x49c/0x610
  devm_pm_opp_set_config+0x18/0x70
  vcodec_domains_get+0xb8/0x1638 [venus_core]
  core_get_v4+0x1d8/0x218 [venus_core]
  venus_probe+0xf4/0x468 [venus_core]
  platform_probe+0x68/0xd8
  really_probe+0xbc/0x2a8
  __driver_probe_device+0x78/0xe0
  driver_probe_device+0x3c/0xf0
  __driver_attach+0x70/0x120
  bus_for_each_dev+0x70/0xc0
  driver_attach+0x24/0x30
  bus_add_driver+0x150/0x200
  driver_register+0x64/0x120
  __platform_driver_register+0x28/0x38
  qcom_venus_driver_init+0x24/0x1000 [venus_core]
  do_one_initcall+0x54/0x1c8
  do_init_module+0x44/0x1d0
  load_module+0x16c8/0x1aa0
  __do_sys_finit_module+0xbc/0x110
  __arm64_sys_finit_module+0x20/0x30
  invoke_syscall+0x44/0x108
  el0_svc_common.constprop.0+0xcc/0xf0
  do_el0_svc+0x2c/0xb8
  el0_svc+0x2c/0x88
  el0t_64_sync_handler+0xb8/0xc0
  el0t_64_sync+0x18c/0x190
  qcom-venus: probe of aa00000.video-codec failed with error -16

The fix is re-ordering the code related to OPP core. The OPP core
expects all configuration options to be provided before the OPP
table is added.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index a591dd315ebc..03fc82cb3fea 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -875,7 +875,7 @@ static int vcodec_domains_get(struct venus_core *core)
 	}
 
 skip_pmdomains:
-	if (!core->has_opp_table)
+	if (!core->res->opp_pmdomain)
 		return 0;
 
 	/* Attach the power domain for setting performance state */
@@ -1007,6 +1007,10 @@ static int core_get_v4(struct venus_core *core)
 	if (ret)
 		return ret;
 
+	ret = vcodec_domains_get(core);
+	if (ret)
+		return ret;
+
 	if (core->res->opp_pmdomain) {
 		ret = devm_pm_opp_of_add_table(dev);
 		if (!ret) {
@@ -1017,10 +1021,6 @@ static int core_get_v4(struct venus_core *core)
 		}
 	}
 
-	ret = vcodec_domains_get(core);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
-- 
2.35.1

