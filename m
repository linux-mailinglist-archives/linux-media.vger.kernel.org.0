Return-Path: <linux-media+bounces-23921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD1E9F944C
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C15137A2315
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895D62165F9;
	Fri, 20 Dec 2024 14:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r7l/Ab7L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31719216604
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734705043; cv=none; b=Ow/q4mZRRoAzrEOVabdpCzFqKmkhNCrDWLrQQn1NJ6bjrKgQHCu8lZHH2CaSA691yNsuJImBCYvilXl2DTPsQGKvEO2xU+Lz4X2zFJp4zjG7ko3V5kSTKxShmSlwe9+bQJfQWWBBAuQfZaGnLujnu+gU7ZFDbCciBWUp/tdGRg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734705043; c=relaxed/simple;
	bh=Egne4YOoAvxTaA4rWRwPKqzmM4+ljhp3kILa2wjBusg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VDjEJ1d8rKc2garD/hyGguDU66+o3CpjxUIJGWm0Zk/Aint4mZ++0hL8JnAB/KiFHm008V4woC+otnA5q3bW4TYGY3fqW0XL/ifR5aJd8XiddVopZxKsOeYCxm5FHUoIkTdGfAxJuE2cXdbezJ0o6s0hCLBtwhkNBaYVW0d+v/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r7l/Ab7L; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3863c36a731so1585288f8f.1
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 06:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734705040; x=1735309840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6StxWiDwWWBQpmBDyl8RwFYmdcRMQgGDmr5GcPpD+As=;
        b=r7l/Ab7LWQbpsny82SH9QPqKidHSrTFwm+3bt/uTRqQ9qLvzquXbLHCy1wPTT3e/63
         NS83ReYMoYi2tcOSniHTIqgOMbwZENf3EuvZfhk/F3YAX6rZm/za4SeEfoF9q/79n7sw
         rTwESgyBpINrbQ0FhPSRL5MSLhW8XeQJNVOT80RSTeZIMwmQQPpdbOFMfGtfVuH1Z7Oo
         CanryMl2qOQgoNXvSL1ElcEdVYytoRYKE9+hAJxjEcN92DKPfVs7yEq2T0qG4Y04tJ60
         MGlb5bimBvZpADpptapuVR7E1eSgpMmQv+Qnx8Izk6+EFOWwvsjiKCmmZkuwb86lgfIq
         VYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705040; x=1735309840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6StxWiDwWWBQpmBDyl8RwFYmdcRMQgGDmr5GcPpD+As=;
        b=e/Jn0DTayldGJARaDiwvFFVqTEWAiBkI1WqSyCy5diXXuwr+OWxrkuFF/2a8zz+6i9
         UwXOquWscg7t8AwA7ZbWqgyRjjmpwzc6v2qte5GnSYS2ran7hYHTpFtfghx+wNcn7r0o
         npp8gzK7/NB1+4ejAAG8S1yn+jDIBEugad+ac8XTukke4yHSOheMNHt3DlsayPkqp1nA
         Eas2k0dSo53spxAPPd+M5MXQUEz6vtRHp1W8pz1wIyeOmNI3uFNTbKeCu6f1ZUJWVqnM
         CCL99SGaxxH0MJUajxu5ScRndK4VADk/fcUSXnvtlvoQUSjsCDoRLc8WV3rPtBAcUGeF
         6n2A==
X-Forwarded-Encrypted: i=1; AJvYcCVSq16cFe7XmilEJf61s0enrogSTk6wP+mZ/wWXQAxYuVd+JhS/KA7B0CElslfBhr/jgD9wYp3bxLpR3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YycT0ElM9LHaoomepR1zG0ttd1mPwsU3fGupdWyOsulJzBpLR5T
	JRXtvTySLiirlJvi7CEx9cZYdUkNWmjWQCb/2uZ03rSkFc42Ti8Ywt9v+p2lgv8=
X-Gm-Gg: ASbGncug4VMF3Nzj26ehqm8cWkEthvrVUEuMcYH3HLGCVG2CIL/wVHiGsBoeJhzsx7E
	i4C+/o8SQSoePCLkx+zGHCvMQvdYH2y3HXpsLxuRnRfUmoZpN4RKewsbtRdFtMyLyuXotA9IbId
	eMe32uEEAOR8sf032j4ymjQwdUmdF7JLvKduIQgFB8WAe3t9U9J2QiiKGWO2a5Y698PYZmswrxm
	M8usUVjHmlMyx7SeGFhpBTHEfO2X14w5HvhIAmd8Ggr2ci0gXc/Sv4Uh79kT3vW8JyerQ==
X-Google-Smtp-Source: AGHT+IGoUxz/yQ7T0HP53zY6Z0EfaWDxW8OiGeklpif+FPNb/qAW2R0Td6OPuMCWckibZS9OXB2QKw==
X-Received: by 2002:a5d:64ec:0:b0:385:f00a:a45b with SMTP id ffacd0b85a97d-38a221eacb1mr2726056f8f.21.1734705040328;
        Fri, 20 Dec 2024 06:30:40 -0800 (PST)
Received: from [192.168.0.10] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832a90sm4144383f8f.28.2024.12.20.06.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:30:39 -0800 (PST)
Message-ID: <0f9ca591-ae9a-4c3f-b8fa-b74eaff2f300@linaro.org>
Date: Fri, 20 Dec 2024 14:30:38 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: ov08x40: Get reset GPIO and regulators on ACPI
 platforms too
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Jason Chen <jason.z.chen@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241219134940.15472-1-hdegoede@redhat.com>
 <20241219134940.15472-4-hdegoede@redhat.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241219134940.15472-4-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/12/2024 13:49, Hans de Goede wrote:
> ACPI platforms might also have a reset GPIO and regulators, move the code
> to get these outside of the if (!is_acpi_node(fwnode)) check.
> 
> This also removes the is_acpi_node(fwnode) checks from ov08x40_power_on() /
> ov08x40_power_off() both the GPIO hand the clk frameworks functions used
> there will happily accept the NULL pointer returned from the optional get()
> functions when there is no reset GPIO / no clk.
> 
> While moving the code around also at error logging to the error exit
> path for getting the reset GPIO.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

