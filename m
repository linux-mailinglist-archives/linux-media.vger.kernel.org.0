Return-Path: <linux-media+bounces-43244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 667A6BA3789
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 13:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26C4A624198
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 11:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598572D7DCE;
	Fri, 26 Sep 2025 11:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XPJFbsyE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B401025BF13;
	Fri, 26 Sep 2025 11:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758885744; cv=none; b=WsTLSklXz0BZP6h6dQkU+6nzrkLg/HKJwCOOIKiUCQcuOg5kBB+v+H1BvoFYmIXZwv9WVD1sc5tDXr3ty/q31RGZZVhIHGTeJCv97anEHOffKeSvyT/OgxXsrNxbASGtUDzVr5GicfvM8roxfiGl8FzQY001Oh4xEX5tkXwHBIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758885744; c=relaxed/simple;
	bh=LxiQwDak1V+pV+OqZZwUlNKvMEwfAWR0ggF+WRfn7+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fl2zUyLJAIiMiG1kKx+fWFz4UPuafa2QKHqLS1bPPosR8b78q00cUPB9qS117c1IAkzVFCyuljxZ3DaIbLVmlAoEz7+VYmxvmlbkAyxZ0q7SiReyEJ0Jyp7zBm8MPYVagd3ALKVhopwHTtIIIoo7oqPqJT+QUNIQcfNdmfaJ0UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XPJFbsyE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E7D0E70;
	Fri, 26 Sep 2025 13:20:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758885649;
	bh=LxiQwDak1V+pV+OqZZwUlNKvMEwfAWR0ggF+WRfn7+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XPJFbsyEyAWQMGZYiKKVtWdPacj7bK6tDAhMZEehHItTbSZvyjYMtypMSS8ErjNIA
	 kJfZVNHJ775pjufK/iEu8cJP3GWDITwR/6f+8il15+Y0OGb4UY8XccocLysT4LJFNZ
	 KjeYnhLxXsq7O5XYAAalPYX6aFxZUHqqoyUEvw4E=
Message-ID: <62890f7a-8ce9-47af-be36-e7384d2a99fd@ideasonboard.com>
Date: Fri, 26 Sep 2025 14:22:10 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/15] media: rcar-isp: Move {enable|disable}_streams()
 calls
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-3-026655df7138@ideasonboard.com>
 <20250602055742.GC11750@pendragon.ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250602055742.GC11750@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 02/06/2025 12:43, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, May 30, 2025 at 04:50:32PM +0300, Tomi Valkeinen wrote:
>> With multiple streams the operation to enable the ISP hardware and to
>> call {enable|disable}_streams() on upstream subdev will need to be
>> handled separately.
>>
>> Prepare for that by moving {enable|disable}_streams() calls out from
>> risp_start() and risp_stop().
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>  drivers/media/platform/renesas/rcar-isp/csisp.c | 18 ++++++++++--------
>>  1 file changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
>> index 8fb2cc3b5650..2337c5d44c40 100644
>> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
>> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
>> @@ -268,18 +268,11 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
>>  	/* Start ISP. */
>>  	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);
>>  
>> -	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
>> -					 BIT_ULL(0));
>> -	if (ret)
>> -		risp_power_off(isp);
>> -
>> -	return ret;
>> +	return 0;
>>  }
>>  
>>  static void risp_stop(struct rcar_isp *isp)
>>  {
>> -	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
>> -
>>  	/* Stop ISP. */
>>  	risp_write_cs(isp, ISPSTART_REG, ISPSTART_STOP);
>>  
>> @@ -305,6 +298,13 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
>>  			return ret;
>>  	}
>>  
>> +	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
>> +					 BIT_ULL(0));
> 
> You're now potentially calling v4l2_subdev_disable_streams() multiple
> times on the same pad and stream, as this call isn't covered by the
> stream_count check anymore. Is that correct ? Maybe because
> risp_enable_streams() is guaranteed to never be called multiple times,
> with stream_count never becoming larger than 1 ? If so that should be
> explained in the commit message, and stream_count should probably be
> dropped.

At this point in the series risp_enable_streams() is called just once,
from a single VIN. That is, assuming only a single stream is supported.
In the cover letter I mention that there seems to be some kind of
attempts for multistreaming in upstream, which breaks during this
series. My understanding from Niklas was that the custom multistreaming
doesn't work or at least can be dropped. Niklas, correct me if I'm wrong
(and if I am wrong, someone else needs to take care of the custom
multistreaming =).

Later in the series risp_enable_streams will be called multiple times.
Each VIN video node will call it once when enabling.

 Tomi

> 
> Same when stopping.
> 
>> +	if (ret) {
>> +		risp_stop(isp);
> 
> This is also not covered by the stream_count, while risp_start() is.
> 
>> +		return ret;
>> +	}
>> +
>>  	isp->stream_count += 1;
>>  
>>  	return ret;
>> @@ -322,6 +322,8 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
>>  	if (!isp->remote)
>>  		return -ENODEV;
>>  
>> +	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
>> +
>>  	if (isp->stream_count == 1)
>>  		risp_stop(isp);
>>  
> 


