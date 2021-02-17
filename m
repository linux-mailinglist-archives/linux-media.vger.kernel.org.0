Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA38531DF0D
	for <lists+linux-media@lfdr.de>; Wed, 17 Feb 2021 19:24:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234871AbhBQSXY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Feb 2021 13:23:24 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:59877 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234808AbhBQSXX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Feb 2021 13:23:23 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id CRTBlAPRPZvk6CRTEl8I7v; Wed, 17 Feb 2021 19:22:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1613586160; bh=TxewsW4kpTtGfbxRoZbS7VCVbJuKhfu4UFSTglJmyNA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bq/HWGxfyNsyLCJ5f2TkassV5zXDVFvDNr2Q2SRnrbH4ept5NRXW/aA0kXKANUvBZ
         o1XikyPgR4lbmyq6j7jyeZXnPrrRtVM3yzLt3u9qJS3xvTOQHTHqwV30Zfv1beAS2d
         rtKgyuKfXxBEJXXIymZn8QZKFmkPfu2DPSfXz0j4MwjNsxXz2abxWm6B9FjyFCHtbL
         wBs0JZTaOagc+dXHF7MJaNNP5TD8dAt5idrzVHQprviwFQTwn8/X2zoMPREhAP2TGn
         L04RfnQ5Ry4fR+uQrFQhebpcq5fhedO5tsKksIM6FTDuABeOwRPFXHWNqKJ5anV/Re
         4ALSxhH9iqkIg==
Subject: Re: [PATCH] test-media: wrap vivid code around $vivid variable
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com, linux-kernel@vger.kernel.org
References: <20210217181157.28285-1-helen.koike@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c9d01579-7200-2d37-d244-92895353c842@xs4all.nl>
Date:   Wed, 17 Feb 2021 19:22:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217181157.28285-1-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNQUuMWNza5mXo+iraYOhZU0f+1f+9nDu0YJYhoH2vLcxpHkP6xWZohU3yrXuYNsaT+58Ko9Ipy3O8RKtveFHAnlwHhLML7wFMdEljn6fuIaAJsB5WeK
 2NoS29ET7vGKwoDMQwSp1fexOMPKyz/F3sFKfVHPY4lXNSYAKp9D16c89csSxMevP6+i0mEECAne1BEmOVDKj7UGrO4D9MPBE4/ydvziOQvW8R1xjd2jRBLg
 ZonQkCCHr1tSRiDZLEFHNHWx6h/6WtDhK+rcGv8fZ6oUeordEUbTARnLaOkv9batx435U2zgpYmZ6JtINbFNmQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/02/2021 19:11, Helen Koike wrote:
> The script was trying to load vivid and run some commands on top of it
> even when $vivid = 0.
> Wrap all vivid code under $vivid variable.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
>  contrib/test/test-media | 66 ++++++++++++++++++++---------------------
>  1 file changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/contrib/test/test-media b/contrib/test/test-media
> index 10b7e89d..8cd8bc37 100755
> --- a/contrib/test/test-media
> +++ b/contrib/test/test-media
> @@ -146,29 +146,29 @@ if [ $kmemleak -eq 1 ]; then
>  	echo clear >/sys/kernel/debug/kmemleak
>  fi
>  
> -rmmod vivid 2&>/dev/null
> -modprobe vivid n_devs=3 multiplanar=1,2,2 cache_hints=1,0,0 #allocators=0,1,1

Ah, no. Vivid is also used to test dmabuf for vim2m, vimc and vicodec tests. It
functions as the allocator for the dma buffers in that case.

So even if vivid isn't given, but only vim2m, vimc or vicodec, it should still be loaded.

It isn't needed for vidtv, so I guess it could be disabled if only vidtv is tested.

Regards,

	Hans

