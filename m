Return-Path: <linux-media+bounces-23945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4579F95F5
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 17:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05795162924
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 16:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7767215F51;
	Fri, 20 Dec 2024 16:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X0tDmolx"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B084738DEC
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 16:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734710646; cv=none; b=EDV7OYgnf2XMATDh9MushX3Rc5vO2IoEOFJBK3jU3beD2g4qRwu0rgw3zfpy3ItbJwpypPQnLcV3q/SV0RMNkLLUtswg5VmXSO06pIdHaYaUgxS5rYMT5YEr8UhU/0xLL+sWrdUrORGj0IabpnNE05jBrHdrQK41UbZjZQkizAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734710646; c=relaxed/simple;
	bh=MjuzJgK2RSYVDBXspnHBgh+7qoDz59Xq4HbfLvH7Djk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hKOovEC/oWNngoUUMg8GSsPQR3g4Oq0QU2T1U1Wm0CqDjcPNdQuYCR+arIYhisPoCpoPBRkcFtgaCcF/5I2Q5JyNf2dGMmKEJa+J+hAkw9nTbbaaWVHnnzie+FT7Ew0iTaI4limhw2WuchMiFw0yKpNOUH/FCAk36aiPxCZNuSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X0tDmolx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734710643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TyVnrSOV6UuFmDjFWHG7HAoRGef28Y2jcWfG+KyGsNY=;
	b=X0tDmolx5E/YtBIiKc3Yk9qw1Sx1iI9PGYk75W0lqNK9IeJU8vGP3GacE0VQ68jGJeHxTx
	f44cMS7K7McERi/bqQ5c3AjrKnvR706DKtzs+a27X25sMTJ3NrgTWr3jGKz5cALERo8lBq
	hSboedy/X8dJVr8yHEOc5/qPZj0q27Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-EdCSO-_-OtqeqnU65nNvOQ-1; Fri, 20 Dec 2024 11:04:02 -0500
X-MC-Unique: EdCSO-_-OtqeqnU65nNvOQ-1
X-Mimecast-MFC-AGG-ID: EdCSO-_-OtqeqnU65nNvOQ
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5d3d6d924c1so2291638a12.2
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 08:04:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734710641; x=1735315441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TyVnrSOV6UuFmDjFWHG7HAoRGef28Y2jcWfG+KyGsNY=;
        b=OZ7HrSeUEkIgl2qFqoNpJkgbocODMUc2du64xyHYS23+VNrtaGCYCizmuHF5CKDGeA
         fKVR0rjMFhPT4ZHCwE8LM+f6te614sDxep++lNJ+xaL7NxotXEn0j8ykpNKQ2pC+dvjp
         JjepCEZtu8yHMYUyzb6qOryN4DPnIH+jcYARwvI+THmYUXicNclHCc3wQ5XVvRDptogq
         kbgcjnXZFIkMaSSA+EdtE1fMu9OGIf0iOizDRY75AKAwQJsim4bcLNJ3RKbcAp8UjS05
         u2uz9wucT70lYcBdmnEXKZ4N8cMjTQb0OZXBsZ8nplqkpUMDstShUNTlId1hT5zR9Dae
         FzAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHNmvqj9MPDB/jBllj7Pz4Ln7oJ6x2ROAUvsAGwA8heEv/5y0rMNycAZqfiBuTOEMeh/KD9z27UHtVlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyenvpY09NUbNWL9733yILn9/Th8fywZFaO6Lo2bM2+aMQwxICQ
	g8aTfCv4GG9FTUMe3ywQT3mWSAV4lfEAANbIo9+MG79F30lRue0yFFLSMBBkR9cd8NO2Zyin0qb
	qWugYxVvV1xd6bZItpvk7vBXJkT5+2SbcWVN6NPGhckHBsF2kLgRtVUw22J5I
