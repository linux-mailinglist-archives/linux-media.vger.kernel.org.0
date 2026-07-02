Return-Path: <linux-media+bounces-66398-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p2z3FKuoRmrFbAsAu9opvQ
	(envelope-from <linux-media+bounces-66398-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 20:06:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 406476FBD7E
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 20:06:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=skBnxsl5;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66398-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66398-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 87E7B311B7AA
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 17:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837983446A7;
	Thu,  2 Jul 2026 17:09:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B010340408
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 17:09:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012191; cv=pass; b=H6dbXIm9lC7+fsmyUU+7XWUM2swA6rHGj/KG4uy+SPS9rp+nMxXzDN3feMEGPZphKRfKGQX+kFjg6istzgC9xZJyjkvlaAjDYx7fLDTN06zkgWHYAWtuuta1n9nDEY1ebpFB+ITMkgRCx/6t9kA/XLYACr0ZcCYlVHCHejpO1ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012191; c=relaxed/simple;
	bh=BAZmDFjInsRd0/jAPLMeH6+hWiukVwrq1ahDaIxqmzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VCmrXXQfymKm6x8DLybLhzWFMQmlVZQ98Addtlp1V8KRV4UZg+H6H3zrXegc93lks/n5NTStcAkLbFbZg0i3BH51E49GcvPzrCuBlDtveGikYSv9Kh7k76/J6qNfCRjBQJ1dj7gFSb7OwwSr9wg/FDjWvixpo66eP+E4h6ecjg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=skBnxsl5; arc=pass smtp.client-ip=74.125.224.47
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6649ffb1d01so3055555d50.1
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 10:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783012188; cv=none;
        d=google.com; s=arc-20260327;
        b=TXidb+Tx/86a7rzcxq1KOl1Y2Ea0jp2eqKvXTSx8CCdtja1iuGr0cXXEfixPjdycED
         0j+3ythmfFXiphmwIkVq1dSnIgNA++SgsuNUBl2p7XxCeJe/Ycx4zcxs+ptSoRj5C6oZ
         Uf5RWkDNtN2OJ0yYxxl6wXE2PvmqE8xRXigo8NJNkEx6Ua1d1TnKnWUfi10tnzh+0eu5
         Cz3x4hYkLFW1KSbLnKY6r/9x00izYLZVZDjITKUWe73PLUu2sJcmwA4FHXRu3mt7g3os
         6nGnC4daDb07mGtaDFLWFhooxHs5/LUIVn9vwstbUEC+BDhPrATh9/dagNUKnfDuFz1q
         ousw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aosjOMz8Cr2No4yAjiLxXL7fTA6HSNbut1IwTzKZK+k=;
        fh=wCgf29w5Tfiwiv5ySPc/k82f0CcZCa01Bp13MVBRgUA=;
        b=NxQ0H4pbj6O95UxmwzVYDj2ibcXcfi4H2dOhoDdNfp9c2vh56cySeIoT1562BlQKnR
         4kjkNSEFk/Wg8bK1G0LPnLCRgJQYqYM2jB+jRgfTS7LfSUjDuB5wvTtS6GHz/7TbWl9u
         /K3m9524yDdjL+qVm0w69StJCUEWzGtGLkxLgTgrlM+jGqOmGjX2pT3jsR1gW6k5GHyN
         EK3QSQASassYAqCVz9GOzkz07gxpaLM28GgvjfDMa9TE3QwrOv0igHKl7Ogzas84bhpV
         wZPT8Ze+UgdhZ3dYjDTkvIY3njpY6dY3z6r47w4Gz6NS8BXDu1HgdeHNle7117boeVpb
         fSXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783012188; x=1783616988; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aosjOMz8Cr2No4yAjiLxXL7fTA6HSNbut1IwTzKZK+k=;
        b=skBnxsl5tNXGtreLMrwrKhtT6SHOKYmzvB0GGWEI3375cm8/26SM09h+BRzuKbIaE2
         so9BPHbTex6X3GCEqR++Oc6sMqF1KeIJiz4w7cyvDooDAgGqJzhFnIJgIDSFzcFM6fn4
         Wd00EdoQbAjxvXc/z8KGdNtT55Gy5FSuhueqOvfluFTlCgLhxRO0WcYRYm+7UJla6w/Y
         2VA6+GqPeWAsnZFrcJUTrzcH1zNJdRTHYGyIPtcYmvsd1F9Bdf+jHXHVoOH6n47uA5vy
         Lt2cyEIPYcAZ+LsJViGX+kVJ93/z/NG6kZosnRsBrkHgNixocR903Wxrps2uUHv6+KDB
         Gohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012188; x=1783616988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aosjOMz8Cr2No4yAjiLxXL7fTA6HSNbut1IwTzKZK+k=;
        b=o0ZGjHOFepQQzlYVCKCcjj0UhfLT2q7W0oRe4amnK811/m/DtlPGwlYq49iJYeAZG/
         JOr/0qWDIpI9+1x2OM0FP9UnZqBYOe7y+AJ75QSVybme+u5kbelklDAVecfy1P5vvYic
         A0lBNx1yHenHMJNYiNWCS6zrQ6h0brjnNDbYtBHKPTYlzOUxJvHhWhNSoZAKqso5s6VL
         vfqs2lFQiR5yQ1XnRXb+dRmLBP8mTL+zf0CttrPh8IADmwEWoqzxbw4kJ33IxIQWxcdn
         z+bDUsgZxBz4xIeLw02xG1u9hMFuM0aTb5oKdAyuIT6KWTnI3LE5uGtcugDmzzyRVc3a
         gLkA==
X-Gm-Message-State: AOJu0YwSThGOtgH2s7HWQezT06ITvg0LckRCEbjWAh/LrNtG8Ygj1q6F
	5NrVyAdiRobbbWdOCAxHI2m9fYwohyZVRc1V0MkJxb0Mknqkbg3g3jnkvaQZM1ByzKzvqEH8SSf
	09QKcdAEPHYQwlCtUKFX0fjrYStgRZDGZQyiGDcMYKg==
X-Gm-Gg: AfdE7clY5kNU0DMNb/jt0zO8T+60kPJnH1OEMZkVNlQdiOvt9x1QVb2TaUtbSEC3oDd
	64hMVuJvPJVRNZWftNiOf/5QOTEYBh6orW1M+rDpAQsO9+eSqQ5xGCMbSsjmx3TB0om3Nd9efel
	oA06Wo31Y0Co5XMhyJkJDHjMibk+EIzpbcyUvIr5cl6FM80NsFFijd64MnYzUsOw1dfWyB4J+dh
	KRng4kPzmJW7K8EcTde02FaJ2ZsvjXMcztYWamgoq3ekAiEToZx8KH14/r9A9muMeoTc7kJzjAC
	xkMmKSz9bDrXOIpYDfHvptkqTDEkADUQW9pAo8JZLLs9M2UyaE6XWDlDrO17i/SC9522Mxk9WBd
	6LBQKQ5MxZ2ZCaA==
X-Received: by 2002:a05:690e:1916:b0:664:ae67:b668 with SMTP id
 956f58d0204a3-66521b6cd25mr7056968d50.68.1783012188118; Thu, 02 Jul 2026
 10:09:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com> <20260701122634.1728782-3-sakari.ailus@linux.intel.com>
In-Reply-To: <20260701122634.1728782-3-sakari.ailus@linux.intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 2 Jul 2026 18:09:31 +0100
X-Gm-Features: AVVi8Cc8NFl2maqdepwnvlT-8lCK0s9g7JtFblzf7YOpY3dw0-x2W4wbG01UYHQ
Message-ID: <CAPY8ntD7dQCbP+9SYKKtEATLgZSz82rjVzAOMr4Rc3h2a74PHw@mail.gmail.com>
Subject: Re: [PATCH v6 03/16] media: imx219: Account for rate_factor in
 control steps
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, 
	"Ng, Khai Wen" <khai.wen.ng@intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Rishikesh Donadkar <r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66398-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 406476FBD7E

On Wed, 1 Jul 2026 at 13:23, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> The controls that are divided by the rate_factor before writing them to
> the registers have the step of the value of the rate_factor. Take this
> into account when the control's range is modified. The controls are
> created in a configuration where rate_factor is always 1, hence there's no
> need to change the code adding new controls.
>
> Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 05d9737bdc95..2aab6e7180d4 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -319,19 +319,19 @@ static const struct imx219_mode supported_modes[] = {
>                 /* 1080P 30fps cropped */
>                 .width = 1920,
>                 .height = 1080,
> -               .fll_def = 1763,
> +               .fll_def = 1762,
>         },
>         {
>                 /* 2x2 binned 60fps mode */
>                 .width = 1640,
>                 .height = 1232,
> -               .fll_def = 1707,
> +               .fll_def = 1706,
>         },
>         {
>                 /* 640x480 60fps mode */
>                 .width = 640,
>                 .height = 480,
> -               .fll_def = 1707,
> +               .fll_def = 1706,
>         },
>  };
>
> @@ -458,8 +458,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>                 ret = __v4l2_ctrl_modify_range(imx219->exposure,
>                                                imx219->exposure->minimum,
>                                                exposure_max,
> -                                              imx219->exposure->step,
> -                                              exposure_def);
> +                                              rate_factor, exposure_def);
>                 if (ret)
>                         return ret;
>
> @@ -887,7 +886,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>
>                 /* Update limits and set FPS to default */
>                 ret = __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> -                                              IMX219_FLL_MAX - mode->height, 1,
> +                                              IMX219_FLL_MAX - mode->height,
> +                                              rate_factor,
>                                                mode->fll_def - mode->height);
>                 if (ret)
>                         return ret;
> @@ -905,8 +905,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>                 ret = __v4l2_ctrl_modify_range(imx219->exposure,
>                                                imx219->exposure->minimum,
>                                                exposure_max,
> -                                              imx219->exposure->step,
> -                                              exposure_def);
> +                                              rate_factor, exposure_def);
>                 if (ret)
>                         return ret;
>
> @@ -931,8 +930,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>                         return ret;
>
>                 /* Scale the pixel rate based on the mode specific factor */
> -               pixel_rate = imx219_get_pixel_rate(imx219) *
> -                            imx219_get_rate_factor(state);
> +               pixel_rate = imx219_get_pixel_rate(imx219) * rate_factor;
>                 ret = __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
>                                                pixel_rate, 1, pixel_rate);
>                 if (ret)
> --
> 2.47.3
>

