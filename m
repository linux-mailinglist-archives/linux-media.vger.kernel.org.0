Return-Path: <linux-media+bounces-60905-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCQRNsSq/WmEhAAAu9opvQ
	(envelope-from <linux-media+bounces-60905-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 11:20:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F434F42BA
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 11:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13635303C63F
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 09:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD48C37BE7D;
	Fri,  8 May 2026 09:18:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158C833DED9
	for <linux-media@vger.kernel.org>; Fri,  8 May 2026 09:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778231887; cv=none; b=EGcxWFgHHHCq8x7+2hmoxPaMrBf6mUdOU+jveA2U6jv+G8DKuaUzgD+t3Mb9HdAI6Mo6fOfwdtsd/YB14tj5DcSw3huUvJPqF0TFxppyQEv+FfmfaWB44lwXlsA4UtoLRm6tOsCj7jXj6ccRbWllJOk06XJukd2VLxLfpX86TPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778231887; c=relaxed/simple;
	bh=Xc5j9CDKlFuLtIb9mG1NWd0Wa+Ic7rYDHKf0WsXQawY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2Ge+OexiFKcFWBUB7nyWM8lWj8k5/EWC2Ur2kJkehqWOzfGHvma62EpGXaTqrsQVnq0y5hAjIpddMElf4MtSAgV4HJu4WBRXWaJ48gSWpaBLT55yJCXlk1ELPCaEkJsHD1ozCIXncudVOKoRRBL9VZZ/hayKLQ627e/2dLoqeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-479dc6d26e3so1004580b6e.0
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 02:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778231885; x=1778836685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=freA64yN3LTk8GeI+Wxty1utrJRjkdarC4+05051tIg=;
        b=Yi7/ZPT7pOm18OARL5aoBIOregH8T5lo3JkukjXxRmrdAR9Ji9TDs+qWVg2xPfMjGB
         i3Het4mnic1aRn4FQ6aH85lmDvnzcUgaWyMlSaKs2hZkd9eDrjl3xyPa/eNbEQO2PLZ5
         1+b75mEBrc0ZjpWu2ISuUz96glxUHuMxXAn8/8QuA/BLxgW6eSKe7OkaNY1uwELmF6P1
         0VEuUCyrfbQZKTgg8rm2jCiMU34ITtwtAcGWzWYrazL91v6RsuDqjHFBgJre7IFRhGJR
         8NgqKvZlogfOzHJmp2J17LsYlLdGw0DN3nL+c4BduyWvZsvqvogXFkh07wlfXDZVsrVx
         gkIA==
X-Forwarded-Encrypted: i=1; AFNElJ9rKdp5oU/T8aN3LTBFp3tuy/xHcbeegHp88FH/0yH0TN2YRkz2XZqCfHVGuviHw46fZnUOzkRP1jJySw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzshK7y4xibMM6bBsY4fX0IurOMjCnopWtO4vBia01+gltASlwu
	Krbt8HuQzpK4juWPOLAwhfSsCp0eE5A1TJ3xzsovafvwa6ti5940xiyrikeAH0qSX5c=
X-Gm-Gg: AeBDiesLTpie+71RGg7RskoRW6sWrV7bA3hfi5XQnZNdqsDKdQkL3vFipfwZk6na273
	xyafNude/D64JtOVsapEFYuC/5vGhunpmwIOF6lxOyoHpbbAqjgdTLaBziIc6zPpo6iZ1cErXnG
	Tb+/e2Amfwp6DdHdX7WBnWk5a2ODYmXaD5vIqALsiWjp5u6vlQObieSUh7KEvLA45Wao77d7j4j
	kAQEMVnEwtgidzAuHJIypoVtuNM5VtyI35ViVuvQQuiaIBUdsjX4dxL+qRcvU53nCPbKhf1dP/O
	PRN1ZWdaL358U8/AKVt3VTt1VvBJLlv7FXzrxesmMK65rsRzrgnXbm4UeAWgYufsbLX7THPry9H
	Pqs0x8mQGEkt8FiU7pn6sTgniOfnULrs7kOIMLgSAQMgZI/ecoy+mNSx1kwn+UaGg9/OUA+4Y3E
	cFVlbOS5FHHN828gIOsEyMSp+HzPMHM0bDafSTtyTketPa0C9XwfsUc1SqtG5U9oDXJpyKkMNx/
	k6cseYuvA==
X-Received: by 2002:a05:6808:191d:b0:479:ead7:2a5b with SMTP id 5614622812f47-480421e5991mr6711137b6e.16.1778231884908;
        Fri, 08 May 2026 02:18:04 -0700 (PDT)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com. [209.85.161.43])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c763b2c87sm14506076b6e.4.2026.05.08.02.18.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 02:18:04 -0700 (PDT)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6967fd0416bso1010582eaf.3
        for <linux-media@vger.kernel.org>; Fri, 08 May 2026 02:18:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/CTIpzBIyDRXausp9hL/Zl5DiNDu4xXEdJsPaiS+PIpd5XH2iRJaXiVStNoFiV6LvxS5yInJSqrsdA8w==@vger.kernel.org
