Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98DD41B574D
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 10:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgDWIgo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 04:36:44 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:33095 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726593AbgDWIgo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 04:36:44 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id RXLajKxtv7xncRXLdjPmDW; Thu, 23 Apr 2020 10:36:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587631001; bh=4R4tRouWqmPuweXi8spRlspyOVBhOdqMWVN1TloirmQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=YykB/Z9CA/qNymzsFlwVTHE9X27J/ZQ9WKugpzSx8BZhjVoY7lHrHIuSHK8OLmjAk
         wkxbG49Wr1S/KcpHr04o2O8nHXVvIhgfeJ/iWtZ5WWEBiMZn03nnbYpurjaDgxzJJy
         vQNcTaLZiScRsAowech9b1vp9JGsm+f1IdBnO+8mI/U7d+vovjn8Tb9FDznsblAvkV
         702hOh6VjAsi25zykCyZdzouAEakFlHwDApnZXfhM/kH//Fmf6F+NkGEZarI42nAfC
         RX9NYSJyqWZWT+5vT1+LJtBu0Sagteup0d1Rat7TwMrE2LagqWX/92LML+uZGTSs7g
         yJKFKk89/tiUQ==
Subject: Re: [PATCH 09/12] utils: fix implicit float conversions
To:     Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20200422003735.3891-1-rosenp@gmail.com>
 <20200422003735.3891-9-rosenp@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <614cd737-6d34-be13-2c45-da43652cf586@xs4all.nl>
Date:   Thu, 23 Apr 2020 10:36:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200422003735.3891-9-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAQEWlfDj8f8pI6kKnIL+RYDfM+BRSKNrFlUdh5PeSk/qxk8zx+xJUrgXl36xje/2i6hzEAFhNqE79emFhyVZddQ8rVnWrqxQHfQc2cNiKclmcFUQeV8
 VPJ+5xqrBwzQ279ko3LIWgfyZZV1laikgz32ZBUQYLVJi44ksRJIPCA+BzxvsYBYdkVD0qK1oghszoKMXMC7hE2T90xLCseatsM=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/04/2020 02:37, Rosen Penev wrote:
