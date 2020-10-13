Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48A2528CACA
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 11:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404219AbgJMJIU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 05:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404121AbgJMJIP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 05:08:15 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46F3C0613D0;
        Tue, 13 Oct 2020 02:08:14 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8F33C634C87;
        Tue, 13 Oct 2020 12:07:05 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kSGGv-0002fj-Dc; Tue, 13 Oct 2020 12:07:05 +0300
Date:   Tue, 13 Oct 2020 12:07:05 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hugues Fruchet <hugues.fruchet@st.com>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Alain Volmat <alain.volmat@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH] media: stm32-dcmi: add support of BT656 bus
Message-ID: <20201013090704.GL6413@valkosipuli.retiisi.org.uk>
References: <1602087290-18020-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602087290-18020-1-git-send-email-hugues.fruchet@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

On Wed, Oct 07, 2020 at 06:14:50PM +0200, Hugues Fruchet wrote:
> Add support of BT656 embedded synchronization bus.
> This mode allows to save hardware synchro lines hsync & vsync
> by replacing them with synchro codes embedded in data stream.
> This bus type is only compatible with 8 bits width data bus.
> Due to reserved values 0x00 & 0xff used for synchro codes,
> valid data only vary from 0x1 to 0xfe, this is up to sensor
> to clip accordingly pixel data. As a consequence of this
> clipping, JPEG is not supported when using this bus type.
> DCMI crop feature is also not available with this bus type.

You can have more than 62 characters per line. In fact, 75 is the
recommended maximum.

You should also amend the bindings to cover BT.656 mode. Also bus-type
should probably be made mandatory, too.

> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> ---
>  drivers/media/platform/stm32/stm32-dcmi.c | 37 +++++++++++++++++++++++++++++--
>  1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index fd1c41c..d7d7cdb 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -157,6 +157,7 @@ struct stm32_dcmi {
>  	struct vb2_queue		queue;
>  
>  	struct v4l2_fwnode_bus_parallel	bus;
> +	enum v4l2_mbus_type		bus_type;
>  	struct completion		complete;
>  	struct clk			*mclk;
>  	enum state			state;
> @@ -777,6 +778,23 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	if (dcmi->bus.flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
>  		val |= CR_PCKPOL;
>  
> +	/*
> +	 * BT656 embedded synchronisation bus mode.
> +	 *
> +	 * Default SAV/EAV mode is supported here with default codes
> +	 * SAV=0xff000080 & EAV=0xff00009d.
> +	 * With DCMI this means LSC=SAV=0x80 & LEC=EAV=0x9d.
> +	 */
> +	if (dcmi->bus_type == V4L2_MBUS_BT656) {
> +		val |= CR_ESS;
> +
> +		/* Unmask all codes */
> +		reg_write(dcmi->regs, DCMI_ESUR, 0xffffffff);/* FEC:LEC:LSC:FSC */
> +
> +		/* Trig on LSC=0x80 & LEC=0x9d codes, ignore FSC and FEC */
> +		reg_write(dcmi->regs, DCMI_ESCR, 0xff9d80ff);/* FEC:LEC:LSC:FSC */
> +	}
> +
>  	reg_write(dcmi->regs, DCMI_CR, val);
>  
>  	/* Set crop */
> @@ -1067,8 +1085,9 @@ static int dcmi_set_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f)
>  	if (ret)
>  		return ret;
>  
> -	/* Disable crop if JPEG is requested */
> -	if (pix->pixelformat == V4L2_PIX_FMT_JPEG)
> +	/* Disable crop if JPEG is requested or BT656 bus is selected */
> +	if (pix->pixelformat == V4L2_PIX_FMT_JPEG &&
> +	    dcmi->bus_type != V4L2_MBUS_BT656)
>  		dcmi->do_crop = false;
>  
>  	/* pix to mbus format */
> @@ -1592,6 +1611,11 @@ static int dcmi_formats_init(struct stm32_dcmi *dcmi)
>  			if (dcmi_formats[i].mbus_code != mbus_code.code)
>  				continue;
>  
> +			/* Exclude JPEG if BT656 bus is selected */
> +			if (dcmi_formats[i].fourcc == V4L2_PIX_FMT_JPEG &&
> +			    dcmi->bus_type == V4L2_MBUS_BT656)
> +				continue;
> +
>  			/* Code supported, have we got this fourcc yet? */
>  			for (j = 0; j < num_fmts; j++)
>  				if (sd_fmts[j]->fourcc ==
> @@ -1873,9 +1897,18 @@ static int dcmi_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "CSI bus not supported\n");
>  		return -ENODEV;
>  	}
> +
> +	if (ep.bus_type == V4L2_MBUS_BT656 &&
> +	    ep.bus.parallel.bus_width != 8) {
> +		dev_err(&pdev->dev, "BT656 bus conflicts with %d bits bus width (8 bits required)\n",
> +			ep.bus.parallel.bus_width);

bus_width is unsigned here.

> +		return -ENODEV;
> +	}
> +
>  	dcmi->bus.flags = ep.bus.parallel.flags;
>  	dcmi->bus.bus_width = ep.bus.parallel.bus_width;
>  	dcmi->bus.data_shift = ep.bus.parallel.data_shift;
> +	dcmi->bus_type = ep.bus_type;
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq <= 0)

-- 
Regards,

Sakari Ailus
