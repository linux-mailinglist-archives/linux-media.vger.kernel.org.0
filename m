Return-Path: <linux-media+bounces-62599-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDZ7Ex9BEGrzVAYAu9opvQ
	(envelope-from <linux-media+bounces-62599-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 13:42:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2A05B32B1
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 13:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E64030C45FE
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 11:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46CE3E5ED8;
	Fri, 22 May 2026 11:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="hkfEk7S+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275F33E5A39
	for <linux-media@vger.kernel.org>; Fri, 22 May 2026 11:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449769; cv=pass; b=OIMaNnHjLCoSGzzstdzgKFwHpuGS0gd1+Pvbykf1G80tc3V7CGVnUtJ8vXya9uWvzPE6983mx34OE8a4YDY+0VaEHZY2iYkEUCGinI1Kkr5k3Rfa17E36hqs8QqHcjBNXq6A9hU7IISzObuGVqkGSHMufj9vwhGJIXW+AocKw9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449769; c=relaxed/simple;
	bh=8kR6HJcw86k9LRZv1TzLX4+chpAft94pmPqBYGg51Oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uok/U0ansXWLdkJpja/CnAKBsIz/DfC+421t5CFHlEZjHVgGvJsxbiXoIYi4D2yYzJTJ8/Mc/FYz9ZFpLNMEpYHY/o8n/P0+ATrkVshzEXPYV7LdevKYveWjG/QrNqfFDb9lr7GfIP2odm9tBmESj73macVtFCfuyNq/hNq7Xp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=hkfEk7S+; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7b37d84a6b3so66330897b3.2
        for <linux-media@vger.kernel.org>; Fri, 22 May 2026 04:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779449766; cv=none;
        d=google.com; s=arc-20240605;
        b=FmO0C53BDVBS/+tIhZfjudjM1I6V3VijSfKIUHRk3+MCg6A5QRW5pK/btWihAF8NpI
         AxpHQGW0o6+7jqRY5BilRgk0wiGgnbYR5W8K0fP7Cr7SM0kzSfkCSE48Wh1qPZx//B0B
         +H8/txA7QJ4jq4MiXeHvuJ1PELhJHcpTSaoCVn/L82/cygyfYnMCyPiBWEXX4PRm8Sqp
         9fmfIkU2iN9oqTofnZ8FUDLRlHYrqYp/RA7l3+uGGyZlOX3Ld1P4nxWBY3C1B8aBuasQ
         W5vAX/PZ/luQeTh2aUs1CPJWoRwXWaIn3LQ5otBox/MzI7qaEKwnbuS3W6xbix77TZJM
         a7vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cPzfIg7aOlHlfFWWbFPmxE7WiAm6qeDA5XSOugpfLzA=;
        fh=OFHQkp3OTL8EQpSY4ves/r4xFXl111Fem8ztB83TNp0=;
        b=Mp3agj0dlbO073Dz7jDS5bAcR0tfpWsa6vkajw/Nk8Go1tOj0/c+ETNZMnRvIUgItY
         6HJkUv/L0mr7eefE+AcLaUPkHeeURvtJh2T3+2aoWESPZF/4BvE+SyKKTk8SwtgNIlbI
         GnvpHizRWPPYswrPVI3G8Oc/QEd9GT3j80VYHobS9K5ky1FzzhQWCvDkGHg46rMqmpNH
         7P0nNBvrRNgsqHc97Lp+pIFwFjLPDkJErqNU9gWEPGMdRee6jkM8LMJB8KvahH7GldtX
         ITChM21oV+eGmWo9RI4t4pJv2SABqO82JGKRU0YLS+l6J1uSyrm11SkaYnBdhMpTuFi/
         EbNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1779449766; x=1780054566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPzfIg7aOlHlfFWWbFPmxE7WiAm6qeDA5XSOugpfLzA=;
        b=hkfEk7S+TXIFfUNJ30slSzLs6UOCq4TsnI/OivtU23pwhWPFDxbNf+fUrvH4jve7N+
         4FaBMv4ONmm0zGG+OzQuAV9HcZSjZ2fxQZLKRY+OtmWYALaDwD3u4UHkL0rkU1OIjJ/Z
         9uTuorynaIVqxDG/B4hq5dXrMmPwLHT1F/j9L/ZNmoci41FkB8AlBBii8NpzSlIka1oL
         DTy9dnBxVwklo6SOZr6AyGa2EMT36ywYvY5gm3hqXa81Y1uXnSCBoRkM8OftSn1D2Q0a
         c7HQsC03RNRKke4bE9o0/ZQKFDUlUGoaSx0myxtLpEvlGTsogJyR9s/rPXDVEDVgkDXZ
         2+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779449766; x=1780054566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cPzfIg7aOlHlfFWWbFPmxE7WiAm6qeDA5XSOugpfLzA=;
        b=VgrNKOw7B4OtP33w+Gd02u4OPp3BICNfdaY5cWnD4LKZNA+NW9DLhWpgkV4acuFnwy
         3Hwvh10cm+H4OfwL0r84PRy3P0WWyQAMKga+cUsQGE0B0lOLlBbNvil2ipB9E/+T5gCJ
         T8SvXHIStCjz3dGLCJLo6xoljdcVt1eSbysaU6X1K/EBgAiZIhNuKbDbJ0aO4uqnMX06
         EA7RQ1h6c8UqgOgASCsIO/mrwatac2VzZB3ije2VExH+bRcagXmeR8u03yrEVfIJ143O
         Zrq7AqhVtMd9yaSvvw15Ah24GmQOKTsheNlIOdBqvgWV98vSG6SmiGxcCzPSn0/Xw8LS
         9UXg==
X-Forwarded-Encrypted: i=1; AFNElJ8VNEdr1yyLcyrfWT90VMx1NoOKOsOu9ME4n+eVH92w69Fj0J/BMGWjs9Dm4+vVhT5U+jQndfW6WN4FCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcqQvASH6dg9WzrHzfbamGxaOvqTrG64Zi5V//4HfYg0jVIot6
	W76FPL8KMBTpyEo+MFphfiDMw4rNVt3tv3icEJTKgBxo7KohUHOS+vgaIkaPNIQXmqop/+v46Mb
	58tTuWaN3mJS4YvBEp6852XOuj142VsehQnofy99uNwsDt+N9mqxyDBs=
X-Gm-Gg: Acq92OFfZHoro19Z4kbIixIUQObgdBQrh4B8ig4OWEWj8C5UrpNBcwJ5P95M+S/LVXe
	cWg88cfpaqRSnUctJl3WhmjjMiSIeOCo6IfIs6Kxqh1okkB/g/3ZM3rbhyw1cMWuLnFdYf10k4D
	h4TFIX7AatUSA6ECep692iXx55XUxVdEONvQUZkK0t1uFUGw5xqw6y2B5LqBpdLFeLqKsJr9Qwt
	rwvY8c9gWe4EERhRBHkWScEfaLagibm1mbBQUU1UOV4KpjKyTtb+wZoUuDPADfI+kgLxTd/2oF2
	tYLLCHclQ9IRkNgBI9lgHUTNdm0UlYdG3fftgyP0b+u3jzdDDPwyEubSU+WFpAE8ncIx4YbqK9f
	v3As61emqJdUBa6jZGv7Gl7Se
X-Received: by 2002:a05:690c:a00b:b0:7d0:ae60:de9f with SMTP id
 00721157ae682-7d3357d5812mr30352057b3.30.1779449766123; Fri, 22 May 2026
 04:36:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519104129.2001018-1-shravan.chippa@microchip.com>
 <CAPY8ntC4kSq21J=BF+kxO8dESd1u3+cUbgj1VQzKhGYF_pMstA@mail.gmail.com>
 <SA1PR11MB8280C7085CB7BE509107F6E481012@SA1PR11MB8280.namprd11.prod.outlook.com>
 <CAPY8ntD6_2BDiP-0zXK1X0f69btepZYCTgbMpWryZhKvZoNPpw@mail.gmail.com>
 <SA1PR11MB82806D01B032E83C37B97F96810E2@SA1PR11MB8280.namprd11.prod.outlook.com>
 <CAPY8ntAqtVuz+sxHj8gOOnM74iwn682+GEd6DHcta_UwQ42+-g@mail.gmail.com> <SA1PR11MB82802ADDFB785E7275604C72810F2@SA1PR11MB8280.namprd11.prod.outlook.com>
In-Reply-To: <SA1PR11MB82802ADDFB785E7275604C72810F2@SA1PR11MB8280.namprd11.prod.outlook.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 22 May 2026 12:35:49 +0100
X-Gm-Features: AVHnY4KW6a8S2lKKJbcLNWpOIjJrF9jSlizX7iE0jX8kQgluKlp1Et11gSdSA6o
Message-ID: <CAPY8ntBqLyOug0W0dpCyTn3wV3K-tyDu=4R1CwCO=xe3gg5P8w@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx334: add new link frequency configuration
To: Shravan.Chippa@microchip.com
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor.Dooley@microchip.com, Valentina.FernandezAlanis@microchip.com, 
	Praveen.Kumar@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62599-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 6E2A05B32B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 22 May 2026 at 05:00, <Shravan.Chippa@microchip.com> wrote:
>
> Hi Dave,
>
> > -----Original Message-----
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Sent: Thursday, May 21, 2026 5:23 PM
> > To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> > Cc: sakari.ailus@linux.intel.com; mchehab@kernel.org; linux-
> > media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dooley - M52=
691
> > <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis - M63239
> > <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar - I30718
> > <Praveen.Kumar@microchip.com>
> > Subject: Re: [PATCH] media: i2c: imx334: add new link frequency configu=
ration
> >
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the
> > content is safe
> >
> > On Thu, 21 May 2026 at 05:48, <Shravan.Chippa@microchip.com> wrote:
> > >
> > > Hi Dave,
> > >
> > > > -----Original Message-----
> > > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > Sent: Wednesday, May 20, 2026 6:06 PM
> > > > To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> > > > Cc: sakari.ailus@linux.intel.com; mchehab@kernel.org; linux-
> > > > media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dooley -
> > > > M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> > > > M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> > > > I30718 <Praveen.Kumar@microchip.com>
> > > > Subject: Re: [PATCH] media: i2c: imx334: add new link frequency
> > > > configuration
> > > >
> > > > EXTERNAL EMAIL: Do not click links or open attachments unless you
> > > > know the content is safe
> > > >
> > > > Hi Shravan
> > > >
> > > > On Wed, 20 May 2026 at 06:21, <Shravan.Chippa@microchip.com>
> > wrote:
> > > > >
> > > > >
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > > > Sent: Tuesday, May 19, 2026 7:37 PM
> > > > > > To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> > > > > > Cc: sakari.ailus@linux.intel.com; mchehab@kernel.org; linux-
> > > > > > media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor
> > > > > > Dooley -
> > > > > > M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis
> > > > > > -
> > > > > > M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar
> > > > > > -
> > > > > > I30718 <Praveen.Kumar@microchip.com>
> > > > > > Subject: Re: [PATCH] media: i2c: imx334: add new link frequency
> > > > > > configuration
> > > > > >
> > > > > > EXTERNAL EMAIL: Do not click links or open attachments unless
> > > > > > you know the content is safe
> > > > > >
> > > > > > Hi Shravan
> > > > > >
> > > > > > On Tue, 19 May 2026 at 12:17, shravan kumar
> > > > > > <shravan.chippa@microchip.com> wrote:
> > > > > > >
> > > > > > > From: Shravan Chippa <shravan.chippa@microchip.com>
> > > > > > >
> > > > > > > Add support for a new 222=E2=80=AFMHz link frequency configur=
ation to
> > > > > > > the
> > > > > > > IMX334 driver and dynamically generate the supported modes
> > > > > > > array based on the link frequencies specified in the DTS. Whe=
n
> > > > > > > multiple link frequencies support the same resolution, the
> > > > > > > driver selects the first matching entry; therefore, the link
> > > > > > > frequency must be explicitly defined in the DTS to avoid reso=
lution
> > conflicts.
> > > > > > > The link frequency is a read=E2=80=91only parameter and is
> > > > > > > automatically set based on the selected resolution and DTS
> > configuration.
> > > > > >
> > > > > > Where is the sensor setup to configure this 222MHz link frequen=
cy?
> > > > > >
> > > > > > I have a datasheet that lists support for 1782, 1188, and
> > > > > > 891Mbit/s, which equates to 891, 594, and 445.5MHz link
> > > > > > frequencies. There is no mention of supporting 444Mbit/s or 222=
MHz.
> > > > > > The driver switches from the default 445.5MHz to 891MHz by
> > > > > > changing SYS_MODE from 0x02 to 0x00 (it's an 8bit register, so =
I
> > > > > > don't know why it's trying to write 0x0100).
> > > > > >
> > > > > > As far as I can tell, this patch just changes the advertised
> > > > > > link frequency, but the sensor will produce exactly the same
> > > > > > 445.5MHz output. Can you tell me what I've missed?
> > > > >
> > > > > Hi Dave,
> > > > >
> > > > > I am attempting to change the value of the register
> > > > > IMX334_REG_INCKSEL2 to 0x0A in this patch, which sets the link
> > > > > frequency to 222 MHz and defines the supported resolutions;
> > > > > however, this behavior is not documented in the datasheet.
> > > > > Additionally, writing 0x0E to IMX334_REG_INCKSEL2 results in a 11=
1
> > > > > MHz link frequency, while writing 0x06 sets the link frequency to
> > > > > 445 MHz
> > > >
> > > > Apologies, I'd totally missed that you were writing
> > > > IMX334_REG_INCKSEL2 directly from imx334_enable_streams. So it's th=
e
> > > > magic of the PLL_IF_GC bits, and they aren't documented.
> > > > Most likely the register is only controlling a divider, in which
> > > > case the link frequency would be 222.275MHz.
> > >
> > >
> > > No need to apologize=E2=80=94I appreciate you taking the time to revi=
ew it.
> > > Your comments are helpful, and thank you for taking another look.
> > > Yes, the PLL_IF_GC bits are responsible for changing the link frequen=
cy.
> > >
> > > >
> > > > It was fairly ugly with IMX334_REG_INCKSEL2 being written from
> > > > common_mode_regs and then written again from mode_3840x2160_regs,
> > > > but now it may get written from imx334_enable_streams too.
> > > > It'd be nice if that was all factored out into clean handling for
> > > > link frequency (and input clock?), but seeing as this is an orphane=
d
> > > > driver there's supposedly no one who really cares too much.
> > > >
> > > > A further question: if the link frequency is lower then doesn't
> > > > hblank need to be extended to allow enough time to output the data?
> > > > Or is there enough slack in the current timings to give enough time=
,
> > > > or the pixel rate has changed too?
> > > > All modes except 3840x2160 advertise a pixel clock of 297MPix/s wit=
h
> > > > the same hblank of 2480 pixels and vblank of 1170 lines. However th=
e
> > > > actual HMAX register isn't changed between modes (0x44c written fro=
m
> > > > common_mode_regs), so I suspect they all actually give different
> > > > refresh rates from those advertised.
> > > >
> > >
> > > There are two additional registers related to the resolution:
> > IMX334_REG_Y_OUT_SIZE and IMX334_REG_HNUM.
> > > I believe the hblank value is sufficient, and with a 222=E2=80=AFMHz =
link frequency,
> > achieving 30=E2=80=AFfps should be possible.
> > > Increasing the link frequency may allow the frame rate to exceed 30=
=E2=80=AFfps.
> >
> > Is 30fps that max that is achievable with the current 445.5MHz link
> > frequency?
> > Sony have done their usual in the datasheet of giving individual exampl=
es
> > rather than specifications. It lists the 2x2 binned mode as needing 891=
/1188
> > Mbit/s for 30 or 25fps, and 1188/1782 Mbit/s for 60 or 50fps. If 30fps =
can
> > actually be achieved on 222MHz/445.5Mbit/s, then why can't 60fps be
> > achieved on 445.5MHz/891Mbit/s?
> >
> > It's a tangent, so if the modes all work at the correct frame rates wit=
hout
> > corruption, then fine.
>
> Yes, it is working with out corruption.
> Thanks, Dave, again for taking a deeper look at my patch.
> I am using 480p, 720p, and 1080p with a 4=E2=80=91lane configuration.
>
> Bandwidth Calculation
> Data rate per lane =3D 2 =C3=97 link frequency
> =3D 2 =C3=97 222=E2=80=AFMHz
> =3D 444=E2=80=AFMbps per lane
>
> Total raw bandwidth =3D 444=E2=80=AFMbps =C3=97 4
> =3D 1,776=E2=80=AFMbps (1.776=E2=80=AFGbps)
>
> Pixel Rate Calculation
> Pixel rate =3D Total bandwidth / bits per pixel
>
> RAW10 (10=E2=80=AFbpp): 177.6=E2=80=AFMpixels/s
> RAW12 (12=E2=80=AFbpp): 148.0=E2=80=AFMpixels/s
>
> Example: Maximum FPS for 1920 =C3=97 1080
> FPS =3D Pixel rate / (width =C3=97 height)
>
> RAW10:
> FPS =3D 177.6=E2=80=AFM / (1920 =C3=97 1080) =E2=89=88 85.6=E2=80=AFfps
>
> RAW12:
> FPS =3D 148.0=E2=80=AFM / (1920 =C3=97 1080) =E2=89=88 71.4=E2=80=AFfps
>
> This is a theoretical calculation. In practice, horizontal and vertical b=
lanking, along with other overheads, will reduce the achievable frame rate.

