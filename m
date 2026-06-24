Return-Path: <linux-media+bounces-65524-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dFTrEx6fO2roaQgAu9opvQ
	(envelope-from <linux-media+bounces-65524-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 11:10:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A22A16BCD51
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 11:10:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b="CA/+1Mtt";
	dkim=pass header.d=redhat.com header.s=google header.b=ncxLZqIe;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65524-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65524-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74F7A3011C58
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 09:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308AF37647E;
	Wed, 24 Jun 2026 09:08:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC9D3019AA
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 09:08:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782292132; cv=pass; b=Qfm5wenpYEchHDZJBfrCMXIvBqDKE9ppprYVbO8DoyGww0NFR947SY1q0cOxn3v+nEbuAk6sibHaQrgstHzB/ZtYfN7bXDPZCMOwoFLphjyCYt56AR7NZt9cU1jlNQ0vXV7NW5OPZ0CmhmTZcbql4HaA+gpocbljinI9I4LYZyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782292132; c=relaxed/simple;
	bh=/eY2WPmCgctsM0d0DfGkpZHcFl0JKnDJt2drjjvVMnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CAmIFb+tBFUxbphsiiivT4601LFIrmefaCZr62SlhZdURdh1A2o8JEeZH7tm4UiwsUpVASfV7AhKZlwnYwQLTZkqugOdl7EPuG9wcNPnGzA35eT+q+5m5i1pNdEBIJRrlpu9aepGVkj1s3omoDB4rYJLOaFHNwjJHUcmUNNkR4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CA/+1Mtt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ncxLZqIe; arc=pass smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782292130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0zDJIsdcRHDPw/miWgCz4K35ukh8QBHN4U8NYjAhemY=;
	b=CA/+1Mtt/sLzUJH4hhXnnx/jkfse7XXbVDp6MKD2nJQHot2QzcAU6bFnFA4b4BUP6nXafI
	l2a+XiV68gBMmQ9qs+tJ9Yql79IKUlcLTMXGX46lImxa1taeL53cNJjCwf7mnlCYVXv+L5
	VKZxPx3XOuW9+MPXPILxtoE2Txl4OUA=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-jIjC64UkMW-61A7s2wtJDw-1; Wed, 24 Jun 2026 05:08:48 -0400
X-MC-Unique: jIjC64UkMW-61A7s2wtJDw-1
X-Mimecast-MFC-AGG-ID: jIjC64UkMW-61A7s2wtJDw_1782292128
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9318cc632so1125469a34.2
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 02:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782292128; cv=none;
        d=google.com; s=arc-20240605;
        b=SUY7QQCynbPe8rcMThR4XCh1YHbyv9vFqh9Lx1lzM226G7kJ6MLgAmMLyDR5aoaVV2
         hwtlqweZN4cD3CowQCZaIIEEfHVPj9dMvDAkOJdfi/9MydihRw7+F/TVIcuBX2TfNHm2
         Z7PaPRwL++w5r6ZlDBg7ODFvdyrX0r34HtG65srBJOqdf+FX9hrSLdbcbUeS9IFusFys
         IMBwBVYRpM41GKXqsOZlj8AyGvoX4jb0QXDsCSQJlTfQtGop7niE9JRoWQzlXmvLLOI4
         ZDdgH/9tvmd4pMmehxv2uNWvPF+mF4MOlZHDhFnKg8PTy+eQk+8qEf827XgHn1hl4z+d
         0p2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0zDJIsdcRHDPw/miWgCz4K35ukh8QBHN4U8NYjAhemY=;
        fh=YOTQA6mKSdpbHXDfmFD2o8X7h4O2JbDPBkizsB+A1fA=;
        b=efzRZoS90XJKNucjJPnNNGE5Js5OEc+FDPMxfYW9j/TJtNIPBgWn9u/qmb1AQZpLZR
         M4RYPBRs5f1sf9JvHzldkrhoH6qpUM1cQxB03ldIomQ1X/lFeSPqQ757Ov/xZM9mydOW
         aJPwwnEk/IfRkT66pNfjqKXkCbO0qBtHFX8OiaeawzXhQCbNmKM0fNigW53Ff5bQod33
         HEs0HxXbboRZati5e+2IXzFuUxGptcNewGYGlS4LwOMTx3t1Q+5IrMpL952h0cqBVcPF
         aUgks3dPTiY8ppma6oSNNr8UlnQhIEBwlLvk1L53QP/YlavzdoXhh+0lh/b5EDMh0Q7q
         n2Fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782292128; x=1782896928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zDJIsdcRHDPw/miWgCz4K35ukh8QBHN4U8NYjAhemY=;
        b=ncxLZqIeBDL8myKMAr8vlJa5ar5O6MV70ZkxZTtpq42+vfpS36A/6W8MhKBBIv+6rs
         PMqairvzHQrc90oJpWWY2NEe5VjQXElm+w+L+nSzDPMfItt+e2+ML8ed0qt0PL8tOqda
         1pqzgVbG3bYNt8Zcot5tLIY/jnHbUMCOG/8Xoeyz7NMMQATXbMUn3yLIKeF8+44Dne7V
         73Bkyx4TxNrWPtInUIv/T+IaQVYERjYUTzkn2htpmNUFzUE9mX8yl2jF3RpfDpexGj0H
         ofCLgAJOPRZJJ8YZ9G2SVRwyB4syEw4rTsh7iRDqDadLHMZ9TE/QjsNR87w3bCiynXZK
         6/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782292128; x=1782896928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0zDJIsdcRHDPw/miWgCz4K35ukh8QBHN4U8NYjAhemY=;
        b=JNnKEgihcGleATReqc3/cXjvWG6m9V1X1twXe1u1CupaEcWvtNuw83d1hS8ZgvX2Qp
         wsEFEwGKEzNkeJD2VbRM2fDjnxVPldx6g9uCuYbfZyrluuk6iDCZ7MqBN0AuVToWLM18
         gWxFhkcpodu9LcUMY/Yneve6kUldjB7JV6c/5HzSbF/r7nZVTt7TVIz1ciV+iPQaNaWm
         wzZx0gz6t02FP9QuPNK1rAHt3VedoqMTIzUVxLkDGmj6IXzHAPe1QyMltBhtAmJwhVlq
         L5LAmc4i3omjQgnl95my6sGklLXOInryFkv+tQxOgqwL4pjpjsE8u0fYw0Dg8F+3zgUK
         DS9w==
X-Forwarded-Encrypted: i=1; AFNElJ8Q9pMUb8ZaXhCPUzaoC3f/pTbgyXHUCbB0gvaXlDalThIRscLMh0plM4a8/TymNQffy/BXAl+RFd5mFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yykap8EtmPK1VPuLO+CLpL8rOSCt1GSzTckGv+ED7Rq66rnljyW
	49S8+hvDFy3w22R52G3HJd/7EfUlEjXs5uCzd7oRznP9/n+r+9W74OMupHjesF5ICduCQCdsOrU
	XZWYk/8pk7+1FPPxhI8phabcmk86bJSMvjGu8sxkJDWv3XfOEcJWGkzJVdwTPtHYpyqyomKTOeS
	RRn/elxifzq5Hg4Hhh41iRzhQg1QYkMwGlpI6LywU=
X-Gm-Gg: AfdE7cn7MazxFXbq1Bc6CYAoVHPdoTKjCJEm9q8QXPiaun6hoW4/PD0Hj1+fLDP3d32
	/kW2RXrVi+iv5Z1Qpby+0bGmU6kwLL50mUuplFR6w9siuExpxSSCIsJdFhL88uEqJTvcx3IwwWv
	o9+1UkWneH8WFle6fU5wBxBGoBa0AIrBN3ln2/NBoXFPb4NSEMk0qxEOC2CmCgaD6VjA==
X-Received: by 2002:a05:6808:3c43:b0:490:c2e1:4f20 with SMTP id 5614622812f47-490c2e15378mr952877b6e.27.1782292128110;
        Wed, 24 Jun 2026 02:08:48 -0700 (PDT)
X-Received: by 2002:a05:6808:3c43:b0:490:c2e1:4f20 with SMTP id
 5614622812f47-490c2e15378mr952866b6e.27.1782292127668; Wed, 24 Jun 2026
 02:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624033508.27391-1-hpa@redhat.com> <20260624033508.27391-4-hpa@redhat.com>
 <PN3P287MB1829650C00C45055F7E923468BED2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <PN3P287MB1829650C00C45055F7E923468BED2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 24 Jun 2026 17:08:36 +0800
X-Gm-Features: AVVi8CcCbAyGU2TVfnClxLWNlyeCvd-g7DGmZGFjdR5CCg-iGFOjBy8N6wlPNmM
Message-ID: <CAEth8oFeS_aQ=6rdiJwCN4fuj1H530qFEG5iXMRJWJCL23rtiw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] media: i2c: imx471: Add Sony IMX471 image sensor driver
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Serin Yeh <serin.yeh@intel.com>, 
	Damjan Georgievski <gdamjan@gmail.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65524-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tarang.raval@siliconsignals.io,m:sakari.ailus@linux.intel.com,m:serin.yeh@intel.com,m:gdamjan@gmail.com,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,gmail.com,kernel.org,oss.qualcomm.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,siliconsignals.io:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A22A16BCD51

