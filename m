Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4255B22C0
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 17:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbiIHPrB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 11:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbiIHPrA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 11:47:00 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D22F9FA2
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 08:46:58 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id c11so22582647wrp.11
        for <linux-media@vger.kernel.org>; Thu, 08 Sep 2022 08:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=fzl0lXYm6DlK9uvAXETrVd5Zsk/XKuValYm0qCKWyL0=;
        b=gg423wVWNClwVtjuw9nRggb6+n+rYvYnkj/kjqU4zC3gJCBz89iNRDT0fyh78yJYDj
         CecXiBDCF4G/JRboxMoRks2KGRLLWcR7RcIHn3OR1j/ZhnyuVfJUcibWvskalQ5THHVv
         GWMf/52e4cRePuNu8LUF++nRWDBlhfjMp4Ng8/70azv4CwTtYdGVvZTWKzD5aqmD66kl
         kLXW19TFyNRwEZj0dPUYlbE4Es3rWNbtTlY4U8NwpdV1NJgurt2QKWNj8aNHrKUvHV7V
         6FS28BWjMP2yv4SQB2iVp/S3S9mpUqQ7JJxJEVHyL8KdX8vb14OtuiKq5uFM92/sIR2m
         jbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=fzl0lXYm6DlK9uvAXETrVd5Zsk/XKuValYm0qCKWyL0=;
        b=HYLyX5LsXBR21CTw52kaTJbJ11BIcqYi3Mh5ZAC1gjpnWHJ1a+wsx8JBfZngf+N29m
         K8ptFMaRTqSeSUdzc4oItZpIvvOIxwAf5VRiytPZJrp2f7qVq2YGwfA4OmGNILZMc0IW
         LbKGEt5S5nIpr+EY6V06xOXISEYdp0BU/9/JivQIx5O8dJ8+MwUznpCN6ilpZgEF9Ky2
         Rtf9TnUm7sddbwqmodq+ULuWFt2Zx4UNyv9qn4KR6PqTyODuvpCOP00atjkBxxlRIM5z
         65kO+GLkSH9IjyE62WxgNYrskHI3nAvjPEifcRLpVC2pR5Gt/VkkncbgT+D6rD0OXY5n
         0uYQ==
X-Gm-Message-State: ACgBeo1VLJQe+XoWiWwlZa2Knvn3g6ctCPoFLbAJ8dOSZLN9qJvv16u6
        jKZXoAyKOHyJdMXF0IvGXZI=
X-Google-Smtp-Source: AA6agR7SHxBZWaVLPNo5J0mnOfC2S5XjEzHIgy5HYcPvJYzo/B6Br0D0ndHKqAEQgh/ER2jwVYx3mQ==
X-Received: by 2002:a5d:464e:0:b0:228:c179:6b0a with SMTP id j14-20020a5d464e000000b00228c1796b0amr5288656wrs.402.1662652016889;
        Thu, 08 Sep 2022 08:46:56 -0700 (PDT)
Received: from arch-thunder (a109-49-33-111.cpe.netcabo.pt. [109.49.33.111])
        by smtp.gmail.com with ESMTPSA id m6-20020a1c2606000000b003a840690609sm3850227wmm.36.2022.09.08.08.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 08:46:56 -0700 (PDT)
Date:   Thu, 8 Sep 2022 16:46:54 +0100
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH 2/6] media: imx: Unstage the imx7-media-csi driver
Message-ID: <20220908154654.cl2drf4qunzogyn7@arch-thunder>
References: <20220907200424.32136-1-laurent.pinchart@ideasonboard.com>
 <20220907200424.32136-3-laurent.pinchart@ideasonboard.com>
 <20220908150627.wm3na2n4x37hf2x3@arch-thunder>
 <YxoHrK7Y8eMHY7Po@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxoHrK7Y8eMHY7Po@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
