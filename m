Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBF86EA895
	for <lists+linux-media@lfdr.de>; Fri, 21 Apr 2023 12:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbjDUKsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Apr 2023 06:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjDUKsR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Apr 2023 06:48:17 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A2993CF
        for <linux-media@vger.kernel.org>; Fri, 21 Apr 2023 03:48:14 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230421104811euoutp012a9e2b281227ee212220a99be4abd189~X7XmB5ZFo1619616196euoutp01J
        for <linux-media@vger.kernel.org>; Fri, 21 Apr 2023 10:48:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230421104811euoutp012a9e2b281227ee212220a99be4abd189~X7XmB5ZFo1619616196euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1682074092;
        bh=3IVe5wvWCmXLbIud3fw5nK6JC+GZnbaEh4zDHD92gPA=;
        h=From:To:Cc:Subject:Date:References:From;
        b=HdYdeXp9j5Rnufk+G5MuvxdvpmgjNaWANKt2YTCJNdrCAq+xrsQzl9wWxmemJJGH+
         su43wb/cgAfeAh20yqMayF/41V4ShnPINr1unIsP1JuYSnBQxLfC6qWDAxS+UvXPx7
         VLp2dbXzIe3sn4dBSVu/TXXZ9HlCtxqU710XZVT8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20230421104811eucas1p13e1c7ecc5c891481c6aea637fe7460c3~X7Xlw7pwx1801918019eucas1p13;
        Fri, 21 Apr 2023 10:48:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 16.0B.10014.BE962446; Fri, 21
        Apr 2023 11:48:11 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20230421104811eucas1p16ad5e11ebc4d305c6fab372d3743b6e1~X7XlceEIL2353023530eucas1p1K;
        Fri, 21 Apr 2023 10:48:11 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20230421104811eusmtrp2e8a8cc0f3512d7f27a3fc68d35ca40ad~X7XlZwxeF2894528945eusmtrp2d;
        Fri, 21 Apr 2023 10:48:11 +0000 (GMT)
X-AuditID: cbfec7f5-b8bff7000000271e-db-644269ebeb7d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id FD.E8.34412.BE962446; Fri, 21
        Apr 2023 11:48:11 +0100 (BST)