OK, great. It sounds like Sony has been very conservative for some weird re=
ason.

> >
> > > > > For the 891 MHz link frequency, the SYS_MODE value is 0x100, and
> > > > > it is
> > > > written automatically when the 3840=C3=972160 resolution is selecte=
d.
> > > > This behavior does not apply to the 222 MHz mode. For the 222 MHz
> > > > link frequency, the required SYS_MODE value is 0x02.
> > > >
> > > > My comment was more that IMX334_REG_SYS_MODE is defined as
> > > > CCI_REG8(0x319e), so only the bottom 8 bits of any value will ever =
be
> > taken.
> > > > Trying to write 0x100 will therefore be equate to writing 0x00.
> > > > So it's more odd behaviour from the original driver rather than
> > > > anything in this patch.
> > >
> > > Correct. This behavior is not introduced by this patch. The register =
is only 8
> > bits wide, so writing 0x100 will result in 0x00 being written instead.
> > >
> > > >
> > > > Sorry, I saw this patch and took a look as it's another Starvis
> > > > sensor, but I seem to be seeing various potential issues lurking.
> > >
> > > This patch only modifies the link frequency by updating the
> > IMX334_REG_INCKSEL2 register value and configures the sensor to operate=
 at
> > 30 fps.
> >
> > Yes, sorry. It's the problem of starting to look at a new module and st=
arting to
> > see the issues and ambiguities. I'll just review the patch.
> > I might see if I can find a vendor of a suitable module to play with.
> > At least with it being a Starvis sensor they tend to stay in production=
 longer.
