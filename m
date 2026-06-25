Return-Path: <linux-media+bounces-65606-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AK4qG/nAPGp2rQgAu9opvQ
	(envelope-from <linux-media+bounces-65606-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 07:47:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C00A86C2D75
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 07:47:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=dSkhZv+V;
	dkim=pass header.d=redhat.com header.s=google header.b=EYLo9ogN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65606-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65606-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E61FC304F2E2
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 05:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E2F3B71D9;
	Thu, 25 Jun 2026 05:46:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD2A3B637A
	for <linux-media@vger.kernel.org>; Thu, 25 Jun 2026 05:46:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782366390; cv=pass; b=uMVlmbL1joOYIoEKWFfoTwOMwtbPBGQ6UjqWqaN7P+8T7mNYbI7RxsUDl2omEXT336V8UMejJbaOZyIurJZyepTkW74D5jkbdv6HqGRED2kP4H1oYhbrYIzF1+1kXEKIMAEDom/SSIb8RjLUc2owHw75FgTQ9sLsOlBnKfSnBSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782366390; c=relaxed/simple;
	bh=u64RvTlM1FjGbHcBjWCu0lMoAFNXctiPc4NQOUXiX2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SwPiwkW1dYxzqkiyanQtabvf5gokQAbtO+tkUIR5MhR/sEP9KjiwMhMy1K3uOH457OwvRZGJhLcrLn9h1rthZAusK99kbAvV/et+F9K/W11Vqqh1e+BEOWAfWtZ6QOf/mjaN2k1wMOVKFyQ2nSnW4sWF6rUNRz8Nyre2iQhXzbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dSkhZv+V; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EYLo9ogN; arc=pass smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782366385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+2XqT34uBjGrbRn/xq5WUAGLvLo1TwT3rVXbssVxSIY=;
	b=dSkhZv+VOoj1PzmN0J/q3K97BuRnU6VDAUkT+V0ukVH2cLGl1Wzzo7y++SauA0ND79a2NM
	+CvHuy93xk+lLkfgrIyjsQ62/QwN6+BKUkhxmjYcZ9Pw8smbIykbgnRjduFdyW5st8xnkp
	f8No8Em7BynsD8SMwqaAMvUqpaWdq/U=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-9-I_q9r7N8abhDKkHogWsg-1; Thu, 25 Jun 2026 01:46:23 -0400
X-MC-Unique: 9-I_q9r7N8abhDKkHogWsg-1
X-Mimecast-MFC-AGG-ID: 9-I_q9r7N8abhDKkHogWsg_1782366383
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e952885bc5so2389907a34.1
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 22:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782366383; cv=none;
        d=google.com; s=arc-20260327;
        b=Sp3tqyfAki2xul7kanLe63btMJpWe57rSErNFeqRokJOYux/KOT9MLS7iy3mb40dLz
         t2Wi2RzHfB3KmlT1exDrNYbAbpodHXsHeFe+1BolDuYMa0/55a9KIYQEFE+bztze1xPw
         gQe3LhcakT0+Q/ZIBCHXiYnRFOM0BshP1Lrpc2jtYvE9q/RdLHs7nDXf94w6LhxJS+Zj
         5jn8/ddbwVVjkANdTN9wAd/LqRW1b7toJGB+mPTGpw8gaBhbEN9JZPMgwVHdL0sHCiUI
         mWFIQQ3V10cIt8O5xCPGy4ViZRh+fef3ntg8UpIYBxbjRllnSF/ipDk1tZO5sOuDaMBD
         kf0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+2XqT34uBjGrbRn/xq5WUAGLvLo1TwT3rVXbssVxSIY=;
        fh=UdqFT0++BLDSZvjrLjY48U4HuYZgxPt/SXIWDFH0LZU=;
        b=NeENZRqBjnm9KWRO6kG9bV8hiukX1rtFByM2sb/1irdq0wlDozK/uhZ14OByV0UB/r
         pUebT/5DMDVRRG/5Peo5Qj0nZ5itCd0XHyf3FzdTZ0CSuoRzEFFmrwcZZS8CpykmPEoM
         VnBQGsI75Z6Yfr+pc2EdHRnT79aQRr1Ds63Y9B/fdKO7Mc/jDd346YdLKmyZb0GL2x2r
         N4Z9TbPhDt0+vajXpcgPSbcNsPfx+9r1oSM+hrXGNO/sd8yxs+7rH9UA3W3+n/r7yPDt
         2n1zUb/5om2TkGpOWW0nZ1Up8jHyDrS7ClUwM9nWfAW/t26xHUC65EQnHlIGAM5wuoLU
         9T9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782366383; x=1782971183; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2XqT34uBjGrbRn/xq5WUAGLvLo1TwT3rVXbssVxSIY=;
        b=EYLo9ogNHqs6dqB4385HgtaaNA8vYmwjM2d3yyzUDFBEpJY8S+GIyt+vvFRpsgHKeO
         5c/1MMmjYKoPqDA2/GHLDr1+FGC8zfuKXhoi+2li2ZmgOqoP+j+m7dYbKiHmdJYCKPI+
         CwWB9DWWt7siOVg8ePbIrqDk3cDejhalidcJxcm01ofXyhrTfvyVIh+BsYsZ8OChaH3B
         ahH86Yq5aurVhZTmGRclbvWYki/y+qb2HW/xVDPeFobB6AiVvR1+W4PZalGV0Ka2+9rK
         GOfyUooHeRmPP+PPEvH7KITeTkBA68nOcpMAjnSeaKydaYi9C0YQaC2mHw62t/wSyLSR
         bpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782366383; x=1782971183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+2XqT34uBjGrbRn/xq5WUAGLvLo1TwT3rVXbssVxSIY=;
        b=nszqe0/JK4GsMHnu/7I9nIWr0tzxr119FvPgs2HtcCyuzvZzmjkkzswqZm3iAKSF8s
         XJp3sIDf+rBtQQ4IdpIgZ9RQfM8uydHDhgXpQrNxHRCBgEGYmet6ZLZk6cFPLMfs1B4g
         oi1PruHPa8M4NKYVRotAP22Ju46zMEoW0WbSqW1sxMI3OigGQr0og217o/y/OOBA/FiZ
         qcHPZzYf8XWzQyU/MLlkJ4ReaSniOBIs3uU2Ojf64t/ANwdN14YIvIS7vRLIcOa7h9NW
         U26MtRX/cA09K1YVMvEMykWEDiTv0RCimbW9D9J+ojVVv4YFY7gFykSPl4Cr/BZJlIky
         ZZSA==
X-Forwarded-Encrypted: i=1; AFNElJ/bUWByWpYgsao75y3SP3FT3TiEF44siT8I+wHEv6WLO9jAZz8cei5GF6Y2XzOORrzWdLVjFfCpSmdpjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiWAXcFAfhD97IGkN+L0UKJcVf7PIwenDuNCE/By+cLUNQMn9W
	5ZBeuhGKvCjqw7o7tbwvATL3uKnGhEx8qkYhg1PM1ik8EQPrNgDtInpe5nLoHluypX2WnAGWr67
	5v6I6uGgWpsVe7EO0EQGSX5lNxT1OjAGpD0CMreNQiUvr7979GwYkFHcVBcDvIHujgyM4PTbJQP
	3BxoieoAgNG6SCaddmUeePMEalHJe00m0U2SZ6aUE=
X-Gm-Gg: AfdE7cndyKFjDMEvokEukB/haAo1XgbbaF/g04drNQN6b1m9feOHitOawHbU5+pjI2R
	hbujI+y56F0F71JfGqal2HxqaGs+cczdgsZ5Z04K2adVuNGbCie1Hm11g676SZhVe4TeSzbKELH
	0vhLplt7z0Id3TBJXNfzzlDAs9XzE8b2FC0LjyUJHeQu0oQYL1+90o16DOGFIJLUik1rs=
X-Received: by 2002:a05:6830:81f0:b0:7d9:f50f:9691 with SMTP id 46e09a7af769-7e99be6f45fmr1222910a34.0.1782366382867;
        Wed, 24 Jun 2026 22:46:22 -0700 (PDT)
X-Received: by 2002:a05:6830:81f0:b0:7d9:f50f:9691 with SMTP id
 46e09a7af769-7e99be6f45fmr1222890a34.0.1782366382454; Wed, 24 Jun 2026
 22:46:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624033508.27391-1-hpa@redhat.com> <20260624033508.27391-4-hpa@redhat.com>
 <178230652068.3075020.18062205400239666843@ping.linuxembedded.co.uk> <PN3P287MB18292427E6E41029373E9B1D8BED2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <PN3P287MB18292427E6E41029373E9B1D8BED2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 25 Jun 2026 01:46:10 -0400
X-Gm-Features: AVVi8CdpvhLI_rVMhAb1_IkWsz2XhU7AifWk7yfcQ96AYXx7I40Rc83s7Iq2fBQ
Message-ID: <CAEth8oFjkprr7X6ha3jt4V2sUeU7T+1+DxxdNRk1Ek-hvagkjg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] media: i2c: imx471: Add Sony IMX471 image sensor driver
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Serin Yeh <serin.yeh@intel.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Damjan Georgievski <gdamjan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65606-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tarang.raval@siliconsignals.io,m:kieran.bingham@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:serin.yeh@intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gdamjan@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,oss.qualcomm.com,linux.intel.com,intel.com,vger.kernel.org,gmail.com];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,siliconsignals.io:email,intel.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C00A86C2D75

