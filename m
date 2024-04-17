Return-Path: <linux-media+bounces-9660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3635C8A7EF6
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 11:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F06BB21A72
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 09:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB06D12C48E;
	Wed, 17 Apr 2024 08:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iQ5cV42H"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B8D6D1CE
	for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713344384; cv=none; b=hKDgVF/LGyP8T42Su/3hfRVyWNWiSfXyy/EgLvg2a0RxXNZK6o6ZJMQSp34wa7p3q9uOigS9ZzHKcICmmAuQDUAjr1Dj2TZ3tiCMgHnI0hBoOMcntyUZHPPpouja790QPR0WpoINmIzG31fhccP+ma3jJjbmowlSEbWPrpSfYrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713344384; c=relaxed/simple;
	bh=4/ZWPTzjFHv8G3LXkIa0kTeqgpX6szAN6mRYGLOAOOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GAVfvjTUzaWb0+xajYD4R8FQlDI43+IugZNRzmaJ6947k/QWHTqx+mtAryT09UVXfMWa02/pzq+LaiyC3MO/Ea1/GDoNS93yGE+u4KRyvRZnlT1vG9t+2Wy01LBFlpkqQ4DYjwO5pZLx1PjeAaya+WFK7snkQEBYA9uoTd9k7FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iQ5cV42H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713344381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6oDlmMQVk0kEMWPw4RdCawfv9w6i0bBnCHbMm1Ll2ow=;
	b=iQ5cV42HvZ2SP8KFxkZ1DXPtA1Y4JqoTQxW9PLxMiFx5kqB3cmqbHs5a+FFgf4DbsFKzSY
	BAh0LXgMQ4NBuIb9XqKD0pXryqfCVJD6BjbXDw6/VnoyynRP1wt+MToowNDAYvLlHNiNJD
	A9DFzaSYFDNugro3zThXqMHIZ64pvhg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-JgyBTrj6MPiijoNeuEdXIA-1; Wed, 17 Apr 2024 04:59:40 -0400
X-MC-Unique: JgyBTrj6MPiijoNeuEdXIA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-56c1b105949so4783638a12.3
        for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 01:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713344379; x=1713949179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6oDlmMQVk0kEMWPw4RdCawfv9w6i0bBnCHbMm1Ll2ow=;
        b=LbffgQ98odXrWGXg9H3DYTyeruV9Z5bGlTdi+ts5LI5Oj/XByyLgBTSA/m7gVyIOYj
         HN4Lbnq7PT5p9eszmzEHAA6wLOfYsQCsF+ZHsOoAasZYAGSa3OiVR9l2FuiszcC7/eGl
         oH2xmeu0FcQZVxbrGXtKDgiWdPv9vaaGNAnTY1X6qkztIGKet6BrM6U5oF3ckrlxe8g/
         odIkFkXQKT+ECf8ZonnK7sVfbton6djxZ62W2nRh1naBDJkgrQbd6yLmJr7XWbkl/0hz
         e1bsBt1i56gnhtaruClrb73J9dU9TbGyRgWACzX87uSXgORtoIfsTcaD3tq5Y0jN+7WE
         hmnw==
X-Forwarded-Encrypted: i=1; AJvYcCXfoio2SzDDs1WINrhd5AKA8qGQ5J7EpCl/zYYgzObL51anSwf1XzznXSUsXfUq/JiEdfo4Sst2nGjZf2azLJl7VOVXP4jweF8nMqg=
X-Gm-Message-State: AOJu0Ywvb5VF5R96fGmbs2DzKXKtk10suud//gKj4dpU9QmSlTY6tbMw
	QHhnuiygHPoVNnYMbZ8VFh6HZycW7sdYUQhiSmJXJTCE6yG9Ioy/6kWVOCA8sgJzHE/C/Mldy4i
	gtDKP7DJ6+c3NhVG5Axq8+h7NLSrsiDo5vYOc+TGwrwJmDM324TANxPvuQk8jMiiQq+44
