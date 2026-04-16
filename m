Return-Path: <linux-media+bounces-58922-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE4gN9z04GmInwAAu9opvQ
	(envelope-from <linux-media+bounces-58922-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:40:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A68FC40FABE
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D32F300D478
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 14:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3761A3CFF44;
	Thu, 16 Apr 2026 14:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="aw5VOOiD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F58199D8
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 14:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776350300; cv=pass; b=fqlIAg52qb+inkUe4YpcSS13h49J/aSBKd8SFv191vCy8LVpOwuE72fyMGaMqQffMrYl91RGoIfC07k74tLv2v3CcHj+osqEaq43XHalhMxdqjG7MkcSv7+O2F6FCZ4zitRY+CPQF1AnTk+CttfXq09+DXrR8lvme55l859Ofy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776350300; c=relaxed/simple;
	bh=KfKGPX27QCyAu+2rnkYsvqVEDKKu93Nkf4X+szsvhig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pxNLu0rNiueuND4e0RA0ns9WxONwssqOxZIusnJNWClWwXvjvOmL2476yoUH9mMIMQ7NI/YgSpHWAhxCxlnDgbvn3cCh3Uixj9sXr3fPkhBccvoetxs77mdGstZJ2Q6KShYGkrt9/1gdtXeVih+gU/qqlqdIumH1gfFBbQkJZt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=aw5VOOiD; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-797ab169454so114102647b3.3
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 07:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776350298; cv=none;
        d=google.com; s=arc-20240605;
        b=K45NoNe7Rz0Daq0uEG61T6tMd8I0+I4r5Z1AcqnWOL3Totx3CcbS08YQj8OYkOiYg1
         JLFWc6FCAqFYd3hSyhmH2nGhNhhAFeHF0Pjso8NRQ//ZsMcIsmAzeJanZWLnXeEW/5Lg
         QxeqonDqk62FNro4SODfFgm1ebHFRIProPR0H5yecpW+XDryZqyBq2YAkbhNaNiGwPFo
         CFpgHDuHF8uuq13T8ixVXFPWWCE+lZqoN7NgKNujJCWuL2aXwKG7ni/xPrTgrTTDGau2
         aYhKqL5vvuQrx3aFAnaiwmzq64+I2iYT4zrk6XY2oGlgB6NLWpWNZXl77WNiwGRYfwrg
         4yQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6opAi4Iogkn/uvmWR2cJVte4g/OrcvsH7g0zPu1oc3k=;
        fh=poxEuYayxbOo6pAs/sGjCxEJ/dy/5VwuC77GShYURnE=;
        b=csZrORyxvBGucr5Ym2POGu3I+AmAsoBAXiqgTUwrHVCzXpbX4Xr6P3kXRZJCrV9qTb
         RGGOB9ld2D8DzmntLDPeSjsQVw6NiETzoyuagqEdiSVztkEXTEz4GoSXXc5tA8DpJwif
         LJ2phoBzYIpb8LHqvJCmYqwn6iK/kOjflUMlrFyehEMxvi7CGqBY2y7qBOR72dNyWykS
         NsLBi2U98jmHLVt2Q43Bw7f9h1RFLe1z1IfZ0ci+oDDEIoqF+p/VP/3EvNLgYS5ZAUVQ
         k2hbc3UTt8Uo4ZWncCA/2145RwiQUJW5/uVIW6dp9V0mUC91hnRRhgvyMALK1V6XW50R
         vN5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1776350298; x=1776955098; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6opAi4Iogkn/uvmWR2cJVte4g/OrcvsH7g0zPu1oc3k=;
        b=aw5VOOiDBRzdkpNiZhaQtcx8OjyaImkrSQSikwz5tzupY/SioNOpE82QsG/Go4SCF8
         4dkv4cXvU/UZ99Kgvbda5j5PeeE0wJDFU2lBt1Hr59Eucd4ccfiANJKA4oTAv/S1uc03
         d5I1BBfum1EfcpHM6wCKi+cHHzDBoNakfpDRehimoEBYXDcrW67/CESevPjwThgriCdQ
         +6Y+1TemTNqb+KH8QjOO4C7yQMlZUq5GX8JyDvppDz2LSQ2cDmd41juRC5yEZ3iRJNrP
         urCRLtckqQdpeJIfc6Vk1Vhit8lARKPSGD+UxlFTUEWq7JO0Lsy7XVw9NNeypf740PxH
         +T1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776350298; x=1776955098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6opAi4Iogkn/uvmWR2cJVte4g/OrcvsH7g0zPu1oc3k=;
        b=OUCL0uFlyxlYoJXM++wRwIep/9f+4O0fufo/SMZLh5TibpjtsCu7g11iSg+U0nEPXG
         hdJjm552GfHyUqBwcH1xV2/V8KqkBARJ/vWFQ8LgSKia215tYmoq1vKwPfdq0rvMLkH6
         AGU6Am6X2VSUN5J2ZYBaOaPKzwVcSiksLw1rfUM+bd4CnUm+LwqFhROmQXdD2164x+HZ
         CccE9DpIhwhYniLNg6vHyvD8frrUNuFBky0cpdaq8VCNqRdV4m38XcUBKGyAEiL21F5F
         vu/S/m71rMMinqd5ao+jD0WGmTpzm4gI/st68tvPbpU8MdhO1XrnKRgLFfIgLJU5vZiB
         BdEA==
X-Forwarded-Encrypted: i=1; AFNElJ/jbW5Mi8fdme/Q0FD+PPDqgX9DYYOus71Zf+CCwUmlrxY1eEfIlcILvT+6sl3kujfeuyPhLa1N704flg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpLgBTF1Xuztqjc9KTkGFMT0gdJoPMRHmshd/GnMSELbpu4Tho
	vTNm5v+UwccUCRvsTvm7hjs5PA6CaPlhk76C+/a4DnYI1DDYgQfbcRTIm23OBBMq4q5aTFhw6yU
	udmwMKeFMOUyTy1HsE2nXJFgYoP0NA9f/It15Ke2zaw==
X-Gm-Gg: AeBDieup+NUPgq6YEfcTVB7C2CBLCRm+LosGMLmYRe2aC2/QpRzxHHf3u03fHY7f2Ro
	oZOKJ6NSSnTJ5wAonQngoBIqJqbsyowGVDz8r7TOVMje8FOVVJdFQK6GkKIpJKXvI31Y1FXOnp0
	NZCe5SXJx3prIy3tXgL3IcThmJjxRAHR/+viXRNpSXXYYUocMS6HfIuZzG5H8R6DNMXl2h3WPyy
	7RQvUuZsYgM8RbKyVzWkR2FY7u6MfsRono7JVpvXbNC13BoutX8yMa4ZDOPuODiVxX4fBsaLHN5
	vBlnBsOUmKTyEHYDdNTcBuuBzBka9AAVj/o9f3HVEWv9hhTN6A==
X-Received: by 2002:a05:690c:e3c3:b0:79a:5fb9:62ad with SMTP id
 00721157ae682-7af71f460fcmr281582777b3.43.1776350297628; Thu, 16 Apr 2026
 07:38:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-4-sakari.ailus@linux.intel.com> <adilL-DvNsZfELLe@zed>
In-Reply-To: <adilL-DvNsZfELLe@zed>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 16 Apr 2026 15:38:00 +0100
X-Gm-Features: AQROBzDr7bDt3ORQGcXrFRwWgOqjIciGAyJhT-txXc2o76xY9OMCkgI04h4TXyk
Message-ID: <CAPY8ntABh8fAkeBuXdOX=TUM7c5025SpHa=2bc-P60DMRBu2kg@mail.gmail.com>
Subject: Re: [PATCH v4 03/29] media: imx219: Set horizontal blanking on mode change
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, 
	"Ng, Khai Wen" <khai.wen.ng@intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Rishikesh Donadkar <r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58922-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,nxp.com,apitzsch.eu,kernel.org,ti.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,mail.gmail.com:mid,raspberrypi.com:dkim,raspberrypi.com:email]
