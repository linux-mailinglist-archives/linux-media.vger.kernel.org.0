Return-Path: <linux-media+bounces-46190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0B1C2AE9D
	for <lists+linux-media@lfdr.de>; Mon, 03 Nov 2025 11:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BDE93A9213
	for <lists+linux-media@lfdr.de>; Mon,  3 Nov 2025 10:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA06D2FC00A;
	Mon,  3 Nov 2025 10:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQVn/NW4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB9714A60F;
	Mon,  3 Nov 2025 10:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762164385; cv=none; b=i0YCXppdml2Dvf8vRFR+IpoN5otc0NiLPFi2rwG19IyzjB/R3QZl41Zy+CnsGuWI/R3YX0RFIQ3chRYUQrVZaHyM/SZxkK1qE9I75n7MtzHRMHb1C5XLbQJQNdhuhMOmtkI+WaaDdxEc9l+YoHWqEuL5bKiPEW+rfGsBPbwwQRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762164385; c=relaxed/simple;
	bh=U7dljpxaf1r0mwkGNZ8GR8FmR5XSNn25x6Hd0IO0hQE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uQW2867MVK0G1/V/VDK1VIufi3ZdbMzEnjmmGVxHU+b6bJyY7KIAYE84AvLOxMrL9fI/j9ZdLb0jw3zNUIl5Zz3aGbB4cbB+XsfT05liw9B9miRY2JZm/Wz+j0vwU+XxgMV+RAjWUfo3QT5Ic+GFRt9SEHhEkDI5JsH5AKgBhRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQVn/NW4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B5EC4CEE7;
	Mon,  3 Nov 2025 10:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762164384;
	bh=U7dljpxaf1r0mwkGNZ8GR8FmR5XSNn25x6Hd0IO0hQE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=jQVn/NW4nxlzqdkHGtzkZw9cVy5oPgWwxkHaZ/SWZ921tyTRJbZygRMP59xDFGOhD
	 kaZNmGafoRq9WVW1C7iqyCBsCf4FORfnDEKVI14AB6ZQ0ZCE6UruopRNLTSn5G9cqv
	 T2nG5sH6qiVvBaRpB7hVg4/QwdlGv8M6EVunWHr+g3Dei5d+1c5bSJ6ebK11v7GhJs
	 00vlmmusnGwBS2EpVEu/3QIH1f/Y9cvOmG5X0VQnPM22C1CXpXbm4kPstcNtTEe8iF
	 QqblJijTFMnmXMoU7yaO+G+GfWo5T1vUp7+YjMowCa5ddRh4bAE9fcYcDlV7GOIP2O
	 FwCi6cs/OJAsg==
Message-ID: <d661ae00-d100-46ef-8a15-50919b34daae@kernel.org>
Date: Mon, 3 Nov 2025 11:06:21 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: az6007: Add upper bound check to the data of
 device state
To: Edward Adam Davis <eadavis@qq.com>,
 syzbot+0192952caa411a3be209@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 mchehab@kernel.org, syzkaller-bugs@googlegroups.com
References: <6805a24c.050a0220.4e547.000b.GAE@google.com>
 <tencent_93C4465D499DEEDF6EE60CB667DC46D0D206@qq.com>
Content-Language: en-US, nl
In-Reply-To: <tencent_93C4465D499DEEDF6EE60CB667DC46D0D206@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/04/2025 16:31, Edward Adam Davis wrote:
> syzbot report a corrupted list in az6007_i2c_xfer. [1]
> 
> Before accessing the member data of the struct az6007_device_state, only
> the lower boundary of data is checked, but the upper boundary is not checked.
> When the value of msgs[i].len is damaged or too large, it will cause out
> of bounds access to st->data.
> 
> [1]
> UBSAN: array-index-out-of-bounds in drivers/media/usb/dvb-usb-v2/az6007.c:821:30
> index 4096 is out of range for type 'unsigned char [4096]'
> CPU: 1 UID: 0 PID: 5832 Comm: syz-executor328 Not tainted 6.15.0-rc2-syzkaller-00493-gac71fabf1567 #0 PREEMPT(full)
> Call Trace:
>  <TASK>
>  az6007_i2c_xfer+0x549/0xc30 drivers/media/usb/dvb-usb-v2/az6007.c:821
>  i2c_transfer_buffer_flags+0x10c/0x190 drivers/i2c/i2c-core-base.c:2343
>  i2cdev_read+0x111/0x280 drivers/i2c/i2c-dev.c:155
>  do_loop_readv_writev fs/read_write.c:833 [inline]
>  do_preadv+0x1af/0x270 fs/read_write.c:1130
>  do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
> 
> Reported-by: syzbot+0192952caa411a3be209@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
>  drivers/media/usb/dvb-usb-v2/az6007.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
> index 65ef045b74ca..6322894eda27 100644
> --- a/drivers/media/usb/dvb-usb-v2/az6007.c
> +++ b/drivers/media/usb/dvb-usb-v2/az6007.c
> @@ -806,7 +806,8 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>  			if (az6007_xfer_debug)
>  				printk(KERN_DEBUG "az6007: I2C R addr=0x%x len=%d\n",
>  				       addr, msgs[i].len);
> -			if (msgs[i].len < 1) {
> +			if (msgs[i].len < 1 ||
> +			    msgs[i].len > ARRAY_SIZE(st->data) - 5) {

Hmm, shouldn't this be '- 6'? Since a few lines below this the length passed
to __az6007_read is msgs[i].len + 6.

Regards,

	Hans

>  				ret = -EIO;
>  				goto err;
>  			}


