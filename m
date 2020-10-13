Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05F3A28C685
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 02:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbgJMA5p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 20:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727950AbgJMA5o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 20:57:44 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764B5C0613D1
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2020 17:57:42 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id c25so3828779ooe.13
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2020 17:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IpSz3HxdqBPCuQgrwDIdFKu49ndcXOrnJ/LSogHFcdo=;
        b=YaZxFjgx8OxLAvGkEa/K8lOYgoWppNLXoHMQLq/M/T8xc0lOztQHwL6GZPWSJ7p4DZ
         T1qV5HWZabpqYPjHqCrSTAbj34tLChVDVjzdWlWTSPgwxfcWusNj1+Kdn3SdsR2UOXx5
         BFhADJ9a2Wv/8twux/lP3MHmwDSZjQSPJB5Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IpSz3HxdqBPCuQgrwDIdFKu49ndcXOrnJ/LSogHFcdo=;
        b=f9MBDGz8yo8/3id0sX/XirFih0sDX/i0MNMNYlnIV3PuBznvymJeN04XAbkY4pFmO7
         gk1Hj10N9n94kLEWxuXpNbZRgf1jEos69J7heHqA8jOsIxQ8zJC8BACk91CUKn3JQmQs
         LTc6ybyUvyTlNBAqj03WvatfbAIAVmWSts4X9T0/aviDj00CHy3sZwRF9Acsf+So9C5k
         daGNMk6OxEKFsBtwDr8s4DRwKK95C3/mC9Mk/Dw/OOXSwEBp6/tddNYFevmC9O34NF+T
         l+ygySp3pT0sQp6w2ZM89Aqy9lXdfTitXi0Q9vYgeQWPUt39iJZbd+Tif+ySbv1G7Lfh
         h0vw==
X-Gm-Message-State: AOAM532N45af9IXiolU/W/5bJU0U6ttkWeYnHAsJRP3tTjj0mUaT6SRJ
        XYyhXnAfDFfykBMc6j9ubruTL1LC2sVZ6/U3
X-Google-Smtp-Source: ABdhPJyjeg4PkwJ4/4tXYhxfOM+Ls4olA+jx8kQFkl4HyqPs555IUav+4t/k6/HhZ4gugY0O/sOrnA==
X-Received: by 2002:a4a:978a:: with SMTP id w10mr20439294ooi.69.1602550661361;
        Mon, 12 Oct 2020 17:57:41 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com. [209.85.210.44])
        by smtp.gmail.com with ESMTPSA id k128sm10434967oib.52.2020.10.12.17.57.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2020 17:57:40 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id e20so17093004otj.11
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2020 17:57:40 -0700 (PDT)
X-Received: by 2002:a9d:242:: with SMTP id 60mr8187117otb.141.1602550659528;
 Mon, 12 Oct 2020 17:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201012053557.4102148-1-acourbot@chromium.org>
 <20201012053557.4102148-3-acourbot@chromium.org> <b9afc70f-9787-6513-29e7-41ffd6972da0@infradead.org>
In-Reply-To: <b9afc70f-9787-6513-29e7-41ffd6972da0@infradead.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Tue, 13 Oct 2020 09:57:25 +0900
X-Gmail-Original-Message-ID: <CAPBb6MW8KvoxO8KNXM5azgijMT9aSis8ZZ=mumA0_JyQTbKyVQ@mail.gmail.com>
Message-ID: <CAPBb6MW8KvoxO8KNXM5azgijMT9aSis8ZZ=mumA0_JyQTbKyVQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: mtk-vcodec: fix build breakage when one of
 VPU or SCP is enabled
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Alexandre Courbot <gnurou@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 13, 2020 at 12:00 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 10/11/20 10:35 PM, Alexandre Courbot wrote:
> > The addition of MT8183 support added a dependency on the SCP remoteproc
> > module. However the initial patch used the "select" Kconfig directive,
> > which may result in the SCP module to not be compiled if remoteproc was
> > disabled. In such a case, mtk-vcodec would try to link against
> > non-existent SCP symbols. "select" was clearly misused here as explained
> > in kconfig-language.txt.
> >
> > Replace this by a "depends" directive on at least one of the VPU and
> > SCP modules, to allow the driver to be compiled as long as one of these
> > is enabled, and adapt the code to support this new scenario.
> >
> > Also adapt the Kconfig text to explain the extra requirements for MT8173
> > and MT8183.
> >
> > Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
>
> That Ack applied to v2. I have not tested nor acked this version of the patch.

