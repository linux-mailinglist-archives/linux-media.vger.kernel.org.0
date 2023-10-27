Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9007D92DD
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 10:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345670AbjJ0I5J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 04:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345660AbjJ0I5H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 04:57:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB6DBD;
        Fri, 27 Oct 2023 01:57:05 -0700 (PDT)
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:bc36:5a6f:d67a:959d])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 222A0669;
        Fri, 27 Oct 2023 10:56:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698397010;
        bh=grVdMra3Pb/hCedFoavLtCn/UgfsmpFVXydmtVWAoZg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VKl5mSb7HOqcN+UIDKkxBOBYemX5hvWunErxnMRz8DhoYvYb5uEc9NHz4RXUDhPiX
         U24XVOMFko3FLaVdQapAwoxnYbBhM2SldzfewXGqNq1IzDzjy5+wC1Muxa9KeQighW
         pTRg7jFpI3egoP3rBspmel1NwtVD5IcKDGTd5Qzo=
Date:   Fri, 27 Oct 2023 10:57:00 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 4/4] media: i2c: imx214: Add sensor's pixel matrix size
Message-ID: <3opzxxkqa4p6wxddx7bdf2dixphfuo4xunaaiqibvtppmyz6gr@vjxbtjjqiqvy>
References: <20231023-imx214-v1-0-b33f1bbd1fcf@apitzsch.eu>
 <20231023-imx214-v1-4-b33f1bbd1fcf@apitzsch.eu>
 <56kgwl7zehsxy2pp7nziwk2gt6joax42qpzs6eywufvcto7qxm@ts4i3ccdokjr>
 <f5475c4f90e52817349e4842984bb3657b1e500d.camel@apitzsch.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5475c4f90e52817349e4842984bb3657b1e500d.camel@apitzsch.eu>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andre'

On Wed, Oct 25, 2023 at 11:26:00PM +0200, André Apitzsch wrote:
> Hi Jacopo,
>
> Am Dienstag, dem 24.10.2023 um 09:52 +0200 schrieb Jacopo Mondi:
> > Hi Andre'
> >
> > On Mon, Oct 23, 2023 at 11:47:53PM +0200, André Apitzsch wrote:
> > > Set effictive and active sensor pixel sizes as shown in product
> >
> > s/effictive/effective
> >
> > > brief[1].
> > >
> > > [1]:
> > > https://www.mouser.com/datasheet/2/897/ProductBrief_IMX214_20150428-1289331.pdf
> > >
> > > Signed-off-by: André Apitzsch <git@apitzsch.eu>
> > > ---
> > >  drivers/media/i2c/imx214.c | 39 ++++++++++++++++++++++++++++++++--
> > > -----
> > >  1 file changed, 32 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx214.c
> > > b/drivers/media/i2c/imx214.c
> > > index bef8dc36e2d0..a2d441cd8dcd 100644
> > > --- a/drivers/media/i2c/imx214.c
> > > +++ b/drivers/media/i2c/imx214.c
> > > @@ -36,6 +36,14 @@
> > >  #define IMX214_EXPOSURE_STEP		1
> > >  #define IMX214_EXPOSURE_DEFAULT		0x0c70
> > >
> > > +/* IMX214 native and active pixel array size */
> > > +#define IMX214_NATIVE_WIDTH		4224U
> > > +#define IMX214_NATIVE_HEIGHT		3136U
> > > +#define IMX214_PIXEL_ARRAY_LEFT		8U
> > > +#define IMX214_PIXEL_ARRAY_TOP		8U
> > > +#define IMX214_PIXEL_ARRAY_WIDTH	4208U
> > > +#define IMX214_PIXEL_ARRAY_HEIGHT	3120U
> > > +
> >
> > I do get slightly different numbers from the datasheet version I have
> >
> > The sensor is said to have 4224x3208 total pixels of which 4208x3120
> > are active ones.
> >
> > The pixel array diagram shows 64 "OPB" (optically black ?) lines,
> > followed by 8 dummy lines, followed by 3120 valid lines. There are 8
> > dummy columns at each side of the 4208 valid ones.
> >
> > Now, NATIVE which represents the full pixel array size seems to be
> > 4224x3208 (other parts of the datasheet only report 3200 lines
> > though)
> >
> > BOUNDS represents the readabale array area, which I presume
> > corresponds to what is named as 'effective area' by the datasheet. It
> > excludes the OPB lines at the top of the image and seems to be
> > represented by (0, 64, 4224, 3160).
> >
> > CROP_DEFAULT represents the default crop rectangle which covers the
> > active pixel area, so it excludes 8 more lines of dummy pixels and 8
> > dummy columns, which gives a rectangle (8, 72, 4208, 3120)
> >
> > Also note that the driver always reports a TGT_CROP rectangle with
> > top/left points set to 0. If my understanding is correct, V4L2
> > selection targets are defined from the most external target
> > (TGT_NATIVE in this case), and the driver should be corrected to
> > initialize the crop rectangle with a top-left corner at (8, 72).
> >
> > Does this make sense ?
>
> As far as I understood, only the effective and active sizes of three
> sizes provided in the datasheet (total, effective and active) matter.
> By comparing the values used in imx219.c (and imx415.c) with the ones
> in the corresponding datasheets [1,2] I assume, that "effective"
> matches "NATIVE_SIZE", "active" matches "CROP_DEFAULT" and "total" is
> ignored.

