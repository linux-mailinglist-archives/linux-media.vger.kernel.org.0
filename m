Return-Path: <linux-media+bounces-60827-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MOQA7+q/GkNSgAAu9opvQ
	(envelope-from <linux-media+bounces-60827-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 17:07:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5384EACC6
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 17:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C353A3011C78
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 15:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05EF339A7E7;
	Thu,  7 May 2026 15:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="gvmUglMs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37803BBA0F
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778166200; cv=pass; b=gdTdqNeaXrNFz3O7oIlVnLdpzSepJjp7fNvnEDQXCCn/HB32lewLPiwa01EW/AnoZKxfpNtJ2DKS/g6AysiI+vJNdjc4QdjPc+HpoSuTFBKbVd6Mt40LP0VznMxE3qcGZbI4rrhH6fqDAKhBTK66TR5vyY//DrEVt7oRex7BlHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778166200; c=relaxed/simple;
	bh=fNSUD6gfyQpm8dL2XlWPPsMjWhde1zQklXgWHZVOhrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6r6YEPwnjuzUa/O2UCBWdbkLskMQH+qW152Nmf4RIxxrusQUmB5aWcTyQErsgPnUdY9t3Dlet2EcyuIyZKKbpiZ6OGGbjFuzW3dEb6Xl7OuNp4n7cVmK4/H9BdbCeJ/jElRhqEbPGJ50JGcK+i6TeXOnUDm5EOoxlflCQBP15U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=gvmUglMs; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7bdf83185bbso9999587b3.2
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 08:03:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778166194; cv=none;
        d=google.com; s=arc-20240605;
        b=ITCrOrr3etyuJ9dFAIaokOrk5p6luDAPbZGUIUZ8AuWOoU9aeVJ9Bu9U1Eu2ySsgVY
         Is5FJtOfW5oGq408DU5Y2sKZz9tI3aiDeuDUzOLNW0O9c7JoYz2A3fIHnPzv+1XbA7BH
         U6zW30hnVxliEW692h9PzhS6ty68odi9+XEI2FDdP0DVtd7cHElYDj6ui3AnqFRDrrXg
         gfZ04herr26InhAk6K/NSMCiygmxvmxQ/OIjvrovSV2oePDZkFOLaFBB21DLRiFNUtwN
         kDRmw7vcRIJ139/KeJAGOyZF19opO5+s/XIsiie1B1dV/qkM48FVL8I7sAHSadBts7IZ
         vqvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hfwL0IR2TBH/E3PXnQJJzUTG0JVNK5KPPKWisd5788M=;
        fh=5LHz7nwk7sifAu0B8rFqHe3vwXR0z2GAgSW23Ds5oIk=;
        b=XoqnTvIVr/VoQNzVEYiSEYYtGTkEk38aIQxdDWvAV3qKeo3+3RYsjA3eJLsJXHmoBy
         jtFlFBJdu2CvVGBr2IwjirkwPP8OnwCrzRzHMzI8OiWiymilbToIIL6Rv5rJCxqOiepB
         fJzm8q0YF65Uwhq3kfKIwo9GxAWjuQA2atsHw+vswUDSHRaQEAJwUbx+mCqQZENIeXYj
         KT/sSNvtq5lHOAHipkIBSO0lirGn1zUlM8iNdLWTKRvVO7jUT/svsYRTmxGCaa9KnmLU
         KglVqc02jd3mrDw7BvWCpAUVGuePvQTKod3NFpO/7R0OZt7/ADu3GtTowJCev0ChQqVy
         8tWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1778166194; x=1778770994; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hfwL0IR2TBH/E3PXnQJJzUTG0JVNK5KPPKWisd5788M=;
        b=gvmUglMsfBXFCLTvgNocqQMZIo2e5xfCjPuESptL20cf4mchLlKFNLL07HGycowske
         eBAhPsg0xg2W12k6IR3dYFmTrcl5SUNEHYldh7s7OY3GKR3/+FkKKj/GPjuSSUSpB9tC
         NnnnsR5ZtACUUHhaBzd8yAnXJC9OGeOkHOuogvP8WfW5FB2xkhWwvdMxZY/zYg671mD0
         odT4TmKk3OcfLY9KuLhFuA+IV88vbxvn+z3h4Rnf7e8etz4PBzNLqpxTm1fTaRCZsbut
         6rVY5eGvwapFx/zsVp8MXlVRSNGyHjoI6v8YPfuGrAEDM3nxMM6ZVoDqPMdVbG6GDUwc
         1NEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778166194; x=1778770994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfwL0IR2TBH/E3PXnQJJzUTG0JVNK5KPPKWisd5788M=;
        b=fq1i+9ZHOPveEP3I3DndWsaBORY0eMGL1fl6WP7Y2JpgFEE0T4UuD1/Sk1UMel8nY6
         wR1aPfjSBrG48cdUr0FPhBYExmoqWw6p1vm54DbMyQO7lM/g9RvFOLNsqfDR9VUflxDd
         /6XEvl7YSvqQI8BANaYJuzlY/xW4cTv4wg7B8KHrAabG9v9KrTnjZVCv0pIalCY7v3dZ
         C44yat2Ni/RBjs/DgOYm3ofmRufi/UJQA2/tJp0r5jiWEBGR//vLv2HF/nEwXdgryrkm
         tue8G0spC/ZhneHq6kYf5O5cgvTjO/tLhVLfDcm/aDA1WC0+HqVbPsJFPxFlP+wRyQRK
         hS8g==
X-Forwarded-Encrypted: i=1; AFNElJ9U1Kzw9HGOLxtvA6vhYQ0bCdfBFQD2evRSX7Q10zHEhz6E/ZhVsmKT+XRrS5TmPhv/ADNJ9dI15gUP+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlHyTkRMSCY0fnMzCPdNulqLiCEOPyYKdn3Af6mMSoYX/toWU8
	+TOykz6/q2+I1n5u0pKXHRMMDw8j7SN2xfieuiIYO/optxOp3owfuPuvj4MvEZIhDm24LWABMG4
	vjL1AbWr+K9kqd4S7axzcwXF8AYMHmf0jzdTORBTfeg==
X-Gm-Gg: Acq92OEsJg8O7IeiGmsS6OMhSEXW705f+PJts21C7ECYRrnhY32JfcxqH67zoiExXva
	H3S5UUbM0gGWHrfb7k55ieDwsl7Sji/h4j3B3deZWQQzJaIJUEEYFQvFYkeXpUrXTvi+Q4KRm3V
	WiMbNWWYy70CNvYBrI/aGe9auyJQkohmTCTUtTkcGwXImZqKdaEY5mZH2ylolrOz/PlVkLbl8fE
	sthByajmKDVS7H5bvxYVFKRppgRrlIJtrfSoEJfYEKHOOP5A3cUqzViL4Sva/NkjdCo6G982GL/
	Kmwb2xMCAfRe5SfKwzzyiBUCxk8KJb62VAVeH2dJZz8HTl7P76nGud7tnY1OZcIFfj64bPvxcFb
	fZeZKmEMsGebnUdpW0/UxQ5C0gXEzRqR60lnGNGS6oBKAAQ==
X-Received: by 2002:a05:690c:e642:b0:7be:3f86:e763 with SMTP id
 00721157ae682-7be3f86ebe5mr42151397b3.1.1778166192338; Thu, 07 May 2026
 08:03:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-media-imx355-v1-0-660685030455@raspberrypi.com>
 <20260506-media-imx355-v1-10-660685030455@raspberrypi.com> <afyjZ-wSfwm4jgnH@zed>
In-Reply-To: <afyjZ-wSfwm4jgnH@zed>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 7 May 2026 16:02:53 +0100
X-Gm-Features: AVHnY4JXdRLJZx1qCcgl2owYV56PaXuD0E7YZ5C_c5NkJTEIgfVq2k0ecapnoAE
Message-ID: <CAPY8ntDXXGiTxVj81X1iaZ2CpSj6HuYSo0idic5XqRDLDodPDw@mail.gmail.com>
Subject: Re: [PATCH 10/13] media: imx355: Add support for get_selection
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 7B5384EACC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60827-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,ideasonboard.com:email,raspberrypi.com:email,raspberrypi.com:dkim]
X-Rspamd-Action: no action

