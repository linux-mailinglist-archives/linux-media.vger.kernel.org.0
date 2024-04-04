Return-Path: <linux-media+bounces-8667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F16F7898D75
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 19:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69B051F252D2
	for <lists+linux-media@lfdr.de>; Thu,  4 Apr 2024 17:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253C812F5AA;
	Thu,  4 Apr 2024 17:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="uSJyIpbH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8426812DDBD
	for <linux-media@vger.kernel.org>; Thu,  4 Apr 2024 17:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712252845; cv=none; b=kLBm+voIjBIOpqHgUHdLwyeSDNERL6jopQmKfsqhR7pvSJiVQlp4LS0M3kGFbgfso/qDcHdKm9QSr55jgXnwZvlrCMxqFGGgMxHCT9x9p20Fvk/C1ApVZi32tvkgPdCglv27CEpcGMOYfSmfedYx/UFLFWIgfgW7X0WlGmeRTgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712252845; c=relaxed/simple;
	bh=Df1N/JsbpoM5tVgnsaIXlExMnPcBwi9zV4v1t15+iVw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sb6nlFq3c+u/q9gc7Etuy8jhBYMkf83EDikg+xlpgJhf3I1niLfLDcClhSM+sLbdb1Z5lxZStVGDrEYw0ubiG5fdVTGPJY/6r5z3KLreoZ8AZdYLkCRQC4GSbfN3tVXH0T11O/xIWj/50WvBsns05p8CfP17EgBp8+eMKem4Qbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=uSJyIpbH; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-69107859bedso6021166d6.2
        for <linux-media@vger.kernel.org>; Thu, 04 Apr 2024 10:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1712252842; x=1712857642; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bh4syO4yTXa1buMPAEQiJy3KlJ/ZvLVegoAl1qaUj7k=;
        b=uSJyIpbHmfDB8qxSiCH39B6Jm5YmybrSkNSuPUi4G6vnYRI98Q0sem+P7BYQIyfBfZ
         M2wDJFZ0Fp0B8DhhCtdx6BN+Gdz3DgwwpHCFMMBlr1YePHnaDLi6MaWvUFFadg8uKUXX
         /t9l6sOA3aW5eso8k7nv0mnhPKPXSZhFuXD0ERg9l43YgbBmWLdvteZhxn8bK/5aYGnW
         nAeRRQpkRfQh+BcTzfX9cxh/PKIW9Eg897NVDT/96HAuHR1gpmYL5zyv1A204q+znjry
         oXakyIM21mLBtIixYHlJGBdHRhB9KkbbjabFcVyyCFu1q3Dc1mgd161OovTII4jyN4AE
         NDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712252842; x=1712857642;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bh4syO4yTXa1buMPAEQiJy3KlJ/ZvLVegoAl1qaUj7k=;
        b=GhtYNXc4A3s9T6phzgGEVHgOkNmtkbmafELJaY4yjRFcPKJIJ/00YPbFap/Kp5Fqa2
         tCgnS9yN6H6wCXsTMtcBunR47fD2KxJkfmVfRxSlzAjNoRNeOi9oOr5Pjamytk6WZjuh
         vuP4N+rkBanKcEQB9CS/IAXdRcNVGdt7sZsRwEoM925HFCjwZlFlb2j1MMEuarxPzGJa
         B33apTQIZ8HQd2jDlLqZT5qV0b6RvPLpE3UORiIT5Y9qccyhV/cmD2nkhYUziYyFq0m7
         n9OLO8frY0nCdhEF4padIwzYjripE1emeCoyGTEn5iPVmb6wM+MYYQuAgM61nsPwVSsu
         9Bsw==
X-Forwarded-Encrypted: i=1; AJvYcCUpaQfcHwSy8dt8TzlEDtJubRsu+CRew6lR480A6LhCUU/VQ9hQfC45F2MELEuIsgrTvGPzTpxDooR6Owpx7c0fQn+ryoeG6Bg6ilg=
X-Gm-Message-State: AOJu0Yxt0cCb7TLhzIGZmC6n1kkkscq+8wgNdDU9iCr2XtVyUJJbQDI9
	3oGoNbeuh8oKD2qtTPRh8HX8YKvKoNwLQV5toX3AwpbQOl28uIJNtvM+ExcGkh8=
X-Google-Smtp-Source: AGHT+IG4zBdkV6V/ZyVOK3aZ5bvPMw6tYO7Y3Ma8A6A6AqVPlienLH1DcvIkKVgvPkWN6NmWDpr8Rg==
X-Received: by 2002:a05:6214:5084:b0:699:2071:6c64 with SMTP id kk4-20020a056214508400b0069920716c64mr3544763qvb.0.1712252842440;
        Thu, 04 Apr 2024 10:47:22 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:17:6448:fa75:a4ff:fe45:b56])
        by smtp.gmail.com with ESMTPSA id 3-20020ad45b83000000b00698f7eb9997sm2586753qvp.54.2024.04.04.10.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 10:47:22 -0700 (PDT)
Message-ID: <85b4deecf8306562fe798af6ee07af27369692d3.camel@ndufresne.ca>
Subject: Re: [PATCH v2 1/2] media: dt-binding: media: Document
 =?UTF-8?Q?rk3588=E2=80=99s?= VEPU121
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Conor Dooley <conor@kernel.org>, Emmanuel Gil Peyrot
	 <linkmauve@linkmauve.fr>
