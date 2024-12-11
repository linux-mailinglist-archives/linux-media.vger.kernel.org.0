Return-Path: <linux-media+bounces-23142-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B799EC0C3
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 01:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABBE5283330
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 00:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C4511CAF;
	Wed, 11 Dec 2024 00:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfwugTo1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657F2AD5E;
	Wed, 11 Dec 2024 00:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877049; cv=none; b=H+oSi6c3+Tro7m5lu08nfP47sqzK90ScY9tuDemkTdVeAgPNEh2xqSv1vxvdEZhBMNhY0b6OeBgbnXHxA1I8lG4UL9+WcxPXXFcvoGjIOcwdlqscxPOYFoO1Q1RGvTJ54f9uBeRcwRksC24icws/lDAhQrlPylNUTt3FNqN3aGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877049; c=relaxed/simple;
	bh=zfnL3T4fjWRklKZ7QwDKYimyih0yvUm1HdG4fl8TH2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=maYFK7nmop1ZFk2lFnhDDr59qMZ2e+ikd16UYtee47cg3EtLi4+GDoS+N7MWVDntDioGmcabWeBDg7tN7Z20PCcrS8vYmVpIRH0bi+rLvtKZLMHouMoe7qO8Q25Wr7fEl+l7+K50Zpipyq5YsqCDBCO2dKA5zYO1chUJw3uG2co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfwugTo1; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b6ed0de64aso2162485a.0;
        Tue, 10 Dec 2024 16:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733877047; x=1734481847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8G/UOeJH2Z5HF5N1QDZ/736SvvRIiY1q2rQowPJk9I4=;
        b=jfwugTo1R6G6d6K7WjiRT2Os8C2J0et0NAQxzt5lb+U6CwzNnT8Zmv8y0ikavZqhUI
         GWEFpxomxr5Y7b1VSpzDg9+3valw51QqQAVnhAua/wUNITh5XDfxv9ApNqokRvgIxMgK
         k42svmKd8tLXXgGkwaFH+n6v7hy+LXZgK1SRGbhcfTk/1uamn8ioJgLow2t/OjN6IbVo
         6nsbgXnHve3Spm7fI39oi4QEQ4+DFGhyr41EZom1RYhjrwVwMTVfU2Nid2Wv1fFiZKHg
         4MG8BhS6TpnXXAXAEEgtLnE8jU36EXZsNlnCnDaJF9//RpWRKj8UACOfirDKobJ7gzt+
         ztVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733877047; x=1734481847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8G/UOeJH2Z5HF5N1QDZ/736SvvRIiY1q2rQowPJk9I4=;
        b=fy/+ljSJTLVV4ss/ordS7pJCXryEqhmHypz3LUBulGk8cNisceWzm2Nj5xmQnfZWE1
         b2ZK05HNVEVfBRGLbPRtTELoWJFdgbNnEJ929zu0e4in3UXx+gZZv5UydfJEjdSMLmTN
         PhMC1pMXFb3x9hyk+0R6H60X/9ZLUzT2ps079BBPi+Zx2id0ZuTWFrz9S4MS4NbuBJCG
         B01pPfAgKcBMJH2cBTcz/aUsSQ1raITrEZjDQd4T8U527OUj8GqQqpjPPRkBh+JJXyh6
         zDY9iO7nsdmXb3NXedd3bx9UfpGpHWMACQpx0uHNzWTRInUod6JfYu+ElS7zS/2xOGUf
         17/w==
