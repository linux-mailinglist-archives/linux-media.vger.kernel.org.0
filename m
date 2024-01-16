Return-Path: <linux-media+bounces-3757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D58D182F22C
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 17:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D409B1C235F1
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 16:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1FF1C69E;
	Tue, 16 Jan 2024 16:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VgMJvCMZ"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852651C68D
	for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 16:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705421587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H1fvDozEzKE18GLP3W2r5g1aaFs3dE5gk/v0J4F9UBc=;
	b=VgMJvCMZaZS5kg9Xi+qBdAJM3EESgwQkIs4p2DBN8X1pIk23hI4LqXdF5ORi7F21x8yA1W
	dx/n7S0lW39m/gKvHkrqIIAYleyec+MO+WL+NzbfvtS4eLA7k206+NvzY9XHj2EMomludJ
	dCqIuDTu0I3d801c2GRBxsbRjkBuPxA=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-fDqMuoJUOfyTmN8Rf5EB2A-1; Tue, 16 Jan 2024 11:12:56 -0500
X-MC-Unique: fDqMuoJUOfyTmN8Rf5EB2A-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-50eb710ee18so8806507e87.2
        for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 08:12:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705421572; x=1706026372;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H1fvDozEzKE18GLP3W2r5g1aaFs3dE5gk/v0J4F9UBc=;
        b=KN9DnTUKJT3q9ZmMsuF3whHRm6TjeP+GOK/pVi0zleztcG8TYUT+TZOWnbPmoZQgee
         GOBtR0N/wwBEmVRplGZxqgoS/z3v3fDG/++yqW0K0AdkeA11+clVEkd7xR6tl/tgpWZu
         3MelZ+tYbQ648KQrks3YklLRFKSqc/z0MmI80wIsqO8L1bEr+tBOzMbD5LDR40fnmKoP
         nIC7jF5zxJXoKpnKdR/9FBg0919WH70xWcQod6I35kpMzo5Mmrti5GG+Xp/QrjUNlSiO
         cUoCub9TfsreHEhdvkB3GMG8z320iPoEvCcwHQrkz+oX46wNrYGkjQuCiHrK+ZmafGFn
         UYzw==
X-Gm-Message-State: AOJu0YwsVASqCfdhzUtSHoxXIPEx3rs7V/iLhZ1+AB/aIi7RdCNHEJPb
	3v0IuPLTpFOoEsh1FWAm69j3wVSA0V+Bdo7MYJy3ceqboqTlQ8Do19ifGw3ytPEWCsNLKBG7XPC
	3qMrpl2spEyhuXflMmqhJODbnwFTBdyE=
X-Received: by 2002:a05:6512:138d:b0:50e:7225:38fd with SMTP id fc13-20020a056512138d00b0050e722538fdmr4462402lfb.35.1705421572218;
        Tue, 16 Jan 2024 08:12:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGer+NiwAIYcm7t04myYoBCnJ3Iac6nI/KSPS61aOMp0zH9JVX7G2DbB+Ar9e9bxE4lgHYC+A==
X-Received: by 2002:a05:6512:138d:b0:50e:7225:38fd with SMTP id fc13-20020a056512138d00b0050e722538fdmr4462381lfb.35.1705421571886;
        Tue, 16 Jan 2024 08:12:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029? (2001-1c00-2a07-3a01-06c4-9fb2-0fbc-7029.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:6c4:9fb2:fbc:7029])
        by smtp.gmail.com with ESMTPSA id m13-20020a50998d000000b005551387bb85sm7094227edb.94.2024.01.16.08.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 08:12:51 -0800 (PST)
Message-ID: <7dcbe5a7-408b-477b-b02d-e39b9ad1ab74@redhat.com>
Date: Tue, 16 Jan 2024 17:12:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 00/15] Intel IPU6 and IPU6 input system drivers
To: bingbu.cao@intel.com, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
 andriy.shevchenko@linux.intel.com, hdegoede@redhat.com
Cc: ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
 tomi.valkeinen@ideasonboard.com, tfiga@chromium.org,
 senozhatsky@chromium.org, andreaskleist@gmail.com,
 bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20240111065531.2418836-1-bingbu.cao@intel.com>
Content-Language: en-US, nl
In-Reply-To: <20240111065531.2418836-1-bingbu.cao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/11/24 07:55, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> This patch series adds a driver for Intel IPU6 input system.
> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
> device which can be found in some Intel Client Platforms. User can use
> IPU6 to capture images from MIPI camera sensors.
> 
> IPU6 has its own firmware which exposes ABIs to driver, and communicates
> with CSE to do firmware authentication. IPU6 has its MMU hardware, so
> the driver sets up a page table to allow IPU6 DMA to access the system
> memory.
> 
> IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
> ---
> v2 -> v3:
>   - Add line-based metadata capture support
>   - Fix header files inclusion issues
>   - Fix the CSI2 timing calculation
>   - Fix crash when remove module during streaming
>   - Remove some unused code
>   - Use cross-referencing links in documentation
>   - Update Makefile to use ":=" for objects
>   - Fix several bugs and coding style issues

So I've given this version a try on a Lenovo X1 yoga gen 8 with ov2740
sensor using the ongoing libcamera SoftISP work + this small patch
to enable the SoftISP on IPU6 :

https://github.com/jwrdegoede/libcamera/commit/3172f3703cf7076390fbf86c3b43e388c2422b31

things work fine when using patch 1-15 + 17 on top of 6.7, note
I'm skipping patch 16 ("media: ipu6/isys: support line-based
metadata capture support")" here!

However when I instead apply the whole series on top of:
https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata

Then things stop working, with the following errors
(I added extra error logging to figure out in which syscall
resetRoutingTable() fails and made libcamera ignore the routing
errors):

[2:02:04.466310686] [8943] ERROR SimplePipeline simple.cpp:1443 GetRouting() failed -25
[2:02:04.466315975] [8943] ERROR SimplePipeline simple.cpp:1574 Failed to reset routes for /dev/v4l-subdev1: Inappropriate ioctl for device
[2:02:04.466366331] [8943] ERROR SimplePipeline simple.cpp:1443 GetRouting() failed -25
[2:02:04.466370025] [8943] ERROR SimplePipeline simple.cpp:1574 Failed to reset routes for /dev/v4l-subdev4: Inappropriate ioctl for device
 	[2:03:32.334708887] [8929]  INFO Camera camera.cpp:1183 configuring streams: (0) 1924x1088-BGR888
[2:03:32.335129023] [8943] ERROR SimplePipeline simple.cpp:1205 Unable to configure capture in 1932x1092-BA10 (got 0x0-@...)
Failed to configure camera.

I was sorta assuming that the new metadata-stream support would
be backwards compatible for userspace without support for this,
so I think this is a bug ?

I would be happy to test any patches to fix this.

Regards,

Hans


