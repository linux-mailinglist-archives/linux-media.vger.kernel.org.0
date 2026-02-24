Return-Path: <linux-media+bounces-53281-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD/9OD1ynWmAQAQAu9opvQ
	(envelope-from <linux-media+bounces-53281-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 10:41:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC2F184CDF
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 10:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E24430FEFDC
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 09:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B986F36F435;
	Tue, 24 Feb 2026 09:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BcAJpXIu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69BF36F405
	for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 09:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925931; cv=none; b=IRe6y45l0stovgE7qCPFrAm2PEwGa+oaZkW5lae2xnHjgzfyCkm58+8Uz9TFN91EBZBDN5dWnvdIL/n+nbnkqeRIaGbG6faELJrA3qCapIpP+CHVWsO7YvSi+E6+pendDOuoiLaD0MV8w7SOaxDWqa31UyVGxpEfgw8lkp7YusE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925931; c=relaxed/simple;
	bh=vrOwT2zdhPpYwbxTHIwCosOwLSm+fGT5PZAYPa9XcZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HHkktE/MvHA6vme7J+c7XEMhK2hpAG9JmHGudxekOowxfCoIfqs0FkHLZMwcLDrWdbmdy1pWhVzsj/0SK+KQ8BEHFGBK2U3vI7OtR9o1epBQhSXxUeAiaKUzM/vDKc9CBS/XaTDAbQwYv2dwfOTdMgY3Wo19KBr3QVkFlqNhtIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BcAJpXIu; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b88593aa4dcso745397266b.3
        for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 01:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771925928; x=1772530728; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0pWTtFAp7Ip6/fnOEZD8KqTarhePrvfh7KE+MPmCm1w=;
        b=BcAJpXIuPgSQbgHMrMLaim2afdUHZBSE//iX/yyj/o+6GdtHThO5rdQeCyXLqL3bIm
         vi/AMpKpn2jPG6BlNmU7dsjR7E68aj9nBF42w6O/G+gi7EEvcbQk4yn3aN+y3SDxCSQr
         UgqxJ2wWPEBYeFXuXKZOQQi98Jifw3qoLyLwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771925928; x=1772530728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pWTtFAp7Ip6/fnOEZD8KqTarhePrvfh7KE+MPmCm1w=;
        b=bBbKHcuXQSdraS0KygPUf8959Dunm4Bz0m64qhRu6n+6dVDJtMoC4Ca6cPQzjR33iP
         1QmkwurxpqC4RK2wOK/JBV6Uo7L/CvkKBLmcx78vG/BKafFocOAl1sgtAy/xdOyXSwTX
         Ot//LsPVFWAQEm+z7xd5BJxVhXDSKcvaee1ciVd0StMJ/Hkv4YdlPX5YZDh+bXP6kQYW
         PQwX0N+XEybvgTlHFiIe3am1vF5KCT+VJTJVzJVelzpeCj1tWByOmnzi2cjy0eXn3kvc
         uab0wIx4C47BueCP+UFtlEoJIdvlNNMPRDAbX68y9KIY6DyRy6OBvSScjg8MHFq2hS6+
         pc7g==
X-Gm-Message-State: AOJu0YxfMnV6QzGbDQeKHS3iOWp4c+6bL1ipIcird/MpLSP9cEXfbNMX
	uxoauLVEymnCW09cQppeeYyAU8LF+sSB57TRiwQ3Q0Q9Ujz8NoOKntpGjQLRHWcDXYIFVs6EDPA
	pdwpzUA==
X-Gm-Gg: AZuq6aIiJBDw0cv2fP0TG/rTbR5LBMrnJdj4tXeYWnNPFkqJuClf7+hyXYvkJeAK1+9
	6/WiG0NS2aivVS2gPxoJXdQNq3xNFGr/ezsi8wro99W7Ry3KlVRpCr56EVmF7+bt6P4U3jn45H5
	Aprr0wyd4Sbt9E3EsmRsiJZJwef+SI90YUANZWRwj0T4OiiIpwimxPV6Y7bff985ykyvPAvOL+e
	ynbXN6laFoeDUrASWpGn0E6bV44kyXigfsBzGjzrWuZI0Iv28DhoHA3ciUcd6Ok3HMkgq7GMw5n
	8CpPZ7pgF/KED0GqwLGDzvlBGKT5Ix5NbgwYmwsqlChzxl9VtNz4l2qDtglH8QrExFWir0RNzxE
	aZnGR1zxGC4QRBp7eCM3yUF5eDaSCCFOOmi85gh4xNEz9Ydp9l9AZ8VPQuQqLRsa2i5RpD/6h/N
	/TS9RYakqSH2O5i+QHsuNHMhC8DUYS1GgVvSl2Pj6OWw4Bszr2h3rS5w5pdcTH
X-Received: by 2002:a17:906:6a10:b0:b8f:9636:9acc with SMTP id a640c23a62f3a-b9081a022a2mr862052166b.17.1771925927686;
        Tue, 24 Feb 2026 01:38:47 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b90ba281d69sm99757966b.28.2026.02.24.01.38.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 01:38:46 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b88593aa4dcso745393966b.3
        for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 01:38:46 -0800 (PST)
X-Received: by 2002:a17:907:d78a:b0:b8e:fe3c:2255 with SMTP id
 a640c23a62f3a-b9081986117mr627068866b.5.1771925925863; Tue, 24 Feb 2026
 01:38:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <00333af8-f065-4106-bbd7-23bbea0bb7d1@disroot.org>
In-Reply-To: <00333af8-f065-4106-bbd7-23bbea0bb7d1@disroot.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 24 Feb 2026 10:38:33 +0100
X-Gmail-Original-Message-ID: <CANiDSCtnUeJVDPQDa+tNFDC32CxUG9yeC9PGdyf5jadOLh-pJA@mail.gmail.com>
X-Gm-Features: AaiRm50rIQ0wdWBEBQ7T5B_RmaCpM-oeyUaLgYidMsKxjY3PtjoMVaOrvuV3FV8
Message-ID: <CANiDSCtnUeJVDPQDa+tNFDC32CxUG9yeC9PGdyf5jadOLh-pJA@mail.gmail.com>
Subject: Re: [RFC] uvcvideo: IR camera support for Windows Hello devices
To: "Seele Volleri a.k.a. 33335" <33335@disroot.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	hansg@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-53281-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,disroot.org:email,chromium.org:dkim]
X-Rspamd-Queue-Id: 5FC2F184CDF
X-Rspamd-Action: no action

