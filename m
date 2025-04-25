Return-Path: <linux-media+bounces-31084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E5EA9D394
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 22:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A60F4A77BA
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 20:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5CD189B80;
	Fri, 25 Apr 2025 20:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M2amKR2/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DF0222585
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 20:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745614471; cv=none; b=LZC1+2s5NoIsZ1M572o0FzivJ0VmRUYXLgOB6DMX56GSCzQN7AGrYgQ+JxgRtuj9VNtuaegsnoYHfdbuSiOEKIQm6Ua3XoB+9A66sItrGAAsBhdUPsU8Hb7kiOh0jG7bKiTUbjDswH6iyFfiVWMK0jORmwis08JETXSttBEmSVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745614471; c=relaxed/simple;
	bh=y3QBxpLU4EegLlWms8FmmishWO2g4sGgxJbSZbHeDM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PjJynFq//MTIwv9HIOYNOXFSvL0wBmp4CmtCCVi993w12uHVb710BTkWAhw5cAELYqL4wogJdbEswIdCalG6Fy8EVxU5DcDVgVLIzHfmFC10zhdhVD2f8COXItUzkSeW92T09wIdeJEojgCHEXnDAtziw9BIqv+vbKgA23/WhgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M2amKR2/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-440685d6afcso26626915e9.0
        for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 13:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745614468; x=1746219268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+TU5UixLb/Lcz1sIttj/596FCniYJ8zob+CBmECF494=;
        b=M2amKR2/F6tGJtpCFjAacP/xaUCa+t2COOY1AgwNL/nGUd58vxX+eRU6lCLGakqssF
         9szup/CHN7Fj4vCh2V4dZeg5iiJLs3SxzDTrrxIS+GRYIAjsK3UCydRkvSEXNeIWEBeR
         4tTmw1JVm9NC45hg6vqbgbZNBAL2h3HhWmN+WgTQSy/a85hU7i0V/HPnwYJEPBjZYO9O
         qM+oWpVslVJiMugLazGgBL9x0qRgXvJVR6ewPWSGj8eWXafk+F89U3PKOznmHZWklM+3
         +zRuwDRYGS3YNeFz/o4ndd25WePCKNoUIaV7KwEie5ICrLHcy6XmyLBHXfbg6LlYLmtx
         yrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745614468; x=1746219268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+TU5UixLb/Lcz1sIttj/596FCniYJ8zob+CBmECF494=;
        b=td3MsDKj8WYlzZVVOuxCIBgoo8dCgxt2+r+Lrwr7aS3jOofE3Yo51wJzjkYlRCrPVp
         XxVrNdczoA1QzB0wzR1gzbbCU6+vB3La10p1QZDcvblFoLRYlKvNlGVgMHInh5GPrar4
         YMaak1z1AueLOS+L2MhqO5V6YLkn1pidX5d3nKs+7dZyzgKrIVCMH4AmugJKNe/0fKCt
         7tl9TgnAxk0tO/Qg+xLu0FiXwmPm93O9v1FEVUyt/STqrD/x/ysQnigG/2Pz5XjrKiH4
         y1k9svjSripnaK9rfJqJTjLCgKGpf6nQIaZzKwo6Mr9Zp417WNUftp+DGqVLsB97whfL
         ZgDw==
X-Forwarded-Encrypted: i=1; AJvYcCX9fRu1WQq/jHwBlewxGllrkG3yMrwxf6/PH94t/o9t2yfWRnFhOQpyhqp1JkiVtqFOKTyNW4ZuAsWTcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuT3SIfyEGWSm0drPgCdwsFXJJFQaCRh44Pqff2IgyvPVpnkov
	TSBWU4SxXDazH7o/fAKAzPl7ootsdqcaEhhyWCw09NYrsOWWtN+dCAnPyMvtmnk=
X-Gm-Gg: ASbGncvWBo2WyW62gxghjqFx/50FMey7x8iCThmVaCFfal/a24wyLFJ81xCenUcm4YE
	QENjJy5DzX6l5esA/5oBDgusdmxUZW8+uP1n7YMBnNFS+4Nr2u2q7VPDHdREPoFL84uFm9lSmV3
	9PQe2Rxh/xJfPi0UST8N+L+8PzU0QZTTsQ5CM5lcKWxe0qwD+zN1JcVX/ioG6oMuRvhXpe1Izth
	wxPYkhd3Qbww1H5xPFh07g2Zzq1RRNde6JNsxn6v6jqGlRrEUFSZwLxiuTPZ5A9b1kQIa39hXqr
	0/IuOit9sOsHLLEAcF+MKUyIkXQ0cXYN0qpE/xZn2fJXFprPySVG8TZ1WoIsYQSejVqtXuC2JCb
	cB+sX1UShZbAW0cuT
X-Google-Smtp-Source: AGHT+IFu4YvGwElh13buW6VpxKA/vVcb7uSB1tVZ6DbnzGwHpLhmj5iIZ9UFBDGGBhtShow69ZiPXA==
X-Received: by 2002:a05:6000:18a2:b0:39e:f51d:9cf9 with SMTP id ffacd0b85a97d-3a07ab89b29mr499207f8f.48.1745614468026;
        Fri, 25 Apr 2025 13:54:28 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d86f7sm67390805e9.32.2025.04.25.13.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 13:54:27 -0700 (PDT)
Message-ID: <a3c4c98a-45f6-4900-972d-379096e8244f@linaro.org>
Date: Fri, 25 Apr 2025 21:54:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: qcom: camss: x1e80100: Fixup x1e csiphy
 supply names
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, loic.poulain@oss.qualcomm.com,
 vladimir.zapolskiy@linaro.org, krzk@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250425-b4-media-committers-25-04-25-camss-supplies-v2-0-8c12450b2934@linaro.org>
 <20250425-b4-media-committers-25-04-25-camss-supplies-v2-2-8c12450b2934@linaro.org>
 <ukwt7mxabaq2om6is6smvwedo4nweugbauapeuzhbzj6jsbwk4@5eiksknb2bf4>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ukwt7mxabaq2om6is6smvwedo4nweugbauapeuzhbzj6jsbwk4@5eiksknb2bf4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2025 18:27, Dmitry Baryshkov wrote:
>>   static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>>   	/* CSIPHY0 */
>>   	{
>> -		.regulators = { "vdd-csiphy-0p8-supply",
>> -				"vdd-csiphy-1p2-supply" },
>> +		.regulators = { "vdd-csiphy0-0p8",
>> +				"vdd-csiphy0-1p2" },
> This is an ABI break. Please mention in the cover message why we are
> allowing it.

Not an ABI break as we have no upstream consumer of this just yet.

I'll V3 this to make clear though.

---
bod

