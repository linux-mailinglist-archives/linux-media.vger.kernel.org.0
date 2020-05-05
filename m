Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4AE81C515B
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 10:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgEEIx3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 04:53:29 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:33887 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726337AbgEEIx3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 04:53:29 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id VtKKjTXUUhEkrVtKPjx1WJ; Tue, 05 May 2020 10:53:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588668805; bh=ctCJeV2nkRm24GOv6OUM85FNxyI3PfiCY2rIRwEWE9w=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=OeW34AoZVeLvLOYs2QNijKzXGk86f5Qs4yRU6ZYCDFL3l1NsSm2cK1EPjIekhGBc2
         BrY3VC61seuBUjWwOg/LBGrUjMn12aY3jH8Zo1rX93H1MM44TDSlBeC+4TBIjJBRFp
         gLbI2985XxotEX6KVMunMSROeAxgKzvIQ3+m4O3XHR8of0ZjlLQnWn8USb7mJ9cBgY
         zjfB+nn0l45S9dR6OTHHEMXg6fMylP1j+jGw8UGQyy5D3nru6T3YgBwv64D1Eq4Dxm
         XK9qq/IhxeJNlhm8It6ZVK7XP5aNCEfSVFfX9xifVfpDFx7wAFq6acSsTA1nB1bLhR
         sAa+LSW/ACrfQ==
Subject: Re: [PATCH 1/7] utils: replace strchr with std variant
To:     Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20200429040627.27859-1-rosenp@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <309f80c4-f7b0-f2ae-f4c9-752a6bacc9a4@xs4all.nl>
Date:   Tue, 5 May 2020 10:53:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200429040627.27859-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfM3jxjXx5D0Eva5+ZoD5fi0sJbKbA6k1zgAQQkPLipkqKphD7AJ6PjdtM3CoeR7HTNOoGA/6sjG8IIOa1C5P5aWyBVWuBZ8YbkTvXOG2oMgIPvCoy25R
 XJndmPFUJ3VKW64qpd/kpSqmiwE8SFaWAiRY3UCsQ9peEthb8HIJ2wjkYQMoFBev+QAWTMSQG7YD80o7QRydl5VUjuQgdhEAeYw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rosen,

Why this change? The commit log is empty, so I have no idea what the reason
is for making this change. Same for the next 3 patches.

Regards,

	Hans