> >
> > > Thanks,
> > > Shravan
> > >
> > > >
> > > >   Dave
> > > >
> > > > > Thanks,
> > > > > Shravan
> > > > >
> > > > > > Thanks
> > > > > >   Dave
> > > > > >
> > > > > > > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > > > > > > ---
> > > > > > >  drivers/media/i2c/imx334.c | 112
> > > > > > > +++++++++++++++++++++++++++++++++++--
> > > > > > >  1 file changed, 106 insertions(+), 6 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/media/i2c/imx334.c
> > > > > > > b/drivers/media/i2c/imx334.c index 9654f9268056..336de9cd8ff2
> > > > > > > 100644
> > > > > > > --- a/drivers/media/i2c/imx334.c
> > > > > > > +++ b/drivers/media/i2c/imx334.c
> > > > > > > @@ -109,6 +109,7 @@
> > > > > > >  /* CSI2 HW configuration */
> > > > > > >  #define IMX334_LINK_FREQ_891M          891000000
> > > > > > >  #define IMX334_LINK_FREQ_445M          445500000
> > > > > > > +#define IMX334_LINK_FREQ_222M          222500000
> >
> > Half of 445500000 would be 222750000.
>
> This value I got from oscilloscope, so kept the same

An oscilloscope won't measure to that level of accuracy. Divide by 2
would be the logical assumption.

