Return-Path: <linux-media+bounces-46198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 23527C2B330
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 12:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7F4B34ECE5F
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 11:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219F5301004;
	Mon,  3 Nov 2025 11:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MX6mUw5q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6DA2FE58F;
	Mon,  3 Nov 2025 11:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762167607; cv=none; b=cXAWPq7dBYMEOwfBemA3whRxiPxHQB0D9Mye0S010xJMVkQ5qZB+eOv8v5HeXtDMvjZK0AfGN/AYoBTv2VhaoSVIiIRRYBdKEAPJm7pnaucPfHSFtbCrZPgtAR3mgF9pdE1fVzn89XDMFgNzLdR8MBOQzWTGv4NkoEuw6JXstj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762167607; c=relaxed/simple;
	bh=O3PGyy62CpQtmQKFEa1ztQogpTFwHYoyl2KgzbZ7biM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=u1TnL3cBFUa56guBVsAvraabCyae4qeEFVGUUGRAhZGHEZAv8eCXaotHfUyRCl2714pW2l7gpPcbBRuhVLDg0QhYhYEgWWzg3kb0tQU09r3hkASQqT7NKY0jxOyjPlq1dQZzl1zP0y9bA7PY7AW6dfQfP2Pknq9LN6+6Oxics9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MX6mUw5q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB343C4CEFD;
	Mon,  3 Nov 2025 11:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762167607;
	bh=O3PGyy62CpQtmQKFEa1ztQogpTFwHYoyl2KgzbZ7biM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=MX6mUw5qB9OHkhzfmKLi2wgalP4ZfRRUKB5Nwk46RjSm6SKWbMxLM8s157Bub2Ksa
	 IIDpCvtCD+78xLDE/gNa83GUOkH9zsjtDlhjyB30roPGiJv3IJ7HxzRiJLor51RRJe
	 E+E9QXo4PlihMlIcnqzAA0GO0wSUN0PFn+1wBtUumxtmB8fQOo/oykrO0nohh/Mo9H
	 n325OFjMKzF2j+WwrPXwLcsSvRGdNI7LzSwrpuH6zX6AHUNQyD0xBrs9E6J5Ew+Q4l
	 GYXgVqBa/iJX0XhOT02IpcpTaQqyanFLiByGHG5F+9FSWmhSS8LulrQvLq+4nwX8+4
	 c6frT+C4VkCdQ==
Message-ID: <24d04c2c-50b1-48ec-8ba9-c09ef29fd3fd@kernel.org>
Date: Mon, 3 Nov 2025 12:00:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH V2] media: dvb-usb: Optimizing err() output
To: Edward Adam Davis <eadavis@qq.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 mchehab@kernel.org, syzbot+480edd2cadb85ddb4bbe@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
References: <tencent_303296E836864A7674D377A966003C7D3709@qq.com>
 <tencent_A5374A4B00744776B566CC3DD936EC960A09@qq.com>
Content-Language: en-US, nl
In-Reply-To: <tencent_A5374A4B00744776B566CC3DD936EC960A09@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/10/2025 02:30, Edward Adam Davis wrote:
> syzbot reported a uninit-value in pctv452e_i2c_msg. [1]
> 
> When the snd_len or rcv_len check fails and jumps to failed, buf is
> uninitialized, triggering the uninit-value issue.
> 
> Setting the err() output buf byte count to 0 before jumping to failed
> before initializing buf and setting it to 7 after initializing buf avoids
> this warning.
> 
> [1]
> BUG: KMSAN: uninit-value in hex_string+0x681/0x740 lib/vsprintf.c:1220
>  pctv452e_i2c_msg+0x82a/0x8f0 drivers/media/usb/dvb-usb/pctv452e.c:467
>  pctv452e_i2c_xfer+0x2e6/0x4c0 drivers/media/usb/dvb-usb/pctv452e.c:502
> 
> Reported-by: syzbot+480edd2cadb85ddb4bbe@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=480edd2cadb85ddb4bbe
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
> V1 -> V2: subject typos
> 
>  drivers/media/usb/dvb-usb/pctv452e.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb/pctv452e.c b/drivers/media/usb/dvb-usb/pctv452e.c
> index 5094de9a312e..3b6e86a8e9ff 100644
> --- a/drivers/media/usb/dvb-usb/pctv452e.c
> +++ b/drivers/media/usb/dvb-usb/pctv452e.c
> @@ -420,7 +420,7 @@ static int pctv452e_i2c_msg(struct dvb_usb_device *d, u8 addr,
>  	struct pctv452e_state *state = d->priv;
>  	u8 *buf;
>  	u8 id;
> -	int ret;
> +	int ret, plen = 0;

Adding a plen variable isn't the right fix...

>  
>  	buf = kmalloc(64, GFP_KERNEL);
>  	if (!buf)
> @@ -432,6 +432,7 @@ static int pctv452e_i2c_msg(struct dvb_usb_device *d, u8 addr,
>  	if (snd_len > 64 - 7 || rcv_len > 64 - 7)
>  		goto failed;

...this check should be moved up to before the kmalloc and just return -EINVAL.
That also avoids incrementing state->c in that case.

Regards,

	Hans

>  
> +	plen = 7;
>  	buf[0] = SYNC_BYTE_OUT;
>  	buf[1] = id;
>  	buf[2] = PCTV_CMD_I2C;
> @@ -466,7 +467,7 @@ static int pctv452e_i2c_msg(struct dvb_usb_device *d, u8 addr,
>  failed:
>  	err("I2C error %d; %02X %02X  %02X %02X %02X -> %*ph",
>  	     ret, SYNC_BYTE_OUT, id, addr << 1, snd_len, rcv_len,
> -	     7, buf);
> +	     plen, buf);
>  
>  	kfree(buf);
>  	return ret;


