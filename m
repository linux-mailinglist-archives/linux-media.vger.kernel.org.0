Return-Path: <linux-media+bounces-29603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B77EDA7FC1E
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 12:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C56D04407FF
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 10:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1A3269AFB;
	Tue,  8 Apr 2025 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPMrLEea"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB541E1E04;
	Tue,  8 Apr 2025 10:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744108008; cv=none; b=nfLrAwxgWkmzlxkawbA6hipoSXRnKkhLP/4FGDMhBDz5eN4/8jt984wYxuF24GATIFe8a6pyvPWKemyMlnf51iLcPfsqez7ZuvtpAO2pdgZ71Utj9K6pHZMf+i1pY3wpAmPF/Cdv8kEEW8CwI1krs9B6GTr1HZxNycTdLcOlI7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744108008; c=relaxed/simple;
	bh=wbk3IxyghO2N+vPGqFUJSWI7EZaT+oIbACmk+kE/tKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=smQfIzVX4E4//DVfxoMOJuGZ9r+pWJjdakYB3XzDdj4SkUsvpXeiUasBC84Pfb4GvVDAhzPCvjmoILxiFJW3Ko/el1uWuQSmIBTxEg27e7Ew3KXrNSWC9Gz2+tnJ9oWZ0DXe2iQ1Hbfw4g0e0tR/slRs98/idjcB9dhSRRV7pGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPMrLEea; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so47052461fa.2;
        Tue, 08 Apr 2025 03:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744108004; x=1744712804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/aafXXtS1pJTfXUJnYrRD1/oosIVbIYxn3rEdTX4jE=;
        b=SPMrLEeah68LbppK0tO70NK+eYLOrbAmJ+eNWuESjG8D7jD+qc/lkZUh4V5TZNmi1L
         LJLpuXxdupN8naAmlW7TecKczxUt1ujXSUA+qdLHyaPeWruggwd32YBWh+zW9Yb7bURK
         kUt40lP+FTHPAfjwE3WWgpokbkP/PvIxi0jBbWXF+m0RFacWq9Q+TNOukjf0SvzGS/9l
         +NADhPhnyJuXdmRVYe1XJw/GrMpPUy1R9RfeROF/XofAci8Qxh8HUiG/RfWMM91FLN/g
         LhoK6ENlcZbBoUA/SJqLQGNKNzMGvDlRX8eD6k2Gva+i6qbg4ElXb8PjNsh37W2RwCgh
         dRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744108004; x=1744712804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/aafXXtS1pJTfXUJnYrRD1/oosIVbIYxn3rEdTX4jE=;
        b=c6zIt4ujHf4qfu8U31bjzMNWqw6ggWmoA2axhclxlzzil4hm+uPPXUil2W4coZydZn
         KZSnfdG+2V2NT14BKMu3aH3SkTJiETJ40Wl5/R1P1Mh74DZh3cJipfY0k/nSwo0ExKkA
         ThNGYTLoOsWfKpwxgw6AFQ9bpaIKJZPRbi4rnD6hncM45PsukGFQAZr1qf7doewbFP7x
         9GCTWFVCy8BFc62qcss3IgRH/LbmRZcIVEMqXKq79XVqvfrT3gR8J7ZebPXru9zEyyqu
         aOBE2WopdXKfnLi2fNpYzuOLb0+1VdarplMX7Pgmkw5hwBviKRboVZGRUfGdUs8vKXiF
         juow==
X-Forwarded-Encrypted: i=1; AJvYcCWdFdACt5iw2KCPtTGv92KOMISa4uzcgNCZowd1zvcVZyIKn2xP0R44OqOX3r6nGxB0dGc+vsyFdyCdAHU=@vger.kernel.org, AJvYcCX7AC6dHMhyf6IcmZfr5MvFSp/K+jUfvHp9vK304QSS2vwzzeBEz3Kb/NF9VaOwsG87SJeIs/FoVGZNjzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YywuHOtSWdnnvQQlknqygPNv/LC9FoCzbtz1XGdRu5rn8dKvICL
	DYOb/UdCeYDJGvzgZkSkGdEe8IZ1ATXFmWCudIYi+N4cbjyuiG3o
X-Gm-Gg: ASbGnct+1u9Qg//8zBgEGnWFGqGkXRDuqF1mDEDb9GtXO9qZmhKM4uRKxHTlPnfrdkA
	1k/261xJwRUznUIQaA4X2qmKgNBnJMalqAHEzTxjgTmWHv7Jhoh+elXHF/l06j8OmNkHfBVMT7j
	dgXsSS6Khu8LeF/3gdQhpJS5qFvHjoVFfge++lXuLToXdc3PmMPj8O+hrCH6Po3VorC/LDcFy5h
	pHaGBttSEqCTumC7js9IwVt156Tn08BTlBgVDsx+ij8Tt/TxSxDFRKdYsKsOfSaAzntrkrviVH9
	nxFxO/R1gXWrBH4hv+HmpVUKezLTM1NpwPIigZnzF6iGB+uaYvpIk3zt6Q==
X-Google-Smtp-Source: AGHT+IGHtrBUihRy6bJ4u3z8Jeg9COOirDuEB6qTLwJJHWzK2pkJ9TuRXePn53PqpYbFx3piSEFadw==
X-Received: by 2002:a2e:a548:0:b0:30b:963e:9b1a with SMTP id 38308e7fff4ca-30f0a12f55cmr50823981fa.23.1744108003922;
        Tue, 08 Apr 2025 03:26:43 -0700 (PDT)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314b7efsm19058541fa.62.2025.04.08.03.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 03:26:43 -0700 (PDT)
Message-ID: <3d8546b9-92bd-40da-a61a-4534ba7779db@gmail.com>
Date: Tue, 8 Apr 2025 13:26:42 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: thp7312: use fwnode_for_each_child_node()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <Z90qM33DvkTMGg_x@mva-rohm>
 <20250321104100.GC25483@pendragon.ideasonboard.com>
 <Z_Ti7aQK2_OlrUee@kekkonen.localdomain>
 <20250408101252.GB31475@pendragon.ideasonboard.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250408101252.GB31475@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2025 13:12, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Tue, Apr 08, 2025 at 08:48:45AM +0000, Sakari Ailus wrote:
>> On Fri, Mar 21, 2025 at 12:41:00PM +0200, Laurent Pinchart wrote:
>>> On Fri, Mar 21, 2025 at 10:58:27AM +0200, Matti Vaittinen wrote:
>>>> When fwnode_for_each_available_child_node() is used on the device-tree
>>>> backed systems, it renders to same operation as the
>>>> fwnode_for_each_child_node(), because the fwnode_for_each_child_node()
>>>> does only iterate through those device-tree nodes which are available.
>>>
>>> This makes me wonder why the OF backend implements
>>> fwnode_for_each_child_node() as fwnode_for_each_available_child_node().
>>> Is that on purpose, or is it a bug ?
>>
>> I discussed this with Rafael and he didn't recall why the original
>> implementation was like that. The general direction later on has been not
>> to present unavailable nodes over the fwnode interface.
>>
>> So I'd say:
>>
>> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>
>> We should also change the documentation of the fwnode API accordingly.
> 
> Does that also mean that the fwnode_for_each_available_child_node()
> function will be dropped ? It's used by few drivers (5 in addition to
> the thp7312 driver, plus 3 call sites in drivers/base/core.c), so a
> patch series to drop it should be easy.
> 

I assume the fwnode_for_each_available_child_node() still makes sense 
for ACPI backed users, no?

Yours,
	-- Matti

