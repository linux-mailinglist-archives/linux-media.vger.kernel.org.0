Return-Path: <linux-media+bounces-12099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDDE8D20C0
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 17:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8E631F2355C
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 15:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C385171657;
	Tue, 28 May 2024 15:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UZQ8dRjg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A5516DED4
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 15:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716911350; cv=none; b=EN+PzQUdXKm+XlaxqYIvnaWhWpPHXazjTE100XRtrZAIiXlM6k+rQ4DkGhGhMA8yo28QZ/ylGLZGOMTOO//6PzkOOT1oXSgr/XNyprtouUWhAQRLxwTKEv4Qg+jiVvQbxWjQX9NnwQFxLRwcCi5uWkR94NYsL1xbGUxmKs+Kyic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716911350; c=relaxed/simple;
	bh=PA6ldRRGZPR55Vspgpvc2gbgSYz0hwE9+QO/CCHWNs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NHxC7hO/3u7WTZi6AvO0LZ3sBSvahgHb8q3/P+5TEZAS6wBtDgJaH7W78gAX2SCcV5lnZ+l0yxt3t4ctQ6cRrnTmrS+tPliC+4EFX74rMJ/5kVvOZ0rMtlaZGo9+hxx8FWSEqlowKPLv/aRfWu3dowLcy+b8YAyV9QWo/yPQmQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UZQ8dRjg; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7ea34e637a6so4535539f.2
        for <linux-media@vger.kernel.org>; Tue, 28 May 2024 08:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716911348; x=1717516148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cE3Oipmag/ieav6BFoSRNBz1laxZ2exyEi2fIqACAww=;
        b=UZQ8dRjgET6XB3SqY5EXFfJdXmoULwZgqI0WGQJXY6H5uxipfySIw+T41xCBguk5kJ
         tXW/gEpLsZLbzO/JNIKLllfTNB6AZA09oUK2DdaC82jejaM51+JqKp8N/8CIGMrBe3/0
         Cxcs4haAo+QEkQNNzQJUWdxnmXb2RXTQl/wIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716911348; x=1717516148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cE3Oipmag/ieav6BFoSRNBz1laxZ2exyEi2fIqACAww=;
        b=YKy9maMHO63DcuTUsYCkF1F5LO6TvBXXF4NO/+j/tn7mBbjISMGoSHteOFgzSjc3tV
         oLPuvae22XZU0rPdZhMNrSvLX/2r+tXzbV5FhZJ+ushlcQhwLzq/DQ/4T+iyarDFaIxq
         Dkm3PyjFlAC3yxrlUcHd+Ymcm7iPyV8cTFkprGW5slW1FztWO1/lOtYc39t1tz1P2e++
         jH0cIGY3Kvig1BI/5414z3QYkGBRybXCHohh7OGgQIeSJ8YkgjspqEln9ocxn1/T/u7Z
         DW7WbR95R3Ne9WQ/yfl1hA5xW5Z6UdlkMJUiMaHpJ6TEmmZe3a0YARVovgPameAZaLwv
         t/2w==
X-Forwarded-Encrypted: i=1; AJvYcCUR4IEZC3qETY7N3N5CljCkQMCFxbSwIrmfRQcQibr3OgDur88kEWHeLCiJST0e18j9qfaxHXYv9xLMOJxkA55SSuJEPHvjqcifeVw=
X-Gm-Message-State: AOJu0YxuH3MOm50ubHWa04nN/leuDzY5qif2+07R39qEsH2Hr7Idykw9
	bWN4o9+WEhOWIo1bQiocxcdRfzCE3Ak7DjEZ9jQ2O2Nj6it3rKqDDCKWEloKBJSp3A5VOm7iB8s
	O
X-Google-Smtp-Source: AGHT+IHkjizk1lmfz+GG6haHtYEqXyvabAjlKAlTX1IbxEwCYNFbBUWUNm8rJx49cBEaGWik0t8cTA==
X-Received: by 2002:a6b:7d43:0:b0:7de:e04b:42c3 with SMTP id ca18e2360f4ac-7e8c1adcaa7mr1344715639f.0.1716911348103;
        Tue, 28 May 2024 08:49:08 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-7e903e0b783sm212004739f.4.2024.05.28.08.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 08:49:07 -0700 (PDT)
Message-ID: <f7f43200-17f0-47bb-8a5b-3a5534948067@linuxfoundation.org>
Date: Tue, 28 May 2024 09:49:06 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/9] media: vimc improvements
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
 <20240505203648.GA25270@pendragon.ideasonboard.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240505203648.GA25270@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/24 14:36, Laurent Pinchart wrote:
> Hello,
> 
> On Thu, Apr 25, 2024 at 02:57:32AM +0300, Laurent Pinchart wrote:
>> Hello,
>>
>> This patch series cleans up and improves the vimc driver, with the end
>> goal of converting it to the V4L2 subdev active state API. The goal of
>> this exercise is to make the API used by a virtual test driver, to
>> increase test coverage.
>>
>> The series starts with 4 random cleanups, to avoid unnecessary
>> iterations (1/9), constify structures (2/9 and 3/9) and rename a
>> weirdly-named enum (4/9). Patch 5/9 then centralizes the subdev
>> internal_ops initialization to prepare for the switch to the active
>> state API. The remaining patches (6/9 to 9/9) convert the vimc entities
>> to the new API one by one.
>>
>> The result has been tested using the libcamera unit tests, which make
>> extensive use of the vimc driver, as well as with v4l2-compliance. The
>> latter reports 4 errors, but they occur already with the latest stage
>> master branch.
> 
> Any comment about this patch series ? Shuah, do you plan to give it a
> look ? If you don't have much time for vimc these days that's OK, I can
> work with Kieran to get the patches reviewed.
> 

Sorry for the delay. I will take a look and apply them for the next
release.

> On a related note, I would like to modify the MC pipeline of the vimc
> driver to make it look more like a real ISP. This would help with unit
> testing and compliance testing in libcamera. I briefly discussed this
> with Hans on IRC who had no objection. If anyone has any issue or
> concern with this plan, I would appreciate if you could let me know.
> 

I am good with the plan.

thanks,
-- Shuah


