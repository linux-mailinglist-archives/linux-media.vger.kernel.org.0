Return-Path: <linux-media+bounces-23926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D170D9F9468
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3414716E0C1
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713122163A7;
	Fri, 20 Dec 2024 14:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZXai6ZVk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F40204567
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705171; cv=none; b=LUX+LJTBkEo6PMopi6vvPnQ0OqYLm1O3V2hRUg8BkdSZ3oFWCwxhp0lKinrcNmY5xX4jFe983IXPAjxnScuXNidcFN9VglVUCUvCdB8bMOMY0kqyPe5U86g6NnSabBtxM/vxBShKbEwZjVoqRG8NuuqWQzBuVN0BB6UNjZzNwXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705171; c=relaxed/simple;
	bh=BCWzkh64qm6PwZQpKR+X1QuFovyi1NeCTBGEYDgyLQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sp8e782t/svXKYs65VZZs4thDlGB6veYsA933KxQ3L9QYzwIc23mC2HM4jkkLTe9YDm1MnpeAHH3pS43H2VXyRBcw+RgTJBVo1tKcWDvHLSBNxCk3dZjqaMh1invyxuTa+vU1WT6uVX/7FyOs4VUy+SgvnqWkz31s8YPgy51gH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZXai6ZVk; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa6a618981eso340883266b.3
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 06:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734705168; x=1735309968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lJ47DoFoeNIxI8M/r72j1IlEnPtc4WOfcVV7P71JdWY=;
        b=ZXai6ZVkmjVrtwTyycrFQwp/295IpX+wfuaqi1AnB5dioDG6f/+QUbt+PSgJq9P5pE
         P7Mw4GOq2vqvDVT5c8DkpeTw76+az2I7Vdpsv5C6H+TmbrjMYqroe483ypkuPrp23FJ4
         KlURwyEQPvFJmp8g/iFYdROt4yZw+b36PFJF5hARf7rwOiiQ4cDvb52fQrUHMd8cZsOF
         JyGUnDVkpOZgy84UhvgzPidldibAMd7dhYXNx8dS7e9Pjmsz4Mz16iyP7oRColWlIF8+
         kj0giY3ryf+0bElQQhWCY0z+45bhh1ZYDU7EFlZj16r0zTAeSEGKmDaX4PJA5I/Cay0y
         tnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705168; x=1735309968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJ47DoFoeNIxI8M/r72j1IlEnPtc4WOfcVV7P71JdWY=;
        b=gWQmq/IOMIAlDtdVZcEcsSkdP95znGxnCsuz+6upOfReNsK0JnizVt2E1iUXsq1k12
         SAOvl8HL9S9+DS0fZnhXnnVgHD4hpPhbn8vLCQF5jGjh3C3JVUmHK89Zh0/Gw2gFgNMD
         mCgw1JcWpaBDURJdAyHkXs0L5c8nt0UP1kBsqjqbXbF17rS21oElQ4we8ybeR8AAFgNk
         O+DyQKXweNe5taqGkmd8NBPuTf151l40BjchTO5AcBj2LYJJxQPc5znOkomBUQ4pPtfv
         Ul1MkrJvCg2TB+FXE6+rQaK+6fevYrJPHfNgo0XL3yWwHr+TH9L2CMDLojUJcdQXpazg
         by2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuby4aQf4rRkTwQjeAukmrR7jJqk9tUBfg73vasND07cBhiC3vULg6d/4ru7UeHlVG4glmnMbcMt5QHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3epCBBhBzIJ+uyV7XEOaom0uRDJ5uP+NIDDEl+Yyxyg+YuLLY
	EKvFrmRWfkX2+mHKFZAiV+LMiRp7ZisoIjgL1/G1qqhi4CAwByBhj2+zATVN2rI=
X-Gm-Gg: ASbGnctPMP/xpw+F/wnuwWdiICor+SXgHqAOQcytbe9uWOgISo0UAEH5D7SOd//UQyK
	DFoCUpVpwOGhfLe5dDtG8daka0woOPZDFUj6Y2VeQGyUYVoCLVStr4+Y3xtju1Pm+FLSXNeiThv
	cdGPrdqB6FTGa6BAhGvd5U3HxqbV5GM4n/f/AJEWq/ZvA55oo4yr40kwKZolmvpMgIDVnLKa/7g
	4Bn4tzvvOpLAw8HxB5YBHxX2yimWGXn4w0+wFnivSH0YdUB8QUIAmRun+f6Fi/SW5p7+Q==
X-Google-Smtp-Source: AGHT+IGL9FJTCcI3qBsEqzD+2L1l7M/dV3ECGkWhmC4KLoPikk5DHshauXtAzXqoEmxC85LAtsSZZQ==
X-Received: by 2002:a17:907:6d17:b0:aa6:8211:ff85 with SMTP id a640c23a62f3a-aac2d479750mr270379566b.35.1734705168613;
        Fri, 20 Dec 2024 06:32:48 -0800 (PST)
Received: from [192.168.0.10] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895366sm181323266b.73.2024.12.20.06.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:32:47 -0800 (PST)
Message-ID: <f4dc7398-a0f0-4269-8e48-ada521393d30@linaro.org>
Date: Fri, 20 Dec 2024 14:32:46 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] media: ov08x40: Add missing ov08x40_identify_module()
 call on stream-start
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241219134940.15472-1-hdegoede@redhat.com>
 <20241219134940.15472-9-hdegoede@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241219134940.15472-9-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/12/2024 13:49, Hans de Goede wrote:
> The driver might skip the ov08x40_identify_module() on probe() based on
> the acpi_dev_state_d0() check done in probe().
> 
> If the ov08x40_identify_module() call is skipped on probe() it should
> be done on the first stream start. Add the missing call.
> 
> Note ov08x40_identify_module() will only do something on its first call,
> subsequent calls are no-ops.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

