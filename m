Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99609784B02
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 22:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbjHVUGk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 16:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbjHVUGh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 16:06:37 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E3ACE3
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 13:06:34 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-313e742a787so3007577f8f.1
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 13:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692734793; x=1693339593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFC5befy1B0F6DaTi/N+wys/sVJv12I6nLzZb1Lm1oY=;
        b=d0WBoA0WWQC/vb52sZv9vPGSanvUji7KX0y7Ts1JWHJqwfEm12Wu0k3rqlB7NcO3GR
         yMXbE2i4UJ87eF8Z3+IFs6M6BiGhbE7yYXw4lssfBeUaI44FJvBHPRAkFOujzUmInA5V
         PYAzTd0jbytTE3UZAjzptmQkrDd8/eLsbfavOcRt8oJOtYLrqwSAlODmkcU4P94uerF3
         qkqr/SuDGOcXu4CRpbVjmGpEwxcvIddibisBHjl/NlFhQUQJ7kTr1jR/VhKoDQZi/mvU
         /ze7J/vqbD0d+Jwtlnt/1jbI2bjXkFQ47IY+OWHlL0wiVf+bQjYWzjWqXq1nT5aMPPtO
         YEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692734793; x=1693339593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFC5befy1B0F6DaTi/N+wys/sVJv12I6nLzZb1Lm1oY=;
        b=eUjnRo+PhNkX99iQjwQUAIIoLJBGRmPxcCOBW9IupWnB7QoFWvpepuinBTw/42O7Ps
         6x3UlZYJJbgEppj4mWLJ6RxNsJolfG5Q8egFc9rviiVpths91+jlHbHEI1MbRFYPnSP7
         xiGzqFYTALIJxRMjcDpnPU/H3jF7V0oGDuPjf3WgQEZnJ5dF/hll2Q1pzFfVrujeehKz
         BqNBU3ELo3WcQsN+BT19m+K0LxE4QfyPseU3+vuZ0teOZoiDOR9s5efYbp7evrTR8KtD
         +A1RDOYn220P1BFAp5TC8FJilN3WaJFP70gZl8Zcm9cT+k1mSAb0g5vZnQOmfFosDUCP
         EMEg==
X-Gm-Message-State: AOJu0Yxoq2lO6JBYKuofvJLRRzJHgwsNEygFURQRjD52NSqffJW7hIRE
        qZgEt3yLbFqxh/n86RR9fvBorQ==
X-Google-Smtp-Source: AGHT+IEz8kbqeiCPikQZtaldhZ4L98TZeKwAoyjtudgWaOIkZS8VBAYHD1esNnBmjh51/AAdWqpD9w==
X-Received: by 2002:adf:e704:0:b0:314:2f3e:dca5 with SMTP id c4-20020adfe704000000b003142f3edca5mr9847764wrm.28.1692734793459;
        Tue, 22 Aug 2023 13:06:33 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y12-20020adfee0c000000b0031aeca90e1fsm12873690wrn.70.2023.08.22.13.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 13:06:32 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v2 3/9] media: qcom: camss: Fix vfe_get() error jump
Date:   Tue, 22 Aug 2023 21:06:20 +0100
Message-ID: <20230822200626.1931129-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822200626.1931129-1-bryan.odonoghue@linaro.org>
References: <20230822200626.1931129-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Right now it is possible to do a vfe_get() with the internal reference
count at 1. If vfe_check_clock_rates() returns non-zero then we will
leave the reference count as-is and

run:
- pm_runtime_put_sync()
- vfe->ops->pm_domain_off()

skip:
- camss_disable_clocks()

Subsequent vfe_put() calls will when the ref-count is non-zero
unconditionally run:

- pm_runtime_put_sync()
- vfe->ops->pm_domain_off()
- camss_disable_clocks()

vfe_get() should not attempt to roll-back on error when the ref-count is
non-zero as the upper layers will still do their own vfe_put() operations.