X-Received: by 2002:a05:6102:854d:20b0:631:2f82:c3ce with SMTP id
 ada2fe7eead31-6312f82cdadmr1563743137.10.1778231440310; Fri, 08 May 2026
 02:10:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
 <20260413160331.2611829-10-antoine.bouyer@nxp.com> <CAMuHMdXrvn+kwBsc96SQxWMABZv3Y6EPc3FLU7f-pOi2+J+S1A@mail.gmail.com>
 <96bff2f9-04ef-4272-b408-fefc7d1d5e11@nxp.com>
In-Reply-To: <96bff2f9-04ef-4272-b408-fefc7d1d5e11@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 May 2026 11:10:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_O-75kxbqEjLKQ1=5OZpvyCkuWo8CBzpvymzj0i2uUA@mail.gmail.com>
X-Gm-Features: AVHnY4LHFQ2cNB28JlB_QeYS4eHTz1eigCbditGi6HUZBbCkr7_rXaltq2vUwkU
Message-ID: <CAMuHMdX_O-75kxbqEjLKQ1=5OZpvyCkuWo8CBzpvymzj0i2uUA@mail.gmail.com>
Subject: Re: [PATCH v1 09/11] media: platform: Add NXP Neoisp Image Signal Processor
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, daniel.baluta@nxp.com, 
	peng.fan@nxp.com, frank.li@nxp.com, jacopo.mondi@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, michael.riesch@collabora.com, 
	anthony.mcgivern@arm.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	ai.luthra@ideasonboard.com, paul.elder@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 36F434F42BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-60905-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.981];
	TAGGED_RCPT(0.00)[linux-media,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Antoine,

On Thu, 7 May 2026 at 15:48, Antoine Bouyer <antoine.bouyer@nxp.com> wrote:
> Le 06/05/2026 =C3=A0 16:26, Geert Uytterhoeven a =C3=A9crit :
> > On Mon, 13 Apr 2026 at 18:10, Antoine Bouyer <antoine.bouyer@nxp.com> w=
rote:
> >> First NXP neoisp driver version with the following contents:
> >>
> >> This driver was initially inspired from raspberrypi pisp_be driver. It
> >> reuses same approach for ISP job scheduling.
> >>
> >> The Neoisp driver supports:
> >> * 8, 10, 12, 14 and 16-bits RAW Bayer images input.
> >> * Monochrome sensors input.
> >> * RGB/YUV, IR and Greyscale output formats.
> >>
> >> The neoisp features are:
> >> * Provides single context to limit amount of v4l2 devices.
> >> * Supports M2M operations.
> >> * Support SDR and HDR modes.
> >> * Supports generic v4l2-isp framework for extensible Parameters and
> >> Statistics buffers.
> >> * Provides a `core_media_register` API to register neoisp's media enti=
ties
> >> into another media graph.
> >> * A module parameter to run in standalone mode with its own media devi=
ce.
> >>
> >> Co-developed-by: Alexi Birlinger <alexi.birlinger@nxp.com>
> >> Signed-off-by: Alexi Birlinger <alexi.birlinger@nxp.com>
> >> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>

> >> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_MASK GENMASK(23, 16)
> >> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_SET(x) (((x) & GENMASK=
(7, 0)) << 16)
> >> +#define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2_GET(x) (((x) >> 16) & =
 GENMASK(7, 0))
> >
> > What about just:
> >
> >      #define NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2 GENMASK(23, 16)
> >
> > and using the helpers from include/linux/bitfield.h in the driver code?
> >
> >      FIELD_PREP(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2, val)
> >      FIELD_GET(NEO_AUTOFOCUS_FIL0_COEFFS0_CAM0_COEFF2, reg)
>
> That file was auto generated, so I did not want to change it.

Oh, the pleasure of auto-generated files ;-)
Perhaps you can fix the generator?

Here you have 3 definitions per field, which is worse than the
auto-generated AMD header files, which have only two (MASK + SHIFT), and
have been dominating the changed-lines-of-code statistics recently...

> But I agree, these macro would help to save a couple of lines, and
> probably ease readability too. I need to double check the impact, making
> sure there is no regression with such update.

You can compare the generated assembler code, it should be more or
less the same before/after.

> Could that wait for a v3 ? as I was about to send a v2 with other
> changes first.

Sure, thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

