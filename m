Return-Path: <linux-media+bounces-28533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1D8A6A84A
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 15:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E9443BEE41
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 14:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA36222560;
	Thu, 20 Mar 2025 14:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+I3Ruwm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF3D7FBD6
	for <linux-media@vger.kernel.org>; Thu, 20 Mar 2025 14:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742480267; cv=none; b=Is+Uhc52E+319xqR7RmC1divKCK5Q1Qvq0YTin4In+rLG3VWJIs3eKO4B0HiZzwsrJYd9wI/WEcLsy/MA2F5YAFH7cBhGfoYyJ4sNJgfVG9u4oeHPcBeMBPiN4pTWuw9DVO6rd4Z76C8pxu7BsFOlWh79K3adTrUBBL71rzCKxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742480267; c=relaxed/simple;
	bh=jCGA61MwbU6McxQbTdDV6IgOzjP+Ui3qppjhIrmBniQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Nza2Pt+/YpI6khgdLFRfe+5MxLup6ur0t3ccQrmgyU7UycMkpnIhrdR6BNBZrUezno841hvkr2foD88bdlSYScFS4G4PdCbl16UcWmj4Q3SUeeoUXa3ekm7tnfDxq3jbP16xyEKb3pwcKrqdDYIoyFJ2h5dhySBWMA7eMXWmSoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+I3Ruwm; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2241053582dso19335335ad.1
        for <linux-media@vger.kernel.org>; Thu, 20 Mar 2025 07:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742480265; x=1743085065; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3+aDy5vcZlIrpOrcHEForDyEvN9cZMzMbGScOxzArc=;
        b=L+I3Ruwm/BlTF2N2bNsVfaF/EyEoNA7wag0ygSkosA4zktazF+H3c0Xtvg8jJ6VJYd
         IQaFFgOWv3/+gFS5RCT0Vj6J7gBUloTO5vGpA20IfdYbeaq0FojIsodfZrR75BorcSpV
         VSqZT8hgTDv2OWMsQcHRz/DY5QnXU8nuAvwIO0PNAZ/UajRZJEXn5KwI4ygght51ORX2
         cTF87B3X2/qh6j6Dm+fFgHEtWOajYQHfOMm7xoCRdHjuWKeTMU6s4rUjpqjjRdsc6cvp
         +DbMD62Db5ZE5ScNjWq8Y0qqOuFaalrhe3bXK6s3ufH2HaYJX1YqpCDGP0wq4275z1FU
         MDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742480265; x=1743085065;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v3+aDy5vcZlIrpOrcHEForDyEvN9cZMzMbGScOxzArc=;
        b=Xef1758yOcUe4G/Hm5yijRdsEpM0w5SRPVKjGF8G8A/XEy3x+BaIMlSQ9QtUmUmddR
         lg4KT+I5d6yvcEGVV+EeAfvUl5jYiOnbB0h87TF9tS46EIObRyv/ooLtOHeRc7jkepbA
         Xf148I+5D/RdZTlFnAUVfCdy7Km/jIkyOpaXgeGPsU8xJbLoxnPVnS6bpl2HD2A8nf18
         kLBK/5bngHpD0vQ/UiGJBVdBqpVvBvKgrb7XM1DB2lNIW7BgOYqDtnwMscpZi9RE1BwY
         Yy8z0RkVacF+9xHLWjCjgVMvkWIN7coanwYymqBWyW/X+F62o+6XtEthRjtXJWRqB5Ok
         DCew==
X-Forwarded-Encrypted: i=1; AJvYcCXH0xNZMZ3ywETXuCm2R1bnvszaXZbFQRaA3Gk6JxKcaz98sHhqSWftuey/sxHpDmw54damkxB+vuOPbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUMauunCymLcqJs/9Oz3cWWkC8Z+jxy5PmSsld4WljEaAMPmIT
	0l2U+TN9ny5qBu0LSRmGFWshLgeSsiD4KzEzUOoqrgsAYj4ICjO+
