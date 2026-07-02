Return-Path: <linux-media+bounces-66378-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F69DO7xxRmq5VAsAu9opvQ
	(envelope-from <linux-media+bounces-66378-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 16:12:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5D26F8BD2
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 16:12:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b="V7FxE1s/";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66378-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66378-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0415E3045E39
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 14:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFA34C042A;
	Thu,  2 Jul 2026 14:06:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57FF3C1979
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 14:06:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001169; cv=none; b=r/xVkSDNzKKWLGUJB1kfzzt9KnNwlHskozcvcRtnNG70ZYorJfXKtxNcfskgaiHhpTNeIjrSWYbAhnmZ2Y1zI4VDoQdTt2ZZRj5wMnkK2D5X9HFZ1j0Z0GrTF+3qt0RIlnSuTClmWwsp5iUp/wrJFkwftPIjjTfRdON3uLgfHgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001169; c=relaxed/simple;
	bh=LNiHKbFpyTEFj+cKtdWEHV2GV7+AxFYFOjQkUoD9hdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tblbJA3sla0m21/ghm32ys8AkIiWsuh5pQFE5jMn6fNHtHnDpSoILPvouoJSQT7d3RAKs6UbM85XKNZjGJfR2xwe2/Q+x3LiYOFF5Y07Xa97ZgznUxPaRLClvJFDKc7kPKNOmUf2y/SA6SHlAp+p2HjVKWiWGMHAIkOBLxC1Yg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7FxE1s/; arc=none smtp.client-ip=198.175.65.14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783001167; x=1814537167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LNiHKbFpyTEFj+cKtdWEHV2GV7+AxFYFOjQkUoD9hdk=;
  b=V7FxE1s/etZfocPR3FfOjxuc98TrvxEQZa5f2XqpFBnIscctKuiA83xZ
   n7CJd5Dfcs9xpFKax2GNSCGAIICNvnO1X8IfjGl6CaiYBMorS+zLLdDw2
   09CKBPaQVRGfDwYQgegnsC/OHSdKr1cvWK3RLLHM8nbczzF1Jo/EhLzlK
   gCoWQ4FpAmIWR84QsQzpjNyJikjKYuLnsNslACm5ThX/Goq+x/6YbEoCY
   ImWf/d5y+8K4Fto2EWguXWExVvinDuru2/giQk+DBvEnVjvXpz0Rz3qpU
   s75M3asy7IveMGH2Vof2BDPBKNBDuJLsfxqIg7swp29g4ymOSgxrzZSX0
   Q==;
X-CSE-ConnectionGUID: va06Vq/ORyKTfe4hUBHkrA==
X-CSE-MsgGUID: kBUm3TbiRsWOB64WPBZqyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87671457"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="87671457"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 07:06:06 -0700
X-CSE-ConnectionGUID: P3a1ED0DR1GCNDQpvlwXZw==
X-CSE-MsgGUID: UoKh9LiMQeqPJhlzIvIqkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="250214472"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.229])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 07:06:00 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B4D93121C2C;
	Thu, 02 Jul 2026 17:05:56 +0300 (EEST)
Date: Thu, 2 Jul 2026 17:05:56 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	" Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v12 60/86] media: imx219: Add embedded data support
Message-ID: <akZwRA3GCy8jqgp3@kekkonen.localdomain>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
 <20260409201501.975242-61-sakari.ailus@linux.intel.com>
 <178117996109.1799417.15021338357084733334@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178117996109.1799417.15021338357084733334@freya>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66378-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B5D26F8BD2

Hi Jai,

