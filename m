Return-Path: <linux-media+bounces-20522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E40679B48D3
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 13:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 211261C2286F
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 12:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E77205AB1;
	Tue, 29 Oct 2024 12:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FraUuCOj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD212010E0
	for <linux-media@vger.kernel.org>; Tue, 29 Oct 2024 12:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730203239; cv=none; b=U96xfI21TWR3pfzmbVacx08zF/6N/lRAEOKljdKL9bD+M/vzplWK3ajKqC3W+F8IxDrI716SBffYXDQFdul1bUPQd14ZDWBXE8eQYnrUM5GDBeE8Ugz0ghLc0ybC+ELhIXHgBFjoCzWTvxw3HzXYggfAegVQ/GDlHHogh+kT3/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730203239; c=relaxed/simple;
	bh=pv+9pjVCO4yhV1giOhiQZxDFW1VigX/FY4OQGgw4PX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jz7TS0J/1fXVisER/a/Jtz8KU4ebSgcVgKHUNhTHjieBUcyNf/B8jSyvCdcwUJrpBjIV0Zyt12cn/JMl0PVhAlh+YW2qdpVqTPmO1kb8QsIEPTUg9ugDhsadXq2fVZ9i/yed7bX4HAKI4qfGHSOsDxiUzmU1oDYTvT9e328nYwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FraUuCOj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4314b316495so49278975e9.2
        for <linux-media@vger.kernel.org>; Tue, 29 Oct 2024 05:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730203235; x=1730808035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kuboLlR7Ln4DJnWdMqj7oZQediUBcjGUfxubi0VCihY=;
        b=FraUuCOjKaJF2cyu9GK+eB/+IW74jvjRc/0hHxhjjaRoh5B3cPifTDasAmL1cwjsVi
         pxDFnQkQ/jU1jO3rkxYj36sM2n9Y9msrC0zE/Dxl9foC9obrgW4LS6sItjDlbpePZPnZ
         Y+knwNkU2J6n8JhYErZlbWO+RUdzdbXZBxt0IyAr7C9IHOVa8aNhwqibCUbuclTFBtdd
         XbcAxciL116awJbZbylA9mbx9uNgr+9M90m2bc14EYLWLDNDJz2QDoiEnzmhgEChV95q
         0cdRnuC8PygUt0wR5t0vVO8vRC0zrQc9lx3MMz2oVP3/ZeuwfSgeEWrX64hndHONIe1I
         ZthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730203235; x=1730808035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kuboLlR7Ln4DJnWdMqj7oZQediUBcjGUfxubi0VCihY=;
        b=jX6Zq3elv/M+MjFyQs682BELlY7rmIU/+tHU7E4ax+d90N0rQv47JjcUtHCnrnKOSc
         78wLOJz+0/ACJEmNm54KxIiGCPNwnghWjFKQ/rinzvgFz5CAWl8ttstJJTDRnnmQTo2F
         Tgk9lJ8EVo39Pr3sEl5Dw/l5U9UdMHyclIEfmIHnQwWyK+sT57Zzl2QIntP06QYoiLcd
         2I5J/nyJo86rtnvOPJPYoHxgWhyB2JQXUy1Uz5WkKUJwZeduNvUpbG0PyIs0CgOZLySn
         p0yGvF0N1UbPDVUFx4j8nDZCHss2GnMkY4e0O8sYJRujdoYbtDdsr2m0rKF1mGl8tN+c
         H1Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWNA/1uqCqug+jdnr5PLS1Jfy3n9PX9po+fzenwpZeHokF79pi3NjGuZM/ZuVeuVnDsZkxqKFotv5CNvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVsFYMx6jwMLNpEWRdyLZ0O18S3I4+JRaTr3axuRRfZdUT8atB
	KagF70k4A0WzWJH0WC7KivtLFjo1W+USVid0S3yQJQUEVWoVGAG6XMkpCmvddlo=
X-Google-Smtp-Source: AGHT+IG3uy6GEqVkZdtcpNz412sDdy/Ri7d0Q2JMRYAoIL/cB40gRqu7rJes6ZEOY0Wweyi8Lt6ASA==
X-Received: by 2002:a05:600c:35cd:b0:431:5863:4240 with SMTP id 5b1f17b1804b1-4319ad0f10cmr99294165e9.24.1730203235401;
        Tue, 29 Oct 2024 05:00:35 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b579968sm173118485e9.39.2024.10.29.05.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 05:00:34 -0700 (PDT)
Message-ID: <b5ada63e-31f5-4aec-8499-7e34f1943659@linaro.org>
Date: Tue, 29 Oct 2024 12:00:33 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: media: i2c: Add bindings for OX05B1S
 sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
 laurentiu.palcu@nxp.com, robert.chiras@nxp.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, LnxRevLi@nxp.com,
 kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
 dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
 alain.volmat@foss.st.com, julien.vuillaumier@nxp.com, alice.yuan@nxp.com
References: <20241028190628.257249-1-mirela.rabulea@nxp.com>
 <20241028190628.257249-2-mirela.rabulea@nxp.com>
 <c32439a5-4230-4ca5-8d46-fb00d25072e5@linaro.org>
 <20241029115747.GL22600@pendragon.ideasonboard.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241029115747.GL22600@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/2024 11:57, Laurent Pinchart wrote:
> Aren't they needed given that the binding ends with
> 
> additionalProperties: false

Yes.

Might be nice to have

unevaluatedProperties: false and just rely on the top level

$ref: /schemas/media/video-interface-devices.yaml#

Seems redundant to me to keep specifying these properties over and over 
again.

---
bod

