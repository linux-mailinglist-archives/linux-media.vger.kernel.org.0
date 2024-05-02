Return-Path: <linux-media+bounces-10653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C77838BA37F
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 00:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 839652846B2
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 22:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CB01BC43;
	Thu,  2 May 2024 22:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ojb7yWEc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989581CD0C
	for <linux-media@vger.kernel.org>; Thu,  2 May 2024 22:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714690408; cv=none; b=QUvJZ+8xev3oAXDqbYn89lwOeZZ3DzYlZ+bceH6W/X6LG85us+6Z+5Pw6EMbdpZWu/G5CRePddhQBboiVrSipwvd8JVWytAM9VdW/vypFBgcBwKY7+FXDjaaTVe7u2MdyvBIUWtxyQwZgrXZD8wFzHsn+BB6Em4CbHu6ZCwSxPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714690408; c=relaxed/simple;
	bh=vQaWdrHoWyRI1hOnC7lHZNit3R4Hi6zoKH3syF9JJJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JT3mrfvL1ncdeWpWebkYBC970itQBjNPSy78hKUdJvF13j8KGA6uAuUJvxnyNK3L/Kv/hd23yE5MRLSyUUt9bHGUOPPTrwhdJsxnr44/JL7cFVlGTtOsXmkwOhG++JcobEEiz4blN/TenGc/S/POyYvKF6NF8E5g8e4utVHPQlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ojb7yWEc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E52784CE;
	Fri,  3 May 2024 00:52:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714690347;
	bh=vQaWdrHoWyRI1hOnC7lHZNit3R4Hi6zoKH3syF9JJJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ojb7yWEchtfbSApDNbGr9GN8mJs/usdPfVBlmi/D7Kj6JNeeCq9krorHS4eaU/mVE
	 4jweDpahLKZ/Xxvx3XyXNzXTHxPgoC+rqU/9L0KqmQiHPhK6kjfdXriJ/z7vaKbug4
	 9mRNbqSungKQYNWFUtHUwjQIp6OdLAYenCk2tp6k=
Date: Fri, 3 May 2024 01:53:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [yavta PATCH 1/1] Print V4L2 fourcc code in format enumeration
Message-ID: <20240502225318.GF4959@pendragon.ideasonboard.com>
References: <20240425210815.1820591-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240425210815.1820591-1-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Fri, Apr 26, 2024 at 12:08:15AM +0300, Sakari Ailus wrote:
> Also print the V4L2 fourcc code in format enumeration (--enum-formats).
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  yavta.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)

This doesn't apply cleanly.

> 
> diff --git a/yavta.c b/yavta.c
> index b2283aed09cb..2153e8b5775f 100644
> --- a/yavta.c
> +++ b/yavta.c
> @@ -370,6 +370,18 @@ static struct v4l2_format_info {
>  	{ "GENERIC_CSI2_24", V4L2_META_FMT_GENERIC_CSI2_24, 1 },
>  };
>  
> +void v4l2_format_fourcc(__u32 fourcc, char name[5])
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < 4; ++i) {
> +		name[i] = fourcc & 0xff;

While at it, could we handle non-printable characters better ?

> +		fourcc >>= 8;
> +	}
> +
> +	name[4] = '\0';
> +}
> +
>  static void list_formats(void)
>  {
>  	unsigned int i;
> @@ -412,18 +424,13 @@ static const char *v4l2_format_name(unsigned int fourcc)
>  {
>  	const struct v4l2_format_info *info;
>  	static char name[5];
> -	unsigned int i;
>  
>  	info = v4l2_format_by_fourcc(fourcc);
>  	if (info)
>  		return info->name;
>  
> -	for (i = 0; i < 4; ++i) {
> -		name[i] = fourcc & 0xff;
> -		fourcc >>= 8;
> -	}
> +	v4l2_format_fourcc(fourcc, name);
>  
> -	name[4] = '\0';
>  	return name;
>  }
>  
> @@ -1815,6 +1822,8 @@ static void video_enum_formats(struct device *dev, enum v4l2_buf_type type)
>  	int ret;
>  
>  	for (i = 0; ; ++i) {
> +		char fourcc[5];
> +
>  		memset(&fmt, 0, sizeof fmt);
>  		fmt.index = i;
>  		fmt.type = type;
> @@ -1829,8 +1838,10 @@ static void video_enum_formats(struct device *dev, enum v4l2_buf_type type)
>  			printf("Warning: driver returned wrong format type "
>  				"%u.\n", fmt.type);
>  
> -		printf("\tFormat %u: %s (%08x)\n", i,
> -			v4l2_format_name(fmt.pixelformat), fmt.pixelformat);
> +		v4l2_format_fourcc(fmt.pixelformat, fourcc);
> +		printf("\tFormat %u: %s (%08x, \"%s\")\n", i,
> +			v4l2_format_name(fmt.pixelformat), fmt.pixelformat,
> +			fourcc);

One could argue that it would be nice to extend this to all users of
v4l2_format_fourcc(). I suppose that would be overkill.

If the format is unknown to yavta you'll end up printing the same thing
twice, but consistency in the format is probably better than avoiding
the duplication. The patch looks OK to me, I'll apply it if you send me
a version that applies :-)

>  		printf("\tType: %s (%u)\n", v4l2_buf_type_name(fmt.type),
>  			fmt.type);
>  		printf("\tName: %.32s\n", fmt.description);

-- 
Regards,

Laurent Pinchart

