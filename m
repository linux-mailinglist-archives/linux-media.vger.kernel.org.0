Return-Path: <linux-media+bounces-48879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42914CC3197
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 14:12:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83C8E313099E
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 13:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3CD39379B;
	Tue, 16 Dec 2025 12:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TyTrEhII"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998E6393763;
	Tue, 16 Dec 2025 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889302; cv=none; b=aEARR8JABGfAaK05KPhKiv1xyXzzaDOjTZvxpjry1MU2DnG+fCyn8ZZAEmx8H84g7IoEoHCTlzpsT5cOYyH1T2BtsdB9t2uY5b0+cuI83eOLeZHztk9ekTo8512Hipq/wRIBkUs3FnnKxHVmrJP7BAZbGsnRdVkZstB65/hG4hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889302; c=relaxed/simple;
	bh=NFVVMGHXoEiWLOJN4aK0rNVbu8wYLpU3u1csLagOCPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VLLQ1Mb6/KYnuP6ZjjntpnGcpBO5oKixmVfmTz1rYz5QMknL8m8u9k5dNwyc5pLEVvtl92LQ+wveyX/+btkxP3VHYG+3rI+R0V+yiGVDhzclkL+L7QbSeGVTlpNMP+uZDycba4WPwdWTyk4XHo40yq5+jW194iCCZOL/lA1QECw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TyTrEhII; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 447EFA06;
	Tue, 16 Dec 2025 13:48:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765889291;
	bh=NFVVMGHXoEiWLOJN4aK0rNVbu8wYLpU3u1csLagOCPg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TyTrEhIIueZrJtBUV7m4fR7RgVXG+qFvaPHBDh5rZ+AFTI4SU2w7KSFe5rJ1qLK5i
	 1XZu+CW6O8bfPOwlOT8j4cI/l1trqFt+x8WZYbfSrkow3KAQ8f/T8d9/Ci7856ud7Q
	 pCzO5yz31ISmbSAtx6HTR8WB+4AHD/SJ6RvuMhgw=
Message-ID: <dc01db26-9182-404f-ab90-22d833235757@ideasonboard.com>
Date: Tue, 16 Dec 2025 14:48:13 +0200
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
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
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

This should be fine, as if we get multiple calls, we'll try to enable
stream 0 multiple times, and that will fail. So, at this point of the
series, we really only support a single stream, and thus an attempt to
enable multiple VINs would fail here to the second
v4l2_subdev_enable_streams() call.

I'll add a note to the commit description.

> 
> Same when stopping.
> 
>> +	if (ret) {
>> +		risp_stop(isp);
> 
> This is also not covered by the stream_count, while risp_start() is.

Indeed, I'll fix that.

 Tomi

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


