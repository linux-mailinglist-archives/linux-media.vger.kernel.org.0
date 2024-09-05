Return-Path: <linux-media+bounces-17660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D129296D585
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 12:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0130B1C25625
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 10:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6261991CE;
	Thu,  5 Sep 2024 10:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVgV2ZKP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8351990A7;
	Thu,  5 Sep 2024 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725531040; cv=none; b=XIAY1BBYSNe6D5FC1MR0XAFl8C4xIGja87CyLGKWDMamxSip9uXwFD+0rlLjtQI0B3qLhq3YMjk/3/WiAuSnbjqqPNfFcwLJW0fcmDs9CAZA2rJ+OUj4QpeAXXa40l0OU5I5T8xzBM930nksbWZefCsuGTQVvnJAxFtxZKMQPw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725531040; c=relaxed/simple;
	bh=0/vMyYQ0Wx2NMxRdccZKOydZqvl0rEL7RRjlWjX53Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsIkgZb1IA6i7o/Inl7KJUP3ogJ9Z7Fx36C96myuYTBz8WbH1W1c9RtgjqlpNmf+moh6pGauzA5fChGgIMk3AYgSQv27DAVRsJ43Y1eGo+JZDExQ13/C/BHdteetFlfVzzDcCgiJOGCnxIw0oEOKIL1Num5xTeQwwNEXqyooBuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVgV2ZKP; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53346132348so692760e87.2;
        Thu, 05 Sep 2024 03:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725531037; x=1726135837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wvN1I2knXR6FRaPCTP2Nq68jAbwk/9FcIR+V12XMub4=;
        b=FVgV2ZKP3IvsgspYZ3dwSLs46wB0P2e40+lsrEwkkT/vytiRoY6W/HShKTb4HAcISL
         kVqTzjXcIwqKFcfHDtvrDt34srxASm5x88Ul+YTrc2NQ4DN4S5031Cgjs5zBvsQE1UBy
         UyhCavPKgD4QVI789vyx89VeaYlWxzy9jW5bfxqxsN8XKfwrwRK2UGhLKyN7sZdbeGS/
         i2xJ5v/3LAAAeGsdXWrU0YvpMirN7rmHLOSdRnjErS6EuTfvfYqg8OUTWjzpia+9lvah
         V0XtcQCdEW+ZZISa2+7kz0soHyMvIThVhZyM/EhjiUWPoU+Y8BiK5zAsq7wmKsekdXf6
         4yYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725531037; x=1726135837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvN1I2knXR6FRaPCTP2Nq68jAbwk/9FcIR+V12XMub4=;
        b=YZaVzmuSVi9/zSTKLoKpUvEMzv8Iy6wfjunem0X+MxpAd+eBca7W7eSynBn/SbncEX
         tdGJXbYyDS5i52BtUlVJ4ZVz1E5WU2xPzWNm9y9LI9hLjESKvHhyWiUO+bDmAeW/jLWx
         lpDNLHGuiABtFgnDkQQUb6vLX4mMVxXz+DS5pisMlF2RC67ZC1luvhEch+Prjf9bUMQx
         DzqNDtsPLNBkFVFe8zGq1LZIU/zjaI4gWy3vUULQG9AvwPdIR/b6cMzSQNzgWqWD5MbX
         yP886lfqvjYZilUiHFvbSm+2u6dhU21O8RWqUgcQ/qZfI0W0Hn+6XL94bJ+k4bgsdvQV
         x/2w==
X-Forwarded-Encrypted: i=1; AJvYcCULNBjTSh38D6INWgRtqEyQGxKAraT+H7H0n+ZVd+pNjVzwCEruFOtUhFfR0wOvwmcDOa6p8ifRSBRo@vger.kernel.org, AJvYcCUqUwaTkNgG4f6MOqe/oGFeyrgTphCnxLFbJJM69DDjXwO3lqfeFNYzXJ1H39MFYVh65MCKkV2f1NOt04x/9g==@vger.kernel.org, AJvYcCWRVSPGtfBqS4BAHKd3NbzXprtz3AQQ+8RZVxdSQteRZM+YL/MvNtZvP3nH4jKepo1UY4t16UKaSmXSPOY=@vger.kernel.org, AJvYcCXx9szJenD/fERIshZtmksbNUFkUIp5gSV75XMhqE+YY/rjPq3sA4XXbvOC92U3JU8yN2Qv4MAoBPrRivcw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+HRocZymxWDjGB1xj4wdOCzCghDTSIcpuJUVwpsfal49pl7RR
	yIheHNHVuktUQg0FsY9m5h6oSbJO74JNc1Rp5eiYVpHdArNkACAH
X-Google-Smtp-Source: AGHT+IE9Xi84jEcvzMiidrfQVMoZc0TSOAS4xDwigWpUpHyJVJSj99CT0xX9KW/9RVO6OwwwvGvp0g==
X-Received: by 2002:a05:6512:3055:b0:530:e323:b1ca with SMTP id 2adb3069b0e04-53565f20df3mr4208181e87.25.1725531036183;
        Thu, 05 Sep 2024 03:10:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5356a7ad1d7sm283806e87.205.2024.09.05.03.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 03:10:35 -0700 (PDT)
Date: Thu, 5 Sep 2024 13:10:34 +0300
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/29] media: MAINTAINERS: Add Qualcomm Iris video
 accelerator driver
Message-ID: <tdvofocpygklipddgf7gbpttxdnmhe33krziwkzh2czpf4uiao@htiismc4dekz>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-2-c5fdbbe65e70@quicinc.com>
 <afba364d-8299-49b6-9848-ed1660f86327@kernel.org>
 <809c359f-6c24-f2d4-3c4b-83e543d8c120@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <809c359f-6c24-f2d4-3c4b-83e543d8c120@quicinc.com>

On Thu, Sep 05, 2024 at 11:17:55AM GMT, Dikshita Agarwal wrote:
> 
> 
> On 8/27/2024 4:12 PM, Krzysztof Kozlowski wrote:
> > On 27/08/2024 12:05, Dikshita Agarwal via B4 Relay wrote:
> >> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >>
> >> Add an entry for Iris video decoder accelerator driver.
> >>
> >> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> >> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >> ---
> >>  MAINTAINERS | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 8766f3e5e87e..105e67fca308 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -18898,6 +18898,17 @@ S:	Maintained
> >>  F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
> >>  F:	drivers/regulator/vqmmc-ipq4019-regulator.c
> >>  
> >> +QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
> >> +M:	Vikash Garodia <quic_vgarodia@quicinc.com>
> >> +M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
> >> +R:	Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> +L:	linux-media@vger.kernel.org
> >> +L:	linux-arm-msm@vger.kernel.org
> >> +S:	Maintained
> >> +T:	git git://linuxtv.org/media_tree.git
> > 
> > Drop, you do not maintain that Git tree.
> Sure, will remove
> > 
> >> +F:	Documentation/devicetree/bindings/media/qcom,*-iris.yaml
> >> +F:	drivers/media/platform/qcom/iris/
> > 
> > Drop, does not exist. Or fix your patch order.
> Are you suggesting to add this patch as the last patch of the series?
> or remove just below entry and add one more patch at the end to update
> MAINTAINERS file with the same?

Adding it after the patch that adds the driver should be fine. Likewise
adding it at the end is also fine.

> +F:	drivers/media/platform/qcom/iris/
> 
> Thanks,
> Dikshita
> > 
> > 
> > Best regards,
> > Krzysztof
> > 
> > 

-- 
With best wishes
Dmitry

