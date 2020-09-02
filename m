Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E1925ADF5
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 16:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgIBOxf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 10:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727852AbgIBOx2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 10:53:28 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA185C061245
        for <linux-media@vger.kernel.org>; Wed,  2 Sep 2020 07:53:27 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id x2so5233554ilm.0
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2020 07:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EsQpeI7D1H5k/d2ldZ6dL5UBletkvcQ405Mqk41kvtA=;
        b=OFHTYHEqJUI+FtLrE6PAi2aZwioFNMDfiqJjDZVXi/KHUzL54VOMwMkSZ/Na4d4Ogw
         OflZqUSOYEI/YWnGu7gZBbi63l+atE12YXmZ0ywQPPRb7gqc6b+FVmj0taaL11erEQnH
         0mPWDuTQEQy4kc7PVUtsjcTMS4PkoSyJxV4Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EsQpeI7D1H5k/d2ldZ6dL5UBletkvcQ405Mqk41kvtA=;
        b=pZnYdG/ReQdmfxl0yUCHoOj02vcahWaBzuAhyknrmhbuKmRQnVy4iBzpW2eddBRM36
         Zid+tLWviiKhQaoCdTal0onsesSxYAaPa3FWIr1hTj9KYOjmDfI/lbzvGUCee11Q5u4T
         yEfouZv1/vITzRjzNCMx3vgKGnLKf9nUFfAMRhG4MMlcajzgLxh/IptjCfAT2o3P6LWJ
         NYAbDX4eJZWb/mNonIucKi7VKj3fhK5I8ua3fWFH9urXd4CeM3CrG4t5D7LyXGi3Glcg
         fl+WcL5ufD/Ja60xW6ocd6sb9ScrtXdFyJN6Wi1BUBZifzzdhxNtnEgBjtsy04ZAVUBI
         EmMw==
X-Gm-Message-State: AOAM5300N98+Lfb+6JTaxCFi4h0NQAh47tY3NMJoUkgZItF2TW/j4fAC
        xiUE+nJ9XlbxFTYoARwjuL5Ux1ay3+3MW5W1/BW57Q==
X-Google-Smtp-Source: ABdhPJwfWW+4DdbIXIThrd4HJdbvX+osez09zDgESRDix7dRhl57slXevJAI1SafQdAFByT88optw/yw5bUXiIOhQDE=
X-Received: by 2002:a92:c008:: with SMTP id q8mr4094957ild.106.1599058406623;
 Wed, 02 Sep 2020 07:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200821041414.1560707-1-hsinyi@chromium.org> <f8c5b7e0-66a2-7ec6-041f-82679a863758@arm.com>
In-Reply-To: <f8c5b7e0-66a2-7ec6-041f-82679a863758@arm.com>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Wed, 2 Sep 2020 22:53:00 +0800
Message-ID: <CAJMQK-huFDrEKGcwPO4XkzZ0Dvc5OF22uDothKczu9NoQxsx3g@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-vcodec: set dma max segment size
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Anand K Mistry <amistry@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 2, 2020 at 10:25 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-08-21 05:14, Hsin-Yi Wang wrote:
> > Set dma max segment size for encoder and decoder driver.
> >
> > Fix following warning with CONFIG_DMA_API_DEBUG_SG=y
> >
> > [   75.147825] ------------[ cut here ]------------
> > [   75.147844] mtk-vcodec-enc 19002000.vcodec: DMA-API: mapping sg segment longer than device claims to support [len=983040] [max=65536]
> > [   75.147876] WARNING: CPU: 2 PID: 4069 at kernel/dma/debug.c:1302 debug_dma_map_sg+0x1a8/0x2c4
> > ...
> > [   75.148139] Call trace:
> > [   75.148149]  debug_dma_map_sg+0x1a8/0x2c4
> > [   75.148165]  vb2_dc_get_userptr+0x228/0x364 [videobuf2_dma_contig]
> > [   75.148178]  __buf_prepare+0x3ac/0x8c0 [videobuf2_common]
> > [   75.148188]  vb2_core_qbuf+0xa4/0x58c [videobuf2_common]
> > [   75.148199]  vb2_qbuf+0x88/0xe4 [videobuf2_v4l2]
> > [   75.148211]  v4l2_m2m_qbuf+0x80/0xf8 [v4l2_mem2mem]
> > [   75.148221]  vidioc_venc_qbuf+0x3c/0x70 [mtk_vcodec_enc]
> > [   75.148234]  v4l_qbuf+0x48/0x58
> > [   75.148242]  __video_do_ioctl+0x200/0x37c
> > [   75.148250]  video_usercopy+0x360/0x834
> > [   75.148259]  video_ioctl2+0x38/0x48
> > [   75.148267]  v4l2_ioctl+0x6c/0x80
> > [   75.148276]  do_video_ioctl+0xefc/0x4b70
> > [   75.148284]  v4l2_compat_ioctl32+0x5c/0xcc
> > [   75.148294]  __arm64_compat_sys_ioctl+0xf4/0x240
> > [   75.148304]  el0_svc_common+0xac/0x198
> > [   75.148312]  el0_svc_compat_handler+0x2c/0x40
> > [   75.148321]  el0_svc_compat+0x8/0x18
> > [   75.148328] irq event stamp: 0
> > [   75.148337] hardirqs last  enabled at (0): [<0000000000000000>]           (null)
> > [   75.148347] hardirqs last disabled at (0): [<ffffff90080e65c0>] copy_process+0x380/0x115c
> > [   75.148356] softirqs last  enabled at (0): [<ffffff90080e65d8>] copy_process+0x398/0x115c
> > [   75.148364] softirqs last disabled at (0): [<0000000000000000>]           (null)
> > [   75.148372] ---[ end trace 588bf529451e3531 ]---
> >
> > Reported-by: Anand K Mistry <amistry@chromium.org>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >   drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 8 ++++++++
> >   drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 8 ++++++++
> >   2 files changed, 16 insertions(+)
> >
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > index 97a1b6664c20..3bbd0bac56d6 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > @@ -242,6 +242,14 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
> >               mtk_v4l2_err("[VPU] vpu device in not ready");
> >               return -EPROBE_DEFER;
> >       }
> > +     if (!pdev->dev.dma_parms) {
> > +             pdev->dev.dma_parms = devm_kzalloc(&pdev->dev,
> > +                                             sizeof(*pdev->dev.dma_parms),
> > +                                             GFP_KERNEL);
> > +             if (!pdev->dev.dma_parms)
> > +                     return -ENOMEM;
> > +     }
>
> Since 9495b7e92f71, dma_parms is included in the platform_device itself
> and always set, so you can drop these allocation paths.
>
> > +     dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>
> The segment size is simply a size, not a bitmask, so UINT_MAX would be
> more semantically appropriate.
>
> Robin.
>

Thanks. since this patch is already in media tree:
https://git.linuxtv.org/media_tree.git/commit/?id=13483fc2f20f0e2db7ba9c39b095ac7ea46f8de8,
I'll send a patch to modify this.
