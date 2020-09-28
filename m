Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B41727A9EF
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 10:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgI1ItA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 04:49:00 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:33075 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgI1Is7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 04:48:59 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200928084858euoutp021c4dc58cc6032304c1be1052302a6f75~45lki9Ww52997429974euoutp02K
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 08:48:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200928084858euoutp021c4dc58cc6032304c1be1052302a6f75~45lki9Ww52997429974euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1601282938;
        bh=YRDSKB9wDuLWRKjV7YG+zfWoNzmnhAjAmexIfvSjhuI=;
        h=From:To:Cc:Subject:Date:References:From;
        b=LBCOJ1P3EXWiWP+3CSgxOGZGUXFwYWw2O3kybcyDHePUzHgqdGW2zNcik0/HMQLq6
         eGW7tx6+TnvljPrFeSJMytIf0puqCLxar4cOFMdTlEj5u1/aRvTmTBn6sda3U94pLM
         z0/e49ise5q/HBm/hlm8pnIn37fIFoLCUM2NRT/w=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200928084857eucas1p1532c4a985f29dc0de642bafde6f2e8b4~45lkLc42P1101911019eucas1p1O;
        Mon, 28 Sep 2020 08:48:57 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id D6.ED.06456.973A17F5; Mon, 28
        Sep 2020 09:48:57 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200928084857eucas1p1842cc46c1015a9857b4a84cb9bf2f62c~45lj1E00w1946119461eucas1p1N;
        Mon, 28 Sep 2020 08:48:57 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200928084857eusmtrp2e636e8153562020cdfb1440ff84483ee~45lj0WeIL2438124381eusmtrp2W;
        Mon, 28 Sep 2020 08:48:57 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-47-5f71a379ee2f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 7D.93.06314.873A17F5; Mon, 28
        Sep 2020 09:48:56 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200928084855eusmtip2d7af72ba76e4705b4c4240256f335e66~45limS95k1034510345eusmtip2D;
        Mon, 28 Sep 2020 08:48:55 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH] media: platform: s5p-mfc: Fix adding a standard frame skip
 mode control
Date:   Mon, 28 Sep 2020 10:48:44 +0200
Message-Id: <20200928084844.23526-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBIsWRmVeSWpSXmKPExsWy7djPc7qViwvjDXa/V7W4OPMui0XPhq2s
        FjPO72OyWHvkLrvFsk1/mCzan75ktmhpO8Jk8bn1H5sDh8fshossHptWdbJ53Lm2h82jb8sq
        Ro/Pm+Q8Tn39zB7AFsVlk5Kak1mWWqRvl8CVcWzFPKaCvxwVrx6cZ2lgfMjexcjJISFgIrHj
        aBMTiC0ksIJRYnJbRhcjF5D9hVHiw72PTBDOZ0aJq9OussF0fFn4lwUisZxR4sSsXja4llVN
        G8HmsgkYSnS97QLrEBFwklg46y87SBGzQCeTxIy194EcDg5hgSiJLa9qQUwWAVWJD3cqQMp5
        BWwl1nVMhTpPXmL1hgPMIK0SAs/ZJK582coKkXCRaP40mwnCFpZ4dXwLVIOMxP+d85kgGpoZ
        JR6eW8sO4fQwSlxumsEIUWUtcefcLzaQzcwCmhLrd+lDhB0l7p6/wQISlhDgk7jxVhAkzAxk
        Tto2nRkizCvR0SYEUa0mMev4Ori1By9cYoawPSSW7JzMAgnSWInDm2+wT2CUm4WwawEj4ypG
        8dTS4tz01GLDvNRyveLE3OLSvHS95PzcTYzA9HD63/FPOxi/Xko6xCjAwajEwxuxsyBeiDWx
        rLgy9xCjBAezkgiv09nTcUK8KYmVValF+fFFpTmpxYcYpTlYlMR5jRe9jBUSSE8sSc1OTS1I
        LYLJMnFwSjUwzjqVJsy7hpnRbblzpQ97+suILjeOtSczpaSyvufEhcu9r1iy0fhr7xrfkGP3
        fwhZ1u1SlZ+5aV/jVPsTLftSr5RvWsPNnhjSyyx5Qu9Op8l7M5YVvzM4ODrW6RgevRl9hS2E
        OyN1T/SlTK7CDa/ebZ4xSz1yZ8fjLdvM9j6bfbXzl956sc9MSizFGYmGWsxFxYkAGDRnrQsD
        AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsVy+t/xe7oViwvjDTrOy1hcnHmXxaJnw1ZW
        ixnn9zFZrD1yl91i2aY/TBbtT18yW7S0HWGy+Nz6j82Bw2N2w0UWj02rOtk87lzbw+bRt2UV
        o8fnTXIep75+Zg9gi9KzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnN
        ySxLLdK3S9DLOLZiHlPBX46KVw/OszQwPmTvYuTkkBAwkfiy8C9LFyMXh5DAUkaJvg9dTBAJ
        GYmT0xpYIWxhiT/Xutggij4xShxrvMMGkmATMJToetsFZosIuEjs3/OUGaSIWaCXSeLPw1+M
        IAlhgQiJc22ngYo4OFgEVCU+3KkACfMK2Eqs65gKdYW8xOoNB5gnMPIsYGRYxSiSWlqcm55b
        bKhXnJhbXJqXrpecn7uJERiY24793LyD8dLG4EOMAhyMSjy8ETsL4oVYE8uKK3MPMUpwMCuJ
        8DqdPR0nxJuSWFmVWpQfX1Sak1p8iNEUaPdEZinR5Hxg1OSVxBuaGppbWBqaG5sbm1koifN2
        CByMERJITyxJzU5NLUgtgulj4uCUamBU+3Kb2+LHTqYZpZ4vFygZMX6tEHuzXdbUpUYybn+w
        wdXNNl1fGl6eXJCa5cy7N2eCwVSnXUyRrXU32prOaYRcis/eLjAhcGKgqKCB3pLJC15NnBRa
        HyN+3EPK/sh508XF+95ZzNk9ydDM5ne2bIS1u+wds+7nL/WMNTXXzmte39lx8eTOpItKLMUZ
        iYZazEXFiQC2NeIJYgIAAA==
X-CMS-MailID: 20200928084857eucas1p1842cc46c1015a9857b4a84cb9bf2f62c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200928084857eucas1p1842cc46c1015a9857b4a84cb9bf2f62c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200928084857eucas1p1842cc46c1015a9857b4a84cb9bf2f62c
References: <CGME20200928084857eucas1p1842cc46c1015a9857b4a84cb9bf2f62c@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add proper control type to the recently introduced
V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE control. This will forward it to
v4l2_ctrl_new_std_menu() not v4l2_ctrl_new_std(), what causes the
failure. This fixes the following warning during driver initialization:

s5p_mfc_enc_ctrls_setup:2671: Adding control (18) failed
s5p_mfc_open:811: Failed to setup mfc controls

Fixes: ef56b3ee4f54 ("media: s5p-mfc: Use standard frame skip mode control")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/platform/s5p-mfc/s5p_mfc_enc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
index 3092eb6777a5..acc2217dd7e9 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
@@ -263,6 +263,7 @@ static struct mfc_control controls[] = {
 	},
 	{
 		.id = V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE,
+		.type = V4L2_CTRL_TYPE_MENU,
 		.maximum = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
 		.default_value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
 	},
-- 
2.17.1

