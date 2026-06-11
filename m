Return-Path: <linux-media+bounces-64565-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6OFjIfqCKmrsrQMAu9opvQ
	(envelope-from <linux-media+bounces-64565-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:42:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF312670831
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:42:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=arhNyOjY;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64565-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64565-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACCC63058E64
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E823C0A18;
	Thu, 11 Jun 2026 09:41:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B223BE15F
	for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 09:41:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170894; cv=pass; b=dBj3MWNHEc99L7QLD9YChobusu4HPXBExa23qrS9LXZJOoWtMKAA8Pa+IXGw6k1D9P978tUr78cgyy+WlUcELBU0DzPjxdvnBHKGQR1aPYMUcVMrq5bJlNDSmNB6sQ4jGprRUO5cfD+9eS40mYy+JnQG7iql29QnkIV2D67HNJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170894; c=relaxed/simple;
	bh=DYwC/iJNBVsVCYdQYreLPahIX+cAswTEyvULjm6y1ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=quGOE2EB5tiTBXSlEaWpHXkPdjKN6Lo7/VCd0qTf7IUgNxW/QjOA6MN89dKL8dY5w0ncZ4vWzfMx2MfFs9fw7c9IvIAfJyBwykGnXsusrvvKsVL6BpePpIOBagbvwhP9BNiZyo+4gPKAfsrGrbTMtk9A/V8nGmKKLiNfVBE35J4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arhNyOjY; arc=pass smtp.client-ip=209.85.128.171
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7e053987001so8873547b3.0
        for <linux-media@vger.kernel.org>; Thu, 11 Jun 2026 02:41:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781170890; cv=none;
        d=google.com; s=arc-20240605;
        b=S/UusSWL8hiSCGHP46Q75Q7YjoERVmhQx+WeAZFL3r2OFMZyOsyUxuKy5grsJMALyX
         DQQy+cvZ3iLPtfV8fm/mnQMSZagTJ7tFWsTLKi66NNfaOcVx3x20oHRiHU1iB7YSljLW
         X2Kr+ZQenKuHf228j+u/LQfNYTTjCm4j1SY/Y1s7pxxkeuadMe6v3arCj2FJMV+OZaPk
         azJAsuCuq4X+GTk6Sx1XiTn9bxzV+GG6mEJoFBwEjFg14Dw1gl1qS2z2QanLj6KHP/a2
         QMVbRIhYwhehXEiq1CW/fOuSWQHvGJ3RtDEfbeXXyBSNGLY5JjH+YZ1QEu3FtB5mgWdF
         9KKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XtulHAxCQb4x1CHvZBVFaPxrB2u/9e3ZafuzGWJ8Oek=;
        fh=eQakavT6WQ9nyVV/HmkZAu2qKMqLn4XUAt+V8Ja8h1U=;
        b=lYsNvDRd+OGVo8KokrI3G+585MPkz+qJCBulFTInRIC8ypfIDYk8vUOqYBEqtrQOit
         UgJsbf/symyMwkFd0Us8UuIaMs9N1mn2bNQwIqUM70sMFLavyWTXr8ttaGg78NVlrIdG
         9l+j13Plk3wE29TPk4rmoaAkmrpxDJBBTNoi3CkNiWt3Ik7IRhjtX6QHNCHFCjOjK/PM
         /daqwfqvXim7ReDt9jM01XLHCRTM1OOkVY/lnImbAUHxGCk8yWL+PlJ+qMyk0lD4LvFx
         pqikqM3gKWAshjL7T1hksJy4hwllhIMFhGVcpDintXnoIZW/4PBBUf0yTf8YAnHDsGKt
         Ca7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781170890; x=1781775690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtulHAxCQb4x1CHvZBVFaPxrB2u/9e3ZafuzGWJ8Oek=;
        b=arhNyOjYdP2vkkyrrYLxNvhA5DZ69xFjxc13H2nQCb7SNhhw1hwBeP5WclO1YAFerK
         1D9NFEru1IOmmUvJwiLwsoPDLH4qqWXQCc9PTDzXUumfhEypKW4feQHTbxs4bvCOE9rz
         WsMkl7OCFmS31JruxpxQAJy4JULsXQdT4hRbcVjfNayvQEZtJOsAEkmi0DbYRq5+xpwP
         48tAzvjaGQQXUq7MG104CrINyI7hpe+EyOmoNwVZbCFnpJvBamGVxSwef9A1X6zzbwxC
         kxLrGtoECfG35c26V6TZdE7azTdHZjq9qLYqezXnjwYWVEGacz0xe+4mIJawmBSN1DMF
         HKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170890; x=1781775690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XtulHAxCQb4x1CHvZBVFaPxrB2u/9e3ZafuzGWJ8Oek=;
        b=LjiS2nH1kxeqGoVi6K0iaXdEs7jUSPpfgtzW23jj0UlPVP6aCwax0ERmb1lbIHE7EZ
         mVcO+u9JhmQiQ5YsZtUamYyML3VadZjYglxc7d3X7EotRXuTh/kGYH+TTpRULjWuwcIa
         lZbe1TP8hJghD1GjjiCLY1rHD3C+nKucVTEVH5Xxvf/yYroTXWSGs9M7DkIFCr5JQvOb
         6ECoahyjyF4s846dB6G9TpVvlt3iCWFpoFd5CqgbUmoySyrm4Oe7VtdZU3T/DY2i+qAW
         fG8mzcWlm8Oux/2nUHp9v39fCc4aCwiv9eHZspy9Pg4s+HL3syOdIrFygPJHBglAYqkh
         XGlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vGiaE0hKYxDaUqtwQ2Caf9A+1ASOSlK3kqHL1MiY6iDUBBZdYGhGLD/7XhP74biO1zfaYTGgtqBPPfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNn7cduxWxZvgPBm7CLMDDlF6bwcNb7ZxG9SnsdKGRnyZ+9Nwg
	fmNwhEoXDDEprlIlw/vj1TGKiLCBmIfyIGfNP8LZOtOtdbie3eFmnlkTOX9xNd68R4WA322LWji
	4/9WaFrRQlldb2MoNgtvpnM7ogQ3b2I4=
X-Gm-Gg: Acq92OF5RTBgDReQ7YQScBHkuvqiXeIfocJkWnhzquEFHOJXPCwL8daT0nYcwGe11dD
	rH6h/a7Xt+HLKZVLRuxkBb0gou0agkofMzLDN3Xo9vH0QIchh8Z0i2SD6Fjs/f3/ZYlk6TewArh
	+QClV8t7oWrtHd7c7uyZvNYwSRxW59xKHFZg2SpfB0wqUqBLNxOWEFFzktyqVBiI8wn3+7g2UIc
	aW1oiOhBvsyfvhowTd+XH4P0HVgaoqCrlCmiYRJCZAXdhQYGcWeLNMq8o2kyYmLXaSlvudpdir1
	MwQ1zfytMUd0wGjC
X-Received: by 2002:a05:690c:4444:b0:7ba:f3a2:552e with SMTP id
 00721157ae682-7f66bd634dcmr11617357b3.10.1781170890327; Thu, 11 Jun 2026
 02:41:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609124926.1038981-1-hpa@redhat.com> <20260609124926.1038981-2-hpa@redhat.com>
 <aineK26VD67Fmibd@kekkonen.localdomain> <CAEth8oEv3iAQ1P9=rYddeBRX2qrjZiysUA_JfFp8pUAoJXbGLQ@mail.gmail.com>
 <aipwpTo5JCiAACVp@kekkonen.localdomain>
In-Reply-To: <aipwpTo5JCiAACVp@kekkonen.localdomain>
From: Damjan Georgievski <gdamjan@gmail.com>
Date: Thu, 11 Jun 2026 11:41:19 +0200
X-Gm-Features: AVVi8CezbqcDDEF1RWrPOyDq5mPUg6OQxuDHSWPBn39rwFcoWKuy-zpX5iEq1tY
Message-ID: <CAEk1YH41bJSoJdjYMj2ZJp5+WF6DpZhBrwkNKaC1HbPvwDV3GA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] media: ipu-bridge: Add DMI information of Lenovo
 X9 to the image upside-down list
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Kate Hsuan <hpa@redhat.com>, Mark Pearson <mpearson@squebb.ca>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Serin Yeh <serin.yeh@intel.com>, 
	Tarang Raval <tarang.raval@siliconsignals.io>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64565-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:hpa@redhat.com,m:mpearson@squebb.ca,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:tarang.raval@siliconsignals.io,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[gdamjan@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gdamjan@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF312670831

On Thu, 11 Jun 2026 at 10:24, Sakari Ailus <sakari.ailus@linux.intel.com> w=
rote:
>
> Hi Kate,
>
> On Thu, Jun 11, 2026 at 03:25:46PM +0800, Kate Hsuan wrote:
> > Hi Sakari and Mark,
> >
> > On Thu, Jun 11, 2026 at 5:59=E2=80=AFAM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Kate,
> > >
> > > I know several people have given you different advices but...
> > >
> > > On Tue, Jun 09, 2026 at 08:49:24PM +0800, Kate Hsuan wrote:
> > > > The Lenovo X9 has an upside-down-mounted Sony IMX471 sensor so the =
image
> > > > was displayed upside-down. Add the DMI information of Lenovo X9 to
> > > > resolve the issue.
> > > >
> > > > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > > > ---
> > > >  drivers/media/pci/intel/ipu-bridge.c | 32 ++++++++++++++++++++++++=
++++
> > > >  1 file changed, 32 insertions(+)
> > > >
> > > > diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/p=
ci/intel/ipu-bridge.c
> > > > index fc6608e33de4..9e24aaceecdf 100644
> > > > --- a/drivers/media/pci/intel/ipu-bridge.c
> > > > +++ b/drivers/media/pci/intel/ipu-bridge.c
> > > > @@ -134,6 +134,38 @@ static const struct dmi_system_id upside_down_=
sensor_dmi_ids[] =3D {
> > > >               },
> > > >               .driver_data =3D "OVTI02C1",
> > > >       },
> > > > +     {
> > > > +             /* Lenovo X9-14 */
> > > > +             .matches =3D {
> > > > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > > +                     DMI_MATCH(DMI_BOARD_NAME, "21QA"),
> > > > +             },
> > > > +             .driver_data =3D "SONY471A",
> > > > +     },
> > > > +     {
> > > > +             /* Lenovo X9-14 */
> > >
> > > How are the two X9-14's different? It'd be good to have some comment =
here
> > > which model this actually is: the board name is only available (typic=
ally
> > > at least) in DMI.
> >
> > According to the datasheet of X9-14 and 15. Lenovo offers 2 screen
> > sizes (14-inch and 15-inch) and 2 CPU types (Core Ultra 5 and 7).
>
> Is the CPU SKU the difference here? If so, can you add that to the commen=
t?
>
> > They may ship customised firmware for a specific purpose with a random
> > DMI_PRODUCT_VERSION.
> > So, using the DMI_BOARD_NAME prefix to identify the laptop SKU is
> > safer and easier.
> >
> > I think DMI_MATCH(DMI_BOARD_NAME, "21Q") covers all X9 but I don't
> > know the side effect :(
> > They may propose a new model with a different MIPI camera or HID.
>
> Indeed. Is the BOARD_NAME guaranteed to be unique by Lenovo? I think I'd
> use DMI_EXACT_MATCH(), too.

The full board_name is 21QA0048RM (on mine), so 21QA is just the prefix.
The lenovo support site only requires this prefix to get you to the
support page for the laptops and they refer to it as "Type 21QA".

Is there DMI_MATCH_PREFIX, for these (if not all) Thinkpads it might
make the most sense ?


--=20
damjan

