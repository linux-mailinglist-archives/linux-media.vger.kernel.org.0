Return-Path: <linux-media+bounces-17666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBF396D684
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 12:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93F841C2367A
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 10:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9445D1991BA;
	Thu,  5 Sep 2024 10:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A/cKexi0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841031990BC;
	Thu,  5 Sep 2024 10:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725533864; cv=none; b=qlBQX0ZqQ4tj/wPn3+WpWIx/p72oGT5L1rX8e2CRZL0c5pH7I0SeKd6LLYSbmXIo0lbk8KjmA3s1MHtzouyCBATROp7fQiaBDT34FgRvNJ0nvuZBo9jwItHaGxojomDVEzRXO4WmCV/wlsWG28NiVFAjgQGZGJg5cnd5Frp1bQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725533864; c=relaxed/simple;
	bh=4lcWVFFe95tKLdrn4zflmv1HKktKQEoGhVTAo3Nh+Cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQUz0Yty6qRalKvyKKvyNjVCla9WVhw52MQ7NgPZdnPQbmlKzkyphMt9hzr/VTR6uEiHeNCnGxLnDJDLoUAwGMo0s/1/0Iypz5z2LGixqiC1FXS2qNmwKBw4EPa9i2rinwPKC15MdSmWVra9jBjBf7VJrjW20Rv2fWbSd5peNRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A/cKexi0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38D57AD0;
	Thu,  5 Sep 2024 12:56:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725533786;
	bh=4lcWVFFe95tKLdrn4zflmv1HKktKQEoGhVTAo3Nh+Cs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A/cKexi0iRE2TsNd6nG6S4gnpjSvSRaAkFfvWSk+maG+uKxRhfFZm7RpWagwHZqQV
	 dVLJ/WvJJljpBsueBIH+4axvl2UQckj9ZcjXkguJ9UQRrIwVPZdoWC4RAtByPY/Tuf
	 KQfFpMjPNSXJDwKoHKYIUbR1RiPrxCdvB1Dh9H5c=
Message-ID: <1eead6a9-87c7-409d-abd6-32c4d0dafe05@ideasonboard.com>
Date: Thu, 5 Sep 2024 13:57:36 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/12] media: ov5645: Add support for streams
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <3eeae62a-e22b-443a-aad4-f1a384c0a3f7@ideasonboard.com>
 <514490a2-181a-42ac-bc54-7a700e8d1bb9@ideasonboard.com>
 <CA+V-a8v0s8Unk3pNhR1wgBk_wqkua__Dumq3KT=n-cXUwq=6Bw@mail.gmail.com>
 <c928e09a-751e-45af-8e57-f105b41df2be@ideasonboard.com>
 <CA+V-a8svfVrjEjYbSko4eh6z_9kEkfwMHr0YHwaxEPWLKJBPyg@mail.gmail.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <CA+V-a8svfVrjEjYbSko4eh6z_9kEkfwMHr0YHwaxEPWLKJBPyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/09/2024 13:51, Lad, Prabhakar wrote:
> Hi Tomi,
> 
> On Thu, Sep 5, 2024 at 11:29 AM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>>
>> On 05/09/2024 13:27, Lad, Prabhakar wrote:
>>> Hi Tomi,
>>>
>>> On Thu, Sep 5, 2024 at 10:11 AM Tomi Valkeinen
>>> <tomi.valkeinen@ideasonboard.com> wrote:
>>>>
>>> <snip>
>>>>> I think you actually want 1/0->0/0 routing. The error says that the sink
>>>>> side device has routing which does not have a stream at stream ID 1, or
>>>>> no routing support at all, which implies a single stream at stream ID 0.
>>>>
>>>> Looking at patch 12, there's something wrong with the approach here. Are
>>>> you perhaps trying to define the CSI-2 VC with the streams?
>>>>
>>> Yes, based on the previous feedback received, I am implementing
>>> virtual channels as streams. If this isn't the correct approach can
>>> you please guide me on what we should be using to support virtual
>>> channels?
>>
>> Can you describe what kind of hardware you have and how the VCs are
>> supposed to be configured and used there?
>>
> 
>   __________________                       ______________
>      _____________________
> |                                     |                     |
>                  |                   |
>        |
> | OV5645   Sensor        |                     |  RZ/G2L CSI2   |
>               |  RZ/G2L CRU                 |
> | 1ch out of 4x VC         |---------------> |   4x VC
> |-------------->|  1Ch capture out 4xVC  |
> |__________________|                      |_____________|
>       |____________________|

The formatting there is quite broken, but afaiu you have a standard 
setup with single stream. Then it should be as I wrote earlier: a single 
hardcoded 1/0->0/0 route in the sensor, and .get_frame_desc() returns VC 
0 and a suitable DT for that stream.

When you say "implementing virtual channels as streams", what is the 
feature/requirement you are looking at? Do you have some specific need 
to use other VCs than 0?

  Tomi