On Thu, Sep 08, 2022 at 06:18:04PM +0300, Laurent Pinchart wrote:
> Hi Rui,
> 
> On Thu, Sep 08, 2022 at 04:06:27PM +0100, Rui Miguel Silva wrote:
> > Hi Laurent,
> > Thanks for doing this work.
> > 
> > On Wed, Sep 07, 2022 at 11:04:20PM +0300, Laurent Pinchart wrote:
> > > The imx7-media-csi driver, currently in staging, is ready for
> > > prime-time. The staging TODO file lists a few items specific to that
> > > driver, that are already addressed (the "all of the above" part) or can
> > > be addressed later:
> > > 
> > > - The frame interval monitoring support is a software mechanism to
> > >   monitor the device for unexpected stalls, and should be part of the
> > >   V4L2 core if desired.
> > > 
> > > - Restricting the support media bus formats based on the SoC integration
> > >   only aims at reducing userspace confusion by not enumerating options
> > >   that are known not to be possible, it won't cause regressions if
> > >   handled later.
> > > 
> > > Move the description of the media bus format restriction TODO item to
> > > the driver, drop the other TODO items, and move the driver out of
> > > staging.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > For this imx7 work everything looks ok, with one exception:
> > Need to update file entry in MAINTAINERS file.
> 
> Isn't it done below ?
> 
> > (also I noticed that
> > there isn't an entry for the imx8 csi2 in that file also, but that is
> > a different story).
> > 
> > With that fixed:
> > 
> > Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> > 
> > Cheers,
> >    Rui
> > 
> > > ---
> > >  MAINTAINERS                                   |  2 +-
> > >  drivers/media/platform/nxp/Kconfig            | 13 +++++++++
> > >  drivers/media/platform/nxp/Makefile           |  1 +
> > >  .../platform/nxp}/imx7-media-csi.c            | 24 +++++++++++++++
> > >  drivers/staging/media/imx/Kconfig             |  7 -----
> > >  drivers/staging/media/imx/Makefile            |  1 -
> > >  drivers/staging/media/imx/TODO                | 29 -------------------
> > >  7 files changed, 39 insertions(+), 38 deletions(-)
> > >  rename drivers/{staging/media/imx => media/platform/nxp}/imx7-media-csi.c (97%)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 338c155f60ef..1dfa1d51955c 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -12595,7 +12595,7 @@ F:	Documentation/admin-guide/media/imx7.rst
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > >  F:	drivers/media/platform/nxp/imx-mipi-csis.c
> > > -F:	drivers/staging/media/imx/imx7-media-csi.c
> > > +F:	drivers/media/platform/nxp/imx7-media-csi.c
> 
> Right here ?

yeah, sorry, I completely missed this, sorry for the noise.

------
Cheers,
     Rui
