Return-Path: <linux-media+bounces-15162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB68937DBC
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 00:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 932FC1F219AC
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 22:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3311A14884F;
	Fri, 19 Jul 2024 22:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="czBk/us4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02551362
	for <linux-media@vger.kernel.org>; Fri, 19 Jul 2024 22:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721426997; cv=none; b=pML8eGk5eKkhZ8Ot0/Id4WuKGdgg/JZDYswuHZAD9SolbbrGsjC1KHAbwjVWuz2IvBhOoy9tKzDAAIsDDpn7dVk7mDyEZTgT2XX524iNQUGi9Gw+7d6okv2bgYejzc5Bsg2Xtit4kHTBYVNqfBSPLuMBdBHrV9svX5V6/NifUmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721426997; c=relaxed/simple;
	bh=M+d+w4Jd+viuql4BdMgmT6M5swLNmrBdggtLJAHua3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gs7QDZAr5DZeeZpjChiLmehZRcNBhKwZ+n52MAdMiCwkv2PIDyK9ASAh2LXa9F0gafjif/ltGahp1IRe+dTVTk66MgNqHw1qqeNxEFggsLNpc6L1tR+czv8H9w2Gm071CSId8Ihl9c6oGGVT2spCH1PjRsBExr5YPZ350RxTynw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=czBk/us4; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1721426989;
 bh=jzx7v1yYS7XEcLUo5OWbcCcit0pq0czWKq4AncgrZzs=;
 b=czBk/us4ImfY7tYAykNB3LaPB7NUlDH7P7AvrqM0Gm8ddEXbmPjM+yRRhBS+azsiysSeAjUXH
 oJgCd/PV3Da31iXO8wC9zsGXSaTuBwjmlNy1JIC7nRDfxedBHdE++/5A5F3WuBGJ1z6s1zGf/F0
 x6bOwZXGojTrggwFZ8kJ7uON96GiPPENDu/cMb6JFPv984R3zRz2Kni+IoK3ri+rZDubAabFFlf
 LNtLyh2g5xAAs3FBq5eqIDK+b74fSmKVudjLi9y3vdfPMvdVFa8vJpsxUiFtjoN2HXHD55DVyQf
 LuYfULCQRwE+QvDjh6WhPy68k/ZYcRtGD9i/zTQbKG0g==
Message-ID: <d060ec49-9d48-44a3-8f90-5cee5fe29b75@kwiboo.se>
Date: Fri, 19 Jul 2024 23:59:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Enumerate all pixels formats
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, mchehab@kernel.org,
 ezequiel@vanguardiasur.com.ar
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com
References: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
 <07f62fbb-d1eb-41c3-86a8-13a082a8374f@xs4all.nl>
 <743e2589-c0df-461d-97d4-fafe78c334ea@collabora.com>
 <98f5cd5c-cb9c-45ca-a7c7-a546f525c393@xs4all.nl>
 <2eec786d-f2b6-4445-87f4-4b6d162a2d9a@collabora.com>
 <dc423e4144e1c9ea32f6adbaa8319e38f1443896.camel@ndufresne.ca>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <dc423e4144e1c9ea32f6adbaa8319e38f1443896.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 669ae1b7e37ad464ebb10862

Hi,

On 2024-07-19 17:36, Nicolas Dufresne wrote:
> Hi,
> 
> Le vendredi 19 juillet 2024 à 15:47 +0200, Benjamin Gaignard a écrit :
>>> What exactly is the problem you want to solve? A real-life problem, not a theoretical
>>> one :-)
>>
>> On real-life: on a board with 2 different stateless decoders being able to detect the
>> one which can decode 10 bits bitstreams without testing all codec-dependent controls.
> 
> That leans toward giving an answer for the selected bitstream format though,
> since the same driver may do 10bit HEVC without 10bit AV1.
> 
> For the use case, both Chromium and GStreamer have a need to categorized
> decoders so that we avoid trying to use decoder that can't do that task. More
> platforms are getting multiple decoders, and we also need to take into account
> the available software decoders.
> 
> Just looking at the codec specific profile is insufficient since we need two
> conditions to be met.
> 
> 1. The driver must support 10bit for the specific CODEC (for most codec this is
> profile visible)
> 2. The produced 10bit color format must be supported by userspace
> 
> In today's implementation, in order to test this, we'd need to simulate a 10bit
> header control, so that when enumerating the formats we get a list of 10bit
> (optionally 8bit too, since some decoder can downscale colors) and finally
> verify that these pixel formats are know by userspace. This is not impossible,
> but very tedious, this proposal we to try and make this easier.

I have also been wondering what the use-case of this would be, and if it
is something to consider before a FFmpeg v4l2-request hwaccel submission.

I am guessing GStreamer may need to decide what decoder to use prior to
bitstream parsing/decoding has started?

For my re-worked FFmpeg v4l2-request hwaccel series, should hit
ffmpeg-devel list any day now, we try to probe each video device one
by one trying to identify if it will be capable to decode current stream
into a known/supported capture format [1], this typically happen when
header for first slice/frame has been parsed and is used to let driver
select its preferred/optimal capture format. The first device where all
test passes will be used and if none works FFmpeg video players will
typically fallback to use software decoding.

This type of probing may be a little bit limiting and depend too heavy
on the M2M Stateless Video Decoder Interface "It is suggested that the
driver chooses the preferred/optimal format for the current
configuration.".

Would you suggest I change how this probing is happening to make some
more clever detection of what media+video device should be used for a
specific stream with help of this new flag?

[1] https://github.com/Kwiboo/FFmpeg/blob/v4l2request-2024-v2/libavcodec/v4l2_request_probe.c#L373-L424

Regards,
Jonas

> 
> Nicolas
> 
> 


