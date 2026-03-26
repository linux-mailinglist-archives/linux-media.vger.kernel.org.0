Return-Path: <linux-media+bounces-57175-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLv/Oc2MxWlc+wQAu9opvQ
	(envelope-from <linux-media+bounces-57175-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 20:45:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B8A33B170
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 20:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99C843039322
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 19:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216FA3A640C;
	Thu, 26 Mar 2026 19:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLbLVLgv"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C2024BBEB
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 19:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774554159; cv=none; b=idSPB3MQzhVh9jz5acs35iCq9nspJeBQK4edvu4nRDUmtzOPDeH2WTCuB8HcdgxiHw2L0MVcVjGeE7P8nbiRWvEX13MkQbFy3CKAbNyoesCF+eDCNqLuTzvIwm/vUeDaSDw7atfRMwZto9qt1L+P/8HKy+25iQ6jydoE9s2Ghvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774554159; c=relaxed/simple;
	bh=Y2ZHozORnLfqvKi2dwhQTPb5sPuBtjKNxVIRQIiOzsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ABhiy8SSQDiTjS1n1Ls8HjOKb/TNQoyb1SUushqNr+jM7ZjryAzeKQbxAMdyUAVKK1b2uHEmyuP/Q5UQvU86/Ngi08DGxM/hRDamdAHvLZVB3X1wuJKSW1yJVHTvnu2vbnwvLraX9Ra2dOEpzH5kaNWTv+4bp0q1IDbfhTjM7sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLbLVLgv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31FC1C2BC87
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 19:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774554159;
	bh=Y2ZHozORnLfqvKi2dwhQTPb5sPuBtjKNxVIRQIiOzsg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZLbLVLgvUsqHZKVA1+e3imKCmqIoVEkun5ZRNqM7lbL1EeK45BJ63eP/YP64X0gBA
	 0fbGQKnS/h8sMuT0HSsszhRY3fO/xwDo3yGNxd9wqqBupGAqjPDOYWM4JO+5VkKrY2
	 rbk7a+2hjn6RrquDffH43lFRwFN+wS56GYGSqgLM9PzRj1BvplJw5gUEj2llY8NyrT
	 QhIOGjjRGTOB1FcuuZRqvmv0/4SOEbv+7hi834VtTaKeQx1nkElKWQE37ZwApuN/IR
	 t3ah8M72NV4upm4AJ95KO7OtNI8Myy1O1sklmXIbTZ3v81aHnBEFNjZpS+RaV2DStW
	 3g8GOFo1OspQw==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b980785a0bfso183623366b.3
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 12:42:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTI34BhEjkOtquLcM1KdTIay/evl6ArBq4Vu/TAJbpXR/jeseR+tSu2Rk2HUbn6Gp24Ywf5jhpZuaqpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkFYgGBruqzfVO2S9ZkEjP69gl8hZIpkOcEIiva1Ff4Mk9ic4r
	aHMmvbGPaozNKH4eNi2CvhiLQeVvM9u6DjXgH9xw4RlsrYg+uuWxAmWxEP4m3I1NdQKc60+Hj/I
	0gAehDV0bbFqWo5doYHjJ0jND2ORcpw==
X-Received: by 2002:a17:907:3c96:b0:b98:49d:7e37 with SMTP id
 a640c23a62f3a-b9a5427e5a8mr665511866b.44.1774554157684; Thu, 26 Mar 2026
 12:42:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305-rk3588-csi2rx-v3-0-754473981f39@collabora.com>
 <20260305-rk3588-csi2rx-v3-1-754473981f39@collabora.com> <20260325210634.GA3963190-robh@kernel.org>
 <703bcf13-ab45-4e9a-b80c-80911d85d819@collabora.com>
In-Reply-To: <703bcf13-ab45-4e9a-b80c-80911d85d819@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 26 Mar 2026 14:42:26 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLy4=z24-RrJWLp3hPpTwYLJ8=ehRw8cRdhZiW-eAsYCA@mail.gmail.com>
X-Gm-Features: AQROBzAHITEw9UIh2Vq6i4lzrBpyx12hq94f54-wyHg8H8rls8eAXLegvhqv8Gk
Message-ID: <CAL_JsqLy4=z24-RrJWLp3hPpTwYLJ8=ehRw8cRdhZiW-eAsYCA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3588 compatible
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Frank Li <Frank.li@nxp.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Collabora Kernel Team <kernel@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57175-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 61B8A33B170
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 4:34=E2=80=AFPM Michael Riesch
<michael.riesch@collabora.com> wrote:
>
> Hi Rob,
>
> On 3/25/26 22:06, Rob Herring wrote:
> > On Wed, Mar 25, 2026 at 11:25:34AM +0100, Michael Riesch wrote:
> >> The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
> >> the RK3568.
> >> Introduce a list of compatible variants and add the RK3588 variant to
> >> it.
> >>
> >> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>
> First of all, apologies for applying your Acked-by tag. I figured
> resolving the merged conflict was trivial and impossible to screw up, but=
...

No worries. I would have kept it too.

> >> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> >> ---
> >>  .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml   | 10 +=
++++++---
> >>  1 file changed, 7 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-m=
ipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mip=
i-csi2.yaml
> >> index 4ac4a3b6f406..3d3b3cd78884 100644
> >> --- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi=
2.yaml
> >> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi=
2.yaml
> >> @@ -16,9 +16,13 @@ description:
> >>
> >>  properties:
> >>    compatible:
> >> -    enum:
> >> -      - fsl,imx93-mipi-csi2
> >> -      - rockchip,rk3568-mipi-csi2
> >> +    oneOf:
> >> +      - const: fsl,imx93-mipi-csi2
> >> +      - const: rockchip,rk3568-mipi-csi2
> >
> > These 2 should be a single enum as they were before.
>
> ... hm. Well.
>
> First, do you mean
>
> properties:
>   compatible:
>     oneOf:
>       - enum:
>          - fsl,imx93-mipi-csi2
>          - rockchip,rk3568-mipi-csi2
>       - items:
>          - enum:
>             - rockchip,rk3588-mipi-csi2
>          - const: rockchip,rk3568-mipi-csi2
> ?

Yes.

> If so, what is the practical difference?

First, then you aren't changing what's already there. For validation,
there is no difference other than failures with 'oneOf' give poor
error messages. It wouldn't be much better, just one less oneOf entry.

Rob

