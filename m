Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 741A92A1E2B
	for <lists+linux-media@lfdr.de>; Sun,  1 Nov 2020 14:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgKANBS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Nov 2020 08:01:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgKANBR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Nov 2020 08:01:17 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D886C061A47
        for <linux-media@vger.kernel.org>; Sun,  1 Nov 2020 05:01:17 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id cw8so1264940ejb.8
        for <linux-media@vger.kernel.org>; Sun, 01 Nov 2020 05:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=lMd0z90fXBCFWfGxAqTvV9qLhHTZI7s2QacRT/7mEpY=;
        b=s5u/f0u6ytLNpJGnXy/S0S7MrM0ha4Mq49kyjK8PEHbdUiC2uq3x4U2BtjmaWHI2ml
         /5xPzY6lwXBg/CVbQ5/OU/9iNXLSrlUSXgj08TAIDQplXNXEs5punOiJ6qXRiqCNLFR/
         BfeVaizUfrIEA8maStH0LZ+sKyI3cg80hvxxN6sOH9QA8AZotqUIhJPYaXk0tll4ht4z
         UfcnbQ0r8u0gesCVpnM085gpHsLejdXMbyLcgaKzs35a6YC32cN2j1kP6lpiDncnyBsa
         KYuCkYZgypcqTlR7xNlGTl0/XVmCFv9FOhEk4pAt9NIuHCIjY5hdGqutARTuorewdj9m
         mL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lMd0z90fXBCFWfGxAqTvV9qLhHTZI7s2QacRT/7mEpY=;
        b=JaIhRjz6UMjdl+vhAwpTeU6OyqsKCIgp75q2cY7bmBAKyVuDU+USP0hhGZYCdUqOfI
         vHFNYeKX3Xz4lwvYXnMpBKVfKhwpr/uwcFjhRHAst1HiXAAsfmOv46xgoada7BIp2Y/d
         Rc4CkPTGJWNLlxohYK64pZBSWeYCzQIbmCpbPynszIGTQuqlLXWUuw7LJPb3Aya91ydX
         IQ/gar5EBb80Rzx7bOlh/hKIvy+rJNDVMF7WDBnvi22gMCby05Yf93xfWSbQGFlXAX15
         H+v0Gm1ZSWeNabyH9netZzH/oCKcnaSjdNd1jbeMdk6JNjSNmZvBkk/oq2kaGOxbqhWd
         GOSg==
X-Gm-Message-State: AOAM533ri3qHtXHBxoLb6l1P2LhW6u2YPGiYYHuzNjJ1D2tBfBR9IgmM
        P7LDoInOPRUGNxo7Ln0vaYFD4tVGrkP+J1fH
X-Google-Smtp-Source: ABdhPJx5IXUuRrZWjeV1Da4yplp311qE7/LjDPeernxwNW2FV4qGEqKVBwgbxdqAIwowhy64Um6+OQ==
X-Received: by 2002:a17:906:b043:: with SMTP id bj3mr10700471ejb.543.1604235675524;
        Sun, 01 Nov 2020 05:01:15 -0800 (PST)
Received: from localhost.localdomain (hst-221-79.medicom.bg. [84.238.221.79])
        by smtp.gmail.com with ESMTPSA id l17sm7315001eji.14.2020.11.01.05.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 05:01:14 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: pm_helpers: Fix kernel module reload
Date:   Sun,  1 Nov 2020 15:00:52 +0200
Message-Id: <20201101130052.20974-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After initial kernel module load during kernel boot and removing
the module and try to load it again an Unable to handle kernel
paging request is observed:

