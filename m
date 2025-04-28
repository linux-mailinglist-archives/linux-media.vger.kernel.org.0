Return-Path: <linux-media+bounces-31207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2972A9F0EA
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 14:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50234170060
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 12:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527511DE2D8;
	Mon, 28 Apr 2025 12:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U/dOVDX9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD33B26980C
	for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 12:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745843946; cv=none; b=kopejbTcohxRzHAkOOmcBqk96YnJ1tK2UUZx80u4breomMD1wL1rUP2nxgqXKRF91Mc5M3GVxXA1F82ztWWNMX+IbuhQrYNCf9kzqIjKNnAUSBuvd5Upd9qS4p+nRtSsslvco1CE+PZlsq9Z5peLDs3iBQZ0jFe/3GET6i89vZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745843946; c=relaxed/simple;
	bh=5RTpoGxd0yln+rD+iVZT7mTbh5dja30gF/VvmJMuPCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0ZtyIzaZqTgfZuK5UhU/2qpq4/iNkeWsEWgnBevy8IlykjS2bp5flqWqUCodWnZXIqgTs6vc3pJiOn8pvAmv2LBiLKVUX76EW+F5B1E6qln8oYoVN0bb1uz8APihk/diiQmS5jDkm4G6bprcZnKM29sAUx3eKFuPZz9Kb/OLCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U/dOVDX9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso3276018f8f.2
        for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 05:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745843943; x=1746448743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kajF+eLdT9ofXGeTd3YYf3HoPa+dzTPyEOJzZGW/Z3k=;
        b=U/dOVDX90X61jKy2N4cTdr2CnkzS3Dy9WHu8I7fD9N38vjtdThOlxKgPVAXJUzQslK
         E13uqbf4sX96mtBHnTxX1SRf0flQ0YWr9upe+IgvnkLYM9PyqKOVGlDgYyuio/EShr0l
         jH0s7pz2iYR09N5niQDUvKtmG3f+tawBTErbuQTM4h+YTtnM/+/DWf+TXoT1FcJbnLoH
         ltitcxRSY7eK6lT9vS21llzRSo05eYE4/4C6+a9uOZkqXrMcaWv1sso9W6IxToh74FHI
         Q5Db0MhSB7pYQI9xMOspOgkSI86h9/6kZBcHBk1gy6pzUKJoOIvF76bVRupCjeYcDumL
         jQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745843943; x=1746448743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kajF+eLdT9ofXGeTd3YYf3HoPa+dzTPyEOJzZGW/Z3k=;
        b=qexcnFVQqrNgMIijfzoa1rBOj6BXuaHjSxM4eRynRSnzL7U6IC3K11t5/2jZuv951h
         q6mAbFU0Q5nJqJgqS+/YmR3YZphIu97BqCY+Vm8q7RLwA2nJpLmj2Jop0oks8ByTR9x8
         fB9pZ7bbIFBn6kIrdR1Kss7l+wjzT66HbWVmRMwQs2g7rRy1bdKThMTg11bqQrQA8hhO
         bjXgZEBk5ehGvaSR5glhrkXyD48wvcBkM+zhfoXWaMpCehGTJloe0beBXBhsGFQvhymg
         UzSYVZYu2im3H5B07vmT+I/aRXQ6PAyQaDHi+U7fFHvgLtFMzLsWUje4Kp9lZSWHaHtA
         jv4g==
X-Forwarded-Encrypted: i=1; AJvYcCU1MvgnYGe8jYtrSMG3pbrXsnhtGDF2gK0LhgjuQHr9v6k43NcJWXz0AawP4fPGlduzc9jFwyL9QGoe4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsIoxrtEp1h4nsEWzXEQgGc4eoxWRMPM+6a+4m0ic3K2mqea6n
	w7s1kUqog/YwxLeC6KFbd9QF69jqASqVFiNQrbP+cSaFesSRIgCKsigHrmHCRPg=
X-Gm-Gg: ASbGncs6Su5BV/EVB8/yRB1wmVj85b3+/Vyds0q+ivHkpkY42qTFm2Y2UcVqAswGgig
	mYVUBXm6nI+hKOJe/+nJt/rK6AVlUBYfyUiwXIVzXOzJi9yniZ66KWEkJ5vHOPRTZyC6fmFDD+G
	nV/r+yq7aK9OLEJ0KeNE3MDFLXibmKxWYVjmyzv7lDN5/TmwX1C3E1rSUZUVBvLCSr3/JufkqcA
	fbHMKV/SK93uawsjbP/K80cBHZniDeg+09z5s5IYMgIBGP6eAKTmVT5WvuBEpw7InauQckiwA5V
	QEANI6PDsACp0SXRRt1gbJuHZJjbDjijEef/MHvjAzKKvA==
X-Google-Smtp-Source: AGHT+IEZDN+foaMYfgyt9eU6rOly8IkdyLaoYyUZbXxe0vM6gzcu4bTy/soXgGRLxAd0ZxJ3sOA5TQ==
X-Received: by 2002:a05:6000:1a88:b0:39c:1258:2dc9 with SMTP id ffacd0b85a97d-3a074fa73c6mr7995850f8f.58.1745843943130;
        Mon, 28 Apr 2025 05:39:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073e5cffasm11177664f8f.96.2025.04.28.05.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 05:39:02 -0700 (PDT)
Date: Mon, 28 Apr 2025 15:38:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
	20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 14/23] media: iris: Fix NULL pointer dereference
Message-ID: <02824759-c468-4907-b0cd-554c28cc4de1@stanley.mountain>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-14-3a6013ecb8a5@quicinc.com>
 <7f37ec27-0221-4bb2-91f9-182244014b5a@stanley.mountain>
 <7ef2daa2-a6fa-2285-6619-b2f25baabc55@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ef2daa2-a6fa-2285-6619-b2f25baabc55@quicinc.com>

On Mon, Apr 28, 2025 at 05:40:01PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 4/28/2025 3:10 PM, Dan Carpenter wrote:
> > On Mon, Apr 28, 2025 at 02:59:02PM +0530, Dikshita Agarwal wrote:
> >> A warning reported by smatch indicated a possible null pointer
> >> dereference where one of the arguments to API
> >> "iris_hfi_gen2_handle_system_error" could sometimes be null.
> >>
> >> To fix this, add a check to validate that the argument passed is not
> >> null before accessing its members.
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
> >> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> >> Closes: https://lore.kernel.org/linux-media/634cc9b8-f099-4b54-8556-d879fb2b5169@stanley.mountain/
> >> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >> ---
> >>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> >> index 1ed798d31a3f..cba71b5db943 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> >> @@ -267,7 +267,8 @@ static int iris_hfi_gen2_handle_system_error(struct iris_core *core,
> >>  {
> >>  	struct iris_inst *instance;
> >>  
> >> -	dev_err(core->dev, "received system error of type %#x\n", pkt->type);
> >> +	if (pkt)
> >> +		dev_err(core->dev, "received system error of type %#x\n", pkt->type);
> > 
> > I feel like it would be better to do:
> > 
> > 	dev_err(core->dev, "received system error of type %#x\n", pkt ? pkt->type: -1);
> we don't need to print anything if pkt is NULL.

Okay, fine by me then.

regards,
dan carpenter


