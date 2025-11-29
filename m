Return-Path: <linux-media+bounces-47898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E3612C94470
	for <lists+linux-media@lfdr.de>; Sat, 29 Nov 2025 17:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 14C0B4E5207
	for <lists+linux-media@lfdr.de>; Sat, 29 Nov 2025 16:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8636930EF6C;
	Sat, 29 Nov 2025 16:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBL8Wu2a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD351D86FF
	for <linux-media@vger.kernel.org>; Sat, 29 Nov 2025 16:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764434939; cv=none; b=HwkwVFPIx8yu2aviJKsmO7IQzAr0RVQeyLDxZCg6gJWMfIXyCqPn2mfdV/l4P0FArAinZ3qIhRgGsE4DW+M43b3BmMjOhlTMtNNV4Hl5SDO/KV+mr5ZnJHbFHdt2/wuzbuAXUMJqoeTidtICEnnkJqaFMzmdP1rpyS0lhaVRPew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764434939; c=relaxed/simple;
	bh=UguDFeNm3rR92PuEs88LFVrDqZAmJVW1/LezdGratSs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Xj4oXHVePFB0cnTsEOIcEJ0bRiYeEChDKDIP2j+NkcY1eylbVqS9L/wC8CHtCCCdoH0kCD2VBaVmHp2MAje8gwXp5j0N/VYX6nhzzEEAOwTx/gHnFCxfwMKUfMR+dUq2jY2Mz7IOEHtFX0zH0MnyUtHiw0Vz3HlHdU2vh/cbAQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBL8Wu2a; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso21375095e9.0
        for <linux-media@vger.kernel.org>; Sat, 29 Nov 2025 08:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764434934; x=1765039734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PLn4jfKsrHWTW4/4+B+0A89DBI80RuILUmevDYeHCmM=;
        b=JBL8Wu2azQPvGQln8C0zThYJ9QjUuezGpAAP7iuM1rDN1952QGHsz9UP1rGgNmzc9f
         jywxsH3HuyRwDXtg57JzH9g+Yko1B5eMgcLjSaFM3eOccv2R4467qjwVdltIwkWdKioM
         nJ3kNORMtjVfnUbaV4SFB36gCZfiR6pwKfuQy6YFq+3ZvUva/7FcB2HKRTs0mhFCLlnQ
         aNF/wR8LNNnjZ+WCe4R1rm6TJ8oRfwIu0CnC9Rfu7Pk02nctQNfVp+yL/7czb/pDMW85
         g0TGx0XzCx9Hq727Ur7iZaN7eJRiH01itVziMSG8hXF/9DbittGiqXUj29pRFhoQnAWO
         Ncsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764434934; x=1765039734;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLn4jfKsrHWTW4/4+B+0A89DBI80RuILUmevDYeHCmM=;
        b=KvoSOxwaote9IM1qk8VHadjoEeW7UDHgqbYNCsgSTFeNtPD2Lu6xlWSJ8HZLTpQPsS
         ubEMN+nuRToDJ1M4Zke/nj/RetcJMyd4lrop1F41iHO6MrjROATo21iCruwMzmggXim7
         PJJCBVd56HVXMvzHxoqqJYbDDwAWLR5/OTL53jFHhqSV1+wQMeo3rNdOorCwabArEwIN
         kLmGb2chpSIuoUxEOFj3wnwdaEHVUq/j8A9AsrDtXZn8yVE3wipD7OkU7YSNv7gs2cLE
         YCn4SN4Or8XRe0dNnFllYDNVeWfQVDJLWii7akzstL/6xRP3n6323/6/VZaLx5iC5Y7+
         3ETw==
X-Forwarded-Encrypted: i=1; AJvYcCUG/D5fcI+BguZqTu2upkYE+SKlzYMCPLCxcuR5gSFHZrFfg/HJo2d7yDtcSajJuDVQlvGJZCmgxiX+cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPtf+YIPaJpXvakVxz+KyQ7oNdmprZSGrfnvSl9Zq9hzDkFDhQ
	so3/a+GEUpfPKFU5PksXm8mfbcuU8S9Dq0xR58e5Ch4m2kIjp0X2f86umioqmExUezJtqTrtHU5
	cG4sD
