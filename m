Return-Path: <linux-media+bounces-28084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D550DA5D8A4
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 09:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78FA1189EE36
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 08:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9CF236A7B;
	Wed, 12 Mar 2025 08:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKysH/zP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936232F43;
	Wed, 12 Mar 2025 08:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741769490; cv=none; b=XynmTUJYz5+7JegGX8E1sfMhYB7zNVvTYYuL5V/6IP9e0JYX7Uq0SKR4XAj+7C6fndmj+e0d/vdlUXehD5HYdGQy5a4v7MqXXkk7moWmrdr4ml4x6gn9p5ujltbsfC+Jj74FkuZI0gA/MnRpWdJjTbyEWVk4U596L6pwyOE2KOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741769490; c=relaxed/simple;
	bh=0WusSgF6UoqNfncLGyqKa+GtRSZUqJNmN16FJPHLGT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aitVYVatyYlxZs/XeaooKZAB3s9jArKcvx7tq0yvvZmdfQ57Uwuw23Dg7jfc50wZuBnLFZX4enDqcvMs/vc9k3AzNl3SKqc4kbM/cnLZrWAmUy2jgVskWpZAkHp0fChpktzRedcRUe4US2rVNUzj/ifsVn26WewGC2/jBwFXUwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKysH/zP; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e64700a38cso6021065a12.1;
        Wed, 12 Mar 2025 01:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741769487; x=1742374287; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KkefSmKAZpDVmv4h4B/Mr4vzOBIOtFod54B0n69vXSA=;
        b=bKysH/zP4tyOvp+sNEprUfpn+LIFj1af33OhKZUUkaMuN1XSoIC3hxwnBRL8uB+r5h
         6GOVKoiKy9a2zK2LfTjfd/7fi/vhT5bmMtRB/ERy+p/irgcOuANSBjhqHu6FsjDI5P47
         X8dqhyPIhnsAeCZa4Z6mhYigM/tsh+gYqI7UmMNzmhs9LdXDh87onuSddYRicoVfBZeA
         hlBGkdVswtSiIlA6kwT5CzAw4GusTzN59OmOyesYO5M8ayphP72udZMdiYN9qcjn6sc7
         druS9oo02aIXMWbzxIrxKl885Uls3p192lri46988H8RZCIs4GRSe6J9zG/JQaeS+LA8
         aeew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741769487; x=1742374287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KkefSmKAZpDVmv4h4B/Mr4vzOBIOtFod54B0n69vXSA=;
        b=Nw4lN3MbDfd1C/BlhSyeurfovYV2ZqZJlea67vuBACdlsX9uIechwNfX4THo3uIqlw
         SQDvkOyDXfbsGV6cubxBF7Y9Am/ivsubiTQRgpuVA6w+1Wv0yVpdhisixn3aXW2oxtcX
         QTBIRsSm97TST8GPwaPORQV7DokaJtmmzmoD2NcrdQzUtWGXYrWPEMoL6D4GBuIg5JGZ
         uIIJ/DiYoU0YqjmJSPV2mo+xwgHEKjs/6mV7fthWidQNba6KrAQ9m4Hv0IpAv/4IUIgO
         gNNv19AM9rRLNT0ysvDg3tZ3NfwK9ytx/DkhmbsWjfT4nkLaCGh/tXyDfQ54pcAIbb7C
         S4vg==
X-Forwarded-Encrypted: i=1; AJvYcCVPDCShBgWYq+u6qHlKObnk0UR3WCFyZt51GgPw4/EhmpqFCFzpJQbWPuzsSbWJBhm8fBvtoUVh/ZcRjjVL@vger.kernel.org, AJvYcCWB6+gG2Ri44G/+76Hcn8GW4w/of1VG7tsXJFsXTXEOpezcurvpdAd4UNuindzo8ec0kpNDfBiOuRrwehM=@vger.kernel.org, AJvYcCX9LhDJDEOhteelqz1dSx5+gL5eTkKsTgrbwgugq9Eu+5ETrQ7OV8yFtGBsN8EsVS9dS1xrAP2Dup2z@vger.kernel.org, AJvYcCXhYfYTR6eL8aipy9hNyDKRCtWg/dgxFOX8+kMZd6Nd6QIOlFwt6i3cuo9ofSy569lU9wlslDz0OGbOl10dNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8y1L5kCsQOVWjaac4xqTML4qcgVsxTA13N5hyTpOnIWzrp5AY
	huP8ds1SLAmshIgeLG1AjLJsGf4vPWWXAA4J1he8u3JIWaNMri9tzoV0oukcgOgfNWZW6fXDZPH
	iXXmHCB9wUs9zGdgtORYDQJici2o=