<snip>

> > > > > > >
> > > > > > >         /* Set default mode to max resolution */
> > > > > > > -       imx334->cur_mode =3D &supported_modes[__ffs(imx334-
> > > > > > >link_freq_bitmap)];
> > > > > > > +       imx334->cur_mode =3D
> > > > > > > + &imx334->new_supported_modes[__ffs(imx334-
> > >link_freq_bitmap)
> > > > > > > + ];
> >
> > Does this work now?
> > It was relying on mode[0] using link_idx 0, and mode[1] using link_idx =
1. If link
> > frequency 0 wasn't enabled, then it switched to a supported mode.
> > You're now generating your own version of the table with only the modes
> > where the corresponding link frequency is enabled, so shouldn't the def=
ault
> > just be imx334->new_supported_modes[0]?
> >
>
> Yes, this approach will work because the updated supported modes array wi=
ll include only the modes supported by the device. As a result, the first e=
ntry in the list (mode[0]) will be selected.

Create a device tree configuration with only 222MHz in it.

imx334->link_freq_bitmap will be 0x04.
__ffs(imx334->link_freq_bitmap) will be 2.
new_supported_modes will contain
- [0] 1920x1080
- [1] 1280x720
- [2] 640x480.

cur_mode =3D &imx334->new_supported_modes[__ffs(imx334->link_freq_bitmap)
there leaves cur_mode pointing at the 640x480 mode [2], and not the
max resolution mode that the comment states.

  Dave

