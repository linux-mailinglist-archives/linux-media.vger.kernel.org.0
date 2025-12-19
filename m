Return-Path: <linux-media+bounces-49193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BA0CD08D8
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 16:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19F2A30ECB61
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 15:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1BD347FEC;
	Fri, 19 Dec 2025 15:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="P7wHkzvh"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CEA34844C;
	Fri, 19 Dec 2025 15:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766157454; cv=pass; b=hD25zmCOeIb4YQE7RBrgey4IKCi56pnizv51JqXEwYGltfDlL8eZIeZvhEeaDJMNpv3pfZJsAtDzdnAOx5xp4oWahlWl6ksjD838U/V5DsoQDktlkFerzRb66Y2WrtFBAXhROogo1gcyPxXDryU3loSJHCpKbl2YJEt1t289/sE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766157454; c=relaxed/simple;
	bh=TQqF5QHD3PlxKpAWgtf0THwWwt3fM/dIwF8hM79x/bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ICM9ct/K4DCbpPpSzJYBK/SdypZ0uZ2vn3arx/6rF3kSg1MHqh973WRCsSUwbDzDBxt99nNNlCgdoEHnOwYj9RVlkwEjL1veUqPCErCEIkgbuYVlb55KbPMYOpWdYYY0lCR5x+nx9xceHyLp9iPrw1MmUsQbxQZEv/ITWHXm0AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=P7wHkzvh; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1766157369; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bm/vI4Av07K8MgbWkrYeouVdDJNkQw271wGhJ6ynlun2sRNhlBKKWlnINJX8HpbDoyilnMT4jM/IyFCdcCBCfPUX5vl6ryK3st63QWdd3I5RcLR8oi4BLVlKc6ef3nuJ+ZQSBMlVB58c6glTIP8KL+NATzAXUvyE3ECN5LkvjU0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766157369; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=V54/jlYAKh6+m74SLrEA3GOC3Dhue0OTKW61NTk8Y+4=; 
	b=bmMe0rqfTY/mukfG77FJKdaLNlD2T2LfCAGoSgy8h5jyPmw7S1JwJz0/h5W3xm6bQx1utqXJawa3/vKARb3j9wcpTor6fDJLzs/hMEYgMBtxv+ap6gFPiBG4Cvhyx3bCIutiAT3j8QS0FeWvckuoK2f9ktwzqpTKjGmjQtFgv8w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766157369;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=V54/jlYAKh6+m74SLrEA3GOC3Dhue0OTKW61NTk8Y+4=;
	b=P7wHkzvhzqlbGDhCpJ5bAlXqWYCTnBu1Ed8fg9gdIBtKlspjLtLL+2qusec/NEnu
	bcRsjWwDWb5ObuDVfUUIYnOzbIhvuRqwRvvu2OOFod91rC9PztWGSU1Xgbjm4wiJd7S
	26ZYKc2MBnGEu5Lma9n6phz9DMbVzKtON5HZYTW4=
Received: by mx.zohomail.com with SMTPS id 1766157354564723.4618134255445;
	Fri, 19 Dec 2025 07:15:54 -0800 (PST)
Message-ID: <47c45858-1af9-4614-b980-d8100a382a58@collabora.com>
Date: Fri, 19 Dec 2025 10:15:51 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/17] media: rkvdec: Add support for VDPU381 and
 VDPU383
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Ricardo Ribalda <ribalda@chromium.org>,
 Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>,
 Hans de Goede <hansg@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Pavan Bobba <opensource206@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 James Cowgill <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>
References: <20251218232829.337811-1-detlev.casanova@collabora.com>
 <219DE002-BE77-4D28-9BC6-9124F099F211@gmail.com>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <219DE002-BE77-4D28-9BC6-9124F099F211@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hi Piotr,

On 12/19/25 08:50, Piotr Oniszczuk wrote:
>
>> Wiadomość napisana przez Detlev Casanova <detlev.casanova@collabora.com> w dniu 19 gru 2025, o godz. 00:28:
>>
>> These variants are found respectively in the RK3588 and RK3576 SoCs.
>> This patch only adds support for H264 and H265 in both variants.
>>
>> As there is a considerable part of the code that can be shared with the
>> already supported rkvdec decoder driver, the support for these variants
>> is added here rather than writing a new driver.
>>
>> This patch set uses the newly introduced hevc_ext_sps_[ls]t_rps v4l2
>> controls for HEVC.
>> Therefore, a patched version of userpace tools is needed for HEVC
>> support (added for GStreamer[1] and in an early stage for FFmpeg[2]).
>>
>> The DTS changes can be found in another patch set: [3]
>>
>> [1]: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9355
>> [2]: https://gitlab.collabora.com/detlev/ffmpeg
>> [3]: https://lore.kernel.org/all/20251020212009.8852-1-detlev.casanova@collabora.com/
>>
> Detlev,
>
> FYI:
>
> In my testbed with
>
> i. v7 of [1] on mainline 6.18.2
> ii ffmpeg8 v4l2_request [2]
> iii. mythv as player [3]
> iv. minimyth2 as distro [4]
> v. NO applied yours ffmpeg sps/rps hinting [5] (as i'm on ffmpeg8)
And [5] won't be compatible anymore actually, I'm waiting for the final 
version of the uapi to tackle that.
> I run set of my mpeg2/h264/hevc/vp8/vp9 samples on: rk3328. rk3399, rk3566, rk3576, rk3588 and h616 (just for brief test for potential cross-regressions)
>
> Results:
>
> a. rk3328: no any regressions; all samples are decoded ok
>
> b. rk3399: no any regressions; all samples are decoded ok
>
> c. rk3566: no any regressions (e.g. in vp9. v6 and older were regressing; v7 is ok)
VP9 improvement is expected as I added a missing reg_num multiplier in 
VP9 as spotted by Jonas.
> c.1 h264: all ok
> c.2 hevc: samples without long-term sps/rps: all ok.
> c.3 hevc: samples with long-tern sps/rps: v7 is a bit regressing here: it gives me sometimes kernel oops requiring hw. reset to bring decoder back to live.
> Exemplary oops: https://termbin.com/upju
> Older vers of your code were handling such cases without needs of hw. reset

The 3566 support doesn't need any driver changes, only device tree nodes 
using the "rockchip,rk3588-vdec" compatible ?

I'll check that oops, I haven't seen it yet.

>
> d. rk3576:
> d.1: h264: works ok - but randomly i'm getting playback with distortions like this: https://postimg.cc/Yh8Djc3L. it is avd. 1 per few playbacks.
> d.2: hevc: the same like c.1 and c.2
>
> e. rk3588
> e.1: h264: all ok
> e.2: hevc: the same like c.1 and c.2
>     
> g. h616 with cedrus: all ok.
>
> btw:
> Adding to [1] vp9 android code [6] offers me nice working vp9 hwdec accell on rk3566/3588.
>
> Great work!
Thank you, and thanks for your valuable testing !
>
> [1] https://gitlab.collabora.com/detlev/linux/-/commits/add-vdpu381-and-383-to-rkvdec-v7
> [2] https://code.ffmpeg.org/Kwiboo/FFmpeg/src/branch/v4l2-request-n8.0.1
> [3] https://github.com/MythTV/mythtv
> [4] https://github.com/warpme/minimyth2
> [5] https://gitlab.collabora.com/detlev/ffmpeg
> [6] https://github.com/dvab-sarma/android_kernel_rk_opi/commit/fd0b1b17cbdfcf0c15bc9f411cc7127105157e57
>     
>   
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