> -sleep 1
> +if [ $vivid -eq 1 ]; then
> +	rmmod vivid 2&>/dev/null
> +	modprobe vivid n_devs=3 multiplanar=1,2,2 cache_hints=1,0,0 #allocators=0,1,1
> +	sleep 1
>  
> -tmp=`mktemp`
> +	tmp=`mktemp`
>  
> -if ! $v4l2_ctl -z platform:vivid-002 -d vivid-002-vid-cap ; then
> -	echo "FAIL: the vivid module failed to load" | tee -a $tmp
> -	echo "Grand Total for vivid: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
> -	echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
> -	exit 0
> -fi
> +	if ! $v4l2_ctl -z platform:vivid-002 -d vivid-002-vid-cap ; then
> +		echo "FAIL: the vivid module failed to load" | tee -a $tmp
> +		echo "Grand Total for vivid: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
> +		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
> +		exit 0
> +	fi
>  
> -$v4l2_ctl -z platform:vivid-000 -d vivid-000-vid-cap -i3 -v width=3840,height=2160,pixelformat=NV24
> -$v4l2_ctl -z platform:vivid-000 -d vivid-000-vid-out -o1 -x width=3840,height=2160,pixelformat=NV24
> -$v4l2_ctl -z platform:vivid-001 -d vivid-001-vid-cap -i3 -v width=3840,height=2160,pixelformat=NM16
> -$v4l2_ctl -z platform:vivid-001 -d vivid-001-vid-out -o1 -x width=3840,height=2160,pixelformat=NM16
> -$v4l2_ctl -z platform:vivid-002 -d vivid-002-vid-cap -i3 -v width=3840,height=2160,pixelformat=NV24
> -$v4l2_ctl -z platform:vivid-002 -d vivid-002-vid-out -o1 -x width=3840,height=2160,pixelformat=NM16
> +	$v4l2_ctl -z platform:vivid-000 -d vivid-000-vid-cap -i3 -v width=3840,height=2160,pixelformat=NV24
> +	$v4l2_ctl -z platform:vivid-000 -d vivid-000-vid-out -o1 -x width=3840,height=2160,pixelformat=NV24
> +	$v4l2_ctl -z platform:vivid-001 -d vivid-001-vid-cap -i3 -v width=3840,height=2160,pixelformat=NM16
> +	$v4l2_ctl -z platform:vivid-001 -d vivid-001-vid-out -o1 -x width=3840,height=2160,pixelformat=NM16
> +	$v4l2_ctl -z platform:vivid-002 -d vivid-002-vid-cap -i3 -v width=3840,height=2160,pixelformat=NV24
> +	$v4l2_ctl -z platform:vivid-002 -d vivid-002-vid-out -o1 -x width=3840,height=2160,pixelformat=NM16
>  
> -echo
> +	echo
>  
> -if [ $vivid -eq 1 ]; then
>  	dmesg -n notice
>  	echo
>  	echo vivid compliance tests, contiguous planes | tee /dev/kmsg
> @@ -287,6 +287,18 @@ if [ $vivid -eq 1 ]; then
>  	echo
>  	echo
>  	echo
> +
> +	date
> +	echo
> +	echo unbind vivid | tee /dev/kmsg
> +	echo
> +	echo -n vivid.0 >/sys/bus/platform/drivers/vivid/unbind
> +	sleep $unbind_time
> +	echo
> +	echo rmmod vivid | tee /dev/kmsg
> +	echo
> +	rmmod vivid
> +	sleep $rmmod_time
>  fi
>  
>  if [ $vim2m -eq 1 ]; then
> @@ -300,7 +312,7 @@ if [ $vim2m -eq 1 ]; then
>  		echo "FAIL: the vim2m module failed to load" | tee -a $tmp
>  		echo "Grand Total for vim2m: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
>  		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
> -		rmmod vivid
> +		rmmod vim2m
>  		exit 0
>  	fi
>  
> @@ -373,7 +385,7 @@ if [ $vimc -eq 1 ]; then
>  		echo "FAIL: the vimc module failed to load" | tee -a $tmp
>  		echo "Grand Total for vimc: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
>  		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
> -		rmmod vivid
> +		rmmod vimc
>  		exit 0
>  	fi
>  
> @@ -467,7 +479,7 @@ if [ $vicodec -eq 1 ]; then
>  		echo "FAIL: the vicodec module failed to load" | tee -a $tmp
>  		echo "Grand Total for vicodec: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
>  		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
> -		rmmod vivid
> +		rmmod vicodec
>  		exit 0
>  	fi
>  
> @@ -603,18 +615,6 @@ if [ $vicodec -eq 1 ]; then
>  	echo
>  fi
>  
> -date
> -echo
> -echo unbind vivid | tee /dev/kmsg
> -echo
> -echo -n vivid.0 >/sys/bus/platform/drivers/vivid/unbind
> -sleep $unbind_time
> -echo
> -echo rmmod vivid | tee /dev/kmsg
> -echo
> -rmmod vivid
> -sleep $rmmod_time
> -
>  if [ $vidtv -eq 1 ]; then
>  	rmmod dvb_vidtv_bridge dvb_vidtv_tuner dvb_vidtv_demod 2&>/dev/null
>  	modprobe vidtv
> 

