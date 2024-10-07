Return-Path: <linux-media+bounces-19147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6631F992A50
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 13:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C36F1F230C2
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2024 11:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50D21D1F72;
	Mon,  7 Oct 2024 11:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="WGV5/4QO"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843FF19993E;
	Mon,  7 Oct 2024 11:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728301025; cv=pass; b=OjEgCo+4va+sc+WVksxKiKX88xdlkfjBrK51iepDb5AGPUVCmRTZEH0YlVBZEboz13vQ6sTVkSXH6RFj8fxYRbRo6EAdQUffvKYfU/4JNF/dImHUlqsvD/XIgvEgYSDJs8WmSqzRoaPhLU8vuQmxCyaRUh7fh+LzEz2OOPVnow8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728301025; c=relaxed/simple;
	bh=9oVgoUrHQCZHD3KxrLypsBR9deMmB0mxWgRyZg7m9xo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r4S9zi0Ix/ifY0HvCLfeArTxwmoav/zoONvDsnYq0jdDS4a8ftRowMtZM/s91nuViQcuvMWdxYWOzBsvwTN8xQux+ckJZUZn+GCTRxem+YG2844/kbFuhEaMt2hBWKOSdUJ4ED0KdjrGqWPKtOCf6g+424K/t8Op7iZiYsbpIvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=WGV5/4QO; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1728301004; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j4I9UWJsisQisqCf+FkGQze/j2a9UgqdHL1kN+2zZzi428esWfDDwTrXmhBfk7CqnRSGcQj1uQCCwL1U0HDeamN2BAr1AG3oJycnYdXTUQxGZi00slOyHqwBhwJcPHiU7gQ1yve0LZtoERt70Z1a2OmCXCQCxjDDbpyVB8B7YYE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1728301004; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AFKho57gUpxy4V1/EUaFr4abLL2qh3hunfyPaBeSLbY=; 
	b=NcsY+0isEI3qViBRpTT4AuRDB7qruwLtRTr4BPKtQ+T1jhc8uF70ossZsH5ZVSRBstQn4PJwb96HIuw4iZgBXYwmuMWqSLpS3pPkOoYrGM9Rit7vhY3lpdGtEcioy9XUsOh/ZEjZWmWBe+FHp3kU+tHwnddnkRzRDA7fUtTgP6A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728301004;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=AFKho57gUpxy4V1/EUaFr4abLL2qh3hunfyPaBeSLbY=;
	b=WGV5/4QOqnJQQzmDZ0VHxSvKD0Dmxz/bohQSd3ZBPKFZxiUuFUkeFzDwtXvyEs/u
	jaPWe5BequJB9CGmNSF6SturlPtsVueZi0g7soJsHTzHtpqzdMQw0VKNu85wTQwNrzC
	G5hc23cRV2rzSnaKEyJA/Jp7SUExNUtTatNIIVbo=
Received: by mx.zohomail.com with SMTPS id 1728301002132977.0168082874125;
	Mon, 7 Oct 2024 04:36:42 -0700 (PDT)
Message-ID: <557f9a0c-be89-477b-b8ee-e0bed98c2ee2@collabora.com>
Date: Mon, 7 Oct 2024 13:36:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] Enumerate all pixels formats
To: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
 hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <010201918fb76f7a-650dc960-4911-48d7-8e82-8f18243c4b71-000000@eu-west-1.amazonses.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <010201918fb76f7a-650dc960-4911-48d7-8e82-8f18243c4b71-000000@eu-west-1.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 26/08/2024 à 19:24, Benjamin Gaignard a écrit :
> The goal of this series is to help userspace applications, like Gstreamer
> or Chromium, to categorize decoders and so avoid trying to use decoder
> that can't do the require task because it won't support the needed pixel
> format.
> As example, in today implementation we need to simulate 10 bit header
> control to know if the driver support 10 bits pixel formats. With this
> new flag it will simpler for userspace applications know if driver
> support 10 bit pixel formats and if it is supported by userspace.
>
> An example of how it can be used in GStreamer to discover the
> supported pixels formats for stateless decoders is available here:
> https://gitlab.freedesktop.org/benjamin.gaignard1/gstreamer/-/commits/v4l2codecs_enum_all_supported_formats?ref_type=heads
>
> v4l2-compliance test of this flag:
> https://gitlab.collabora.com/benjamin.gaignard/v4l-utils/-/commits/enum_all_formats_v4
>
> change in version 7:
> - Rework documentation about which drivers should use the flag

Hi,

a gentle ping on this series

Thanks,
Benjamin

>
> change in version 6:
> - Change flag name.
> - Improve documentation.
> - Improve visl driver to enumerate one more pixel format when the flag
>    is used.
>
> changes in version 5:
> - Reset the proposal to follow Hans's advices
> - Add new flag to be used with index field.
> - Make vicodec and visl test driver use the new flag
> - Doing the same for Verisilicon driver.
>   
> Benjamin Gaignard (3):
>    media: videodev2: Add flag to unconditionally enumerate pixel formats
>    media: test-drivers: Use V4L2_FMTDESC_FLAG_ENUM_ALL flag
>    media: verisilicon: Use V4L2_FMTDESC_FLAG_ENUM_ALL flag
>
>   .../media/v4l/vidioc-enum-fmt.rst             | 18 ++++++++++++++++-
>   .../media/videodev2.h.rst.exceptions          |  1 +
>   .../media/platform/verisilicon/hantro_v4l2.c  | 18 ++++++++++++-----
>   drivers/media/test-drivers/visl/visl-video.c  | 20 +++++++++++++++++--
>   include/uapi/linux/videodev2.h                |  3 +++
>   5 files changed, 52 insertions(+), 8 deletions(-)
>

