Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFAFF4B66BA
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 09:58:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232303AbiBOI6Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 03:58:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbiBOI6X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 03:58:23 -0500
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E06A89CCA
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 00:58:13 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 74B8B20000D;
        Tue, 15 Feb 2022 08:58:08 +0000 (UTC)
Date:   Tue, 15 Feb 2022 09:59:18 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, martin.kepplinger@puri.sm,
        rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
        alexander.stein@ew.tq-group.com, dorota.czaplejewicz@puri.sm,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/8] staging: media: imx: Use DUAL pixel mode if available
Message-ID: <20220215085918.dxilh2sx2yx2l6c5@uno.localdomain>
References: <20220214184318.409208-1-jacopo@jmondi.org>
 <20220214184318.409208-6-jacopo@jmondi.org>
 <YgtSbEjr9KID81eI@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YgtSbEjr9KID81eI@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Feb 15, 2022 at 09:12:44AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Mon, Feb 14, 2022 at 07:43:15PM +0100, Jacopo Mondi wrote:
> > The pixel sampling mode controls the size of data sampled from the CSI
> > Rx queue. The supported sample size depends on the configuration of the
> > preceding block in the capture pipeline and is then dependent on the SoC
> > version the CSI peripheral is integrated on.
> >
> > When capturing YUV422 data if dual sample mode is available use it.
> >
> > This change is particularly relevant for the IMX8MM SoC which uses the
> > CSIS CSI-2 receiver which operates in dual pixel mode.
> >
> > Other SoCs should be unaffected by this change and should continue to
> > operate as before.
> >
> > Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/staging/media/imx/imx7-media-csi.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> > index 112096774961..a8bdfb0bb0ee 100644
> > --- a/drivers/staging/media/imx/imx7-media-csi.c
> > +++ b/drivers/staging/media/imx/imx7-media-csi.c
> > @@ -426,6 +426,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
> >  {
> >  	struct imx_media_video_dev *vdev = csi->vdev;
> >  	struct v4l2_pix_format *out_pix = &vdev->fmt;
> > +	struct imx_media_dev *imxmd = csi->imxmd;
> >  	int width = out_pix->width;
> >  	u32 stride = 0;
> >  	u32 cr3 = BIT_FRMCNT_RST;
> > @@ -436,7 +437,7 @@ static void imx7_csi_configure(struct imx7_csi *csi)
> >  	cr18 &= ~(BIT_CSI_HW_ENABLE | BIT_MIPI_DATA_FORMAT_MASK |
> >  		  BIT_DATA_FROM_MIPI | BIT_BASEADDR_CHG_ERR_EN |
> >  		  BIT_BASEADDR_SWITCH_EN | BIT_BASEADDR_SWITCH_SEL |
> > -		  BIT_DEINTERLACE_EN);
> > +		  BIT_DEINTERLACE_EN | BIT_MIPI_DOUBLE_CMPNT);
> >
> >  	if (out_pix->field == V4L2_FIELD_INTERLACED) {
> >  		cr18 |= BIT_DEINTERLACE_EN;
> > @@ -500,6 +501,13 @@ static void imx7_csi_configure(struct imx7_csi *csi)
> >  		case MEDIA_BUS_FMT_YUYV8_2X8:
> >  		case MEDIA_BUS_FMT_YUYV8_1X16:
> >  			cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
> > +
> > +			/* If dual mode is supported use it. */
> > +			if (imxmd->info->sample_modes & MODE_DUAL) {
> > +				cr18 |= BIT_MIPI_DOUBLE_CMPNT;
> > +				cr3 |= BIT_TWO_8BIT_SENSOR;
> > +			}
>
> I would implement this differently:
>
> 		case MEDIA_BUS_FMT_UYVY8_2X8:
> 		case MEDIA_BUS_FMT_YUYV8_2X8:
> 			cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B;
> 			break;
>
> 		case MEDIA_BUS_FMT_UYVY8_1X16:
> 		case MEDIA_BUS_FMT_YUYV8_1X16:
> 			cr3 |= BIT_TWO_8BIT_SENSOR;
> 			cr18 |= BIT_MIPI_DATA_FORMAT_YUV422_8B
> 			     |  BIT_MIPI_DOUBLE_CMPNT;
> 			break;
>
> This would support either option here. What you will then need to change
> is imx7_csi_enum_mbus_code() and imx7_csi_try_fmt(), to allow/disallow
> the 2X8 and 1X16 variants based on the SoC. This is important for the

Exactly. And being the format list in the shared helper I decided it
was really not worth adding any SoC specific code to those helpers
which should ideally be nuked.

Should we decouple the helpers to get to a point where we can have
SoC-specific formats list ? Then I would be more than happy to use the
above construct.

There is one quirk I'm not sure about: How does the CSI connect to the
transmitter ? It is my undertanding that in i.MX8 connects to the the
CSI-2 receiver (either CSIS or the Northwest tech one). Does in older
SoC revisions connects directly to a parallel sensor ?

I'm asking also because there is a comment that reports

		/*
		 * CSI-2 sources are supposed to use the 1X16 formats, but not
		 * all of them comply. Support both variants.
		 */

But if the preceding block is the CSI-2 receiver, we control what
formats it exposes and we can use both 2X8 or 1X16 depending on the
SoC specificities and we don't care about the CSI-2 Tx supported
formats. Does that comment make sense in your opinion ?

Also be aware that, in example, if we expose from the CSIS source pad
both 2X8 and 1X16 we create a condition where userspace could
configure the pipeline uncorrectly.

Let's draw a table (for i.MX8 only as I don't know about the 7)


        8MM/CSI   8MQ/CSI  8MP/ISI
CSIS    Dual              Dual
NW              Single


Each block would then support

CSIS    Dual
NW      Single
CSI     Dual/Single
ISI     Dual

So we create a potential for a misconfiguration in 8MM with

        CSIS = Dual
        CSI = Single

or for the 8MQ

        NW = Single
        CSI = Double

If we don't create a list of SoC specific formats. Nothing bad, -EPIPE
will be returned, but maybe we should avoid that ?


> i.MX7, which has both a CSI-2 input and a parallel input. When using the
> CSIS it can (and should) use double component mode, while when using the
> parallel input it can work in 8-bit or 16-bit mode depending on how the
> sensor is wired.

I didn't know i.MX7 used the CSIS :/
Ah wait, the driver was called imx7-mipi-csi2 :/

>
> > +
> >  			break;
> >  		}
> >  	}
>
> --
> Regards,
>
> Laurent Pinchart
