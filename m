Return-Path: <linux-media+bounces-61008-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGyDMyXI/2le+gAAu9opvQ
	(envelope-from <linux-media+bounces-61008-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 01:49:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4521C50207B
	for <lists+linux-media@lfdr.de>; Sun, 10 May 2026 01:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 374CE3017FAC
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 23:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E53B3D6CA3;
	Sat,  9 May 2026 23:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BNIHzAF/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A51346A1C
	for <linux-media@vger.kernel.org>; Sat,  9 May 2026 23:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778370593; cv=none; b=Cg87xgNh8RpRxdMnkcl8S1OM3Ui8O58nVNnV/g+hvpym29lRFkyTzjfGJe1ix1mf3jJ2vWmpUDTBB0Ce74nVYs9ZG5baOzGOk98BaX2XiXM+yUS+WMWFuvnGhWrG4SgJWgc6dCmwrkqMCZseN/HT2zdFf9KCM9ukwQZu7UIcF24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778370593; c=relaxed/simple;
	bh=zgXEoxRcJ8OTXvvAq2ABXgBarj0xpbrLYpJ+iis0CX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGbblY3V4oDEekPBbc6eVxidXyuN3GEj1HQAYIFrTQiiPL7Pb6CE/D+HQsviNrJQmTccYc4TFJWkllhGBDkMxbqja4fOFiKAHRgfPbyvX8+mlVqkVwYZ3pYLjcHRM3x72qw8g4ZZA7oSTmhPgly2n88LfTDZSq5D0kqZdSqGH6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BNIHzAF/; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67f94c078e8so338115a12.1
        for <linux-media@vger.kernel.org>; Sat, 09 May 2026 16:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778370590; x=1778975390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgXEoxRcJ8OTXvvAq2ABXgBarj0xpbrLYpJ+iis0CX4=;
        b=BNIHzAF/RaO8LnRDviJY6l+f83uknU/+WMknnHXzV4aSGRy0FGMSyusVrOQnM9o2hr
         FK76ky4TrQ8j75GYQH8/woLxRs1ViwDGFic26SwInvoNliUoks1moZpWwCoaVZLFA2FV
         VWw0JvbxMu4a0pXK+4sfD6IJiZ+8qdpyv+q1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778370590; x=1778975390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zgXEoxRcJ8OTXvvAq2ABXgBarj0xpbrLYpJ+iis0CX4=;
        b=PiXQztAxQ1QKJZu43kv2A88FSObwfOyRtCRsnTJKy2rKBlPCghmNYYuu7vjX5ddx8O
         1yDnmtDNphKwOlA3OBYu6U2RPnKoNKvk02DueIQfsntPOngYBfjBo4xKZ4XxDylyTtoY
         TPESwMOqZIViwjIIaFcL5ZcRdCbPgIOAAg4xNeRJm1w0WhZqD63UN5NXLOCdvqTGckWZ
         ok6j+fRqXWLWuh2f8Y8ZbvgW5S1I90JZ6d4OedDkCazWGpHPDnOhRvyojS3yAh7vZ/s8
         1KLQzIVaSaGSgVoLTkQPakunNGmp4k0B6WqxHkCI0P/bihoAMfzZIM1VC4E6+1xOQnOa
         3fpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vyQruEapGTJKg5WaI1xJ5VAiZWCe9xWvTc8kcNplmzcofTgjvJwDFtzD/t+gkXMkuzrz6iqge4F5a9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOwvyvopZixYs82eHxKrebUWyfW+BOCt82dyEvV9n/N6tUNFKt
	1Ti4GdbX2jAZfTOAgQpJ16ecLm5/o6ht65KLD5sBj3Q3OcpDbic0dly/NA+8l2M+ho3ZWTh8TIr
	XTGpkHA==
X-Gm-Gg: Acq92OF8wy+Mrur7UrDVv3WUxgcgvH+94KPM20Yfr7zmnzXRxikcdG1QaPDCkNrnnfK
	EoDmEJCKVadUekIV092o4CZfFXFj+Y9wcOn3t1/zUqT5va+KZRiRifKXeZ/ZPdANaKgkJ08WOv7
	CIXXP0j+jX0IgaUOC5JuBDQprQJ3NbVf8RdxjtDXGLeUHDF7Wcn3BJkrxPWXZGgVhMUsGntxOhf
	7nfBSdQY/WdMCq/wGB7ALIXhOEKglVdXgo7aL9M+rUDsIhVRSt0QqGZoyN4jj+eDj12l7ghWVyn
	ymdRNicNq5Zv3k+9+GKeeBifwdsMkH7kZrTSpqZodJh5vA8IcAUu7PuZcnyOeEfCk61V8w7q5fm
	jA9JbyEO30AxBmNDvkSpCwnAXrcA08E+XIQy4Takecl+zKz8z0zCBw6i5DnfZe0S1CQnFMdATj8
	8/JSmpNQe4quaJle/4smqJDvOIdgRu8NuKFesWEE4oz104K/mWEeW2lx43lOSBuqgwTJeiikE=
X-Received: by 2002:a05:6402:a301:b0:672:bd8d:222d with SMTP id 4fb4d7f45d1cf-67d642c3629mr6944674a12.16.1778370589966;
        Sat, 09 May 2026 16:49:49 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0dfd34fsm2133815a12.14.2026.05.09.16.49.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 16:49:47 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9382e59c0eso497271366b.0
        for <linux-media@vger.kernel.org>; Sat, 09 May 2026 16:49:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/bhgWTIFLtWy6bYP0DKIR3WRcEHplm3BSHxo3baVgmH9jvxMDOPteGnaHDtcUCXwN4MZ9/NsYXk1xq5w==@vger.kernel.org
X-Received: by 2002:a17:907:3e9a:b0:ba8:e7b5:39ad with SMTP id
 a640c23a62f3a-bc567967b28mr1021990566b.0.1778370585854; Sat, 09 May 2026
 16:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7d5d52bf-b0dc-47d4-8cb8-d6099fd05c57@amd.com> <470a9fbc-c4c2-4bde-a91d-a22f1c730b31@amd.com>
 <LV9PR12MB982900FA14329B742FF64BBE875EA@LV9PR12MB9829.namprd12.prod.outlook.com>
 <adSlwqPVF81feLHx@kekkonen.localdomain> <21dfb3d2-d838-4325-8a6a-6024b851cbc5@amd.com>
 <afpSBiF8sUqulE-7@kekkonen.localdomain> <21140553-f207-468a-9357-a0ae08aa28c4@amd.com>
 <f68addf9-eb16-4c87-b281-b4f1dcc4cc63@amd.com> <afxcirtLHxeiaqF7@kekkonen.localdomain>
 <bd5ab106-e0ef-47d5-aefa-7304ad84105a@amd.com> <af5WB7z6hfuHUS1P@kekkonen.localdomain>
 <0ffceabe-182a-4dad-ac62-665f089df330@amd.com>
In-Reply-To: <0ffceabe-182a-4dad-ac62-665f089df330@amd.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 10 May 2026 01:49:33 +0200
X-Gmail-Original-Message-ID: <CANiDSCtYQVCKfqNOV-H_CBFysxtM5UT_R=Q01+8A=j3Mr5=KwA@mail.gmail.com>
X-Gm-Features: AVHnY4LjrSg3qti9cljJ2ZO0J-75hIlymE0_b9_f3CQ21x4OHgZkvw9uyB6fFs0
Message-ID: <CANiDSCtYQVCKfqNOV-H_CBFysxtM5UT_R=Q01+8A=j3Mr5=KwA@mail.gmail.com>
Subject: Re: [PATCH v10 0/7] Add AMD ISP4 driver
To: Bin Du <Bin.Du@amd.com>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, 
	"Limonciello, Mario" <Mario.Limonciello@amd.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, 
	"laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>, 
	"bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>, 
	"prabhakar.mahadev-lad.rj@bp.renesas.com" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"sultan@kerneltoast.com" <sultan@kerneltoast.com>, "Nirujogi, Pratap" <Pratap.Nirujogi@amd.com>, 
	"Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>, "Li, King" <King.Li@amd.com>, 
	"gjorgji.rosikopulos@amd.com" <gjorgji.rosikopulos@amd.com>, "Jawich, Phil" <Phil.Jawich@amd.com>, 
	"Antony, Dominic" <Dominic.Antony@amd.com>, "Gong, Richard" <Richard.Gong@amd.com>, 
	"Tsao, Anson" <anson.tsao@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4521C50207B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,amd.com,kernel.org,xs4all.nl,ideasonboard.com,linaro.org,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	TAGGED_FROM(0.00)[bounces-61008-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,intel.com:email,amd.com:email,registry.freedesktop.org:url]
X-Rspamd-Action: no action

Hi,

You can check what media-ci uses by:

$ podman pull registry.freedesktop.org/linux-media/media-ci/static:latest
$ podman run --rm -it
registry.freedesktop.org/linux-media/media-ci/static:latest
# cd /media-ci/third_party/
# git describe HEAD
v0.5.0-9187-g9dcab8cc

Regards!

(you can also use docker instead of podman)

On Sat, 9 May 2026 at 04:00, Bin Du <Bin.Du@amd.com> wrote:
>
> Hi Sakari,
>
> Sure, I'll send a follow-up patch next week and Cc Ricardo as well.
>
> On 5/9/2026 5:30 AM, sakari.ailus@linux.intel.com wrote:
> > Hi Bin,
> >
> > On Fri, May 08, 2026 at 10:52:55AM +0800, Bin Du wrote:
> >> Many thanks for the update and for merging the series, Sakari. Once th=
e
> >> newer Smatch lands in CI, I'll send a follow-up patch to remove the
> >> workaround. BTW, do you happen to know how to check which Smatch snaps=
hot
> >> Media CI is currently using?
> > How about posting a patch next week? =F0=9F=99=82
> >
> > Cc Ricardo, too.



--=20
Ricardo Ribalda

