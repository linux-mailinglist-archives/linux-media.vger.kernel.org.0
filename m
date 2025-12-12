Return-Path: <linux-media+bounces-48664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59116CB7812
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 02:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24F6E302AE37
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 01:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2449A272803;
	Fri, 12 Dec 2025 01:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pv7E8nan"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C25E26F287
	for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 01:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765501567; cv=none; b=teCubvlFATgTvyWFrEXUbNoFGcxJr5Suic+lxaRNEWtPynKcxSqOoYbKcyyOBDq31v0zZ5oyS/XT+InoaaSbWdhvIFS1UhJl4EpNV3F4s3ybDUC6DGKsan/yK7RAZCPuZ0EqJ1uil0vGDgI3wgypJWnbhq0YSBkS5Qi/t57I+Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765501567; c=relaxed/simple;
	bh=K1VuPgyejhpo8R8GttFalwF9L+ZZzTbzYl21HGIer1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHJGwnoudkd8OFnRWe8QjbYqBLurIrkeqhmFYq/WoJO1z9/rF7wBNxzI2soaLwl49njTohE+DzHtMX5Yd5s9SxBnslgVev2lPaYV+xHsHDgkTeaIKDdDCNmIwvNuC2aHuE6DQ80l4ugRGgrCX0FH135LgdQmRkQEqXogS7eeSrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pv7E8nan; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso404470b3a.0
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 17:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765501565; x=1766106365; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IIn/LcD13PrglPwKrjbzANKOSQPEYp8vSoODGBl4RDw=;
        b=Pv7E8nan7uRJVNO6eOuSZY2fcLHuM8eyEv1r+jY+mNoTmV+Ewf/m3WWs9DJIgHEZRP
         +K8yZ+rgoh7CMSV4MTrYsgwKcPuFIo4XmE5R6iPXuZUL9/53v30Bz2eDkTn4SdDTtvot
         M2WP12QLgC+UFs/h4VNMhthuJPunyFPDqvpHiaUuMdtUcz8kIvlTcAGB6DKCY30EbKS5
         wnGa/7aGMB9HURe34bi1NOd+ShGFPjCsVnWwyboL5Oas7rMjb64rWJi7745HVVqJiCEq
         XMn1Ms5slyhDtvRoHiYno4QYA97m8gDY4i/LzIKQp/tdx2Tp8i5Rk8ga8igJZ3hir4m6
         w1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765501565; x=1766106365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIn/LcD13PrglPwKrjbzANKOSQPEYp8vSoODGBl4RDw=;
        b=wNylFkDjBQcO372X/SmrC00Dlhi3U6PJDuVeyismcrEUENA8f2w+R6KPWveq8EnNA/
         /30lmyfEVqQ2FP96fV2X3tifTr4ksUZEDz9eqNkM0lkN1jo7/DZ+zKUtOPuznmfUjhLX
         1BYaD++PligkiCWsD0s+st/WCKWSzz71l8pv49NZsbCAohYOOddnxub2nBSKvb9It4PG
         Esu1iCGnonfzZl/ejpvkkbV18YATFFlr9vqlT4e/mxSsqyLLuRjvLoypHX5P9EavtbVn
         hkjJqZvpwgF2vLHy5Sfp+kKLtWVPBV6E3Tgun2qXvGJmUiPrf89bytF6Dcatw1HHyl4d
         4fNw==
X-Forwarded-Encrypted: i=1; AJvYcCWb3nE/QXFe7yEIaGGE2JabbSD2mX/ctwkkXtyQVNzS2FFGoqrReDDC4A+6TPNt4biU7TC63dc35u/OUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/PwPg6w6Uwf9qjVju06khRJoC1666aifTEbO6Qy7snY6odypI
	OjM36t1vpNDVknsimAD5OBp4MkzOOt3JeSkNA0G6asSYPR3xqx0vZ5FH
X-Gm-Gg: AY/fxX7rmQd0cZnM64BagJecNrFfpCLO8cB6xmFcqy7cBtsuHpLOB68NBFRT/CXlNju
	TZHQXCXsYW6RIT3Iry9fC/2bQuv/Sp/prPPvotoWfd79qZ2WEGLzTnPXRpqLgFbRlPFB8UcMLSl
	4MiEj/SeAq17KzBg1I40R9NT7VM7neBqOk0lunKdiT2m3+Ug9ro56c6IPYGHKkEaDmBfVGHGdEn
	o4jQnk1lY96182kyDQJ6bTfvhWO5RfowVe4X+0NGbpeOaH+XD9LFErsM+lGGU/5fbGVYSLodcqy
	zTCM/vohA24yTxhtnB1V0FqpIMma/hyjF+DUtVM04pbzIRyspgab0WR6TN9gWfvW1ioeHF3ZlCT
	whCkGAdAlbYs7IljS/u59kZymj4g87MVcdl1bCPKnvjbAmtC2sMVnvTnZXrHsJ0oCdhqzBuNAQ9
	1FWFsLS/s+mbwsGL9xijVOgMwE1LevtPUtZ50UqwEQYVhLU7DSZuA7IIC0AOAB9cMVPApEXDm84
	EIUSW84Tuujc19JrHw8WDFrrVbJGXoY7HP490KkJ+irvQaL1t9Vbl4fW5sLVg==
X-Google-Smtp-Source: AGHT+IEhxHfa3EvqLnd161U/iUsmuB/KO5aMfBcewaILSnv9w+0OotqTV/mO8Q9y2e3SELVXDNPiCw==
X-Received: by 2002:a05:6a00:8c12:b0:7e8:3fcb:bc4a with SMTP id d2e1a72fcca58-7f669c8a4efmr414424b3a.31.1765501565293;
        Thu, 11 Dec 2025 17:06:05 -0800 (PST)
Received: from [10.200.8.97] (fs98a57d9c.tkyc007.ap.nuro.jp. [152.165.125.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c5093a56sm3565645b3a.47.2025.12.11.17.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 17:06:04 -0800 (PST)
Message-ID: <6edcb112-dabc-41ff-8e47-8b331de12f5c@gmail.com>
Date: Fri, 12 Dec 2025 01:06:09 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 02/11] iov_iter: introduce iter type for pre-registered
 dma
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <cover.1763725387.git.asml.silence@gmail.com>
 <f57269489c4d6f670ab1f9de4d0764030d8d080c.1763725387.git.asml.silence@gmail.com>
 <aTFlx1Rb-zS5vxlq@infradead.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <aTFlx1Rb-zS5vxlq@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/4/25 10:43, Christoph Hellwig wrote:
> On Sun, Nov 23, 2025 at 10:51:22PM +0000, Pavel Begunkov wrote:
>> diff --git a/include/linux/uio.h b/include/linux/uio.h
>> index 5b127043a151..1b22594ca35b 100644
>> --- a/include/linux/uio.h
>> +++ b/include/linux/uio.h
>> @@ -29,6 +29,7 @@ enum iter_type {
>>   	ITER_FOLIOQ,
>>   	ITER_XARRAY,
>>   	ITER_DISCARD,
>> +	ITER_DMA_TOKEN,
> 
> Please use DMABUF/dmabuf naming everywhere, this is about dmabufs and
> not dma in general.

I guess I can do that (in all places) since it got that much fat
around dmabuf, but for me it was always about passing dma
addresses. Dmabuf was a way to pass buffers, even though
mandatory for uapi.

-- 
Pavel Begunkov


