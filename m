Return-Path: <linux-media+bounces-28415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB26EA672A5
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 12:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EE5919A2168
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 11:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0874E20B1E1;
	Tue, 18 Mar 2025 11:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="Qnza4qwd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949D520A5C5;
	Tue, 18 Mar 2025 11:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742297074; cv=none; b=i0tGCWMCYHxF9P4EnnWnTD9h3+i0/nfneZP6yojKzNZcF7rhtW6BY5y9uecxr7AL9CzVYV7lPb4BDUrfsQm1dZlcNlMhxrLSc9Eff2a3Zz/ly0xsD4Uc7fsU31bN4k2xjiq8YN5L64XfvZN2MamEzq/Ocwekn6VMbP8OgWoPZ70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742297074; c=relaxed/simple;
	bh=B9SRqAGD1gU5MjXx0m0UTNlqsLd07dk52FUOhBgs9Eg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C8TTpPZ8lCGK93p3PLEeufN0MU6SfLDNNx4fW4TgbFJ1cZyIBwllHLKDZBzYgjBbY+EKtotgSHlKf3HxwtbpSkTCn47QHI7NcR0W3FP/MoJlw3GI41+M0G6+TdOOJfJOXDD0Csq2pCKJXnHv7+YF9p3d0T3CtC+LRdJlwKqwjQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=Qnza4qwd; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail; t=1742297054; x=1742556254;
	bh=v5rPRJiW687aKRy8e1bfIACc1bjcbnonQaHu8lKKsLQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Qnza4qwdMEPq075heNjs8LhaWMqGM5d/KAvxVzt4l+4rcFmgUEPeM86xazmncQ4Q2
	 ECnSABRdy7ruHXW6UVXJpO6DjCGeS1BWQwPpeWD6gq7t9LJVHPUDPbVOFbKXIXj5cr
	 tW32tbAWuivabd8Op2Q+hhx4bxVkK81f7jzQmo132rJoqKqwFHpIZ+nYkJHts0JL4r
	 ohgN9sX6iMGOAxNx52tlAGfnxAQ5dGFF29aczJE+UsIVC5Zd5mr4M7t7+QYuAGSYNi
	 AsoUt8BZDkG2uXa+PBUoArDPvN2fGPq5OzO1aHkxtCE4ZUlZ6hkdl5CEHIAxnWq8wb
	 jyBdKEt58KkMA==
Date: Tue, 18 Mar 2025 11:24:07 +0000
To: Neil Armstrong <neil.armstrong@linaro.org>, Vikash Garodia <quic_vgarodia@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: media: qcom,sm8550-iris: document SM8650 IRIS accelerator
Message-ID: <d654d95a-dbf2-41eb-8ec4-32ca1d2f16a3@nxsw.ie>
In-Reply-To: <20250305-topic-sm8x50-iris-v10-v2-1-bd65a3fc099e@linaro.org>
References: <20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org> <20250305-topic-sm8x50-iris-v10-v2-1-bd65a3fc099e@linaro.org>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: d80906b3a30e16cf1a64d47e125f81e5fceddd73
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 05/03/2025 19:05, Neil Armstrong wrote:
> Document the IRIS video decoder and encoder accelerator found in the
> SM8650 platform, it requires 2 more reset lines in addition to the
> properties required for the SM8550 platform.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   .../bindings/media/qcom,sm8550-iris.yaml           | 33 +++++++++++++++=
+++----
>   1 file changed, 28 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yam=
l b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index e424ea84c211f473a799481fd5463a16580187ed..536cf458dcb08141e5a1ec8c3=
df964196e599a57 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -14,12 +14,11 @@ description:
>     The iris video processing unit is a video encode and decode accelerat=
or
>     present on Qualcomm platforms.
>=20
> -allOf:
> -  - $ref: qcom,venus-common.yaml#
> -
>   properties:
>     compatible:
> -    const: qcom,sm8550-iris
> +    enum:
> +      - qcom,sm8550-iris
> +      - qcom,sm8650-iris
>=20
>     power-domains:
>       maxItems: 4
> @@ -49,11 +48,15 @@ properties:
>         - const: video-mem
>=20
>     resets:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3
>=20
>     reset-names:
> +    minItems: 1
>       items:
>         - const: bus
> +      - const: xo
> +      - const: core
>=20
>     iommus:
>       maxItems: 2
> @@ -75,6 +78,26 @@ required:
>     - iommus
>     - dma-coherent
>=20
> +allOf:
> +  - $ref: qcom,venus-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,sm8650-iris
> +    then:
> +      properties:
> +        resets:
> +          minItems: 3
> +        reset-names:
> +          minItems: 3
> +    else:
> +      properties:
> +        resets:
> +          maxItems: 1
> +        reset-names:
> +          maxItems: 1
> +
>   unevaluatedProperties: false
>=20
>   examples:
>=20
> --
> 2.34.1
>=20
>=20

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