X-Gm-Gg: ASbGncuf+GD6k1fSM3/uvYW0W1NIy+6uQhznD1cbA2U9tX/DzFxrBpQ4FNNHJK1kH1h
	/H+G+IBTcXwWivFV3yJU9lmpCEGj0S3PeN94ZnepYpm0IRZigz+zDmrTxaNYeeGTMI0NFFMxf4g
	rVC5ThXpu1G+r+3SPsUx3SGI3eDYweR3ohJcC8kmkd3NfzXbd43Y+nrZSU
X-Google-Smtp-Source: AGHT+IEJQ8fdeQ9d70lO4G/UxvcFqQHQIPNvhviIhjFhYj6qjJv/LiKn+PbE8+0BLQx+rkv0M714ORuEsQJ2Pb2LzKA=
X-Received: by 2002:a17:907:6094:b0:ac2:fa32:f3 with SMTP id
 a640c23a62f3a-ac2fa320448mr91399966b.52.1741769486501; Wed, 12 Mar 2025
 01:51:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-2-5c807d33f7ae@quicinc.com> <ngzl7q3fli3bpuo5gjvppfrsnmlw6viy26ieqwhpfokgue2uxm@whomn2h6h3a7>
 <5e4838e5-b5f1-7107-78b8-cfd9d5620e2e@quicinc.com>
In-Reply-To: <5e4838e5-b5f1-7107-78b8-cfd9d5620e2e@quicinc.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 12 Mar 2025 10:51:15 +0200
X-Gm-Features: AQ5f1JqD-q2In0Z0Gelh-qkf9mGFnL61QwXY0ttZ9xE-w2UVrnfiNP36gq7RGmw
Message-ID: <CALT56yN-UsUGTT2BTXNg3n_-LHJqksueJmPtZJ-uYpQj03sG4A@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8550-iris: document
 SA8775p IRIS accelerator
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Mar 2025 at 10:07, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
>
>
> On 3/11/2025 9:01 PM, Dmitry Baryshkov wrote:
> > On Tue, Mar 11, 2025 at 05:33:54PM +0530, Vikash Garodia wrote:
> >> Document the IRIS video decoder and encoder accelerator found in the
> >> SA8775P platform. SA8775P has collapsible MX compared to SM8550.
> >
> > How compatible is SA8775P to SM8550? Should it be using a fallback
> > compatible?
> They are quite compatible. At the moment i do not see any reason for not using
> fallback compatible. Later, if we want to distinguish the associated platform
> data for SA8775P and SM8550, the compatible can be made independent and use it
> in driver to associate with its own platform data ?

It is already independent, even if you have a fallback. Nothing stops
you from using platform-specific compat at any point in the future,
you don't even have to change schema for that.

> >
> > This kind of comes as a more generic question: is there anything like
> > 'IP version' or 'core version'? It would be really nice to determine the
> > 'baseline' SoCs and make other instances compatible with the baseline.
> It would be helpful if you can elaborate more on this with some drivers
> following it (if any) ?

iMX platforms have a lot of examples, see any of the device trees.
Another perfect example is the Qualcomm SMMU, where we stopped adding
new compats to the driver, because all implementations are declared
compatible with "qcom,smmu-500' and "arm,smmu-500".

>
> Regards,
> Vikash
> >>
> >> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> >> ---
> >>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> >> index 440a0d7cdfe19a1ccedefc207d96b26eed5d6630..20ac596638ba33f49cce9e42d70d31a8aaa7c36e 100644
> >> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> >> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> >> @@ -19,7 +19,9 @@ allOf:
> >>
> >>  properties:
> >>    compatible:
> >> -    const: qcom,sm8550-iris
> >> +    enum:
> >> +      - qcom,sm8550-iris
> >> +      - qcom,sa8775p-iris
> >>
> >>    power-domains:
> >>      maxItems: 4
> >>
> >> --
> >> 2.34.1
> >>
> >



-- 
With best wishes
Dmitry

