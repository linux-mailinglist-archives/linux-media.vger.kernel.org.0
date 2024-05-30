Return-Path: <linux-media+bounces-12299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3F68D53A9
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 22:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE7A52838E4
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 20:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F334C495E5;
	Thu, 30 May 2024 20:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aDpYf2QE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F60574079
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 20:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717100289; cv=none; b=laJmd20ZrsaNol0f+s7+uN7ElLwwggHbWKTpOEVkk0tM79Ot+5m88VZq9xgfc4elq3aTpAHlRw73r1ulHxReKn1RpIPsH+85JLVyrsZ5SdQIRWcYMMjphA9YpmfmQmp1IB7YGpofX3kV5EAFZ7BtP7ieXqfF1FhTvIw5IOBv8Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717100289; c=relaxed/simple;
	bh=3TWwwx6Pb6LVNKpJ8xaR0Sf+1nLXbjCavYf6Brmj8WA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eo81Q4fvW1g4v1DiFh49uw5lGAizTMMOFEPYVQur1V0SLZNgheWES6aD9WV6apKUiRKNqFIGKqApfyc43xo9n6Me9qTP/NJPd5ocsVtUu+YWrJxZ8cu8aYeS/YB5rhdHfb5VCFM/VJ6DNxgip5juGPrv/kKNJvLozyPsQcvchOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aDpYf2QE; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-37485c1d3a3so109855ab.3
        for <linux-media@vger.kernel.org>; Thu, 30 May 2024 13:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717100286; x=1717705086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nV8rOPjzMI6Wzs4SgPXDr6BdGAui0yEbSL46xvYHvjA=;
        b=aDpYf2QEw5dlv1uQkjRMdY+OcncruFTytelnd023yNDPGdiisuJK5jI4/jzvstV7JN
         JhLR7iisO5QfGrbengLeKKtkfwUIeXCAAbGBtS+c483755IdJqZID2u5ONYroN771xLM
         aWO2OBF6vFvZLrzKX0tM1K246gzGuku+8lAUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717100286; x=1717705086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nV8rOPjzMI6Wzs4SgPXDr6BdGAui0yEbSL46xvYHvjA=;
        b=qoLSXpgSgsUw5c9+8c0k85bZllcEscqfGn2HdVTp+2iZygSf+1z1gpZ0IcGrMtRP8W
         gTOKePZuy2VESSg+he7UGJ5t6xW+kjms3p6uT3hsmiSr0kC6pRVXgPbcAZl60DCL23Wu
         oD4yP5Wnt2jFHtLs/jrkKcCO8UH7WZ32dyxLQAt7tanDnmPlva4nPWiqywSReTE/TyAX
         tMDwf++OlTyCW76/qXyORJMdDuacS4VqfhGnoGsAGa5ckvHt9VRA33Clkt5q7uRZ3qnv
         kskp4vGmkvDfbk5YQTZIn9NZyJLXo8Ff95pcIpqOTVYwGFgL9yDHOLFHWE/6di2lVu27
         NKeQ==
X-Gm-Message-State: AOJu0YymEX/DQFwo6k1rzH3ScQeybJ0dpk1Ht81OiJ7eHRvlzLkgnft1
	hsmPyehgG0zwM7zUEZLH416c0sMKAN5Db9wTXCXsqBQvnOuAPREcFM9wD5qgfZc=
X-Google-Smtp-Source: AGHT+IGOmFcMTC6znxiJ6qmQsuCqHLpSl42kHuBHyIm1HAM7VS2baNPWeY7FrlSSnHXKXH9onntUew==
X-Received: by 2002:a05:6e02:180a:b0:36c:5440:7454 with SMTP id e9e14a558f8ab-3747df5104cmr36543645ab.1.1717100286306;
        Thu, 30 May 2024 13:18:06 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3748a26c3easm903575ab.60.2024.05.30.13.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 13:18:05 -0700 (PDT)
Message-ID: <339ab149-6cfc-498e-9650-e72e7e2cd039@linuxfoundation.org>
Date: Thu, 30 May 2024 14:18:05 -0600
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240530194515.GA28160@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/30/24 13:45, Laurent Pinchart wrote:
> Hi Shuah,
> 
> On Thu, May 30, 2024 at 01:27:53PM -0600, Shuah Khan wrote:
>> On 4/24/24 17:57, Laurent Pinchart wrote:
>>> The .init_state() operations of the debayer and sensor entities iterate
>>> over the entity's pads. In practice, the iteration covers a single pad
>>> only. Access the pad directly and remove the loops.
>>
>> I am not seeing much of a reason to do this. This code is good
>> even when num_pads change.
>>
>> Don't change the loops.
> 
> Why so ? Beside the fact that the loop wastes some CPU cycles, the
> current code implies that there would be multiple source pads, which is
> confusing for the reader. I think the result of this patch is both
> improved efficiency and improved readability.

It is currently flexible and if and when more pads get added,
there is no need to change it. I am not concerned about the
efficiency on this test driver. Also people use the test
driver as a sample.

Please leave it the way it is.

thanks,
-- Shuah

