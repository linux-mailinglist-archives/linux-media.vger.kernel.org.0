Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45ADE4B7974
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 22:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242852AbiBOVH5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 16:07:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237465AbiBOVH4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 16:07:56 -0500
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCFE82D1F6
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 13:07:44 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id EC4BB2006F;
        Tue, 15 Feb 2022 23:07:39 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1644959260;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=myG8BjfxlVe1x6+g/zLbpgA6GlF5K33jx+0oPpvk4f8=;
        b=JVf6ipUArKccEU9xdSNOTqeGZ/qMixXwxidZtrXd9IhZGg8t12padY3fUX+5NZ/tEg6a+W
        Qu7zuN/qT4/ICE5eP84+iRl9vxSnXRdnAygyaSxk241A0irlZAtPDBq5i2QDX7CFqeLGZl
        w/LqBbtsXyGgxMjvY2Gdwo+Qmde+8lw=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5C534634C93;
        Tue, 15 Feb 2022 23:07:39 +0200 (EET)
Date:   Tue, 15 Feb 2022 23:07:39 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, slongerbeam@gmail.com,
        p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, martin.kepplinger@puri.sm,
        rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
        alexander.stein@ew.tq-group.com, dorota.czaplejewicz@puri.sm,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 8/8] media: imx: imx-mipi-csis: Add RGB/BGR888
Message-ID: <YgwWG4s3LeNxaHQ4@valkosipuli.retiisi.eu>
References: <20220214184318.409208-1-jacopo@jmondi.org>
 <20220214184318.409208-9-jacopo@jmondi.org>
 <YgtaUsxBF69bZa92@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgtaUsxBF69bZa92@pendragon.ideasonboard.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1644959260; a=rsa-sha256; cv=none;
        b=oYGV2houWliRwGVc6vEOYi3gt4iDwJDqiLF+8umb24WiZc4fVLUQSf9d+vLwQOiTGvsDsh
        Y/EYUZmOJYHxQfKwSkafHIDh46/1Nw1MJLbkS21h2cXH/g7EDtuv6XyPQ++Xo0OQn0b45+
        eWSVjyoHHI9uxnh3qOLpr/+BfVX8C3A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1644959260;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=myG8BjfxlVe1x6+g/zLbpgA6GlF5K33jx+0oPpvk4f8=;
        b=BOO/yuMl1qHowAu9yZHx0gBNmo5evVttWcXczD0igN+RJM9eDbskzEpCTAE6kK/HDFi2mm
        L7qaoALlQrXkpXcx7Q8sqXU9iPRdL8asnLlx8DnQiNUr3mxzt2wjcFNKePb4I5S7UuC811
        LIK5M3Qzwm0MipTsb13nDuGPMSfnIX4=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Jacopo,

Thanks for cc'ing me.

On Tue, Feb 15, 2022 at 09:46:26AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> (Adding Sakari to the recipients)
> 
> Thank you for the patch.
> 
> On Mon, Feb 14, 2022 at 07:43:18PM +0100, Jacopo Mondi wrote:
> > Add support for the RGB888_1X24 and BGR888_1X24 image formats.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/platform/imx/imx-mipi-csis.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
> > index 9e0a478dba75..0d5870b3010a 100644
> > --- a/drivers/media/platform/imx/imx-mipi-csis.c
> > +++ b/drivers/media/platform/imx/imx-mipi-csis.c
> > @@ -366,6 +366,16 @@ static const struct csis_pix_format mipi_csis_formats[] = {
> >  		.data_type = MIPI_CSI2_DATA_TYPE_RGB565,
> >  		.width = 16,
> >  	},
> > +	{
> 
> 	}, {
> 
> to match the rest of the array. Same below.
> 
> > +		.code = MEDIA_BUS_FMT_RGB888_1X24,
> > +		.data_type = MIPI_CSI2_DATA_TYPE_RGB888,
> > +		.width = 24,
> > +	},
> > +	{
> > +		.code = MEDIA_BUS_FMT_BGR888_1X24,
> > +		.data_type = MIPI_CSI2_DATA_TYPE_RGB888,
> > +		.width = 24,
> > +	},
> 
> CSI-2 specifies the order of bits on the bus for RGB888, with data being
> transmitted in the B, G, R order. The recommended format when stored in
> memory is V4L2_PIX_FMT_BGR24 (B in byte 0, G in byte 1, R in byte 2).
> There is no recommended deserialized bus format though.
> 
> On the output side of the CSIS, we have information. Given figure 13-23
> ("Pixel alignment") in the i.MX8MP reference manual, and the definition
> of RGB_SWAP in MIPI_CSI2_ISP_CONFIG_CH0 that reads
> 
>     Swapping RGB sequence
> 
>     0  MSB is R and LSB is B.
>     1  MSB is B and LSB is R (swapped).
> 
> I think MEDIA_BUS_FMT_RGB888_1X24 is appropriate.
> 
> On the input side of the CSIS, however, it's a different story, similar
> to YUV formats. For YUV 4:2:2 we have picked MEDIA_BUS_FMT_UYVY8_1X16
> arbitrarily to represent the CSI-2 bus format. It doesn't correspond to
> the physical reality, but it doesn't matter much. We thus need to do the
> same for RGB888. If we follow the same convention as for YUV 4:2:2,
> which transmits data in the U, Y, V, Y order, we should then pick
> BGR888_1X24. However, the CSIS driver would then need to translate from
> the input format BGR888_1X24 to the output format RGB888_1X24, which
> adds a bit of complexity.
> 
> Picking RGB888_1X24 for the CSI-2 bus is thus tempting, but it's a
> choice that will affect all drivers, so I wouldn't make this based
> solely on ease of implementation in a particular driver. I'm thus
> tempted to go for BGR888_1X24 to be consistent with YUV 4:2:2. Another
> option would be to add a new RGB888_CSI2 media bus format. In retrospect
> we should have done the same for YUV 4:2:2. Mistakes happen.
> 
> Sakari, what do you think ?

We first started adding support for raw Bayer formats for CSI-2 so at the
time there was little room for confusing the format with another one. Also
few of these formats were eventually used on the parallel bus, making some
of the formats look a little bit artificial.

We've discussed separating the serial bus formats a few times since but
always stuck using single-sample parallel bus format for the serial buses.
As the existing formats will remain as-is, we'd have a mix of differently
named formats returned from an enumeration from increasing number of
drivers. That isn't pretty, but then 24 bit deep Bayer formats won't fit
the mbus format table anyway.

I don't have a strong opinion on this, apart from maintaining the pixel
order. Maybe I'd still create a parallel single-sample format for this one.

If we'd differentiate the formats on CSI-2 bus, I'd just call them
"serial", not "CSI-2".

> 
> If we go for BGR888_1X24, the translation between BGR888_1X24 and
> RGB888_1X24 may not be that hard to implement. You could add an output
> field to the csis_pix_format structure to store the output media bus
> code for a given input code, and I think the implementation would then
> remain relatively simple.
> 
> Finally, we can also support the swapped RGB format (which is
> non-standard in CSI-2 but is supported by some sensors, the same way as
> YUV permutations are often supported too), but it will require setting
> RGB_SWAP. You can add a rgb_swap field to csis_pix_format for this.
> 
> I'd split this patch in two, adding MEDIA_BUS_FMT_RGB888_1X24 first, and
> then adding MEDIA_BUS_FMT_BGR888_1X24 with the new rgb_swap field. The
> first patch should capture the above explanation.
> 
> >  	/* RAW (Bayer and greyscale) formats. */
> >  	{
> >  		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
> 

-- 
Kind regards,

Sakari Ailus
