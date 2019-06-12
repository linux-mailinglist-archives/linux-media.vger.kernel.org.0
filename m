Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5390842835
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 15:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409302AbfFLN6Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 09:58:16 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:58240 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409244AbfFLN6N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 09:58:13 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190612135812euoutp019a5b59847e23b7dae895eeb66cbfedd9~neCQOF1yG2151621516euoutp01O;
        Wed, 12 Jun 2019 13:58:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190612135812euoutp019a5b59847e23b7dae895eeb66cbfedd9~neCQOF1yG2151621516euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1560347892;
        bh=dQ5PUW9NbKR5T9gQpp8ZzssZAKQ6xAIC11ISnikTk/s=;
        h=From:To:Cc:Subject:Date:References:From;
        b=d+96FKJxY4Uho1xo/iHbMq4ZSRSOcYuejZvQ9bHLvCdM6CSaUYSPClRjoEIJSMKAK
         wD5V4DYcpR0wMo9QORNFfRCZSBN7mV0BNWLnql7mR17ZFieH1yvO54O9YO4xl11q+K
         6tIrV9eUbN6w/sQIFwRbzWiV6iwIxEmgO6gwaKOw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190612135811eucas1p2e73e24f16e84b17ccf3eed029953d811~neCPwOK0f3159531595eucas1p2W;
        Wed, 12 Jun 2019 13:58:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 48.B7.04325.3F4010D5; Wed, 12
        Jun 2019 14:58:11 +0100 (BST)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190612135810eucas1p250a60b5dd8c43c331c8e051e8cd2c3e6~neCO0Jsvi3159531595eucas1p2O;
        Wed, 12 Jun 2019 13:58:10 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-4d-5d0104f38f01
Received: from eusync1.samsung.com ( [203.254.199.211]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id AE.2B.04140.2F4010D5; Wed, 12
        Jun 2019 14:58:10 +0100 (BST)
Received: from AMDC2765.DIGITAL.local ([106.120.51.73]) by
        eusync1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0 64bit
        (built May  5 2014)) with ESMTPA id <0PSZ00B1FO4UUH70@eusync1.samsung.com>;
        Wed, 12 Jun 2019 14:58:10 +0100 (BST)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Smitha T Murthy <smitha.t@samsung.com>
Subject: [PATCH] media: s5p-mfc: fix reading min scratch buffer size on MFC
 v6/v7
Date:   Wed, 12 Jun 2019 15:57:57 +0200
Message-id: <20190612135757.3759-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsWy7djPc7qfWRhjDV53C1vcWneO1aJnw1ZW
        ixnn9zFZrD1yl93i8Jt2Vou7e7YxOrB59G1ZxejxeZNcAFMUl01Kak5mWWqRvl0CV8bDG23M
        BTNlKv513mVtYPwv0cXIySEhYCLRe2YxWxcjF4eQwApGie1v7jJDOJ8ZJSY/+8kGUzXnzUlW
        iMQyRokds99BOf8ZJXYtWMkIUsUmYCjR9bYLrENEwEli4ay/7CBFzAJrGSVeX73CDJIQFgiW
        mHH9IFgDi4CqxPHZb9lBbF4BG4n951YwQayTl1i94QAzhH2RVeLRblkI20Wi7elVRghbRuLy
        5G4WkAUSAs2MEg/PrWWHcHoYJS43zYCqspY4fPwiK4jNLMAnMWnbdKCpHEBxXomONiGIEg+J
        /Utfgy0WEoiVaOrvYp/AKL6AkWEVo3hqaXFuemqxcV5quV5xYm5xaV66XnJ+7iZGYKyc/nf8
        6w7GfX+SDjEKcDAq8fAemP4/Rog1say4MvcQowQHs5IIr1E2Q6wQb0piZVVqUX58UWlOavEh
        RmkOFiVx3mqGB9FCAumJJanZqakFqUUwWSYOTqkGxjSN2n9VpxqkEq1nFKjl3lf9PY/ZN3T3
        DfGzqqt8mYRNpKcyJ9YZKmqdObih+lTNp61z5S4f2v1bUfNpkQXvhqOnc42vZ67aqr2cOaVI
        aMGHdyxHw8NYDgUb7WBcoKAVLO+z8d/uNVuEfsrPZ1iqJGBRe9Vgb2Xv+z3hn99pRT274LXy
        3Z+3KUosxRmJhlrMRcWJAMJg3g+RAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDJMWRmVeSWpSXmKPExsVy+t/xy7qfWBhjDaZuFbK4te4cq0XPhq2s
        FjPO72OyWHvkLrvF4TftrBZ392xjdGDz6NuyitHj8ya5AKYoLpuU1JzMstQifbsEroyHN9qY
        C2bKVPzrvMvawPhfoouRk0NCwERizpuTrF2MXBxCAksYJVav38kG4TQyScyZs40FpIpNwFCi
        620XG4gtIuAksXDWX3aQImaBtYwSrw69YgZJCAsES8y4fpARxGYRUJU4PvstO4jNK2Ajsf/c
        CiaIdfISqzccYJ7AyLWAkWEVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGoJ+3Hfu5ZQdj17vg
        Q4wCHIxKPLwHpv+PEWJNLCuuzD3EKMHBrCTCa5TNECvEm5JYWZValB9fVJqTWnyIUZqDRUmc
        t0PgYIyQQHpiSWp2ampBahFMlomDU6qBcfl6w/4VcS3ahs1LDrnu75m8dGK2ud2fmr5K6SNz
        svboP2o3et74+FJf5PyHeZu7DARzr0rdeXlr9hI9/WefT0anPJ4fHrUq/lPc+TklCxjcIktL
        Xq/SNZxw1/AW27Pzz7h+3Tk2Lc45OKxrzh7O+afe1S8plrun/oGBbY2DnL+rXYLBYZW8Y0os
        xRmJhlrMRcWJAEGY9GzvAQAA
