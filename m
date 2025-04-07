Return-Path: <linux-media+bounces-29508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BEDA7DF85
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2FE5165749
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 13:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6930B13C8E8;
	Mon,  7 Apr 2025 13:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e6ccwMZn"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F9A3F9D5
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 13:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032960; cv=none; b=ciNqYl2QmOLBIszlhHdV+C6OhF10hETQ0Pf5S/m8LFVzW2aa8vv7urnD3aVW4ttU1VL1O4K0U+mgfE824142gkk+lMcF6olbYSklhWeEpj+E909+7+kP9bB5WHpFgeoDaP2WdCQ0m6LeMz9ww4u5zlGtt/r+DmHT+moOXXDn8xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032960; c=relaxed/simple;
	bh=AtdrqVblIwyRJjpzu+7s+0vuEiFQZDNTmIIOvwzzaZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKlD5ni4asP8KcVp2/lMPD0eHcIqvCeX0FEbc/PYZ51K+eiBps+t1VDYTL8pkUDbdrrSzw9LpPXYOjZBQObKe5JQ0U0qnHQM4sT+c1w5dOXEK7F72T3Momb00HjNADGnYdUIE1jdK34OPEdos0TM2qQPHl7ywTaC7oCJkfHrOEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e6ccwMZn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744032957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=in81QoQ/dvpBmuwPHViwGcLpcDK61w2q9cor9eg0Gws=;
	b=e6ccwMZnLgE50s0nmQh/kpmqIW5pszok2MVKqZESSoLsScOjh6YfwoqQ0uH9RR4nnUsWBI
	OCrfMlI+y8irbA9hvRzNVdNOUJ8JliWUtRbK2hm8YiqNr3ysivOfQ6Qw3slWuNjtw3GpFf
	jCk75AoQBxb2KNugIWiD1YSqiDRYIfo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-c2w48EPpPC-bOsiPn4JTAA-1; Mon, 07 Apr 2025 09:35:56 -0400
X-MC-Unique: c2w48EPpPC-bOsiPn4JTAA-1
X-Mimecast-MFC-AGG-ID: c2w48EPpPC-bOsiPn4JTAA_1744032956
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so25372605e9.0
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 06:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744032955; x=1744637755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=in81QoQ/dvpBmuwPHViwGcLpcDK61w2q9cor9eg0Gws=;
        b=Hef6z6eENscZ8C843D3Ha2aImvsgXO/owFZWwSaddPpAIojm3jPN1+g1AlYimEkbpU
         mA2Rm13FaTG//RX63P+yZmaFkK7SNZm3wlITvFO6MtZB8ssH27cml1gkDAOzjyC7eW+z
         5zVFVt+e30cZ6AefDQdk1EYo65vgwnog49jIszRxNsUurc1EpRwiWLASo04i26LYTkpI
         nadiMm3Eg6mWfvFsYFXy7VAS8DluFWaIC+zT5THwaPlAZZdB7gIHCC1tW1uI+f6i5ozO
         EycydbFTHVIlnvEiArIMBGC/swKUWcAV8KvApfdpvtotaV7p8tPS4rPG1qiZLAnba9J2
         lIoQ==
X-Gm-Message-State: AOJu0Yzwm74JAulpRIdTgU1Mo3eTQRt9w0trcq2OVhk98fJc/RBqP6pp
	WgZau74p4+Vabb1P3FaxYAuDdmFjG+FAQAYA6cvVcUjjIQsumBPLBaHlttlqOGep5wJmK2ZN2Eq
	7q6Dtf066Dk64BNbCD+8ifG+GwjRlPZProQy2b1Ojnzlq88zr/cMDRe9K8vg+
X-Gm-Gg: ASbGnctMVNljtysTekMUtwh36BHEQ4KhB6Q+Koak59RtzETDdf38I60HBbQSc/4/P/w
	0r3rPYnNHo0G1z8SbXJ0jMb36LSt1Iv/ULdDD9ymwAj9a3sPxuLt2ij9Kx6qo4DG3Do8qkZ1J7y
	XnW++miV+NmbaRRvwdGU2Jmo9NhF/XA6+T8ZkmpguF9rM7pJF8zFntIsFW2w8A/pw17FuTNrRF0
	1zNshBToukmtrGNF4ymEe9eR3OWDFiD1zFjTpVF98PNyKyVw5GnZi4P3XLz7/G0PGJmR/jrO24C
	c+TbLzix/gKjGc40zN4=
