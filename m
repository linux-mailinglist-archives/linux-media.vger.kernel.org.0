Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB371259B3F
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 19:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729853AbgIAQ65 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Sep 2020 12:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732497AbgIAQ6x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Sep 2020 12:58:53 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 326BBC061244;
        Tue,  1 Sep 2020 09:58:53 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id f18so1132241pfa.10;
        Tue, 01 Sep 2020 09:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hbLywgShsnuHsUn2KPFm85Q/XjLDaiF9CQkPiOZ3tQ8=;
        b=mwTMQx6x5N/kKMJ0gc0w8CXrrhYtnf8KLypsDqsqUCpubEuoV5AIs3VZEvFDQPFYH5
         EHSaJpnSOGZqlbWXvkQNHaJHBvA3np24QkXbHFFAa8HgvX8JBMkNUFnPq46zXqaB0lXR
         pgmlFNadWTfafWkiqq116Kk7ZQeZyqAVBEwcGQVdwPCMVAr9nco23+ZfyQpeND2y/qLN
         wpV1aJ2Za8gIp5Qkb6IpCWeliHZ2Jr4Sshji6U9gCFph8Yehoz+vVW1EKOb6Cd4KWmMm
         fwdCjlc1EMIwo5/yzLLZrFGbXOJ8tKqEZ4PrJb/kWYCJrEkgwFqRO6sz1CbQ08zLt6LX
         rHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=hbLywgShsnuHsUn2KPFm85Q/XjLDaiF9CQkPiOZ3tQ8=;
        b=ZOC1JK4EtvQ6tzpscayS69l6JNfOoUwe3Pa1VCOjlFmdHvs9vDUcQ/MonmtHqy3YTN
         5fPpHHYxxbnOiAbceqpHxZh91CmAxQkjrQJskimghoDK5nmxhTMPCOIYC1PefoF4n+AJ
         2ye9UihBKAcxVadHsZSgWMI/9nP2qJnhRvGdQGs8SNb4t402yOqoGAesDu9GDOtbJsdo
         pyuZ/fHg3SPmB+S78lGYQsYfifzf9ANJte0G/YSOvrX0sK9/X+oS1yJIy6Kgf8VLpeYl
         IxrYQnQR5K2SPnY/Pk+FCQ5WoSgP5EI0nEoY4IiZm7rhwCSuCar3J6nmRqi2kaaWlTOp
         FGvg==
X-Gm-Message-State: AOAM5312mHQ/rLCCY7re88dWKtd4thYSpJqZ34UFxQYjAVWUxAieHqXg
        Bnzg+F9M09RZuKzgA/Lz4EE=
X-Google-Smtp-Source: ABdhPJyV6IDjIGBD4w5+xbU+nY8K13X4kuRYAXGzcxgebkDj9ZVUAGaG2ngFXqwDFMsNIDyxFR9/Wg==
X-Received: by 2002:a62:8309:: with SMTP id h9mr2785040pfe.104.1598979532722;
        Tue, 01 Sep 2020 09:58:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e124sm2663450pfa.87.2020.09.01.09.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 09:58:51 -0700 (PDT)
Subject: Re: [PATCH 4/5] media: uvcvideo: Protect uvc queue file operations
 against disconnect
To:     kernel test robot <lkp@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     kbuild-all@lists.01.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        linux-uvc-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200830150443.167286-5-linux@roeck-us.net>
 <202009020050.iNjROTuy%lkp@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <5b4d6d49-8d11-9026-ffe2-3f18615d1ffc@roeck-us.net>
Date:   Tue, 1 Sep 2020 09:58:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202009020050.iNjROTuy%lkp@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/1/20 9:51 AM, kernel test robot wrote:
> Hi Guenter,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on linuxtv-media/master]
> [also build test WARNING on v5.9-rc3 next-20200828]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Guenter-Roeck/media-uvcvideo-Fix-race-conditions/20200830-230715
> base:   git://linuxtv.org/media_tree.git master
> config: x86_64-randconfig-s031-20200901 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.2-191-g10164920-dirty
>         # save the attached .config to linux build tree
>         make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=x86_64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> 
> sparse warnings: (new ones prefixed by >>)
> 
>>> drivers/media/usb/uvc/uvc_queue.c:402:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] ret @@     got int @@
>>> drivers/media/usb/uvc/uvc_queue.c:402:21: sparse:     expected restricted __poll_t [usertype] ret
>>> drivers/media/usb/uvc/uvc_queue.c:402:21: sparse:     got int
> 
> # https://github.com/0day-ci/linux/commit/9128827e77bc077a6fefd3ca886a8466e84f7154
> git remote add linux-review https://github.com/0day-ci/linux
> git fetch --no-tags linux-review Guenter-Roeck/media-uvcvideo-Fix-race-conditions/20200830-230715
> git checkout 9128827e77bc077a6fefd3ca886a8466e84f7154
> vim +402 drivers/media/usb/uvc/uvc_queue.c
> 
>    393	
>    394	__poll_t uvc_queue_poll(struct uvc_video_queue *queue, struct file *file,
>    395				    poll_table *wait)
>    396	{
>    397		struct uvc_streaming *stream = uvc_queue_to_stream(queue);
>    398		__poll_t ret;
>    399	
>    400		mutex_lock(&queue->mutex);
>    401		if (!video_is_registered(&stream->vdev)) {
>  > 402			ret = -ENODEV;

Looks like this has to return EPOLLERR. I'll make that change in v2.

Guenter

>    403			goto unlock;
>    404		}
>    405		ret = vb2_poll(&queue->queue, file, wait);
>    406	unlock:
>    407		mutex_unlock(&queue->mutex);
>    408	
>    409		return ret;
>    410	}
>    411	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

