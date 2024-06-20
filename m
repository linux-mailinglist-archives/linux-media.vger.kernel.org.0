Return-Path: <linux-media+bounces-13840-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D469109ED
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 17:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20BD91F2263B
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 15:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75DF1AF6B4;
	Thu, 20 Jun 2024 15:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AwJzm7co"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574A61AED4D
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 15:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718897610; cv=none; b=TDF4ATU24hCnUEYiFavV9ZKcqpGY1MNF134OZYXquvWPcvcmRYgyTEDvOStRY3Sl+40awrW9Ad9VmPTXUDPydXJCOuh7AbpaVPIcAr7AX8WJjKCsPLDCBpDSRsqql+cV77mm2tyqo5tZ+Taq5XNrH/jbb+O/YirNZdueRVRxVzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718897610; c=relaxed/simple;
	bh=EgdJAaS+6IkxJJ48ol2HhJ9B83wGfX1W2P7FKU5cj/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y1C3tg+PkdHbPZJ/GwduypR5kHm43O2rFIn1CLQDu/9LuFGF8kXhNR1lsOOmBDM5jvRBiroSTmN7Jjd4zFW2+SvfPTbkG34FkjsKc2QOZliwHmYgPiqvYlqxfkguRffzfrewZMof8K0swKfX+Uh+wLU/PsXobD0FcKO8pMWQrGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AwJzm7co; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7eedf4ae265so1982339f.3
        for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 08:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718897607; x=1719502407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=75Wdz4VEij8e//J5bxzj7EQcdEi/gipqJQcODPJAMVI=;
        b=AwJzm7coEF2A6hdAfMTGbdrzqnv/IUy/vU19DigeuWZbvsDuZQ0Hqk6qeV9u7+Rdwi
         L8k5vmrynThVr7qzF+ApzCALw5YukWtyGx8L2UDDx2JAAS6oLXJ7gNpjELDLIWKbzdgF
         nVNxokGovofpN27hR47Sw9dQdpUgojx1mbhmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718897607; x=1719502407;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=75Wdz4VEij8e//J5bxzj7EQcdEi/gipqJQcODPJAMVI=;
        b=k+KbIiULenPAmgGcYBzKeUGFCkg/pDCmWhWvd792rmM3u21FXz++jFHHl6agygDNnk
         sjqQIEwOB5ZmfYqGhCQ0vpvHHVE5oc+XbADo/Wx/B5KsSTSrn1kCXm/iter4A18fEaO0
         Zdg4GwUlwpKjgWTczneRTsliTiz/qef+KOEV8MjYAERU3HFGibV1OimoAPz+DOVvn0P4
         q7umd6NgJ0PicOpZDw2KJBGx3QLjNXC+GvGVOBA1Tt1/bwLE5jdzEbh32HMbm4B/U9HH
         X8HQ1y+tMol4+Wb0k+R2ty4jiDKfgK7e0EBcd5VSYMenGUVdE8pxx67IaaRGlpV2UDtk
         sIbA==
X-Forwarded-Encrypted: i=1; AJvYcCVBRkKQc5BhpKHYc4KCXUSHJVVgi2vC85QKNrFRCYXSxQXom4HTUBpDyRMKOYbBT8qdgzj3nvWEZ0vAahTITGdRwJ0YinZZ9lU+fnc=
X-Gm-Message-State: AOJu0YxClJyYz7uJcC7uSZmyAdPqn3zDUZyV203DQUORIBgHfmEHTPii
	tLwHsp2rudjFc8Ui87qeZ+S6zhnWH7CJrAIjKjTHQ1r6LMaoTWoOkrPYV8MWrKU=
X-Google-Smtp-Source: AGHT+IFB2zpFtssQTe2qVoaE+XSci8YK+ORSGPBu2FIQUf5C/9kefA5WmlKn81gjUg0RnYYzWLWhMg==
X-Received: by 2002:a05:6602:54:b0:7eb:66a5:d1c with SMTP id ca18e2360f4ac-7f13ebd412bmr566748339f.0.1718897607397;
        Thu, 20 Jun 2024 08:33:27 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-7ebdbaf075fsm378441939f.54.2024.06.20.08.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 08:33:26 -0700 (PDT)
Message-ID: <00e4268e-80aa-4c70-902e-897030693642@linuxfoundation.org>
Date: Thu, 20 Jun 2024 09:33:26 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/9] media: vimc: Don't iterate over single pad
To: Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
 <20240424235741.17093-2-laurent.pinchart@ideasonboard.com>
 <bad644d0-f139-4df4-bac8-e64cc8e8324c@linuxfoundation.org>
 <20240530194515.GA28160@pendragon.ideasonboard.com>
 <339ab149-6cfc-498e-9650-e72e7e2cd039@linuxfoundation.org>
 <20240530202153.GA23937@pendragon.ideasonboard.com>
 <8b6661d4-b5e6-4fc6-a064-748ec9e073ff@xs4all.nl>
 <ZnQn_z6OzCUBa0zS@valkosipuli.retiisi.eu>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ZnQn_z6OzCUBa0zS@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/20/24 07:00, Sakari Ailus wrote:
> On Thu, Jun 20, 2024 at 12:47:15PM +0200, Hans Verkuil wrote:
>> I agree with Laurent on this. Sensor and debayer subdev devices have
>> hardwired pads determined by the hardware, it is not something that is
>> flexible. Since this is also serves as an example of such a driver, it
>> makes sense to hardcode it, as that is how it is done in practice.
> 
> Me, too. If you know you have one of something, there's indeed no need for
> a loop.
> 

If you all agree, I am fine with it.

thanks,
-- Shuah

