Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D861A1B5771
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 10:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgDWIpx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 04:45:53 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:40161 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726032AbgDWIpx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 04:45:53 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id RXUSjL1mW7xncRXUVjPnzv; Thu, 23 Apr 2020 10:45:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587631551; bh=47+J/TwQd7db3Z+i92AalzCkCTTPJ8oD4Bn+sqBfuFk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=mizxJMIyn+Yni7LOW7q9BfH67UL4kUCphHJ4DCv5Bs6rMPNrFMQnwyLTlV5cIea0o
         +k1YFndwrf/esyp3eVP8dCbeqltvZ0jiFseQ7mwPUZF0g+bJRzkC+Or0HdRQ3zhpre
         NVuiT0Utf01J3ZslplY2yx2gplTPKLM4uIX2GRweqDTjXA1xXhyUQqhvJxCmY+oFk9
         uiB0pc5MPYVmKr04O29I6bIUgTanoqIHATSJO+vgNKnzuvpifaIYCyp5oX7opih40I
         mYZZz9eGMknEJIBSyeuAsB/VTuus9L2UV+bnKRYdniYIoDtfkBdUxcGXuRcetkGx3r
         i+s9zgTX3i2kQ==
Subject: Re: [PATCH 11/12] utils: fix double promotions
To:     Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20200422003735.3891-1-rosenp@gmail.com>
 <20200422003735.3891-11-rosenp@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7b935d65-7555-4226-61e7-5c6a6bcecedf@xs4all.nl>
Date:   Thu, 23 Apr 2020 10:45:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200422003735.3891-11-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOvmF+B8e3fQU9/YtcgABgu7WJ0XyNz49VKytxOEA/u/qxN1VPuLOZGa+ZyejitYhh2Jzvc0ZUWvf/D9+LTktX/EFYwmwzQddFVsvPevttpmcfotV/6i
 6lVwkmH2RrDk7ch4/ze6NRZRc7WLA7AiBNdPkdYIwXgAMCOYubyFMGa4EVkFEHkaynyqhRUYdP814huDZ6/ZDMG5HisVqUMnGjk=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/04/2020 02:37, Rosen Penev wrote:
> Found with -Wdouble-promotion
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/rds-ctl/rds-ctl.cpp                   | 4 ++--
>  utils/v4l2-compliance/v4l2-test-buffers.cpp | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
> index cc1d3bf7..cd6ece38 100644
> --- a/utils/rds-ctl/rds-ctl.cpp
> +++ b/utils/rds-ctl/rds-ctl.cpp
> @@ -528,7 +528,7 @@ static void print_rds_statistics(const struct v4l2_rds_statistics *statistics)
>  			(static_cast<float>(statistics->block_error_cnt) / statistics->block_cnt) * 100.0f;
>  	printf("block errors / group errors: %u (%3.2f%%) / %u \n",
>  		statistics->block_error_cnt,
> -		block_error_percentage, statistics->group_error_cnt);
> +		(double)block_error_percentage, statistics->group_error_cnt);

Rather than adding a cast, I think the block_error_percentage and block_corrected_percentage
type should just be changed to double.

Regards,

	Hans

>  
>  	float block_corrected_percentage = 0;
>  
> @@ -536,7 +536,7 @@ static void print_rds_statistics(const struct v4l2_rds_statistics *statistics)
>  		block_corrected_percentage = (
>  			static_cast<float>(statistics->block_corrected_cnt) / statistics->block_cnt) * 100.0f;
>  	printf("corrected blocks: %u (%3.2f%%)\n",
> -		statistics->block_corrected_cnt, block_corrected_percentage);
> +		statistics->block_corrected_cnt, (double)block_corrected_percentage);
>  	for (int i = 0; i < 16; i++)
>  		printf("Group %02d: %u\n", i, statistics->group_type_cnt[i]);
>  }
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index 87c2e523..abf39cc7 100644
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -2597,7 +2597,7 @@ static void streamFmt(struct node *node, __u32 pixelformat, __u32 w, __u32 h,
>  	char hz[32] = "";
>  
>  	if (!frame_count)
> -		frame_count = f ? (unsigned)(1.0f / fract2f(f)) : 10;
> +		frame_count = f ? (unsigned)(1.0 / fract2f(f)) : 10;
>  	node->g_fmt(fmt);
>  	fmt.s_pixelformat(pixelformat);
>  	fmt.s_width(w);
> 

