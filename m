Return-Path: <linux-media+bounces-41756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 009C0B434EE
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 10:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC74C17490A
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 08:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488032BE02A;
	Thu,  4 Sep 2025 08:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7iHmStW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1851189BB6;
	Thu,  4 Sep 2025 08:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756973127; cv=none; b=Q3Z+/KdkBJZHhjviERYMjmaeFsgI0jdB6LDEnbNYefOXEwF+Qn8To7jBE5i0LNgIrya8XJnAFsqXagk9gngqmfPXncKgZuXH7Cc2ykv1g2cMBlvq3M8w1bDW5hy/esVRVcz9/uAoq6aQogWfJpM9xiPQFmALNduHEMj+swuF68Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756973127; c=relaxed/simple;
	bh=Tule94MLTResPlA6mlCc+QmKVUXhrRUoEgqeVLBPIyo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mlxjS9OsAWqKtFcfwZg4bjJ8x1R3pA50fZM0r5/ssp8/lJAMH7+zpxX2oJczB7UQjqzd1MigBnuBsTIyQNPlogdzReychblvTF8UCzKhHmGDncwF4Hc6OGyFxn3CowiXgjatJ6ji9FlZPVfIU9YwAr8WGTlpmM4AvBih87QjgIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7iHmStW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288C2C4CEF0;
	Thu,  4 Sep 2025 08:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756973127;
	bh=Tule94MLTResPlA6mlCc+QmKVUXhrRUoEgqeVLBPIyo=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=L7iHmStW53E+PlDcvERpzgtkHguq4kZGsn+7gU2zY6JJHfkILSv+iLHxjiipckJny
	 hQn5R3jr22R2wg9X6u/CbFneWSKjPNpfXxRGwVqt8eTR7OZE3nofgowrKKlfk6ALwZ
	 xaZ736K/lEvJu2kueP3+eBsa/yaQoT9ZizzucV4XjAeVaT7BYhw4Icu1Wpfn68hbUK
	 nzASfBuTF/1ci/hhzfLACMwqWmZDyhnUCpuhRmiggFzbePqYDFLpXu7QTLdSMO1cHE
	 w+V8p5klv0kuCIC6+XjRqCLml/fEmPSlhK2fmhQ+ieVZJdUjoVLk2yx1T/VKjrup9j
	 at5s3YK1ZRmqw==
Message-ID: <c4cf17bb-73cb-4e3b-9e61-8fd682b5e9ee@kernel.org>
Date: Thu, 4 Sep 2025 10:05:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: az6007: fix out-of-bounds in az6007_i2c_xfer()
To: Jeongjun Park <aha310510@gmail.com>, mchehab@kernel.org
Cc: hverkuil@xs4all.nl, zhang_shurong@foxmail.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250421105555.34984-1-aha310510@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20250421105555.34984-1-aha310510@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jeongjun,

On 21/04/2025 12:55, Jeongjun Park wrote:
> According to the previous commit 1047f9343011 ("media: az6007: 
> Fix null-ptr-deref in az6007_i2c_xfer()"), msgs[i].len is user-controlled.

Does this relate to syzbot reports? If so, please add a reference to that.

As far as I can tell, you can get here only through /dev/i2c-X devices.

> 
> In the previous commit, bounds checking was added because a null-ptr-deref 
> bug occurs when msgs[i].buf and msgs[i].len are set to null. However, this 
> leads to an out-of-bounds vuln for st->data when msgs[i].len is set to a 
> large value.
> 
> Therefore, code to check the maximum value of msgs[i].len needs to be added.
> 
> Fixes: 1047f9343011 ("media: az6007: Fix null-ptr-deref in az6007_i2c_xfer()")
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> ---
>  drivers/media/usb/dvb-usb-v2/az6007.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
> index 65ef045b74ca..fba1b6c08dc7 100644
> --- a/drivers/media/usb/dvb-usb-v2/az6007.c
> +++ b/drivers/media/usb/dvb-usb-v2/az6007.c
> @@ -788,7 +788,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>  			if (az6007_xfer_debug)
>  				printk(KERN_DEBUG "az6007: I2C W addr=0x%x len=%d\n",
>  				       addr, msgs[i].len);
> -			if (msgs[i].len < 1) {
> +			if (msgs[i].len < 1 || msgs[i].len + 1 > sizeof(st->data)) {
>  				ret = -EIO;
>  				goto err;
>  			}
> @@ -806,7 +806,7 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>  			if (az6007_xfer_debug)
>  				printk(KERN_DEBUG "az6007: I2C R addr=0x%x len=%d\n",
>  				       addr, msgs[i].len);
> -			if (msgs[i].len < 1) {
> +			if (msgs[i].len < 1 || msgs[i].len + 5 > sizeof(st->data)) {
>  				ret = -EIO;
>  				goto err;
>  			}

I feel uncomfortable about this patch and similar patches that attempt to address this
in various other drivers as well.

It's all rather ad-hoc. E.g. you fix the two places here, but not the case at line 778.

I think the proper fix would be to modify __az6007_read/write and add an argument with the
size of the buffer, then let that function do the check. Rather than manually doing this
check at every call of those functions. Same for similar drivers.

The approach taken in this patch is too fragile.

Regards,

	Hans


> --
> 


