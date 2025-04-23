Return-Path: <linux-media+bounces-30838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5A4A99498
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C9AF4A1654
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 16:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F68627CB12;
	Wed, 23 Apr 2025 16:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l6NZmtv4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C3ABE4A
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 16:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745424631; cv=none; b=JhjwVAQFq4osUd4H9tXvePTy6j22oTBI4ZKjYJN7Y3S/iIDNq8yNnqYBZ5UFWlw6kLenj3o9PS49YojSaJQnhAznwYexz6Wi3uJoVW6xgTrv0TS4e4DQkg9v/4KIf7ZA7kIzCr4DBDk4ZRGBIZEE3Hib+0vJhUKGx19PXhi25v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745424631; c=relaxed/simple;
	bh=KETMSnGNR3tbXWXQzryJPlirlcO9wJFz4VEed4/1puM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHUy6KoHhKe5r0VOWIdtR1sth+yvrt9MvAgPUqSXoDAwViTYOvlNm+KMJt6XcKWQ/let0myKsIJxTSk2tx6NsedoK40pi0kcPGt+8UtaJUoDbQVKfa1aC+NsXr2mP8EtKMC5OLWjOmWgbCxulOBpF+ljigOUCASEXlMvOlS079w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l6NZmtv4; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3995ff6b066so3635950f8f.3
        for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 09:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745424628; x=1746029428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q9dNm4Mv59VA3ad8rZ62QdUhGrrNxr3iS8eu+GOGB7c=;
        b=l6NZmtv4Z96kEhnOG1OPxcMMAUzPbZjSM/YmIsJ+I8cEqWJQjaOyOH/QGnzGvrIORe
         7RocmwZrpfS2IgokCqw78noiCiYG1UEQgyXxbrvMHZIRuGBQpteREPFFlSmhLLX4WymY
         i80b78GD2F9xKSwYMr1PyY9mV3GJ7BTKfAj189ZThZMj4NhGxYc88LiE4Xnmvixnr0+x
         ooeNNx3Ss4S7oFcZ6RYm0QTpBxG3aQuST5bEQlj0sxUvF0oE6QUiZjVz8b0Yot7M9GHi
         RGQ3dl4rb6fmqUVkSg2/+w/VPM7llPrYqd7j6EQt9lcMCZrntLDgBImE87FQ9PkA+djy
         PNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745424628; x=1746029428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9dNm4Mv59VA3ad8rZ62QdUhGrrNxr3iS8eu+GOGB7c=;
        b=C4lnZ7KjlJTAqEBM4LdGHDX7ZGjPNdF46L8i8HPTz9mleCEzzkaocBikCt0XhCLOoC
         wSWle3Uh2jCo+w3NYd8wUc62UknL2aDIqggFfV+6wk4tJlXuTDA9WoQM52o3AMKM4+Vx
         g/Wxq61vN79VkehTshjmvKlCUlWqqE61UFxTj7kb1eeXb1SF40m+acsqyfi0g7JQwOr+
         sJjyJKU8f5kh+/pjviqMcULjP6tQVdXrGkn2aCHDlRYb0eivN4oTx1S9Mcqm96eEpF72
         2GHWj8eCym9yDSg4TylKWgwKfPJoRwJTspFv09Rz/ka7UALoLrhvzLXhGGdAb3ICj9EY
         6dkA==
X-Forwarded-Encrypted: i=1; AJvYcCWv6KTyWkfQaJCcENb4f2EFAlpkGz147rCp0pQoRZcYnX8vIHDy0iQ49Ydz0xcKP6BxSxQuNYPqqhOxKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiYq9AJ0gZGcmB5ITLRUaTh2Knejyxdq+jCIsaTPpdVgJNHe5a
	gawKO9n68WTyGAB0CSn4pYsw/LymeHEipxc8Ve4OLJ8wHOLhcVOQHJxDigxSkFI=
X-Gm-Gg: ASbGnctQKl5tL1uMpTrcxeq7w8KVm22EsVIzHya6Jt8WHY/9Sds/i0DQLgln1cs7lMc
	hdi7guJKCdhrwYjq2of7mG8G1YADpUQL9Zg1tPe6JT3XicD3Lpi2aSWu1kt9ikijs/620NMugXz
	vwDiHTQxDtkZQi8B8WeL+JcHdg2n+IjK//4QnhSyXeoH+ux73vIQAUzF4VP/inhXLjMHdY8/8vA
	I4gmP+oe0FyuEFnt3Es/bhxnZVrlx70tICeHtshL8AF/Tr5LWJG8Aiys1wiehY2ixBXo3YhgGPG
	AkZdbw6BnlCDgxRZETjTDme8lxXidrQtx3P3r93bPs2tQ7uUZTZFhkTrRi/11en13A4OA2luEjt
	HOryhUv4yk9D0F6P3
X-Google-Smtp-Source: AGHT+IEiNUqHKXP0FOA/VJGdZhBM+aHyxLj38PvjBnyr6i5o89vS0cwgedHvIQlvdRJOfYD1dX9Rsg==
X-Received: by 2002:a05:6000:2901:b0:39c:dfb:9e8e with SMTP id ffacd0b85a97d-39efba398b5mr15909160f8f.8.1745424627758;
        Wed, 23 Apr 2025 09:10:27 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa3a1685sm19222189f8f.0.2025.04.23.09.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 09:10:27 -0700 (PDT)
Message-ID: <dd95bb52-291f-4551-93f7-a1f272baee7c@linaro.org>
Date: Wed, 23 Apr 2025 17:10:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 konradybcio@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
 <20250423072044.234024-7-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250423072044.234024-7-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/04/2025 08:20, Loic Poulain wrote:
> Add node for the QCM2290 camera subsystem.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

