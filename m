Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3409C4D1D26
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 17:28:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347997AbiCHQ3k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 11:29:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345048AbiCHQ3j (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 11:29:39 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 745C54FC7C
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 08:28:40 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id b67so4404710qkc.6
        for <linux-media@vger.kernel.org>; Tue, 08 Mar 2022 08:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ISS94sEEaUrc64zCBPxObVsAFIwOWXKHNDTP4lGs55Y=;
        b=xuWiQVHQKHcPP+OoCuXj8J+2v1kdKCX5iN8vkWFob4sH27vFtEeKiuO1ujTp2/qXmH
         8vV2Vsb/gmnFiNh0ITQ+hvivS1s6gl81bZFFAxXLolDDdDcN96JhRQTYE3Xi6U/QB7QS
         iJ4NZwEUCoIikgUGhB+xtZz0bheWVCH4hH7iuAS9balheNETtoLnF1q/34tnoA/jGMsY
         Ge5Gj0FVCPUsrvTcVzrVZLnp65BvR12zU+MiSFWY3x/KmE6k7yiNkUQkkmC/wdbLH5se
         EqtRXcv/z6+vYVtWh+Smp5DnaVf/wc/0U5buxJ5gye7ULqHAS/JLfUBoYU+H7kBNKRfW
         kaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ISS94sEEaUrc64zCBPxObVsAFIwOWXKHNDTP4lGs55Y=;
        b=GBHItDcUeSfWEDt+a/f4CHOPS4usloTDBkmFXAEgjnl6AoFSRjKXwV6ICWlCkyqPp2
         nZH96YEkxI+Z0HjRsIexAqddN5M1kgzq7SAzgNgU4HET8fFEXtZq6R/hQ0jPSOB/nQy8
         Ke8UiE67gBvX6MBgi98iam95AjEQa6UP21PnajOOvEFOT8DDQm2j9ofVK4RycVWGmmmQ
         2RjGpG35qAfegP4XvlOm+M73FEgIg/r2fpOfe4czUODNl4UxBOp4GmFfr9QE0ErJ1syt
         9ZqcfB74hmac5U9pCRdMmvY9AtNWCnYVrNyyLF3ZkruS2Q9VCGEdk1LYhwjZ85TuHwMi
         /x9A==
X-Gm-Message-State: AOAM532eScrhPCf/DpXI64LB80Sovc2UpEUmRc36oepHPj2p8cqIG7a8
        yo7yPMSAhfV9QVjaW1N23AIkuQ==
X-Google-Smtp-Source: ABdhPJzBVTxL9SSVUktZH/uiPoGEBwpW2Vp74LcTUyLZK0T/+NagHXm7/kCXX+jnbdSMlRmxyz4L5g==
X-Received: by 2002:a37:a93:0:b0:507:dc6f:b9d2 with SMTP id 141-20020a370a93000000b00507dc6fb9d2mr11010308qkk.598.1646756919517;
        Tue, 08 Mar 2022 08:28:39 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id n1-20020a05622a11c100b002dff3364c6esm11113615qtk.19.2022.03.08.08.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 08:28:39 -0800 (PST)
Message-ID: <532339346dce8a3ebffe728510cd163e71d8d0d0.camel@ndufresne.ca>
Subject: Re: [PATCH 1/3] media: v4l: Add packed YUV 4:4:4 YUVA and YUVX
 pixel formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date:   Tue, 08 Mar 2022 11:28:38 -0500
In-Reply-To: <Yicf16ffXXDOW27N@pendragon.ideasonboard.com>
References: <20220307180342.10666-1-laurent.pinchart@ideasonboard.com>
         <20220307180342.10666-2-laurent.pinchart@ideasonboard.com>
         <20220308083722.qapoft64p3ghgibx@uno.localdomain>
         <Yicf16ffXXDOW27N@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 08 mars 2022 à 11:20 +0200, Laurent Pinchart a écrit :
> On Tue, Mar 08, 2022 at 09:37:22AM +0100, Jacopo Mondi wrote:
> > Hi Laurent
> > 
> > On Mon, Mar 07, 2022 at 08:03:40PM +0200, Laurent Pinchart wrote:
> > > The new YUVA and YUVX are permutations of the existing AYUV and XYUV
> > > formats. They are use by the NXP i.MX8 ISI hardware.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > All three patches looks good
> > Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
> > 
> > Slighlty unrelated: aren't the following format definitions identical ?
> > Is this intentional ?
> 
> They are identical indeed. I think it's a historical mistake, AYUV32 has
> likely been added without realizing YUV32 was already providing the same
> format.
> 
> V4L2_PIX_FMT_YUV32 is used by ivtv, exynos-gsc, vivid and the staging
> IMX drivers. I think it would make sense to deprecate it so that new
> drivers will exaplicitly pick either the A or the X variant.

I think we deprecated a similar format with RGB32, as it was ambiguously with
alpha or padding, which can cause issues.

> 
> Hans, any opinion on this ?
> 
> >     * .. _V4L2-PIX-FMT-YUV32:
> > 
> >       - ``V4L2_PIX_FMT_YUV32``
> >       - 'YUV4'
> > 
> >       - A\ :sub:`7-0`
> >       - Y'\ :sub:`7-0`
> >       - Cb\ :sub:`7-0`
> >       - Cr\ :sub:`7-0`
> > 
> >     * .. _V4L2-PIX-FMT-AYUV32:
> > 
> >       - ``V4L2_PIX_FMT_AYUV32``
> >       - 'AYUV'
> > 
> >       - A\ :sub:`7-0`
> >       - Y'\ :sub:`7-0`
> >       - Cb\ :sub:`7-0`
> >       - Cr\ :sub:`7-0`
> > 
> > > ---
> > >  .../media/v4l/pixfmt-packed-yuv.rst           | 20 +++++++++++++++++++
> > >  drivers/media/v4l2-core/v4l2-ioctl.c          |  2 ++
> > >  include/uapi/linux/videodev2.h                |  2 ++
> > >  3 files changed, 24 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> > > index 62bc2bb3f499..92394786251a 100644
> > > --- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> > > +++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> > > @@ -229,6 +229,26 @@ the second byte and Y'\ :sub:`7-0` in the third byte.
> > >        - Y'\ :sub:`7-0`
> > >        - X\ :sub:`7-0`
> > > 
> > > +    * .. _V4L2-PIX-FMT-YUVA32:
> > > +
> > > +      - ``V4L2_PIX_FMT_YUVA32``
> > > +      - 'YUVA'
> > > +
> > > +      - Y'\ :sub:`7-0`
> > > +      - Cb\ :sub:`7-0`
> > > +      - Cr\ :sub:`7-0`
> > > +      - A\ :sub:`7-0`
> > > +
> > > +    * .. _V4L2-PIX-FMT-YUVX32:
> > > +
> > > +      - ``V4L2_PIX_FMT_YUVX32``
> > > +      - 'YUVX'
> > > +
> > > +      - Y'\ :sub:`7-0`
> > > +      - Cb\ :sub:`7-0`
> > > +      - Cr\ :sub:`7-0`
> > > +      - X\ :sub:`7-0`
> > > +
> > >      * .. _V4L2-PIX-FMT-YUV24:
> > > 
> > >        - ``V4L2_PIX_FMT_YUV24``
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > index aeecaca3edba..ca3c7bd19d7e 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -1290,6 +1290,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> > >  	case V4L2_PIX_FMT_XYUV32:	descr = "32-bit XYUV 8-8-8-8"; break;
> > >  	case V4L2_PIX_FMT_VUYA32:	descr = "32-bit VUYA 8-8-8-8"; break;
> > >  	case V4L2_PIX_FMT_VUYX32:	descr = "32-bit VUYX 8-8-8-8"; break;
> > > +	case V4L2_PIX_FMT_YUVA32:	descr = "32-bit YUVA 8-8-8-8"; break;
> > > +	case V4L2_PIX_FMT_YUVX32:	descr = "32-bit YUVX 8-8-8-8"; break;
> > >  	case V4L2_PIX_FMT_YUV410:	descr = "Planar YUV 4:1:0"; break;
> > >  	case V4L2_PIX_FMT_YUV420:	descr = "Planar YUV 4:2:0"; break;
> > >  	case V4L2_PIX_FMT_HI240:	descr = "8-bit Dithered RGB (BTTV)"; break;
> > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > > index df8b9c486ba1..16dcd9dd1a50 100644
> > > --- a/include/uapi/linux/videodev2.h
> > > +++ b/include/uapi/linux/videodev2.h
> > > @@ -592,6 +592,8 @@ struct v4l2_pix_format {
> > >  #define V4L2_PIX_FMT_XYUV32  v4l2_fourcc('X', 'Y', 'U', 'V') /* 32  XYUV-8-8-8-8  */
> > >  #define V4L2_PIX_FMT_VUYA32  v4l2_fourcc('V', 'U', 'Y', 'A') /* 32  VUYA-8-8-8-8  */
> > >  #define V4L2_PIX_FMT_VUYX32  v4l2_fourcc('V', 'U', 'Y', 'X') /* 32  VUYX-8-8-8-8  */
> > > +#define V4L2_PIX_FMT_YUVA32  v4l2_fourcc('Y', 'U', 'V', 'A') /* 32  YUVA-8-8-8-8  */
> > > +#define V4L2_PIX_FMT_YUVX32  v4l2_fourcc('Y', 'U', 'V', 'X') /* 32  YUVX-8-8-8-8  */
> > >  #define V4L2_PIX_FMT_M420    v4l2_fourcc('M', '4', '2', '0') /* 12  YUV 4:2:0 2 lines y, 1 line uv interleaved */
> > > 
> > >  /* two planes -- one Y, one Cr + Cb interleaved  */
> 

