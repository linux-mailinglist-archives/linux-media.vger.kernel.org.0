Return-Path: <linux-media+bounces-3805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C9A8306E7
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 14:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B07C1C24457
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 13:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E051EB48;
	Wed, 17 Jan 2024 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OMCqq0kq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9FA208C4
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705497524; cv=none; b=XTCEZXVj9kB4k5ZrdYxS7E/O9w5GhWkd/chpfNHB/d15kLsf5C+yTrG7pqE8hdyV1XcBeZ/xXcYUfhHu8kNuSYPrmKjesxk8GpvUqb3Y4Iqg88htsep9G6qqp6MjH/p9J/469efbwEukiyh1IDN3GIZUpFG0BEvpnxEr4l+0qpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705497524; c=relaxed/simple;
	bh=QM1ZKyYdSFDxpjo/YJSqTa53dQKbZUVA4QGw0Cn5ssw=;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=Flun1rGn9tai+9ZOVebofKKv3fT9vhJDdx1PssYoa5MNTOXDtFe6hjyPrm5298Bii3H91nAeEtanQVvYSFeX/llgGX1nNm5j+XU1Pg7mfZT5Gty3HBBXmoyMY3fTWiMf3aJciIa+taf8bT8uwCpUn3KyMQk/PBfzyOb26IhgV6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OMCqq0kq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0E817E2;
	Wed, 17 Jan 2024 14:17:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705497451;
	bh=QM1ZKyYdSFDxpjo/YJSqTa53dQKbZUVA4QGw0Cn5ssw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OMCqq0kqgA1Mpock1grM2Srr+7ghX4MggbI3FPgZYvXwKCTK+/6/BrkV4MyzrcAEc
	 4czZGbPOQ2RhzVDcPmMB+CY+2tzllOgNx0U8/syTQWVt/ABYryXLAWADtTBXVlUmxg
	 R3WLwNN1YDTDMIdrhx5FWCRLP8EV81pdT4UklAmo=
Message-ID: <ec937877-73a2-4bb4-9098-126840e5f478@ideasonboard.com>
Date: Wed, 17 Jan 2024 13:18:36 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] v4l2-ctl: Add --try-routing option
Content-Language: en-US
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, tomi.valkeinen@ideasonboard.com,
 laurent.pinchart@ideasonboard.com
References: <20240117130805.939312-1-dan.scally@ideasonboard.com>
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20240117130805.939312-1-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Afternoon all


These patches are for v4l-utils; I forgot to add the appropriate prefix, sorry - knew there was 
something I was forgetting!


Thanks

Dan

On 17/01/2024 13:08, Daniel Scally wrote:
> v4l2-ctl's --list-subdev-mbus-codes option sets the which flag to
> V4L2_SUBDEV_FORMAT_TRY, which is an entirely reasonable choice, but
> means it's currently impossible to list mbus codes for pads that are
> only part of inactive routes as the --set-routing option sets ACTIVE
> routing rather than TRY.
>
> Add a --try-routing option that has identical functionality to the
> existing --set-routing but which uses the TRY format instead.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>   utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 11 +++++++----
>   utils/v4l2-ctl/v4l2-ctl.cpp        |  1 +
>   utils/v4l2-ctl/v4l2-ctl.h          |  1 +
>   3 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> index 86e6c689..48b79288 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> @@ -96,7 +96,8 @@ void subdev_usage()
>   	       "  --set-subdev-fps pad=<pad>,stream=<stream>,fps=<fps> (for testing only, otherwise use media-ctl)\n"
>   	       "                     set the frame rate [VIDIOC_SUBDEV_S_FRAME_INTERVAL]\n"
>   	       "  --get-routing      Print the route topology\n"
> -	       "  --set-routing <routes>\n"
> +	       "  --set-routing      (for testing only, otherwise use media-ctl)\n"
> +	       "  --try-routing <routes>\n"
>   	       "                     Comma-separated list of route descriptors to setup\n"
>   	       "\n"
>   	       "Routes are defined as\n"
> @@ -458,14 +459,16 @@ void subdev_cmd(int ch, char *optarg)
>   			}
>   		}
>   		break;
> -	case OptSetRouting: {
> +	case OptSetRouting:
> +	case OptTryRouting: {
>   		struct v4l2_subdev_route *r;
>   		char *end, *ref, *tok;
>   		unsigned int flags;
>   
>   		memset(&routing, 0, sizeof(routing));
>   		memset(routes, 0, sizeof(routes[0]) * NUM_ROUTES_MAX);
> -		routing.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +		routing.which = ch == OptSetRouting ? V4L2_SUBDEV_FORMAT_ACTIVE :
> +				      V4L2_SUBDEV_FORMAT_TRY;
>   		routing.num_routes = 0;
>   		routing.routes = (__u64)routes;
>   
> @@ -683,7 +686,7 @@ void subdev_set(cv4l_fd &_fd)
>   					fival.interval.denominator, fival.interval.numerator);
>   		}
>   	}
> -	if (options[OptSetRouting]) {
> +	if (options[OptSetRouting] || options[OptTryRouting]) {
>   		if (!_fd.has_streams()) {
>   			printf("Streams API not supported.\n");
>   			return;
> diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
> index e195ad8e..f9121284 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl.cpp
> @@ -65,6 +65,7 @@ static struct option long_options[] = {
>   	{"set-fmt-video-out", required_argument, nullptr, OptSetVideoOutFormat},
>   	{"try-fmt-video-out", required_argument, nullptr, OptTryVideoOutFormat},
>   	{"get-routing", no_argument, 0, OptGetRouting},
> +	{"try-routing", required_argument, 0, OptTryRouting},
>   	{"set-routing", required_argument, 0, OptSetRouting},
>   	{"help", no_argument, nullptr, OptHelp},
>   	{"help-tuner", no_argument, nullptr, OptHelpTuner},
> diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
> index cc7f1184..6382619c 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.h
> +++ b/utils/v4l2-ctl/v4l2-ctl.h
> @@ -193,6 +193,7 @@ enum Option {
>   	OptShowEdid,
>   	OptFixEdidChecksums,
>   	OptGetRouting,
> +	OptTryRouting,
>   	OptSetRouting,
>   	OptFreqSeek,
>   	OptEncoderCmd,

