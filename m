Return-Path: <linux-media+bounces-9041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C54689F953
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 16:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2EF1B2F171
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 13:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1AC9172BB6;
	Wed, 10 Apr 2024 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sijbo0wB"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4E8172788
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 13:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712756481; cv=none; b=cyZKsoGuQqfYnk6vXX+Bos17Wr1vQf7OHx5kJmDLWhQA85vJk90WoIEEMdd/0Bu4rqHPOED6dmN5AN8HCSi6emsJdxtWX6nr71Fp0fnwaZvY3Y9FU89LfiQ+kVAtEBgUW2f6suOKUd13kzzSfk/CULKTCsn5cPkzRLZ0xD2nHVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712756481; c=relaxed/simple;
	bh=k0CH/a1jNKnCDIQuOguNEBZ9OLWpbwWqoxiSC22YPsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZxEw0E/DMvSTQMZFoq31qnBE3PsIa0Ndtr5+yBPs1IucTyTc4Fo8MqZRes4PgG9jDQ1sDjGvALJNmpmewGkTdmymX2z0a1P67aqafk0hd1lKTvAF+8XRP6f8+VUCYR+IwfPNDe7rW7Kbf5WL5HSDdGxc29P4gbwtP4NZkYIv/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sijbo0wB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712756479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ab619jrMzt5I3ibFPcgw5mCCVGGcuTpmLYw+UMQ/Irk=;
	b=Sijbo0wBznl7AgRPgBRNMkwjDvyo1zcy96GDNrjcpmG0fWbqGIhZZKk2MV47WynwusEE4+
	NBjiOQGwEJoN/DABUWOO0pr797pDJz3nd0CyFDCZ1gE/E6vwbmg+hxdCINKnyDjbS4q33k
	r92uWl00A4/nmsdYUKKxcHKIwwNBeI0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-eBVXHVxmN3WcqFsasQRvyg-1; Wed, 10 Apr 2024 09:41:17 -0400
X-MC-Unique: eBVXHVxmN3WcqFsasQRvyg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a5217f85620so4097866b.2
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 06:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712756476; x=1713361276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ab619jrMzt5I3ibFPcgw5mCCVGGcuTpmLYw+UMQ/Irk=;
        b=ALaPsa9BaMP3w/y+9Bso1mBMdzXQwWr97DLRzCs+kAU5MrQ4COKVXHppdXw5Vmrs/X
         8mcXBDU5tH54YoRlCTPhR1ygj6xkCmnhieF1yH1l60somlQxA09dj0901otwGRa+jAAR
         vi1waLBjYPq3ur7YoecL+gWI5s2Ofcs5kF8lN/1+MPxLFtXW4efnBnuhsnioKwz/cyJF
         5/KNSKrqXtTxl3oEfWEtehmMmhKmjssJn5qmUdKLYKOG7UXJaQYz5iUpHci2sdbJPKId
         beadvq7U1eTEv4jRu1p576KLewEvP78s5eIQlbfk3WwswT+n+zOhVc/hrAxK6t2JqM6+
         P7+A==
X-Gm-Message-State: AOJu0YyTwg8nGMeeJjVL1xBPUD0PXpG8MchQPio1XqZYS5d7TMEupyF+
	poXaWcZ0oIJGpSZHWUeyJhz74iI/hQQKUW6v4NK4D52v7FWelpPCFR+DV5ADiQKngR7vjvaYLlO
	XhJF2CSaUOj/slv8LYyYYiy2sk/hY/bZpaWPTsHfYuOe9a7SB4BIF9gHia5onP4B5YWSb
X-Received: by 2002:a17:906:af1b:b0:a51:9304:19fa with SMTP id lx27-20020a170906af1b00b00a51930419famr1415216ejb.70.1712756476590;
        Wed, 10 Apr 2024 06:41:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdjpMtdgVHK4SQs/9xte3kBf7W5yLaCB8xMVEkp4VrQrxxyFyhsuMGpRk8TEtW9ItXtZpaGQ==
X-Received: by 2002:a17:906:af1b:b0:a51:9304:19fa with SMTP id lx27-20020a170906af1b00b00a51930419famr1415206ejb.70.1712756476292;
        Wed, 10 Apr 2024 06:41:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h1-20020a170906718100b00a51bd3bfec3sm5553700ejk.121.2024.04.10.06.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 06:41:15 -0700 (PDT)
Message-ID: <911d84a7-cb3b-4ca5-86a1-334e7b3f85c6@redhat.com>
Date: Wed, 10 Apr 2024 15:41:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] media: atomisp: Replace open-coded
 i2c_find_device_by_fwnode()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240326202813.1425431-1-andriy.shevchenko@linux.intel.com>
 <20240326202813.1425431-3-andriy.shevchenko@linux.intel.com>
 <c9741df0-6c12-4ff5-90b4-5a13f0bd9b51@redhat.com>
 <ZhaVnYtFoTaFOKD-@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZhaVnYtFoTaFOKD-@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 4/10/24 3:35 PM, Andy Shevchenko wrote:
> On Wed, Apr 10, 2024 at 12:35:29PM +0200, Hans de Goede wrote:
>> On 3/26/24 9:27 PM, Andy Shevchenko wrote:
> 
> ...
> 
>> I'm going to merge this variant into my media-atomisp branch
>> instead of the orignal.
> 
> Thanks!
> 
> This explains why changelog made the commit message.
> Was it done deliberately?

Oops, no that was by accident. I normally git send-email
+ git am my patches and then git am cuts it off...

I just send out a pull-request with this minor wart in it
(after testing), so unless there are other reasons to respin
I guess we'll have to live with it.

Regards,

Hans



