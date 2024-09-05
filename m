Return-Path: <linux-media+bounces-17669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D2496D6A9
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 13:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81AD01F26FDE
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 11:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80151993B2;
	Thu,  5 Sep 2024 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xn0TUE7Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E9B1991AC;
	Thu,  5 Sep 2024 11:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725534194; cv=none; b=lYDcKFb0JBGA6d50IhhQZ7jFZxYj31NLiSvcWxLT+0wFT1yM1/sWJuBQuXj9luHilNBwpS4MbXWYqHQVebhtuETj8ydQOSZfAvvagPCSLWcIrnOl60gcGIMPaKTQmgsCb+NAOKBk3+yTU1e0awvfhzxrekMIeVP7jHZY9pLpdZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725534194; c=relaxed/simple;
	bh=kULKZKLkS2PrKozHLNRgCRlFTA2YdEZVBjhxdYEj1ks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTvshVe5L2Y9W4u96RgdPE8iaM0uLPW517sLgX8zFwm2g1WQchR4KXaOOnLvqCZWbbXd4839e5CpliMnn/35+mkijfNFFnHO7XphC74BvnTFPsIJitZh7ZP0qtxFszPhBfWY9KirVQOxS6mp6T9ULkUijURC2JuSQOSlYj8fVcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xn0TUE7Z; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c24ebaa427so2736168a12.1;
        Thu, 05 Sep 2024 04:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725534191; x=1726138991; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1hOHRMeURfMUpbACLgDFFzFN/aSRoKqeTYS7sZPRrU8=;
        b=Xn0TUE7ZrcOJD0/jxbpCZaPUUEsr5rAQBVKZUchCrcxsYxrYxs15TZr/XOFg2hlaAI
         mnWlWHhGbLxfFdksoyos3OBco8Ie6K9uDLh4lyUYiaB0Hd9NB9ilUogNAikYGd/yS1hV
         b0sbeetszq9Hi0jhyBLUMsyxmQLNice84grsPDKY+u9fuBlTAdVIDffuhTiU8ZKfKPTh
         BvPpGuveo62LOjisKUC8Uaj8/zoAJsNE39VCzMoCUCqPB4ABPyh/CFtrwgg5RQLNSEIL
         1BunospLmCkxSlTWV6BICd01DZnsBJuo/VdH77V2Xm9etavedhyxog+d4WRag1eSUv88
         U4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725534191; x=1726138991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1hOHRMeURfMUpbACLgDFFzFN/aSRoKqeTYS7sZPRrU8=;
        b=rwrIcrUphOV8S4cH5tDp7Sje0Js8fEFZKmaj1cNtXfxMO6MTQHyEgbVhmORky6/Tm3
         BZDW8V3kawZ2H2CeOpO3OWcf2Z0ei3AlvBqgk1zHqwlweFGyX35u3GcwDGWkLbUTG8Om
         owBL6keyRsURjCIc5tHwjZHZx1dFUla3GK0r7WsUfW7pXZ3JWOjlLZlyHcIoKJr/tQG0
         tACxRbbEVG8l7XhURJmg/L5WZ9QrzxiOG/i/2i6zm9pUsFedP2mykw6m7yhqXm+1QL+l
         w8laiRKqXp1gPUO8NbvHGiJz4x/1rQs/1afLuc7yd6yZY2vCoZV0Pf3XfCtQpstrcP6h
         20Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUVKdC+EPLrOx7msHuhHfqJbzw0eaKHgWhrN4MPw9W0ZH7nqoyPQP/clMex2o7gTicZN0dpTP3mNyrOOEWn/A==@vger.kernel.org, AJvYcCUv8/9FCgbT1pOWO9G/cTi6J2DOIKlenOgdH9adiCXyMzOo8phMwCMz5BYbN6Duv7hh+EhFTZQ6vhAklXnC@vger.kernel.org, AJvYcCWgS+ZSjE513di0eaD1vxqo8cZCrAdlj041ZLLAaKonOGBfzm9KVXosmSWbCqQfYVr53XX7MMKJ0q3SUf0=@vger.kernel.org, AJvYcCXBTA0Ad86piq178jaxZ/P+2ErtDesdBXTDNWOzBwuqmroS1sThon7kZeq0TvQHgaQU7xgP9cTepzuo@vger.kernel.org