imx219 driver indeed does not consider the OPB areas in the definition
of the rectangles...

Also looking at the X/Y_ADDR_START value assigned in the register tables
for full resolution mode (3280x2462) they have value of 0, indeed
meaning the active area is the only readable one.

Then yes, you're right, for imx219
NATIVE = effective
CROP_DEFAULT = BOUND = active

> The commit message of 1ed36ecd1459b653cced8929bfb37dba94b64c5d ("media:
> i2c: imx219: Selection compliance fixes") seems to support me here:

>
> > The top/left crop coordinates of the TGT_CROP rectangle were set to
> > (0, 0) instead of (8, 8) which is the offset from the larger physical
> > pixel array rectangle.
>
> This (8, 8) is half the difference between number of effective and
> active pixels of imx219[1].
>
> Together with the 8 dummy lines and 8 dummy columns you mentioned, I
> still think my values are right. But I've just started working with
> V4L2, so I might be wrong.

To actually verify if the 'effective area' is readable or not, we
should know what register controls the X/Y_ADDR_START value, and
that's an information I don't have in my version of the datasheet.

It's however plausible that it behaves the same as imx219, as the
driver's register sequences seems to program the crop sizes in
register 0x034c and 0x034e and there's not programmed top-left corner
there.

Ok then, let's be consistent and do the same as imx219 as you're doing
here.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
> Could you share the imx214 datasheet with me?
>
> Best regards,
> André
>
> [1] https://www.arducam.com/downloads/modules/RaspberryPi_camera/IMX219DS.PDF
> [2] https://www.sony-semicon.com/files/62/pdf/p-12_IMX415-AAQR_AAMR_Flyer.pdf
> >
> > Thanks
> >   j
> >
> >
> > >  static const char * const imx214_supply_name[] = {
> > >  	"vdda",
> > >  	"vddd",
> > > @@ -634,14 +642,31 @@ static int imx214_get_selection(struct
> > > v4l2_subdev *sd,
> > >  {
> > >  	struct imx214 *imx214 = to_imx214(sd);
> > >
> > > -	if (sel->target != V4L2_SEL_TGT_CROP)
> > > -		return -EINVAL;
> > > +	switch (sel->target) {
> > > +	case V4L2_SEL_TGT_CROP:
> > > +		mutex_lock(&imx214->mutex);
> > > +		sel->r = *__imx214_get_pad_crop(imx214, sd_state,
> > > sel->pad,
> > > +						sel->which);
> > > +		mutex_unlock(&imx214->mutex);
> > > +		return 0;
> > >
> > > -	mutex_lock(&imx214->mutex);
> > > -	sel->r = *__imx214_get_pad_crop(imx214, sd_state, sel-
> > > >pad,
> > > -					sel->which);
> > > -	mutex_unlock(&imx214->mutex);
> > > -	return 0;
> > > +	case V4L2_SEL_TGT_NATIVE_SIZE:
> > > +		sel->r.top = 0;
> > > +		sel->r.left = 0;
> > > +		sel->r.width = IMX214_NATIVE_WIDTH;
> > > +		sel->r.height = IMX214_NATIVE_HEIGHT;
> > > +		return 0;
> > > +
> > > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > > +		sel->r.top = IMX214_PIXEL_ARRAY_TOP;
> > > +		sel->r.left = IMX214_PIXEL_ARRAY_LEFT;
> > > +		sel->r.width = IMX214_PIXEL_ARRAY_WIDTH;
> > > +		sel->r.height = IMX214_PIXEL_ARRAY_HEIGHT;
> > > +		return 0;
> > > +	}
> > > +
> > > +	return -EINVAL;
> > >  }
> > >
> > >  static int imx214_entity_init_cfg(struct v4l2_subdev *subdev,
> > >
> > > --
> > > 2.42.0
> > >
>
