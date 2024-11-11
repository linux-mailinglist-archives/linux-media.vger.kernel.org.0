Return-Path: <linux-media+bounces-21252-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 690509C3DE9
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 13:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DDBD280F41
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 12:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50F519AD93;
	Mon, 11 Nov 2024 12:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UvmHXVtk"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DD119AD5C
	for <linux-media@vger.kernel.org>; Mon, 11 Nov 2024 12:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731326624; cv=none; b=cvAWftMdF4cjyiKxu+rb6neLmOh3i/Oh11FLdeAeS8eLe7+0/PDwuGayEMdvywAygiPtRnJA1GLpzSnc44Ey602hIBG/kiYDNumfXsyX/Oyk3pUSJuyReE5wlqOVB5oN3pN2Fi/NcPpuzVC3vK2/2gRb4vQxC0NkfDtfA/UQuwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731326624; c=relaxed/simple;
	bh=0hetY8uIMEqVRKNJElojeolvV3479Cxlp5RUjM0iE/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u/jT68vIIBYB8YbRVF+XgZ4VkMZ/UOUZN7jJCMxWqdp9P2pm/8Pl5sfuwG/mNA0W1Jx5DNXFYIadfP2mDjIF3KXML0mQ8w3z/hDfqFvNSRD+3C/73IKIeKbBQBGKe0MoU1UKA2cvkT2xjXhPYExVkIQ5ndachGU9Y3ps95L3tS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UvmHXVtk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731326621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mRpNVm2ysOu8vdoKpxHcBNsUyipR7w7qRAL2/gqNzEc=;
	b=UvmHXVtk9Ur4wJ8nDhO95uIJ/1L/CzUnrvDFISOE5PQoWeof1gd830Q+8KXx8lFSDwCl4i
	z4Gu46O2RlyZGeOZfnBvifiOWi/cgjmo5kB+u7eyMGdMEHIRkiiVBsCM9LQonH4Xja/bh6
	rKjrFAJKDWXE860ktIVXi67Gqt1rGdg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-iu6deBTrOT2T-VW3F09lXA-1; Mon, 11 Nov 2024 07:03:38 -0500
X-MC-Unique: iu6deBTrOT2T-VW3F09lXA-1
X-Mimecast-MFC-AGG-ID: iu6deBTrOT2T-VW3F09lXA
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a9ad6d781acso400805766b.2
        for <linux-media@vger.kernel.org>; Mon, 11 Nov 2024 04:03:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731326615; x=1731931415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRpNVm2ysOu8vdoKpxHcBNsUyipR7w7qRAL2/gqNzEc=;
        b=IzwG16a/uwUrsZRG0R/UQe8/WkTWa/iyVrh5WJHXCJKlgHkQZVymijDPkTVt9wjCyc
         N1NUR0e3oG+XtDAoDtoQZheFmwcx8rsLmy4BMumUXsE6bcjfSSej4EU/KJKNOXubHcmg
         bfVAj3e4ZPw5LwG8rppL13CKXhLtR58ow78NhkNv5yvDxPXILkZZBxYkbjCQd1i5/sM6
         75rGV7b1b05pABD9qN1R0sH4uHNp46GP7UDRMgb2AVQIUOPox1UhJ8eVoazIJ8U3w3RG
         05dxH0um46RolMHbhhEb+04kEKCEqmdq/wtupDAhYDao7T1loqzMW4FXvV/sqfNVHIVQ
         9xdw==
X-Forwarded-Encrypted: i=1; AJvYcCX1rZU51Tir4v6m06ddwk9OXlI3dsUuzTV/hmnPlDT6rOZd4J4WgdzQ+Ks3vrY1IBJrSBHvdC4vAurZ0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTlIs46rKZnQb05m3raeMhMHsPnwzp4cxfcDNLaHyGeBwUaRHH
	ASbhrLVIlgoy2nvHyZgRvrFFRicBshUklu0m2qJcwGt4jeTiKF7fKBj7Vz50r+QwIXQjQeo1hn1
	lcm4nlh8gGx0/WVSnoevjYtzf2WHkETe2fPLim5w8OHWaaPmfZiQjW3Q+5bFB9fal0s62
X-Received: by 2002:a17:907:6d28:b0:a9a:2afc:e4cc with SMTP id a640c23a62f3a-a9ef0050e63mr1185216066b.58.1731326614236;
        Mon, 11 Nov 2024 04:03:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJWchcYStfBvYd+ipw3WE4m9baAoVo0YVLDMr8rJI2MTxP68VvWvEA+f6wkEfg1VCcKVP5+w==
X-Received: by 2002:a17:907:6d28:b0:a9a:2afc:e4cc with SMTP id a640c23a62f3a-a9ef0050e63mr1185213166b.58.1731326613786;
        Mon, 11 Nov 2024 04:03:33 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a450besm582118666b.43.2024.11.11.04.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 04:03:33 -0800 (PST)
Message-ID: <0786dee3-8605-408d-b05a-e1736c6481a3@redhat.com>
Date: Mon, 11 Nov 2024 13:03:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Yunke Cao <yunkec@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
 <5b5f3bb7-7933-4861-be81-30345e333395@redhat.com>
 <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 9-Nov-24 5:29 PM, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Sat, 9 Nov 2024 at 16:37, Hans de Goede <hdegoede@redhat.com> wrote:

<snip>

Note only replying to the button remark here, to try and disentangle
that from the general power-management discussions.

>> One downside is that this stops UVC button presses from working when
>> not streaming. But userspace will typically only open the /dev/video#
>> node if it plans to stream anyways so there should not be much of
>> a difference wrt button press behavior.
> 
> I do not personally use the button, but it is currently implemented as
> a standard HID device. Making it only work during streamon() might be
> a bit weird.
> I am afraid that if there is a button we should keep the current behaviour.

There are 2 sort of "snapshot" buttons on UVC cameras

1. Snapshot buttons handled through the UVC protocol / USB interface.
These require the UVC interface to be powered on and the status interrupt
URB to be submitted (uvc_status_start() called).

These will only work if the /dev/video# node is open, otherwise the UVC
interface is powered down and the status interrupt URB is not submitted.

IOW most of the time these already do not work, since most of the time
userspace will not have /dev/video# open (otherwise we would have
the power-consumption issues this patch-series tries to fix everywhere).

IMHO not having these working only when /dev/video# is open and instead
only having them working when streaming is a not a big deal since usually
userspace will only open /dev/video# to stream anyways (except for udev
probing, but that is very short lived and does not help with the button).

2. Snapshot buttons which use a separate standard USB HID interface

Since these use a separate USB interface, using the usb-hid driver.
These do always work and these are handled completely independent
of the UVC driver so it does not matter what we do in the UVC driver.

I hope this helps clarify the button situation.

Regards,

Hans



