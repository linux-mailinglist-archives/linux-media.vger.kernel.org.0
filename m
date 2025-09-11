Return-Path: <linux-media+bounces-42352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0095BB53707
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 17:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FDE8A07CF9
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 15:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7143C346A13;
	Thu, 11 Sep 2025 15:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0dxe1ZU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447E83469ED
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 15:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757603505; cv=none; b=Y2+FwJuKsOGEBp88k4bc4A3ncLPZzvDIAZ49fB9e1Vz9eqMRMWhxmccdllsnsD/3WRF5dgUD9ShoYcI7pKlNf8xR81pLcbTCAugef4cDZB1aMUo2p/nVvThOlmV/Zr2rxDCoJM/RbxDQ65TpFwwhrLFxSGTE5LZgkegptYDXMnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757603505; c=relaxed/simple;
	bh=e9kv85eYZpW09Sz+LBjMWCQsY/b15orHC+8wBoqJAFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nf7bu/IFdR07Erfxo4fFFHGVW3jiCAK+WL4+CkMflj7+TlRjWP7QoKvCVLyAg7ls46w7iJaS4+jlvPh1jAUxmrKQxOCRnk0klirI5Xcox7Cox8Jd6qE6ECgJn4V5tpSKj67G25cCtYhsFPMHp9bkEdX0cQk4WEZZiLS97/8CU5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0dxe1ZU; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b0787fc3008so120294866b.3
        for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 08:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757603502; x=1758208302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJXD0d9dznPgcTPNThW/LqxiTrPZwdyiS6ep+9wlnic=;
        b=b0dxe1ZUOP9q83YrjVN5dEeNykK1nkVZ5ttP6fYQQ65yhPNinj6wrjYyKq97Zeu6KO
         OU1WhS/tSlFkggMR0S55m3VzrzEgnwG/XfS2m6wjCS1Q6b0izTZQ0g1PWzGJEsTVROV0
         9GhQ+7W5VCRIrMqmMlMjQ3U+HCZNdHC/fsRrELJPEAK+pLmA1W+10lo2ZkHsRY7+PYuc
         iZF8Bu6YN8PpaMNc0cjMPyjkyCerm+VLS8tT6zLxAPIlsZSAb1JHNREcxa2m6YHKnLq5
         kkM2p7+gup70AzZHOlzmRE7iTSZ6/squHvZYlKEgjND3GmpeYliqGQjZM+/2uw96vNkm
         4ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757603502; x=1758208302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJXD0d9dznPgcTPNThW/LqxiTrPZwdyiS6ep+9wlnic=;
        b=dXUsmIos+4IYDydgFf1d07QGeQZ2E5JmLWdVKaU5TMU8AVPhCg0mJpYb+ody2CoglE
         Y1IQ8wduRqn5dnR/bvFJtoTuuO6bAMXa839titcZjFE2YvFI88FYWrMD0q1Bx9GWRu+g
         O2txrbDiCAT5aqR6dbKrnpgHP4Pw97oYgwokvmaZpIMP0v8JcI5ZKm16tVVV1wQl0MeZ
         EtPFj/UWLU3WQsNHvdosUx5bczyKTaUOVjBhl5NigHYLH4GHPK4+jpm5xovKGbuoRsqT
         leMIr3sLpMi4Fh9FDiSUpuICEh7L82y1245dtwITknQ8O/tU3uLqGArq9/nA14KLGHT/
         isAA==
X-Gm-Message-State: AOJu0YwLBPKk+mjmyGk1sovaeNKQEB0RGKYCPqVPh/YyLwmRV8asF0+8
	eHLhBptaJLOuTXEIxJOMCQvCV/saLmIoIq4PNs53MeS+HA/PSzj+4/yv
X-Gm-Gg: ASbGncvuwTH+3pA77jzB7a41/Vto9+UqcOSRpCi9Xwjbdlsj2n6XSl7O8qDgBhhIGsr
	Y5u6RiNXl2IDEGgpap5oDBOjXorG8lmdyxiLy1vmzjvNfZNrRpt7TRpSn28i3CeNKmv303ppWvO
	Ocf9wK/gzStkNADIq2X1xWAyDsqDHk8LTWedifN6Nw35V7/kp0Ok2izqzLP7kQrQlkpMDo4yRGB
	HNhIXjV9RPFqra8QhxW63b6WAeuqwLar2gP/7XRyETpcJhSatiC9fg8mbTTbIsWa10JQqXFVC3d
	f2FSzfEkPy6HSB1YbM6XvFbHPHLMH8JTmYiyqNMoXdeEdUedG/YAD8y9Cm7NkMj2u7NHpcgwhCd
	cC3k1COf+abbQNaByrWneHgLxhTkNAz/ABvuN5IZi0jheuCodY0YwyfX0ibwyEQvisroAq24=
X-Google-Smtp-Source: AGHT+IFu/p3XCl9aAF361ZEinW5yYkUkoSXzrLLXvUd2NuKZyhoe8iX783XV/nHzhkHTR9LYfTKaug==
X-Received: by 2002:a17:907:3ea8:b0:b04:25e6:2dbe with SMTP id a640c23a62f3a-b04b16d8182mr1906360766b.63.1757603502321;
        Thu, 11 Sep 2025 08:11:42 -0700 (PDT)
Received: from ?IPV6:2a02:8109:8617:d700:fe0f:5a9d:7cd0:4679? ([2a02:8109:8617:d700:fe0f:5a9d:7cd0:4679])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd3efsm148194566b.55.2025.09.11.08.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 08:11:41 -0700 (PDT)
Message-ID: <bfe25a26-fef3-4ab3-9ae2-ac9245fd5830@gmail.com>
Date: Thu, 11 Sep 2025 17:11:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: alvium: cleanup media bus formats
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, michael.roeder@avnet.eu,
 martin.hecht@avnet.eu, Tommaso Merciai <tomm.merciai@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
References: <20250909135938.2841635-1-mhecht73@gmail.com>
 <aMK9PQ62EYeJpgeo@kekkonen.localdomain>
Content-Language: en-US
From: Martin Hecht <mhecht73@gmail.com>
In-Reply-To: <aMK9PQ62EYeJpgeo@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari,


On 9/11/25 14:14, Sakari Ailus wrote:
> Hi Martin,
> 
> On Tue, Sep 09, 2025 at 03:59:37PM +0200, Martin Hecht wrote:
>> This patch removes MEDIA_BUS_FMT_RBG888_1X24 and MEDIA_BUS_FMT_BGR888_1X24
>> as of that formats are not supported by Alvium currently.
>> The missing and supported MEDIA_BUS_FMT_RGB565_1X16 has been added.
> 
> What's the pixel order used by the format in Alvium case?
> 

The Alvium has a fixed pixel order currently what should be BGR during 
transmission of any RGB format as described in MIPI-CSI2 spec 1.3. We 
tested with MEDIA_BUS_FMT_RGB888_1X24 as well as 
MEDIA_BUS_FMT_RGB888_3X8 for RGB24 in several SoCs like imx8mm, imx8mp 
and Xilinx CSI2RX subsystem on ZynqMP and Versal.
Does that answer your question?

BR Martin