X-Received: by 2002:a50:9ee2:0:b0:56e:23e3:bdc3 with SMTP id a89-20020a509ee2000000b0056e23e3bdc3mr9530309edf.16.1713344378882;
        Wed, 17 Apr 2024 01:59:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOdeZ95ffNTTvc2TG2hcCMIMjV0iLdJ4GGSrCG8Md40TBKXiSlqvBrtwmzXL4omZvGJwQUTA==
X-Received: by 2002:a50:9ee2:0:b0:56e:23e3:bdc3 with SMTP id a89-20020a509ee2000000b0056e23e3bdc3mr9530293edf.16.1713344378485;
        Wed, 17 Apr 2024 01:59:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x16-20020a056402415000b005704445851asm1736773eda.44.2024.04.17.01.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 01:59:38 -0700 (PDT)
Message-ID: <0ce5cc60-da32-4e0a-89bb-fa481d4a15b1@redhat.com>
Date: Wed, 17 Apr 2024 10:59:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/19] Intel IPU6 and IPU6 input system drivers
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 bingbu.cao@intel.com, laurent.pinchart@ideasonboard.com,
 andriy.shevchenko@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 claus.stovgaard@gmail.com, tomi.valkeinen@ideasonboard.com,
 tfiga@chromium.org, senozhatsky@chromium.org, andreaskleist@gmail.com,
 bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
 <77c32f87-cdec-4dd0-85b8-c75ca7405438@hansg.org>
 <Zh-Jr2gfdoCeB5-4@valkosipuli.retiisi.eu>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zh-Jr2gfdoCeB5-4@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 4/17/24 10:34 AM, Sakari Ailus wrote:
> Hi Hans,
> 
> On Wed, Apr 17, 2024 at 09:56:40AM +0200, Hans de Goede wrote:
>> Hi Sakari,
>> On 4/16/24 10:10 PM, Sakari Ailus wrote:
>>> Hello everyone,
>>>
>>> This patch series adds a driver for Intel IPU6 input system.
>>> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
>>> device which can be found in some Intel Client Platforms. User can use
>>> IPU6 to capture images from MIPI camera sensors.
>>>
>>> IPU6 has its own firmware which exposes ABIs to driver, and communicates
>>> with CSE to do firmware authentication. IPU6 has its MMU hardware, so
>>> the driver sets up a page table to allow IPU6 DMA to access the system
>>> memory.
>>>
>>> IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
>>>
>>> I can now capture images from ov01a10 and ov2740 sensors (including
>>> metadata from the latter).
>>>
>>> The series applies on top of the metadata patchset
>>> <URL:https://lore.kernel.org/linux-media/20240416193319.778192-1-sakari.ailus@linux.intel.com/T/#t>.
>>
>> Thank you for the new version!
>>
>> I assume that the posting of this new version means that you have solved
>> the stability issues where the laptop would freeze after sttreaming from
>> an ov2740 sensor with metadata once ?
>>
>> What about the unrelated ov2740 driver issue where the sensor would not
>> always start streaming for which you temporarily disabled runtime pm
>> for the sensor as a workaround any progress on that ?
> 
> I'm afraid these issues remain.

You mean both issues remain? I'm not that worried about the runtime-pm ov2740
issue, but if the lockup after streaming issue also remains that is a lot
more worrying.

I've been running an older version of this series without the metadata
support and that is pretty rock solid, so this seems to be caused by
enabling metadata support.

AFAIK the current out of tree solution with partly closed-source
userspace stack does not use metadata right /

Do you know if the Windows stack uses metadata capture from the sensor?

If neither the existing out of tree Linux stack nor the Windows stack
is using metadata capture then chances are we are actually hitting
hw/firmware bugs here. This would not be the first time that the Linux
community tries to enable a hw-feature not used by the factory installed
OS for the hw and ends up failing miserably because the feature was
never fully tested and turns out to be full of bugs.

IMHO if we cannot get the stability issue fixed real soon it would
be best to move forward with this patch series without adding
the metadata support. So basically drop patch 17/19 .

>> Do you have a git branch available with the metadata + this series
>> somewhere for easy testing ?  I would like to give this a test run on
>> my own IPU6 + ov2740 laptop.
> 
> Both of the sets can be found here:
> 
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=ipu6>

Thank you.

Regards,

Hans




