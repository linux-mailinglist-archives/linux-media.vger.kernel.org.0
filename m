Return-Path: <linux-media+bounces-28069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C152A5D25A
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 23:13:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA959189D3B5
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 22:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B01265603;
	Tue, 11 Mar 2025 22:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6CC4r+x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D571E7C06;
	Tue, 11 Mar 2025 22:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741731209; cv=none; b=d+ENXUU3YaP7vAJNOJ8UED0kRwNALxEE5yI51R15QWEwA/owHKeKmLjGGpHx0i0xjO6jSd3ljQ/n8aEPzhe52z/EZSOi1ZCy70ME7nvOSrAwhjpSt5Tpvi3+Xpvd6fE6oyaKnQ+7kQPM+Ca3qUZL9vLK/MmWJuvk6udl+/tbWMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741731209; c=relaxed/simple;
	bh=3aGBcFcTaNaR79p8ePa1pCcF1TKKHFwBabPmxaAkhoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KGNoVzLVGbrYoQPfOBzv6vYMrAGut7BFyEuff/3dZrijYVDTsjQfrVFWe8akpMdQnkIjuXG55yOn9OcY+QpBTeuIBmxX9aTcPQzFUyhBynj0wmy7VOlKycRz2rySucdl7dc+2Ulb5gl5vtnYV1Dzz5+t248Y2FdK44ff8A1p1j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6CC4r+x; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abf3d64849dso703450866b.3;
        Tue, 11 Mar 2025 15:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741731206; x=1742336006; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rjUc9bePqbTdDTZkTfNHhdZzvWN4QLUd87uz3URl6ag=;
        b=D6CC4r+xzDIlgqPv4grzBXtonyzlAmJIoxU8qQ3jPwTMx5rKNdY3bc3cY9oiePXbx9
         bt/KVQxxFJZ6HrB4lbhoEdoY5oe0lai5ddiAr7yowf2oYtufKFE3HRy5xRuu4ZKWKzFm
         jwQbPSYvxlabHVWFKYHDcl6LIElX29MVl0BFrMcYb+VW9F7Evj8Y6L5uPS/kjPXaSgSs
         mOqybz2i+nt1XL6iEvuIi88MHDPRzlN/BSDDp5nbeb0Rk9vxh4FTIkMswdm+HRuUVkyj
         +QCl5hZYtJcEjnR5ATF3Aw9GjL/Dh7qgdyj9QEfuPae6GcOJA/1TXbzDnEM56mq8coxn
         8spg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741731206; x=1742336006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjUc9bePqbTdDTZkTfNHhdZzvWN4QLUd87uz3URl6ag=;
        b=qmFB33MGA9BfDcA0QeW/gFbRZDrbXwbfX38lvJPCQtYeTVFPu5EFPuZpt1LGZA8vF+
         gqAKLlgsvoWAW4tltYQ1YDjTtJ0Lql03O/aHFJVLZW93EIPD6w6akBv/+0Ks4ZCYTjEh
         mdvjXluGHfqTKagrMuo/jgdFCSfkG3XKvLsbvUuD3iMVSUDiRuT0mW1UjIgEwH2lpdfk
         P3sSe663ZovSRdJQmBmtzNxxXl68isE20TRID5aDduOk7r2ZLgZVaHw5XS/cJuHkSqy9
         B3IsOLUoZlaHtnJnucMzzWGwvMywCfhwvAymsNF+I4VoB2cr5RJh7I0P7CG7xgYdCzeT
         RjXw==
X-Forwarded-Encrypted: i=1; AJvYcCV9aUOcYCpNOsSJyBJS4g/qo/ecQ+foAHg+YPtce14KMLPRbK5PB9RA0r+ILY5D6o3FWlaYsxg5zh7T4Qkr@vger.kernel.org, AJvYcCVStD/EkVDQv6OTDWAj2Ljxi9+RqvlbR6UXFbuNhXpzs9ucvCWde0/QdSzjH4UsoaXV9Ji1H1kaSnYXxM0=@vger.kernel.org, AJvYcCWLWmMDjNrRXoBt2rtqhjwaRWvmIQGf2j/7Cke7HhCJ+viDMSQwOUJOZDp5RlX6wxeSqJA0sxh0Cplf@vger.kernel.org, AJvYcCX1hqpagB7+3wRdd15BvKcvLLlAPbgresPr0dl3qpkj+hTfHki92pHWY9v35gop9G8dOUpyKK0Eep0fNIv75g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywiz8ozVWAjaYxpQQfx1ayYjWnSnQMT93zavw6vJtQXr8NrMAlD
	p543nMJKzwI5T518ufDq1kjPAm5guyidZlyA/pahL2ZMLkFNYo0o/1FunSCCgs71Jgc3G3GZVGI
	BzGmy2ziwwJ4yqv8HJo4TBEX6TgDWvg==
