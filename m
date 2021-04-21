Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 670D43666F0
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 10:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234728AbhDUIYA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 04:24:00 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:45029 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234532AbhDUIYA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 04:24:00 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Z88nl8wezXsivZ88qltwhB; Wed, 21 Apr 2021 10:23:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618993405; bh=C7f2NqM5nlAdAVJPTJolCpe4eikOxrw5pvyQZasrOpY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fBr0+hniLPjQETVXB6aF3m2cStO6pZpeZujpQwRvMcuJPY6dO2REtjru8sqs1tJam
         58zZwk9nbGI8oeMx4TcgOaa5CLjVVoiXdm4Q8whH8suNr+90X3X/oFchHNOCPfSfCk
         41sBRE/uQBhjb8T3MH8hm9uE6orGbBjddUmVLE5PCTCPoxOV6azIYnYPzPxzgeKZXg
         WXOt8jxNMeieqsnAmUd9cV/7p4G+MNqPHAC5ksHmJEHl9xWw1KKot9ut0ZuIGVhD+t
         WbhNLUW0xQM2REZnxYdwzCUe8WdRPO6lDZ3EaBYXKqUPaW8pVcQZ4o9vrBoB3gKIlU
         5oepHvbUzDalQ==
Subject: Re: [PATCH 5/8] v4l2-info: remove a strange sizeof usage
To:     Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20210421072035.4188497-1-rosenp@gmail.com>
 <20210421072035.4188497-5-rosenp@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <525235dc-e205-0154-ebde-1df11daf48ca@xs4all.nl>
Date:   Wed, 21 Apr 2021 10:23:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210421072035.4188497-5-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAhepFrH9wmOSHj0IKVM3sHI59Sf2lKXtYWrjDblJZ3f7MrVjhqdnBWx75XCyMVoBMZgh2GBcnC0EFZ44put/dmBOm3kn9o6pbJP3n98Ps4OWl2GrP3k
 ZotlTC9XBbZ06l12zqnBTv0qtEzCLjg+AoWuvGYXbxesmNrA9aQGWDAl+WIzbxrZcDQ9mXJ3y+4QVm7Z5PJuNTUGEs9k+6IvJtqx3jSe4ZyEwQkPVkXn3QfU
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/04/2021 09:20, Rosen Penev wrote:
> The array has a nullptr and 0 member for some reason. Remove and convert
> loop to a for range one.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/common/v4l2-info.cpp | 33 +++++++++++++++------------------
>  1 file changed, 15 insertions(+), 18 deletions(-)
> 
> diff --git a/utils/common/v4l2-info.cpp b/utils/common/v4l2-info.cpp
> index cb3cb91f7..0359cf137 100644
> --- a/utils/common/v4l2-info.cpp
> +++ b/utils/common/v4l2-info.cpp
> @@ -3,6 +3,8 @@
>   * Copyright 2018 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>   */
>  
> +#include <array>
> +
>  #include <v4l2-info.h>
>  
>  static std::string num2s(unsigned num, bool is_hex = true)
> @@ -411,21 +413,20 @@ std::string mbus2s(unsigned flags, bool is_hsv)
>  	return flags2s(flags, mbus_ycbcr_def);
>  }
>  
> -static const flag_def selection_targets_def[] = {
> -	{ V4L2_SEL_TGT_CROP_ACTIVE, "crop" },
> -	{ V4L2_SEL_TGT_CROP_DEFAULT, "crop_default" },
> -	{ V4L2_SEL_TGT_CROP_BOUNDS, "crop_bounds" },
> -	{ V4L2_SEL_TGT_COMPOSE_ACTIVE, "compose" },
> -	{ V4L2_SEL_TGT_COMPOSE_DEFAULT, "compose_default" },
> -	{ V4L2_SEL_TGT_COMPOSE_BOUNDS, "compose_bounds" },
> -	{ V4L2_SEL_TGT_COMPOSE_PADDED, "compose_padded" },
> -	{ V4L2_SEL_TGT_NATIVE_SIZE, "native_size" },
> -	{ 0, nullptr }

The idea of having this sentinel is that this makes it easy to add new
entries without having to update the array size.

> +static constexpr std::array<flag_def, 8> selection_targets_def{

Something you need to do here, adding a new flag means updating the size.

New flags are added regularly, so keeping that robust is a good idea IMHO.

If it were possible to write:

static constexpr std::array<flag_def> selection_targets_def{

i.e. without an explicit size, then this would make sense, but C++
doesn't allow this. And std::vector allocates the data on the heap,
which is less efficient as well.

Let's just keep using normal arrays in this case, they do the job
just fine. Just because you have a hammer, it doesn't mean everything
is now a nail :-)

Regards,

	Hans

> +	flag_def{ V4L2_SEL_TGT_CROP_ACTIVE, "crop" },
> +	flag_def{ V4L2_SEL_TGT_CROP_DEFAULT, "crop_default" },
> +	flag_def{ V4L2_SEL_TGT_CROP_BOUNDS, "crop_bounds" },
> +	flag_def{ V4L2_SEL_TGT_COMPOSE_ACTIVE, "compose" },
> +	flag_def{ V4L2_SEL_TGT_COMPOSE_DEFAULT, "compose_default" },
> +	flag_def{ V4L2_SEL_TGT_COMPOSE_BOUNDS, "compose_bounds" },
> +	flag_def{ V4L2_SEL_TGT_COMPOSE_PADDED, "compose_padded" },
> +	flag_def{ V4L2_SEL_TGT_NATIVE_SIZE, "native_size" },
>  };
>  
>  bool valid_seltarget_at_idx(unsigned i)
>  {
> -	return i < sizeof(selection_targets_def) / sizeof(selection_targets_def[0]) - 1;
> +	return i < selection_targets_def.size();
>  }
>  
>  unsigned seltarget_at_idx(unsigned i)
> @@ -437,13 +438,9 @@ unsigned seltarget_at_idx(unsigned i)
>  
>  std::string seltarget2s(__u32 target)
>  {
> -	int i = 0;
> -
> -	while (selection_targets_def[i].str != nullptr) {
> -		if (selection_targets_def[i].flag == target)
> -			return selection_targets_def[i].str;
> -		i++;
> -	}
> +	for (const auto &def : selection_targets_def)
> +		if (def.flag == target)
> +			return def.str;
>  	return std::string("Unknown (") + num2s(target) + ")";
>  }
>  
> 