> Found with -Wfloat-conversion
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/cec-ctl/cec-ctl.cpp                   | 4 ++--
>  utils/cec-ctl/cec-pin.cpp                   | 2 +-
>  utils/v4l2-compliance/v4l2-test-buffers.cpp | 2 +-
>  utils/v4l2-ctl/v4l2-ctl-misc.cpp            | 4 ++--
>  utils/v4l2-ctl/v4l2-ctl-streaming.cpp       | 2 +-
>  utils/v4l2-ctl/v4l2-ctl-subdev.cpp          | 2 +-
>  6 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
> index f4133494..f0e31aca 100644
> --- a/utils/cec-ctl/cec-ctl.cpp
> +++ b/utils/cec-ctl/cec-ctl.cpp
> @@ -1507,8 +1507,8 @@ static void stress_test_power_cycle(struct node &node, unsigned cnt,
>  	srandom(seed);
>  
>  	for (;;) {
> -		unsigned usecs1 = mod_usleep ? random() % mod_usleep : sleep_before_on * 1000000;
> -		unsigned usecs2 = mod_usleep ? random() % mod_usleep : sleep_before_off * 1000000;
> +		unsigned usecs1 = mod_usleep ? random() % mod_usleep : (unsigned)(sleep_before_on * 1000000);
> +		unsigned usecs2 = mod_usleep ? random() % mod_usleep : (unsigned)(sleep_before_off * 1000000);

Shouldn't this be static_cast<unsigned>? Same elsewhere.

Regards,

	Hans

>  
>  		usecs1 += min_usleep;
>  		usecs2 += min_usleep;
> diff --git a/utils/cec-ctl/cec-pin.cpp b/utils/cec-ctl/cec-pin.cpp
> index 0322ad5e..10abea37 100644
> --- a/utils/cec-ctl/cec-pin.cpp
> +++ b/utils/cec-ctl/cec-pin.cpp
> @@ -261,7 +261,7 @@ static void cec_pin_rx_data_bit_was_low(__u64 ev_ts, __u64 usecs, __u64 usecs_mi
>  	 * If the low drive starts at the end of a 0 bit, then the actual
>  	 * maximum time that the bus can be low is the two summed.
>  	 */
> -	const unsigned max_low_drive = CEC_TIM_LOW_DRIVE_ERROR_MAX +
> +	const unsigned max_low_drive = (unsigned)CEC_TIM_LOW_DRIVE_ERROR_MAX +
>  		CEC_TIM_DATA_BIT_0_LOW_MAX + CEC_TIM_MARGIN;
>  
>  	low_usecs = usecs;
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index 93df7034..87c2e523 100644
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -2597,7 +2597,7 @@ static void streamFmt(struct node *node, __u32 pixelformat, __u32 w, __u32 h,
>  	char hz[32] = "";
>  
>  	if (!frame_count)
> -		frame_count = f ? 1.0 / fract2f(f) : 10;
> +		frame_count = f ? (unsigned)(1.0f / fract2f(f)) : 10;
>  	node->g_fmt(fmt);
>  	fmt.s_pixelformat(pixelformat);
>  	fmt.s_width(w);
> diff --git a/utils/v4l2-ctl/v4l2-ctl-misc.cpp b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
> index cb933217..2851886a 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-misc.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
> @@ -320,7 +320,7 @@ void misc_set(cv4l_fd &_fd)
>  		parm.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>  		parm.parm.capture.timeperframe.numerator = 1000;
>  		parm.parm.capture.timeperframe.denominator =
> -			fps * parm.parm.capture.timeperframe.numerator;
> +			(uint32_t)(fps * parm.parm.capture.timeperframe.numerator);
>  
>  		if (doioctl(fd, VIDIOC_S_PARM, &parm) == 0) {
>  			struct v4l2_fract *tf = &parm.parm.capture.timeperframe;
> @@ -338,7 +338,7 @@ void misc_set(cv4l_fd &_fd)
>  		parm.type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
>  		parm.parm.output.timeperframe.numerator = 1000;
>  		parm.parm.output.timeperframe.denominator =
> -			output_fps * parm.parm.output.timeperframe.numerator;
> +			(uint32_t)(output_fps * parm.parm.output.timeperframe.numerator);
>  
>  		if (doioctl(fd, VIDIOC_S_PARM, &parm) == 0) {
>  			struct v4l2_fract *tf = &parm.parm.output.timeperframe;
> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> index 066a336a..6981a3cc 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> @@ -569,7 +569,7 @@ static void print_concise_buffer(FILE *f, cv4l_buffer &buf, cv4l_fmt &fmt,
>  	if (!skip_ts && (buf.g_flags() & V4L2_BUF_FLAG_TIMESTAMP_MASK) != V4L2_BUF_FLAG_TIMESTAMP_COPY) {
>  		double ts = buf.g_timestamp().tv_sec + buf.g_timestamp().tv_usec / 1000000.0;
>  		fprintf(f, " ts: %.06f", ts);
> -		if (last_ts)
> +		if (last_ts <= 0.0)
>  			fprintf(f, " delta: %.03f ms", (ts - last_ts) * 1000.0);
>  		last_ts = ts;
>  
> diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> index 747f1699..f1223084 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> @@ -487,7 +487,7 @@ void subdev_set(cv4l_fd &_fd)
>  			exit(1);
>  		}
>  		fival.interval.numerator = 1000;
> -		fival.interval.denominator = set_fps * fival.interval.numerator;
> +		fival.interval.denominator = (uint32_t)(set_fps * fival.interval.numerator);
>  		printf("Note: --set-subdev-fps is only for testing.\n"
>  		       "Normally media-ctl is used to configure the video pipeline.\n");
>  		printf("ioctl: VIDIOC_SUBDEV_S_FRAME_INTERVAL (pad=%u)\n", fival.pad);
> 