> 
> > >  MEDIA DRIVERS FOR HELENE
> > >  M:	Abylay Ospan <aospan@netup.ru>
> > > diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> > > index 1ac0a6e91111..3aa4207bcd41 100644
> > > --- a/drivers/media/platform/nxp/Kconfig
> > > +++ b/drivers/media/platform/nxp/Kconfig
> > > @@ -4,6 +4,19 @@
> > >  
> > >  comment "NXP media platform drivers"
> > >  
> > > +config VIDEO_IMX7_CSI
> > > +	tristate "NXP CSI Bridge driver"
> > > +	depends on ARCH_MXC || COMPILE_TEST
> > > +	depends on HAS_DMA
> > > +	depends on VIDEO_DEV
> > > +	select MEDIA_CONTROLLER
> > > +	select V4L2_FWNODE
> > > +	select VIDEOBUF2_DMA_CONTIG
> > > +	select VIDEO_V4L2_SUBDEV_API
> > > +	help
> > > +	  Driver for the NXP Camera Sensor Interface (CSI) Bridge. This device
> > > +	  is found in the i.MX6UL/L, i.MX7 and i.MX8M[MQ] SoCs.
> > > +
> > >  config VIDEO_IMX_MIPI_CSIS
> > >  	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
> > >  	depends on ARCH_MXC || COMPILE_TEST
> > > diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
> > > index efc38c6578ce..92cb8f4c215e 100644
> > > --- a/drivers/media/platform/nxp/Makefile
> > > +++ b/drivers/media/platform/nxp/Makefile
> > > @@ -2,6 +2,7 @@
> > >  
> > >  obj-y += imx-jpeg/
> > >  
> > > +obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
> > >  obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
> > >  obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
> > >  obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
> > > diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
> > > similarity index 97%
> > > rename from drivers/staging/media/imx/imx7-media-csi.c
> > > rename to drivers/media/platform/nxp/imx7-media-csi.c
> > > index 21d6e56ffcd4..72de9fc9862a 100644
> > > --- a/drivers/staging/media/imx/imx7-media-csi.c
> > > +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> > > @@ -807,6 +807,30 @@ static irqreturn_t imx7_csi_irq_handler(int irq, void *data)
> > >   * List of supported pixel formats for the subdevs. Keep V4L2_PIX_FMT_UYVY and
> > >   * MEDIA_BUS_FMT_UYVY8_2X8 first to match IMX7_CSI_DEF_PIX_FORMAT and
> > >   * IMX7_CSI_DEF_MBUS_CODE.
> > > + *
> > > + * TODO: Restrict the supported formats list based on the SoC integration.
> > > + *
> > > + * The CSI bridge can be configured to sample pixel components from the Rx queue
> > > + * in single (8bpp) or double (16bpp) component modes. Image format variants
> > > + * with different sample sizes (ie YUYV_2X8 vs YUYV_1X16) determine the pixel
> > > + * components sampling size per each clock cycle and their packing mode (see
> > > + * imx7_csi_configure() for details).
> > > + *
> > > + * As the CSI bridge can be interfaced with different IP blocks depending on the
> > > + * SoC model it is integrated on, the Rx queue sampling size should match the
> > > + * size of the samples transferred by the transmitting IP block. To avoid
> > > + * misconfigurations of the capture pipeline, the enumeration of the supported
> > > + * formats should be restricted to match the pixel source transmitting mode.
> > > + *
> > > + * Example: i.MX8MM SoC integrates the CSI bridge with the Samsung CSIS CSI-2
> > > + * receiver which operates in dual pixel sampling mode. The CSI bridge should
> > > + * only expose the 1X16 formats variant which instructs it to operate in dual
> > > + * pixel sampling mode. When the CSI bridge is instead integrated on an i.MX7,
> > > + * which supports both serial and parallel input, it should expose both
> > > + * variants.
> > > + *
> > > + * This currently only applies to YUYV formats, but other formats might need to
> > > + * be handled in the same way.
> > >   */
> > >  static const struct imx7_csi_pixfmt pixel_formats[] = {
> > >  	/*** YUV formats start here ***/
> > > diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
> > > index bfb849701489..21fd79515042 100644
> > > --- a/drivers/staging/media/imx/Kconfig
> > > +++ b/drivers/staging/media/imx/Kconfig
> > > @@ -23,13 +23,6 @@ config VIDEO_IMX_CSI
> > >  	default y
> > >  	help
> > >  	  A video4linux camera sensor interface driver for i.MX5/6.
> > > -
> > > -config VIDEO_IMX7_CSI
> > > -	tristate "i.MX6UL/L / i.MX7 / i.MX8M Camera Sensor Interface driver"
> > > -	default y
> > > -	help
> > > -	  Enable support for video4linux camera sensor interface driver for
> > > -	  i.MX6UL/L, i.MX7 or i.MX8M.
> > >  endmenu
> > >  endif
> > >  
> > > diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
> > > index cef9f30eb401..906a422aa656 100644
> > > --- a/drivers/staging/media/imx/Makefile
> > > +++ b/drivers/staging/media/imx/Makefile
> > > @@ -14,5 +14,4 @@ obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media.o
> > >  obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-media-csi.o
> > >  obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
> > >  
> > > -obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
> > >  obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
> > > diff --git a/drivers/staging/media/imx/TODO b/drivers/staging/media/imx/TODO
> > > index 5d3a337c8702..afee26870af7 100644
> > > --- a/drivers/staging/media/imx/TODO
> > > +++ b/drivers/staging/media/imx/TODO
> > > @@ -23,32 +23,3 @@
> > >  - Similarly to the legacy control handling, legacy format handling where
> > >    formats on the video nodes are influenced by the active format of the
> > >    connected subdev should be removed.
> > > -
> > > -- i.MX7: all of the above, since it uses the imx media core
> > > -
> > > -- i.MX7: use Frame Interval Monitor
> > > -
> > > -- imx7-media-csi: Restrict the supported formats list to the SoC version.
> > > -
> > > -  The imx7 CSI bridge can be configured to sample pixel components from the Rx
> > > -  queue in single (8bpp) or double (16bpp) component modes. Image format
> > > -  variants with different sample sizes (ie YUYV_2X8 vs YUYV_1X16) determine the
> > > -  pixel components sampling size per each clock cycle and their packing mode
> > > -  (see imx7_csi_configure() for details).
> > > -
> > > -  As the imx7 CSI bridge can be interfaced with different IP blocks depending on
> > > -  the SoC model it is integrated on, the Rx queue sampling size should match
> > > -  the size of the samples transferred by the transmitting IP block.
> > > -
> > > -  To avoid mis-configurations of the capture pipeline, the enumeration of the
> > > -  supported formats should be restricted to match the pixel source transmitting
> > > -  mode.
> > > -
> > > -  Example: i.MX8MM SoC integrates the CSI bridge with the Samsung CSIS CSI-2
> > > -  receiver which operates in dual pixel sampling mode. The CSI bridge should
> > > -  only expose the 1X16 formats variant which instructs it to operate in dual
> > > -  pixel sampling mode. When the CSI bridge is instead integrated on an i.MX7,
> > > -  which supports both serial and parallel input, it should expose both variants.
> > > -
> > > -  This currently only applies to YUYV formats, but other formats might need
> > > -  to be handled in the same way.
> > > -- 
> > > Regards,
> > > 
> > > Laurent Pinchart
> > > 
> 
> -- 
> Regards,
> 
> Laurent Pinchart
