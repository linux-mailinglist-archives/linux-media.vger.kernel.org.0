Return-Path: <linux-media+bounces-66332-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EwoaACdDRmpvNAsAu9opvQ
	(envelope-from <linux-media+bounces-66332-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 12:53:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D94B6F63DC
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 12:53:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=i-love.sakura.ne.jp (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66332-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66332-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6F9434214E5
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 10:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7F3399365;
	Thu,  2 Jul 2026 10:14:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F6D306774
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 10:14:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782987273; cv=none; b=ccRa3xeRwgM145VqtUbWQz+Vi6CSVGcs2m9iYToags16OQnAz7YI80kt8VZNgXiIgZa+zaiNRIY3oYpg8Pb+0LiT5jrhxMfdQ83sj8+OYoUSfUakudDt7h4ZgdI9uzR0C5hHKwRTfa0WkJstsOFlJpvnnDcANVOo0dbRoCewulo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782987273; c=relaxed/simple;
	bh=9PhztWzJiPYfTa4i6eleQqcB4t5f3Y3dNrUGLt9hP1o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XpjGCl/3NCr1dPxWztiQs0RaYSYmk/EZcWuA+n4A9uO4rxB1FQ//RkEUXHqueIkdbP+K0bbDcV1Inzu5lfC1a1LhMvp6pmMqc25CTw/7FYknH+35FXJfvg7eF7FxLlReyslm5i1zZRTrDlDiTfpPw0e34hNLnpXimNsPkX3iy7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 662AELe2068264;
	Thu, 2 Jul 2026 19:14:21 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 662AELmT068261
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 2 Jul 2026 19:14:21 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <59031ef8-6c50-475b-9285-ba659fb392f9@I-love.SAKURA.ne.jp>
Date: Thu, 2 Jul 2026 19:14:21 +0900
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (repost * 2)] media: usb: siano: don't set
 URB_FREE_BUFFER flag
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
References: <bf19e526-3327-46a5-8ecd-4baaadef5bcf@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <bf19e526-3327-46a5-8ecd-4baaadef5bcf@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav103.rs.sakura.ne.jp
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[i-love.sakura.ne.jp : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66332-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[penguin-kernel@I-love.SAKURA.ne.jp,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[penguin-kernel@I-love.SAKURA.ne.jp,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[I-love.SAKURA.ne.jp:mid,I-love.SAKURA.ne.jp:from_mime,vger.kernel.org:from_smtp,sashiko.dev:url,appspotmail.com:email,syzkaller.appspot.com:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,i-love.sakura.ne.jp:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D94B6F63DC

Ping?

A sashiko's comment is at
https://sashiko.dev/#/patchset/bf19e526-3327-46a5-8ecd-4baaadef5bcf%40I-love.SAKURA.ne.jp .
How do we want to handle this pre-existing issue?

On 2026/05/29 10:20, Tetsuo Handa wrote:
> syzbot is reporting invalid free at usb_free_urb(), for
> 
>   smscore_register_device() allocates all buffers at once as an array
> 
>   smscore_createbuffer() maps each element in the array to cb->p
> 
>   usb_fill_bulk_urb() assigns urb->transfer_buffer using cb->p
>   which may point to a non-head element in the array
> 
>   URB_FREE_BUFFER causes usb_free_urb() to free urb->transfer_buffer
>   which may point to a non-head element in the array
> 
> The urb->transfer_buffer must point to an address returned by kmalloc()
> family if URB_FREE_BUFFER flag is set. But since the urb->transfer_buffer
> allocation strategy for this module is to allocate buffers upon device
> registration and free buffers upon device unregistration, we should
> avoid setting URB_FREE_BUFFER flag. Otherwise, double free or invalid
> free will happen.
> 
> Reported-by: syzbot+b466336413a1fba398a5@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=b466336413a1fba398a5
> Fixes: 564246fd3ff4 ("media: siano: Fix coherent memory allocation failure on arm64")
> Tested-by: Tomoki Sekiyama <tomoki.sekiyama@gmail.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
> Changes in v2:
>   Added Tested-by: line.
> 
>  drivers/media/usb/siano/smsusb.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
> index 0fdc2e0950b7..8140dc0c8b7d 100644
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