X-Rspamd-Queue-Id: A68FC40FABE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari and Jacopo

On Fri, 10 Apr 2026 at 08:27, Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> Hi Sakari
>
> On Wed, Apr 08, 2026 at 06:39:12PM +0300, Sakari Ailus wrote:
> > The driver UAPI is mode-based, allowing the user to choose a mode from a
> > small list based on the output size. The vertical blanking is set based on
> > the mode, do the same for horizontal blanking so the frame rate obtained
> > is constant.
> >
> > Additionally, it's best to use a known-good horizontal blanking value as
> > choosing the value freely may affect image quality. While the minimum
> > value may not be the best value for horizontal blanking, at least it is
> > constant rather than a minimum value of a different configuration.
>
> As Dave suggested, we should probably better define the desired behaviour.
>
> As far as I can see the driver doesn't specify a line lenght in the
> supported_modes array, and I guess we're always running with the min
> valid blanking. From a libcamera perspective only RPi changes the
> HBLANK control value, all other pipelines use the default, so if
> Dave's fine with this, I'm fine as well.

The folks that it's more likely to catch out are those that are
driving the sensor directly with V4L2 in a video-device centred world,
not those using libcamera. They are in a definite minority though.
Overall I'm happy enough that it won't cause any real issues. I've
already given a Reviewed-by tag.

  Dave

> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> > ---
> >  drivers/media/i2c/imx219.c | 15 +++------------
> >  1 file changed, 3 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 89061dc1842d..62a23541b1dc 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -837,11 +837,9 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >       struct v4l2_mbus_framefmt *format;
> >       struct v4l2_rect *crop;
> >       u8 bin_h, bin_v, binning;
> > -     u32 prev_line_len;
> >       int ret;
> >
> >       format = v4l2_subdev_state_get_format(state, 0);
> > -     prev_line_len = format->width + imx219->hblank->val;
> >
> >       /*
> >        * Adjust the requested format to match the closest mode. The Bayer
> > @@ -882,7 +880,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >       if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> >               int exposure_max;
> >               int exposure_def;
> > -             int hblank, llp_min;
> > +             int llp_min;
> >               int pixel_rate;
> >
> >               /* Update limits and set FPS to default */
> > @@ -924,15 +922,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> >                                              llp_min - mode->width);
> >               if (ret)
> >                       return ret;
> > -             /*
> > -              * Retain PPL setting from previous mode so that the
> > -              * line time does not change on a mode change.
> > -              * Limits have to be recomputed as the controls define
> > -              * the blanking only, so PPL values need to have the
> > -              * mode width subtracted.
> > -              */
> > -             hblank = prev_line_len - mode->width;
> > -             ret = __v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
> > +
> > +             ret = __v4l2_ctrl_s_ctrl(imx219->hblank, llp_min - mode->width);
> >               if (ret)
> >                       return ret;
> >
> > --
> > 2.47.3
> >
> >