X-Gm-Message-State: AOJu0YztiD6azwcnULxuwSzepCs7S9xWYpZrVE1CEbsB3/iaw2cNQlZ6
	G8704Qm12kdOkVaGYPfAY6KMgXPJKZhuGXpZ9JhzLAiyJ2PrJWqDaKp7YybkbYPWCrbD8PdOXhR
	t14aI48G5LkUbWpkOBxVqinj5E7OKHFpB
X-Google-Smtp-Source: AGHT+IEN/4n4hQZmleaNBkkWBxNThIxEfttefqTfSQi3FlQ7k8ed/KCjhPmLoxQDbVbY5uP0ce+hrSm13SS2cOJL47w=
X-Received: by 2002:a05:6402:5208:b0:5c2:2b1f:f75a with SMTP id
 4fb4d7f45d1cf-5c3c1f87bf5mr6598837a12.11.1725534190001; Thu, 05 Sep 2024
 04:03:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-2-c5fdbbe65e70@quicinc.com> <afba364d-8299-49b6-9848-ed1660f86327@kernel.org>
 <809c359f-6c24-f2d4-3c4b-83e543d8c120@quicinc.com> <tdvofocpygklipddgf7gbpttxdnmhe33krziwkzh2czpf4uiao@htiismc4dekz>
 <2108cb24-0e1b-c804-eb0d-397cefa0fc32@quicinc.com>
In-Reply-To: <2108cb24-0e1b-c804-eb0d-397cefa0fc32@quicinc.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Thu, 5 Sep 2024 14:02:58 +0300
Message-ID: <CALT56yMni-p3XSj=pa4yU7GtgKqXW2wXVfAvwAXjAjxRdQdJRA@mail.gmail.com>
Subject: Re: [PATCH v3 02/29] media: MAINTAINERS: Add Qualcomm Iris video
 accelerator driver
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Sept 2024 at 14:02, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
>
>
> On 9/5/2024 3:40 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 05, 2024 at 11:17:55AM GMT, Dikshita Agarwal wrote:
> >>
> >>
> >> On 8/27/2024 4:12 PM, Krzysztof Kozlowski wrote:
> >>> On 27/08/2024 12:05, Dikshita Agarwal via B4 Relay wrote:
> >>>> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >>>>
> >>>> Add an entry for Iris video decoder accelerator driver.
> >>>>
> >>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> >>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >>>> ---
> >>>>  MAINTAINERS | 11 +++++++++++
> >>>>  1 file changed, 11 insertions(+)
> >>>>
> >>>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>>> index 8766f3e5e87e..105e67fca308 100644
> >>>> --- a/MAINTAINERS
> >>>> +++ b/MAINTAINERS
> >>>> @@ -18898,6 +18898,17 @@ S:        Maintained
> >>>>  F:        Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
> >>>>  F:        drivers/regulator/vqmmc-ipq4019-regulator.c
> >>>>
> >>>> +QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
> >>>> +M:        Vikash Garodia <quic_vgarodia@quicinc.com>
> >>>> +M:        Dikshita Agarwal <quic_dikshita@quicinc.com>
> >>>> +R:        Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>> +L:        linux-media@vger.kernel.org
> >>>> +L:        linux-arm-msm@vger.kernel.org
> >>>> +S:        Maintained
> >>>> +T:        git git://linuxtv.org/media_tree.git
> >>>
> >>> Drop, you do not maintain that Git tree.
> >> Sure, will remove
> >>>
> >>>> +F:        Documentation/devicetree/bindings/media/qcom,*-iris.yaml
> >>>> +F:        drivers/media/platform/qcom/iris/
> >>>
> >>> Drop, does not exist. Or fix your patch order.
> >> Are you suggesting to add this patch as the last patch of the series?
> >> or remove just below entry and add one more patch at the end to update
> >> MAINTAINERS file with the same?
> >
> > Adding it after the patch that adds the driver should be fine. Likewise
> > adding it at the end is also fine.
> >
> sure, so should I add the whole patch once driver is introduced or have a
> separate patch for just below?

I'd say a single patch is better.

> >> +F:  drivers/media/platform/qcom/iris/
> >>
> >> Thanks,
> >> Dikshita
> >>>
> >>>
> >>> Best regards,
> >>> Krzysztof
> >>>
> >>>
> >



-- 
With best wishes
Dmitry

