Return-Path: <linux-media+bounces-38829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA45B19F87
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 12:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4958B17806B
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 10:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DAAF246BBB;
	Mon,  4 Aug 2025 10:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ur/5MW1/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE5BE55B
	for <linux-media@vger.kernel.org>; Mon,  4 Aug 2025 10:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754302444; cv=none; b=W4v+KGxf6Z8l3RX2nIKVjf6NFylBCP85DlkpG9T1XJNk31qDPiaE+QT+9fWFscn9DfUXzahXdOPhEMhYzWeE6ccRelmp2JSFloLBZfXegAQNfbyeia+idiKI3KwrYIql/vwKjZ6acBkYYTbY2EhbuM0TGgEI3X03QRakpAMFEGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754302444; c=relaxed/simple;
	bh=wAooyGw2Uo5UCYy+DSkggQ+iT/rnubQ7flvYGuf+vDI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Mefzrr2bVEPbAmb0fGfo4MfE4njlyexpbdEdlS6ntqzrXUgZfzyiZdQRw6Sq6pYoKHkfbSRKWLxPWydJ+md8olSxIc2qNOydtkzFUKfKAYlKFH/h02Y+PZZz7d3KEszs2FEuuqf7ckxv34iXR/gjrcvyHI7lB3GhI5bjHR+4XlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ur/5MW1/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A15C4CEE7;
	Mon,  4 Aug 2025 10:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754302443;
	bh=wAooyGw2Uo5UCYy+DSkggQ+iT/rnubQ7flvYGuf+vDI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=ur/5MW1/ikul0KGgZhUepimU3XuCL0inKzUnvUFzAdSaJxpHftYQ9WTjFbo4pg/yd
	 r0T8nLM0mw5B+MWXk/O+8bHL3nDZOjUk35onEAsExgoNSZ3LN1QAGQMXQ3QqgNC9ba
	 sdwyJz2jcEpx8rrqw6daWr/JAf8E/21a04ZqRJgY4EfM3qvPyKlokj7VVynaz5gc3e
	 19rr0xOsT8khCHGm2hZWphvdPR+iH/jRXft2MqIkV1PlrYywcjtpqohG3eYDQWUW1c
	 H+11ZkFUL6I8vS5epztlRjnr+yk4urkPAv1j8fHhCtQ2oUStJkYaj3f4149kTf3/UB
	 ArMYK9YstErpQ==
Message-ID: <3637d87b-3112-4dc2-b521-b22c56cddc8d@kernel.org>
Date: Mon, 4 Aug 2025 12:14:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [v4l-utils PATCH 1/2] contrib/test/test-media: Fix module
 unloading in error handling
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <20250804100309.351362-1-sakari.ailus@linux.intel.com>
 <20250804100309.351362-2-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20250804100309.351362-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/08/2025 12:03, Sakari Ailus wrote:
> Modules are unloaded in case of errors but alas, in all cases the module
> being unloaded is vivid, not the one that was just loaded. Fix this.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  contrib/test/test-media | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/contrib/test/test-media b/contrib/test/test-media
> index 68fe48f947f3..dda7ff44075b 100755
> --- a/contrib/test/test-media
> +++ b/contrib/test/test-media
> @@ -417,7 +417,7 @@ if [ $vim2m -eq 1 ]; then
>  		echo "FAIL: the vim2m module failed to load" | tee -a $tmp
>  		echo "Grand Total for vim2m: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
>  		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
> -		rmmod vivid
> +		rmmod vim2m

Actually, vivid still needs to be rmmod'ed as well since it is always modprobe'd first.

The idea behind this was that vim2m didn't load (e.g. it was never compiled in),
so there is no need to rmmod it. But of course, if vim2m was compiled in, and it
fails to initiate the vim2m device, then you would come here and you still want
to rmmod vim2m, since it did load, it just didn't instantiate the device for
some reason.

So this patch should add 'rmmod vim2m' and not replace 'rmmod vivid' with it.

Regards,

	Hans

>  		exit 0
>  	fi
>  fi
> @@ -453,7 +453,7 @@ if [ $vim2m -eq 1 -a $setup -eq 0 ]; then
>  		echo "FAIL: the vim2m module failed to load" | tee -a $tmp
>  		echo "Grand Total for vim2m: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
>  		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
> -		rmmod vivid
> +		rmmod vim2m
>  		exit 0
>  	fi
>  
> @@ -525,7 +525,7 @@ if [ $vimc -eq 1 ]; then
>  		echo "FAIL: the vimc module failed to load" | tee -a $tmp
>  		echo "Grand Total for vimc: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
>  		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
> -		rmmod vivid
> +		rmmod vimc
>  		exit 0
>  	fi
>  
> @@ -627,7 +627,7 @@ if [ $vicodec -eq 1 ]; then
>  		echo "FAIL: the vicodec module failed to load" | tee -a $tmp
>  		echo "Grand Total for vicodec: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
>  		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
> -		rmmod vivid
> +		rmmod vicodec
>  		exit 0
>  	fi
>  
> @@ -812,7 +812,7 @@ if [ $visl -eq 1 ]; then
>  		echo "FAIL: the visl module failed to load" | tee -a $tmp
>  		echo "Grand Total for visl: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
>  		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
> -		rmmod vivid
> +		rmmod visl
>  		exit 0
>  	fi
>  fi