Hi Kieran and Tarang,

Thank you for reviewing.

On Wed, Jun 24, 2026 at 10:09=E2=80=AFAM Tarang Raval
<tarang.raval@siliconsignals.io> wrote:
>
> Hi Kieran,
>
> > Quoting Kate Hsuan (2026-06-24 04:35:08)
> > > Add a new driver for Sony imx471 camera sensor. It is based on
> > > Jimmy Su <jimmy.su@intel.com> implementation and the driver can be fo=
und
> > > in the following URL.
> > > https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2=
c/imx471.c
> > >
> > > This sensor can be found on Lenovo X1 Carbon G14, X9-14 and X9-15 lap=
tops
> > > and it is a part of IPU7 solution. The driver was tested on Lenovo X1
> > > Carbon G14, X9-14 and X9-15 laptops.
> > >
> > > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > > ---
> >
> > ... <snip>
> >
> > > +#define IMX471_REG_EXCK_FREQ                   CCI_REG16(0x0136)
> > > +#define IMX471_EXCK_FREQ(n)                    ((n) * 256)     /* n =
in MHz */
> > >
> >
> > <snip>
> >
> > > +
> > > +static const struct cci_reg_sequence imx471_global_regs[] =3D {
> > > +       { IMX471_REG_EXCK_FREQ, IMX471_EXCK_FREQ(19.2) },
> >
> >
> > Does this work? Is this a compile time constant multiplying floating
> > point with the compiler, or something happening in the kernel?
> >
> > I'll be happy if it does, but it catches my attention as something I
> > thought we couldn't do.
>
> I tested this with GCC. It evaluates the expression at compile time and
> folds it into the integer constant 4915. The generated assembly/object
> file contains .quad 4915 in the initialized data and no floating-point
> instructions are emitted, so the kernel only ever sees the integer value.

The compiler didn't complain anything and covert it to a integer but
putting a floating point here is not a good way.
I focued on finding a register value without noticing that it is a
floating point
I'll set a value IMX471_REG_EXCK_FREQ directly and  drop IMX471_EXCK_FREQ.


>
> Best Regards,
> Tarang
>


--=20
BR,
Kate