Sorry about that - I was careless and left it in the log.

>
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/platform/Kconfig                | 22 +++++++++++++++----
> >  drivers/media/platform/mtk-vcodec/Makefile    | 10 +++++++--
> >  .../platform/mtk-vcodec/mtk_vcodec_fw_priv.h  | 18 +++++++++++++++
> >  3 files changed, 44 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > index a3cb104956d5..457b6c39ddc0 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -253,18 +253,32 @@ config VIDEO_MEDIATEK_VCODEC
> >       depends on MTK_IOMMU || COMPILE_TEST
> >       depends on VIDEO_DEV && VIDEO_V4L2
> >       depends on ARCH_MEDIATEK || COMPILE_TEST
> > +     depends on VIDEO_MEDIATEK_VPU || MTK_SCP
> > +     # The two following lines ensure we have the same state ("m" or "y") as
> > +     # our dependencies, to avoid missing symbols during link.
> > +     depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
> > +     depends on MTK_SCP || !MTK_SCP
> >       select VIDEOBUF2_DMA_CONTIG
> >       select V4L2_MEM2MEM_DEV
> > -     select VIDEO_MEDIATEK_VPU
> > -     select MTK_SCP
> > +     select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
> > +     select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
> >       help
> >           Mediatek video codec driver provides HW capability to
> > -         encode and decode in a range of video formats
> > -         This driver rely on VPU driver to communicate with VPU.
> > +         encode and decode in a range of video formats on MT8173
> > +         and MT8183.
> > +
> > +         Note that support for MT8173 requires VIDEO_MEDIATEK_VPU to
> > +         also be selected. Support for MT8183 depends on MTK_SCP.
> >
> >           To compile this driver as modules, choose M here: the
> >           modules will be called mtk-vcodec-dec and mtk-vcodec-enc.
> >
> > +config VIDEO_MEDIATEK_VCODEC_VPU
> > +     bool
> > +
> > +config VIDEO_MEDIATEK_VCODEC_SCP
> > +     bool
> > +
> >  config VIDEO_MEM2MEM_DEINTERLACE
> >       tristate "Deinterlace support"
> >       depends on VIDEO_DEV && VIDEO_V4L2
> > diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
> > index 6e1ea3a9f052..4618d43dbbc8 100644
> > --- a/drivers/media/platform/mtk-vcodec/Makefile
> > +++ b/drivers/media/platform/mtk-vcodec/Makefile
> > @@ -25,5 +25,11 @@ mtk-vcodec-enc-y := venc/venc_vp8_if.o \
> >  mtk-vcodec-common-y := mtk_vcodec_intr.o \
> >               mtk_vcodec_util.o \
> >               mtk_vcodec_fw.o \
> > -             mtk_vcodec_fw_vpu.o \
> > -             mtk_vcodec_fw_scp.o
> > +
> > +ifneq ($(CONFIG_VIDEO_MEDIATEK_VCODEC_VPU),)
> > +mtk-vcodec-common-y += mtk_vcodec_fw_vpu.o
> > +endif
> > +
> > +ifneq ($(CONFIG_VIDEO_MEDIATEK_VCODEC_SCP),)
> > +mtk-vcodec-common-y += mtk_vcodec_fw_scp.o
> > +endif
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
> > index 51f1694a7c7d..b41e66185cec 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
> > @@ -27,8 +27,26 @@ struct mtk_vcodec_fw_ops {
> >       void (*release)(struct mtk_vcodec_fw *fw);
> >  };
> >
> > +#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VCODEC_VPU)
> >  struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
> >                                            enum mtk_vcodec_fw_use fw_use);
> > +#else
> > +static inline struct mtk_vcodec_fw *
> > +mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
> > +                    enum mtk_vcodec_fw_use fw_use)
> > +{
> > +     return ERR_PTR(-ENODEV);
> > +}
> > +#endif /* CONFIG_VIDEO_MEDIATEK_VCODEC_VPU */
> > +
> > +#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VCODEC_SCP)
> >  struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev);
> > +#else
> > +static inline struct mtk_vcodec_fw *
> > +mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev)
> > +{
> > +     return ERR_PTR(-ENODEV);
> > +}
> > +#endif /* CONFIG_VIDEO_MEDIATEK_VCODEC_SCP */
> >
> >  #endif /* _MTK_VCODEC_FW_PRIV_H_ */
> >
>
>
> --
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
