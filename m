Return-Path: <linux-media+bounces-18190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A509766FA
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 12:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D44491C20C6E
	for <lists+linux-media@lfdr.de>; Thu, 12 Sep 2024 10:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165BE19DFAC;
	Thu, 12 Sep 2024 10:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eOB6zuBV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE0518BC07
	for <linux-media@vger.kernel.org>; Thu, 12 Sep 2024 10:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726138349; cv=none; b=nYd+mtDmTT1fP0Z7w0DDH26WvC1i8FHvYmJfpqQpyKKkbEH8T9dywzQsJk0k0MXEoJ0byMab/GoNZpDCVr4f4j1l5Pv2tJIOHT5RmgXqF3Mtkj6vTLH4/uPHcQYvYGaVEPydIeo1ZxaDgAGfUD7kYdK3ynkjW9FqDjYMzpRANKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726138349; c=relaxed/simple;
	bh=KeKELVs2JuC0c0gKDvmFJy9+60D4f5POGSqXiBMxkQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBl9EOB+kVeTYrnTT4dPijDenjon5VhKjJpIkjVm/NeYSBG6ixNk7bUPw4xcErlVOOwKHN5SsRwO+prcHPY9+rsWbEuJhIEcZqpj1NpLzr6Vbpl2JpeZM+7YDZ66AGyjC02T4A/RC580X4DzpLffaJtB9ub/LhklFSVCChmur68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eOB6zuBV; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-718d962ad64so636560b3a.0
        for <linux-media@vger.kernel.org>; Thu, 12 Sep 2024 03:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726138346; x=1726743146; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ebg81fYxwa/MK3KeERtWQyYLlIZTh5rUe+PaDF4wvgg=;
        b=eOB6zuBVrEuNlCPKRW2FkvqDsuQK+duI84jXB33LI0wa20J2UQ8tWOhQqsC5cMNl9w
         sP6fN4rb7yUoSZW5fvwa6ytiInm/s2DHaQjKm5Aqtt/EdLWGpgpYc7OD2gNAsVUDzDHf
         ji1ht9WmF1NOtFJ2zlaLkJtYPIiAmePqiaZfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726138346; x=1726743146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ebg81fYxwa/MK3KeERtWQyYLlIZTh5rUe+PaDF4wvgg=;
        b=GjZ4r6dzEwaamqfDsNKojEVTB9ALBQHx3q33KF3aQZbj1cB9g/A7MQoi/7LXyi1s4y
         7v5vCEROo7CZje+DOv4qZB7W7BpXMNvpw/h6a73S97b29dlcLEVGT40XpMz9eE4Nx5PN
         ldNwxcLhUS+x0lGoeo42LmaHkaItHgBvV3DHHyi0NaMe6l1K6ID6YjdxBDgNPBcrwZl5
         xZ2o5avrmV1eqlRwIpF+ikFzSXM3oE0upOAr6HtnanRD4NoSuZ7P7ylL7XBwsNxBHyTz
         Qr1rECVqCrI/3mkL8WUhFCnqw3Bud+L/cZOZPFGALOrdLWmw1fFQ36+YCd463ysvjwpq
         hY9Q==
X-Gm-Message-State: AOJu0Yw57u5gav0C1gDve8R7x8CpkNAMdQK/ONt/zq51/W5/jkfQf0oc
	wIgk0sQO/sg0RcwU9zgZFh5gNtpfDHYJ9F3c3f8KvhGfK5XAfGfLosNcOHfcyTEVrdqoOpihAPM
	=
