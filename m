Return-Path: <linux-media+bounces-12301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBFB8D5417
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 22:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5AB71C22942
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 20:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8136180A71;
	Thu, 30 May 2024 20:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y2j666o/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8FB495E5
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 20:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717102692; cv=none; b=E+JjWtcqQQyTbadyj6mQN8kvrLJzIJ21/FxXBj6YKkQFTCyfl7gAs84HrhoWHOZQ3FHDGrL6OQXGHeaxywp6WULw4axrkMyJXt/pA10jd75iZkkqwYEN4C0xibUvXRKZ1SGUrvOff/z8450ywke4n2WBY6kQYJ6ERunLbwdPDXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717102692; c=relaxed/simple;
	bh=bwy1L+Qd+YOvzVNSTOaM8tqcGH1GJS6+9jJi8fRQAyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YV9n+i7u1N3IYF06AWU0w+Ld9WSxLFpUPIWmGhuPM6h+M/TB3VlAPeTx9J4gPTtDPaoPVReCDnhpo21qA3JecfAnJBtFujrzSQNJd5ZFgv7NYiiV/+ZbX1YMCPD9ygBY4AyhUNiBm/w/ZdkggMy+qwKhHAEfYfee7u+t5wNXqDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y2j666o/; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7ea345b17bcso6932839f.3
        for <linux-media@vger.kernel.org>; Thu, 30 May 2024 13:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717102689; x=1717707489; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Vlt6zviDTM5McVSJNKcKYMOhnZDx641wvut7qJlYRo=;
        b=Y2j666o/nAB1QdTwjMzxk4Zq5WczGon/SPOTL/xf5KOgcskRJriPUz7TK0Twyc1nj1
         FnYaaVxekUMdXpvJozDNWqI6rBT7o3RPyK0w6ACuTduzlx6lGn3egxPxfdd0i1uAdpMj
         DPSF/1gWumTPKe0s+5k7LHjKUS7gXBK/zqjfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717102689; x=1717707489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Vlt6zviDTM5McVSJNKcKYMOhnZDx641wvut7qJlYRo=;
        b=ENBxYIS4c9gjtN5OZvQKLo55k0BOJHkqj6O1LSQqNsK9JXL7HeLwDHuCAWfAzGuTHj
         HcGNi80ZBEm0vlA4e2GGgsBW5VJxYIJaCxBal4a5JOhxAWDUHv+VAD4TDu49NQgGUnSB
         svdLQS5pqwq4HBEJRTB6+Car23kSX0udNhsFH61kiZkW/BIn/2knYMhuqbkM6K8PdPBj
         ySxvLpkZSaBt56hIG/R4OUwFTILIqeR10msO59Oj8kXe2dgzRceRJPR/sGtSBG9l8Hhm
         AtFgxonF7pK8Rrm2vptZR/xdJ39HWD12dDOC3Tlfqf41mIZCcRwj0tuSIPdVa9GhXNcd
         74aQ==
X-Gm-Message-State: AOJu0YxlJ32bHRuyChPO+/twv9SYaQoonV9XVtk4wfDDrKLuL+ISbMyl
	PS/aeXLTpZMUfdkdPXz4iJoA3VV4KNdxYA4VCSM7XQ8tp4/bJqzYHXJ0Rb+B6QI=
X-Google-Smtp-Source: AGHT+IGX1mPM6ZNnYqxUGcNKtXpqWVnbuwT4ehifuRv9AohVju2x0XIHfdyL/0D9FKI+qwc0CokY/w==
X-Received: by 2002:a05:6e02:1d0b:b0:374:5ab2:b1e3 with SMTP id e9e14a558f8ab-3748b9d03cemr386385ab.2.1717102689300;
        Thu, 30 May 2024 13:58:09 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3748a204d60sm1095225ab.37.2024.05.30.13.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 13:58:08 -0700 (PDT)
Message-ID: <1f18f87e-e5c3-412e-bb39-f17655796014@linuxfoundation.org>
Date: Thu, 30 May 2024 14:58:08 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/9] media: vimc: Don't iterate over single pad
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
 <20240424235741.17093-2-laurent.pinchart@ideasonboard.com>
 <bad644d0-f139-4df4-bac8-e64cc8e8324c@linuxfoundation.org>
 <20240530194515.GA28160@pendragon.ideasonboard.com>
 <339ab149-6cfc-498e-9650-e72e7e2cd039@linuxfoundation.org>
 <20240530202153.GA23937@pendragon.ideasonboard.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240530202153.GA23937@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/30/24 14:21, Laurent Pinchart wrote:
> On Thu, May 30, 2024 at 02:18:05PM -0600, Shuah Khan wrote:
>> On 5/30/24 13:45, Laurent Pinchart wrote:
>>> On Thu, May 30, 2024 at 01:27:53PM -0600, Shuah Khan wrote:
>>>> On 4/24/24 17:57, Laurent Pinchart wrote:
>>>>> The .init_state() operations of the debayer and sensor entities iterate
>>>>> over the entity's pads. In practice, the iteration covers a single pad
>>>>> only. Access the pad directly and remove the loops.
>>>>
>>>> I am not seeing much of a reason to do this. This code is good
>>>> even when num_pads change.
>>>>
>>>> Don't change the loops.
>>>
>>> Why so ? Beside the fact that the loop wastes some CPU cycles, the
>>> current code implies that there would be multiple source pads, which is
>>> confusing for the reader. I think the result of this patch is both
>>> improved efficiency and improved readability.
>>
>> It is currently flexible and if and when more pads get added,
>> there is no need to change it. I am not concerned about the
>> efficiency on this test driver. Also people use the test
>> driver as a sample.
> 
> If pad gets added, we don't know yet if the code will work as-is.

If it doesn't that would be part of the work to add more pads? Did
you test with more than one pad t say for sure that it doesn't work?

> Chances are it will need to change anyway. I don't think it's a good
> idea to prepare for a situation that we can't foresee without having
> good reasons to make assumptions> 
> I have plans to refactor the vimc driver exteensively, changing how the
> different entities behave, to bring it closer to how a real inline ISP
> is architectured. The .init_state() functions will likely be rewritten
> completely.
> 

You can change that at that time if need be.

> I agree with the sample argument, and that's one more reason why I think
> this patch does the right thing :-)

I am not sure about that.
> 
>> Please leave it the way it is.

thanks,
-- Shuah