Unable to handle kernel paging request at virtual address ffffa44f7416eae0
 Mem abort info:
   ESR = 0x96000047
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
 Data abort info:
   ISV = 0, ISS = 0x00000047
   CM = 0, WnR = 1
 swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000008147c000
 [ffffa44f7416eae0] pgd=000000017df9f003, p4d=000000017df9f003,
 pud=000000017df9e003, pmd=000000017df9b003, pte=0000000000000000
 Internal error: Oops: 96000047 [#1] PREEMPT SMP
 Modules linked in: venus_core(+) snd_soc_wsa881x regmap_sdw af_alg
  snd_soc_wcd934x soundwire_qcom gpio_wcd934x q6asm_dai q6routing
  q6adm q6afe_dai snd_soc_hdmi_codec q6afe q6asm q6dsp_common q6cor
  display_connector rmtfs_mem drm ip_tables x_tables ipv6
  [last unloaded: venus_core]
 CPU: 6 PID: 889 Comm: modprobe Tainted: G        W      5.10.0-rc1+ #8
 Hardware name: Thundercomm Dragonboard 845c (DT)
 pstate: 80400085 (Nzcv daIf +PAN -UAO -TCO BTYPE=--)
 pc : queued_spin_lock_slowpath+0x1dc/0x3c8
 lr : do_raw_spin_lock+0xc0/0x118
 sp : ffff8000142cb7b0
 x29: ffff8000142cb7b0 x28: 0000000000000013
 x27: ffffa44f72de5690 x26: 0000000000000003
 x25: ffff17c2d00f8080 x24: ffff17c2c0d78010
 x23: ffff17c2c0d4f700 x22: ffff17c2d00f8080
 x21: 0000000000000000 x20: ffffa44f74148000
 x19: ffff17c2c0d4f8f8 x18: 0000000000000000
 x17: 0000000000000000 x16: ffffa44f7342f158
 x15: 0000000000000040 x14: ffffa44f746e8320
 x13: 0000000000000228 x12: 0000000000000020
 x11: 0000000000000000 x10: 00000000001c0000
 x9 : 0000000000000000 x8 : ffff17c33d746ac0
 x7 : ffff17c2c109b000 x6 : ffffa44f7416eac0
 x5 : ffff17c33d746ac0 x4 : 0000000000000000
 x3 : ffff17c2c0d4f8f8 x2 : ffffa44f7416eae0
 x1 : ffffa44f7416eae0 x0 : ffff17c33d746ac8
 Call trace:
  queued_spin_lock_slowpath+0x1dc/0x3c8
  do_raw_spin_lock+0xc0/0x118
  _raw_spin_lock_irqsave+0x80/0x14c
  __pm_runtime_resume+0x38/0xb8
  device_link_add+0x3b8/0x5d0
  core_get_v4+0x268/0x2d8 [venus_core]
  venus_probe+0x108/0x458 [venus_core]
  platform_drv_probe+0x54/0xa8
  really_probe+0xe4/0x3b0
  driver_probe_device+0x58/0xb8
  device_driver_attach+0x74/0x80
  __driver_attach+0x58/0xe8
  bus_for_each_dev+0x70/0xc0
  driver_attach+0x24/0x30
  bus_add_driver+0x150/0x1f8
  driver_register+0x64/0x120
  __platform_driver_register+0x48/0x58
  qcom_venus_driver_init+0x20/0x1000 [venus_core]
  do_one_initcall+0x84/0x458
  do_init_module+0x58/0x208
  load_module+0x1ec0/0x26a8
  __do_sys_finit_module+0xb8/0xf8
  __arm64_sys_finit_module+0x20/0x30
  el0_svc_common.constprop.0+0x7c/0x1c0
  do_el0_svc+0x24/0x90
  el0_sync_handler+0x180/0x188
  el0_sync+0x174/0x180
 Code: 91002100 8b0200c2 f861d884 aa0203e1 (f8246828)
 ---[ end trace f1f687c15fd6b2ca ]---
 note: modprobe[889] exited with preempt_count 1

After revisit the OPP part of the code I found that OPP pmdomain
is detached with direct call to dev_pm_domain_detach instead of
OPP wraper for detaching pmdomains with OPP table. Correct this
by calling the OPP dev_pm_opp_detach_genpd.

Fixes: 9a538b83612c ('media: venus: core: Add support for opp tables/perf voting')
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 0ebba8e3bd75..2946547a0df4 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -804,7 +804,7 @@ static int vcodec_domains_get(struct device *dev)
 	return 0;
 
 opp_dl_add_err:
-	dev_pm_domain_detach(core->opp_pmdomain, true);
+	dev_pm_opp_detach_genpd(core->opp_table);
 opp_attach_err:
 	if (core->pd_dl_venus) {
 		device_link_del(core->pd_dl_venus);
@@ -842,7 +842,7 @@ static void vcodec_domains_put(struct device *dev)
 	if (core->opp_dl_venus)
 		device_link_del(core->opp_dl_venus);
 
-	dev_pm_domain_detach(core->opp_pmdomain, true);
+	dev_pm_opp_detach_genpd(core->opp_table);
 }
 
 static int core_get_v4(struct device *dev)
-- 
2.17.1

