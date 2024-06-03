Return-Path: <linux-media+bounces-12426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B28E48D7BC5
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 08:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3551D1F225A4
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 06:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0AF3D387;
	Mon,  3 Jun 2024 06:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Wj3ii0ir"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8F83D551
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 06:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717396788; cv=none; b=dOaK8tIh+infc8VonzMO80CvSIRmJfKAzrEnIztA70gDv8gcib4Pcb1N4TPu0PqBSPLhmG7pAUiltFqImpKG+Mp2n7d8ReBtgdVrRvQxN3n6KgsRO2Q6rmSlbFt64YLcf23imyeEkJc1c06YYKD8Y0wgHMcchNMyJbsVwAHYmB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717396788; c=relaxed/simple;
	bh=6zIG1+ce+MFr3YKcNcxLW9ehBTfd0YUfDO7c/QJPUfc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=aipSrCSwqQps9sEAqisILbnvuGy/stb0WB4BdgRocbp8JyYG1zQ6TIn1T11f6rgwmuzAnsP+6Vn0ut/TcZkTydNft8aAOzrtNNxzlVjC1c2DqZXFFfKwrIGbacaRjNxKIYdriu17YMF1EByvlMAv34ABDRNT2mkSfN5Jvyu0BaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Wj3ii0ir; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57a68b0fbd0so213106a12.1
        for <linux-media@vger.kernel.org>; Sun, 02 Jun 2024 23:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1717396785; x=1718001585; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/kSWlsZgItMKs0n3WD4Nrf7fVlEdWxgIbQ1jzkl5d4=;
        b=Wj3ii0irnq4Z9rAan3f6ck/rRUr308vMh2w808luWnsz6kErhJ/vcaf+q+QxQWco5U
         hWbguK9Ich9Ac+qIwNqGoqqxCbKelhpqB42vpR/mrTX5/YWx24FnOcWe6ePzrhJRsW/m
         c70RfESusN8DRhTcchefkuQp+gQ6vQtBd7R1zAIu+NvQZ2dhskmquek2SJ/YqUKdm+c0
         9waOd4iKez4bMc4qfaMOeWtQIG66tcAQz3zChCkn7lUD+RPcxDndj8ZK9TLum3u3JQzw
         gs8ksD2bus8gXQZbv7i+Lt9kVpokJqnMpPrP4xB9Vyd1tjDFQhhriDd/gOGs5VGnp8df
         uRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717396785; x=1718001585;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4/kSWlsZgItMKs0n3WD4Nrf7fVlEdWxgIbQ1jzkl5d4=;
        b=nhYeGNv5LphjW/Bi6W60UmsQT8jPtvCIEqTDsJBDJbjnBxuMWmOMan7oZelaR5X19F
         s3Empyjv7QxUDobE/vEYvcZ8AHUBQRDztae7lQS2pKMeRKajTm164Z1LoUEULE5j3XpN
         EEx5l129pk7yoLiYUprCR426xJ6V2GS9+pO7NEb55wLHvJCbgNyf9soqSVSobTP5XpLY
         c/8YEpHHIYuTsepfLI7NC8het/kbkb/jI75a6vKEpn1azsMu/0X4kuzCHHEDfTknFFVG
         NtYhUQWZCyPlKZ2sFkDurR/fkkNIv9NmrvZ8h0My5nznRX4ZNmLn8LBpyoQyD10jw2wV
         8Myg==
X-Forwarded-Encrypted: i=1; AJvYcCXRejhBYZawpsyb1ll9U2YfqG91jt1AIQbQ71smU4qdTHaXWb2QCmmKUakvYiRMEPo5HEMBZKrEHmH9izfgTVqzYMezeUwPbRBPaIk=
X-Gm-Message-State: AOJu0Ywp0Tr9epDa7Mj1kuTjwfFLyZ2ueObinE++NCMnUM2MoJiYz7kk
	ly8m6kty1oGI/yIvo08pp448n9LbUtR1vPqBxqMrsu/zqzuw0aCRUSGWvIhio+c=
X-Google-Smtp-Source: AGHT+IHPI42I+wiDmrMQUuBnkODfjkjRd3F/AhQNQPxFvtXVyYyNTCx5IjDc+RZbp/mfvvWlLxUi5w==
X-Received: by 2002:a17:906:15db:b0:a68:a2d7:3872 with SMTP id a640c23a62f3a-a68a2d73920mr313157566b.45.1717396785032;
        Sun, 02 Jun 2024 23:39:45 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68e2d1333fsm234930866b.219.2024.06.02.23.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jun 2024 23:39:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Jun 2024 08:39:44 +0200
Message-Id: <D1Q6CMZM78VI.ABYGRRV5E61B@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Stanimir Varbanov" <stanimir.varbanov@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] media: dt-bindings: qcom,sc7280-venus: Allow one
 IOMMU entry
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>,
 "Stanimir Varbanov" <stanimir.k.varbanov@gmail.com>, "Vikash Garodia"
 <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240412-sc7280-venus-bindings-v2-1-48ca8c2ec532@fairphone.com>
In-Reply-To: <20240412-sc7280-venus-bindings-v2-1-48ca8c2ec532@fairphone.com>

On Fri Apr 12, 2024 at 4:19 PM CEST, Luca Weiss wrote:
> Some SC7280-based boards crash when providing the "secure_non_pixel"
> context bank, so allow only one iommu in the bindings also.

Hi all,

This patch is still pending and not having it causes dt validation
warnings for some qcom-sc7280 boards.

Regards
Luca

>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Reference:
> https://lore.kernel.org/linux-arm-msm/20231201-sc7280-venus-pas-v3-2-bc13=
2dc5fc30@fairphone.com/
> ---
> Changes in v2:
> - Pick up tags
> - Otherwise just a resend, v1 was sent in January
> - Link to v1: https://lore.kernel.org/r/20240129-sc7280-venus-bindings-v1=
-1-20a9ba194c60@fairphone.com
> ---
>  Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> index 8f9b6433aeb8..10c334e6b3dc 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
> @@ -43,6 +43,7 @@ properties:
>        - const: vcodec_bus
> =20
>    iommus:
> +    minItems: 1
>      maxItems: 2
> =20
>    interconnects:
>
> ---
> base-commit: 9ed46da14b9b9b2ad4edb3b0c545b6dbe5c00d39
> change-id: 20240129-sc7280-venus-bindings-6e62a99620de
>
> Best regards,