On 29/04/2020 06:06, Rosen Penev wrote:
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/cec-compliance/cec-test.cpp         |  5 +++--
>  utils/cec-ctl/cec-ctl.cpp                 | 13 +++++++------
>  utils/cec-follower/cec-follower.cpp       |  5 +++--
>  utils/libcecutil/cec-parse.cpp            |  4 ++--
>  utils/v4l2-compliance/v4l2-compliance.cpp |  5 +++--
>  utils/v4l2-ctl/v4l2-ctl-common.cpp        |  8 ++++----
>  utils/v4l2-ctl/v4l2-ctl-edid.cpp          |  5 +++--
>  utils/v4l2-ctl/v4l2-ctl-streaming.cpp     |  7 ++++---
>  utils/v4l2-ctl/v4l2-ctl-vbi.cpp           |  5 +++--
>  utils/v4l2-dbg/v4l2-dbg.cpp               |  4 ++--
>  10 files changed, 34 insertions(+), 27 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index 50d434b9..a84f83d3 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -3,10 +3,11 @@
>   * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>   */
>  
> +#include <cstring>
> +
>  #include <unistd.h>
>  #include <stdlib.h>
>  #include <stdio.h>
> -#include <string.h>
>  #include <inttypes.h>
>  #include <sys/types.h>
>  #include <sys/stat.h>
> @@ -1530,7 +1531,7 @@ void listTests()
>  
>  int setExpectedResult(char *optarg, bool no_warnings)
>  {
> -	char *equal = strchr(optarg, '=');
> +	char *equal = std::strchr(optarg, '=');
>  
>  	if (!equal || equal == optarg || !isdigit(equal[1]))
>  		return 1;
> diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
> index b8edb105..7db7ca38 100644
> --- a/utils/cec-ctl/cec-ctl.cpp
> +++ b/utils/cec-ctl/cec-ctl.cpp
> @@ -3,10 +3,11 @@
>   * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>   */
>  
> +#include <cstring>
> +
>  #include <unistd.h>
>  #include <stdlib.h>
>  #include <stdio.h>
> -#include <string.h>
>  #include <inttypes.h>
>  #include <getopt.h>
>  #include <sys/types.h>
> @@ -1917,7 +1918,7 @@ int main(int argc, char **argv)
>  		case OptIgnore: {
>  			bool all_la = !strncmp(optarg, "all", 3);
>  			bool all_opcodes = true;
> -			const char *sep = strchr(optarg, ',');
> +			const char *sep = std::strchr(optarg, ',');
>  			unsigned la_mask = 0xffff, opcode, la = 0;
>  
>  			if (sep)
> @@ -2068,7 +2069,7 @@ int main(int argc, char **argv)
>  							size--;
>  							break;
>  						}
> -						value = strchr(value, ':');
> +						value = std::strchr(value, ':');
>  						if (value == NULL)
>  							break;
>  						value++;
> @@ -2109,7 +2110,7 @@ int main(int argc, char **argv)
>  							size--;
>  							break;
>  						}
> -						value = strchr(value, ':');
> +						value = std::strchr(value, ':');
>  						if (value == NULL)
>  							break;
>  						value++;
> @@ -2150,7 +2151,7 @@ int main(int argc, char **argv)
>  							size--;
>  							break;
>  						}
> -						value = strchr(value, ':');
> +						value = std::strchr(value, ':');
>  						if (value == NULL)
>  							break;
>  						value++;
> @@ -2184,7 +2185,7 @@ int main(int argc, char **argv)
>  							size--;
>  							break;
>  						}
> -						value = strchr(value, ':');
> +						value = std::strchr(value, ':');
>  						if (value == NULL)
>  							break;
>  						value++;
> diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
> index 7c8c044e..589426ec 100644
> --- a/utils/cec-follower/cec-follower.cpp
> +++ b/utils/cec-follower/cec-follower.cpp
> @@ -3,10 +3,11 @@
>   * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>   */
>  
> +#include <cstring>
> +
>  #include <unistd.h>
>  #include <stdlib.h>
>  #include <stdio.h>
> -#include <string.h>
>  #include <inttypes.h>
>  #include <getopt.h>
>  #include <sys/types.h>
> @@ -386,7 +387,7 @@ int main(int argc, char **argv)
>  		case OptIgnore: {
>  			bool all_la = !strncmp(optarg, "all", 3);
>  			bool all_opcodes = true;
> -			const char *sep = strchr(optarg, ',');
> +			const char *sep = std::strchr(optarg, ',');
>  			unsigned la_mask = 0xffff, opcode, la = 0;
>  
>  			if (sep)
> diff --git a/utils/libcecutil/cec-parse.cpp b/utils/libcecutil/cec-parse.cpp
> index 5fffcce7..8c869fec 100644
> --- a/utils/libcecutil/cec-parse.cpp
> +++ b/utils/libcecutil/cec-parse.cpp
> @@ -6,7 +6,6 @@
>  #include <unistd.h>
>  #include <stdlib.h>
>  #include <stdio.h>
> -#include <string.h>
>  #include <inttypes.h>
>  #include <getopt.h>
>  #include <sys/types.h>
> @@ -18,6 +17,7 @@
>  #include <errno.h>
>  #include <sys/ioctl.h>
>  #include <stdarg.h>
> +#include <cstring>
>  #include <ctime>
>  #include <cerrno>
>  #include <string>
> @@ -191,7 +191,7 @@ unsigned cec_parse_phys_addr(const char *value)
>  {
>  	unsigned p1, p2, p3, p4;
>  
> -	if (!strchr(value, '.'))
> +	if (!std::strchr(value, '.'))
>  		return strtoul(value, NULL, 0);
>  	if (sscanf(value, "%x.%x.%x.%x", &p1, &p2, &p3, &p4) != 4) {
>  		fprintf(stderr, "Expected a physical address of the form x.x.x.x\n");
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index da8a7d10..5b715fa5 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -18,10 +18,11 @@
>      Foundation, Inc., 51 Franklin Street, Suite 500, Boston, MA  02110-1335  USA
>   */
>  
> +#include <cstring>
> +
>  #include <unistd.h>
>  #include <stdlib.h>
>  #include <stdio.h>
> -#include <string.h>
>  #include <inttypes.h>
>  #include <getopt.h>
>  #include <sys/types.h>
> @@ -1580,7 +1581,7 @@ int main(int argc, char **argv)
>  			break;
>  		case OptStreamFrom:
>  		case OptStreamFromHdr: {
> -			char *equal = strchr(optarg, '=');
> +			char *equal = std::strchr(optarg, '=');
>  			bool has_hdr = ch == OptStreamFromHdr;
>  
>  			if (equal == optarg)
> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> index bbd00e95..764d984a 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> @@ -1,7 +1,6 @@
>  #include <unistd.h>
>  #include <stdlib.h>
>  #include <stdio.h>
> -#include <string.h>
>  #include <inttypes.h>
>  #include <getopt.h>
>  #include <sys/types.h>
> @@ -22,6 +21,7 @@
>  #include <sys/klog.h>
>  #endif
>  
> +#include <cstring>
>  #include <list>
>  #include <vector>
>  #include <map>
> @@ -741,7 +741,7 @@ static bool parse_subset(char *optarg)
>  
>  	memset(&subset, 0, sizeof(subset));
>  	while (*optarg) {
> -		p = strchr(optarg, ',');
> +		p = std::strchr(optarg, ',');
>  		if (p)
>  			*p = 0;
>  		if (optarg[0] == 0) {
> @@ -808,7 +808,7 @@ void common_cmd(const std::string &media_bus_info, int ch, char *optarg)
>  				common_usage();
>  				std::exit(EXIT_FAILURE);
>  			}
> -			if (strchr(value, '=')) {
> +			if (std::strchr(value, '=')) {
>  				common_usage();
>  				std::exit(EXIT_FAILURE);
>  			}
> @@ -824,7 +824,7 @@ void common_cmd(const std::string &media_bus_info, int ch, char *optarg)
>  				common_usage();
>  				std::exit(EXIT_FAILURE);
>  			}
> -			if (const char *equal = strchr(value, '=')) {
> +			if (const char *equal = std::strchr(value, '=')) {
>  				set_ctrls[std::string(value, (equal - value))] = equal + 1;
>  			}
>  			else {
> diff --git a/utils/v4l2-ctl/v4l2-ctl-edid.cpp b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
> index a2df6089..b13d8209 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-edid.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-edid.cpp
> @@ -1,7 +1,8 @@
> +#include <cstring>
> +
>  #include <unistd.h>
>  #include <stdlib.h>
>  #include <stdio.h>
> -#include <string.h>
>  #include <inttypes.h>
>  #include <fcntl.h>
>  #include <ctype.h>
> @@ -710,7 +711,7 @@ static unsigned short parse_phys_addr(const char *value)
>  {
>  	unsigned p1, p2, p3, p4;
>  
> -	if (!strchr(value, '.'))
> +	if (!std::strchr(value, '.'))
>  		return strtoul(value, NULL, 0);
>  	if (sscanf(value, "%x.%x.%x.%x", &p1, &p2, &p3, &p4) != 4) {
>  		fprintf(stderr, "Expected a physical address of the form x.x.x.x\n");
> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> index 95ffe986..59783ff3 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> @@ -1,7 +1,8 @@
> +#include <cstring>
> +
>  #include <unistd.h>
>  #include <stdlib.h>
>  #include <stdio.h>
> -#include <string.h>
>  #include <inttypes.h>
>  #include <getopt.h>
>  #include <sys/types.h>
> @@ -1660,7 +1661,7 @@ static FILE *open_output_file(cv4l_fd &fd)
>  	if (!host_to)
>  		return NULL;
>  
> -	char *p = strchr(host_to, ':');
> +	char *p = std::strchr(host_to, ':');
>  	struct sockaddr_in serv_addr;
>  	struct hostent *server;
>  	struct v4l2_fract aspect;
> @@ -1925,7 +1926,7 @@ static FILE *open_input_file(cv4l_fd &fd, __u32 type)
>  	if (!host_from)
>  		return NULL;
>  
> -	char *p = strchr(host_from, ':');
> +	char *p = std::strchr(host_from, ':');
>  	int listen_fd;
>  	socklen_t clilen;
>  	struct sockaddr_in serv_addr = {}, cli_addr;
> diff --git a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
> index 6a4f627f..ee55012f 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
> @@ -1,7 +1,8 @@
> +#include <cstring>
> +
>  #include <unistd.h>
>  #include <stdlib.h>
>  #include <stdio.h>
> -#include <string.h>
>  #include <inttypes.h>
>  #include <getopt.h>
>  #include <sys/types.h>
> @@ -98,7 +99,7 @@ void vbi_cmd(int ch, char *optarg)
>  			std::exit(EXIT_FAILURE);
>  		}
>  		while (*optarg) {
> -			subs = strchr(optarg, ',');
> +			subs = std::strchr(optarg, ',');
>  			if (subs)
>  				*subs = 0;
>  
> diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
> index f2fd8269..86266376 100644
> --- a/utils/v4l2-dbg/v4l2-dbg.cpp
> +++ b/utils/v4l2-dbg/v4l2-dbg.cpp
> @@ -19,7 +19,6 @@
>  #include <unistd.h>
>  #include <stdlib.h>
>  #include <stdio.h>
> -#include <string.h>
>  #include <inttypes.h>
>  #include <getopt.h>
>  #include <sys/types.h>
> @@ -43,6 +42,7 @@
>  
>  #include <linux/videodev2.h>
>  
> +#include <cstring>
>  #include <list>
>  #include <vector>
>  #include <map>
> @@ -731,7 +731,7 @@ int main(int argc, char **argv)
>  			goto list_done;
>  		}
>  
> -		p = strchr(chip_info.name, ' ');
> +		p = std::strchr(chip_info.name, ' ');
>  		if (p)
>  			*p = '\0';
>  		name = chip_info.name;
> 

