Return-Path: <linux-media+bounces-23925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B499F9462
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EA6A16D108
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41AC2163A0;
	Fri, 20 Dec 2024 14:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ykeAKzcJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED58204567
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705144; cv=none; b=YvZlwbov9z8o7T0ajberd4a2ukv0x6WdPEr8Ah8VkwpLTbUdnmBWd80X6hsEN9UMzb8yut81bbbDYy4hfx78M50C0BhrFB29jR8YgWzMPw32A5yVxNeM2fDWFtMe8SDH+ilqRsdrBMT0rYMr/Ua4+CSlrptJG+t357RljHcqPUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705144; c=relaxed/simple;
	bh=yOJYqKj7wVhwGQ/TvHnQCceArPJqtc7kHeUyA8r3VoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P5CK9Q3WG/RHLjQTETREqn4PTh1rDGFK1STXkh1T6MSydbivDgP7fnftarXDdK/G6Xp89u6UBQJJBlXcGcGDn+Ozze498eHFW0JfT+Ez1fYSvk+K3McujKgvA25Y98b3hckR+3rm7m5Fto7WYNhcvq2rgcPTkxMpCEzXvC2et5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ykeAKzcJ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385eed29d17so1040284f8f.0
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 06:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734705141; x=1735309941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X3qe+vwU4vdyw7T/2JI8njhIddjjZS3CWIifDEIacZk=;
        b=ykeAKzcJoZxFNJdccWeHhWmQzDrGNsSdus8fJ/fCPuo2PPk8zp6IDrrToOI9URYMRF
         yBwzb7njdVqSL/45ntPrFM85lvymSFSIXfu0X/8tCn7tou9KbMckPqopbL6E4+6185Z8
         Mysid+ZGK6sF84RPGlz8jxGE6iV3RE4jIKWl93xQGiEhPnjlPtDoxI+6GYWCz3uGy7mL
         nbt2tnrmUPRdK0NDLA/xlDy1YGwZcYJmc6EtfVg3YeGx3ZzXxRH93ywwHrXb+3b5FdNL
         gK6D8FmPjti74oR0DmU31Shcn9i8IXQIUgXoPkESkp8Os0IQahxwESByqeekdrtirO1d
         ueyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705141; x=1735309941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X3qe+vwU4vdyw7T/2JI8njhIddjjZS3CWIifDEIacZk=;
        b=kIrPbERcvBMNR2ESO8R/s/TJPaqg4IprkEICI05dfDYwqRqKW+OOBUspOmoGqp9A1K
         M1WA0LOFuvOiLoHavvtD/zx4T//rd7cgfF8gVz2Ev6TKDJWa2Yam/Teqqk+KXvpDpzRE
         YIHYW5JcbfN4SE4mnu4l8h/brA6iXUgSrPIKbOSGI9MuSAwNLVBLJ8ukJie+1haOWVs0
         r2fYwUz1R6c7J7WrjyU7Vo4vcXATh2xWVEEaBVVS5+UNSSNWlVoQ649DzpfbIro2FTLW
         QNAVhysfBeg4uirI9dp2Km+9saZbJEYZ1H5tweSmqqpDKS/xX8eFed4/ON3nWhfPCRbA
         bBuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa8XBsNrazc6JZ5qe1P0Gqy4pvz1TYJYfOyIl4lHfsqQ3VJ7Ru/nImgk01nT2/eBXbu5nPqyf6uxZXSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ43/iO5CgBZK6r0UGqSaeuO9AAqgVcsHezrfYO74UZ25jEBMV
	fIAjjavihMvilrK7sTgCE/h38lBEuz9eLbGZa3bqPPUi7xCSULkZlObmKLYVDHE=
X-Gm-Gg: ASbGncutH1rybFFFA8Zxl0NIMG4E3oc+W0//s0zTzMsjuweDwaiefHdY6B5LuTPwQtj
	g/t8rMfYET6DFe37JCmvIEckUOAZnxXw9wAv8romPFbgq1oSlClVk34gjB0utgBM1jGJ65sExIi
	bK/HCTAv3uZNfPednEibad4S824G48rjqW/aEPNLYwP1lU6YXxt9VWHfxNkKQabAOP2QAwNRzik
	ZZnxy7hOPPOm8cZK2NCmWZFiKmg/TI30U/WfhctcEW0AeSM4FNFbItccl6ObtvajqWoDQ==
X-Google-Smtp-Source: AGHT+IFKhylnzr4MFtIEVfBpmUkRkOarIDGvM1iZ3U0/SjEgid0nGzzhyebhBBtCFWigrA6UD5eOJw==
X-Received: by 2002:a05:6000:1f89:b0:386:3e48:f732 with SMTP id ffacd0b85a97d-38a221ea89amr3173828f8f.16.1734705140845;
        Fri, 20 Dec 2024 06:32:20 -0800 (PST)
Received: from [192.168.0.10] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436604e9c2csm49010665e9.43.2024.12.20.06.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:32:20 -0800 (PST)
Message-ID: <9e24790d-db1a-490b-af5a-e51a10fa43f9@linaro.org>
Date: Fri, 20 Dec 2024 14:32:18 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] media: ov08x40: Improve ov08x40_[read|write]_reg()
 error returns
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241219134940.15472-1-hdegoede@redhat.com>
 <20241219134940.15472-8-hdegoede@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241219134940.15472-8-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/12/2024 13:49, Hans de Goede wrote:
> Improve ov08x40_[read|write]_reg() error returns, if we got an errno value
> from the I2C core use that instead of always returning -EIO.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

