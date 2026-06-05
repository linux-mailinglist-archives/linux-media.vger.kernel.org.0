Return-Path: <linux-media+bounces-63881-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZBGWFAOOImqbaAEAu9opvQ
	(envelope-from <linux-media+bounces-63881-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 10:51:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A05AC64695A
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 10:51:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=TVWdWE6c;
	dkim=pass header.d=redhat.com header.s=google header.b=gMDtSOTi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63881-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63881-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F70730293DE
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 08:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C1C47DFB5;
	Fri,  5 Jun 2026 08:43:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A15343E9DF
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 08:43:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780648999; cv=pass; b=DLbrCk4rK5iYPwrZi8Sz9RhlpdLn58z2jChBmneJsnb6hN/exlEBFzGnH884fId6SRZOCULXlpgitAVxKcCdrsBYaaSNoA7K2Psb5pjTZGPuatau9lAkBCuAmOh0Xg9bVIKD79A0W4I5OxYVtQbtTXEV79gzeGUiE+7/pDx4ev0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780648999; c=relaxed/simple;
	bh=CNWH9ao7DvGH/ks1WEJWahX2MjA5H8hWhniGZuBHx8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5fh2/FHgYFCnISKIJgg4lx1xyGwWwMnsB3cYJ7XYHuevR/nJ7Yeu+fZ7T+wsVK6uWXIyBdkyG3RWarmzMH5tXwTyAvoIC3PveBg+voWwZj//P55JDBdhRbDVTwh7KhFYgrBcGGX/2C3SVmc9l5ynhTt4OywZVFrlNRjKwQLvPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TVWdWE6c; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gMDtSOTi; arc=pass smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780648996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eMae2+c3JdbbrI6YxmLsWrXKoWxQa6UVZk5Fpx9h7nk=;
	b=TVWdWE6cbhvytfBqHBnpZ5ytwMF05OxymKNg+QFu9i+u06+q8XpJu1D/pwfg1jAcf/xj8B
	HpIIPkE7OB+3RwrDWWllMHxMFtazK0kkTtDJgBfmCE6AIVALHk6LbHXHAZbKgdE1BrAQon
	9C0zxxVmelcaNLmkWqEl+AZZK4XoVc4=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-JdzOHkW_N7W28F7TwBajMQ-1; Fri, 05 Jun 2026 04:43:15 -0400
X-MC-Unique: JdzOHkW_N7W28F7TwBajMQ-1
X-Mimecast-MFC-AGG-ID: JdzOHkW_N7W28F7TwBajMQ_1780648994
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-48576b535b6so1401485b6e.2
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2026 01:43:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780648994; cv=none;
        d=google.com; s=arc-20240605;
        b=HtGcazI2Zjv6Ttis8S+Mp7imVLvlk+Yr3heCR/yBxzSWm5/oqyV2EOzBkBJL4ld5b8
         uMJ6LrdosKBr5ayjgZ0AfqCrl1obbJ1vLTzB4+C+6bDZltWmmJviW5i73ceeR4tp91ho
         DC7sSdNTXFnJIUtsmVyIf+UVFuX+QlooLdxXIsgxLYTscURZS0OamNO2ZpcRx1JEjQ5N
         WBu9T+f7HdOHb43N6/Czj+GeVATEIDvbqHQhf4Bpxo5qXKeaD965V0DSwM6+saqWM3uY
         tzIa6x1VeJrZ+/gRbA0NeSNCBqUrQOk1t3M5fOtgXx+SGVuRAdKLxsC9cvKMuQ1U+664
         foZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eMae2+c3JdbbrI6YxmLsWrXKoWxQa6UVZk5Fpx9h7nk=;
        fh=YI44hmXbJb02TwOumwHHLiLTAbzopSNsxXYyWN8MqSY=;
        b=gOX1GdM/uEhptQ2waoqlUTSJDOrxxJ9/zpNBfDhorL+357s/Epewt1bfCWnNVei/e6
         95jjC9NRsTBdi4usrfiMJWIgaOqOxAnJAztsQWO7X6o9eNqoINlcpNa1hg6WhK50Pp2z
         pC7G45nVm3eS63zVjZ3mOQr6b8YqsJ9WQcX7LEMeE1HRpcnuUN6P4hwdpq9Xy0j9ND6D
         SaXeDPYHFAriRFBeDxmFlUsyGFjPMLrHb2kah7RYo8br+2aYlohPE3pi45ZBX7+jxx+m
         KqBjUhtVnywLTmtcSZUA0G5iwUiujq70puhnXj4qRq43tMiem4AVa0NZWsSa8asegTy3
         hNuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780648994; x=1781253794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMae2+c3JdbbrI6YxmLsWrXKoWxQa6UVZk5Fpx9h7nk=;
        b=gMDtSOTi3qJ8ZZ4Pwc6zW6Xaoj2cSIjxKNEFbUrLYD/kegAaNUitNRnV/h5ZK93zGv
         ACrC/jCvx5rXuW/GOWPlC2DwpoP+juW9RhcEUwhmihGSzGnCMF1Mtuvu+cjqD9H8OwLD
         DwcdrsnJYv5f/fDtuOqmXMPajhMWVurIz1x2dUpYdRMX9hJqmAjdvjlH4gmA4q48NjBI
         G8adMsOaFRahnBLkoRPPHIo1c0hOZVPqZbIzJiloP5zQCv1JG6+rsJDdbI4ggW/eRGH4
         AFMBRRZNMKpD03geZocPldJfVrUbLH/VAEQqNiLZTxFafO72XcGZ9BQz2mVxJmraKLIb
         /Yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780648994; x=1781253794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eMae2+c3JdbbrI6YxmLsWrXKoWxQa6UVZk5Fpx9h7nk=;
        b=SO6Uq0xBtOnkIqdyQnuJcri6yDKjuqk9zOAYUKGIrApARHCUU1QrELp/3+HZE1L5Ln
         c7NoX8x9f6OaiZYLUiYKnyPU92+ya85grKMo7/MqiePkXGPj0oGnNIrHa1flRRgeQYqV
         9s+QJ+dqolT1S/ZMnytT39sZ3EL1zTQQ11jBXtV+UMNGNlWD/dRudNilLoKUhT56q7vc
         eTxQskX+bXJOqGsM0F5ktM3tMp5WlQVu+HiGRFa6nX4ktYuKE9ClmKO5iqTDJMb++tCJ
         1H0JE6oPkbq/s5TYKr0uERjSOFqfmvAWQ2FAJ7nsGzi9Huj3Y44LFyJBWCsmHdSajHzZ
         rcpg==
X-Forwarded-Encrypted: i=1; AFNElJ/fzF3QH2/1/5xJDywQ2xxQf7oZcaxV/u6o4VfmktkM/IN+LBJm99X9cNu/poZIEObOXRPnPij29sAzZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHdHM1diGxTJ9kv7Tqde+xWn59Pdp3dR2AHdSRWFK4QQP9x8GC
	TEbhnObqz5FomMyXdOF5Y0NyDea59usXJrj7J+8cm4gS8h1l0xqmgp9+eCFpbRLhrdISLudke3S
	54qjnBm/h0pILUfDOvE+RC4F5scr6OzSzyFg8E3B2XbGLxtLGMfLqap+ws77xhbALsvW2v/34CY
	6XwGVSdMiTZhnII/7J1b+Hm9BFOE/6mP5xPSS7Fak=
X-Gm-Gg: Acq92OFpFia12c74NnT9KNLg7gRKn/LgLHvP7vUXGxaE2HeE8y3tQ94jk/bzAzgle11
	996yHVobQ05TE+Kv5R+9+yaog9hNDPI0DLVe2RBzwge4nDsRYN6qnXFFK0EQezSRGae9QNLMKEQ
	3bcp0TGbaerGwROsYX8Kg06SvuBMg+bYKXAnxnu5CAqHgBkPmt6xbYDJpFgoSf94I6fNOYzeidF
	nuEwkka+PtG/F0/
X-Received: by 2002:a05:6808:1304:b0:485:7c49:c125 with SMTP id 5614622812f47-4868dea7280mr1491254b6e.36.1780648994300;
        Fri, 05 Jun 2026 01:43:14 -0700 (PDT)
X-Received: by 2002:a05:6808:1304:b0:485:7c49:c125 with SMTP id
 5614622812f47-4868dea7280mr1491243b6e.36.1780648993826; Fri, 05 Jun 2026
 01:43:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522031121.11968-1-hpa@redhat.com> <20260522031121.11968-3-hpa@redhat.com>
 <ahDdMZjID07dRDhZ@kekkonen.localdomain> <CAEth8oGWfYpC2umZ49g5qEp_QoZXNKNJ6vMu2EtmnOy6BxZGBg@mail.gmail.com>
 <ahbYo3CSzkYI3jF9@kekkonen.localdomain>
In-Reply-To: <ahbYo3CSzkYI3jF9@kekkonen.localdomain>
From: Kate Hsuan <hpa@redhat.com>
Date: Fri, 5 Jun 2026 16:43:01 +0800
X-Gm-Features: AVHnY4Jc968m8yRJsoan2JSW3ndE2GlrfwcEOuAxMOrTq3a2t7U_-XCVByQv63o
Message-ID: <CAEth8oHOgPXWGFp9OYa3VGUK3p10Rnx=Kv-zPJRAS4k-rR-DFg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: i2c: imx471: Add Sony IMX471 image sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: tarang.raval@siliconsignals.io, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Serin Yeh <serin.yeh@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63881-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:tarang.raval@siliconsignals.io,m:mchehab@kernel.org,m:johannes.goede@oss.qualcomm.com,m:hverkuil+cisco@kernel.org,m:serin.yeh@intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@redhat.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A05AC64695A

Hi Sakari,

On Wed, May 27, 2026 at 7:42=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Kate,
>
> On Wed, May 27, 2026 at 02:14:24PM +0800, Kate Hsuan wrote:
> > > > +struct imx471 {
> > > > +     struct v4l2_subdev sd;
> > > > +     struct media_pad pad;
> > > > +
> > > > +     struct v4l2_ctrl_handler ctrl_handler;
> > > > +     /* V4L2 Controls */
> > > > +     struct v4l2_ctrl *link_freq;
> > > > +     struct v4l2_ctrl *pixel_rate;
> > > > +     struct v4l2_ctrl *vblank;
> > > > +     struct v4l2_ctrl *hblank;
> > > > +     struct v4l2_ctrl *vflip;
> > > > +     struct v4l2_ctrl *hflip;
> > > > +     struct v4l2_ctrl *exposure;
> > >
> > > Do you need all these? At least link_freq remains effectively unused.
> > I'll tweak these ctrl based on
> > https://libcamera.org/sensor_driver_requirements.html.
>
> I rather meant that you're assigning all of these fields but then not usi=
ng
> them. You could thus remove the fields and the assignments. But I can't s=
ay
> which ones, apart from link_freq.

I dropped link_freq from the driver but ipu7 complains of errors
regarding link_freq, shown as follows.

[ 3628.195722] intel_ipu7_isys.isys intel_ipu7.isys.40: bind imx471
0-0010 nlanes is 4 port is 0
[ 3628.196207] intel_ipu7_isys.isys intel_ipu7.isys.40: All sensor
registration completed.
[ 3631.754550] intel_ipu7_isys.isys intel_ipu7.isys.40: get link freq
failed (-2)
[ 3631.754562] intel_ipu7_isys.isys intel_ipu7.isys.40: CSI-0 PHY
power up failed -2
[ 3631.754565] intel_ipu7_isys.isys intel_ipu7.isys.40: enable streams
Intel IPU7 CSI2 0 failed with -2

So, I'll keep link_freq. :)

>
> --
> Kind regards,
>
> Sakari Ailus
>


--=20
BR,
Kate


