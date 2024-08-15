Return-Path: <linux-media+bounces-16327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6DC9526B8
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 02:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C68601F22DA3
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 00:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9E118D628;
	Thu, 15 Aug 2024 00:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="jKoFTMNc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FF38BEC
	for <linux-media@vger.kernel.org>; Thu, 15 Aug 2024 00:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723680993; cv=none; b=bXhzZPcPG5eOdSoRiclDbGUPig4ujkO6qivOfW7jZxIzV209b2iIgO8xi8dCdhwogDqZbyM/4U7W5t96sWsv37qkPoDN5C4K3w+2lggrKbDtqotrA2ZkD9D3Ry0cHokjR6ivNvBnhsczeKlIBrEqW08OxmCYslAyqa9W9wgpsLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723680993; c=relaxed/simple;
	bh=F1t2isRrKDubCdz+j0eAPXg5idK9hYQi55oHFsWBC4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDUhVrFOi22knV1JRXN3AC9xlEYiMRPAlhpDi93SZb8r5DDSYJ5c/4zgBW15cghI8jqNY64XcRHpbfpdVPqDDHF6sY+SVOeLX9ZxdUJSRnMv+Ph9LHtT1JknZpl0IUNLfYlyY+Z2fvMLbu0ZOOWwTpRnK7fAn13YMnQ8QQfKkRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=jKoFTMNc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42803bbf842so2888815e9.1
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 17:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1723680990; x=1724285790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcyySO/Wg9CZpKT7IKp0MYN8KR1sVKZZKcglj0UTO+4=;
        b=jKoFTMNcXyWu4HA5UV0dDz8HgcCZiwSanzz+yVq2J+QBMUHuaCJ8tnhL/BVHii+y/l
         QJ4Cr1UwiVxhvWnTOQRwD0+s88g5lPtncDKzmkmyb+ihmxRnvrMiY3mhKZ03dvoSF+2k
         211ePwx3vxZO4VaLoRbh6fBhSCkm3Th93OcwGflyQu7AwHME9IJXrQxOt5MdvDHpNpoy
         yP0NkZwTl7HAyEpkCrLwej+zpARUZZLzpCBmuy+S7KKYjlDseOQQAkfFoENwRbBnk7hU
         eUgfncGHTEhFvbcytK9be2iLJXxqUxznNAURB1w2nPvdyCQhd+f7qqyQE6IQcgXda2J5
         wqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723680990; x=1724285790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kcyySO/Wg9CZpKT7IKp0MYN8KR1sVKZZKcglj0UTO+4=;
        b=kYkgsivGoototwLR+/sEP8KWrXrcwxhTqxSOnAODc1rjNck2IR4ycAmmzbrbndAosy
         ZaPS+Bmu/c1oGD1h0vY0GOTzEpAEJlChIZdWIRDkoQDFxEN8krNdtOxAwNdAN0cXVfHg
         3dKYfDbSUGRnhakTFCmMwZyxRlm5yRiXl/uvFxF9qngcDPAFbzH69qPv0vbpCc6NnmKz
         8RKI46xGVDFaf96jWXF73cR6hwMoMCcr3/3HBj0SXezUi2fEhtRfEZKUMXXDbv+y8ZT0
         m4cPJ+myKamV1vZo3yJzH4fiRqIJ4VqdOzxj6ZMBRpkI3dGxhq/qdZ6QfQRXfmeF8D/5
         nOwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIo3690yPMcRzrcVKeS8N/9qSBFMzJ8EmMibBp6mV7FIAHEWikfi48zK2Z3LxeFajcR7+lfNDXheEobr5+ziwAqVX4uDNaU3NM8Lw=
X-Gm-Message-State: AOJu0Yy88zEqvn9DDZfzZ5c60MYVvaBYMCpebaIYTGzYtoTPzJeJq9jV
	LWZ8SJgNFPu4C21JFYzGgYzc8N5PZKvgDq4TCXXeNZ1rKEjyBN4FFu67ypMG9odJayiwwKjJGhs
	U5dQ=
X-Google-Smtp-Source: AGHT+IFY6+VWTdl6HGrF4ZvTkdgttMRkUwz3Qz4CdcIunOz+6SiVzveLecIQ/lxRZacFcyYZHe1a1w==
X-Received: by 2002:a05:600c:4fd1:b0:428:111a:193 with SMTP id 5b1f17b1804b1-429dd267dbdmr34933095e9.37.1723680989829;
        Wed, 14 Aug 2024 17:16:29 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded72524sm34167075e9.34.2024.08.14.17.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 17:16:29 -0700 (PDT)
Message-ID: <b31f175e-4171-491f-9203-8186a84ab712@nexus-software.ie>
Date: Thu, 15 Aug 2024 01:16:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20240812144131.369378-14-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2024 15:41, Depeng Shao wrote:
> +static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;
> +
> +	/* RUP(register update) registers has beem moved to CSID in Titan 780.
> +	 * Notify the event of trigger RUP.
> +	 */
> +	camss_reg_update(vfe->camss, vfe->id, port_id, false);
> +}
> +
> +static inline void vfe_reg_update_clear(struct vfe_device *vfe,
> +					enum vfe_line_id line_id)
> +{
> +	int port_id = line_id;
> +
> +	/* RUP(register update) registers has beem moved to CSID in Titan 780.
> +	 * Notify the event of trigger RUP clear.
> +	 */
> +	camss_reg_update(vfe->camss, vfe->id, port_id, true);
> +}

Hmm, so another thought here.

camss_reg_update() is not an accurate name -> camss_rup_update() because 
in this case we only update the RUP register, not the AUP or MUP.

reg is an abbreviation for register - but RUP has a defined meaning in 
the camera namespace i.e. RUP = register update and its job is to latch 
shadow registers to real registers.

camss_rup_update() please.

---
bod

