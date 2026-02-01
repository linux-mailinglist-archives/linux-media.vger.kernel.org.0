Return-Path: <linux-media+bounces-51929-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id B5nXOLGff2n5ugIAu9opvQ
	(envelope-from <linux-media+bounces-51929-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 19:47:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F40C6FD8
	for <lists+linux-media@lfdr.de>; Sun, 01 Feb 2026 19:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6FE3930015A5
	for <lists+linux-media@lfdr.de>; Sun,  1 Feb 2026 18:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF07D290DBB;
	Sun,  1 Feb 2026 18:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaVCKchK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D599B214A97
	for <linux-media@vger.kernel.org>; Sun,  1 Feb 2026 18:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769971626; cv=pass; b=fB8XtjDHMS54LXzHIEdab0Em0vvesak23C42b64XruOtvHaEun45MsDvPCMSWiaU1cC+oznwduBCWL9q7CkGByVJOOFJQNReTYQqhtPLvQIFOMmUhD8isoQJhzHj6OwlLGtSEyFmau5feBJfaiu36qEVf8TnXMzmGLKNP1273Bk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769971626; c=relaxed/simple;
	bh=rN8EWbNAzHHviuWngCuCTuKdqjSEKqcDY+eP6Zz/0NM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sskMAYLovGB9teNAZm/UqqCZwrAo50q1SmBCjmhW0GEjvC/xvPbb/iha2msyvnK7Ks38uKUhftjUtdGlknZduLz5QBmqmnEp9CatwgMKmaTApsZizxmAVoz8u8qx6pDOIh7IvKV5yIZ8R/rNkc5nPfVJ9Ubp+JKsIn7TSs6xd6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaVCKchK; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59dd54b1073so4358884e87.0
        for <linux-media@vger.kernel.org>; Sun, 01 Feb 2026 10:47:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769971623; cv=none;
        d=google.com; s=arc-20240605;
        b=kthgQRzbjQL6dfv+Zev4beJJJYjQW3p8c9teToZ8Sdg+G85jIArm1M5+FmaP/rFBnw
         y2mwfKaKPCmaOZuAFgjrS2K7IcR1iTj37HhWX49k232jh0bOtiCTiENNj6RwdexVH8e4
         KgFYajVcAH+GsLthzVpO6VIsVv/K43D+MF/bP0ePbEDDo3fhReyyllWP9nNIjqslyVVL
         KrzysrlbpUGTy8VYhXXPiufAhje2qe+3g2Ows/J82Z4OSN7IPyVAb/K8DgcYCx81MDHk
         6OZuwzhpLcjuumHELw7rNuGBw8eCxr31L3Ehna4A0Ri1OutJ+Eg9WL3koBoStrEqqYRs
         WCDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n3bZhz4rIbI8QV+wjGxWkaXStWXGjUhQfx1xW2ICxI8=;
        fh=SUHx3lxdVvcKTVR88pDt0PHq6iishJqJW0D71/wP8Fc=;
        b=NNwxtwVVNsWI06BYQurz/N7rYLgCCY7JlhdjYQja8rLYMrzU2serkDInuEDhOX4i82
         G4ttwMqyWLBgBtFnLpIJjAY21t08Hcpb0hJexbNOmE9R0wyMrTMXkw6mg0EQp0eoxa/E
         LnUjHyt9kqVXH4Ix8Luk/6mHtUKBZXsRT5MP/oyWwP8M7RIIxEVtSiQeHeGjvR6H3jRf
         mf+S8/Z+/+7+QibbHL9SVefnheHI8FYNUACpV/DUD6wgpMRUy3DsqE8Ub6q8PXMRKzSF
         KKa2JIr8vYfc9UCyXYUkkZ7S4D2cjuaI5jZ81VqP6rqgbT0ZF4h+C9pleS6+QbxMs2yE
         giyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769971623; x=1770576423; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n3bZhz4rIbI8QV+wjGxWkaXStWXGjUhQfx1xW2ICxI8=;
        b=aaVCKchKX25kRs9qO6wRrJIVYv0o0ceQg3m9QZYWR3RMStMMMx/ovSfC+iK5g33OdD
         UBkXuts5vbXWzQuexRZ6E2jG9oFxhSbsCLO3bO+2hSxiXO/BGhAsfxY14ifJQcXGyAoT
         Gt1LfYpkiYN1YiBgROHKOVNEOJPm6NtJREefDan2WXeJOGIzqAQUmQgooWFusZXdZRM4
         e46hIowTAn3N5vrJTU2uFIDb7EPn/dACzNMjwA0FImfg/yFCK6GtCHzsWmBWbLNFCMbe
         S84DZ28upcJlHmCWXcTTPJWVnROviiGm7bl4wCn0aphuidqP1Txtxj05R2suEjBI9E+k
         oLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769971623; x=1770576423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3bZhz4rIbI8QV+wjGxWkaXStWXGjUhQfx1xW2ICxI8=;
        b=ff0ITWyWuYgq4UFeDQebaqtsYmCPB9EOkLEzQicZUUBNN/tI/StXeQxwQYlyP0MBy6
         tztYxMiHLko7L8JkTg91gUMt2HjnUGfUE3KNhyD7gyhGrtuyKuHJebUHuoIKFPNAOjoK
         ftlZhmcElgZ8Rcem3GctiKRp2UsFTThHTCv/41ROWoS0WY7ySVSlgnNA2Bs6hKO6HLeE
         toDd1Xk3g4EbeyQOP+XL2ZT3XcIlRQhJOXFfWz+HEXFvg2kmg6Uy+OEVmd2G1vxoqBAl
         sCK9NmHwwvu/hqRjsrsgySuhh1vyvixsUaoOYLWdXXvcecepGCQ4+KuHnQkdl/O5exiX
         8kWA==
X-Gm-Message-State: AOJu0Yy8gEYgzGt3D1cl5t9S7dfd+1nbfUWvb2vACBOMsaPmd5GOZ/yG
	n7ArOCYV6L1EvCGRxSH04juKDTjWVaGbVenx5rJ1Of06H9s2asGiMpsysBf/RWqZzo/oXDDRn1V
	V1heHeMM581QVZEcFF36SpDbEqUf8Q7h3Trk5
X-Gm-Gg: AZuq6aLd8JPisES/lX4M7yLfw6b/Jg5XoDoKQ3luc76m11pzrJtRBXxDSSwRixDtqCI
	FS849zRvA6RZsxP4LHnpwAzBBT1z+1KYg3zXBp6vrZkGfy4+6YAFL1cV00l+DahMTrPb8px0ura
	tE9L19KOtUmnnvVFs/6Gz/ce26dU2kNgN0j+rReMPHNfAu9bVlg/Uc/RkkGBz8TGOiVzdZjzmBA
	DnO+6lCMpo3+jRzJ6FAW1jo2wnrnM6u++kPD3Ie1jO2XnRrD9hzoINBuxZlxRwyVF1dF1XHhQux
	W81/H5UTgecplCokjKM5KiCdD3ItVw==
X-Received: by 2002:a05:6512:1104:b0:59d:dca7:b4eb with SMTP id
 2adb3069b0e04-59e163fdd4dmr3701002e87.16.1769971622696; Sun, 01 Feb 2026
 10:47:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANAm-cducmYzMhLRz0Yf8CcC8i0yUjscZ6VgXycxJdU-e-JX4w@mail.gmail.com>
 <27bad1ad-ec8e-4574-aafe-5fa9d3e8d057@kernel.org>
In-Reply-To: <27bad1ad-ec8e-4574-aafe-5fa9d3e8d057@kernel.org>
From: HAYOU YASSINE <yassine.hayou@gmail.com>
Date: Sun, 1 Feb 2026 19:46:49 +0100
X-Gm-Features: AZwV_QjVcbJhcduP9xLfaiw_k09dowKSX1mD41rEXEZTzI0UIsYadATRuetokJA
Message-ID: <CANAm-cd_9inwt_3jsaXQomFsai5dDnuK8cAGYO4pfMQ7iQ1NxA@mail.gmail.com>
Subject: Re: [PATCH 0/2] edid-decode: ARVR parsers and DisplayID sanity checks
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000d570ff0649c7a1e3"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51929-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:~];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yassinehayou@gmail.com,linux-media@vger.kernel.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 01F40C6FD8
X-Rspamd-Action: no action

--000000000000d570ff0649c7a1e3
Content-Type: multipart/alternative; boundary="000000000000d570fd0649c7a1e1"

--000000000000d570fd0649c7a1e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

Thank you for the review.

Per your request, I have created and attached a sample EDID file that
contains the AR/VR data blocks. It includes both the AR/VR HMD (0x2c) and
AR/VR Layer (0x2d) tags, which should allow you to verify the output of the
first patch.

Feel free to add this file to the data directory for future reference.

Regards,

Yassine

Le ven. 30 janv. 2026 =C3=A0 15:11, Hans Verkuil <hverkuil+cisco@kernel.org=
> a
=C3=A9crit :

> Hi Yassine,
>
> On 23/01/2026 16:26, HAYOU YASSINE wrote:
> > Hi,
> >
> > This patch series includes two improvements to edid-decode:
> >
> > Patch 1/2: Implements full parsing for DisplayID 2.1 AR/VR data blocks
> > - Tag 0x2c (ARVR_HMD): 79-byte block with optics, lens adjustment,
> >   field of view, center of projection, and streams per layer fields
> > - Tag 0x2d (ARVR_Layer): 20-byte block with HMD identification,
> >   layer configuration, lens distortion, and scaling support
> > - Includes comprehensive sanity checks for both blocks
> >
> > Patch 2/2: Adds validation checks for DisplayID data blocks
> > - Tag 0x20 (Product ID): Validates payload length, week range, and mode=
l
> year
> > - Tag 0x21 (Display Parameters v2): Validates pixel format, chromaticit=
y
> >   coordinates, luminance information, and gamma EOTF range
> > - Tag 0x22 (Type VII Timing): Validates pixel clock max, image
> dimensions max,
> >   and negative blanking periods
> > - Tag 0x24 (Type IX Timing): Validates image dimensions max and refresh
> rate max
> > - Tag 0x25 (Dynamic Video Timing Range Limits): Validates pixel clock a=
nd
> >   refresh rate ranges with revision-specific limits
> >
> > These patches improve edid-decode's ability to parse and validate
> DisplayID
> > data according to the VESA DisplayID Standard Version 2.1a, helping
> identify
> > corrupted or invalid EDID data early and providing better error reporti=
ng
> > for debugging display issues.
> >
> > Please review.
>
> I've been going over these patches, and they look good to me. Nice to see
> this implemented.
>
> Do you have an EDID that has the ARVR data blocks? If you do, then that
> might be a good one to add to the data directory with example EDIDs.
>
> If possible, I'd like to check the output with such an EDID first before =
I
> commit
> the first patch.
>
> Regards,
>
>         Hans
>
> >
> > Thanks,
> > Yassine
>
>

--000000000000d570fd0649c7a1e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><p>Hi Hans,</p><p>Thank =
you for the review.</p><p>Per your request, I have created and attached a s=
ample EDID file that contains the AR/VR data blocks. It includes both the A=
R/VR HMD (0x2c) and AR/VR Layer (0x2d) tags, which should allow you to veri=
fy the output of the first patch.</p><p>Feel free to add this file to the d=
ata directory for future reference.</p><p>Regards,</p><p>Yassine</p></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=
=A0ven. 30 janv. 2026 =C3=A0=C2=A015:11, Hans Verkuil &lt;<a href=3D"mailto=
:hverkuil%2Bcisco@kernel.org" target=3D"_blank">hverkuil+cisco@kernel.org</=
a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi Yassine,<br>
<br>
On 23/01/2026 16:26, HAYOU YASSINE wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; This patch series includes two improvements to edid-decode:<br>
&gt; <br>
&gt; Patch 1/2: Implements full parsing for DisplayID 2.1 AR/VR data blocks=
<br>
&gt; - Tag 0x2c (ARVR_HMD): 79-byte block with optics, lens adjustment,<br>
&gt; =C2=A0 field of view, center of projection, and streams per layer fiel=
ds<br>
&gt; - Tag 0x2d (ARVR_Layer): 20-byte block with HMD identification,<br>
&gt; =C2=A0 layer configuration, lens distortion, and scaling support<br>
&gt; - Includes comprehensive sanity checks for both blocks<br>
&gt; <br>
&gt; Patch 2/2: Adds validation checks for DisplayID data blocks<br>
&gt; - Tag 0x20 (Product ID): Validates payload length, week range, and mod=
el year<br>
&gt; - Tag 0x21 (Display Parameters v2): Validates pixel format, chromatici=
ty<br>
&gt; =C2=A0 coordinates, luminance information, and gamma EOTF range<br>
&gt; - Tag 0x22 (Type VII Timing): Validates pixel clock max, image dimensi=
ons max,<br>
&gt; =C2=A0 and negative blanking periods<br>
&gt; - Tag 0x24 (Type IX Timing): Validates image dimensions max and refres=
h rate max<br>
&gt; - Tag 0x25 (Dynamic Video Timing Range Limits): Validates pixel clock =
and<br>
&gt; =C2=A0 refresh rate ranges with revision-specific limits<br>
&gt; <br>
&gt; These patches improve edid-decode&#39;s ability to parse and validate =
DisplayID<br>
&gt; data according to the VESA DisplayID Standard Version 2.1a, helping id=
entify<br>
&gt; corrupted or invalid EDID data early and providing better error report=
ing<br>
&gt; for debugging display issues.<br>
&gt; <br>
&gt; Please review.<br>
<br>
I&#39;ve been going over these patches, and they look good to me. Nice to s=
ee<br>
this implemented.<br>
<br>
Do you have an EDID that has the ARVR data blocks? If you do, then that<br>
might be a good one to add to the data directory with example EDIDs.<br>
<br>
If possible, I&#39;d like to check the output with such an EDID first befor=
e I commit<br>
the first patch.<br>
<br>
Regards,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Hans<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Yassine<br>
<br>
</blockquote></div></div>
</div>

--000000000000d570fd0649c7a1e1--
--000000000000d570ff0649c7a1e3
Content-Type: application/octet-stream; name="edid_displayid_arvr.bin"
Content-Disposition: attachment; filename="edid_displayid_arvr.bin"
Content-Transfer-Encoding: base64
Content-ID: <f_ml43dr8x0>
X-Attachment-Id: f_ml43dr8x0

AP///////wA2dAABAQAAAAEhAQSlEAl4Bu6Ro1RMmSYPUFQAAAABAQEBAQEBAQEBAQEBAQEBAjqA
GHE4LUBYLEUAAAAAAAAeAAAA/QAweB6CEQAKICAgICAgAAAA/ABBUlZSLUhNRAogICAgAAAAEAAA
AAAAAAAAAAAAAAAAAepwIHgHACAADAA2dAABAQAAAAEXACwBTwEBAIAHOASABzgEgAc4BAAAoACg
FAIRALAAQAAAALAAQA8DPTIeGR4ZHhkeGR4ZHhkeGR4ZAADQBwAA0AcAAAdEAABwRAAAB0QAAHBE
AQAtARQANnQAAQEAAAAwAAr/DocAAAAAAcAAkA==
--000000000000d570ff0649c7a1e3--

