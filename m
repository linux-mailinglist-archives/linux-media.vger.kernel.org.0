Return-Path: <linux-media+bounces-67534-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2BpyBV7GVWrUsgAAu9opvQ
	(envelope-from <linux-media+bounces-67534-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 07:17:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ABD751103
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 07:17:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=googlemail.com header.s=20251104 header.b=MKjJFT90;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67534-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67534-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5990930D0B9C
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 05:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F24A3016FB;
	Tue, 14 Jul 2026 05:12:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083502F39B9
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 05:12:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005969; cv=pass; b=oQf0ekaHuoG3FIpqRQo6ExvRALR/T3jNynhx8qAUHXZtrcTmVOk/fxOE8SGaVhuhYgt+tgwGJMFzt9LvZGDerEKd5ZH7HgEwwDDMweaCOI6opOIRAKlvYGQV8a39Pl3bH9JSwxe16Ts/IyBTAg84brLBNEshuhWT8gYZsAO7sdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005969; c=relaxed/simple;
	bh=/uRkmkcj8gU8t5BfL4dxR5CXZJKYqNcUVTUFN6VquLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTNNUJIXvXJ2IDlFn7SKiKgZoCLj0GZOfcvHkTq8IWjF2sPmcrIn+mfm4u2JdwkSfMzcr0wMhFeyUwgUt7RUTvb6R7BFPjWyMe4lOVjxOUoIOPts/1Gkvkv1yiUHfRsGBmPEJRKCu0P4d8qvfDqmsf0qZDGSc2GeNevgLwGNVuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=MKjJFT90; arc=pass smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ce7d2adef4so6959765ad.3
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2026 22:12:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784005967; cv=none;
        d=google.com; s=arc-20260327;
        b=QbEbXPz0YDrZI0k+W35zRJCnyS4vdbBAR3KVncV7LuVVPH4BxIKAwX2q6k4jkYWiGx
         eQhDhVTEdXgu32/DYRXIH9rc8Kn1H2+rDd6pWXgn42HbM3R8Cf7Bh4Yn3LAKdfhx/i03
         2VtlKwgfL+3WDIQO5RnOLECKOCQYvuQK9SP0GoEO96+tJ/O9rMhBXommdTeks+aCyhSQ
         XOa4XmVKn/F7TXxJnDh5rawvR1orep05gSNom9GVJoectDU91mbXCswgRQyNkZmMGFOy
         lFFlz3wCzoBQQyrbOKN58sOD72MS6bsk3GGSobRaqXzClnD2ljTKfgKGbUOrVnD+WlbX
         5XfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/uRkmkcj8gU8t5BfL4dxR5CXZJKYqNcUVTUFN6VquLA=;
        fh=mBG6IdbLj7DVYnF9T1L+s5nLO3j0Cvuzg/Ar99kMLtI=;
        b=WAoPSouNv/bSKPKeLG7ySWYfT9Q6sTWYGgPPxo/atPw9BRhy9Y8dfmjJbtVaRvwJRz
         lcC76MhSceRDaiOArg34pPNE9MiERK+hF+ZPNeBYwDYGjmj5EG244TlOqJKgl+TbfV+W
         oYirTeZvMt7okH9r0jGBDN5DiYJ/5zCqJ6uIL7dz9o6mgrJmsMAeUknbZ0EQnIxBPfu1
         txCIjN16zcGoxeBuifaGYw0UEcz1I7EQEjkXZE57vTJCA9PXmfCBujh0DHsuvZflGKwi
         CKtkOinPFj2vNQbk4S1mRVrrws8VZZM6WbexcECSEptEzjzTEhjCCPx2RgAEVLRERRiw
         YK/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1784005967; x=1784610767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/uRkmkcj8gU8t5BfL4dxR5CXZJKYqNcUVTUFN6VquLA=;
        b=MKjJFT90CgYoy1RKbSE6kHKKU7Ak/0Lp/Ebfx0SqGrw5WTvgDbgZNdAotusl4Nr+cq
         ucahp6TlGnvktkMe+Zajgil7Bapnoi2mJwOxkLkLyN4E88F1FzXIdRvI/aLObwHWi/6N
         uAv4729C/qw8j9LwK8X1+ZG23ARNMhPEmJejR1qCxwTGVPhZYgBJijVNpEt6LJlL1fO2
         Va8riOuAf4rNu9IhOcmfmfHm8X3X3h+RLg+QQXXe8WaInGiWwH9cBlt5yG2AdhHye0Wp
         f+2l3e10MtK4WQHhD/OaL98ckYR1MTuq1qdggWPfYPayAl1LklIwBjxOMpW/iriN7ORt
         1/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005967; x=1784610767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uRkmkcj8gU8t5BfL4dxR5CXZJKYqNcUVTUFN6VquLA=;
        b=Vt9BYQfk7HxvHCKtTu7zJSVpi1x4HEVt3quo1ZPQxP36LKrr75U7dWpUmQTf4m2iHR
         UIYhoEy9m9tZ2H3YChCJ0NJGojL8lm5+KzSMjelenSBlui1GQwJSAq1Imvq3HTm3EIs9
         aIVRK8DYPhU+O4+DwtLyKiktFiYgeRiCgBNVFhyNU8gAdfcJXOvyIlj8fV3oGqb7g3Hw
         9u0PpUEouoDTIb/Uv+T9WTTsYvm4r5Qdf76v1h1Z/JSK8rITxtOz36QRIgife8jLAJDw
         UNIP9Bls/kGA5FgbnB20P3eP68WBlJ7Jgl9NOsbGSNPNJzGFEjOE5NWB/7cbQ/iV2Z2H
         xhig==
X-Gm-Message-State: AOJu0YxwR5riXYVZ4Y8nY67KNFVLU3UAkIFXDdWAkWjpHrMQPSNodddX
	eF7RX73eG/Sni+BLPtjuCHKuJhg77GI10yynYRgqEC/za4tbrR1T8kyaMqLu/6utNw8owZXdm6h
	5gmhJRsjLoTRdOnJASTaCIO0QsbcFPEA=
X-Gm-Gg: AfdE7ck63H//x97/XVX75Sy2PKSKta/f1SAzNgeawnNCD62EJe9cuxRhGmTf0NyAqn0
	R3uAljUn1hXKhh0HEmDNSluKj3toiec5zVv+xCaLWEr7J6ZUvq/KIHfvDMimvHPMlvXO80SCioW
	1F16njH/90I4VH9pGnh6+9ENuN7j6i9jVHNBebWONg3cv3ListbmC8nQ1sJUdGDkHMD9m15iQi0
	TKPFU6rKSD+0lY655bDzTCRDtw/0Lf+ZLE9Rp7u79IYXTug5tpBWiw8Samfv6Eoh4OQWllMKAjA
	gBoHwFprkg7BMxfZWudE8EUOG5qgJg==
X-Received: by 2002:a17:903:198e:b0:2ca:d31e:ac50 with SMTP id
 d9443c01a7336-2ce9e99f4e8mr126780235ad.17.1784005967396; Mon, 13 Jul 2026
 22:12:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783977550.git.sean@mess.org> <b1ba67cf06df907bb1e25dd13554fb72f2ee09d8.1783977550.git.sean@mess.org>
In-Reply-To: <b1ba67cf06df907bb1e25dd13554fb72f2ee09d8.1783977550.git.sean@mess.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 14 Jul 2026 07:12:36 +0200
X-Gm-Features: AUfX_mx73l8ozq7YHB6NRGb7mR2H4Zdd5n4XL3gFzVk0yaPWxB0D4BDTcsu54Og
Message-ID: <CAFBinCBqhBXuMdx0JaAhe9B+z6xEX8eSaT4HbDEHq+FpRLH-cw@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] media: meson-ir-tx: Ensure probe error is propagated
To: Sean Young <sean@mess.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Viktor Prutyanov <viktor.prutyanov@phystech.edu>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[googlemail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sean@mess.org,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:viktor.prutyanov@phystech.edu,m:mchehab+huawei@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-amlogic@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67534-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[martinblumenstingl@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martinblumenstingl@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[googlemail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[googlemail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mess.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61ABD751103

On Mon, Jul 13, 2026 at 11:31=E2=80=AFPM Sean Young <sean@mess.org> wrote:
>
> devm_clk_get_enabled() may return -EPROBE_DEFER which needs to be
> propagated else the probe will not be deferred, it will fail instead.
>
> Fixes: 49be1c78d575 ("media: rc: introduce Meson IR TX driver")
> Signed-off-by: Sean Young <sean@mess.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thank you for including this one!

