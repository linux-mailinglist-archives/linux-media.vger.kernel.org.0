Return-Path: <linux-media+bounces-10783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CBD8BBFE2
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 11:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17E3BB210E7
	for <lists+linux-media@lfdr.de>; Sun,  5 May 2024 09:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B05E79D8;
	Sun,  5 May 2024 09:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8FQI4RZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737F16FBF;
	Sun,  5 May 2024 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714899879; cv=none; b=o3vrSQ6rmT7pyiw9ZCzK2jXb7WNyBRGLoDHDmuqG8mQ0rYDleK0q+7KtVC3j6FJKdya+Xn5naDCiVFEtapzfC9B9tjyIgiE2rNfMzxQwGrOdrkGygJHf4IGYA4ORfzspbH7kYShdadQFFz3wWOe/Uc9dtGIRAZz6vLuT9iQgGMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714899879; c=relaxed/simple;
	bh=k0+AvicJAbVhuORh6dRlOfxfBPigPDFzsj7pP0a4Fec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otw8GV6mjPH4wg/usjkSPdMXcVIe5NHZHjCgw6BZcva9o81VbSw2np42IP4NiO7ot0anY/syGHaVGqazVEL26HJaPOn6m5jgaH1fp4y0je6p1T57NC9/eIPMmQ262gfeZ0OT6LujK5WFrZDZ6F7B9Zi7uJzXV9VbfcDJdRbo/PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8FQI4RZ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51f1b378ca5so1548554e87.1;
        Sun, 05 May 2024 02:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714899875; x=1715504675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNpIyj7MPKqdtG8Iv+TlK7x/otS6T5PGiuOOMxdEK3Q=;
        b=a8FQI4RZ8C1bkwoiSKk55z/kEVsDvFRj8h07039keJf8TS5H5enO3F6d8niK10yEvK
         hSUQBAkFCSNmGJqCNYsqwigyMsgm1H0VeWwbau3PAhFoUMeieImTwkFmjw+pmXc7UJFX
         lw0hA8RTVleRDsPjEpR6/LYfewfeGPj6IAcAXz5M1Iwn8wea2zYMrU3KLulduy95BCIb
         usEmnrMo83dF8oq3d9pKCcTXTLySvTuSAGOWbFfdPZWvQOOJRBHAC0UjKNGKIxPfbcYC
         IxpB9UYrFMKjWy4TY9dOl1+1d31qEK9JQ7O3yoRJONJCH3z1rbUnV0ZB5Vfr9mmiTn5O
         KNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714899875; x=1715504675;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VNpIyj7MPKqdtG8Iv+TlK7x/otS6T5PGiuOOMxdEK3Q=;
        b=i+r6LRCzBRD7hQcdqEM4fUvm7lfodkpG/heuN+mAQCicsXx4yyiYKzQBaXLNq8/SSL
         VSzOt03SrOGpcj+eCMgZMWyruvddsR54B2hibBLpx1sHtCxg+XVKatGYEThUGIhH0ouU
         4OJIupU4/wut9Z9kLXXjVcnejRTMe8mzai9Ri97SVjEv5IAgxwcMHwC1hspJ7HmJnBri
         Wc+6/c1eq0ZA7FI7XpDqykO8No8BD4TK88aPHgJvUX5gIgnMLX4Rfx/i8NBMx5q89KYb
         slxrXyxKZYwKRfk8od7bi40fAhesEgakt0AParhmdagoSq35VgK9HfR5za/lCaCz7R0e
         Q9/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9lo4+zYsrEF6vVRkhig/Bh02g8X53rSorVLKVHjN327ohFFcUQ/nW1YoU5OLfLMC/0c8XrvCUAz3Y+Fctd6+OHJIcYgEPin3mEYOEYROFPuAIhpInQfwbMYNZzhZYRq8txyXpjv+XEtSuscasnIg7zba6KAER851kGTkR9lJBDhnkpPcB
X-Gm-Message-State: AOJu0Yy00Muj5IDfHvdmVpsyV2zyVDgFr7d/5KawAqmKNJ1nwaU+Y3nF
	mPsxXePmrd2964VXWS5zcbB3uyxaiXd42myH9ndfBaORhdOvFQQ6
X-Google-Smtp-Source: AGHT+IFJXqAZaM7jAdT9lRpbpYV686fzmjcKUox12T6aPwx0SWjs3T6xNxJAKQgUeFQiJw/DBqu+qA==
X-Received: by 2002:a05:6512:3c98:b0:51c:5570:f570 with SMTP id h24-20020a0565123c9800b0051c5570f570mr7755882lfv.59.1714899875092;
        Sun, 05 May 2024 02:04:35 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id c3-20020ac244a3000000b0051d913a3695sm1173194lfm.182.2024.05.05.02.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 02:04:34 -0700 (PDT)
Date: Sun, 5 May 2024 12:04:34 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
	Pavel Machek <pavel@ucw.cz>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: add galaxycore,gc2145
 DVP bus support
Message-ID: <ZjdLohzrTA80sE8M@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
	Pavel Machek <pavel@ucw.cz>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>
References: <20240504164115.64603-1-andrej.skvortzov@gmail.com>
 <20240504164115.64603-2-andrej.skvortzov@gmail.com>
 <2d96a3d4-c361-4aac-b97f-0d408d39ae45@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2d96a3d4-c361-4aac-b97f-0d408d39ae45@linaro.org>

Hi Krzysztof,

On 24-05-05 10:20, Krzysztof Kozlowski wrote:
> On 04/05/2024 18:41, Andrey Skvortsov wrote:
> > Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Not true. I never acked patch with empty commit and such content.
>
Sorry about that. You've acked v1, so I've kept it. I'll remove it in
v4.

> Drop fake tag and send new version with proper commit msg and proper
> changelog under ---.
There is changelog in cover letter. Should I include corresponding changelog in each
patch as well?

-- 
Best regards,
Andrey Skvortsov