X-Google-Smtp-Source: AGHT+IEYwSyexckAkDBvLoToZI/nMu67wZiQk3Af983yrcYSXZXbPKJYACYAYwLfx5KmdsrljoV1LQ==
X-Received: by 2002:a05:6a00:14d0:b0:717:9768:a4ed with SMTP id d2e1a72fcca58-7192609318dmr4219724b3a.16.1726138346250;
        Thu, 12 Sep 2024 03:52:26 -0700 (PDT)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com. [209.85.214.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909092655sm4353947b3a.128.2024.09.12.03.52.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 03:52:25 -0700 (PDT)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2055136b612so11437325ad.0
        for <linux-media@vger.kernel.org>; Thu, 12 Sep 2024 03:52:25 -0700 (PDT)
X-Received: by 2002:a17:903:230e:b0:206:cfb3:7232 with SMTP id
 d9443c01a7336-2076e3f3ae4mr41153425ad.48.1726138344558; Thu, 12 Sep 2024
 03:52:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALgV52gdx5m3eP88Sqa4s09qy+N4rpaZ8UHFXfphkCXZUxyNHQ@mail.gmail.com>
In-Reply-To: <CALgV52gdx5m3eP88Sqa4s09qy+N4rpaZ8UHFXfphkCXZUxyNHQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 12 Sep 2024 12:52:11 +0200
X-Gmail-Original-Message-ID: <CANiDSCuOojPtX4M9Q7DOe4sR-DpuKp1Rzzpa3NrJxV7HuzAAeg@mail.gmail.com>
Message-ID: <CANiDSCuOojPtX4M9Q7DOe4sR-DpuKp1Rzzpa3NrJxV7HuzAAeg@mail.gmail.com>
Subject: Re: No uvc video support for D3DFMT video GUIDs?
To: David Given <dg@cowlark.com>
Cc: linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi David


On Wed, 11 Sept 2024 at 21:58, David Given <dg@cowlark.com> wrote:
>
> Hello,
>
> I've just received a review sample thermal camera which doesn't work
> with Linux uvcvideo. It's reporting itself as providing a D3DFMT GUID:
>
> ---snip---
>      VideoStreaming Interface Descriptor:
>        bLength                            27
>        bDescriptorType                    36
>        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
>        bFormatIndex                        1
>        bNumFrameDescriptors                1
>        guidFormat
> {e436eb7b-524f-11ce-9f53-0020af0ba770}
>        bBitsPerPixel                      16
>        bDefaultFrameIndex                  1
>        bAspectRatioX                       0
>        bAspectRatioY                       0
>        bmInterlaceFlags                 0x00
>          Interlaced stream or variable: No
>          Fields per frame: 2 fields
>          Field 1 first: No
>          Field pattern: Field 1 only
>        bCopyProtect                        0
> ---snip---
>
> This corresponds to D3DFMT_R5G6B5 or MEDIASUBTYPE_RGB565, based on the
> reference here: https://gix.github.io/media-types/#ID0EC2AI However,
> the UVC driver is expecting RGB565 to be using the 4cc RGBP GUID
> 52474250-0000-1000-8000-00aa00389b71. This is very nearly the same as
> the alternative GUID described on the document above,
> 00000017-0000-0010-8000-00AA00389B71, which uses an index rather than
> a 4cc.
>
> I haven't been able to find any references as to what GUIDs are
> supported for guidFormat.

The uvc spec only defines GUIDs for YUY2, NV12, M420 and I420.

It would have been nice that the vendor had used the same GUID as
TomTom (Check 507910799160e85eac5e7729e0d2f1ba26f6a8cf)
but apparently it is not required to be like this.


Why dont you try adding a new mapping to  include/linux/usb/uvc.h and
drivers/media/common/uvc.c ? Similar to what Marek did here:
015d44c2b700ba9639dd29672ba362796cc0be54

I believe that if a camera does not use TomToms GUID and the new GUI,
everything would work...

Regards

>
> (a) Is the camera wrong?
> (b) Is the kernel wrong?
> (c) Am I looking at the wrong document?
>
> The easy fix is to patch the uvcvideo driver to support the e436...
> GUID, but that doesn't seem a great idea. Any suggestions?
>


-- 
Ricardo Ribalda