On Thu, Jun 11, 2026 at 05:42:41PM +0530, Jai Luthra wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> Not a full review, just some things that I noticed while trying to test
> this branch with libcamera..
> 
> Quoting Sakari Ailus (2026-04-10 01:44:35)
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > The IMX219 generates embedded data unconditionally. Report it as an
> > additional stream, with a new internal embedded data pad, and update
> > subdev operations accordingly.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/imx219.c | 187 +++++++++++++++++++++++++++++++------
> >  1 file changed, 161 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index d695987839e4..e744b96a08f6 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -154,6 +154,9 @@
> >  #define IMX219_PIXEL_ARRAY_HEIGHT      2480U
> >  #define IMX219_NATIVE_FORMAT           MEDIA_BUS_FMT_SRGGB10_1X10
> >  
> > +/* Embedded metadata stream height */
> > +#define IMX219_EMBEDDED_DATA_HEIGHT    2U
> > +
> >  /* Mode : resolution and related config&values */
> >  struct imx219_mode {
> >         /* Frame width */
> > @@ -345,11 +348,13 @@ static const struct imx219_mode supported_modes[] = {
> >  enum imx219_pad_ids {
> >         IMX219_PAD_SOURCE = 0,
> >         IMX219_PAD_IMAGE,
> > +       IMX219_PAD_EDATA,
> >         IMX219_NUM_PADS,
> >  };
> >  
> >  enum imx219_stream_ids {
> >         IMX219_STREAM_IMAGE,
> > +       IMX219_STREAM_EDATA,
> >  };
> >  
> >  struct imx219 {
> > @@ -375,6 +380,8 @@ struct imx219 {
> >  
> >         /* Two or Four lanes */
> >         u8 lanes;
> > +
> > +       u64 streams_enabled;
> >  };
> >  
> >  static inline struct imx219 *to_imx219(struct v4l2_subdev *_sd)
> > @@ -418,6 +425,25 @@ static u32 imx219_get_format_bpp(const struct v4l2_mbus_framefmt *format)
> >         }
> >  }
> >  
> > +static u32
> > +imx219_get_embedded_format_code(const struct v4l2_mbus_framefmt *format)
> > +{
> > +       switch (format->code) {
> > +       case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +       case MEDIA_BUS_FMT_SGRBG8_1X8:
> > +       case MEDIA_BUS_FMT_SGBRG8_1X8:
> > +       case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +               return MEDIA_BUS_FMT_META_8;
> > +
> > +       case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +       case MEDIA_BUS_FMT_SGRBG10_1X10:
> > +       case MEDIA_BUS_FMT_SGBRG10_1X10:
> > +       case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +       default:
> > +               return MEDIA_BUS_FMT_META_10;
> > +       }
> > +}
> > +
> >  static void imx219_get_binning(struct v4l2_subdev_state *state, u8 *bin_h,
> >                                u8 *bin_v)
> >  {
> > @@ -749,6 +775,15 @@ static int imx219_enable_streams(struct v4l2_subdev *sd,
> >         struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> >         int ret;
> >  
> > +       /*
> > +        * The image stream controls sensor streaming, as embedded data isn't
> > +        * controllable independently.
> > +        */
> > +       if (imx219->streams_enabled) {
> > +               imx219->streams_enabled |= streams_mask;
> > +               return 0;
> > +       }
> > +
> >         ret = pm_runtime_resume_and_get(&client->dev);
> >         if (ret < 0)
> >                 return ret;
> > @@ -791,6 +826,8 @@ static int imx219_enable_streams(struct v4l2_subdev *sd,
> >         __v4l2_ctrl_grab(imx219->vflip, true);
> >         __v4l2_ctrl_grab(imx219->hflip, true);
> >  
> > +       imx219->streams_enabled = streams_mask;
> > +
> >         return 0;
> >  
> >  err_rpm_put:
> > @@ -806,6 +843,10 @@ static int imx219_disable_streams(struct v4l2_subdev *sd,
> >         struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
> >         int ret;
> >  
> > +       imx219->streams_enabled &= ~streams_mask;
> > +       if (imx219->streams_enabled)
> > +               return 0;
> > +
> >         /* set stream off register */
> >         ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
> >                         IMX219_MODE_STANDBY, NULL);
> > @@ -826,17 +867,32 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
> >  {
> >         struct imx219 *imx219 = to_imx219(sd);
> >  
> > -       if (code->pad == IMX219_PAD_IMAGE) {
> > -               /* The internal image pad is hardwired to the native format. */
> > +       switch (code->pad) {
> > +       case IMX219_PAD_IMAGE:
> >                 if (code->index > 0)
> >                         return -EINVAL;
> >  
> > -               code->code = IMX219_NATIVE_FORMAT;
> > -       } else {
> > -               /*
> > -                * On the source pad, the sensor supports multiple raw formats
> > -                * with different bit depths.
> > -                */
> > +               code->code = MEDIA_BUS_FMT_RAW_10;
> > +               return 0;
> > +
> > +       case IMX219_PAD_EDATA:
> > +               if (code->index > 0)
> > +                       return -EINVAL;
> > +
> > +               code->code = MEDIA_BUS_FMT_META_10;
> > +               return 0;
> > +
> > +       case IMX219_PAD_SOURCE:
> > +       default:
> > +               break;
> > +       }
> > +
> > +       /*
> > +        * On the source pad, the sensor supports multiple image raw formats
> > +        * with different bit depths. The embedded data format bit depth
> > +        * follows the image stream.
> > +        */
> > +       if (code->stream == IMX219_STREAM_IMAGE) {
> >                 u32 format;
> >  
> >                 if (code->index >= ARRAY_SIZE(imx219_mbus_formats) / 4)
> > @@ -844,6 +900,15 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
> >  
> >                 format = imx219_mbus_formats[code->index * 4];
> >                 code->code = imx219_get_format_code(imx219, format);
> > +       } else {
> > +               struct v4l2_mbus_framefmt *fmt;
> > +
> > +               if (code->index > 0)
> > +                       return -EINVAL;
> > +
> > +               fmt = v4l2_subdev_state_get_format(state, IMX219_PAD_SOURCE,
> > +                                                  IMX219_STREAM_EDATA);
> > +               code->code = fmt->code;
> >         }
> >  
> >         return 0;
> > @@ -855,15 +920,33 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
> >  {
> >         struct imx219 *imx219 = to_imx219(sd);
> >  
> > -       if (fse->pad == IMX219_PAD_IMAGE) {
> > +       switch (fse->pad) {
> > +       case IMX219_PAD_IMAGE:
> >                 if (fse->code != IMX219_NATIVE_FORMAT || fse->index > 0)
> 
> This should be MEDIA_BUS_FMT_RAW_10 I believe?

Yes, I'll switch to that.

> 
> >                         return -EINVAL;
> >  
> > -               fse->min_width = IMX219_PIXEL_ARRAY_WIDTH;
> > -               fse->max_width = IMX219_PIXEL_ARRAY_WIDTH;
> > -               fse->min_height = IMX219_PIXEL_ARRAY_HEIGHT;
> > -               fse->max_height = IMX219_PIXEL_ARRAY_HEIGHT;
> > -       } else {
> > +               fse->min_width = IMX219_VISIBLE_WIDTH;
> > +               fse->max_width = IMX219_VISIBLE_WIDTH;
> > +               fse->min_height = IMX219_VISIBLE_HEIGHT;
> > +               fse->max_height = IMX219_VISIBLE_HEIGHT;
> > +               return 0;
> > +
> > +       case IMX219_PAD_EDATA:
> > +               if (fse->code != MEDIA_BUS_FMT_META_8 || fse->index > 0)
> 
> And this should be MEDIA_BUS_FMT_META_10, to match these both with what
> imx219_enum_mbus_code() is doing.

The embedded data is always 8-bit, albeit the sensor may send it out at 10
bits per pixel, to align with the image data format.

This needs to be fixed in the EDATA pad in fact.

> 
> But I guess we need to handle both 8 and 10 bit formats at both places.

-- 
Kind regards,

Sakari Ailus

