Return-Path: <linux-media+bounces-64223-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oPJjI4j3Jmq9owIAu9opvQ
	(envelope-from <linux-media+bounces-64223-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 19:10:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B93E0659193
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 19:10:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=fb3NujzH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64223-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64223-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 472B7335FC80
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 15:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6FBB3D332B;
	Mon,  8 Jun 2026 15:43:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02512F872
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 15:43:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780933384; cv=pass; b=c0/nZYhOPe5C27p5/tjXSobBvKv5Cp0VgtDbyIpUkX547j05iymu2EGVVMVmB3MvUHGZkWqZYsZVICbBMLc1X29FSn47+1u/13IPvUG6SVRVgBeXZh27YF2Q/5n8P6anoI5SecxZn3ihKUX687ay+B2ghDWpC4QjN7ZX21lStE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780933384; c=relaxed/simple;
	bh=a9TcUpjfOjorCk/Ow/3NDAEq0DcBWnK4jhvNq5TN8nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tjuKmBdRAY1gGL+g5cF6UF9fnPbOeLjCSQP/4BdiuMfmcVJ/P0oYsEcAE8IqnR2OI4owC/Sf6Uie9tga17uJy4IC0jxYo32DzvU5HdTL4qwVJjxcI0rLLghtP91OMhAmE+RDi/IneS/cAleLUQl2vHyUFRvMYBMyMM5wG1xLMlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=fb3NujzH; arc=pass smtp.client-ip=209.85.128.177
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7e86d46b02dso47735987b3.3
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 08:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780933382; cv=none;
        d=google.com; s=arc-20240605;
        b=Vy6GXv73GJ1tpBI3q7xK4bKQLetbrKq52YvJCO8gq2c57CP0D+23pxyxU+DZx9y79h
         IlSCgd7aNrmYdtETe1VfxGzhvBYA+Y+nC8jM8EV1SDz5A7H2WLqp57oNxEBf2uhk3bV9
         3NGprxeNbbISVaH585F5VJVoGdvm9LHGnrE58b8lQonJ9VhwRm7DW99IU0IVc/4b9Im4
         stCTbS5/Vi1ezNYQ8sICR0PJO2u8MY78+e3hqFd7NyZEe9nqFllK7O864KffT30vdit7
         q+/ojpUJRCJelttxB033orleJkR65hfxpkOXRjdaF3/9+AzwiP+0gGeKIl+xqAB0gWBa
         lkxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YGTYYw6QbTmVPqmw15MO3oeB6fhPnFLMXhOPR7xzWAg=;
        fh=wCgf29w5Tfiwiv5ySPc/k82f0CcZCa01Bp13MVBRgUA=;
        b=HChpTeuUK9i2idlTgLVxdu/amzvFwioeOw3s4+bDjpw3Aq/i76jdXJ5kNust/IQofH
         SxXBdmgWpcU2NFvRvNpDFPSStPgM/+eHAXO/mu+62ZlDLtf6DKGHa/d9qn+zxHpvCVxI
         M/orciyb+OCzEIUaVdgjM5yYBI1xQSDmpl7IghKqwAOdh1hegxwlYswkTpNLtKH5yJTC
         R/8XtOkAP9R6+BtMsuQIXdKyRoQ7n8xQfXOFe3zO18T/xtK5lqnUbBp+1p6r7o0jzVjU
         DaDIHIPsS/8xhl100tnsT88v/X15ZLITqBYdG3YxH6LMl7zfvGQ92imsAQ7jaOOIHpnQ
         OXRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1780933382; x=1781538182; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YGTYYw6QbTmVPqmw15MO3oeB6fhPnFLMXhOPR7xzWAg=;
        b=fb3NujzHqd51f0L4ngoxREOR3ecmeTe0LPjqxes9C3Y0j3MkLsiQCU2PyvUed6GpIG
         a/zyR5M56B2aVOEpbrtaVbymUlxyf5buQuAEAnVgY1SoUEaZ/xuhnLFZpAYG8o+AYooh
         UuXLq94PGSbdtaV7dQ1OtSJc2Ldq92etbNjqJeCPONGTjo9LxYAlxP7kuCwaVYRQrjO8
         WRdaHh3FS1b4X3SXpYDj/0NUvu/e6gLZVALxJefen7/wT/3JaodgShUGSxDj4oX7EBqx
         p/XmY+3zBd9+19TvLpVlfos3YcwR+NG0uBT11ElLEfVrlRIzYKGDodasAi3fxLzI91Iu
         u8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780933382; x=1781538182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGTYYw6QbTmVPqmw15MO3oeB6fhPnFLMXhOPR7xzWAg=;
        b=Zss+M3tLUXErsShF6N0MoqXDrO2clRQXk8eJpC41HbNi/sMNpQeyZF9mkwDuhApWJZ
         eG2YBqm3c6htpshg+dXepZDrrLYHVlhEZTnWJZLmoFjXe22hde+L5McSDJa/VJ0ZIKmR
         nyn5PPOolRIqingY1Q0ATRMMYJKTBv8X9kO/MtzN2rB3S6iZarsM1o0zOzHXVKf363Bq
         NBQ64nX/SbgyX4sym6ambbXQBkDiou2un9wS+HzA8md8odHf/U10YEpMj3V5iu6tXCPt
         sX0oycxqFIn7G0h5XJWEMFIv2jtfkB7N0ykenzzdtvCP5B094CPLD+VRUXPk88lNHq5h
         W8FQ==
X-Gm-Message-State: AOJu0Yz4ClFrSw4VL96iQCgLCLu7EBFkXn1y3Yuss4ZBHQDIWKtCPYTe
	cc0DPXFbjvYRGN9oLQJppcjf4YJsbPkeSYJcnFx2OSEblSm129pKEcTY+5GNVTtyXlUjw/9aOdc
	JKSvLeTxNwNBJszjwMhDwKEFHeDBjDtcg8yNzD4F+bw==
X-Gm-Gg: Acq92OHqLEiT5X0Nt1aHokPC3i/wRbLS/83bp5TxVhickf2jM8Q1htjig6/iJ6jCRDd
	x6N44Yf02XQ/F/nmPmkVT7W78C1W4t2I5wjkiq0J6dWz6hC5YDGd6ONesvQjqQRnlPP78cYhzNI
	rCUSQU+PJOcGdgizX8QE06XWM+4I00oHue9zEHk4SPVPTa+pdaTxbBgbGYLx4HmPVW/n2wOlBXQ
	BuYoa5vSmos0Pdqot6fisDkdrdTbdJwaAlCZgdUJJtraQbQWJBSpxJDBV6DHUGaWhlfPT97MZlk
	JPbYxdL8zPY146rGnnDl8wO/VPGAD8t65hDA8F/Dd/C4mG52xHYjaTRjgZ/735gKDsIXpaeAxV1
	hE2vgmWxajQ++SKUvQPjHpqN/la4R3ROjtuI=
X-Received: by 2002:a05:690c:350a:b0:7b2:bf20:cdc3 with SMTP id
 00721157ae682-7ed0935434emr154604757b3.0.1780933381744; Mon, 08 Jun 2026
 08:43:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com> <20260607215356.842932-4-sakari.ailus@linux.intel.com>
In-Reply-To: <20260607215356.842932-4-sakari.ailus@linux.intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 8 Jun 2026 16:42:44 +0100
X-Gm-Features: AVVi8CeWXBjZ6DjY3fbdocw77wTqQ4dy19pUxEoTi9mLuLXVCPPiF5_rBopBLso
Message-ID: <CAPY8ntDPvDdj6vSVRUsTmC9tXmy8xNATrrbyqDr7DRU1NiiDQQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] media: imx219: Account rate_factor in setting
 upper exposure limit
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
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64223-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,intel.com:email,vger.kernel.org:from_smtp,raspberrypi.com:dkim,raspberrypi.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B93E0659193

