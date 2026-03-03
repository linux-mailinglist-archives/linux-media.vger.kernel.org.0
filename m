Return-Path: <linux-media+bounces-54324-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDC8Ll7Dpmn3TQAAu9opvQ
	(envelope-from <linux-media+bounces-54324-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 12:17:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 341751EDA00
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 12:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E3F83055FA4
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 11:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5287F4219E2;
	Tue,  3 Mar 2026 11:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4N40JUE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E98421A08
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536666; cv=pass; b=DdEt0JUdWMFsQTwYmllX0oYUpC6kROx4TZWWY1rzEb0vja8Mg01CTK3sgtaZItGO5QQjCv9htUuZMlXXWddEjLjd578lKfNKDNNsM8BmZMg+zwsq5BcToeMG3V3LR7TeU5z20bSPrZWXs3uHd9bI05eHMf4eV/ovZ0HYy34EOHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536666; c=relaxed/simple;
	bh=BagzsM2SubNOkAHucF1v79mRj8eY8+6QcOJoAP4k2zQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZpZ1BoieZbeJ9xJy1RPHI0/Bj0FTIhuJy+RPj21opjRR0ZZ5112EN3E0S4yzq2wxZiOd0RWVCOqMCDxiByu0UQ6nDlsliFoEFq2xu25WMdr66/4x9NhcAnK7jBw5Vor699tVQdtCLYQujQR7b07b47+wb7Lk/S2vRfTwDfbclI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4N40JUE; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79860421382so51913747b3.0
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 03:17:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772536664; cv=none;
        d=google.com; s=arc-20240605;
        b=biu9PmH1eZG+ZpLXZllZMF2q8HqhROMYqHVOrINHAznWgUM8TIbudam4PpTEsPf4Go
         wBZ0pzyxvxgCf73P9Dkc+MZKBOqAVwMN4srw0ehwMH3pDznMk85RtsmfRW69VlyNRgv8
         LCNkc4MLXnpv7zqwT5jTVthpEGYI5RQb0lWWonjQ9/DKnGCZnZJRS9xkhh0Lhx5NV99R
         6Gk7JRCqmrsYbT6WWox2xQkbyeZLYbSoX2L6S9auZHYIUDk5H3h1NDGIAhbmMtvtZVGf
         djhkKr2Q974Neh2fn7Y6t9YGBWlBnDt2vKf+6ojRK1nkPXC0pKXQTOJznaJlKqPCdYIw
         VjLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FZwkB8ORB1I9hNQh1azg4VezBUegNfd//8rCgiNCpDM=;
        fh=vXbKq6FBLD8sybM+Cn5l2PbW4h3cfAz/zfXgInESGW4=;
        b=UgfDfh5wncP8P3ykQXF8RtJvec2X+97IdWVXX17lOsY5aWBxFSozsj+HsvJc1Pr5dl
         K/XTYKcN+tMtwqLNKuxpOUdLQWWfRDtdhvz8o/EX8HkYy74y/baRLW1tnzdx5L2AY9wV
         8du7ExIv/L020BjWzpUB2KyTVsScINqCary+y7UDIZiS+eOa4+oQyrc4DZ/ZOEjQm0G7
         nEuegLEy6gT+5ED0ijZEWf/k7ZJm+NlEBi6S/qob7gweyp2wLKVpt+h7Q+c8NaR57f9y
         j8VCbXyq76ods8F85ePhndD3JIwTiCccHP0W1pXYN8cRg2DHaL+fSRE4jWkdVFiA8aZ9
         C23A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772536664; x=1773141464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZwkB8ORB1I9hNQh1azg4VezBUegNfd//8rCgiNCpDM=;
        b=J4N40JUEOherjRXNVW2LzP1H+m/68dMGpwMipUAp//k4jGs0uLozjYnjbu/fs7CFNM
         u98KS2LNuWNbGSzfTr2iRKFZg6ZXnafNJ/50dSs8U4XKbwB4ETUimP5fGi76oWceqtfR
         UyyeUJiamQ39Nnd/e6P0r25qYhgqlm2koxgAeJd4LBLFDa1gXcDIL5SNhDgTZHnzK5I2
         nLGAfA+laiRONbqboe4xgvzNrIJFQ4waVJCdOwXrD5s6r3V31FCouUz58bQ7bEYwVNBy
         BKfKS1GxGpR/yrD8Nz4oeEwtQEbA/K764czHAex6p49DUlW/YbgB/s/ZZYc6MS7GnHW1
         YWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772536664; x=1773141464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FZwkB8ORB1I9hNQh1azg4VezBUegNfd//8rCgiNCpDM=;
        b=niCps9vwuPIfJDFTtraNCaAyruUzN3jLFg/zxgshvnX6OZPR+SmWvtNTsPrTzlw52y
         FiSyGp3GlhCFeMLzLFiN8+r6sjaDTnillkKlqomIxvc5vxWIsKgQd++aBaMzGAamjE9V
         eHLtXRFEFkJ2Y2XLzzKK1OrgvPyKaDTEt5wzzlHR4FgaXqV7YkMEvRtjRe7setG8XXJs
         ZpICmwss2svPgp7V12IdmOj51qEkjOpLkPsvPac/OwJ+cxwfHe6puySxVeb86h0wMSk8
         yL38ZVN7rRaLsqzgbHoVv5ymVvrAK9zEu21mCHy3yywI48wCLysVa/+5ePC3NQce0D5b
         8qfw==
X-Gm-Message-State: AOJu0Ywv1GOKyVzbiLVF5/te/mrT/X4IZSmRwXvWUf4x6AotP7C3qWWe
	5OlhWR6BgZw2Qs2f+QSiCEIWKiUU0RxohnTa8KuIsykrvLunXpiALqe/LeTa0+vI2r/MTVtLf57
	xvd0Z6umEeNjGP+K7235ylvaFD9dYdf0=
X-Gm-Gg: ATEYQzwpHGbXNVk/aVYP3NzZVq7Qv3OQbSYPKEvvVewFUJdCjZkvJQTbVY+1s9htVub
	DvxA+cmMc337YDcj8H2KyXvUDBG20lp2p9P9vBF9rSiTXIsHbdiq+/7c1XVdJWD7zXlfLX/3up/
	RIq/zaRpnvfAKyQTkP+du2q9KYWCLTsEopZJcJJZAR1ocr1cQPKdg9wVTZJ/WWnYkNoOC7/YOSw
	HaoVG6CmmWnHZNn0KvMxNRwuQ3BhaXP2RdIGQBLUMbQnO02ucslWIHpE9JPVccx6e6lOtuXzC9P
	YOCP5FHI5ituxmV1WdODUcx5hJev2heFWD1CYK8=
X-Received: by 2002:a05:690c:101:b0:798:6944:a033 with SMTP id
 00721157ae682-7988562344fmr143365507b3.55.1772536663537; Tue, 03 Mar 2026
 03:17:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225120048.156888-1-y0533159982@gmail.com> <e18a526c3a4822d516cab634afa1e72704d23205.camel@ndufresne.ca>
In-Reply-To: <e18a526c3a4822d516cab634afa1e72704d23205.camel@ndufresne.ca>
From: Yehudis Safern <y0533159982@gmail.com>
Date: Tue, 3 Mar 2026 13:17:33 +0200
X-Gm-Features: AaiRm51J26Z59S68G4rBSB9NC5Xy6Vls2sFpruHsvPu0hsdu_d7633XjkylMLKk
Message-ID: <CANgCxxocVL2nN8WSGo_OuTVV1cPopmsticKUqNDj0xKe3SmsBw@mail.gmail.com>
Subject: Re: [PATCH v4l-utils] v4l2-tracer: trace: serialize all mplane planes
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 341751EDA00
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54324-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[y0533159982@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,ndufresne.ca:email]
X-Rspamd-Action: no action

=E2=80=AB=D7=91=D7=AA=D7=90=D7=A8=D7=99=D7=9A =D7=99=D7=95=D7=9D =D7=94=D7=
=B3, 26 =D7=91=D7=A4=D7=91=D7=A8=D7=B3 2026 =D7=91-21:22 =D7=9E=D7=90=D7=AA=
 =E2=80=AANicolas Dufresne=E2=80=AC=E2=80=8F
<=E2=80=AAnicolas@ndufresne.ca=E2=80=AC=E2=80=8F>:=E2=80=AC
>
> Le mercredi 25 f=C3=A9vrier 2026 =C3=A0 14:00 +0200, yehudis9982 a =C3=A9=
crit :
> > For V4L2_BUF_TYPE_*_MPLANE buffers, trace_v4l2_buffer() only serialized=
 the first plane.
> > Serialize all planes by iterating over buf->length and appending each e=
ntry to m.planes in the JSON trace output.
> >
> > Signed-off-by: yehudis9982 <y0533159982@gmail.com>
> > ---
> >  utils/v4l2-tracer/trace.cpp | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/utils/v4l2-tracer/trace.cpp b/utils/v4l2-tracer/trace.cpp
> > index 996fb043..8e9039ef 100644
> > --- a/utils/v4l2-tracer/trace.cpp
> > +++ b/utils/v4l2-tracer/trace.cpp
> > @@ -252,8 +252,8 @@ void trace_v4l2_buffer(void *arg, json_object *ioct=
l_args)
> >       if (buf->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ||
> >           buf->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> >               json_object *planes_obj =3D json_object_new_array();
> > -             /* TODO add planes > 0 */
> > -             json_object_array_add(planes_obj, trace_v4l2_plane(buf->m=
.planes, buf->memory));
> > +             for (__u32 i =3D 0; i < buf->length; i++)
> > +                     json_object_array_add(planes_obj, trace_v4l2_plan=
e(&buf->m.planes[i], buf->memory));
>
> Have you verified that it works with the deserializer ? (retrace function=
).
>
> Nicolas

The current retrace implementation follows a different execution path
and currently handles a single plane only.

This change updates the tracing (serialization) side to correctly
serialize all planes for multi-planar buffers. Retrace support for
multiple planes will be addressed in a separate follow-up patch to
extend the deserialization logic accordingly.

>
> >               json_object_object_add(m_obj, "planes", planes_obj);
> >       }
> >

