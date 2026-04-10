Return-Path: <linux-media+bounces-58464-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIIKNH1E2GnfaggAu9opvQ
	(envelope-from <linux-media+bounces-58464-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 02:29:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD823D0CDE
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 02:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 338343027B48
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 00:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFB627A123;
	Fri, 10 Apr 2026 00:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="XtZi/FD/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453BD285C91
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 00:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775780942; cv=none; b=ZSEJnnodWNZDkiIWMmbwWOQsanc8DluUqXyrYFYEYvkItHGhD8Lww/duH3pyLKL6FR9n5yLT5Ch4B0haVEHaZKZu6SxcrKFwDjuElaaD2/UQ+zlCn+fKMyTyc67q1dKDDGeWl2eixbS35pisigYQTBzcG49CzJzdz4dLYC63liQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775780942; c=relaxed/simple;
	bh=jNGFEqRTuA1rK7FQImMYEitF6WnrL+AS0oJ9mCt/1kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ay7uSfWO3lt/L7lxJFmIC2Nfe2J/U6LFmF7NcayWggUNGBK+FZmFZRO/LfA/SunftHNpi4LhixvXcdLZYuAtzrnrn3pZamAo9iL5BpQ9VcfG7sGw12r96WswhMXG+AzuOkLwzf4QQFgxGQ2XnfVJqmXZceLLfCSaujK8rqFte4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=XtZi/FD/; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1271257ae53so8686366c88.1
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 17:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775780939; x=1776385739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljGOLNpsj8gz+W+xVCdieG+bhk05WCGPLoJdAt14GWE=;
        b=XtZi/FD/ORg39mhb+rhnx6xZUGZ9rKG0BHbWQHNR/SUY0bLYrJpD6jeHL1HrxmdzqR
         SnTobTV5EQ/ZKPbmKjm4bH7fdtFHXX0HWRtbfvUYxhuvErTiFw9Krh8HxgUul9T6azqO
         pO13iJsf1P9PCgVVMgFj06S+i78HA7MR1Nj9cdsbx9iFUqyxf/jkYa6+vDlTlB1tNxgK
         t7RERfHGhvqNOqD8hw4JKUIAkySAJRFgdr7pU+b5hkWGCEkPp8pomYe41W/6BdSf2GEY
         Ay3WFnvwQTtL2uavg0iAFlh3WUZAgComcVeV45OvkVKdN1DH6y8/CBGc5ClSVnS7jKXb
         AL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775780939; x=1776385739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ljGOLNpsj8gz+W+xVCdieG+bhk05WCGPLoJdAt14GWE=;
        b=VUHZkJldXf4R7/UJSauWDQjyRsDbNgOx/61XRQHoPjRYm5f5Sru+fjpmRe+K3ODytz
         C6i9SRc0l+wtG7+4zDbzBxnapHPha7VadfgYIw3Kk8ejT1n6pJucQzlXk7wRFvjNoOwx
         C9HlzXrFvFnthOckSQlYRcWAEZ1QGOt0HQIn6KjmzZvTqUUMwBVGPiASRoVv+/+e/z5w
         XL0V82d+WSc6yHr5A7RE5Adjah+Vabab+PPaRLHT33ooF/9IuiW6kZR5Lhq+5KPDbyUh
         upMzNkStJPzu82qOLrjg5vO0QSm61kxWSpSXfjc/1FtU0Uirbrf/K+Ie/lNCaon0rPJA
         OLSg==
X-Gm-Message-State: AOJu0YwKdcV72N1Cz2AM69KohopJGS2ilonwDa9zF6aGHog/vJTqhL+s
	cok3ydk15Yo5DLPZYyLEESDw7vcMaLKneiBL2FoO5i0IIxVsPorKxBNl4k9ExVa1/w==
X-Gm-Gg: AeBDiesL9CHS0O8Xd1nYlkDE3VpQRm8jKeoLfxrdWl4XdiZ/XD9H35V+Mqge1xZaqto
	7lAwOcDaKf3KU+PGAoeMbeP7ZSdMrvNhjd2FzpiMedPXHtDLVpXhNSEeE2e9doKDs9peWdvfYG3
	0qX+DfPIivvJh4A6QQXiMcCbrl8s1bIYyO6/Dv4kyFXblKOs1ciLLEdE0orObLAkU1Y6CRvoPBH
	R4mFrhiY1xuoJY4r7tM5o8u0sqxezEbvxyWkNepDugfewNNxpE6fn3bNzZMm4FP6FpcjWQh7kd6
	YbQBa/rWNZPB1i3R3TSo4/l0dZRdVQjH/y/2VQjRLA4GeTkDOnXnDsTDo9l1boa9KXXRNLQre4q
	WbMb14R87Qp/H1+ieWj2iPa9K23RzLeIPzmqwQd3sg5SRVE+5Uxp3Lv1jHFxz+9sC8ArxL7UBka
	cNwuymgcFVQHmbdbv0V1MCIPqpiBjimu1cieOTxh8mEe7eXKlZhC+xiTeGBKgG/V7QqzN9hfJI7
	6RaU2mFtQh9l1FcMSUZaiwqJ5I=
X-Received: by 2002:a05:7022:6721:b0:12a:7181:2eff with SMTP id a92af1059eb24-12c34e68ea7mr640923c88.4.1775780939166;
        Thu, 09 Apr 2026 17:28:59 -0700 (PDT)
Received: from katana.dragonfish-mirfak.ts.net ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346eb162sm1400680c88.11.2026.04.09.17.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 17:28:58 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	JP Hein <jp@jphein.com>
Subject: [PATCH v7 2/2] media: uvcvideo: add Razer Kiyo Pro to device info table
Date: Thu,  9 Apr 2026 17:28:31 -0700
Message-ID: <20260410002831.1046407-3-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410002831.1046407-1-jp@jphein.com>
References: <20260331003806.212565-1-jp@jphein.com>
 <20260410002831.1046407-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chromium.org,gmail.com,jphein.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58464-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jphein.com:dkim,jphein.com:email,jphein.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0DD823D0CDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a device entry for the Razer Kiyo Pro (1532:0e05) with quirks to
work around firmware bugs that crash the xHCI host controller:

  UVC_QUIRK_CTRL_THROTTLE   - rate-limit control transfers to prevent
                               firmware lockup under sustained load
  UVC_QUIRK_DISABLE_AUTOSUSPEND - prevent runtime suspend
  UVC_QUIRK_NO_RESET_RESUME - skip post-reset reinitialization

The firmware (v1.5.0.1) has two failure modes: it stalls endpoints
under rapid control transfers (~25 without delay), and it fails to
reinitialize properly after USB power state transitions. Both can
cascade into xHCI controller death, disconnecting all USB devices on
the bus.

Bug reproduced on two separate Kiyo Pro units running simultaneously,
confirming the issue is not unit-specific.

lsusb -vv:

  Bus 002 Device 002: ID 1532:0e05 Razer USA, Ltd Razer Kiyo Pro
  Device Descriptor:
    bLength                18
    bDescriptorType         1
    bcdUSB               3.20
    bDeviceClass          239 Miscellaneous Device
    bDeviceSubClass         2 [unknown]
    bDeviceProtocol         1 Interface Association
    bMaxPacketSize0         9
    idVendor           0x1532 Razer USA, Ltd
    idProduct          0x0e05 Razer Kiyo Pro
    bcdDevice            8.21
    iManufacturer           1 Razer Inc
    iProduct                2 Razer Kiyo Pro
    iSerial                 0
    bNumConfigurations      1
    Configuration Descriptor:
      bLength                 9
      bDescriptorType         2
      wTotalLength       0x05b4
      bNumInterfaces          4
      bConfigurationValue     1
      iConfiguration          0
      bmAttributes         0x80
        (Bus Powered)
      MaxPower              896mA
      Interface Association:
        bLength                 8
        bDescriptorType        11
        bFirstInterface         0
        bInterfaceCount         2
        bFunctionClass         14 Video
        bFunctionSubClass       3 Video Interface Collection
        bFunctionProtocol       0
        iFunction               0
      Interface Descriptor:
        bLength                 9
        bDescriptorType         4
        bInterfaceNumber        0
        bAlternateSetting       0
        bNumEndpoints           1
        bInterfaceClass        14 Video
        bInterfaceSubClass      1 Video Control
        bInterfaceProtocol      0
        iInterface              0
        VideoControl Interface Descriptor:
          bLength                13
          bDescriptorType        36
          bDescriptorSubtype      1 (HEADER)
          bcdUVC               1.00
          wTotalLength       0x0069
          dwClockFrequency       30.000000MHz
          bInCollection           1
          baInterfaceNr( 0)       1
        VideoControl Interface Descriptor:
          bLength                 9
          bDescriptorType        36
          bDescriptorSubtype      3 (OUTPUT_TERMINAL)
          bTerminalID             4
          wTerminalType      0x0101 USB Streaming
          bAssocTerminal          0
          bSourceID               2
          iTerminal               0
        VideoControl Interface Descriptor:
          bLength                27
          bDescriptorType        36
          bDescriptorSubtype      6 (EXTENSION_UNIT)
          bUnitID                 2
          guidExtensionCode         {2c49d16a-32b8-4485-3ea8-643a152362f2}
          bNumControls            6
          bNrInPins               1
          baSourceID( 0)          6
          bControlSize            2
          bmControls( 0)       0x3f
          bmControls( 1)       0x00
          iExtension              0
        VideoControl Interface Descriptor:
          bLength                27
          bDescriptorType        36
          bDescriptorSubtype      6 (EXTENSION_UNIT)
          bUnitID                 6
          guidExtensionCode         {23e49ed0-1178-4f31-ae52-d2fb8a8d3b48}
          bNumControls            5
          bNrInPins               1
          baSourceID( 0)          3
          bControlSize            2
          bmControls( 0)       0xff
          bmControls( 1)       0x7f
          iExtension              0
        VideoControl Interface Descriptor:
          bLength                18
          bDescriptorType        36
          bDescriptorSubtype      2 (INPUT_TERMINAL)
          bTerminalID             1
          wTerminalType      0x0201 Camera Sensor
          bAssocTerminal          0
          iTerminal               0
          wObjectiveFocalLengthMin      0
          wObjectiveFocalLengthMax      0
          wOcularFocalLength            0
          bControlSize                  3
          bmControls           0x00020a2e
            Auto-Exposure Mode
            Auto-Exposure Priority
            Exposure Time (Absolute)
            Focus (Absolute)
            Zoom (Absolute)
            PanTilt (Absolute)
            Focus, Auto
        VideoControl Interface Descriptor:
          bLength                11
          bDescriptorType        36
          bDescriptorSubtype      5 (PROCESSING_UNIT)
        Warning: Descriptor too short
          bUnitID                 3
          bSourceID               1
          wMaxMultiplier          0
          bControlSize            2
          bmControls     0x0000175b
            Brightness
            Contrast
            Saturation
            Sharpness
            White Balance Temperature
            Backlight Compensation
            Gain
            Power Line Frequency
            White Balance Temperature, Auto
          iProcessing             0
          bmVideoStandards     0xff
            None
            NTSC - 525/60
            PAL - 625/50
            SECAM - 625/50
            NTSC - 625/50
            PAL - 525/60
        Endpoint Descriptor:
          bLength                 7
          bDescriptorType         5
          bEndpointAddress     0x85  EP 5 IN
          bmAttributes            3
            Transfer Type            Interrupt
            Synch Type               None
            Usage Type               Data
          wMaxPacketSize     0x0040  1x 64 bytes
          bInterval               8
          bMaxBurst               0
      Interface Descriptor:
        bLength                 9
        bDescriptorType         4
        bInterfaceNumber        1
        bAlternateSetting       0
        bNumEndpoints           0
        bInterfaceClass        14 Video
        bInterfaceSubClass      2 Video Streaming
        bInterfaceProtocol      0
        iInterface              0
        VideoStreaming Interface Descriptor:
          bLength                            17
          bDescriptorType                    36
          bDescriptorSubtype                  1 (INPUT_HEADER)
          bNumFormats                         4
          wTotalLength                   0x03e6
          bEndpointAddress                 0x81  EP 1 IN
          bmInfo                              0
          bTerminalLink                       4
          bStillCaptureMethod                 0
          bTriggerSupport                     0
          bTriggerUsage                       0
          bControlSize                        1
          bmaControls( 0)                     0
          bmaControls( 1)                     0
          bmaControls( 2)                     0
          bmaControls( 3)                     0
        VideoStreaming Interface Descriptor:
          bLength                            27
          bDescriptorType                    36
          bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
          bFormatIndex                        1
          bNumFrameDescriptors                4
          guidFormat                            {32595559-0000-0010-8000-00aa00389b71}
          bBitsPerPixel                      16
          bDefaultFrameIndex                  1
          bAspectRatioX                       0
          bAspectRatioY                       0
          bmInterlaceFlags                 0x00
            Interlaced stream or variable: No
            Fields per frame: 2 fields
            Field 1 first: No
            Field pattern: Field 1 only
          bCopyProtect                        0
        VideoStreaming Interface Descriptor:
          bLength                            54
          bDescriptorType                    36
          bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
          bFrameIndex                         1
          bmCapabilities                   0x00
            Still image unsupported
          wWidth                            640
          wHeight                           480
          dwMinBitRate                294912000
          dwMaxBitRate                294912000
          dwMaxVideoFrameBufferSize      614400
          dwDefaultFrameInterval         166666
          bFrameIntervalType                  7
          dwFrameInterval( 0)            166666
          dwFrameInterval( 1)            333333
          dwFrameInterval( 2)            416666
          dwFrameInterval( 3)            500000
          dwFrameInterval( 4)            666666
          dwFrameInterval( 5)           1000000
          dwFrameInterval( 6)           2000000
        VideoStreaming Interface Descriptor:
          bLength                            54
          bDescriptorType                    36
          bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
          bFrameIndex                         7
          bmCapabilities                   0x00
            Still image unsupported
          wWidth                            640
          wHeight                           360
          dwMinBitRate                221184000
          dwMaxBitRate                221184000
          dwMaxVideoFrameBufferSize      460800
          dwDefaultFrameInterval         166666
          bFrameIntervalType                  7
          dwFrameInterval( 0)            166666
          dwFrameInterval( 1)            333333
          dwFrameInterval( 2)            416666
          dwFrameInterval( 3)            500000
          dwFrameInterval( 4)            666666
          dwFrameInterval( 5)           1000000
          dwFrameInterval( 6)           2000000
        VideoStreaming Interface Descriptor:
          bLength                            54
          bDescriptorType                    36
          bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
          bFrameIndex                        11
          bmCapabilities                   0x00
            Still image unsupported
          wWidth                           1280
          wHeight                           720
          dwMinBitRate                884736000
          dwMaxBitRate                884736000
          dwMaxVideoFrameBufferSize     1843200
          dwDefaultFrameInterval         166666
          bFrameIntervalType                  7
          dwFrameInterval( 0)            166666
          dwFrameInterval( 1)            333333
          dwFrameInterval( 2)            416666
          dwFrameInterval( 3)            500000
          dwFrameInterval( 4)            666666
          dwFrameInterval( 5)           1000000
          dwFrameInterval( 6)           2000000
        VideoStreaming Interface Descriptor:
          bLength                            54
          bDescriptorType                    36
          bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
          bFrameIndex                        13
          bmCapabilities                   0x00
            Still image unsupported
          wWidth                           1920
          wHeight                          1080
          dwMinBitRate                1990656000
          dwMaxBitRate                1990656000
          dwMaxVideoFrameBufferSize     4147200
          dwDefaultFrameInterval         166666
          bFrameIntervalType                  7
          dwFrameInterval( 0)            166666
          dwFrameInterval( 1)            333333
          dwFrameInterval( 2)            416666
          dwFrameInterval( 3)            500000
          dwFrameInterval( 4)            666666
          dwFrameInterval( 5)           1000000
          dwFrameInterval( 6)           2000000
        VideoStreaming Interface Descriptor:
          bLength                             6
          bDescriptorType                    36
          bDescriptorSubtype                 13 (COLORFORMAT)
          bColorPrimaries                     1 (BT.709,sRGB)
          bTransferCharacteristics            1 (BT.709)
          bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
        VideoStreaming Interface Descriptor:
          bLength                            11
          bDescriptorType                    36
          bDescriptorSubtype                  6 (FORMAT_MJPEG)
          bFormatIndex                        2
          bNumFrameDescriptors                4
          bFlags                              0
            Fixed-size samples: No
          bDefaultFrameIndex                  1
          bAspectRatioX                       0
          bAspectRatioY                       0
          bmInterlaceFlags                 0x00
            Interlaced stream or variable: No
            Fields per frame: 1 fields
            Field 1 first: No
            Field pattern: Field 1 only
          bCopyProtect                        0
        VideoStreaming Interface Descriptor:
          bLength                            54
          bDescriptorType                    36
          bDescriptorSubtype                  7 (FRAME_MJPEG)
          bFrameIndex                         1
          bmCapabilities                   0x00
            Still image unsupported
          wWidth                            640
          wHeight                           480
          dwMinBitRate                294912000
          dwMaxBitRate                294912000
          dwMaxVideoFrameBufferSize      614400
          dwDefaultFrameInterval         166666
          bFrameIntervalType                  7
          dwFrameInterval( 0)            166666
          dwFrameInterval( 1)            333333
          dwFrameInterval( 2)            416666
          dwFrameInterval( 3)            500000
          dwFrameInterval( 4)            666666
          dwFrameInterval( 5)           1000000
          dwFrameInterval( 6)           2000000
        VideoStreaming Interface Descriptor:
          bLength                            54
          bDescriptorType                    36
          bDescriptorSubtype                  7 (FRAME_MJPEG)
          bFrameIndex                         7
          bmCapabilities                   0x00
            Still image unsupported
          wWidth                            640
          wHeight                           360
          dwMinBitRate                221184000
          dwMaxBitRate                221184000
          dwMaxVideoFrameBufferSize      460800
          dwDefaultFrameInterval         166666
          bFrameIntervalType                  7
          dwFrameInterval( 0)            166666
          dwFrameInterval( 1)            333333
          dwFrameInterval( 2)            416666
          dwFrameInterval( 3)            500000
          dwFrameInterval( 4)            666666
          dwFrameInterval( 5)           1000000
          dwFrameInterval( 6)           2000000
        VideoStreaming Interface Descriptor:
          bLength                            54
          bDescriptorType                    36
          bDescriptorSubtype                  7 (FRAME_MJPEG)
          bFrameIndex                        11
          bmCapabilities                   0x00
            Still image unsupported
          wWidth                           1280
          wHeight                           720
          dwMinBitRate                884736000
          dwMaxBitRate                884736000
          dwMaxVideoFrameBufferSize     1843200
          dwDefaultFrameInterval         166666
          bFrameIntervalType                  7
          dwFrameInterval( 0)            166666
          dwFrameInterval( 1)            333333
          dwFrameInterval( 2)            416666
          dwFrameInterval( 3)            500000
          dwFrameInterval( 4)            666666
          dwFrameInterval( 5)           1000000
          dwFrameInterval( 6)           2000000
        VideoStreaming Interface Descriptor:
          bLength                            54
          bDescriptorType                    36
          bDescriptorSubtype                  7 (FRAME_MJPEG)
          bFrameIndex                        13
          bmCapabilities                   0x00
            Still image unsupported
          wWidth                           1920
          wHeight                          1080
          dwMinBitRate                1990656000
          dwMaxBitRate                1990656000
          dwMaxVideoFrameBufferSize     4147200
          dwDefaultFrameInterval         166666
          bFrameIntervalType                  7
          dwFrameInterval( 0)            166666
          dwFrameInterval( 1)            333333
          dwFrameInterval( 2)            416666
          dwFrameInterval( 3)            500000
          dwFrameInterval( 4)            666666
          dwFrameInterval( 5)           1000000
          dwFrameInterval( 6)           2000000
        VideoStreaming Interface Descriptor:
          bLength                             6
          bDescriptorType                    36
          bDescriptorSubtype                 13 (COLORFORMAT)
          bColorPrimaries                     1 (BT.709,sRGB)
          bTransferCharacteristics            1 (BT.709)
          bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
        VideoStreaming Interface Descriptor:
          bLength                            28
          bDescriptorType                    36
          bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
          bFormatIndex                        3
          bNumFrameDescriptors                4
          guidFormat                            {34363248-0000-0010-8000-00aa00389b71}
          bBitsPerPixel                      16
          bDefaultFrameIndex                  1
          bAspectRatioX                       0
          bAspectRatioY                       0
          bmInterlaceFlags                 0x00
            Interlaced stream or variable: No
            Fields per frame: 2 fields
            Field 1 first: No
            Field pattern: Field 1 only
          bCopyProtect                        0
          bVariableSize                     1
        VideoStreaming Interface Descriptor:
          bLength                            54
          bDescriptorType                    36
          bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
          bFrameIndex                         1
          bmCapabilities                   0x00
            Still image unsupported
          wWidth                            640
          wHeight                           480
          dwMinBitRate                251658240
          dwMaxBitRate                503316480
          dwDefaultFrameInterval         166666
          bFrameIntervalType                  7
          dwBytesPerLine                      0
          dwFrameInterval( 0)            166666
          dwFrameInterval( 1)            333333
          dwFrameInterval( 2)            416666
          dwFrameInterval( 3)            500000
          dwFrameInterval( 4)            666666
          dwFrameInterval( 5)           1000000
          dwFrameInterval( 6)           2000000
        VideoStreaming Interface Descriptor:
          bLength                            54
          bDescriptorType                    36
          bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
          bFrameIndex                         9
          bmCapabilities                   0x00
            Still image unsupported
          wWidth                            640
          wHeight                           360
          dwMinBitRate                251658240
          dwMaxBitRate                503316480
          dwDefaultFrameInterval         166666
          bFrameIntervalType                  7
          dwBytesPerLine                      0
          dwFrameInterval( 0)            166666
          dwFrameInterval( 1)            333333
          dwFrameInterval( 2)            416666
          dwFrameInterval( 3)            500000
          dwFrameInterval( 4)            666666
          dwFrameInterval( 5)           1000000
          dwFrameInterval( 6)           2000000
        VideoStreaming Interface Descriptor:
          bLength                            54
          bDescriptorType                    36
          bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
          bFrameIndex                        15
          bmCapabilities                   0x00
            Still image unsupported
          wWidth                           1280
          wHeight                           720
          dwMinBitRate                251658240
          dwMaxBitRate                503316480
          dwDefaultFrameInterval         166666
          bFrameIntervalType                  7
          dwBytesPerLine                      0
          dwFrameInterval( 0)            166666
          dwFrameInterval( 1)            333333
          dwFrameInterval( 2)            416666
          dwFrameInterval( 3)            500000
          dwFrameInterval( 4)            666666
          dwFrameInterval( 5)           1000000
          dwFrameInterval( 6)           2000000
        VideoStreaming Interface Descriptor:
          bLength                            54
          bDescriptorType                    36
          bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
          bFrameIndex                        17
          bmCapabilities                   0x00
            Still image unsupported
          wWidth                           1920
          wHeight                          1080
          dwMinBitRate                251658240
          dwMaxBitRate                503316480
          dwDefaultFrameInterval         166666
          bFrameIntervalType                  7
          dwBytesPerLine                      0
          dwFrameInterval( 0)            166666
          dwFrameInterval( 1)            333333
          dwFrameInterval( 2)            416666
          dwFrameInterval( 3)            500000
          dwFrameInterval( 4)            666666
          dwFrameInterval( 5)           1000000
          dwFrameInterval( 6)           2000000
        VideoStreaming Interface Descriptor:
          bLength                             6
          bDescriptorType                    36
          bDescriptorSubtype                 13 (COLORFORMAT)
          bColorPrimaries                     1 (BT.709,sRGB)
          bTransferCharacteristics            1 (BT.709)
          bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
        VideoStreaming Interface Descriptor:
          bLength                            27
          bDescriptorType                    36
          bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
          bFormatIndex                        4
          bNumFrameDescriptors                4
          guidFormat                            {3231564e-0000-0010-8000-00aa00389b71}
          bBitsPerPixel                      12
          bDefaultFrameIndex                  1
          bAspectRatioX                       0
          bAspectRatioY                       0
          bmInterlaceFlags                 0x00
            Interlaced stream or variable: No
            Fields per frame: 2 fields
            Field 1 first: No
            Field pattern: Field 1 only
          bCopyProtect                        0
        VideoStreaming Interface Descriptor:
          bLength                            54
          bDescriptorType                    36
          bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
          bFrameIndex                         1
          bmCapabilities                   0x00
            Still image unsupported
          wWidth                            640
          wHeight                           480
          dwMinBitRate                221184000
          dwMaxBitRate                221184000
          dwMaxVideoFrameBufferSize      460800
          dwDefaultFrameInterval         166666
          bFrameIntervalType                  7
          dwFrameInterval( 0)            166666
          dwFrameInterval( 1)            333333
          dwFrameInterval( 2)            416666
          dwFrameInterval( 3)            500000
          dwFrameInterval( 4)            666666
          dwFrameInterval( 5)           1000000
          dwFrameInterval( 6)           2000000
        VideoStreaming Interface Descriptor:
          bLength                            54
          bDescriptorType                    36
          bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
          bFrameIndex                         2
          bmCapabilities                   0x00
            Still image unsupported
          wWidth                            640
          wHeight                           360
          dwMinBitRate                165888000
          dwMaxBitRate                165888000
          dwMaxVideoFrameBufferSize      345600
          dwDefaultFrameInterval         166666
          bFrameIntervalType                  7
          dwFrameInterval( 0)            166666
          dwFrameInterval( 1)            333333
          dwFrameInterval( 2)            416666
          dwFrameInterval( 3)            500000
          dwFrameInterval( 4)            666666
          dwFrameInterval( 5)           1000000
          dwFrameInterval( 6)           2000000
        VideoStreaming Interface Descriptor:
          bLength                            54
          bDescriptorType                    36
          bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
          bFrameIndex                         3
          bmCapabilities                   0x00
            Still image unsupported
          wWidth                           1280
          wHeight                           720
          dwMinBitRate                663552000
          dwMaxBitRate                663552000
          dwMaxVideoFrameBufferSize     1382400
          dwDefaultFrameInterval         166666
          bFrameIntervalType                  7
          dwFrameInterval( 0)            166666
          dwFrameInterval( 1)            333333
          dwFrameInterval( 2)            416666
          dwFrameInterval( 3)            500000
          dwFrameInterval( 4)            666666
          dwFrameInterval( 5)           1000000
          dwFrameInterval( 6)           2000000
        VideoStreaming Interface Descriptor:
          bLength                            54
          bDescriptorType                    36
          bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
          bFrameIndex                         4
          bmCapabilities                   0x00
            Still image unsupported
          wWidth                           1920
          wHeight                          1080
          dwMinBitRate                1492992000
          dwMaxBitRate                1492992000
          dwMaxVideoFrameBufferSize     3110400
          dwDefaultFrameInterval         166666
          bFrameIntervalType                  7
          dwFrameInterval( 0)            166666
          dwFrameInterval( 1)            333333
          dwFrameInterval( 2)            416666
          dwFrameInterval( 3)            500000
          dwFrameInterval( 4)            666666
          dwFrameInterval( 5)           1000000
          dwFrameInterval( 6)           2000000
        VideoStreaming Interface Descriptor:
          bLength                             6
          bDescriptorType                    36
          bDescriptorSubtype                 13 (COLORFORMAT)
          bColorPrimaries                     1 (BT.709,sRGB)
          bTransferCharacteristics            1 (BT.709)
          bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      Interface Descriptor:
        bLength                 9
        bDescriptorType         4
        bInterfaceNumber        1
        bAlternateSetting       1
        bNumEndpoints           1
        bInterfaceClass        14 Video
        bInterfaceSubClass      2 Video Streaming
        bInterfaceProtocol      0
        iInterface              0
        Endpoint Descriptor:
          bLength                 7
          bDescriptorType         5
          bEndpointAddress     0x81  EP 1 IN
          bmAttributes            5
            Transfer Type            Isochronous
            Synch Type               Asynchronous
            Usage Type               Data
          wMaxPacketSize     0x0400  1x 1024 bytes
          bInterval               1
          bMaxBurst               0
          Mult                    2
      Interface Descriptor:
        bLength                 9
        bDescriptorType         4
        bInterfaceNumber        1
        bAlternateSetting       2
        bNumEndpoints           1
        bInterfaceClass        14 Video
        bInterfaceSubClass      2 Video Streaming
        bInterfaceProtocol      0
        iInterface              0
        Endpoint Descriptor:
          bLength                 7
          bDescriptorType         5
          bEndpointAddress     0x81  EP 1 IN
          bmAttributes            5
            Transfer Type            Isochronous
            Synch Type               Asynchronous
            Usage Type               Data
          wMaxPacketSize     0x0400  1x 1024 bytes
          bInterval               1
          bMaxBurst              10
          Mult                    2
      Interface Association:
        bLength                 8
        bDescriptorType        11
        bFirstInterface         2
        bInterfaceCount         2
        bFunctionClass          1 Audio
        bFunctionSubClass       2 Streaming
        bFunctionProtocol       0
        iFunction               0
      Interface Descriptor:
        bLength                 9
        bDescriptorType         4
        bInterfaceNumber        2
        bAlternateSetting       0
        bNumEndpoints           0
        bInterfaceClass         1 Audio
        bInterfaceSubClass      1 Control Device
        bInterfaceProtocol      0
        iInterface              0
        AudioControl Interface Descriptor:
          bLength                 9
          bDescriptorType        36
          bDescriptorSubtype      1 (HEADER)
          bcdADC               1.00
          wTotalLength       0x0026
          bInCollection           1
          baInterfaceNr(0)        3
        AudioControl Interface Descriptor:
          bLength                12
          bDescriptorType        36
          bDescriptorSubtype      2 (INPUT_TERMINAL)
          bTerminalID             1
          wTerminalType      0x0201 Microphone
          bAssocTerminal          0
          bNrChannels             2
          wChannelConfig     0x0003
            Left Front (L)
            Right Front (R)
          iChannelNames           0
          iTerminal               0
        AudioControl Interface Descriptor:
          bLength                 9
          bDescriptorType        36
          bDescriptorSubtype      3 (OUTPUT_TERMINAL)
          bTerminalID             3
          wTerminalType      0x0101 USB Streaming
          bAssocTerminal          0
          bSourceID               5
          iTerminal               0
        AudioControl Interface Descriptor:
          bLength                 8
          bDescriptorType        36
          bDescriptorSubtype      6 (FEATURE_UNIT)
          bUnitID                 5
          bSourceID               1
          bControlSize            1
          bmaControls(0)       0x03
            Mute Control
            Volume Control
          iFeature                0
      Interface Descriptor:
        bLength                 9
        bDescriptorType         4
        bInterfaceNumber        3
        bAlternateSetting       0
        bNumEndpoints           0
        bInterfaceClass         1 Audio
        bInterfaceSubClass      2 Streaming
        bInterfaceProtocol      0
        iInterface              0
      Interface Descriptor:
        bLength                 9
        bDescriptorType         4
        bInterfaceNumber        3
        bAlternateSetting       1
        bNumEndpoints           1
        bInterfaceClass         1 Audio
        bInterfaceSubClass      2 Streaming
        bInterfaceProtocol      0
        iInterface              0
        AudioStreaming Interface Descriptor:
          bLength                 7
          bDescriptorType        36
          bDescriptorSubtype      1 (AS_GENERAL)
          bTerminalLink           3
          bDelay                  2 frames
          wFormatTag         0x0001 PCM
        AudioStreaming Interface Descriptor:
          bLength                11
          bDescriptorType        36
          bDescriptorSubtype      2 (FORMAT_TYPE)
          bFormatType             1 (FORMAT_TYPE_I)
          bNrChannels             2
          bSubframeSize           2
          bBitResolution         16
          bSamFreqType            1 Discrete
          tSamFreq[ 0]        48000
        Endpoint Descriptor:
          bLength                 9
          bDescriptorType         5
          bEndpointAddress     0x82  EP 2 IN
          bmAttributes            5
            Transfer Type            Isochronous
            Synch Type               Asynchronous
            Usage Type               Data
          wMaxPacketSize     0x00c4  1x 196 bytes
          bInterval               4
          bRefresh                0
          bSynchAddress           0
          bMaxBurst               0
          AudioStreaming Endpoint Descriptor:
            bLength                 7
            bDescriptorType        37
            bDescriptorSubtype      1 (EP_GENERAL)
            bmAttributes         0x01
              Sampling Frequency
            bLockDelayUnits         0 Undefined
            wLockDelay         0x0000
      Interface Descriptor:
        bLength                 9
        bDescriptorType         4
        bInterfaceNumber        3
        bAlternateSetting       2
        bNumEndpoints           1
        bInterfaceClass         1 Audio
        bInterfaceSubClass      2 Streaming
        bInterfaceProtocol      0
        iInterface              0
        AudioStreaming Interface Descriptor:
          bLength                 7
          bDescriptorType        36
          bDescriptorSubtype      1 (AS_GENERAL)
          bTerminalLink           3
          bDelay                  2 frames
          wFormatTag         0x0001 PCM
        AudioStreaming Interface Descriptor:
          bLength                11
          bDescriptorType        36
          bDescriptorSubtype      2 (FORMAT_TYPE)
          bFormatType             1 (FORMAT_TYPE_I)
          bNrChannels             2
          bSubframeSize           2
          bBitResolution         16
          bSamFreqType            1 Discrete
          tSamFreq[ 0]        16000
        Endpoint Descriptor:
          bLength                 9
          bDescriptorType         5
          bEndpointAddress     0x82  EP 2 IN
          bmAttributes            5
            Transfer Type            Isochronous
            Synch Type               Asynchronous
            Usage Type               Data
          wMaxPacketSize     0x0044  1x 68 bytes
          bInterval               4
          bRefresh                0
          bSynchAddress           0
          bMaxBurst               0
          AudioStreaming Endpoint Descriptor:
            bLength                 7
            bDescriptorType        37
            bDescriptorSubtype      1 (EP_GENERAL)
            bmAttributes         0x01
              Sampling Frequency
            bLockDelayUnits         0 Undefined
            wLockDelay         0x0000
      Interface Descriptor:
        bLength                 9
        bDescriptorType         4
        bInterfaceNumber        3
        bAlternateSetting       3
        bNumEndpoints           1
        bInterfaceClass         1 Audio
        bInterfaceSubClass      2 Streaming
        bInterfaceProtocol      0
        iInterface              0
        AudioStreaming Interface Descriptor:
          bLength                 7
          bDescriptorType        36
          bDescriptorSubtype      1 (AS_GENERAL)
          bTerminalLink           3
          bDelay                  2 frames
          wFormatTag         0x0001 PCM
        AudioStreaming Interface Descriptor:
          bLength                11
          bDescriptorType        36
          bDescriptorSubtype      2 (FORMAT_TYPE)
          bFormatType             1 (FORMAT_TYPE_I)
          bNrChannels             2
          bSubframeSize           2
          bBitResolution         16
          bSamFreqType            1 Discrete
          tSamFreq[ 0]        24000
        Endpoint Descriptor:
          bLength                 9
          bDescriptorType         5
          bEndpointAddress     0x82  EP 2 IN
          bmAttributes            5
            Transfer Type            Isochronous
            Synch Type               Asynchronous
            Usage Type               Data
          wMaxPacketSize     0x0064  1x 100 bytes
          bInterval               4
          bRefresh                0
          bSynchAddress           0
          bMaxBurst               0
          AudioStreaming Endpoint Descriptor:
            bLength                 7
            bDescriptorType        37
            bDescriptorSubtype      1 (EP_GENERAL)
            bmAttributes         0x01
              Sampling Frequency
            bLockDelayUnits         0 Undefined
            wLockDelay         0x0000
      Interface Descriptor:
        bLength                 9
        bDescriptorType         4
        bInterfaceNumber        3
        bAlternateSetting       4
        bNumEndpoints           1
        bInterfaceClass         1 Audio
        bInterfaceSubClass      2 Streaming
        bInterfaceProtocol      0
        iInterface              0
        AudioStreaming Interface Descriptor:
          bLength                 7
          bDescriptorType        36
          bDescriptorSubtype      1 (AS_GENERAL)
          bTerminalLink           3
          bDelay                  2 frames
          wFormatTag         0x0001 PCM
        AudioStreaming Interface Descriptor:
          bLength                11
          bDescriptorType        36
          bDescriptorSubtype      2 (FORMAT_TYPE)
          bFormatType             1 (FORMAT_TYPE_I)
          bNrChannels             2
          bSubframeSize           2
          bBitResolution         16
          bSamFreqType            1 Discrete
          tSamFreq[ 0]        32000
        Endpoint Descriptor:
          bLength                 9
          bDescriptorType         5
          bEndpointAddress     0x82  EP 2 IN
          bmAttributes            5
            Transfer Type            Isochronous
            Synch Type               Asynchronous
            Usage Type               Data
          wMaxPacketSize     0x0084  1x 132 bytes
          bInterval               4
          bRefresh                0
          bSynchAddress           0
          bMaxBurst               0
          AudioStreaming Endpoint Descriptor:
            bLength                 7
            bDescriptorType        37
            bDescriptorSubtype      1 (EP_GENERAL)
            bmAttributes         0x01
              Sampling Frequency
            bLockDelayUnits         0 Undefined
            wLockDelay         0x0000
  Binary Object Store Descriptor:
    bLength                 5
    bDescriptorType        15
    wTotalLength       0x0016
    bNumDeviceCaps          2
    USB 2.0 Extension Device Capability:
      bLength                 7
      bDescriptorType        16
      bDevCapabilityType      2
      bmAttributes   0x00000006
        BESL Link Power Management (LPM) Supported
    SuperSpeed USB Device Capability:
      bLength                10
      bDescriptorType        16
      bDevCapabilityType      3
      bmAttributes         0x00
      wSpeedsSupported   0x000e
        Device can operate at Full Speed (12Mbps)
        Device can operate at High Speed (480Mbps)
        Device can operate at SuperSpeed (5Gbps)
      bFunctionalitySupport   2
        Lowest fully-functional device speed is High Speed (480Mbps)
      bU1DevExitLat          10 micro seconds
      bU2DevExitLat         256 micro seconds
  Device Status:     0x0000
    (Bus Powered)

Signed-off-by: JP Hein <jp@jphein.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 775bede..9b6df8e 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2880,6 +2880,22 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
+
+	/*
+	 * Razer Kiyo Pro -- firmware crashes under rapid control transfers
+	 * and on LPM/autosuspend resume, cascading into xHCI controller
+	 * death that disconnects all USB devices on the bus.
+	 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x1532,
+	  .idProduct		= 0x0e05,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_CTRL_THROTTLE
+					| UVC_QUIRK_DISABLE_AUTOSUSPEND
+					| UVC_QUIRK_NO_RESET_RESUME) },
 	/* Kurokesu C1 PRO */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
2.43.0


