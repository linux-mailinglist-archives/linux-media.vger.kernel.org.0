Return-Path: <linux-media+bounces-18285-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72752978C35
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 02:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B0DE1C2546F
	for <lists+linux-media@lfdr.de>; Sat, 14 Sep 2024 00:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369432F44;
	Sat, 14 Sep 2024 00:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HSWhtcN7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BBE138E
	for <linux-media@vger.kernel.org>; Sat, 14 Sep 2024 00:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726273967; cv=none; b=Vvsc9R2Fydq3DWgCFM6q7xtoSYfVL3CMr/ctzneqwuq2MV7SbD6ynWNe+fEM/0nOWLEAJTybIKbaF56ZqeajYEs8CDbjmlOxJUvlU2xM1Ubwk0r8oEteReKhUAiy21gxs9TnCMRTSWgJ8vZY/i1v4mYeBLQoEZe8usNdy15KTi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726273967; c=relaxed/simple;
	bh=oVQCl0xqBi/CbhHW6s6bwwaYW+2R3vZEyRU4x9c3wCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKQ28U4vzWV2Neenm3Uoiw+lZ8N/rVTviAGlC8sQ2gWwv+vLLGa4eICm8aZGNivaFDEI0hkarlH0EwXxqgD/BhVEkkbVBL8bHGp0QeTNQGkXCmiW2XhTttwz94sMAPg77PbKYHYI8xlPAB/V0EfOfr5ebDdaEX/Bb7nsEOGPrbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HSWhtcN7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D22DB5A5;
	Sat, 14 Sep 2024 02:31:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726273885;
	bh=oVQCl0xqBi/CbhHW6s6bwwaYW+2R3vZEyRU4x9c3wCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HSWhtcN7e/KI8+OZMeE2NWUzvGrU3hVCnXlm4x22nbD8UnjmJ+x95YZuv3f4ex8Sy
	 pRZV1sHszkd9AlHjMp9X+2dB8B19s1HHlJ1xN2JdtsOlLdFfZ7S4GA5agI9Mebctva
	 IFZ0K8zI2PkCchparMn9rIyGFdctakkHxYscytt4=
Date: Sat, 14 Sep 2024 03:32:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ryan Eatmon <reatmon@ti.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [master][PATCH] yavta: Fix 32-bit compile
Message-ID: <20240914003209.GB26457@pendragon.ideasonboard.com>
References: <20240913194211.12423-1-reatmon@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240913194211.12423-1-reatmon@ti.com>

Hi Ryan,

Thank you for the patch.

On Fri, Sep 13, 2024 at 02:42:11PM -0500, Ryan Eatmon wrote:
> The format for printing various time elements are not working for 64bit
> times on a 32bit compile.
> 
> ../git/yavta.c:2195:51: error: format '%ld' expects argument of type 'long int', but argument 8 has type '__time64_t' {aka 'long long int'} [-Werror=format=]
>  2195 |                 printf("%u (%u) [%c] %s %u %u B %ld.%06ld %ld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
>       |                                                 ~~^
>       |                                                   |
>       |                                                   long int
>       |                                                 %lld
> ......
>  2199 |                         buf.timestamp.tv_sec, buf.timestamp.tv_usec,
>       |                         ~~~~~~~~~~~~~~~~~~~~
>       |                                      |
>       |                                      __time64_t {aka long long int}
> 
> Change the formats to be lld/llu to accommodate the change for 32bit
> compiles.

Ricardo Ribalda has submitted a similar patch previously, see
https://lore.kernel.org/linux-media/20230920125939.1478-1-ricardo@ribalda.com/.
It had fallen through the cracks (my bad), and I have now applied it.
Could you check if it solves your problem ?

> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  yavta.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/yavta.c b/yavta.c
> index 3bf82b3..0655311 100644
> --- a/yavta.c
> +++ b/yavta.c
> @@ -2192,12 +2192,12 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
>  
>  		clock_gettime(CLOCK_MONOTONIC, &ts);
>  		get_ts_flags(buf.flags, &ts_type, &ts_source);
> -		printf("%u (%u) [%c] %s %u %u B %ld.%06ld %ld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
> +		printf("%u (%u) [%c] %s %u %u B %lld.%06lld %lld.%06ld %.3f fps ts %s/%s\n", i, buf.index,
>  			(buf.flags & V4L2_BUF_FLAG_ERROR) ? 'E' : '-',
>  			v4l2_field_name(buf.field),
>  			buf.sequence, video_buffer_bytes_used(dev, &buf),
> -			buf.timestamp.tv_sec, buf.timestamp.tv_usec,
> -			ts.tv_sec, ts.tv_nsec/1000, fps,
> +			(long long int) buf.timestamp.tv_sec, (long long int) buf.timestamp.tv_usec,
> +			(long long int) ts.tv_sec, ts.tv_nsec/1000, fps,
>  			ts_type, ts_source);
>  
>  		last = buf.timestamp;
> @@ -2254,8 +2254,8 @@ static int video_do_capture(struct device *dev, unsigned int nframes,
>  	bps = size/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
>  	fps = i/(ts.tv_nsec/1000.0+1000000.0*ts.tv_sec)*1000000.0;
>  
> -	printf("Captured %u frames in %lu.%06lu seconds (%f fps, %f B/s).\n",
> -		i, ts.tv_sec, ts.tv_nsec/1000, fps, bps);
> +	printf("Captured %u frames in %llu.%06lu seconds (%f fps, %f B/s).\n",
> +		i, (long long unsigned int) ts.tv_sec, ts.tv_nsec/1000, fps, bps);
>  
>  done:
>  	video_free_buffers(dev);

-- 
Regards,

Laurent Pinchart

