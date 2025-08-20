Return-Path: <linux-media+bounces-40344-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAB2B2D5DB
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 10:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4641AA02277
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 08:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA9D2D9797;
	Wed, 20 Aug 2025 08:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TDttB39v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178842D8DDF
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 08:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755677545; cv=none; b=OlXZibldNjojx1SOANF9LSyUd++S1oCTqjR+slb+3yplZlt7mKYSa54y0+XpwJEnt1Jp0Nv69vZvSytVOdQubWx+Eei99U4ZDNVp4XsGaz9V0u5UbphhQcYpwy96m8EgqUJHO7RSpp6QtVssuTPreaSHu7hqtMzW5akEKUMjN3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755677545; c=relaxed/simple;
	bh=haxIZUSQiCuxxydJqegXR7kmgNO/8Jz418zQVwNhZdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4fvSG/8jD2qbDE/UstFhIv+o4BDAKIMXEFLtzhGMYYdGaQsifq8OJv5bhIN4+u69inBr+6ZR0JlFSQ/mDMxCos0ThquMD+tEj8teIHOly04T/pLDBC0eMW4kVJHjJGySE764RTcOBme0QaxaZAFyn4trfeMOfuotxBQc1jVTdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TDttB39v; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b9d41c1964so3958988f8f.0
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 01:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755677541; x=1756282341; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E5mzBsBALiqNSttAJPi9ae9mbcrxgDyj2N9OaXqec04=;
        b=TDttB39vNVgcDXMCRMXQZAUW/dW3b/aSOKOuWiHfEP9caMeZMOHGWFBxYOV8VLkpql
         3jzUn+17e4VwsDQ4cO3Upaemjb9dksdjVTDDBcwmok+Hs6aU1qmFfMDhmDXySqsdBj0A
         v++5HywKPNDRMU6GUMaA41QFD2IFmSfdifuVhQG2tkbraEN+6B0V+qglulxa2oDh78/5
         NRtl9Fk8hIidRXGADTiO6+a5sWfcDXvi/PvUZb9anF++AKsqmUx8o6BThyhCDrQzOj5Z
         YB7vWN2W/DXiWClPPtMrOPZmqE24vik2J1fV74Q2taxaKAkcOlCkUYH+/g4HK1Ov1Eq+
         coRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755677541; x=1756282341;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E5mzBsBALiqNSttAJPi9ae9mbcrxgDyj2N9OaXqec04=;
        b=QQsTZxiwfgLReel+3ksIAh23ozqOSHPztFawFm29wg/P4txVat7XMTyHIehZYvY84c
         EG4cGq5qB0s5LL9P4kUEycAGwbayRWfWwVxVBA3T+UIfxc5iaJV3ypknGcZDY8l7dMA9
         XSKmSqQ1Yc2x55utaNCAek8jU9rePDmAmeI2pZ3q+qW2fByF0XuRrBBfsLsTejoG1Twi
         g9EDZC7RgHCKBdyt6O9G0v7NDZfoEM5n7AJUXS2EDMgs0W1NznmCNsLLvErfRGEzWAzx
         3gSvHaBXrlQVxVSpODDKwv2rzH6VB3RlrarGrRxW06mXmYsxvRDg8R7iusidajU/P+gW
         ki9w==
X-Forwarded-Encrypted: i=1; AJvYcCW23SP7x4N6w0JRFSn71NGuBO0XghAlTA7DRAO+lUd1Ei9Qs5H26lNYTpkBpPSlGt1n4i5c5eDXKUQ+sA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHypuj64O9GjrXoyrtgsMEh2VQd6dMOvt35GdKvL58NVv8rKbW
	E/0UzuCm1cLvd8EKeM+idGD1mn0c1hK+7loG0R+o3sIncwRX3zCrGT+1AjwR8KSH+dU=
X-Gm-Gg: ASbGncvyElV1yTalf+ytAh4H6NMNF2HMdG5GLzZegxjRv320/MqJYRPF/FCJIHvM4TP
	p5Q1kcABr8sd511NIeMPmvVt6xm971Z7TnxSg5kAc9fl2Wd99CtKsHw5ykTmt1c4+FlTtQ3gSng
	9bL1UTXBGVXqwui+zMhcPe61EKi9ZAZ+HchHjBoxhHJ4wPeB+LhuAfLJEsb30VIa4fEA5R9W0HQ
	JX+CqKsDOwmLL4t/iVqs9OtpZ4OEwbXXwoedkmHr9F/tYuJPYot1zO0SshhAqYrMRJZwLSxY+i8
	ea9KlYCJN65uAueoCNj2jzUhMu9Mw0jxjR10DkBBXvHdbDUB6Z43PgTVgHfy/62qGk43+lAvn4P
	I0QreJE+8AustsfZOgQzDm3EOy+3AYxPP5LQ=
X-Google-Smtp-Source: AGHT+IGuQH165HnaQTwksDDzZkNVZOjiFfhmMoSOhDlESgJ7dUKSOkqF1KC3ciNT1El2t1RjmBhg+A==
X-Received: by 2002:a05:6000:2404:b0:3b9:1697:75f0 with SMTP id ffacd0b85a97d-3c32eccda13mr1347315f8f.56.1755677541336;
        Wed, 20 Aug 2025 01:12:21 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:8a2d:c0da:b2f2:1f41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077c57aa0sm6687179f8f.66.2025.08.20.01.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 01:12:20 -0700 (PDT)
Date: Wed, 20 Aug 2025 10:12:15 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 06/11] remoteproc: Move resource table data structure
 to its own header
Message-ID: <aKWDXySSt57tXHVP@linaro.org>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-7-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819165447.4149674-7-mukesh.ojha@oss.qualcomm.com>

On Tue, Aug 19, 2025 at 10:24:41PM +0530, Mukesh Ojha wrote:
> The resource table data structure has traditionally been associated with
> the remoteproc framework, where the resource table is included as a
> section within the remote processor firmware binary. However, it is also
> possible to obtain the resource table through other means—such as from a
> reserved memory region populated by the boot firmware, statically
> maintained driver data, or via a secure SMC call—when it is not embedded
> in the firmware.
> 
> There are multiple Qualcomm remote processors (e.g., Venus, Iris, GPU,
> etc.) in the upstream kernel that do not use the remoteproc framework to
> manage their lifecycle for various reasons.
> 
> When Linux is running at EL2, similar to the Qualcomm PAS driver
> (qcom_q6v5_pas.c), client drivers for subsystems like video and GPU may
> also want to use the resource table SMC call to retrieve and map
> resources before they are used by the remote processor.
> 

All the examples you give here (Venus/Iris, GPU) have some sort of EL2
support already for older platforms:

 - For GPU, we just skip loading the ZAP shader and access the protected
   registers directly. I would expect the ZAP shader does effectively
   the same, perhaps with some additional handling for secure mode. Is
   this even a real remote processor that has a separate IOMMU domain?

 - For Venus/Iris, there is code upstream similar to your PATCH 11/11
   that maps the firmware with the IOMMU (but invokes reset directly
   using the registers, without using PAS). There is no resource table
   used for that either, so at least all Venus/Iris versions so far
   apparently had no need for any mappings aside from the firmware
   binary.

I understand that you want to continue using PAS for these, but I'm a
bit confused what kind of mappings we would expect to have in the
resource table for video and GPU. Could you give an example?

Thanks,
Stephan