X-Received: by 2002:a05:600c:310b:b0:43d:36c:f24 with SMTP id 5b1f17b1804b1-43ed0bde9bcmr125232355e9.13.1744032955503;
        Mon, 07 Apr 2025 06:35:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqPE09HvV1TzW6HsrZAUhDGd6C6eKqSvet6ej3keISmgUBcZKAzeGW/v0ETt6uMYcpLNkm4A==
X-Received: by 2002:a05:600c:310b:b0:43d:36c:f24 with SMTP id 5b1f17b1804b1-43ed0bde9bcmr125232055e9.13.1744032955145;
        Mon, 07 Apr 2025 06:35:55 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec366aa29sm130625395e9.39.2025.04.07.06.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 06:35:54 -0700 (PDT)
Message-ID: <3d85d4eb-15b6-431f-9244-23583a26166f@redhat.com>
Date: Mon, 7 Apr 2025 15:35:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] media: uvcvideo: Fix bandwidth issue for Alcor camera
To: chenchangcheng <ccc194101@163.com>, laurent.pinchart@ideasonboard.com,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 chenchangcheng <chenchangcheng@kylinos.cn>
References: <20250324022120.216923-1-ccc194101@163.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250324022120.216923-1-ccc194101@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 24-Mar-25 03:21, chenchangcheng wrote:
> From: chenchangcheng <chenchangcheng@kylinos.cn>
> 
> Some broken device return wrong dwMaxPayloadTransferSize fields,
> as follows:
> [  218.632537] [pid:20427,cpu6,guvcview,8]uvcvideo: Device requested 2752512 B/frame bandwidth.
> [  218.632598] [pid:20427,cpu6,guvcview,9]uvcvideo: No fast enough alt setting for requested bandwidth.
> 
> The maximum packet size of the device is 3 * 1024, according to the
> logs above, the device needs to apply for a bandwidth of 0x2a0000.
> 
> Bus 001 Device 008: ID 1b17:6684 Alcor Corp. Slave camera
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x1b17
>   idProduct          0x6684
>   bcdDevice            1.05
>   iManufacturer           1 Alcor Corp.
>   iProduct                2 Slave camera
>   iSerial                 0
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x02ad
>     bNumInterfaces          2
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower              200mA
>     Interface Association:
>       bLength                 8
>       bDescriptorType        11
>       bFirstInterface         0
>       bInterfaceCount         2
>       bFunctionClass         14 Video
>       bFunctionSubClass       3 Video Interface Collection
>       bFunctionProtocol       0
>       iFunction               4 Slave camera
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      1 Video Control
>       bInterfaceProtocol      0
>       iInterface              4 Slave camera
>       VideoControl Interface Descriptor:
> 
>       ....
> 
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0010  1x 16 bytes
>         bInterval               7
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       VideoStreaming Interface Descriptor:
>         bLength                            14
>         bDescriptorType                    36
>         bDescriptorSubtype                  1 (INPUT_HEADER)
>         bNumFormats                         1
>         wTotalLength                   0x01ef
>         bEndPointAddress                  130
>         bmInfo                              0
>         bTerminalLink                       3
>         bStillCaptureMethod                 2
>         bTriggerSupport                     1
>         bTriggerUsage                       0
>         bControlSize                        1
>         bmaControls( 0)                     0
>       VideoStreaming Interface Descriptor:
>         bLength                            11
>         bDescriptorType                    36
>         bDescriptorSubtype                  6 (FORMAT_MJPEG)
>         bFormatIndex                        1
>         bNumFrameDescriptors                9
>         bFlags                              1
>           Fixed-size samples: Yes
>         bDefaultFrameIndex                  1
>         bAspectRatioX                       0
>         bAspectRatioY                       0
>         bmInterlaceFlags                 0x00
>           Interlaced stream or variable: No
>           Fields per frame: 1 fields
>           Field 1 first: No
>           Field pattern: Field 1 only
>         bCopyProtect                        0
>       VideoStreaming Interface Descriptor:
>         bLength                            50
>         bDescriptorType                    36
>         bDescriptorSubtype                  7 (FRAME_MJPEG)
>         bFrameIndex                         1
>         bmCapabilities                   0x00
>           Still image unsupported
>         wWidth                           1920
>         wHeight                          1080
>         dwMinBitRate                248832000
>         dwMaxBitRate                1492992000
>         dwMaxVideoFrameBufferSize     6220800
>         dwDefaultFrameInterval         333333
>         bFrameIntervalType                  6
>         dwFrameInterval( 0)            333333
>         dwFrameInterval( 1)            400000
>         dwFrameInterval( 2)            500000
>         dwFrameInterval( 3)            666666
>         dwFrameInterval( 4)           1000000
>         dwFrameInterval( 5)           2000000
> 
> 	......
> 
>       VideoStreaming Interface Descriptor:
>         bLength                            42
>         bDescriptorType                    36
>         bDescriptorSubtype                  3 (STILL_IMAGE_FRAME)
>         bEndpointAddress                    0
>         bNumImageSizePatterns               9
>         wWidth( 0)                       1920
>         wHeight( 0)                      1080
>         wWidth( 1)                       2048
>         wHeight( 1)                      1536
>         wWidth( 2)                       1280
>         wHeight( 2)                       720
>         wWidth( 3)                       2592
>         wHeight( 3)                      1944
>         wWidth( 4)                       1280
>         wHeight( 4)                      1024
>         wWidth( 5)                       1280
>         wHeight( 5)                       960
>         wWidth( 6)                       1600
>         wHeight( 6)                      1200
>         wWidth( 7)                        800
>         wHeight( 7)                       600
>         wWidth( 8)                        640
>         wHeight( 8)                       480
>         bNumCompressionPatterns             0
>       VideoStreaming Interface Descriptor:
>         bLength                             6
>         bDescriptorType                    36
>         bDescriptorSubtype                 13 (COLORFORMAT)
>         bColorPrimaries                     1 (BT.709,sRGB)
>         bTransferCharacteristics            1 (BT.709)
>         bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       1
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x1400  3x 1024 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       2
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0b84  2x 900 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       3
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0c00  2x 1024 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       4
>       bNumEndpoints           1
>       bInterfaceClass        14 Video
>       bInterfaceSubClass      2 Video Streaming
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0c00  2x 1024 bytes
>         bInterval               1
> Device Qualifier (for other device speed):
>   bLength                10
>   bDescriptorType         6
>   bcdUSB               2.00
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   bNumConfigurations      1
> Device Status:     0x0000
>   (Bus Powered)
> 
> Signed-off-by: chenchangcheng <chenchangcheng@kylinos.cn>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Ricardo, do you have any more remarks about this patch ?