X-Gm-Gg: ASbGncvLfhec/5ROuUu3uCYjKzfJEN5wfy+G3DeSMO9oHjA+GUfKAecMFlGBEtcV/EL
	XkT+KrKKiwDGXjT6j56C86jmx9r9L/pf9pRr08MePa0/G5HKwu3npw5N6URwNKPwh4fZ7fzPJj/
	0YIKKGGCa3T2TWws9NyriMf2aihuMfOrghZ+WUOJGLqojXE1xX2j8+MKLbruI2xcssGJl/0JZEi
	lM0t1OmTGD7QJ12Ckj13reA0H4r6IRJducY8gQmu+QyKmyh4MNzwQTveCjh9ePeG1a+92pMz02A
	ogfi+xAaGMa72AuuhYSGySNC+h+prDMLQrxVHYCczQpHNkJc35SFQX0oo1z0xseq/uXMqMUd4Yr
	7XQEl4zHZSO4AxczybfWyjsjcQs9xh203amNRj7ye7Ad2M2AE1+q9BjQP+GIxYwnBlNHY7+/Qw7
	2N2j02D+E3Pv2Ngzomi29NjsutsXk=
X-Google-Smtp-Source: AGHT+IEsqge+IGONOcaIskW/dh2jD1PHOkthfQu/5sraz9Ssx6DPunUiwRL9a/P5xS6kCYesirvopQ==
X-Received: by 2002:a05:600c:204b:b0:477:9d31:9f76 with SMTP id 5b1f17b1804b1-477b9ee4fd0mr266912685e9.12.1764434934210;
        Sat, 29 Nov 2025 08:48:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-479052cfe70sm112532625e9.10.2025.11.29.08.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 08:48:53 -0800 (PST)
Date: Sat, 29 Nov 2025 19:48:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jie Deng <dengjie03@kylinos.cn>,
	laurent.pinchart@ideasonboard.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, hansg@kernel.org,
	mchehab@kernel.org, kieran.bingham@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jie Deng <dengjie03@kylinos.cn>
Subject: Re: [PATCH v2] media: usb: uvc: Fix NULL pointer dereference during
 USB device hot-unplug
Message-ID: <202511290057.kQLrar4L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122072558.2604753-1-dengjie03@kylinos.cn>

