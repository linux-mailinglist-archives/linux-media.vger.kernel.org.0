Return-Path: <linux-media+bounces-15839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9397C948E3A
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 13:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D6222857AC
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2024 11:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD72A1C3F18;
	Tue,  6 Aug 2024 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="bkh98zX1"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2C31BDA83;
	Tue,  6 Aug 2024 11:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722945546; cv=pass; b=r+Sio6rJlf4cCANHjGt1wRjblRTccoUY8wGktnxFVHFV9WlCeafuLKsXE50nk0xicx8eutUMXUMbDIvSQ5x/7P8pC+adETRj3VDfhOCrjVC8CUhpwc+cBtLSAEg/ChGe+UtxkUsWugp79PgWfkgQE2ZwBSj8W51yp4gBQA4fyoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722945546; c=relaxed/simple;
	bh=AZ80Ks/bzs21qDAXLNmuk7nUGrnOLl29vWE9nLhd84g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PNgaSMhXui/cpYtGi9+e5UQZ32rxfiGwI8iIRo1Za0rDWXVGlko4vPOpe2gFZl+mQG3+8rsR/YHQaF2Y3h90/LF0X9Y7KymieWid9Dif2XjZsJZUqXOsUGT/jm64b9WjLskU5nBJQnd1tHLmjGkoYeEb4YpiSbC9pDj2dhm9vUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=bkh98zX1; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: shreeya.patel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1722945497; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OtfNcwuLHczvL3PGe4brG2g1/ATYA97GUqWrNCS/kqHaAIUyU72cHXqkBi99QibOGMTF3ox31D4V+j5tlTZUWOK6f3A1CO29Z172tYrnokLc2Jox7lUaAmZuPxAzbgZofHuGtfE+RWKhujZotdvgsGZmKXcgOfqHpd7DFa5pqeo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722945497; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GUl7n+rnOu9EMuo1/gD5MP5eCxVNnOpkTAodKwwv4e4=; 
	b=D6wxYgNk7hdmVztiEz/yP34x3N93lsoFngMqeTPkDNGl3eVbuZhVPuKtL4R2m6MKJ9N1bk54OsSsCwu5sgPX22ea4U6hyvwTKoegMgwIqzkIy+W4Rca6BOQtB7s9RcHhelBrThoSWgNw9r3PeZztsotU7caqFdlce42LiKmQWCk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722945497;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=GUl7n+rnOu9EMuo1/gD5MP5eCxVNnOpkTAodKwwv4e4=;
	b=bkh98zX1F1CBHoTSUQkD8/YaKz3/kdxoxgoAVVYS4lgnhSmRXKzMtugxJQXTTmDy
	TepE5MqSGt9XcEpgHQpA4eQB8el87wBucUDXmlkJ2tIioRmL1baacIwojDSW45WoYQ+
	qWwB3jg7KP6b25eVzzB+RYJ9I743gvVCZIlnI28I=
Received: by mx.zohomail.com with SMTPS id 1722945495133332.7271484161171;
	Tue, 6 Aug 2024 04:58:15 -0700 (PDT)
Message-ID: <929d2f50-6b0e-4d1e-a6d3-482d615bd06a@collabora.com>
Date: Tue, 6 Aug 2024 14:58:08 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Add Synopsys DesignWare HDMI RX Controller
To: Tim Surber <me@timsurber.de>, Shreeya Patel
 <shreeya.patel@collabora.com>, heiko@sntech.de, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
 <6f5c4ebb-84ab-4b65-9817-ac5f6158911f@timsurber.de>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <6f5c4ebb-84ab-4b65-9817-ac5f6158911f@timsurber.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 8/4/24 02:57, Tim Surber wrote:
> Hi Shreeya,
> 
> I tested your patch and noticed problems when using 3840x2160 resolution
> at  60fps.
> 
> For my testing I connected an HDMI source and set it to 4k60fps. I
> verified that this source and the cables work on a screen at this
> resolution.
> 
> Using
> 'v4l2-ctl --verbose -d /dev/video1
> --set-fmt-video=width=3840,height=2160,pixelformat='NV12'
> --stream-mmap=4 --stream-skip=3 --stream-count=100 --stream-poll'
> I get the video format output, but not the periodic output which shows
> the fps.
> 
> Using
> 'GST_DEBUG=4 gst-launch-1.0 -v v4l2src device=/dev/video1 !
> fpsdisplaysink text-overlay=false video-sink="fakevideosink"'
> I get the following error message:
> 
> (gst-launch-1.0:3231): GStreamer-CRITICAL **: 01:34:39.137:
> gst_memory_resize: assertion 'size + mem->offset + offset <=
> mem->maxsize' failed
> 0:00:03.489382529  3231 0xffffa0000b90 WARN  v4l2bufferpool
> gstv4l2bufferpool.c:2209:gst_v4l2_buffer_pool_process:<v4l2src0:pool0:src> Dropping truncated buffer, this is likely a driver bug.
> 0:00:03.489421906  3231 0xffffa0000b90 WARN  bufferpool
> gstbufferpool.c:1252:default_reset_buffer:<v4l2src0:pool0:src> Buffer
> 0xffff98008e80 without the memory tag has maxsize (8294400) that is
> smaller than the configured buffer pool size (12441600). The buffer will
> be not be reused. This is most likely a bug in this GstBufferPool subclass
> 
> 
> Everything works with 4k30fps or 1080p 60fps. The hardware should
> support 4k60fps.

Please do `echo 3 > /sys/module/synopsys_hdmirx/parameters/debug` and
show the kernel log of capturing 4k@60 with v4l2-ctl.

-- 
Best regards,
Dmitry