Received: from AMDC4653.eu.corp.samsungelectronics.net (unknown
        [106.120.51.32]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20230421104810eusmtip243b20c2a7d17fdb0d71817bccc3afcab~X7Xk5-UHC2978729787eusmtip2Y;
        Fri, 21 Apr 2023 10:48:10 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: verisilicon: Final fix for the crash when opening
 the driver
Date:   Fri, 21 Apr 2023 12:47:59 +0200
Message-Id: <20230421104759.2236463-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsWy7djPc7qvM51SDNZuULXYcmU2s8XGF59Z
        LC7OvMti0bNhK6vFpwf/mS3WHrnLbrFs0x8mi7v3TrA4cHjsuLuE0WPTqk42j81L6j36/xp4
        9G1ZxejRdeQ6m8fnTXIep75+Zg/giOKySUnNySxLLdK3S+DK2HPhA3PBNtmK9s4e5gbGVsku
        Rk4OCQETiXOzD7F3MXJxCAmsYJTo6u9ig3C+MErcWzMTKvOZUWLR0n4WmJZZC78yQSSWM0rs
        WfmMBcJpZZL4cPQnG0gVm4ChRNfbLjBbRMBZ4uy+dcwgRcwCs5gk9s29xgySEBYIk+jpX8wI
        YrMIqEpsWHQObAWvgL3E97+3oNbJS+w/eJYZIi4ocXLmE7A4M1C8eetssKESAgc4JLYueAjV
        4CJx8OF/KFtY4tXxLewQtozE/53zmSAa2hklFvy+D+VMYJRoeH6LEaLKWuLOuV9Ad3MArdCU
        WL9LHyLsKDH/zSOwsIQAn8SNt4IQR/BJTNo2nRkizCvR0SYEUa0mMev4Ori1By9cYoawPSRO
        nFjMCmILCcRKzN58nHkCo8IsJK/NQvLaLIQbFjAyr2IUTy0tzk1PLTbOSy3XK07MLS7NS9dL
        zs/dxAhMSqf/Hf+6g3HFq496hxiZOBgPMUpwMCuJ8L43cEoR4k1JrKxKLcqPLyrNSS0+xCjN
        waIkzqttezJZSCA9sSQ1OzW1ILUIJsvEwSnVwCSr2v/YZ+MKL4XIEnaBn+E7wpz/J21U2aPv
        sr9kBu/Fb0nPqrv67yQUHxSebcn9PfFyhEqtpYtfyc3D9QtsVCODjDt+1UtGbrzFkRmduf34
        /9cSvIG56UrGjFuXnvv+r6BTbE7Hh0//fm9V/fmzsnwRo+CUKV26z69/6Ip/KJd3/NPO5Vxz
        DYufOR1tEb72YP//5Qwt2s+ZXjtm+rU94/HYvC7+OpvGjgk3ZFmPn/584mR0VO7LJR2Xpmaz
        OnYs2t1ZpBW85uy1K78XLG13XX75eHOryQfnWfKtb1wtnwRHHuyR626oeXXD8nhgaMxSabGA
        6L8G65d+Mvgkc4TRxfqYmv7pE1/+PT69sPzBhQ4lluKMREMt5qLiRAAThcU2uQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNLMWRmVeSWpSXmKPExsVy+t/xe7qvM51SDNY/57HYcmU2s8XGF59Z
        LC7OvMti0bNhK6vFpwf/mS3WHrnLbrFs0x8mi7v3TrA4cHjsuLuE0WPTqk42j81L6j36/xp4
        9G1ZxejRdeQ6m8fnTXIep75+Zg/giNKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1
        MjJV0rezSUnNySxLLdK3S9DL2HPhA3PBNtmK9s4e5gbGVskuRk4OCQETiVkLvzJ1MXJxCAks
        ZZT4P3cBI0RCRuLktAZWCFtY4s+1LjaIomYmie67u9hBEmwChhJdb0ESnBwiAq4SvV0nmEGK
        mAXmMEncXX0HLCEsECLx6uFSsKksAqoSGxadYwGxeQXsJb7/vcUCsUFeYv/Bs8wQcUGJkzOf
        gMWZgeLNW2czT2Dkm4UkNQtJagEj0ypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzAWNh27OeW
        HYwrX33UO8TIxMF4iFGCg1lJhPe9gVOKEG9KYmVValF+fFFpTmrxIUZToPsmMkuJJucDozGv
        JN7QzMDU0MTM0sDU0sxYSZzXs6AjUUggPbEkNTs1tSC1CKaPiYNTqoGp1e/eCpdS0db5c47+
        WSaf5PDl+S/PXXUfGk+VT5xzmXFt8NfLc9tt+GeJmU9gYNs8JyDh9JaJOtOCopo3PFfkrH6y
        ek+IdtW9lnKfzXv/i1gLi+swX9UKOqvfffBO2ZmHqz4If7TMkgqf8/+zY7cX++2vLzZkv1og
        +N+NfZv0If3FTbmN65LnFjzkTSrK9m9LcFH5eXTVNv/Vh7WyZ76fKD/zw64VHvdnxU/YbtAs
        fG3FE9l4w0WfZrr62mTPWWznL/l5iv+fGyyqcqdr2pKUbHP29++7VuGh++7VCf99m7hzyh4/
        9H5UIfDq0AwZ7W9PNkqsvFTw+me1csaVQ6d3GrxsPPtZ6YRM0LvsaatU3iixFGckGmoxFxUn
        AgDJBE3HDgMAAA==
X-CMS-MailID: 20230421104811eucas1p16ad5e11ebc4d305c6fab372d3743b6e1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230421104811eucas1p16ad5e11ebc4d305c6fab372d3743b6e1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230421104811eucas1p16ad5e11ebc4d305c6fab372d3743b6e1
References: <CGME20230421104811eucas1p16ad5e11ebc4d305c6fab372d3743b6e1@eucas1p1.samsung.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ctx->vpu_src_fmt is no more initialized before calling hantro_try_fmt()
so checking it led to crash the kernel. Simply use the provided 'fmt' as
a format for those checks.

This fixes the following issue observed on Odroid-M1 board:

 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
 Mem abort info:
 ...
 Modules linked in: crct10dif_ce hantro_vpu snd_soc_simple_card snd_soc_simple_card_utils v4l2_vp9 v4l2_h264 rockchip_saradc v4l2_mem2mem videobuf2_dma_contig videobuf2_memops rtc_rk808 videobuf2_v4l2 industrialio_triggered_buffer rockchip_thermal dwmac_rk stmmac_platform stmmac videodev kfifo_buf display_connector videobuf2_common pcs_xpcs mc rockchipdrm analogix_dp dw_mipi_dsi dw_hdmi drm_display_helper panfrost drm_shmem_helper gpu_sched ip_tables x_tables ipv6
 CPU: 3 PID: 176 Comm: v4l_id Not tainted 6.3.0-rc7-next-20230420 #13481
 Hardware name: Hardkernel ODROID-M1 (DT)
 pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 pc : hantro_try_fmt+0xa0/0x278 [hantro_vpu]
 lr : hantro_try_fmt+0x94/0x278 [hantro_vpu]
 ...
 Call trace:
  hantro_try_fmt+0xa0/0x278 [hantro_vpu]
  hantro_set_fmt_out+0x3c/0x298 [hantro_vpu]
  hantro_reset_raw_fmt+0x98/0x128 [hantro_vpu]
  hantro_set_fmt_cap+0x240/0x254 [hantro_vpu]
  hantro_reset_encoded_fmt+0x94/0xcc [hantro_vpu]
  hantro_reset_fmts+0x18/0x38 [hantro_vpu]
  hantro_open+0xd4/0x20c [hantro_vpu]
  v4l2_open+0x80/0x120 [videodev]
  chrdev_open+0xc0/0x22c
  do_dentry_open+0x13c/0x48c
  vfs_open+0x2c/0x38
  path_openat+0x550/0x934
  do_filp_open+0x80/0x12c
  do_sys_openat2+0xb4/0x168
  __arm64_sys_openat+0x64/0xac
  invoke_syscall+0x48/0x114
  el0_svc_common+0x100/0x120
  do_el0_svc+0x3c/0xa8
  el0_svc+0x40/0xa8
  el0t_64_sync_handler+0xb8/0xbc
  el0t_64_sync+0x190/0x194
 Code: 97fc8a7f f940aa80 52864a61 72a686c1 (b9400800) 
 ---[ end trace 0000000000000000 ]---

Fixes: db6f68b51e5c ("media: verisilicon: Do not set context src/dst formats in reset functions")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
It looks that I've missed the fact that the first fix merged as commit
f100ce3bbd6a ("media: verisilicon: Fix crash when probing encoder") did
not fix all the issues introduced by db6f68b51e5c ("media: verisilicon:
Do not set context src/dst formats in reset functions"). I'm really sorry
for that.
---
 drivers/media/platform/verisilicon/hantro_v4l2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 835518534e3b..618ea23a7d49 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -313,17 +313,17 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 		/* Fill remaining fields */
 		v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, pix_mp->width,
 				    pix_mp->height);
-		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE &&
+		if (fmt->fourcc == V4L2_PIX_FMT_H264_SLICE &&
 		    !hantro_needs_postproc(ctx, fmt))
 			pix_mp->plane_fmt[0].sizeimage +=
 				hantro_h264_mv_size(pix_mp->width,
 						    pix_mp->height);
-		else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_VP9_FRAME &&
+		else if (fmt->fourcc == V4L2_PIX_FMT_VP9_FRAME &&
 			 !hantro_needs_postproc(ctx, fmt))
 			pix_mp->plane_fmt[0].sizeimage +=
 				hantro_vp9_mv_size(pix_mp->width,
 						   pix_mp->height);
-		else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE &&
+		else if (fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE &&
 			 !hantro_needs_postproc(ctx, fmt))
 			pix_mp->plane_fmt[0].sizeimage +=
 				hantro_hevc_mv_size(pix_mp->width,
-- 
2.34.1