Cc: linux-kernel@vger.kernel.org, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  Heiko Stuebner <heiko@sntech.de>, Joerg Roedel
 <joro@8bytes.org>, Will Deacon <will@kernel.org>,  Robin Murphy
 <robin.murphy@arm.com>, Sebastian Reichel
 <sebastian.reichel@collabora.com>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Dragan Simic <dsimic@manjaro.org>,
 Shreeya Patel <shreeya.patel@collabora.com>, Chris Morgan
 <macromorgan@hotmail.com>, Andy Yan <andy.yan@rock-chips.com>, Nicolas
 Frattaroli <frattaroli.nicolas@gmail.com>,  linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  iommu@lists.linux.dev
Date: Thu, 04 Apr 2024 13:47:19 -0400
In-Reply-To: <20240327-doze-uncheck-475f3feaee57@spud>
References: <20240327134115.424846-1-linkmauve@linkmauve.fr>
	 <20240327134115.424846-2-linkmauve@linkmauve.fr>
	 <20240327-doze-uncheck-475f3feaee57@spud>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvkoOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+gozpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhmtHYWTDxBOP5peztyc2PqeKsLsLWzAr7RDTmljb2xhcyBEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCgzYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udWs+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWA
 gMBAh4BAheAAAoJEHFTAi2sBqgcQX8An2By6LDEeMxi4B9hUbpvRnzaaeNqA J9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypwCfWKc9DorA9f5pyYlD5pQo6SgSoiC0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPohiBBMRAgAiBQJVwNwgAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHCZ4AJ0QwU6/G4c7h9CkMBT9ZxGLX4KSnQCgq0P7CX7hv/M7HeyfMFZe8t3vAEW0RE5pY29sYXMgRHVmcmVzbmUgKEIuIFNjLiBJbmZvcm1hdGlxdWUpIDxuaWNvbGFzZEBibHVlc3RyZWFrdGVjaC5jb20+iGAEExECACAFAkZjGzoCGwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHBl7AJ0d2lrzshMmJaik/EaDEakzEwqgxQCg0JVZMZm9gRfEou1FvinuZxwf/mu0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr+E7ItOqZEHAs+xabBgknYZIFPW5Ag0ERRA3UhAIAJ0rxl2HsVg/nSOAUt7U/T/W+RKzVAlD9orCB0pRVvyWNxSr8MHcH
 mWCxykLuB34ouM4GuDVRKfGnqLzJRBfjs7Ax9K2FI3Odund9xpviLCt1jFC0K XL04RebrFT7xjDfocDaSLFvgxMVs/Jr2/ckKPId1oKvgYgt/o+MzUabKyFB8wIvq4GMtj3LoBKLCie2nCaSt7uVUt6q2t5bNWrd3lO6/mWn7YMc5Hsn33H9pS0+9szw6m3dG08eMKNueDlt72QxiYl2rhjzkT4ltKEkFgYBdyrtIj1UO6eX+YXb4E1rCMJrdjBSgqDPK1sWHC7gliy+izr+XTHuFwlfy8gBpsAAwUIAJJNus64gri4HAL632eqVpza83EphX1IuHzLi1LlMnQ9Tm7XKag46NhmJbOByMG33LwBsBdLjjHQSVkYZFWUifq+NWSFC/kqlb72vW8rBAv64+i3QdfxK9FWbweiRsPpvuHjJQuecbPDJpubLaxKbu2aqLCN5LuHXvdQr6KiXwabT+OJ9AJAqHG7q4IEzg4RNUVn9AS6L8bxqMSocjqpWNBCY2efCVd/c6k4Acv6jXu+wDAZEbWXK+71uaUHExhigBYBpiHGrobe32YlTVE/XEIzKKywhm/Hkn5YKWzumLte6xiD9JhKabmD7uqIvLt2twUpz4BdPzj0dvGlSmvFcaaISQQYEQIACQUCRRA3UgIbDAAKCRBxUwItrAaoHJLyAKDeS3AFowM3f1Y3OFU6XRCTKK2ZhwCfT/7P9WDjkkmiq5AfeOiwVlpuHtM=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mercredi 27 mars 2024 =C3=A0 17:23 +0000, Conor Dooley a =C3=A9crit=C2=
=A0:
> On Wed, Mar 27, 2024 at 02:41:11PM +0100, Emmanuel Gil Peyrot wrote:
> > This encoder-only device is present four times on this SoC, and should
> > support everything the rk3568 vepu supports (so JPEG, H.264 and VP8
> > encoding).
> >=20
> > According to the TRM[1], there is also the VEPU580 encoder which
> > supports H.264 and H.265, and various VDPU* decoders, of which only the
> > VDPU981 is currently supported.  This patch describes only the VEPU121.
> >=20
> > [1] https://github.com/FanX-Tek/rk3588-TRM-and-Datasheet
> >=20
> > Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

I'd like to prevent this change until we fix the driver. It should not expo=
se 1
video device per core, it should instead do schedule around these cores.

Nicolas

>=20
> Thanks,
> Conor.
>=20
> > ---
> >  .../devicetree/bindings/media/rockchip,rk3568-vepu.yaml   | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-ve=
pu.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
> > index 9d90d8d0565a..4c6cb21da041 100644
> > --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
> > +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vepu.yaml
> > @@ -15,8 +15,12 @@ description:
> > =20
> >  properties:
> >    compatible:
> > -    enum:
> > -      - rockchip,rk3568-vepu
> > +    oneOf:
> > +      - const: rockchip,rk3568-vepu
> > +      - items:
> > +          - enum:
> > +              - rockchip,rk3588-vepu121
> > +          - const: rockchip,rk3568-vepu
> > =20
> >    reg:
> >      maxItems: 1
> > --=20
> > 2.44.0
> >=20


