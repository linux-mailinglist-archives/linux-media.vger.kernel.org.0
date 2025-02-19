Return-Path: <linux-media+bounces-26403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D61ADA3C3CA
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 16:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EBC23A8796
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 15:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6EC21F37BA;
	Wed, 19 Feb 2025 15:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ucYY8yUa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF96198E81
	for <linux-media@vger.kernel.org>; Wed, 19 Feb 2025 15:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739979517; cv=none; b=HrJz8cTgj9vwjYLxWV0wdW74rE5Funkw+Qzvzy4kd59xzW8UBMJO2v4vEV/5fqWr3wHcWZ5ZbDUu4I/XHFmFEC8CPigINAj9oP1AgxzDXXeihHdh1KxQeGcpuGGrwuKGLPn/bs6c7y1QpY/iw5GuHns9Z9T4naobZ9QltPX1XbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739979517; c=relaxed/simple;
	bh=r0nl07WQCvR1t6EeSBi89DS4RroDeQNnskMk86HzuPg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bdGsSu/bhQlmIEUu2FGJDti70KahtwqgjEgztR+gEXbhwmixLpZWvuAuHi6HWSULfJ8YyvSZGVj30cC/ULngyHpPOhwOVxBq20gAwiEki4w6SqHOxSCTS0P2EueZtu6BOFf8iwe0xJQYSbKRfALUoynmI3FvU0i9+39EdeYSI+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ucYY8yUa; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-47210ab1283so5029981cf.1
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2025 07:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1739979514; x=1740584314; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r0nl07WQCvR1t6EeSBi89DS4RroDeQNnskMk86HzuPg=;
        b=ucYY8yUaTpl7uAACoTYQgGc2mhUaBAtW9FOh6QqvjlU72+JsqoPrKXLx4SPSCuMYZV
         OEMuBekvTn42xGHkdGx0KlHYmkhN/C8l5mIyHxOekOh51FhFgAZrA8Kq0jPyQkt8FHS3
         xXRUFyuSPI46QngdXcb7h47A6pbgfD0qRQDGSbULmaYwPuE6S5ULQZH28O9+GdCYyIMb
         StBRBM5q6d+fpPC67Zz6TFFuY+b0vImyNRTloF08XlN0Nr7+WJ8ce9Iy6P+O69bEF+L8
         yZSiHBAiWX+QbNq4akuZOB+nv9/CmBgeSRusEhzt4ANbzf21y8iz8by9MMw6RqGmWVnL
         7USQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739979514; x=1740584314;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r0nl07WQCvR1t6EeSBi89DS4RroDeQNnskMk86HzuPg=;
        b=VaDelvujabfFVrYRD2u6SIbtReMqUhZtJelThUwa0WBt/+zmL+LQVDyKbMcA0B3UFN
         eAu4cWzi9BpmyVsOkCkfYf092aD2Y/Az76wAqxLYQdkSHS3SWhnXvxkXm045Wd6ZnNc+
         kkmFohXGAIB/zfQdEdu0Ki5dGrTjdrEhpah8qsfozn2/77eYUC2ON9iIL1udpZBa3rSi
         aPswXcNOg88eaId17eM6YpJKKHfZ/yFqDtRUW0oLvpEWR/eN9pqw1xyn3J2vphkMYqgO
         V2wkzJR5qHHnfC37i42+QSuwq9c2WBo18DooAz9TMNAxonyUTytgk48oAjuZgfekY+t6
         SPEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXriioUyVTUQq5OI6SO/zI72zIKphWePLD+NgrfQzbysM4+8geqO+qzYl1aBYieTx/jBdDPhiPBfLHFyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywje2yu2WDtWknWzmEOSp9OMHdVo8ERHTCdJm4E1f8GNcuYlBcW
	+UBuD1MnJewMDp6ifiJFPVeNmo/ZrT3aLcWzSoUtSJ6spWYuFMJzXEwoWvJwGA0=
X-Gm-Gg: ASbGnctp26odq89TfS84+2KolJe9ivaEk5bET5WRTBLYgTOAqdWLoHdi55KjsiYu/0k
	1/yCySh/mPJPaN46RGtt/a7aPJw2/CfArCeXqmNQP/mHFfgOFdu0zlPLROMFgVqpHg1dKeTkHlJ
	A6N7DK3E0UtM0dOV4qMK/ru3LRZfN3EPijtdCNAXvvxBMu/y3BsLRYMFE6Tk81vvuzcLFTHwRC+
	Tx+sn3hfaSbm6jvNSrfm8vUDZ2GIMbS+olI62qMTR7fsExu1betCKyfjZEmIUKBxNFXF5kzGfqy
	qJ4/dRxs18nNzbFwfMUc
