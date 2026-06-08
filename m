Return-Path: <linux-media+bounces-64224-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c9K0AwLtJmpWnQIAu9opvQ
	(envelope-from <linux-media+bounces-64224-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 18:25:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A2F658ADD
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 18:25:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=HFptEpE4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64224-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64224-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C4C93297BCA
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 15:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51EA3D6CAB;
	Mon,  8 Jun 2026 15:45:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E726A3D5676
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 15:45:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780933519; cv=pass; b=VyiNZiOAyKGEFzaBY3GdmMOkKPMbjfvO5ISvl8oDLvj6TqNhrrvD9mzZvtZF5LnxaOTes4m8n8mW1hOVdLifM+1ieSF0Gf4AfYJU1khDlbCdou/nqcFkfQx+QhfmSt2lrhKqdBv1X8E911qidPw6yRvSZgMjFYsEfpd0F9A09Tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780933519; c=relaxed/simple;
	bh=YVNNQmM2+NURr+DmmZb+XKoqzewZOt4WrXPI0y+13Hc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aqhv10Zlroow8Ycf8vFFj1Xj/BTSw2z1DTPKF1xiWbEoKOpEk/CTo10kvAE2RaKkocdhoDhuVospAVMt79yPjvoaJAHT//Nybw6UHHbDP8DXUcOAWVsrIuLJ7zukzA17tuKwKJ6eByZP+nE5tCWTMGHi5pA6q4CjKmreMvp7QQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=HFptEpE4; arc=pass smtp.client-ip=209.85.128.177
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7de68222e96so44343157b3.2
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 08:45:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780933517; cv=none;
        d=google.com; s=arc-20240605;
        b=O+Wescox4/Y2o+JaBRnsBuG0mMDVqj4vZL+dYIoGhC83fEyYid71jOYmdYhxTcZGvy
         rks4m1cCQ/2OOgRBRlAJMsXLLj+Vvfa7g6y5f3L5d/qOPaB4CXD74iBIZOCm2Pa7ij1y
         QhbfFMgdalT+s9ZoxhmOV6Uq6/yym9RzTV8DNTDEYd9ULyaMPCEOSLMBFONxVCaiEs9w
         yUP7al1MDDbYm0WhzNHL2J9OdcUH0YIGRn6wX5ASoZ6cULe9LU1wHx3HbUCHsREUo5Tx
         kCjyVy5vIYhxGjf+I172bc6Im/FVPUQi6RlbW7Fl7ppHpdDTn0VDHaDHK0Aj2csXbRQ6
         nO/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PEExMcy9UryCqZUp+zT2BAVO8vaOh7PT8QhYk24DmcI=;
        fh=wCgf29w5Tfiwiv5ySPc/k82f0CcZCa01Bp13MVBRgUA=;
        b=D8rhyGt3ar8uo4u2c2NRXvHRcfhiZnWU4cBqCslO3OFpU6MVUILo747hcUR3VCAnPl
         sf70U+nHC6ZX3+mjwQNYZsx3bZ5jm7SUJ88QDw77rEkZRvFwpb7tWvW2SoXHQllA2GLL
         iNuK6YIlL/iea9KqA5JVRsSHcHsUYIZcnAghF/sCwd8y26kALg9I5MpLzn1tmY+hd3iv
         NFBIeeT97eQfQkFM+K6midxNo2b4g+abNmFYldWDImZMdSTDrxpxN38fitd5bxz1EHWD
         +umeund+oaTWUOowPvQ0mLSDH5pa2IQdqBthSnCDfdNPlLz6fgND8rV5XRzYX8CEFdi9
         818Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1780933517; x=1781538317; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PEExMcy9UryCqZUp+zT2BAVO8vaOh7PT8QhYk24DmcI=;
        b=HFptEpE4enl5CbvV3620/uxShQRibSuGYkPza9yYktFHCr9KW3//hjEAIVrVDZHAu4
         pPSuqWxNoovwnJNXunrhjJAy7iVTzUBtF9tvwXzpEGeiAaj4j8O2R3cGOVeZO8WwSM/V
         h1q/cGzA9dHhhsFvS5qHIYLX2SniGYG8iKMCvHenEqVZ5s9O0emyVt8n207qcrZIr5yD
         U0Fs6/xtdmIJKg/dwLN6CoyTFxiaZucuqh0oVmM+aMvppBp4/fmQVkULzq1OcYyhF+Eo
         kJ0vLGQZ+bkvmZEVi2LQZVjBFnRsAxuBCegtld5knjZnhcbB0c/z2N8WM7g7uW4KJudP
         V7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780933517; x=1781538317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEExMcy9UryCqZUp+zT2BAVO8vaOh7PT8QhYk24DmcI=;
        b=KAkEKgR0aTJCG1uH+6Oe0JeY3igrrcUnZkkqjQYGe5kjimA9YhqToh5W7YevL6M38O
         giknRccnjPjdx1T+BI2WmUOvKlfwDu7eUPsMv5e0kEnXu7ckUPghw+bHtz08CbR360lO
         X9ukag34nGzOo/VHsyBhDS47ksB8QfR+U8JbZChEp8rEiSYicPq/jS4VWjA7EFESH5wu
         o/5WXWE+KcDOp8AuCDZVFOse8J8cX/TuCBZEN7y/LgxUeVczOsmMbwBtZ4TGM6dk/yyU
         sYQgxYC5EtgFijmLuYA10T8vtQInraY+6r5AMbkc+Yy/eDkTQX8B0nbkEL6lFKoTy+th
         hvxw==
X-Gm-Message-State: AOJu0Yy3PSus/lXMiNZM9mO2SEPaC67rFwBsWkI+We5tL/Tyc18Z1vju
	jPnYzCV+xJstgCWcpo4BnppOrFDN+Hi/xew4iqqUCweFXQKimRLsPg1/P5gcHmEs55wkpo28QDF
	PBmSRUEU2oFroJxd3TKhEbvm55/9/Qk/tMJzESHvbQQ==
X-Gm-Gg: Acq92OFz6m2GTSadidC+REQJG/ERI8rsVaIYR9dPQqACchUyiPkmukbn+SjUAFKKA8F
	tdoQFsmuGB4wtmSbBXZXSLNINeiteuBXmecHo+SshUK7XlZ3BF+sWiIdG2KjcPkaShysXGKo+El
	LUkTDJni9acu3ZcsfeqaTMLx3TkC3X81Jt3ePIFR10hCydV6/n6e79xO991j3IJNNxvrVPIojEF
	boHbwZEYWa6F2xjCuc4g8tIkSV4Vhhfr8iB4xq+HdNkEFyLPLKk//B7p9fNFsHE6IdRfzOvilYt
	cAYJ3taOZ5PRLw90ECmNMacCSXH4TUPIi4H0iS1Sz6mRZ0XbN9lgLnCSJmXdwgZPWG5ErVBrLP0
	llo1gZ6rEAK29e8DGUg+6eymXU8tBl+ONqhQ=
X-Received: by 2002:a05:690c:6d01:b0:7de:700a:8eb5 with SMTP id
 00721157ae682-7ed0ed50f25mr168573337b3.32.1780933516925; Mon, 08 Jun 2026
 08:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com> <20260607215356.842932-6-sakari.ailus@linux.intel.com>
In-Reply-To: <20260607215356.842932-6-sakari.ailus@linux.intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 8 Jun 2026 16:45:01 +0100
X-Gm-Features: AVVi8CcW9mR-W8XMZSVmDwFiqnIistWvBXz17nHOdGDOmcOqxQ1II9W6hDAhsQA
Message-ID: <CAPY8ntAZTpabaRu3cCg9oncpdZFqpm2tkE7uCzJ9sBb66ecmLw@mail.gmail.com>
Subject: Re: [PATCH v5 05/10] media: imx219: Rename "binning" as "bin_hv" in imx219_set_pad_format
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
	TAGGED_FROM(0.00)[bounces-64224-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3A2F658ADD

On Sun, 7 Jun 2026 at 22:54, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Rename "binning" as "bin_hv" in anticipation of having a variable called
> "binning" for another purpose.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 86683fe8a79e..3aebcbaa3fcd 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -837,7 +837,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>         const struct imx219_mode *mode;
>         struct v4l2_mbus_framefmt *format;
>         struct v4l2_rect *crop;
> -       u8 bin_h, bin_v, binning;
> +       u8 bin_h, bin_v, bin_hv;
>         int ret;
>
>         format = v4l2_subdev_state_get_format(state, 0);
> @@ -870,11 +870,11 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>         bin_v = min(IMX219_ACTIVE_AREA_HEIGHT / format->height, 2U);
>
>         /* Ensure bin_h and bin_v are same to avoid 1:2 or 2:1 stretching */
> -       binning = min(bin_h, bin_v);
> +       bin_hv = min(bin_h, bin_v);
>
>         crop = v4l2_subdev_state_get_crop(state, 0);
> -       crop->width = format->width * binning;
> -       crop->height = format->height * binning;
> +       crop->width = format->width * bin_hv;
> +       crop->height = format->height * bin_hv;
>         crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
>         crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
>
> --
> 2.47.3
>

