Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 618F630783F
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 15:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbhA1OhL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 09:37:11 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:46111 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231434AbhA1OhK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 09:37:10 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 58PGlEyASE1Ic58PKlxLUc; Thu, 28 Jan 2021 15:36:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611844587; bh=qtRz0odOLdwb8vOMzkND6Rqy1duafP13UBxmDm7df/8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=s9wMYPhz6Yzqbc/IykD7zqJM1UIPMmvUTVZbFTJJtZ1rTRMk76qn6ez7VVF0GAZ/3
         QvaysUNC/IXyW4J1IQjemsxmx+NIr8a2yDwUjUI5W8omn4utaEzizmXvmVliZQ+YnV
         m6VyfsqCKQj5W5GhB+SnCzOhikzF3TR/e2wLU1UDWBEFSZS/CZJlcPN2JHkAxrbdVr
         gGl4EQQ65cr/OsX88aFHEZ/gby0YIFVu2VJ+NdpJ6jHkHcJOH26sZsEzAxVwlCkGz1
         QCJZA8MH04kJLqtMjmKEUGp1FJP1XF3TlEC7n8WMaJvd20WsKI4NR6I1CtDcAlj3KT
         DdIAikepEn0Mg==
Subject: Re: [PATCH v4l-utils] test-media: add support for vidtv
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org
References: <20210105131725.1191046-1-dwlsalmeida@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b92398de-3c01-8be8-1cc7-887c645f6951@xs4all.nl>
Date:   Thu, 28 Jan 2021 15:36:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210105131725.1191046-1-dwlsalmeida@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGvIECnHSkRT9Rfda5SSU5Xy0nLpCFk82lf89TR6wLtylkJWXNF+dfuClSI1mwdzzQwqM/yY6/PXl3kkHoOopz2vQi2B9xh6ldiph+6njFAB3GvKICbl
 LPJlLDhQVFi0ebB1XTpWqlvulZUwx11CvxyxqxwmXznDFMpRyPFGv9qUN0J+zmku3M+bfwuUDF6dGDnDqhhN7FjyrXsfqdiiE0TjexkWbGfLaBtbN6ASrlw3
 g4H12VGZj8WF9O/MEyw18E36F+jEK4kSUXYOWjPskomCicwn+6dc6Uu2NaVmRkMqbNyDzEP8OlUDMtC+W8aCpLdTnVy5t4CMBEpJSjc4ybgSE2JdSmcS73Dz
 N+DHAUt6B7beMEhTwgkAXagnKrieng==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On 05/01/2021 14:17, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Add support for vidtv at the test-media script so that automated testing
> is possible. Proper compliance tests are still pending.

I've tried this, but something is wrong: 'media-ctl -p' shows an empty
topology, ditto with contrib/test/mc_nextgen_test.

For the same reason 'v4l2-compliance -M0' fails with:

 fail: v4l2-test-media.cpp(120): !topology.num_entities

I'm not sure what's going on here, but it needs some more work.

In the meantime I'll merge this patch since it doesn't hurt.

Regards,

	Hans

> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  contrib/test/test-media | 72 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/contrib/test/test-media b/contrib/test/test-media
> index 1c1d2e37b..86a2e081a 100755
> --- a/contrib/test/test-media
> +++ b/contrib/test/test-media
> @@ -4,6 +4,7 @@
>  #
>  # Copyright 2019 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>  
> +vidtv=0
>  vivid=0
>  vim2m=0
>  vimc=0
> @@ -51,6 +52,7 @@ if [ -z "$1" ]; then
>  	echo "-32: use v4l2-ctl-32 and v4l2-compliance-32 to test the 32 bit compat layer"
>  	echo
>  	echo Test Targets:
> +	echo "vidtv: test the vidtv driver"
>  	echo "vivid: test the vivid driver"
>  	echo "vim2m: test the vim2m driver"
>  	echo "vimc: test the vimc driver"
> @@ -96,6 +98,7 @@ while [ ! -z "$1" ]; do
>  		fi
>  		;;
>  	all)
> +		vidtv=1
>  		vivid=1
>  		vim2m=1
>  		vimc=1
> @@ -109,6 +112,9 @@ while [ ! -z "$1" ]; do
>  		vimc=1
>  		vicodec=1
>  		;;
> +	vidtv)
> +		vidtv=1
> +		;;
>  	vivid)
>  		vivid=1
>  		;;
> @@ -162,6 +168,72 @@ $v4l2_ctl -z platform:vivid-002 -d vivid-002-vid-out -o1 -x width=3840,height=21
>  
>  echo
>  
> +if [ $vidtv -eq 1 ]; then
> +	rmmod vidtv 2&>/dev/null
> +	modprobe vidtv
> +	sleep 2
> +	dmesg -n notice
> +	echo
> +
> +	if ! media-ctl -d platform:vidtv -p ; then
> +		echo "FAIL: the vidtv module failed to load" | tee -a $tmp
> +		echo "Grand Total for vidtv: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
> +		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
> +		rmmod vidtv
> +		exit 0
> +	fi
> +
> +	echo
> +	echo
> +	echo
> +	echo
> +	echo
> +	echo
> +	echo
> +	echo
> +	echo
> +	echo unbind vidtv
> +	echo
> +	echo -n vidtv.0 >/sys/bus/platform/drivers/vidtv/unbind
> +	sleep $unbind_time
> +	echo
> +	echo rebind vidtv
> +	echo
> +	echo -n vidtv.0 >/sys/bus/platform/drivers/vidtv/bind
> +	sleep 1
> +	echo
> +	echo second unbind vidtv
> +	echo
> +	sleep 1
> +	echo
> +	echo -n vidtv.0 >/sys/bus/platform/drivers/vidtv/unbind
> +	sleep $reunbind_time
> +	echo
> +	echo rmmod vidtv
> +	echo
> +	rmmod vidtv
> +	sleep $rmmod_time
> +	if [ $kmemleak -eq 1 ]; then
> +		echo
> +		echo kmemleak results for vidtv:
> +		echo
> +		echo scan >/sys/kernel/debug/kmemleak
> +		cat /sys/kernel/debug/kmemleak
> +		echo
> +		echo end of kmemleak results
> +		echo clear >/sys/kernel/debug/kmemleak
> +	fi
> +	echo
> +	echo
> +	echo
> +	echo
> +	echo
> +	echo
> +	echo
> +	echo
> +
> +fi
> +
>  if [ $vivid -eq 1 ]; then
>  	dmesg -n notice
>  	echo
> 