Hi Seele

On Thu, 5 Feb 2026 at 19:19, Seele Volleri a.k.a. 33335
<33335@disroot.org> wrote:
>
> Hello,
>
> I'm working on adding IR camera support to the uvcvideo driver for
> a Windows Hello compliant camera, and there seems to be no support for
> IR camera in kernel.
>
> Some devices (e.g. Dell 0JCXG0 Realtek 0bda:5767 from Inspiron 7xxx
> series, unknown sensor) have a combined RGB/IR camera. The device is
> fully UVC-compliant. Both RGB and IR modes use the same streaming
> interface with standard UVC video streaming. The only difference is that
> IR mode requires vendor-specific Extension Unit commands (on XU ID 0x04)
> before starting the stream.

Some questions:

- Does IR mode just enable the IR LED?
- Are there two sensors in the camera (RGB and IR), or does the camera
use an RGBIr Bayer filter?
- When the camera is in "IR mode" can it support the same number of
resolutions/fps?

Thanks!


>
> I'm considering the following design questions:
>
> 1. Should the vendor-specific IR initialization be done in-kernel
> (in uvcvideo, by vid pid) or in userspace like
> https://github.com/EmixamPP/linux-enable-ir-emitter ?
>
> 2. Should the device appear as multiple /dev/videoX nodes (RGB and IR)
> with mutual exclusion, or as a single device (RGB or IR) with a mode switch?
>
> 3. Should I directly add vendor commands in uvcvideo.c or
> new file like uvc_ir.c and uvc_ir_realtek_0jcxg0.c ?
>
> I have a working prototype and would appreciate feedback on the
> approach before submitting patches.
>
> Thanks!
> Seele
>


-- 
Ricardo Ribalda

