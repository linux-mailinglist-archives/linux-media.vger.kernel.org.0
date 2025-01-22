Return-Path: <linux-media+bounces-25108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF98A18D46
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 09:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5BC1169FF6
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 08:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312F61C1F19;
	Wed, 22 Jan 2025 08:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="am2S9dSp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6588F7D;
	Wed, 22 Jan 2025 08:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737532992; cv=none; b=EWypVTuOzcp3YfJfsRfwEesZtspdTN6OjHQj42uyMROObqfcx4pPZE+H+QST3QdosTiOPoSMOFC5b6qivBK6SAHoPbi07YkZiWti4NPodR3FBkcnEcd7PKV4K/Fwun9ASdGKfrRxxDF1OUIjrJmL1WOov/WItbmuM5HsEWmFfjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737532992; c=relaxed/simple;
	bh=ZP1ZSezyyTR4lNNM/FV1siamelR8JyNobbsg4iT4/zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MS1PEBTxkQGYdY5jkjOtgn4/3FGndne/MV4D4LEXwCx+W8ElPvhW2F7lSIYBkunuatPgsUA/2uYRe/mfDP7Daf6TGtBfDznBN4CIyuRaUZD/Geu3ZGO2+sOfsIgmj17u0xHwv47PxVnMW3ZoJeaHEmXdlU/nrbfKaQF8mGWsQcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=am2S9dSp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6993C1E6;
	Wed, 22 Jan 2025 09:01:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737532919;
	bh=ZP1ZSezyyTR4lNNM/FV1siamelR8JyNobbsg4iT4/zw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=am2S9dSp/+6QlMtH/TG9muq/gmke41xhb9QCeRiwIh54BtlaxmPnrFb3EkvibYtpx
	 tBPEc91ysw8ZmLz2w+hgfAD66U3TQkBwuwGUN3te0PkBcCvDTZhMBd+PxoJqOnqS7x
	 FufudRNaUiiHC0lJY4WwUyEFZG1oLuN2jBxzHXQk=
Message-ID: <a0e38115-87c7-4145-b9d0-fb8f8ea1fcf7@ideasonboard.com>
Date: Wed, 22 Jan 2025 10:02:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] media: rcar: Minor cleanups and improvements
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
 <20250121212448.GA3302176@ragnatech.se>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250121212448.GA3302176@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 21/01/2025 23:24, Niklas Söderlund wrote:
> Hi Tomi,
> 
> Thanks for a great cleanup series!
> 
> On 2025-01-20 15:10:33 +0200, Tomi Valkeinen wrote:
>> I've started looking at multi-stream support, and came up with these
>> while working towards streams.
>>
>>   Tomi
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> I have tested this in Gen2, Gen3 and Gen4 without noticing any
> regressions. The log is now spammed with the helpful suggestion that the
> CSI-2 TX subdevices shall implement V4L2_CID_LINK_FREQ control. This is
> annoying but out of scope for this series, but would be nice at some
> point.
> 
>    [   37.421531] v4l2_get_link_freq: Link frequency estimated using pixel rate: result might be inaccurate
>    [   37.430991] v4l2_get_link_freq: Consider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver

Which drivers need fixing? The staging max96712 is one (there seems to 
be a TODO there about it), and adv748x? I'm not going to work on that 
right now, but just collecting the details.

> For the whole series,
> 
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks!

  Tomi


