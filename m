Return-Path: <linux-media+bounces-24-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 297D77E7EE5
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 851DAB21167
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944133B2A4;
	Fri, 10 Nov 2023 17:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cVklDn0g"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8DB3AC33
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:46:42 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B5EA32894
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 04:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699617851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aa4ayAdkH6cppf5QzpRnduf1Yo1Y5LUVEK/DHZShsyk=;
	b=cVklDn0ghduvLTKykGpz800bi0j5ZaXESHLqf9MdD43nY3esC3vkQEvgpmSqn4LrqUIU1y
	TTckABRm57HvnRGhOInzN0jBchXeJVCSG86mdwcdsG0lSiC2tD1DNwfvhzcdnadDXiOlFA
	nwMZQdD2W+QyiXWoeocYWpRqGFwRTv8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-4b1udTa0MfymQMEoQvBngQ-1; Fri, 10 Nov 2023 07:04:10 -0500
X-MC-Unique: 4b1udTa0MfymQMEoQvBngQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9e31708ad72so165023266b.3
        for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 04:04:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699617847; x=1700222647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aa4ayAdkH6cppf5QzpRnduf1Yo1Y5LUVEK/DHZShsyk=;
        b=JJMAxqCXZazAoLbTZC8d2v9UCZOh6tvE7/xpbnmusnaHUzjMQVn/vX7Vr7FweIIvVf
         9bL6aaBpgyyV0onx+vxnDLzGhXfyRr3hCqsth1Z7MFb0TQTBG7UAnzkFkIASkO2Ek+4L
         4A78EdisUiK+9Y/fa7UNof2ar4fhn/tl74f2mbI0sP4J8w+J33e0kegoffW5uTuwXbge
         iTOeLDSEpC1EqJLUHLZcEEw2lIpBjA5HWBmxdW5oIYuDqWU884bVJBYqpGNu7DSRVJr6
         Ggnd4SEh1jZ7jadgby7YwKh6p3cO2KMYC+HTZCHAhumJQwjhUj2bLIsHabtgO/coxaDW
         e6dQ==
X-Gm-Message-State: AOJu0Yx7DUCBuezwaE6faQ0pmWdDSYOb+f6ClLhRoKSRJmt5AfQLhpg4
	AZ4eUqFWvtziyyrHXCfcjCmKblAqYlMW8sNskzCOsk01YqC0kl+fudUXqOw8dOsLivC3xi8WvWA
	8lbexf0Jccd9HUDVyEKzdKVU=
X-Received: by 2002:a17:907:948d:b0:9a5:a0c6:9e8e with SMTP id dm13-20020a170907948d00b009a5a0c69e8emr6620065ejc.31.1699617846795;
        Fri, 10 Nov 2023 04:04:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGi9R1a3TcrHVYKbmo6eX77w5QZRV4kOkRn+CUOIMZuW9G++QP9HxawyZV3YoXRF2/NrHuVw==
X-Received: by 2002:a17:907:948d:b0:9a5:a0c6:9e8e with SMTP id dm13-20020a170907948d00b009a5a0c69e8emr6620037ejc.31.1699617846382;
        Fri, 10 Nov 2023 04:04:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f13-20020a170906c08d00b009b928eb8dd3sm3803968ejz.163.2023.11.10.04.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 04:04:05 -0800 (PST)
Message-ID: <7a636512-91ab-4f97-8bd0-e24ebc528ecf@redhat.com>
Date: Fri, 10 Nov 2023 13:04:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] Intel IPU6 and IPU6 input system drivers
Content-Language: en-US, nl
To: bingbu.cao@intel.com, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
 "Martti Groenen (19174837)" <M.Groenen@student.hhs.nl>
Cc: andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, andreaskleist@gmail.com,
 claus.stovgaard@gmail.com, tfiga@chromium.org, senozhatsky@chromium.org,
 tomi.valkeinen@ideasonboard.com, bingbu.cao@linux.intel.com,
 tian.shu.qiu@intel.com, hongju.wang@intel.com
References: <20231024112924.3934228-1-bingbu.cao@intel.com>
 <e1b060be-793f-4482-b0dc-670984bbbd84@hansg.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e1b060be-793f-4482-b0dc-670984bbbd84@hansg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/8/23 12:59, Hans de Goede wrote:
> Hi Bingbu,
> 
> On 10/24/23 13:29, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> This patch series adds a driver for Intel IPU6 input system.
>> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
>> device which can be found in some Intel Client Platforms. User can use
>> IPU6 to capture images from MIPI camera sensors.
>>
>> IPU6 has its own firmware which exposes ABIs to driver, and communicates
>> with CSE to do firmware authentication. IPU6 has its MMU hardware, so
>> the driver sets up a page table to allow IPU6 DMA to access the system
>> memory.
>>
>> IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
> 
> I have been testing this on a TigerLake system, a Dell Latitude 9420
> with ov01a1s and the packed 10 bit bayer pixel fmt: V4L2_PIX_FMT_SGRBG10P,
> which libcamera together with (WIP) software debayer support picks
> by default does not work. There are many many CSI errors in dmesg
> and only the first 10 or so lines of the image show.
> 
> Disabling the packed format by removing it from ipu6_isys_pfmts[],
> making libcamera pick the unpacked (every 10 bits per pixel data
> stored in a 16 bit word in output buffer) fixes this.
> 
> Are the packed bayer formats supposed to work on Tiger Lake, or
> is this a known issue which Intel's own userspace stack avoids
> by always picking the unpacked format ?

Bingbu, so we've been trying to get software debayering to work
on the Dell Latitude 9420 with ov01a1s and I have just learned
that this sensor has a non standard bayer grid.

https://github.com/intel/ipu6-camera-hal/blob/9fa05a90886d399ad3dda4c2ddc990642b3d20c9/config/linux/ipu6/gcss/graph_settings_ov01a1s.xml#L17

bayer_order="GRGB_IGIG_GBGR_IGIG"

I'm wondering how to interpret these 4 pixel orders? For the OV2740
this just says:

bayer_order="GRBG"

and this single quartet of letters describes a 2x2 block like this:

GR
BG

but now there are 4 quartets so how to interpret this,
I guess this is the correct way to interpret this? :

GRGB
IGIG
GBGR
IGIG

Regards,

Hans