Hi Tarang,

Thank you for reviewing.

On Wed, Jun 24, 2026 at 4:43=E2=80=AFPM Tarang Raval
<tarang.raval@siliconsignals.io> wrote:
>
> Hi Kate,
>
> > Add a new driver for Sony imx471 camera sensor. It is based on
> > Jimmy Su <jimmy.su@intel.com> implementation and the driver can be foun=
d
> > in the following URL.
> > https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/=
imx471.c
> >
> > This sensor can be found on Lenovo X1 Carbon G14, X9-14 and X9-15 lapto=
ps
> > and it is a part of IPU7 solution. The driver was tested on Lenovo X1
> > Carbon G14, X9-14 and X9-15 laptops.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > ---
>
> ...
>
> > +static const char * const imx471_supply_name[] =3D {
> > +       "avdd",
> > +};
>
> As we discussed in the last revision, this should be "vana" instead of "a=
vdd".
> Better to use the regulator name as defined in the datasheet.

"avdd" is exposed by INT3472. If it was changed to "vana", the driver compl=
ained
[  205.839599] imx471 i2c-SONY471A:00: supply vana not found, using
dummy regulator
[  205.854821] imx471 i2c-SONY471A:00: Error reading reg 0x0016: -121
[  205.854830] imx471 i2c-SONY471A:00: error -EREMOTEIO: failed to read chi=
p id
[  205.854834] imx471 i2c-SONY471A:00: error -EREMOTEIO: failed to
find sensor: -121
[  205.855354] imx471 i2c-SONY471A:00: probe with driver imx471 failed
with error -121

So, avdd is necessary.

>
> Other than that, the driver looks good to me.
>
> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
>
> Best Regards,
> Tarang
>


--=20
BR,
Kate


