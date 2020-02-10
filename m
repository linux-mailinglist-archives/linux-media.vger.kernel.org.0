Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 984F7157361
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2020 12:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727369AbgBJLXq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 06:23:46 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:58689 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726796AbgBJLXp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 06:23:45 -0500
Received: from [IPv6:2001:983:e9a7:1:59b:9f2a:47ac:4926]
 ([IPv6:2001:983:e9a7:1:59b:9f2a:47ac:4926])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 17AEj9ksjn7E517AFjl1qs; Mon, 10 Feb 2020 12:23:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581333823; bh=JYwpin1MXjDDDa83dsQF04utXRrnUiqC0jirKc80Q6g=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=EyfxWd6cLQHXx7n7ssRiXtR+08vh9lbmSh+tlrbjtGwLumrGw5ygvc6UhPbdrKTd3
         4/E7aCyizDgDsfeGLYYS6Fb1niaXJqeUe7SWhJl4NpTJMaraIYia0ZoNDCKp+d7n25
         QTH4efxCnz5UCPHa1pbaJUsqGeJevzwz0QiE/S6UnY0JYUWU1WIbOMeBFnOLjoAdHW
         ITIA+35TiEwRiYwwTUrlwqVsLUJ4Nevie1A8YopQqtL+OmsPImnIaBu1JGo17HyqqF
         XjqYgGCvv3ZqzMVxiMZEFm52pS3VF3st7YpEDBiSJGabsV6dwS07sCxij5adJSedIl
         WeCvGYHdivqfw==
Subject: Re: [PATCH 1/2] edid-decode: add function to enable usage as a
 library
To:     Ilia Mirkin <imirkin@alum.mit.edu>, linux-media@vger.kernel.org
References: <20200209174937.22844-1-imirkin@alum.mit.edu>
 <20200209174937.22844-2-imirkin@alum.mit.edu>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <3e56402b-9841-99a3-730c-b1fd2bc2cc5d@xs4all.nl>
Date:   Mon, 10 Feb 2020 12:23:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200209174937.22844-2-imirkin@alum.mit.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNoFjWowKspPq0WDjig/d7Y80TJTVaLUS/09etQsaVVJ4g1jrRZptLGIjcw8et2Ea23x1b86Nmsw+PAONLwcM7HmhKy/eCTmNEz90c2SKYewT5xtYqeB
 kUOqOGbuHH6NtR9FGJEaleUJOLxKQDg5waEhpSw3Wjyvb9UIEiTG8kw0GyTJDPUJX13TTR2vTJ1zlUNegVdg1BtE4ypAp4f+6+TOtX2iabVxdAgWBJVfcGpU
 23pNsQ5n7OKITV2ihCLpyAqgjp+QqAnjw47qJ/IRRKGZsS+xivG+Ew3a12jkJPqJfJ3FvfTERUgZG9vKKso6Kw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ilia,

I pushed my patch to initialize edid_state in the constructor to the
edid-decode git repo.

I've also split off the 'write to a file' part from edid_from_file into
a separate edid_to_file function, so you'll have to rebase your patch.

Two comments below:

On 2/9/20 6:49 PM, Ilia Mirkin wrote:
> This is helpful for an emscripten setup, as there's no great way to
> reinitialize the object from scratch.
> 
> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
> ---
>  edid-decode.cpp | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/edid-decode.cpp b/edid-decode.cpp
> index ef50da2..fd17bc6 100644
> --- a/edid-decode.cpp
> +++ b/edid-decode.cpp
> @@ -1005,3 +1005,21 @@ int main(int argc, char **argv)
>  		return edid_from_file(argv[optind], argv[optind + 1], out_fmt);
>  	return ret ? ret : state.parse_edid();
>  }
> +
> +#ifdef __EMSCRIPTEN__
> +/*
> + * The surrounding JavaScript implementation will call this function
> + * each time it wants to decode an EDID. So this should reset all the
> + * state and start over.
> + */
> +extern "C" int parse_edid(const char *input) {

'{' should start on the next line. Let's keep the coding style consistent.

> +	for (unsigned i = 0; i < EDID_MAX_BLOCKS + 1; i++) {
> +		s_msgs[i][0].clear();
> +		s_msgs[i][1].clear();
> +	}

I'm pretty sure that this for loop is not necessary. Can you drop this
for loop and see if it works?

> +	options[OptCheck] = 1;
> +	state = edid_state();
> +	int ret = edid_from_file(input, NULL, OUT_FMT_DEFAULT);
> +	return ret ? ret : state.parse_edid();
> +}
> +#endif
> 

Regards,

	Hans
