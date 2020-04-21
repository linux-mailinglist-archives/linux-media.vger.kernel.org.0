Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4055D1B21EC
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 10:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728285AbgDUIor (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 04:44:47 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:48151 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726095AbgDUIoq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 04:44:46 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id QoWHj6Fv27xncQoWKjJhAm; Tue, 21 Apr 2020 10:44:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587458684; bh=xpasMQ61siPCGTsMtWhVfmJ/XR24RLq8aAYLb3XfVbw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=biph2zPBErBJljkNZ6++ebzAqP2sH4jyNFAVB5+WKm7BFhZxodGCi+JYiY9AYD/3B
         eeZkQo4A+PUQy4aEMYCOrs8wp1gL6q5h4KMxkozRlupacTwjq4AfZU+ZueA6q8casq
         Dndk4kzabU8h/WHz56gupac60gRJY7hM/SVmYKhzIUvGnQBAqBUK64j+EMFQhkXzcj
         RWxc6HsDwYZDWAPvTWwCWr3GhW6rYew/GpK8XzhOXluTjgYlxIfNH4YDtRnGutWAUy
         w4DRooNMzply9euFNdK2EzqBw8UxkcB2g8B3vU7FbgzWiNXHnSyTb5PGK1GsegGO2L
         v7mIBTHk7ne+A==
Subject: Re: [PATCH 6/7] utils: use bool literals
To:     Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20200420184649.4202-1-rosenp@gmail.com>
 <20200420184649.4202-6-rosenp@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <862bc530-c598-a64e-c7a6-7bfd78182d50@xs4all.nl>
Date:   Tue, 21 Apr 2020 10:44:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200420184649.4202-6-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNQ7Py/pKmrcQGuPB3KZYlq99yXTmDKnZtDd98NI6/f5SyG7+mE95nHWJIbKAcDyz9OUFTHqlkuDem422oXd7RZDenuBY5qz0j2/KSylkItqS/aL0/8l
 VQCUv92E5ZMZavL+cCcxqLE52nZYSKxn27ppLlGDPy2cTH2Ox3QSGmwkv34gWGCkq9XjLN0PvtHocqp+y8SJZDno3mMtn6rAF/U=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/04/2020 20:46, Rosen Penev wrote:
> Found with clang-tidy's modernize-use-bool-literals
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/cec-compliance/cec-compliance.cpp   | 2 +-
>  utils/cec-compliance/cec-test.cpp         | 2 +-
>  utils/cec-ctl/cec-ctl.cpp                 | 2 +-
>  utils/cec-follower/cec-follower.cpp       | 2 +-
>  utils/cec-follower/cec-processing.cpp     | 2 +-
>  utils/rds-ctl/rds-ctl.cpp                 | 2 +-
>  utils/v4l2-compliance/v4l2-compliance.cpp | 4 ++--
>  utils/v4l2-ctl/v4l2-ctl-streaming.cpp     | 2 +-
>  utils/v4l2-ctl/v4l2-ctl.cpp               | 6 +++---
>  utils/v4l2-dbg/v4l2-dbg.cpp               | 2 +-
>  10 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
> index b665303e..6d07bfc9 100644
> --- a/utils/cec-compliance/cec-compliance.cpp
> +++ b/utils/cec-compliance/cec-compliance.cpp
> @@ -1166,7 +1166,7 @@ int main(int argc, char **argv)
>  			short_options[idx++] = ':';
>  		}
>  	}
> -	while (1) {
> +	while (true) {
>  		int option_index = 0;
>  
>  		short_options[idx] = 0;
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index 4aa54afc..a82069ad 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -889,7 +889,7 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
>  	if (ret)
>  		return ret;
>  
> -	while (1) {
> +	while (true) {
>  		cec_msg_init(&msg, me, la);
>  		cec_msg_tuner_step_increment(&msg);
>  		fail_on_test(!transmit(node, &msg));
> diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
> index be37ae3c..46cfcd80 100644
> --- a/utils/cec-ctl/cec-ctl.cpp
> +++ b/utils/cec-ctl/cec-ctl.cpp
> @@ -1863,7 +1863,7 @@ int main(int argc, char **argv)
>  		if (long_options[i].has_arg == required_argument)
>  			short_options[idx++] = ':';
>  	}
> -	while (1) {
> +	while (true) {
>  		int option_index = 0;
>  		struct cec_msg msg;
>  
> diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
> index 12bb5f15..ab3113b6 100644
> --- a/utils/cec-follower/cec-follower.cpp
> +++ b/utils/cec-follower/cec-follower.cpp
> @@ -331,7 +331,7 @@ int main(int argc, char **argv)
>  			short_options[idx++] = ':';
>  		}
>  	}
> -	while (1) {
> +	while (true) {
>  		int option_index = 0;
>  
>  		short_options[idx] = 0;
> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> index 34b54fa3..8e3a33a2 100644
> --- a/utils/cec-follower/cec-processing.cpp
> +++ b/utils/cec-follower/cec-processing.cpp
> @@ -885,7 +885,7 @@ void testProcessing(struct node *node, bool wallclock)
>  
>  	poll_remote_devs(node, me);
>  
> -	while (1) {
> +	while (true) {
>  		int res;
>  		struct timeval timeval = {};
>  
> diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
> index 2d561481..fef2a3f1 100644
> --- a/utils/rds-ctl/rds-ctl.cpp
> +++ b/utils/rds-ctl/rds-ctl.cpp
> @@ -757,7 +757,7 @@ static int parse_cl(int argc, char **argv)
>  		if (long_options[i].has_arg == required_argument)
>  			short_options[idx++] = ':';
>  	}
> -	while (1) {
> +	while (true) {
>  		int option_index = 0;
>  
>  		short_options[idx] = 0;
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index bb32bae6..39dd1aec 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -834,7 +834,7 @@ static int open_media_bus_info(const std::string &bus_info, std::string &media_d
>  	while ((ep = readdir(dp))) {
>  		const char *name = ep->d_name;
>  
> -		if ((!memcmp(name, "media", 5) != 0) && isdigit(name[5])) {
> +		if ((!(memcmp(name, "media", 5) != 0)) && isdigit(name[5])) {

Huh? Seems a stray change.

I'm skipping this change, but I'll apply the remainder of this patch.

Regards,

	Hans

>  			struct media_device_info mdi;
>  			media_devname = std::string("/dev/") + name;
>  
> @@ -1519,7 +1519,7 @@ int main(int argc, char **argv)
>  			short_options[idx++] = ':';
>  		}
>  	}
> -	while (1) {
> +	while (true) {
>  		int option_index = 0;
>  
>  		short_options[idx] = 0;
> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> index de40c5ad..833263b6 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
> @@ -2742,7 +2742,7 @@ static void streaming_set_cap2out(cv4l_fd &fd, cv4l_fd &out_fd)
>  	if (use_poll)
>  		fcntl(fd.g_fd(), F_SETFL, fd_flags | O_NONBLOCK);
>  
> -	while (1) {
> +	while (true) {
>  		struct timeval tv = { use_poll ? 2 : 0, 0 };
>  		int r = 0;
>  
> diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
> index 42889ef8..c0097203 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl.cpp
> @@ -1145,7 +1145,7 @@ int main(int argc, char **argv)
>  			short_options[idx++] = ':';
>  		}
>  	}
> -	while (1) {
> +	while (true) {
>  		int option_index = 0;
>  
>  		short_options[idx] = 0;
> @@ -1531,7 +1531,7 @@ int main(int argc, char **argv)
>  			__u32 seq = 0;
>  
>  			fcntl(fd, F_SETFL, fcntl(fd, F_GETFL) | O_NONBLOCK);
> -			while (1) {
> +			while (true) {
>  				int res;
>  
>  				FD_ZERO(&fds);
> @@ -1572,7 +1572,7 @@ int main(int argc, char **argv)
>  
>  			fcntl(fd, F_SETFL, fcntl(fd, F_GETFL) | O_NONBLOCK);
>  			epoll_ctl(epollfd, EPOLL_CTL_ADD, fd, &epoll_ev);
> -			while (1) {
> +			while (true) {
>  				int res;
>  
>  				res = epoll_wait(epollfd, &epoll_ev, 1, -1);
> diff --git a/utils/v4l2-dbg/v4l2-dbg.cpp b/utils/v4l2-dbg/v4l2-dbg.cpp
> index 17ab0210..dcf8200a 100644
> --- a/utils/v4l2-dbg/v4l2-dbg.cpp
> +++ b/utils/v4l2-dbg/v4l2-dbg.cpp
> @@ -442,7 +442,7 @@ int main(int argc, char **argv)
>  			short_options[idx++] = ':';
>  		}
>  	}
> -	while (1) {
> +	while (true) {
>  		int option_index = 0;
>  
>  		short_options[idx] = 0;
> 

