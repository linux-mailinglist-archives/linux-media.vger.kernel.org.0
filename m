Return-Path: <linux-media+bounces-18306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCF5979DB4
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 11:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20DE7B21070
	for <lists+linux-media@lfdr.de>; Mon, 16 Sep 2024 09:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E08146589;
	Mon, 16 Sep 2024 09:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZJwExu3A"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3588DDA6
	for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726477262; cv=none; b=SX4uitDP2WWjvnSmqO+VKUsNxjBQU1DR82BqLLcSO1tYgsU7JOA1BIqYd9H/hdZTk7zAAIGl2rR1qj1BJE2mwV7UvuGFWtQbQNQCxUT0jOuJCBPxsIgMOQkqn0A42z/xj3tDUhRJ4a9FCQNG442ObFSRIjX4vBzU5NcaVqa9H5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726477262; c=relaxed/simple;
	bh=RlzNN3EME2TPwm/2pHEAPRLP+oXrJgxIfTnPbz/mqIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tgill9HzTg3IvikUnr7uWOlxRuRvhCeV13yCKe+PnpcTqJEwlJi6jeOI4KGBl2r8y/c5f7xixzKbHSKNvNv/2PtDc5uBd8198hXJMUudc+0azG6zbQUxQy1t9AFgMjmqa9KFw0J1EA1InuQl0/5+TlK3sOo3kITEY341QaOhl6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZJwExu3A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726477259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DLNH/X0H0xMIBSoqA2tqYNdEPPa781MoYQSido4al4A=;
	b=ZJwExu3ASVSFpbA8MtggdA2Ln62IU7rwkqaFN+C7tw5DeL9stEd5rKJCzuOh+gv6o51nFC
	75rWjnjBDgT+GpBLsIq7PVbgNf9hHzOVjxUd1ZaePiLh+JYSZ6sAaeHpVzKeos7NI849eQ
	2/wgPN4SGluxdpFiYLYy+4fk2UrBshA=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-XPAFcRdQOW6JL5YDZH-_zA-1; Mon, 16 Sep 2024 05:00:58 -0400
X-MC-Unique: XPAFcRdQOW6JL5YDZH-_zA-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5356a05fc7cso2510967e87.0
        for <linux-media@vger.kernel.org>; Mon, 16 Sep 2024 02:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726477257; x=1727082057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DLNH/X0H0xMIBSoqA2tqYNdEPPa781MoYQSido4al4A=;
        b=tIZIbKgaveXHUr92LdKzvkG7G/agMtKupwfiydHVnMKjyoJpOd1M+qKajeBoVloZvV
         rLWP3J8EcT7/Dm5b1BXwEOEu93Q6EOq3lqxc/uWwMSZZ0ZDpj0iKYCfxdAlO5EXWLXBU
         DEjYNkmHQkHH6jWIYYUlbDtQAnh+dnRFD4RFofJUNzjXloLpQG7sAOCyBWbv+Mqh0b60
         NvycTNTV/67i4xBSWeYuHBsN2ETZ+Z7HX6vEJOy/0us6SO3aZ0QVOFwyzXNC0pcNfWn8
         bxkezwicrfvimVwrpkhm9JS0QSsyDo0WIvLn3jfxHSL4uQ8c2ZtmGfCFEr/CHMiaLCqC
         hU+g==
X-Gm-Message-State: AOJu0Yxuw1sAW3k+85D1gPrOmkUzqal3FhZ5ahc2kREI1K4l3rOVo2GT
	27uPvUn7+fNvlwSFcfh3lQB0OlI4r1m3xLx/ScrhOeRtH7fNDVrqKNfE9t9NMXgx/A+ip9lxzED
	TmusmA1bfZ5YGBUweYHmUxKftLkBAOIjeL9LM8ANuxz7JqhK1Gu3OxxXHe76U
X-Received: by 2002:a05:6512:3e29:b0:52e:936e:a237 with SMTP id 2adb3069b0e04-5367fec8cb1mr7025199e87.16.1726477256613;
        Mon, 16 Sep 2024 02:00:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYxVPYV4JqtcRfYK3Rnb6iTuT4+622b/En3plfCa6pqPPnb6cP0SiE961lUDyLwqBuQOpvCA==
X-Received: by 2002:a05:6512:3e29:b0:52e:936e:a237 with SMTP id 2adb3069b0e04-5367fec8cb1mr7025137e87.16.1726477255786;
        Mon, 16 Sep 2024 02:00:55 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610966ccsm284209966b.45.2024.09.16.02.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 02:00:55 -0700 (PDT)
Message-ID: <ea2522e2-0f64-4caa-aae2-3057f4d1cd95@redhat.com>
Date: Mon, 16 Sep 2024 11:00:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: atomisp-libmsrlisthelper.c
To: "Dr. David Alan Gilbert" <linux@treblig.org>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ZuXOWjvVYa64c1-5@gallifrey>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZuXOWjvVYa64c1-5@gallifrey>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/14/24 7:56 PM, Dr. David Alan Gilbert wrote:
> Hi,
>   As far as I can tell none of the functions in atomisp-libmsrlisthelper.c
> are called in the tree any more; I think:
> 
> commit 3a81c7660f8021967dccd52624fa1a6fcf117000
> Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Date:   Wed Sep 27 14:24:56 2017 -0400
> 
>     media: staging: atomisp: Remove IMX sensor support
> 
> removed the last users of it.
> 
> Would it make sense just to remove that?

Ah I was under the mistaken impression that the MT9M114 was using
this, but you are right. I'll submit a patch upstream dropping this,
thank you.

Regards,

Hans


