Return-Path: <linux-media+bounces-43240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BC5BA2FD2
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 10:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F8BF1C21624
	for <lists+linux-media@lfdr.de>; Fri, 26 Sep 2025 08:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF74F296BBD;
	Fri, 26 Sep 2025 08:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RwDTvK8L"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3A926E6EA
	for <linux-media@vger.kernel.org>; Fri, 26 Sep 2025 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758876122; cv=none; b=bEVTrpr3sPScq7p0EK4r0RCFLmoXF/gSwrYHUT7Jcqln0SvS50/3ip3cNxues7IwEliz2YkCCSCDDCfzDKNRetScO/7+ZjaoQ/g9bnDCKdNZ8EyPRJW6PgLzq27OlLO7d3NujDq1kPXpaoqWY9af8v33EUUQP8yIr1hUD2hXWtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758876122; c=relaxed/simple;
	bh=Q4aFMsqbBNSrljWqkrz3F71guVInaHDdbAvHYY33zk0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:Cc:
	 In-Reply-To:Content-Type; b=OHd7hkX4x2ZJClftcLNZnV3Z0Jizu1TLZwCFnnJe3H4YeM5HGssXREI6Q6MYX0fAGwp73UtD+NL9Kdcl+SM7j7EggCNGifeAJqdXbnAkj8NY3T0WYHj2t/GqlZ2qT3ib2bQkaWzV14vmYPw755m6tVJKVtxvZL2OdXCh3CTWuXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RwDTvK8L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DEEDC4CEF4;
	Fri, 26 Sep 2025 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758876121;
	bh=Q4aFMsqbBNSrljWqkrz3F71guVInaHDdbAvHYY33zk0=;
	h=Date:From:Subject:To:References:Cc:In-Reply-To:From;
	b=RwDTvK8LFBsSOfw5Jgp61Bk9EOvrjgBlkm4OBqe+DfxXHnuenXFfKY+t9QuEw7b0a
	 M1ONYEDUlhizkfgZ2g3lrOqP04ay5mpjvEyY8mZGV5ncRx1NsKCgQpEx9eOeaqaQMz
	 DylBzJLODkOzUbz6f3zwYEEKUMWpQeB7TeivF7SYo7A7OXHQua/0OU2SYOJ/N7+068
	 GzOkRxn6E0sxcy5iwsBXJFo6FKDHc+IaIjJVmMVaMAZgD/5oXTR3/dO2rjwPlxplGY
	 2Kh19TisSnsdnxoBVPXUUXTZ8XTZNXxLR5Nygyij6zOi/N5f/CTMUxJpK/D2iVSsTx
	 nYAz6Dn/pNS4g==
Message-ID: <5cfb3270-6a4e-4f5d-a885-52f95f231d00@kernel.org>
Date: Fri, 26 Sep 2025 10:41:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4l-utils v2] v4l2-ctl: Fix failure on controls starting
 with a digit
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
References: <20250819-fix_3alock-v2-1-84953c908075@foss.st.com>
Content-Language: en-US, nl
Cc: linux-media@vger.kernel.org
In-Reply-To: <20250819-fix_3alock-v2-1-84953c908075@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Benjamin,

Thank you for the patch, and apologies for not reviewing this earlier.

On 19/08/2025 09:07, Benjamin Mugnier wrote:
> Specifically querying the 3a_lock control from v4l2-ctl fails :
> 
>   $ v4l2-ctl -C 3a_lock
>   VIDIOC_G_EXT_CTRLS: failed: Invalid argument
>   : 0
> 
> A similar issue occurs when setting the control :
> 
>   $ v4l2-ctl -c 3a_lock=0
>   VIDIOC_S_EXT_CTRLS: failed: Invalid argument
>   Error setting controls: Invalid argument
> 
> This does not happen with other controls. Internally, v4l2-ctl parses
> its arguments in order and differentiates a control name from a value
> using this check :
> 
>   if (isdigit(s[0]))
> 
> This means if the argument starts with a letter, it is a control
> name; otherwise, it is a control value. This works well for all controls
> except for 3a_lock, which starts with a digit and is wrongly detected as
> a control value.
> 
> Currently, 3a_lock is the only control that starts with a digit.
> 
> Introduce is_digits() to check if a string contains only digits, and
> therefore would return false when parsing '3a_lock'. Use is_digits() for
> control get and set operations, and expand its use to all other relevant
> cases.