Regards,

Hans


> ---
>  drivers/media/usb/uvc/uvc_driver.c |  9 +++++++++
>  drivers/media/usb/uvc/uvc_video.c  | 10 ++++++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  3 files changed, 20 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index deadbcea5e22..9b1dedf9773b 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3023,6 +3023,15 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_STATUS_INTERVAL) },
> +	/* Alcor Corp. Slave camera */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x1b17,
> +	  .idProduct		= 0x6684,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_OVERFLOW_BANDWIDTH) },
>  	/* MSI StarCam 370i */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index e3567aeb0007..56f23c363870 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -262,6 +262,16 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>  
>  		ctrl->dwMaxPayloadTransferSize = bandwidth;
>  	}
> +
> +	if (stream->intf->num_altsetting > 1 &&
> +	    ctrl->dwMaxPayloadTransferSize > stream->maxpsize &&
> +	    stream->dev->quirks & UVC_QUIRK_OVERFLOW_BANDWIDTH) {
> +		dev_warn(&stream->intf->dev,
> +			 "the max payload transmission size (%d) exceededs the size of the ep max packet (%d). Using the max size.\n",
> +			 ctrl->dwMaxPayloadTransferSize,
> +			 stream->maxpsize);
> +		ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
> +	}
>  }
>  
>  static size_t uvc_video_ctrl_size(struct uvc_streaming *stream)
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 5e388f05f3fc..8b43d725c259 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -77,6 +77,7 @@
>  #define UVC_QUIRK_DISABLE_AUTOSUSPEND	0x00008000
>  #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
>  #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
> +#define UVC_QUIRK_OVERFLOW_BANDWIDTH	0x00040000
>  
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED		0x00000001
> 
> base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1