X-Google-Smtp-Source: AGHT+IFIKw2WXgBDSoS/lPjW2Im//1d5EyJCDntNvrkKNeDNCF68gDnZkdGkn7ryG/DhIkBrPFCuzA==
X-Received: by 2002:a05:622a:1311:b0:472:11ff:65fa with SMTP id d75a77b69052e-47211ff6a11mr16508631cf.50.1739979514079;
        Wed, 19 Feb 2025 07:38:34 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471fdca4cefsm24350581cf.45.2025.02.19.07.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 07:38:32 -0800 (PST)
Message-ID: <5682afd1785f37d9a995bee1643174b669c48535.camel@ndufresne.ca>
Subject: Re: [PATCH v1 2/3] dt-bindings: media: mediatek: mdp3: Add
 compatibles for MT8188 MDP3
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	chunkuang.hu@kernel.org, Yunfei Dong <yunfei.dong@mediatek.com>, Jason-JH
 Lin	 <jason-jh.lin@mediatek.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mchehab@kernel.org, 	matthias.bgg@gmail.com, moudy.ho@mediatek.com,
 dri-devel@lists.freedesktop.org, 	linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, 	sebastian.fricke@collabora.com,
 macpaul.lin@mediatek.com
Date: Wed, 19 Feb 2025 10:38:31 -0500
In-Reply-To: <20241218105320.38980-3-angelogioacchino.delregno@collabora.com>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
	 <20241218105320.38980-3-angelogioacchino.delregno@collabora.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Angelo,

Le mercredi 18 d=C3=A9cembre 2024 =C3=A0 11:53 +0100, AngeloGioacchino Del =
Regno
a =C3=A9crit=C2=A0:
> Add compatible strings for the FG, HDR, RSZ, STITCH, TCC, TDSHP
> and WROT hardware components found in MediaTek's MT8188 SoC.

The firmware for this is missing in linux-firmware. I will not ack or
pickMTK-VCODEC/MDP3 patches until this issue has been resolved.

regards,
Nicolas

>=20
> This hardware is compatible with MT8195.
>=20
> Signed-off-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>
> ---
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-fg.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 8
> ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-hdr.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 8
> ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-rsz.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 1 +
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-stitch.yaml=C2=A0=C2=A0=
 | 8
> ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-tcc.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 8
> ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-tdshp.yaml=C2=A0=C2=A0=
=C2=A0 | 8
> ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-wrot.yaml=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1 +
> =C2=A07 files changed, 32 insertions(+), 10 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> fg.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> fg.yaml
> index 03f31b009085..40fda59fa8a8 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
> @@ -16,8 +16,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-fg
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-fg
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-fg
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-fg
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> hdr.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> hdr.yaml
> index d4609bba6578..d9f926c20220 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
> @@ -16,8 +16,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-hdr
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-hdr
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-hdr
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-hdr
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> rsz.yaml
> index f5676bec4326..8124c39d73e9 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> @@ -20,6 +20,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,m=
t8183-mdp3-rsz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8188-mdp3-rsz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - mediatek,mt8195-mdp3-rsz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: med=
iatek,mt8183-mdp3-rsz
> =C2=A0
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> stitch.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> stitch.yaml
> index d815bea29154..1d8e7e202c42 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> stitch.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> stitch.yaml
> @@ -16,8 +16,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-stitch
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-stitch
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-stitch
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-stitch
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> tcc.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> tcc.yaml
> index 14ea556d4f82..6cff7c073ce4 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> @@ -17,8 +17,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-tcc
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-tcc
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-tcc
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-tcc
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> tdshp.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> tdshp.yaml
> index 8ab7f2d8e148..cdfa27324738 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> tdshp.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> tdshp.yaml
> @@ -16,8 +16,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-tdshp
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-tdshp
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-tdshp
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-tdshp
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-
> wrot.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-
> wrot.yaml
> index 53a679338402..b6269f4f9fd6 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> @@ -20,6 +20,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,m=
t8183-mdp3-wrot
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8188-mdp3-wrot
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - mediatek,mt8195-mdp3-wrot
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: med=
iatek,mt8183-mdp3-wrot
> =C2=A0