This isn't enough. strtoul allows for hex numbers (preceded by 0x or 0X) and
numbers starting with '-' (see man strtoul). This isn't tested.

It might be better to have a helper is_valid_number() that calls strtoul and
checks the endptr to make sure the number does not end with an isalnum() or
underscore character.

There are a few cases below where strtol is called: those are actually wrong
and it should be strtoul. I'll push fixes for that soon.

Some more comments below.

> 
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
> Changes in v2:
> - Remove spurious debug trace
> ---
>  utils/v4l2-ctl/v4l2-ctl-common.cpp | 8 ++++----
>  utils/v4l2-ctl/v4l2-ctl-stds.cpp   | 2 +-
>  utils/v4l2-ctl/v4l2-ctl-vidcap.cpp | 4 ++--
>  utils/v4l2-ctl/v4l2-ctl.cpp        | 4 ++--
>  utils/v4l2-ctl/v4l2-ctl.h          | 9 +++++++++
>  5 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> index 32dbe9de7162258ec19c49580bd36c0971fd7fe6..98e0a2596758f69d85ef25769358cef9ce8bcb7b 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> @@ -1000,7 +1000,7 @@ void common_process_controls(cv4l_fd &fd)
>  	find_controls(fd);
>  	for (const auto &get_ctrl : get_ctrls) {
>  		std::string s = get_ctrl;
> -		if (isdigit(s[0])) {
> +		if (is_digits(s)) {
>  			__u32 id = strtoul(s.c_str(), nullptr, 0);
>  			if (ctrl_id2str.find(id) != ctrl_id2str.end())
>  				s = ctrl_id2str[id];
> @@ -1012,7 +1012,7 @@ void common_process_controls(cv4l_fd &fd)
>  	}
>  	for (const auto &set_ctrl : set_ctrls) {
>  		std::string s = set_ctrl.first;
> -		if (isdigit(s[0])) {
> +		if (is_digits(s)) {
>  			__u32 id = strtoul(s.c_str(), nullptr, 0);
>  			if (ctrl_id2str.find(id) != ctrl_id2str.end())
>  				s = ctrl_id2str[id];
> @@ -1212,7 +1212,7 @@ void common_set(cv4l_fd &_fd)
>  		memset(&ctrls, 0, sizeof(ctrls));
>  		for (const auto &set_ctrl : set_ctrls) {
>  			std::string s = set_ctrl.first;
> -			if (isdigit(s[0])) {
> +			if (is_digits(s)) {
>  				__u32 id = strtoul(s.c_str(), nullptr, 0);
>  				s = ctrl_id2str[id];
>  			}
> @@ -1359,7 +1359,7 @@ void common_get(cv4l_fd &_fd)
>  		memset(&ctrls, 0, sizeof(ctrls));
>  		for (const auto &get_ctrl : get_ctrls) {
>  			std::string s = get_ctrl;
> -			if (isdigit(s[0])) {
> +			if (is_digits(s)) {
>  				__u32 id = strtoul(s.c_str(), nullptr, 0);
>  				s = ctrl_id2str[id];
>  			}
> diff --git a/utils/v4l2-ctl/v4l2-ctl-stds.cpp b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
> index 8c9abf5df687d3aeaf68089e702566854bd34bd0..5e23cc5708b7c33e4cc8562d2ec1d13c3efcd70c 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-stds.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-stds.cpp
> @@ -445,7 +445,7 @@ void stds_cmd(int ch, char *optarg)
>  			else
>  				standard = V4L2_STD_SECAM;
>  		}
> -		else if (isdigit(optarg[0])) {
> +		else if (is_digits(optarg)) {

Just drop this change, standard names never start with a digit, so no need to
replace it with is_digits.

>  			standard = strtol(optarg, nullptr, 0) | (1ULL << 63);
>  		} else {
>  			fprintf(stderr, "Unknown standard '%s'\n", optarg);
> diff --git a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
> index 498362217149df1b854f138fd642dc938e7a90fb..2384200248d567d14be0628aa2e1158b345fc57f 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-vidcap.cpp
> @@ -133,7 +133,7 @@ void vidcap_cmd(int ch, char *optarg)
>  							   optarg[2], optarg[3]);
>  			if (be_pixfmt)
>  				frmsize.pixel_format |= 1U << 31;
> -		} else if (isdigit(optarg[0])) {
> +		} else if (is_digits(optarg)) {
>  			frmsize.pixel_format = strtol(optarg, nullptr, 0);
>  		} else {
>  			fprintf(stderr, "The pixelformat '%s' is invalid\n", optarg);
> @@ -165,7 +165,7 @@ void vidcap_cmd(int ch, char *optarg)
>  							    value[2], value[3]);
>  					if (be_pixfmt)
>  						frmival.pixel_format |= 1U << 31;
> -				} else if (isdigit(optarg[0])) {
> +				} else if (is_digits(optarg)) {
>  					frmival.pixel_format = strtol(value, nullptr, 0);
>  				} else {
>  					fprintf(stderr, "The pixelformat '%s' is invalid\n", optarg);

Ditto for these two changes.

> diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
> index 0eb4bb5c9200a32c1fa056d73d2c1f4e050e7e23..cfe33f32f52286a5b23421ad4222918feafe03d2 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl.cpp
> @@ -812,7 +812,7 @@ int parse_fmt(char *optarg, __u32 &width, __u32 &height, __u32 &pixelformat,
>  						    value[2], value[3]);
>  				if (be_pixfmt)
>  					pixelformat |= 1U << 31;
> -			} else if (isdigit(value[0])) {
> +			} else if (is_digits(value)) {
>  				pixelformat = strtol(value, nullptr, 0);
>  			} else {
>  				fprintf(stderr, "The pixelformat '%s' is invalid\n", value);
> @@ -950,7 +950,7 @@ static __u32 parse_event(const char *e, const char **name)
>  	__u32 event = 0;
>  
>  	*name = "0";
> -	if (isdigit(e[0])) {
> +	if (is_digits(e)) {
>  		event = strtoul(e, nullptr, 0);
>  		if (event == V4L2_EVENT_CTRL) {
>  			fprintf(stderr, "Missing control name for ctrl event, use ctrl=<name>\n");

And these two.

It's only for control names that you need this new test.

> diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
> index b0d42110ca0fbbf05dc3957a6fe08f426947b871..132ac64a35414a9be47997ca1b26319ce5adc664 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.h
> +++ b/utils/v4l2-ctl/v4l2-ctl.h
> @@ -1,9 +1,11 @@
>  #ifndef _V4L2_CTL_H
>  #define _V4L2_CTL_H
>  
> +#include <algorithm>
>  #include <cstdint>
>  #include <linux/videodev2.h>
>  #include <linux/v4l2-subdev.h>
> +#include <string>
>  #include <v4l-getsubopt.h>
>  
>  #include <v4l2-info.h>
> @@ -331,6 +333,13 @@ static inline bool subscribe_event(cv4l_fd &fd, __u32 type)
>  	return !fd.subscribe_event(sub);
>  }
>  
> +static inline bool is_digits(const std::string &str)
> +{
> +	if (str.empty())
> +		return false;
> +	return std::all_of(str.begin(), str.end(), isdigit);
> +}
> +
>  #define doioctl(n, r, p) doioctl_name(n, r, p, #r)
>  
>  #define info(fmt, args...) 			\
> 
> ---
> base-commit: 48316b8a20aac35f982991b617f84fb3c104e7b0
> change-id: 20250813-fix_3alock-fdac270ae321
> 
> Best regards,

Regards,

	Hans