vfe_put() will drop the reference count and do the necessary power
domain release, the cleanup jumps in vfe_get() should only be run when
the ref-count is zero.

[   50.095796] CPU: 7 PID: 3075 Comm: cam Not tainted 6.3.2+ #80
[   50.095798] Hardware name: LENOVO 21BXCTO1WW/21BXCTO1WW, BIOS N3HET82W (1.54 ) 05/26/2023
[   50.095799] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   50.095802] pc : refcount_warn_saturate+0xf4/0x148
[   50.095804] lr : refcount_warn_saturate+0xf4/0x148
[   50.095805] sp : ffff80000c7cb8b0
[   50.095806] x29: ffff80000c7cb8b0 x28: ffff16ecc0e3fc10 x27: 0000000000000000
[   50.095810] x26: 0000000000000000 x25: 0000000000020802 x24: 0000000000000000
[   50.095813] x23: ffff16ecc7360640 x22: 00000000ffffffff x21: 0000000000000005
[   50.095815] x20: ffff16ed175f4400 x19: ffffb4d9852942a8 x18: ffffffffffffffff
[   50.095818] x17: ffffb4d9852d4a48 x16: ffffb4d983da5db8 x15: ffff80000c7cb320
[   50.095821] x14: 0000000000000001 x13: 2e656572662d7265 x12: 7466612d65737520
[   50.095823] x11: 00000000ffffefff x10: ffffb4d9850cebf0 x9 : ffffb4d9835cf954
[   50.095826] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000057fa8
[   50.095829] x5 : ffff16f813fe3d08 x4 : 0000000000000000 x3 : ffff621e8f4d2000
[   50.095832] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff16ed32119040
[   50.095835] Call trace:
[   50.095836]  refcount_warn_saturate+0xf4/0x148
[   50.095838]  device_link_put_kref+0x84/0xc8
[   50.095843]  device_link_del+0x38/0x58
[   50.095846]  vfe_pm_domain_off+0x3c/0x50 [qcom_camss]
[   50.095860]  vfe_put+0x114/0x140 [qcom_camss]
[   50.095869]  csid_set_power+0x2c8/0x408 [qcom_camss]
[   50.095878]  pipeline_pm_power_one+0x164/0x170 [videodev]
[   50.095896]  pipeline_pm_power+0xc4/0x110 [videodev]
[   50.095909]  v4l2_pipeline_pm_use+0x5c/0xa0 [videodev]
[   50.095923]  v4l2_pipeline_pm_get+0x1c/0x30 [videodev]
[   50.095937]  video_open+0x7c/0x100 [qcom_camss]
[   50.095945]  v4l2_open+0x84/0x130 [videodev]
[   50.095960]  chrdev_open+0xc8/0x250
[   50.095964]  do_dentry_open+0x1bc/0x498
[   50.095966]  vfs_open+0x34/0x40
[   50.095968]  path_openat+0xb44/0xf20
[   50.095971]  do_filp_open+0xa4/0x160
[   50.095974]  do_sys_openat2+0xc8/0x188
[   50.095975]  __arm64_sys_openat+0x6c/0xb8
[   50.095977]  invoke_syscall+0x50/0x128
[   50.095982]  el0_svc_common.constprop.0+0x4c/0x100
[   50.095985]  do_el0_svc+0x40/0xa8
[   50.095988]  el0_svc+0x2c/0x88
[   50.095991]  el0t_64_sync_handler+0xf4/0x120
[   50.095994]  el0t_64_sync+0x190/0x198
[   50.095996] ---[ end trace 0000000000000000 ]---

Fixes: 779096916dae ("media: camss: vfe: Fix runtime PM imbalance on error")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index dabfd613b2f94..938f373bcd1fd 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -611,7 +611,7 @@ int vfe_get(struct vfe_device *vfe)
 	} else {
 		ret = vfe_check_clock_rates(vfe);
 		if (ret < 0)
-			goto error_pm_runtime_get;
+			goto error_pm_domain;
 	}
 	vfe->power_count++;
 
-- 
2.41.0

