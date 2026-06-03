Return-Path: <linux-media+bounces-63521-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yHQyOEHbH2rtrAAAu9opvQ
	(envelope-from <linux-media+bounces-63521-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:44:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF13635568
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:44:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qh4xtAy+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63521-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63521-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0ED55303A02A
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 07:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADA93F58E9;
	Wed,  3 Jun 2026 07:42:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22773A6410
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 07:42:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472546; cv=pass; b=RXv4k76+Urw8uSzjsRWyeHC0eXXGBOoxIPGIY4SasK/lsyx9yMyZLgApGxHIYMo2uucxn15sLu2Ch1IvVKJNoJcnBNFgDIfoEY7b8SsX/8objp78DxYosjAzxo24kbZt7X/c20C9oKad2WHqdFrNrydPMd4i6kkDEuGFBVgqJzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472546; c=relaxed/simple;
	bh=kPEaoQ8OjP+EXnYI8JRzPvxllsKR3GiBChaozvD7CNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hk98LXoXl8pzK3a1efolLMQaQj1BAq+7WVqqPElzs/opV41AUwEjkpJzeak/opGrKlNuUXuF21szCzWmr/xOd6RxBWkqWWkrU0EP1mcpR/UZlC875Okh/rCNOGDD+ft/VFGWvutEMqzSalAzKA79Y+5Tq500FhsJ+xTSnmxGRhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qh4xtAy+; arc=pass smtp.client-ip=74.125.82.47
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-137dd523634so5397437c88.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 00:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780472544; cv=none;
        d=google.com; s=arc-20240605;
        b=NqCDCV2zVIeAJQNtJ3AFAdZDKKR/dskKhHEkqj7KZB7AzO/IkKMWA06t1cUwfpw3KY
         XWI8DcYayk1RRbZgk0Y9O8MScJAhLTaF8TvpvQtSU/j2sp+VZZ5jzQ35zAntV7Wm5V+l
         hKaKMKKz4ZQNHdN4mrUq9RExczjut/QZfoQdCjz5F3Myc+rnz0b6845VRhulJbs5b0f7
         H1Fa73o1CINd3Za/LPzTDjgH+x7V6ff3+itpUjxD2f3nJTJ2HbPUiXDt8kjS3Sq8RI6j
         686cWXLg354r4e8/IgLmRzdB5JbiOAYfwqfK42144MMwIeBHgiPdbDNK4eVx7wNR3w9T
         s8Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a7XYs6K6ZH353PwGbbI2rOqTKDPXN26s6rlYcbF9OO8=;
        fh=rSsdBn6Diokju6KRPWANRi5x+3KnR5dxVEciMrM5HJo=;
        b=byWij7vQBZGg2dnC2VqvPZqtBaJKIF4dqzyR8B+7/SAZKfOseZsrhYeZ0OkQTa2CIh
         aBtNbSHYK0P/YJSV9EXYMrHrw8irkDg15G1kpYXOcd2rDNizAiveWtm8ClZUF0CITjU7
         yEe0EO9quCKbSWipEcrrbls8XU2t3s4aYMwPMP6iH+7g7p17wgE3yX7LyKfdscP+zbI6
         tfA2oJ1hp/xCLROzTQzpoJUgUD1lYqk9LjHfLngU6GVGe8X81oNH5YplaLr9w90AmYGn
         +dyQL8sJZD+l8JwbpOxA0qy3bDfShPd4p62RdiNEZJPu4Jkcl0y/2NaokTC2b8uQl7KN
         IsTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472544; x=1781077344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7XYs6K6ZH353PwGbbI2rOqTKDPXN26s6rlYcbF9OO8=;
        b=qh4xtAy+sTSvNUJcGqNqTqb8ubhlk6Nx4W0oPyijq71XdjrCwRoEGtv/xa9e7Sg2Xe
         +It0GQIQOFZoYXXm99XudycaVZ1e0FWurvdFt0YTqdz0eKe4j4xANbag939vyOjzPEe+
         Bk3CtpxB3DdQrjjkNUJE1kjnEr4DR8oCNPkgJT9x0KQD/pFE5IhxLbPI5G5sGapJyUm+
         GGmKFBqWU51moK3lhIxHUryM/CzgZDeLMAaiG8gXuT6LkArtE8QlWQd4s6MtyY1GmQc7
         xXkK1dn8TEQb1PWCGEZzcjo5bygwOeib6SD+TpCBndHTisPdUrxiu0rsPtvwzHMTEUSG
         QMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472544; x=1781077344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a7XYs6K6ZH353PwGbbI2rOqTKDPXN26s6rlYcbF9OO8=;
        b=sUf1JznKIAZhXHqFOSqvw9+Wn8uHNqg0/jszICj7p0gRwBSSYxwgBLuEi9RJ8DYW4o
         B6Cj80J2lACS5YeuqxqRp2XsOLd+PiE8wmHTuZnhfH0/4a5qKFVpDak3ccIOpJnEp4Tw
         jtzC680FOaMtN3FCh8JLP95YMxv34pJ4cQCbOTcckJ7lbtdcqLoX+gHQZQ70DwO7KIHQ
         JjOnt1djQA2GMbarrOe0MOo2Nwn00M1c1ixuPLM2Jx6lbkRFBKVjy5ntrFTtEmmVut4U
         m3JknUYa0jExQB3zv+WGMK24YJH12zMT/NRJ7K/D4yQ0+EuSnenksooHDjMD2MRDmYCa
         LDJA==
X-Gm-Message-State: AOJu0YxYZIT3zHiZLEOf23eKWlUZXV3FBWKM80mGHhZmUv1lXaOwxfFS
	Kshc+dvWeXUl/nMDQlg5+fZp8LcYdFzrSTPBwblKZTxix/x/pWCKkoID3IUAL17E7OLaQYI+uKS
	HXgS0O09l2laIrfzz0A9m2jm3X/JNWSU=
X-Gm-Gg: Acq92OFD2EBFfayIsDAwgLuFBop7utHcbK/+MEQ1ptnKZGO+g6qD6ACZFu0iuwOHySo
	WKxWD8aiXYqO6mAoCz0VoAL+tsIBPgZMPQDPw59xqdrsdUZtf7h9Xu5k58YQtLBEt4VH6AGoGGD
	o7Wk56nCwj/5jjNfNwVUEJwWcwM5P9L1+vEXt2xw7LUKZMFzCAVxctoLLjRy5NhIYdAPQytZKtc
	iBVOo6AMjeEbqYhmO+Yx+JVSJtyw/qXCmPqUrhfr+YF0NpTYzXVXa6HfAvi7Ma8uVrrsL7FusL1
	FgcF9tmC+O09jnPkGj9bsrUJwmYDmw==
X-Received: by 2002:a05:693c:300a:b0:304:4f23:457e with SMTP id
 5a478bee46e88-3074fb684ffmr1181310eec.22.1780472543899; Wed, 03 Jun 2026
 00:42:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531092924.12929-1-clamor95@gmail.com> <20260531092924.12929-2-clamor95@gmail.com>
In-Reply-To: <20260531092924.12929-2-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 3 Jun 2026 10:42:12 +0300
X-Gm-Features: AVHnY4Ieen8ZoYHKJxqaa_bowmUWca3QV_nYMrOeqjf0cKthQQdJ7zZR2Kop0oE
Message-ID: <CAPVz0n12a5XjoFbCYDuwa8gzYeyg9jcjOzKRArqFZBSgMkjCkg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1 RESEND] dt-bindings: media: mt9m114: document
 common video device properties
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63521-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:clamor95@gmail.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,gmail.com,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BF13635568

=D0=BD=D0=B4, 31 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 12:2=
9 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Document common video interface device properties, such as rotation and
> orientation.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---

I have forgot to include ack and review tags from pre-resend patch.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hopefully, these can be added without resending.

>  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml          | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yam=
l b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> index e896f4db2421..2b39614f5cbf 100644
> --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> @@ -15,6 +15,9 @@ description: |-
>    an I2C interface and outputs image data over a 8-bit parallel or 1-lan=
e MIPI
>    CSI-2 connection.
>
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
>  properties:
>    compatible:
>      enum:
> @@ -90,7 +93,7 @@ required:
>    - vaa-supply
>    - port
>
> -additionalProperties: false
> +unevaluatedProperties: false
>
>  examples:
>    - |
> --
> 2.51.0
>