Hi Jie,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Deng/media-usb-uvc-Fix-NULL-pointer-dereference-during-USB-device-hot-unplug/20251122-152814
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20251122072558.2604753-1-dengjie03%40kylinos.cn
patch subject: [PATCH v2] media: usb: uvc: Fix NULL pointer dereference during USB device hot-unplug
config: x86_64-randconfig-r071-20251128 (https://download.01.org/0day-ci/archive/20251129/202511290057.kQLrar4L-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511290057.kQLrar4L-lkp@intel.com/

smatch warnings:
drivers/media/usb/uvc/uvc_video.c:2357 uvc_video_stop_streaming() error: we previously assumed 'stream' could be null (see line 2323)

vim +/stream +2357 drivers/media/usb/uvc/uvc_video.c

571e70dbd421056 Kieran Bingham   2018-11-05  2318  void uvc_video_stop_streaming(struct uvc_streaming *stream)
571e70dbd421056 Kieran Bingham   2018-11-05  2319  {
18ffa9a4cf426a8 Jie Deng         2025-11-22  2320  	struct usb_host_config *config;
18ffa9a4cf426a8 Jie Deng         2025-11-22  2321  	int i;
18ffa9a4cf426a8 Jie Deng         2025-11-22  2322  
18ffa9a4cf426a8 Jie Deng         2025-11-22 @2323  	if (!stream || !stream->dev || !stream->dev->udev || !stream->intf)

I don't think "stream" can be NULL,

18ffa9a4cf426a8 Jie Deng         2025-11-22  2324  		goto cleanup_clock;
18ffa9a4cf426a8 Jie Deng         2025-11-22  2325  
fb58e16bb783833 Kieran Bingham   2018-11-05  2326  	uvc_video_stop_transfer(stream, 1);
571e70dbd421056 Kieran Bingham   2018-11-05  2327  
18ffa9a4cf426a8 Jie Deng         2025-11-22  2328  	config = stream->dev->udev->actconfig;
18ffa9a4cf426a8 Jie Deng         2025-11-22  2329  	if (stream->intf->num_altsetting > 1 && config) {
18ffa9a4cf426a8 Jie Deng         2025-11-22  2330  		/* Security Check: Check if the interface exists and is valid */
18ffa9a4cf426a8 Jie Deng         2025-11-22  2331  		for (i = 0; i < config->desc.bNumInterfaces; i++) {
18ffa9a4cf426a8 Jie Deng         2025-11-22  2332  			if (config->interface[i] &&
18ffa9a4cf426a8 Jie Deng         2025-11-22  2333  			    config->interface[i]->altsetting[0]
18ffa9a4cf426a8 Jie Deng         2025-11-22  2334  				.desc.bInterfaceNumber == stream->intfnum) {
571e70dbd421056 Kieran Bingham   2018-11-05  2335  				usb_set_interface(stream->dev->udev, stream->intfnum, 0);
18ffa9a4cf426a8 Jie Deng         2025-11-22  2336  				break;
18ffa9a4cf426a8 Jie Deng         2025-11-22  2337  			}
18ffa9a4cf426a8 Jie Deng         2025-11-22  2338  		}
571e70dbd421056 Kieran Bingham   2018-11-05  2339  	} else {
699b9a86a3f03ad Laurent Pinchart 2022-06-08  2340  		/*
699b9a86a3f03ad Laurent Pinchart 2022-06-08  2341  		 * UVC doesn't specify how to inform a bulk-based device
571e70dbd421056 Kieran Bingham   2018-11-05  2342  		 * when the video stream is stopped. Windows sends a
571e70dbd421056 Kieran Bingham   2018-11-05  2343  		 * CLEAR_FEATURE(HALT) request to the video streaming
571e70dbd421056 Kieran Bingham   2018-11-05  2344  		 * bulk endpoint, mimic the same behaviour.
571e70dbd421056 Kieran Bingham   2018-11-05  2345  		 */
571e70dbd421056 Kieran Bingham   2018-11-05  2346  		unsigned int epnum = stream->header.bEndpointAddress
571e70dbd421056 Kieran Bingham   2018-11-05  2347  				   & USB_ENDPOINT_NUMBER_MASK;
571e70dbd421056 Kieran Bingham   2018-11-05  2348  		unsigned int dir = stream->header.bEndpointAddress
571e70dbd421056 Kieran Bingham   2018-11-05  2349  				 & USB_ENDPOINT_DIR_MASK;
571e70dbd421056 Kieran Bingham   2018-11-05  2350  		unsigned int pipe;
571e70dbd421056 Kieran Bingham   2018-11-05  2351  
571e70dbd421056 Kieran Bingham   2018-11-05  2352  		pipe = usb_sndbulkpipe(stream->dev->udev, epnum) | dir;
571e70dbd421056 Kieran Bingham   2018-11-05  2353  		usb_clear_halt(stream->dev->udev, pipe);
571e70dbd421056 Kieran Bingham   2018-11-05  2354  	}
571e70dbd421056 Kieran Bingham   2018-11-05  2355  
18ffa9a4cf426a8 Jie Deng         2025-11-22  2356  cleanup_clock:
141270bd95d48ea Ricardo Ribalda  2024-03-23 @2357  	uvc_video_clock_cleanup(&stream->clock);
                                                                                ^^^^^^^^^^^^^^
But if it is then we are toasted.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