Hi Jacopo

Thanks for all your reviews

On Thu, 7 May 2026 at 15:42, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> On Wed, May 06, 2026 at 07:23:48PM +0100, Dave Stevenson wrote:
> > Provide all the cropping information via get_selection.
>
> I think this could be simplified if the driver is ported to use the
> active state.
> See df3ef05b51e02ef9386346288c1e63f366372f5b
>
> I'm afraid usage of the active state is warmly suggested nowadays,
> especially if you're adding code that has to deal with ACTIVE/TRY or
> initializes per-fh data in open().
>
> Is it too much yak shaving to ask ?

As this was an existing driver and I can't test on the original
hardware, I was taking a softly softly approach to ensure nothing
broke for the existing users.

Tianshu's email address is bouncing, so I guess Sakari would be the
one to know if Intel still care about IMX355.
If Intel no longer care, then I'll see if I can find the time to swap
it to active state.

  Dave

> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx355.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >
> > diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> > index 5a3bfcd0f51c..d8d7cc0ceab9 100644
> > --- a/drivers/media/i2c/imx355.c
> > +++ b/drivers/media/i2c/imx355.c
> > @@ -88,6 +88,11 @@
> >  /* number of data lanes */
> >  #define IMX355_DATA_LANES            4
> >
> > +#define IMX355_PIXEL_ARRAY_TOP               0
> > +#define IMX355_PIXEL_ARRAY_LEFT              0
> > +#define IMX355_PIXEL_ARRAY_WIDTH     3280
> > +#define IMX355_PIXEL_ARRAY_HEIGHT    2464
> > +
> >  struct imx355_reg {
> >       u16 address;
> >       u8 val;
> > @@ -671,6 +676,7 @@ static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> >       struct imx355 *imx355 = to_imx355(sd);
> >       struct v4l2_mbus_framefmt *try_fmt =
> >               v4l2_subdev_state_get_format(fh->state, 0);
> > +     struct v4l2_rect *crop = v4l2_subdev_state_get_crop(fh->state, 0);
> >
> >       mutex_lock(&imx355->mutex);
> >
> > @@ -680,6 +686,11 @@ static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> >       try_fmt->code = imx355_get_format_code(imx355);
> >       try_fmt->field = V4L2_FIELD_NONE;
> >
> > +     crop->left = imx355->cur_mode->x_add_start;
> > +     crop->top = imx355->cur_mode->y_add_start;
> > +     crop->width = imx355->cur_mode->width;
> > +     crop->height = imx355->cur_mode->height;
> > +
> >       mutex_unlock(&imx355->mutex);
> >
> >       return 0;
> > @@ -886,6 +897,52 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
> >       return 0;
> >  }
> >
> > +static void
> > +__imx355_get_pad_crop(struct imx355 *imx355,
> > +                   struct v4l2_subdev_state *sd_state, unsigned int pad,
> > +                   enum v4l2_subdev_format_whence which, struct v4l2_rect *r)
> > +{
> > +     switch (which) {
> > +     case V4L2_SUBDEV_FORMAT_TRY:
> > +             *r = *v4l2_subdev_state_get_crop(sd_state, pad);
> > +             break;
> > +     case V4L2_SUBDEV_FORMAT_ACTIVE:
> > +             r->left = imx355->cur_mode->x_add_start;
> > +             r->top = imx355->cur_mode->y_add_start;
> > +             r->width = imx355->cur_mode->width;
> > +             r->height = imx355->cur_mode->height;
> > +             break;
> > +     }
> > +}
> > +
> > +static int imx355_get_selection(struct v4l2_subdev *sd,
> > +                             struct v4l2_subdev_state *sd_state,
> > +                             struct v4l2_subdev_selection *sel)
> > +{
> > +     switch (sel->target) {
> > +     case V4L2_SEL_TGT_CROP:
> > +             struct imx355 *imx355 = to_imx355(sd);
> > +
> > +             mutex_lock(&imx355->mutex);
> > +             __imx355_get_pad_crop(imx355, sd_state, sel->pad, sel->which,
> > +                                   &sel->r);
> > +             mutex_unlock(&imx355->mutex);
> > +
> > +             return 0;
> > +     case V4L2_SEL_TGT_CROP_DEFAULT:
> > +     case V4L2_SEL_TGT_CROP_BOUNDS:
> > +     case V4L2_SEL_TGT_NATIVE_SIZE:
> > +             sel->r.top = IMX355_PIXEL_ARRAY_TOP;
> > +             sel->r.left = IMX355_PIXEL_ARRAY_LEFT;
> > +             sel->r.width = IMX355_PIXEL_ARRAY_WIDTH;
> > +             sel->r.height = IMX355_PIXEL_ARRAY_HEIGHT;
> > +
> > +             return 0;
> > +     }
> > +
> > +     return -EINVAL;
> > +}
> > +
> >  /* Start streaming */
> >  static int imx355_start_streaming(struct imx355 *imx355)
> >  {
> > @@ -1062,6 +1119,7 @@ static const struct v4l2_subdev_pad_ops imx355_pad_ops = {
> >       .get_fmt = imx355_get_pad_format,
> >       .set_fmt = imx355_set_pad_format,
> >       .enum_frame_size = imx355_enum_frame_size,
> > +     .get_selection = imx355_get_selection,
> >  };
> >
> >  static const struct v4l2_subdev_ops imx355_subdev_ops = {
> >
> > --
> > 2.34.1
> >
> >

