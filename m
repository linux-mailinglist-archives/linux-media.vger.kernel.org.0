Return-Path: <linux-media+bounces-14164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DCB917C4E
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 11:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EAA71F28C1D
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 09:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A0616F90F;
	Wed, 26 Jun 2024 09:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xwoP9CJb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8744D16A95C
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 09:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719393463; cv=none; b=BgvU+g+/xCqoCsqQIhytZ3LBt01Ewg5Z9xIWJCRJyT0yikPVOYVpUfQvvrOcum42Q2YZs3aZqnxAnRa/LeNIf6MGWyIHjcnELmBRe1UDQrmmt3dsGxYEQby69cDvzIO0rtw9ipewQAiFWr/rk0Ta21QamMbdvnhmBFQ3c9j5Hhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719393463; c=relaxed/simple;
	bh=TdR+0h5pgv6sf68bp9AYfIlXpF2fRPqacyemVdw5/HI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFLb42viwQbUfaYSP3jtztD3Q+cVfUouoSG2YppmLr64NZXkYBpuLPvaH459QDETfnlQ7rFhVocSMGrV752QvUzTZZFn0nfYSp/WHh+iNH/3MxoG17JJzYhM9F1gZivh1ik3JGTR/6bNX1wxEUFl4qG3eRZV+VSS9LwfbWZTb2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xwoP9CJb; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52cd717ec07so5724133e87.0
        for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 02:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719393460; x=1719998260; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lIqsgUc0qUv8b+n84AsHvKArD60z2TYKJpqdlsOonTI=;
        b=xwoP9CJbzxfI8Jlx4ekbMSAI+6D7sjvrlMESsM9+HUpm4wnXOQI+J+eGOsePOb+bJp
         gOwzAbLqys9IOODbYyAyDEMr74t6oWvCZ+w37Bh4B27HzWFaeIHErO/NNjte2GYmWImR
         1LuG+DTulTQMZ4XOoBOLfdm9gF+v4+c5K77w19fOJm2e3DTqPbsO8trMneIAdOYcihgT
         1BCxvmbXsaYq/Lblj+leI5oQms2exA6SXx6kUSVfbAIe5qJAfSxGht6ilorEI+kuiaRH
         fTJhB5EOjV2m3CSV+ydgORRksyzL+NVSnpGo4vK9kHlQYt65DwVz/OwZF0QIyhFhQYTu
         mRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719393460; x=1719998260;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lIqsgUc0qUv8b+n84AsHvKArD60z2TYKJpqdlsOonTI=;
        b=kzNwi04YEAZ748VxaOh1xTxD3RSbzbkEOhnVgQWKGlzTQZZfwKp9OPiwzs9WMxOvST
         6Cdrs2e5xsbqsqvzbkp23dfjDYIRq8LIeUHOYAuTjW7pD7bSaVRLn0+Q4ifPL/2Ce2Fx
         GRU0cbpGuSiVNQtkBCaR83CyBeK4n5HVQ3fvzCFDjRG1455vq6h7fcRhMkAgzRGnej6z
         j4n4wzdNb1avblrB5aqd50I4UMXKvr+uzxmvEGuBi9S00XMv0HJlTQHCyymY94HCISXi
         uBVFEkRJf8lDC7E7Dgw5jADuttICSAvsKcUkSZEUExLNd7dpOc4ccwNywmduCb/42tON
         rqlA==
X-Forwarded-Encrypted: i=1; AJvYcCVETzgKwOksTIPW2vHV4ut15m9ZkMQxJr2uBVn9m5hX+JOEvtUxbyqxhIODJeX4BJVvoZW+8TepOx5LXIrXRgkoyPEaQwCnzxClYqM=
X-Gm-Message-State: AOJu0YwbpY+EI8wrc8AquluE4s7dcTnLXSF57UC0QQA93ImRWEIuFDWD
	HDRKqx6p5iNd2DLwB8PkMNLv9QEfbQKz3B/Dr9xG2qZzpN+YjSSROQGOrgbkyZw=
X-Google-Smtp-Source: AGHT+IGUcuxRMZ/d4v953UhQb7EFPCTahiRnNum885ExgEqYymNBwBcHbYy9/YkcMVUlc/gGhu888Q==
X-Received: by 2002:a05:6512:138e:b0:52c:890e:e8e7 with SMTP id 2adb3069b0e04-52ce185cfecmr8024194e87.50.1719393458662;
        Wed, 26 Jun 2024 02:17:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52db233f5e4sm144142e87.69.2024.06.26.02.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 02:17:38 -0700 (PDT)
Date: Wed, 26 Jun 2024 12:17:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: george chan <gchan9527@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT v3 1/5] dt-bindings: media: camss: Add
 qcom,sc7180-camss
Message-ID: <xtnamlbshpfw4vhixdvvlbg5qwosx4xfiwys3kjrnnvpdegejl@2lq45llo7twy>
References: <20240624-b4-sc7180-camss-v3-0-89ece6471431@gmail.com>
 <20240624-b4-sc7180-camss-v3-1-89ece6471431@gmail.com>
 <c33dde93-2c3a-4a00-93ee-e4de303c9057@kernel.org>
 <CADgMGSvN=uAW7z1dpETGVRewzDG=K2MAtzOkhK7xAcskU_oeZg@mail.gmail.com>
 <0a35f0bd-ceec-487f-b9fd-ae9698b74048@kernel.org>
 <CADgMGSt9Hu5Ciq=ndMTaVK23Y_ixTVtTuSfy4hJkJooFH2uv9Q@mail.gmail.com>
 <CADgMGSv+x2Z9FsWTHW0auttvpdfNDnOPxiJhXnUaW3yQczN_Ag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADgMGSv+x2Z9FsWTHW0auttvpdfNDnOPxiJhXnUaW3yQczN_Ag@mail.gmail.com>

On Wed, Jun 26, 2024 at 04:38:48PM GMT, george chan wrote:
> On Wed, Jun 26, 2024 at 4:17 PM george chan <gchan9527@gmail.com> wrote:
> >
> > On Wed, Jun 26, 2024 at 3:15 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > Keep the list in "required:" in the same order as the list in "properties:".
> >
> > ok gotcha
> btw, i checked  "required:" and "properties:" are aligned, both of
> them are in ascending order. I am wondering if you are talking about
> two things, 1st one is to align both property, and 2nd is having the
> ordering like below. Plz confirm.
> 
> required:
>   - compatible
>   - reg
>   - reg-names
>   - interrupt-names
>   - interrupts
>   - clock-names
>   - clocks
>   - iommus
>   - power-domains
>   - power-domain-names
>   - vdda-phy-supply
>   - vdda-pll-supply

Yes, now this looks like a correct order.

-- 
With best wishes
Dmitry