X-CMS-MailID: 20190612135810eucas1p250a60b5dd8c43c331c8e051e8cd2c3e6
CMS-TYPE: 201P
X-CMS-RootMailID: 20190612135810eucas1p250a60b5dd8c43c331c8e051e8cd2c3e6
References: <CGME20190612135810eucas1p250a60b5dd8c43c331c8e051e8cd2c3e6@eucas1p2.samsung.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MFC v6 and v7 has no register to read min scratch buffer size, so it has
to be read conditionally only if hardware supports it. This fixes following
NULL pointer exception on SoCs with MFC v6/v7:

8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = f25837f9
[00000000] *pgd=bd93d835
Internal error: Oops: 17 [#1] PREEMPT SMP ARM
Modules linked in: btmrvl_sdio btmrvl bluetooth mwifiex_sdio mwifiex ecdh_generic ecc
CPU: 0 PID: 1430 Comm: v4l2_decode Not tainted 5.2.0-rc4-next-20190612-00006-gf077fba72e95-dirty #6167
Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
PC is at s5p_mfc_get_min_scratch_buf_size+0x30/0x3c
LR is at s5p_mfc_get_min_scratch_buf_size+0x28/0x3c
...
[<c074f998>] (s5p_mfc_get_min_scratch_buf_size) from [<c0745bc0>] (s5p_mfc_irq+0x814/0xa5c)
[<c0745bc0>] (s5p_mfc_irq) from [<c019a218>] (__handle_irq_event_percpu+0x64/0x3f8)
[<c019a218>] (__handle_irq_event_percpu) from [<c019a5d8>] (handle_irq_event_percpu+0x2c/0x7c)
[<c019a5d8>] (handle_irq_event_percpu) from [<c019a660>] (handle_irq_event+0x38/0x5c)
[<c019a660>] (handle_irq_event) from [<c019ebc4>] (handle_fasteoi_irq+0xc4/0x180)
[<c019ebc4>] (handle_fasteoi_irq) from [<c0199270>] (generic_handle_irq+0x24/0x34)
[<c0199270>] (generic_handle_irq) from [<c0199888>] (__handle_domain_irq+0x7c/0xec)
[<c0199888>] (__handle_domain_irq) from [<c04ac298>] (gic_handle_irq+0x58/0x9c)
[<c04ac298>] (gic_handle_irq) from [<c0101ab0>] (__irq_svc+0x70/0xb0)
Exception stack(0xe73ddc60 to 0xe73ddca8)
...
[<c0101ab0>] (__irq_svc) from [<c01967d8>] (console_unlock+0x5a8/0x6a8)
[<c01967d8>] (console_unlock) from [<c01981d0>] (vprintk_emit+0x118/0x2d8)
[<c01981d0>] (vprintk_emit) from [<c01983b0>] (vprintk_default+0x20/0x28)
[<c01983b0>] (vprintk_default) from [<c01989b4>] (printk+0x30/0x54)
[<c01989b4>] (printk) from [<c07500b8>] (s5p_mfc_init_decode_v6+0x1d4/0x284)
[<c07500b8>] (s5p_mfc_init_decode_v6) from [<c07230d0>] (vb2_start_streaming+0x24/0x150)
[<c07230d0>] (vb2_start_streaming) from [<c0724e4c>] (vb2_core_streamon+0x11c/0x15c)
[<c0724e4c>] (vb2_core_streamon) from [<c07478b8>] (vidioc_streamon+0x64/0xa0)
[<c07478b8>] (vidioc_streamon) from [<c0709640>] (__video_do_ioctl+0x28c/0x45c)
[<c0709640>] (__video_do_ioctl) from [<c0709bc8>] (video_usercopy+0x260/0x8a4)
[<c0709bc8>] (video_usercopy) from [<c02b3820>] (do_vfs_ioctl+0xb0/0x9fc)
[<c02b3820>] (do_vfs_ioctl) from [<c02b41a0>] (ksys_ioctl+0x34/0x58)
[<c02b41a0>] (ksys_ioctl) from [<c0101000>] (ret_fast_syscall+0x0/0x28)
Exception stack(0xe73ddfa8 to 0xe73ddff0)
...
---[ end trace 376cf5ba6e0bee93 ]---

Fixes: c8ffbd433a77 ("media: s5p-mfc: Use min scratch buffer size as provided by F/W")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/platform/s5p-mfc/s5p_mfc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
index c5dc1880a4c6..b776f83e395e 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
@@ -523,7 +523,8 @@ static void s5p_mfc_handle_seq_done(struct s5p_mfc_ctx *ctx,
 				dev);
 		ctx->mv_count = s5p_mfc_hw_call(dev->mfc_ops, get_mv_count,
 				dev);
-		ctx->scratch_buf_size = s5p_mfc_hw_call(dev->mfc_ops,
+		if (FW_HAS_E_MIN_SCRATCH_BUF(dev))
+			ctx->scratch_buf_size = s5p_mfc_hw_call(dev->mfc_ops,
 						get_min_scratch_buf_size, dev);
 		if (ctx->img_width == 0 || ctx->img_height == 0)
 			ctx->state = MFCINST_ERROR;
-- 
2.17.1