X-Gm-Gg: ASbGnctkdNJtYvrwp0QbG70PnUNrGviFxB09nE/Qk0xq3M14I9mMkvj96Peq+SL5YDZ
	yc5WRQnBsQvbpeVD0eM0AZz3ps+wh79oEPc1cJ5Euf5CplUH8zjUBXnbzj6ZA+SKM61sVyKklmy
	Fcgpi5Dd4gt8fVuNiRgHLiZaQD4InW8EGFuGK2mzaoK5+qBAV7gT9J11qr7g==
X-Google-Smtp-Source: AGHT+IEnlCesq9Sm6fpV1dwPArArN/oTo2sRyqjMAyFXYP4HF57/9egXxxaFYA3J1rptFlnafWwJQQ7H/6zLNQVjros=
X-Received: by 2002:a17:906:dc8a:b0:ac1:dc6d:af32 with SMTP id
 a640c23a62f3a-ac25269072cmr205164466b.27.1741731205522; Tue, 11 Mar 2025
 15:13:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-1-5c807d33f7ae@quicinc.com> <7yjj2eemvvvnsgv67d7tueid4h3n3onuou6ammx36am4qhfsal@xam3iamk4er3>
 <c0430086-675d-b58c-4ef9-1bd9ee51d3db@quicinc.com> <zssjkvxxv7kionartp6f3y2qh3d4i6gwnhwsrklsfad3t4fy3q@jkehbkx6wcyk>
 <203ea0bb-c53c-389e-db12-b41773c0ff5d@quicinc.com>
In-Reply-To: <203ea0bb-c53c-389e-db12-b41773c0ff5d@quicinc.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 12 Mar 2025 00:13:14 +0200
X-Gm-Features: AQ5f1JrSy91oYnYZTZryNqtuXvq7j4AA0a3FL9eIdiJigCbNEuF4Dql52zRWNxM
Message-ID: <CALT56yP5mh4QjhOEHh0x2s_+BWWXH0fPM7r7YVvx+DEgWZ0MCw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: media: qcom,sm8550-iris: update power
 domain name
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Mar 2025 at 21:19, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
>
>
> On 3/11/2025 9:05 PM, Dmitry Baryshkov wrote:
> > On Tue, Mar 11, 2025 at 08:41:01PM +0530, Vikash Garodia wrote:
> >>
> >> On 3/11/2025 8:37 PM, Dmitry Baryshkov wrote:
> >>> On Tue, Mar 11, 2025 at 05:33:53PM +0530, Vikash Garodia wrote:
> >>>> Not all platforms has a collapsible mx, so use the more generic naming
> >>>> of mx in the binding.
> >>>
> >>> I guess, it wasn't even tested...
> >> Not sure what made you guess so, let me check why my binding checker did not
> >> catch the bot reported warning.
> >
> > Obvious: you are changing the bindings in a non-backwards compatible
> > way, but you are not changing the example in the same file (and
> > obviously you are not changing the DTs), which means that this wasn't
> > tested.
> >
> > Hint: you can use enum [mx, mxc] instead of const. That would make it
> > backwards compatible.
> Currently there are no user of this binding. Given that either of MX or MXC are
> same connection to video hardware, just that one is collapsible, it would be
> good to replace the existing element instead of enum.

This obviously should go to the commit message.

>
> Regards,
> Vikash
> >
> >> Regards,
> >> Vikash
> >>>
> >>>>
> >>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> >>>> ---
> >>>>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> >>>> index e424ea84c211f473a799481fd5463a16580187ed..440a0d7cdfe19a1ccedefc207d96b26eed5d6630 100644
> >>>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> >>>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> >>>> @@ -28,7 +28,7 @@ properties:
> >>>>      items:
> >>>>        - const: venus
> >>>>        - const: vcodec0
> >>>> -      - const: mxc
> >>>> +      - const: mx
> >>>>        - const: mmcx
> >>>>
> >>>>    clocks:
> >>>>
> >>>> --
> >>>> 2.34.1
> >>>>
> >>>
> >



-- 
With best wishes
Dmitry

