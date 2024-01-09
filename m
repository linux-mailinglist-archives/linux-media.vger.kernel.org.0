Return-Path: <linux-media+bounces-3407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5190782864B
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 13:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA764B24C0E
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 12:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3393381DB;
	Tue,  9 Jan 2024 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IUhJG5n7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FDD38F84
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 12:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6da9c834646so2430037b3a.3
        for <linux-media@vger.kernel.org>; Tue, 09 Jan 2024 04:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704804703; x=1705409503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Sxl8/kBvhDFF/AoSIu6WVPGy6THdY3oshj1Hx9R7Rs=;
        b=IUhJG5n7gpGW0fZeq0W3YaRJW4GZ4pJWFolpckHWzKZbVi+wvvwq3bfhMB8mbXuFgm
         D+kRXYs/uz+Ddk4yOy0CTDQyG49DkF7usTNBL9WuuH+fqFEmB7BNAoC1hhVSFfI+7Hx0
         aE4QERrIESpUsmA8Vz6X/1y+qV390CawsXrTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704804703; x=1705409503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Sxl8/kBvhDFF/AoSIu6WVPGy6THdY3oshj1Hx9R7Rs=;
        b=DYS/jPCuVoixK3161T711hxQFndLyljiGnH2SR+8vY3NSaUbCMFhuUDON5FcwWVE9x
         y+a7u/DXw1BStazPdepHAPBMHgm1MPAgIElSgJ79XGFe/HLXn1Q8cPX8WSw/NewoqEex
         oKJbDTsZ3pgkuezyni66BrTlMl4F/1YyhPR6mOHcEA0hI2PAVqHavu2Es7XIUeVuDWA4
         PD+vLfCApJykycey/PLun3KzTCXneFqdFGQXOnrAaY8j6o+Wvgi0PuZhcUZxQW5r43R7
         J3teymWD1HuHm1oiGC+OGb5tcP5MVQnjkRrMInanmxN4L6NzruHXrnQmPMDTCCBPWMGA
         y/rQ==
X-Gm-Message-State: AOJu0YyQduogf++w0rF9mr++mrBbDQCiEM6bnWDRjavh12ZjxHCOtbKW
	g5NFzU7BI5AhPMHCh7DaE7WELvJn3JI4
X-Google-Smtp-Source: AGHT+IFc6rYxuOUQkU6wTWmxuuKmjNJOShljLpSpdpRfMplgFRtbGeJ3Rniw08DbwOcrhrsvP/mckw==
X-Received: by 2002:a05:6a20:a124:b0:199:fa27:9eb9 with SMTP id q36-20020a056a20a12400b00199fa279eb9mr649774pzk.95.1704804702996;
        Tue, 09 Jan 2024 04:51:42 -0800 (PST)
Received: from google.com (KD124209171220.ppp-bb.dion.ne.jp. [124.209.171.220])
        by smtp.gmail.com with ESMTPSA id i1-20020aa78b41000000b006d9af8c25easm1573919pfd.84.2024.01.09.04.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 04:51:42 -0800 (PST)
Date: Tue, 9 Jan 2024 21:51:38 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yunke Cao <yunkec@google.com>
Subject: Re: [PATCH v2] media: uvcvideo: Fix power line control for
 Shine-Optics Camera
Message-ID: <20240109125138.GC1012017@google.com>
References: <20240108-shine-v2-1-ddff959dab89@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240108-shine-v2-1-ddff959dab89@chromium.org>

On (24/01/08 14:04), Ricardo Ribalda wrote:
> The device does not implement the power line frequency control
> correctly. It is a UVC 1.5 device, but implements the control as a UVC
> 1.1 device.
> 
> Add the corresponding control mapping override.
> 
> Bus 003 Device 002: ID 3277:009e Shine-Optics Integrated Camera
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.01
>   bDeviceClass          239 Miscellaneous Device
>   bDeviceSubClass         2
>   bDeviceProtocol         1 Interface Association
>   bMaxPacketSize0        64
>   idVendor           0x3277
>   idProduct          0x009e
>   bcdDevice            0.01
>   iManufacturer           3 Shine-Optics
>   iProduct                1 Integrated Camera
>   iSerial                 2 0001
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>




[..]
> ---
> base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
> change-id: 20240108-shine-06c600d17a2a
> 
> Best regards,
> -- 
> Ricardo Ribalda <ribalda@chromium.org>

A side note: not sure what these lines are for.