X-Gm-Gg: ASbGncuv9FO6TOGzZ5+Js/Yw4cHeVvb/lNXqOusoOcSeJ3M/0iwIYOgwfGnpH34s4Qd
	9Ebsf0mbwuNua2BBrBZvu202mHJY8icoSVxEonagZvOqz5IC0wt7Nho1qKxiCUkGhFZYBAMfAXw
	MT5VcuJeXYg6glHqzpCVCY2FphoC3jmcdY7Yi8AvgQiI1nvlQBk8h9fM9QI4I0PjTU36jls0rRM
	T0RkvvqT6c3OmNWQZgX0nMlwBRT2RP6QZ9vG5EVr4Jm6PwcS6oxGxiRJvSpn06k1iMCTMv5ma9n
	GnhdOx/RH2yBkRQxDyzzRFTUe/+q/ipp6/vtTYztq27IeDejx0xBlYsH2S3LdmjPkllEMs/zywO
	AJu61jHi3upOridNgrEw3i4A=
X-Google-Smtp-Source: AGHT+IE8oiZVV2XYpE797piEDJx1+z5ttLzoPJrglr88uN82WY0Rd5HatMRA+C8qMsk2nVjFwioHPg==
X-Received: by 2002:a17:902:f687:b0:21f:71b4:d2aa with SMTP id d9443c01a7336-2264981cfd5mr122625945ad.5.1742480264451;
        Thu, 20 Mar 2025 07:17:44 -0700 (PDT)
Received: from ?IPV6:2405:201:3014:3a00:dd10:7ab:7ae6:7de9? ([2405:201:3014:3a00:dd10:7ab:7ae6:7de9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711559fd3sm14286952b3a.69.2025.03.20.07.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 07:17:41 -0700 (PDT)
Message-ID: <e7d92521-f9aa-4a24-b6f8-748ef6f720bd@gmail.com>
Date: Thu, 20 Mar 2025 19:47:37 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: hdegoede@redhat.com
Cc: bryan.odonoghue@linaro.org, heimir.sverrisson@gmail.com,
 ingvar@redpill-linpro.com, linux-media@vger.kernel.org, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, stanislaw.gruszka@linux.intel.com
References: <20250319145927.70534-1-hdegoede@redhat.com>
Subject: Re: [PATCH] media: i2c: Add Omnivision OV02C10 sensor driver
Content-Language: en-US
From: Piyush Raj Chouhan <piyushrajchouhan@gmail.com>
In-Reply-To: <20250319145927.70534-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hey,
I am running 6.13.7-arch1-1 with v10 patch.
https://github.com/Pc1598/arch-zl513

Device I am using it on Infinix ZeroBook 13.
Feed i get from the ov02c10 sensor, In all of the camera applications 
that I used (Firefox, cheese, and qcam) the video is inverted (upside down).

$ lsmod | grep ipu
intel_ipu6_isys       143360  6
videobuf2_dma_sg       24576  1 intel_ipu6_isys
videobuf2_v4l2         40960  1 intel_ipu6_isys
videobuf2_common       94208  4 
videobuf2_v4l2,intel_ipu6_isys,videobuf2_dma_sg,videobuf2_memops
v4l2_fwnode            32768  7 ov02c10,intel_ipu6_isys
intel_ipu6             86016  7 intel_ipu6_isys
v4l2_async             32768  3 v4l2_fwnode,ov02c10,intel_ipu6_isys
ipu_bridge             24576  2 intel_ipu6,intel_ipu6_isys
videodev              397312  13 
v4l2_async,v4l2_fwnode,videobuf2_v4l2,ov02c10,intel_ipu6_isys
mc                     90112  8 
v4l2_async,videodev,videobuf2_v4l2,ov02c10,intel_ipu6_isys,videobuf2_common

Please let me know what info i need to share.


