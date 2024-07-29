Return-Path: <linux-media+bounces-15426-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DA093F022
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 10:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2CD82824D0
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 08:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E9513CA95;
	Mon, 29 Jul 2024 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WKpuzB3D"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB7B328B6;
	Mon, 29 Jul 2024 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722242979; cv=none; b=cArNFwMuvm/3JqpYjzeEY1G4fLOk0kKr0ALUpbM1vPh1IFOXICSor75dJRn281yBS3rUFkD9Fnic4Blj+kwNhEFbzJZYhflJVpveqR91MhoW5lSMByJO1/kgPr6RjJquiYr+vAQiKnxVJHU3pN9X+/wE8kBgdX6ZEfNDM+j6ZsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722242979; c=relaxed/simple;
	bh=V+t1KVLyFXmaVyjcV1NYbYjP9LAp8g1op5p7ugFkUSY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VA7J4OAuBgTN2J7PceLd7yj2mOCFvbEOcdomAVkMElNVFytI+7cJ0D/jyn0VUB/w97Fdfzg4+WVSqQuew95aarD70lxJMsL2JWZ8u48VsIVV/RSGq9tNIuvWEf051zGVx9KW/TDhqeny4EiTif3+Tt/d/2WJjxjTIjDJi4CydWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WKpuzB3D; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [IPV6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f] (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94A06596;
	Mon, 29 Jul 2024 10:48:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722242930;
	bh=V+t1KVLyFXmaVyjcV1NYbYjP9LAp8g1op5p7ugFkUSY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=WKpuzB3D9cpf5xU2KyCcNZt0BYWegQGoKA2aOxpv6uz5gn0JtaA+kIdLyga2X8643
	 QNnKGPXoj+zpefzu8I5OujqVfp3zdmyc8EpMn+utAcP/fskhAZ7vORULZeRg4A9zL4
	 pbCiI1623tWTbsZZiXVU641SdOKqSxL2H/xA7oPA=
Message-ID: <2dc31ed8-ad83-4051-8de3-6efaf1538714@ideasonboard.com>
Date: Mon, 29 Jul 2024 14:19:32 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Umang Jain <umang.jain@ideasonboard.com>
Subject: Re: [PATCH] media: imx335: Fix reset-gpio handling
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 open list <linux-kernel@vger.kernel.org>,
 Tommaso Merciai <tomm.merciai@gmail.com>
References: <20240729060535.3227-1-umang.jain@ideasonboard.com>
 <ZqdHpx7k6gzf-jSb@kekkonen.localdomain>
Content-Language: en-US
In-Reply-To: <ZqdHpx7k6gzf-jSb@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari

On 29/07/24 1:11 pm, Sakari Ailus wrote:
> Hi Umang,
>
> Thanks for the patch.
>
> On Mon, Jul 29, 2024 at 11:35:35AM +0530, Umang Jain wrote:
>> The imx335 reset-gpio is initialised with GPIO_OUT_LOW during probe.
> Should it be initialised to high instead, to enable reset?

This initialization matches the physical line status, which is low in 
this case.

> I think you should also add a Fixes: tag to this and Cc: stable.

ack
>> However, the reset-gpio logical value is set to 1 in during power-on
>> and to 0 on power-off. This is incorrect as the reset line
>> cannot be high during power-on and low during power-off.
>>
>> Rectify the logical value of reset-gpio so that it is set to
>> 0 during power-on and to 1 during power-off.
>>
>> Signed-off-by: Umang Jain<umang.jain@ideasonboard.com>


