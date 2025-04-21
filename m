Return-Path: <linux-media+bounces-30630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6C6A9536A
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 17:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C7201888B08
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 15:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3D31C8611;
	Mon, 21 Apr 2025 15:11:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCA9189F3B;
	Mon, 21 Apr 2025 15:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745248305; cv=none; b=U/qzSPocDFZrW+t6GUVNsMr98pDeJ6qhZrGbsPCH972zrAeddurgP0NS+p5efDG4C3dKf97jYOQxoJ2iUKqoXywOmUnNrkZrkFGW8i7dK9U+jGX5gCY6Ib0A5wafFLawPtpCiekSAXzC09DFA+EoPq8F/1gZU47EUneeavZgNsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745248305; c=relaxed/simple;
	bh=wVb6zF2sDuspOFXtXnd7RxfGpwALpqbiR+rm/5Im1Ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oCv0K61uZa2bh+nOTcmuaOktIO+BASZrEbvv/8Fvmn5gT68QfBQ4uUoEhkB9JhQCC0a67u2IXGZHvkD1E1E3qBPhsu1/bav8PLrge+IZ+BMCv7SwKYLz76tY74K6SJnFMtM34nzYap9U2SMEnRUmW6+MyqeLSksqbhgn+AFSQuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from [IPV6:2a01:e0a:3e8:c0d0:8e8c:c49a:b330:a587] (unknown [IPv6:2a01:e0a:3e8:c0d0:8e8c:c49a:b330:a587])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id BCFB654A74;
	Mon, 21 Apr 2025 15:11:40 +0000 (UTC)
Authentication-Results: Plesk;
        spf=pass (sender IP is 2a01:e0a:3e8:c0d0:8e8c:c49a:b330:a587) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=[IPV6:2a01:e0a:3e8:c0d0:8e8c:c49a:b330:a587]
Received-SPF: pass (Plesk: connection is authenticated)
Message-ID: <45bd327d-7ab7-464b-b125-684a24bedf35@arnaud-lcm.com>
Date: Mon, 21 Apr 2025 17:11:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: az6007: Add upper bound check to the data of
 device state
To: Edward Adam Davis <eadavis@qq.com>,
 syzbot+0192952caa411a3be209@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 mchehab@kernel.org, syzkaller-bugs@googlegroups.com
References: <6805a24c.050a0220.4e547.000b.GAE@google.com>
 <tencent_93C4465D499DEEDF6EE60CB667DC46D0D206@qq.com>
Content-Language: en-US
From: Arnaud Lecomte <contact@arnaud-lcm.com>
In-Reply-To: <tencent_93C4465D499DEEDF6EE60CB667DC46D0D206@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <174524830112.31456.7779899519704470778@Plesk>
X-PPP-Vhost: arnaud-lcm.com

Hi Edward,
As I am currently trying over there: 
https://syzkaller.appspot.com/text?tag=Patch&x=10f3ac70580000, I think 
we also have a race condition related to the disconnection of the usb 
device.
What do you think ?

Arnaud

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
>   <TASK>
>   az6007_i2c_xfer+0x549/0xc30 drivers/media/usb/dvb-usb-v2/az6007.c:821
>   i2c_transfer_buffer_flags+0x10c/0x190 drivers/i2c/i2c-core-base.c:2343
>   i2cdev_read+0x111/0x280 drivers/i2c/i2c-dev.c:155
>   do_loop_readv_writev fs/read_write.c:833 [inline]
>   do_preadv+0x1af/0x270 fs/read_write.c:1130
>   do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
>
> Reported-by: syzbot+0192952caa411a3be209@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=0192952caa411a3be209
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
>   drivers/media/usb/dvb-usb-v2/az6007.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
> index 65ef045b74ca..6322894eda27 100644
> --- a/drivers/media/usb/dvb-usb-v2/az6007.c
> +++ b/drivers/media/usb/dvb-usb-v2/az6007.c
> @@ -806,7 +806,8 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
>   			if (az6007_xfer_debug)
>   				printk(KERN_DEBUG "az6007: I2C R addr=0x%x len=%d\n",
>   				       addr, msgs[i].len);
> -			if (msgs[i].len < 1) {
> +			if (msgs[i].len < 1 ||
> +			    msgs[i].len > ARRAY_SIZE(st->data) - 5) {
>   				ret = -EIO;
>   				goto err;
>   			}

