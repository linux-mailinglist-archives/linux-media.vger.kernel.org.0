Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 985A01CD283
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 09:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728485AbgEKHXO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 03:23:14 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:59827 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725790AbgEKHXO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 03:23:14 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Y2mMjxFvZtKAsY2mNjnPJC; Mon, 11 May 2020 09:23:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589181791; bh=oC+e3XYa3m5hM/+RhsddF6MqlPDEj5a8ZM9XapNLfxM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=r83/BKDiUhTRnJ+fZjiXx3No1HZh9bZJTwj6Gcfw3QnDVJFuwvhYM2pq2TGZskU2y
         yYlSCVBtOfPbeivjd96qh0tveG30BVlX3YxadtjivnstzaQQX0jFt0XfQg1yJ2U536
         5x5/jc6XG7KvGVN51wM+J7dZzmmUa4xPj1rXRCeiSoiidkKGs4jl51LbE4SPyiwt29
         9XBUuaSzNa3NunisMhW/OfRh5wCf1fhf5jpLX1HOmBL+Ztj0kK0Qp465F0LXGeGeoR
         cQJq/OhXJzw3SaIRtE5HMBxViLdimkHVYr4not3rl8igoIvzFmjjMO+jSwHxwny94K
         uO5ejlWL1lc1g==
Subject: Re: [PATCH 2/3] utils: switch strstr to std variant
To:     Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20200511012549.1145814-1-rosenp@gmail.com>
 <20200511012549.1145814-2-rosenp@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1b714b14-6d56-f697-7ef1-2b3411ee653d@xs4all.nl>
Date:   Mon, 11 May 2020 09:23:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200511012549.1145814-2-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPgKPF0+VDI+V22NVThN0d7MJm+DxIBVvVjMyCogrnW2e1V/nc2Kf27FbkPWg0xFi0q7h3Wg3+FLYqIdhBmxlDBSUOVGXRmBHd/eCixwWphZnYiuBA2Y
 1/cVKc7JYzgUqYJBEsjjT7XEHWbfesDpx82zOK73Eo7lI/9jvvaBS1/nIYXHm+aiPl44IU324nlCxw2Hj00rgXKVP457YZTh7q4kVk/F0f57Mwhn/DBw3Iab
 xhqovbE5YX1/m0xAphIfvII2dzRHruNlfqwlOOM0zgexyhxirXXslF9WU8Hqu2CpNrimqSQvh7FKeRL+HUgI4Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/05/2020 03:25, Rosen Penev wrote:
> strstr has const overloads in std, avoiding pointless conversions.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

This introduces a compile error:

v4l2-ctl-misc.cpp: In function ‘void misc_cmd(int, char*)’:
v4l2-ctl-misc.cpp:215:14: error: ‘strstr’ is not a member of ‘std’; did you mean ‘strstr’?
  215 |     if (std::strstr(value, "dht"))
      |              ^~~~~~
In file included from v4l2-ctl-misc.cpp:4:
/usr/include/string.h:323:1: note: ‘strstr’ declared here
  323 | strstr (const char *__haystack, const char *__needle) __THROW
      | ^~~~~~
v4l2-ctl-misc.cpp:217:14: error: ‘strstr’ is not a member of ‘std’; did you mean ‘strstr’?
  217 |     if (std::strstr(value, "dqt"))
      |              ^~~~~~
In file included from v4l2-ctl-misc.cpp:4:
/usr/include/string.h:323:1: note: ‘strstr’ declared here
  323 | strstr (const char *__haystack, const char *__needle) __THROW
      | ^~~~~~
v4l2-ctl-misc.cpp:219:14: error: ‘strstr’ is not a member of ‘std’; did you mean ‘strstr’?
  219 |     if (std::strstr(value, "dri"))
      |              ^~~~~~
In file included from v4l2-ctl-misc.cpp:4:
/usr/include/string.h:323:1: note: ‘strstr’ declared here
  323 | strstr (const char *__haystack, const char *__needle) __THROW
      | ^~~~~~

Probably a missing header.

Regards,

	Hans

> ---
>  utils/libcecutil/cec-log.cpp       | 2 +-
>  utils/v4l2-ctl/v4l2-ctl-common.cpp | 4 ++--
>  utils/v4l2-ctl/v4l2-ctl-misc.cpp   | 6 +++---
>  utils/v4l2-dbg/v4l2-dbg.cpp        | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/utils/libcecutil/cec-log.cpp b/utils/libcecutil/cec-log.cpp
> index 9410c071..0dcb4675 100644
> --- a/utils/libcecutil/cec-log.cpp
> +++ b/utils/libcecutil/cec-log.cpp
> @@ -62,7 +62,7 @@ static void log_arg(const struct cec_arg *arg, const char *arg_name, __u32 val)
>  		}
>  		return;
>  	case CEC_ARG_TYPE_U16:
> -		if (strstr(arg_name, "phys-addr"))
> +		if (std::strstr(arg_name, "phys-addr"))
>  			printf("\t%s: %x.%x.%x.%x\n", arg_name, cec_phys_addr_exp(val));
>  		else
>  			printf("\t%s: %u (0x%04x)\n", arg_name, val, val);
> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> index 47f5da1a..0640a521 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> @@ -1190,13 +1190,13 @@ void common_get(cv4l_fd &_fd)
>  				char *q;
>  
>  				buf[len] = 0;
> -				while ((q = strstr(p, "START STATUS"))) {
> +				while ((q = std::strstr(p, "START STATUS"))) {
>  					p = q + 1;
>  				}
>  				if (p) {
>  					while (p > buf && *p != '<') p--;
>  					q = p;
> -					while ((q = strstr(q, "<6>"))) {
> +					while ((q = std::strstr(q, "<6>"))) {
>  						memcpy(q, "   ", 3);
>  					}
>  					printf("%s", p);
> diff --git a/utils/v4l2-ctl/v4l2-ctl-misc.cpp b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
> index 6db87568..deb481b4 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-misc.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-misc.cpp
> @@ -212,11 +212,11 @@ void misc_cmd(int ch, char *optarg)
>  				jpegcomp.quality = strtol(value, 0L, 0);
>  				break;
>  			case 17:
> -				if (strstr(value, "dht"))
> +				if (std::strstr(value, "dht"))
>  					jpegcomp.jpeg_markers |= V4L2_JPEG_MARKER_DHT;
> -				if (strstr(value, "dqt"))
> +				if (std::strstr(value, "dqt"))
>  					jpegcomp.jpeg_markers |= V4L2_JPEG_MARKER_DQT;
> -				if (strstr(value, "dri"))
> +				if (std::strstr(value, "dri"))
>  					jpegcomp.jpeg_markers |= V4L2_JPEG_MARKER_DRI;
>  				break;
>  			case 18:
> diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
> index 86266376..06301ae0 100644
> --- a/utils/v4l2-dbg/v4l2-dbg.cpp
> +++ b/utils/v4l2-dbg/v4l2-dbg.cpp
> @@ -784,14 +784,14 @@ list_done:
>  				char *q;
>  
>  				buf[len] = 0;
> -				while ((q = strstr(p, "START STATUS"))) {
> +				while ((q = std::strstr(p, "START STATUS"))) {
>  					found_status = true;
>  					p = q + 1;
>  				}
>  				if (found_status) {
>  					while (p > buf && *p != '<') p--;
>  					q = p;
> -					while ((q = strstr(q, "<6>"))) {
> +					while ((q = std::strstr(q, "<6>"))) {
>  						memcpy(q, "   ", 3);
>  					}
>  					printf("%s", p);
> 