X-Gm-Gg: ASbGnctQnSXQqeLQS4pKifSaBFOAnPn2Fpr/HdpOcOYD8H3AECrT+NJggbo3mKzmv+J
	E33KAzlx5deq0L9bV5O8KQpWwr4UBGeg+8eEu7fneuis5wc0Oy8iR5eeTtkIzpYtMeYiza4yo0n
	IQgl6peemtqSiJ5Y2W8bxdnOj4g4evf1yD+HIlh+2mSQ2mpWIVhfNsVr5E6lpZRlT+CirsiCope
	w3S/KY+fsFucfjW9eAGNJoqqCR2GaxU2DnqpHB/7j3+4ZQylG7hp+8wycKYpKrdobnqWXoZLRe7
	RhQc2/OFpfyUZ72wuM0X60gVdpt9w3bSnen06reDn6u+PnVT3FLeyDWbt9Kw2npqQ1Y6IxVljEL
	Bz861hZBSDXas/6usPwx6sJpdTpOwzpHdJg==
X-Received: by 2002:a05:6402:5256:b0:5d0:bdc1:75df with SMTP id 4fb4d7f45d1cf-5d81ddf7fa6mr2913037a12.24.1734710639146;
        Fri, 20 Dec 2024 08:03:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERR5cRcXzLmdyMvaTEyb1EpcvLR1gqKrmrkjJSu/RqzKux+XstWswCE2wtzHVu3cbUzYDs4A==
X-Received: by 2002:a05:6402:5256:b0:5d0:bdc1:75df with SMTP id 4fb4d7f45d1cf-5d81ddf7fa6mr2912965a12.24.1734710638468;
        Fri, 20 Dec 2024 08:03:58 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:e7a9:b143:57e6:261b? (2001-1c00-2a07-3a01-e7a9-b143-57e6-261b.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:e7a9:b143:57e6:261b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fed752sm1932973a12.54.2024.12.20.08.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 08:03:57 -0800 (PST)
Message-ID: <c8975cb9-3d57-4290-8ce9-7b13fd9c2639@redhat.com>
Date: Fri, 20 Dec 2024 17:03:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] media: ov08x40: Various improvements
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241220144130.66765-1-hdegoede@redhat.com>
 <b17e044e-b219-4245-9c03-88cfdce2f65f@linaro.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b17e044e-b219-4245-9c03-88cfdce2f65f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 20-Dec-24 4:15 PM, Bryan O'Donoghue wrote:
> On 20/12/2024 14:41, Hans de Goede wrote:
>> Hi All,
>>
>> Here is v2 of my ov08x40 series with various ov08x40 improvements
>> aimed at getting the ov08x40 driver to work on x86_64/ACPI platforms.
>>
>> Changes in v2:
>> - Fix the brownpaper bag bug swapping the suspend/resume arguments
>>    to the DEFINE_RUNTIME_DEV_PM_OPS() macro. Many thanks to Bryan for
>>    catching this
>> - Add Bryan's Tested-by to patches 1-8
>> - Add 2 logging improvement patches which I posted as follow up
>>    patches to v1, so these now can run through CI too
>>
>> Here is v1 of the series:
>> https://lore.kernel.org/linux-media/20241219134940.15472-1-hdegoede@redhat.com/
>>
>> Regards,
>>
>> Hans
> 
> How would you feel about picking up a Fixes: appended to the front of this series ?
> 
> I noticed the reset pin logic and timings were out of spec when I was testing out v1.
> 
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/commits/arm-laptop/wip/x1e80100-6.13-rc2+camss?ref_type=heads
> 
> If this commit goes first, then it can go to -stable:
> 
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/f10539a3cbe5c072829b082683f0d1393a7e50dc

I'm fine with merging this one before this series, AFAICT it should not cause any
conflicts. Note Patch 1/10 of this series also has a Fixes tag.

Note last work email from me before the Christmas break, see you all January 6th.

Regard,

Hans


