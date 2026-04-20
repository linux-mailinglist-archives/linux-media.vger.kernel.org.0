Return-Path: <linux-media+bounces-59123-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFtqErDY5WnWoQEAu9opvQ
	(envelope-from <linux-media+bounces-59123-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 09:41:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F64427D43
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 09:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFFB0301B158
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 07:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5039A2FCBF5;
	Mon, 20 Apr 2026 07:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PgWBVbMZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hNy8BO3n"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3373A1C9
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 07:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670869; cv=pass; b=MmC9J6reTbg7V2eF7gZBitYo8kkIfeFYZg1HL5TK4TFpkBy8Ed5Xb5oOKk0YwGygzC3Uy/b8FPCUTqlGHx7MqBclXuRW963rjwp7qxO9PNUsXCdL02FRGmBYN/EdsBbKirHbiAum5Udr01zoGMwyiDoafnNAkxnD1MDHXpY7+A8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670869; c=relaxed/simple;
	bh=/NAfhqzz0/u5P/zFL7MmBG9dquSYodl8RGGiUghgua4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7m7ale3fYq8wPYOFiyMXTwqZ4oqgbVLH+Zy/5acqxtL3Qb/BS744Y4xT/sVi7DeApRFX/zUYxWqo9HMy6LrVs+MffCbKNnWTDbhJb5ioC8Lt3GCGGkwXvAzIsaUlSTWNGL/47EtvDGNsOVe/4FtMJ13bjNz6hYj5810hTZn/j0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PgWBVbMZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hNy8BO3n; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776670866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lvtv3YHWGDVA9lM91FQpNZBuSu4xJoq+qrqoYYV6vjk=;
	b=PgWBVbMZbYWFnq0ib3udvFRV8P9EXB/gNcL1ZbCp877kvqsXWhM2EldDSEq9btTVLLOz05
	HTbBvX+2Ey84lSb5VkNBawM6EhWI5vP57uniAdpzmGSI6UI5GwXnel/8tBTnLhStLzNVrD
	7G3P6+oC9RAorb8OooWVda++Oq8rdYU=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-Q-60-A-7P-ua6GQNtkfhcw-1; Mon, 20 Apr 2026 03:41:05 -0400
X-MC-Unique: Q-60-A-7P-ua6GQNtkfhcw-1
X-Mimecast-MFC-AGG-ID: Q-60-A-7P-ua6GQNtkfhcw_1776670864
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-409037c3f0bso1922750fac.1
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 00:41:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776670864; cv=none;
        d=google.com; s=arc-20240605;
        b=MUbqclPJn5A7eHj5cJY+elnFEFRSQCPCKeYAj89KmPnmOb2vnRM5PDj0EFKI1Chtg/
         k9tj2odCgLXiKpbgr83ts1cvl5uAexukmTvsS9UHWSBogu9y+vtomfoQvltzcj7QC26Y
         +Zsj4Pgo+se0aP38EcZKO6Gdj8eZSRB3ViNAluba/Ljwr/312Kq5SOfwVyx2uy4hRCiC
         IjDH4QNdtQYwihZdTFW0GzVJ9UHIF9CWo4zUrR60djLgVbhx8exo2lPi1+pB6A23P6VP
         IQsi3yi+93cNNqI8YbXJmTf67ffIbvo95XpE8Hyhz0fjr6sYUJ8t90In65i+6MwBkhaz
         z9aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lvtv3YHWGDVA9lM91FQpNZBuSu4xJoq+qrqoYYV6vjk=;
        fh=1btQxGggfp0fhS2H/W5CxC5uoZtgLV011qOmBeTDQ9s=;
        b=bLAkIfjTbX4IGIi+Uw5s3wYVSUmwAEWhmfRHphYkV7uMOZKtKaPBOeUdhlr/cen137
         8IZI9A40P3m7f4x98Au9cbOmwHsonZSUATV0PRg12iomFjemMQVP4nlzxeM10NxD8ysZ
         SQfRPiPPTYrHr0bLgqiZzsuFqBunxtmIKqW0gGlcXZfW1LdEr5X5WnHv/CBx8lL9oDMl
         7f0XkwjAp4Az0+xIP1nVfYVk7S53l8ydZMqj+l6AabPxfnkbsoJQOQQ/KrLp4JNTTOtz
         XHDNORtgK6o0bnCR9ukgw537BCJi9orX2qkMD3FAxUhW5z7bI34W+P5FXwqaPnjw4tdT
         IBUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776670864; x=1777275664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvtv3YHWGDVA9lM91FQpNZBuSu4xJoq+qrqoYYV6vjk=;
        b=hNy8BO3nlaVyebDwob3vFASGRpyjoxYqbwnB3V3UFf35uynPnkI0SpJgSSTqgq7tGJ
         BDHk5F0EXO91Ce24mIEr8v0a7ijC7CXzAqJ8lyq7LA9F5eqfH/zkJhtuRjqrnbKYM06R
         TJx6KTt0C6Ca3q0eRRipkKVNEqasFKHw5tV62EX6tpulD7UabzCYr/ffD2z9wMwYz4s1
         3zhK5Bnn3QCtIVgO6swW9zAJWSkxPPLIYmIkTOUtx4UPoDtfu09RZyhP1yzySL6lvJqd
         5E978i1xaSqtlX6FkkBCPvBoOfyuaOCO3LdEn+Qh14tzPU/4FOoLJYp8WlIaWqp7u9dZ
         H9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670864; x=1777275664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lvtv3YHWGDVA9lM91FQpNZBuSu4xJoq+qrqoYYV6vjk=;
        b=cBcVptxXIoHerWMz2PIVlUcvKt0+nhwHE8bHnOGqp99mMu9yQAh2sxnGNBDDYdXOXt
         XipjS+0HSzsU4xZFEH79PU3FYqFNs3Q3SD19mfPJx1lKClxat0ltm58snbQPJZX46rfL
         sumLqFSdtXUbVCBRuaqcPX+CPjUDmLGtvwmjZCX0tR8Xxfmv0Uq4SdczhKhDSe11fvex
         Ij27J8zDgRM3r7xTDThqIsrwAtjAOzzYZvBZzwfDyUX4rALtTSH7gzHeHJgO6xHdNNQz
         0dB4vtIKaMB+E7lOjpNlrZTof1uo2gVDZReVSuBGouQnB1NhbjAemU/uPGzt7xDOlGfN
         XsqQ==
X-Forwarded-Encrypted: i=1; AFNElJ83XvPnVCINsfDtiLzlDR6xpMx3ygkPev3zE7HUbsFKOZOEWJFi/RFLGrb/olPhkdgi2qxTfbxcMWE2lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywep0skyu06TJcU25eetxzmRX5GON3GcRePapTNtQlIKIVac2Js
	p/h23F4OLLUC6uIZ8Ur7BNi+xXWuMNeFmaUPRwCiQ6JNp8ybvLTAkF6N151nwLkqjUrT9CKzVz/
	QpI7waagp+s7DSmL83C+07va/lNQ6zhwfKKJupnjFZZyXiJhwvIXSAkG46wXU6l1K2cMNVuKybf
	2GRbMUaSwbbOUQU2E2O2j1XH6VecMPmn6sN1uCmSc=
X-Gm-Gg: AeBDietTVlq4VEaCMFaoygIyFQ79MTKJ9KzzQtgugD+Y7hngai5uGppfZH56KOqLkMy
	Qxk7FH5d3XdUqdi2070jUZmDYakY0sp5HHgqeazKMtnTd9aFCvOAlqwXsFtPXQ7vKpjzFlVfWJD
	YJQeOcn+bDEVJxXjRBz6iYv3cDodVC5LEOep5GoY1wvHv66h1569kAplZjc3RjmZQfYz1sYqnug
	IarAEp+7X/duqcS
X-Received: by 2002:a05:6820:1743:b0:692:1f42:f1b4 with SMTP id 006d021491bc7-69462e21d97mr6525624eaf.8.1776670864117;
        Mon, 20 Apr 2026 00:41:04 -0700 (PDT)
X-Received: by 2002:a05:6820:1743:b0:692:1f42:f1b4 with SMTP id
 006d021491bc7-69462e21d97mr6525615eaf.8.1776670863680; Mon, 20 Apr 2026
 00:41:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417083214.222189-1-hpa@redhat.com> <20260417083214.222189-2-hpa@redhat.com>
 <684435ca-dc58-4b46-ac25-467dcf12d976@oss.qualcomm.com>
In-Reply-To: <684435ca-dc58-4b46-ac25-467dcf12d976@oss.qualcomm.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Mon, 20 Apr 2026 15:40:51 +0800
X-Gm-Features: AQROBzAs2VcWPBaUAg9uu221QMB2t_e4rGi7EXKeA9WJJTfWdMNYwzfZBa6Y_KM
Message-ID: <CAEth8oGX4mxO0MwWugNBfdrW_jKwYjNtYRe9REkOLtmBbWG3JA@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: ipu-bridge: Add DMI information of Lenovo X9
 to the image upside-down list
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Serin Yeh <serin.yeh@intel.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_FROM(0.00)[bounces-59123-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C0F64427D43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,

On Fri, Apr 17, 2026 at 6:37=E2=80=AFPM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> Hi Kate,
>
> On 17-Apr-26 10:32, Kate Hsuan wrote:
> > The Lenovo X9 has an upside-down-mounted Sony IMX471 sensor so the imag=
e
> > was displayed upside-down. Add the DMI information of Lenovo X9 to
> > resolve the issue.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
> >  drivers/media/pci/intel/ipu-bridge.c | 32 ++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/i=
ntel/ipu-bridge.c
> > index 32cc95a766b7..7b5b0dfc0190 100644
> > --- a/drivers/media/pci/intel/ipu-bridge.c
> > +++ b/drivers/media/pci/intel/ipu-bridge.c
> > @@ -118,6 +118,38 @@ static const struct dmi_system_id upside_down_sens=
or_dmi_ids[] =3D {
> >               },
> >               .driver_data =3D "OVTI02C1",
> >       },
> > +     {
> > +             /* Lenovo X9-14 */
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_BOARD_NAME, "21QA"),
> > +             },
> > +             .driver_data =3D "SONY471A",
> > +     },
> > +     {
> > +             /* Lenovo X9-14 */
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_BOARD_NAME, "21QB"),
> > +             },
> > +             .driver_data =3D "SONY471A",
> > +     },
>
> Can you try to instead match on the DMI_PRODUCT_VERSION ?
> that should contain "X9-14" or something like that,
> allowing you to use 1 entry instead of 2 .
>

Mark suggested me to match both types of X9 using DMI_BOARD_NAME.

The DMI_PRODUCT_VERSION is "ThinkPad X9-14 Gen1" and I think it can be
used to replace two entries.
I tested on X9-14 and it worked. I'll test it on X9-15 later. :)

>
> > +     {
> > +             /* Lenovo X9-15 */
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_BOARD_NAME, "21Q6"),
> > +             },
> > +             .driver_data =3D "SONY471A",
> > +     },
> > +     {
> > +             /* Lenovo X9-15 */
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > +                     DMI_MATCH(DMI_BOARD_NAME, "21Q7"),
> > +             },
> > +             .driver_data =3D "SONY471A",
> > +     },
>
> Same here.
>
>
> >       {} /* Terminating entry */
> >  };
> >
>
> Regards,
>
> Hams
>


--=20
BR,
Kate


