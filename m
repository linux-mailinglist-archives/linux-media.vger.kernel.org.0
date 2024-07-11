Return-Path: <linux-media+bounces-14916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B6B92E6BF
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 13:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D42A21C21C8F
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2024 11:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C2315ECFD;
	Thu, 11 Jul 2024 11:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cayVgiR+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7AA37169
	for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 11:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720697327; cv=none; b=UhJJnz3n5SyvoRjSXJfMybrdk1FF56II2gaG3CDhIqH603ZDkf7SZm4rpjMKgyvumVdlM9pIkqYKmGFkCHiH3Sh5TrJHZ1XHJF0Ry2y6P/CvcnVHun1qHwlATkHIxMail0zNLK8x3aevIPaAFI5uFxLL1v6+rcdWNoBLe68FZmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720697327; c=relaxed/simple;
	bh=H/yJcyeWYsJtAO5ufkkNAxb+N3K7x1J4FY0ND2ZzQyY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=K+be9jFj5GiepyVvr51XMdA3O+N4VfKttXqikMrP/NKzzLFaYp/WSlgHtOF9er1mJ6IJDpl/X1heogWqnNLjlQURcarY+aWckC0NvAeHoWuuqt2ZqcZw4T8yy8PHLzppbF3prSWViZjmrdWkppLk8hYgYHoEJARJDaLaOegbUpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cayVgiR+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4279c924ca6so433225e9.0
        for <linux-media@vger.kernel.org>; Thu, 11 Jul 2024 04:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720697324; x=1721302124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H/yJcyeWYsJtAO5ufkkNAxb+N3K7x1J4FY0ND2ZzQyY=;
        b=cayVgiR+Y3sMJPRv2S9iRfsvB4KrwijFdKaaE2wJpWNzYHaTDRvYYcttAzMDLeXYeR
         tgMvsSoEgn5CgHRKZLIOH43gxCmiry8aF8ZiQ51U1J+Y00FGaeVH3QOIamxxBXMxBy4R
         R4sxORZ2YP37MLFA+//HqejmIDDJClqKxQYdeKEFWRarrAojhfGS2VAIPZpLBW/N7Azy
         fabv0qhT49FBfOkSRNPVogT6Kp05U/AlGWQbNjrSqEzwK55g1KCAIhJPeTnJs64XDoKs
         SutKnN53JEsE2ny63SpxOSRqXsfDkDFfOWhOmtHmnIih9fMCySwjx6IOe7AamqmomWAY
         T0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720697324; x=1721302124;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H/yJcyeWYsJtAO5ufkkNAxb+N3K7x1J4FY0ND2ZzQyY=;
        b=mMXRt/95yMpv8xyLQLI0A6YVf0DV7zHGiKX1JLrpJfnW5KyaHMwQC8NfXRv720Kz86
         +UP08+6JfWArBnzWvpziV7sJmmJifrJD7bEDIdM0atokZT/Kf8V/fFJc5unTrpNvZJQx
         Vo7BVVxosS6ToVRj/9zDTu4sjdPvrAvVS/NSjItBoeCgpoTGMBf7yQXC48/VSeEHXlMq
         8BBNBNBI2nVmC9GRzl8VM3bioUvCBnieMHdTArMx5HAH2/mEWL8rX5/eLrCcwKiMSQeH
         mI3GANFjJQIMyPTFNh4axTGJNzfWFGXDRRlKJNRo5xrK2o7Rv+449XET5ymRPzWYyty5
         CUBg==
X-Forwarded-Encrypted: i=1; AJvYcCWbLD3JrA7lPadrcb8dpmKxXirYxI63bwvOuhCY36pT7/53kyRbVjztg4m6bAP6wMrFVL1mayn0/e1XqCwAJgo3LQELiI0LEtJipxE=
X-Gm-Message-State: AOJu0YwuudSr7mlkYJm79QTjM2oc5laMZos8prknZwQvuLJEkvpcNBFm
	vLRq+1AQ60zs1QvNGS0QwNvakRoi5Z2lNfIeyZ5WlXKDEAEoYIbrnrMBJFs6YZs=
X-Google-Smtp-Source: AGHT+IGpNfWzw/AXdT51ntv1SBFRB91uXKQA+H9vA8vS8UT0DNtrzwTYgZNb8Fa/r+QFA/8HLqi20Q==
X-Received: by 2002:a05:600c:4a99:b0:426:5de3:2ae5 with SMTP id 5b1f17b1804b1-426707d8ae6mr66975345e9.10.1720697324085;
        Thu, 11 Jul 2024 04:28:44 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f736939sm115679945e9.37.2024.07.11.04.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 04:28:43 -0700 (PDT)
Message-ID: <22dc8e14-334e-4a77-bc90-a63223a46857@linaro.org>
Date: Thu, 11 Jul 2024 12:28:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: ov5675: Elongate reset to first transaction
 minimum gap
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Cc: Johan Hovold <johan@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240711-linux-next-ov5675-v1-0-69e9b6c62c16@linaro.org>
 <20240711-linux-next-ov5675-v1-2-69e9b6c62c16@linaro.org>
 <fcd0db64-6104-47a6-a482-6aa3eec702bc@cherry.de>
 <aa20591f-3939-4776-9025-b8d7159f4c63@linaro.org>
Content-Language: en-US
In-Reply-To: <aa20591f-3939-4776-9025-b8d7159f4c63@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2024 12:22, Bryan O'Donoghue wrote:
> if you feel very strongly that 426 milliseconds * 2 is wrong

MICROSECONDS !

Bah

---
bod

