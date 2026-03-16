Return-Path: <linux-media+bounces-55924-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLzhBbgNuGkWYQEAu9opvQ
	(envelope-from <linux-media+bounces-55924-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:03:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3A929AF34
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 15:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1AAB43021439
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 14:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E30239B95F;
	Mon, 16 Mar 2026 14:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMws8sC1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A46280A5B;
	Mon, 16 Mar 2026 14:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669807; cv=none; b=OG1hxGXCUMk+n+BwYkNHaK94tbzE39x+1oOIYHYZGdVfH8jyJu52QxoPWxgm1h0G4BuYQf2TTmU56VafhpdVRn+SDysAex1+kFZqp95Cb96DWgQSGZknbO19G+OczsK+HvgBhYj1JNpbniHPXqekAGYhPoDlLF7Kl+qeETDcxrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669807; c=relaxed/simple;
	bh=H0XWDaGVR6n0oxDOjOnxF5XhRLMl77Ief1YJJz+mm1o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sxxgpaK4Qgr8OnNg0KrH8hK1HDoZbO7jdSHLeQg13txAVP1GsQnKDMU0apZ5skQJci3r5Z1cvLijabJslEziIfiZmgPSlfyXehjEPib6tbfcKOZVUq1xV8o9HhMzL1t95851XBgaaNDjcTSCXkBevjak73+LMj4kCmg4pLuusQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMws8sC1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6FA8C19421;
	Mon, 16 Mar 2026 14:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773669807;
	bh=H0XWDaGVR6n0oxDOjOnxF5XhRLMl77Ief1YJJz+mm1o=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=tMws8sC1qLdCE5vFP0t2sVLyO5FLeoWVvAIaNH3YGW+vpbTUzz6Qrp6on3hP0/7eC
	 Q0LL66HpVG4V7CBrqDfXj826YLghepKeSsvbbg6K8xzgzufE0c8WlFRcP4SZbQGbOx
	 JMxMhzcykm9SDdScJRo3Vx6ajJNVFAbIHq0a7R3gn3uwzJu/XWbSkGexUL/ynF5C1v
	 l86CdyLLG867fREwnEvzmz27lYY8H4k5jkInwzBcxzeJdTa+lAQsgKOFphCEqEB6Cs
	 GbgBB+hGvTTeYikK3e/wbZcJdcpseSVSapRhvzTSSC4XKqet+DGrfTmc5rPufebRp+
	 AB4Skk7SQOmew==
Message-ID: <1124bc73-d9d7-4719-b3c2-f05639d05294@kernel.org>
Date: Mon, 16 Mar 2026 15:03:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 1/2] media: em28xx-video: add the unregister of video/VBI
 entity
To: Edward Adam Davis <eadavis@qq.com>,
 syzbot+16062f26c6480975e5ed@syzkaller.appspotmail.com
Cc: laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, syzkaller-bugs@googlegroups.com
References: <69608280.050a0220.1c677c.03b0.GAE@google.com>
 <tencent_0D8C88E7C506C4D2C2064149816ECB6EDB06@qq.com>
Content-Language: en-US, nl
In-Reply-To: <tencent_0D8C88E7C506C4D2C2064149816ECB6EDB06@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55924-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[qq.com,syzkaller.appspotmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,16062f26c6480975e5ed];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,appspotmail.com:email]
X-Rspamd-Queue-Id: AA3A929AF34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 11/01/2026 06:29, Edward Adam Davis wrote:
> When creating a media graph, a failure occurred due to the lack of
> a corresponding decoder. During the subsequent media device release
> process, the video and VBI devices were not properly unregistered,
> leading to a use-after-free vulnerability reported by syzbot [1].
> 
> The fix involves adding the necessary unregister operations.
> 
> [1]
> BUG: KASAN: slab-use-after-free in media_device_unregister+0x141/0x430 drivers/media/mc/mc-device.c:804
> Read of size 8 at addr ffff88807c114210 by task kworker/1:9/6093
> Call Trace:
>  media_device_unregister+0x141/0x430 drivers/media/mc/mc-device.c:804
>  em28xx_unregister_media_device drivers/media/usb/em28xx/em28xx-cards.c:3511 [inline]
>  em28xx_release_resources+0xac/0x240 drivers/media/usb/em28xx/em28xx-cards.c:3532
>  em28xx_usb_disconnect+0x19f/0x2f0 drivers/media/usb/em28xx/em28xx-cards.c:4201
>  usb_unbind_interface+0x26e/0x910 drivers/usb/core/driver.c:458
>  
> Allocated by task 5932:
>  em28xx_v4l2_init+0x10b/0x2e70 drivers/media/usb/em28xx/em28xx-video.c:2532
>  em28xx_init_extension+0x120/0x1c0 drivers/media/usb/em28xx/em28xx-core.c:1117
>  
> Freed by task 5932:
>  em28xx_free_v4l2 drivers/media/usb/em28xx/em28xx-video.c:2118 [inline]
>  kref_put include/linux/kref.h:65 [inline]
>  em28xx_v4l2_init+0x1683/0x2e70 drivers/media/usb/em28xx/em28xx-video.c:2901
>  
> Reported-by: syzbot+16062f26c6480975e5ed@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=16062f26c6480975e5ed
> Tested-by: syzbot+16062f26c6480975e5ed@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
>  drivers/media/usb/em28xx/em28xx-video.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
> index 2dfa3242a7ab..45b68ebf2e9c 100644
> --- a/drivers/media/usb/em28xx/em28xx-video.c
> +++ b/drivers/media/usb/em28xx/em28xx-video.c
> @@ -882,9 +882,12 @@ static void em28xx_v4l2_media_release(struct em28xx *dev)
>  
>  	for (i = 0; i < MAX_EM28XX_INPUT; i++) {
>  		if (!INPUT(i)->type)
> -			return;
> +			break;
>  		media_device_unregister_entity(&dev->input_ent[i]);
>  	}
> +	media_device_unregister_entity(&dev->v4l2->vdev.entity);
> +	if (em28xx_vbi_supported(dev))
> +		media_device_unregister_entity(&dev->v4l2->vbi_dev.entity);

This is definitely wrong: these are registered and unregistered in v4l2-dev.c,
so it makes no sense to unregister them here.

This is a very complicated driver, and fixing life-time issues is very hard.

Regards,

	Hans

>  #endif
>  }
>  


