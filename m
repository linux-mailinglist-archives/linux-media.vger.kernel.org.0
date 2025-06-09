Return-Path: <linux-media+bounces-34341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D40AD1BAE
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 12:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3C4F188992B
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 10:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1AC253954;
	Mon,  9 Jun 2025 10:39:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785B7253924;
	Mon,  9 Jun 2025 10:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749465542; cv=none; b=MvV+IafYLNex0hiqPLXSBpqTsLLvFLrCGung84toELbTFQ4n7K3+Wa1ja/0cNvwwNKjCzvKLLIgae6TlnwulRxWWVvkD7TiBUKj4hdp3J6ifgxc8VOJYKGMHPpZvNhFoWGNuGxgU9DsFgXyOf6e0aEbGHRaLIliWJIIUhyrxceo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749465542; c=relaxed/simple;
	bh=wJCrYx1Kw23zesXvyEC6eMmwffSLJLskuOoLy1BzRqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z7s+ZljRkJcntDoLX6bFswdN9LdmKVxr1a4vWSaeUXFhpusA1xA2JaoNxlE7cYaaroRTEAt7hpq44iZmQri7Ql+H+cs5cIO/u8g6fx2gD8Q/zoeh9yvQnrcrnfUlAhfGUP9pz9Ozd389xsqiGHe7g5o2T70iJHggJzDNrzHbgIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 9 Jun
 2025 13:37:43 +0300
Received: from [192.168.211.132] (10.0.253.138) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 9 Jun 2025
 13:37:43 +0300
Message-ID: <a503e593-ae2f-44f4-b545-b64201bd21f1@fintech.ru>
Date: Mon, 9 Jun 2025 13:37:39 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: usb: siano: do not free urb-specific transfer
 buffer
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, Hillf Danton
	<hdanton@sina.com>, <syzbot+b466336413a1fba398a5@syzkaller.appspotmail.com>
References: <20250522140048.2811356-1-n.zhandarovich@fintech.ru>
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Content-Language: en-US
In-Reply-To: <20250522140048.2811356-1-n.zhandarovich@fintech.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Gentle ping...

On 5/22/25 17:00, Nikita Zhandarovich wrote:
> Since siano driver uses separately allocated buffers for urb tranfers,
> such as smscore_buffer_t *cb, and deals with them accordingly
> via calls to smscore_putbuffer() in smsusb_stop_streaming(), there is
> no need to attempt to free urb->transfer_buffer by adding a
> URB_FREE_BUFFER to urb transfer flags. As syzkaller shows, it triggers
> a warning which will bring about proper crash on systems with
> 'panic_on_warn' set.
> 
> Therefore, skip the flag setting step to fix the issue. This change
> was tested exclusively with syz-repros and KMEMLEAK sanitizer.
> 
> The idea for this patch was originally devised by Hillf Danton.
> 
> Suggested-by: Hillf Danton <hdanton@sina.com>
> Reported-by: syzbot+b466336413a1fba398a5@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
> Fixes: 564246fd3ff4 ("media: siano: Fix coherent memory allocation failure on arm64")
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
>  drivers/media/usb/siano/smsusb.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
> index 2c8179a84991..a78b1c233aad 100644
> --- a/drivers/media/usb/siano/smsusb.c
> +++ b/drivers/media/usb/siano/smsusb.c
> @@ -168,7 +168,6 @@ static int smsusb_submit_urb(struct smsusb_device_t *dev,
>  		smsusb_onresponse,
>  		surb
>  	);
> -	surb->urb->transfer_flags |= URB_FREE_BUFFER;
>  
>  	return usb_submit_urb(surb->urb, GFP_ATOMIC);
>  }