Hi Sakari

On Sun, 7 Jun 2026 at 22:54, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> The rate_factor multiplier is used to multiply a few values in the
> sensor's timing configuration and the exposure time is one of them. This
> also needs to be taken into account in exposure time margin: multiply it
> by rate_factor so that sensor's exposure time margin is respected.

Testing the 1640x1232 mode with FRM_LENGTH_A set to 0x288 (79.07fps),
I can write register 0x15a (COARSE_INTEGRATION_TIME_A) with values up
to and including 0x284 without it affecting the output frame rate, and
without image corruption.
With IMX219_EXPOSURE_OFFSET being 4, the current code implements
exactly those limits, so why do you believe the offset should be
increased?

To my mind section 5-5 Frame Rate Calculation Formula of the datasheet
is fairly clear with
[ In the case of (frame_length_lines - 4 > coarse_integration_time) ]:
Frame_Length = frame_length_lines
[ In the case of (frame_length_lines - 4 < coarse_integration_time) ]:
Frame_Length = coarse_integration_time + 4

The register FRM_LENGTH_A (0x160) being in units of 2 lines doesn't
change that calculation.

  Dave

> Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx219.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index d8fe7db18b6c..e681f80f9e3e 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -451,7 +451,8 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>                 int exposure_max, exposure_def;
>
>                 /* Update max exposure while meeting expected vblanking */
> -               exposure_max = format->height + ctrl->val - IMX219_EXPOSURE_OFFSET;
> +               exposure_max = format->height + ctrl->val -
> +                       IMX219_EXPOSURE_OFFSET * rate_factor;
>                 exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
>                                 exposure_max : IMX219_EXPOSURE_DEFAULT;
>                 ret = __v4l2_ctrl_modify_range(imx219->exposure,
> --
> 2.47.3
>