X-Forwarded-Encrypted: i=1; AJvYcCViUapANMFhvdBupmr+f1bbu23TwPKJfeXa5Ri7TYjtcoqpxqgTpO5GgmEi1b38dn2prGqiKwGmCoEXv1pOQQ==@vger.kernel.org, AJvYcCW/0DLWOxZUv5JhObPIk/aCeixouaN9mBobKMv/Qt81iIhLHzkRAGSe0ErOEIUAELeizuCoji1gYlmT@vger.kernel.org, AJvYcCXCKtP/eorJixunlg2AsMeDzIiHW231m2MkAgwGoyZc4ptNfN0Z8/o2mv4rtdNCkSMpOpmsVurJSUNHT4w=@vger.kernel.org, AJvYcCXqVNJ07HBeWJEdLfK7L/ROimH73Ke+iw63vVbnIO6VqTgRCSEBwouNFNwQWin8oGLzeCQycr95Yuu0@vger.kernel.org
X-Gm-Message-State: AOJu0YxKeZd+mZmQZrfHvCySRW9VVlqTFvHSxgQglWAr+IgPBsn/EKSw
	nLsLgpDiNkOazUlZwGM9OHBh02LVNQZt/CF1CWKGxQCuIp6VKi24
X-Gm-Gg: ASbGncv5lH6cKKhxKCtIzXjDbDtGRbpURjuFyV+qUqpSLxHKcywwXMDhHBsf4JewNF4
	yKNxtfcqBq7jfofkF3tEgz50BRnhc0wPCdfn5yxi/BAvOvXXlMBh65eQOd/6TExs7uCOaekqgkP
	T4TTs/2kS8pV96FzcZ6U2QjgOt86xblasYhJGGeUtJ8+tb+h//gjzJimu52Dlx4F2qWFi0mQKej
	EpO8xxrab3E6bivmPuVde8VPdFjewByD7ALajV8Yg==
X-Google-Smtp-Source: AGHT+IGJjTwiDSy9y0Z/4YUAm05vyvap6CL7ctnNDpSLs0/ro7VuqA8lXU6SvI3JB8AkwPkgMsbX7g==
X-Received: by 2002:a05:620a:4594:b0:7b6:cb3c:cb81 with SMTP id af79cd13be357-7b6ebc6e5a3mr131819485a.18.1733877047280;
        Tue, 10 Dec 2024 16:30:47 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::6d3f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6dcd91ce6sm154812985a.127.2024.12.10.16.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 16:30:46 -0800 (PST)
Date: Tue, 10 Dec 2024 19:30:45 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: sdm670: add camss and cci
Message-ID: <Z1jdNaeoictuCK7N@radian>
References: <20241210233534.614520-7-mailingradian@gmail.com>
 <20241210233534.614520-12-mailingradian@gmail.com>
 <fe8dbb4e-9d0e-4ecf-874b-be9225ae1487@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe8dbb4e-9d0e-4ecf-874b-be9225ae1487@linaro.org>

On Tue, Dec 10, 2024 at 11:49:20PM +0000, Bryan O'Donoghue wrote:
> On 10/12/2024 23:35, Richard Acayan wrote:
> > +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> > +				 <&gcc GCC_CAMERA_AXI_CLK>,
> > +				 <&camcc CAM_CC_SOC_AHB_CLK>,
> > +				 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> > +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> > +				 <&camcc CAM_CC_IFE_0_CSID_CLK>,
> > +				 <&camcc CAM_CC_IFE_1_CSID_CLK>,
> > +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> > +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> > +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> > +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> > +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> > +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> > +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> > +				 <&camcc CAM_CC_IFE_0_AXI_CLK>,
> > +				 <&camcc CAM_CC_IFE_0_CLK>,
> > +				 <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
> > +				 <&camcc CAM_CC_IFE_1_AXI_CLK>,
> > +				 <&camcc CAM_CC_IFE_1_CLK>,
> > +				 <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
> > +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> > +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>;
> > +			clock-names = "gcc_camera_ahb",
> > +				      "gcc_camera_axi",
> > +				      "soc_ahb",
> > +				      "camnoc_axi",
> > +				      "cpas_ahb",
> 
> I think you sorted the regs, interrupts but forgot the clocks ?

Do you mean the first three clocks placed first? The order was suggested
by Vladimir in [1], but I can undo it.

[1] https://lore.kernel.org/r/40cd7a52-1c60-40dc-aee6-730b5247b216@linaro.org

> 
> ---
> bod

