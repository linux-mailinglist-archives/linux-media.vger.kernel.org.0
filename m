Return-Path: <linux-media+bounces-65867-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HmzpIYonQmox1AkAu9opvQ
	(envelope-from <linux-media+bounces-65867-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:06:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0981E6D74A7
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:06:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="S3/GFQ8Z";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65867-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65867-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1175E322D0C3
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 07:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594F1390217;
	Mon, 29 Jun 2026 07:45:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4745D3DD50F;
	Mon, 29 Jun 2026 07:45:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782719144; cv=none; b=ihLZQO181Yxbs3evK1yse5fCzOrDlJUuHZA8b5mWX2nEJYFfw5/oh+cadY3Qps3l3dfSZS7Cu5TXWM7ZunshLu12SoQ3CiNyZttU1NaaNYcGZtWw22mV4HRJQ2nsOGF1RQhFxkPePRa1sFG5+DEMSX5k1wnFSUD4t0qD3aHMnZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782719144; c=relaxed/simple;
	bh=GdOSW+9QpbI+GOCh/RF/AckWXho4xoQ8zdx+rrMu8RI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gguaqOJw9w5I4Or3WUgHHTsTM9/oZRP1GpAVPLrLfOa0XFNU/crE9K3GGd51/HS5c/0ceZaN0BwesJzMD04Vmc0QfNmHeFn6UJlyUyodLPIZYfCeY/VoVXqJVfk4QOSs4b4HnaXC1xg58B5C6BEdTJJhfUEMNwmAnxiraLkdEJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3/GFQ8Z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5D31F00A3A;
	Mon, 29 Jun 2026 07:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782719137;
	bh=X0uYIgycRQfmlWGtZQLMUu7Bf9aoXkgVqzrHIxUISYM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=S3/GFQ8ZHJP33yNpAHgjlK04oWaIhQn9/JJ7ugdwUgAybIrffOlWXC8gbrimqKxGl
	 lH5wg/52z9ldIDSLDr5sPVjCD7AV1+F8c//nYYQfZmPSv6ds0vRyEdvvkMy7/eHhCx
	 D+BShmZcHknlfPmvdVPInaB9rNtxADquwvWimiexfd4hXBzd4p0Xx5UqVsBjj4/TzQ
	 isfN3oF1XnrNGhFYu2xGB5qabTM7DbJ5H4Ztyp1fAlriprvHMl5SDyT06r7vqtoe/B
	 xJbBkH9L2FHJpEkQqG3JsshZ4TzvQrtliCUX1e3x5WUmKnUW4Mp8MBP7jToam0Muoh
	 9m8PnjcrBi5FA==
Message-ID: <e0c25e65-8e07-41bc-a165-ae5e770a71a2@kernel.org>
Date: Mon, 29 Jun 2026 09:45:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: em28xx: keep device state alive for registered
 video nodes
To: Yousef Alhouseen <alhouseenyousef@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Abhishek Kumar <abhishek_sts8@yahoo.com>, stable@vger.kernel.org,
 syzbot+39ff299961a7c07f00f0@syzkaller.appspotmail.com
References: <20260628003103.24832-1-alhouseenyousef@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260628003103.24832-1-alhouseenyousef@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-65867-lists,linux-media=lfdr.de,cisco];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alhouseenyousef@gmail.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil-cisco@xs4all.nl,m:abhishek_sts8@yahoo.com,m:stable@vger.kernel.org,m:syzbot+39ff299961a7c07f00f0@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,xs4all.nl,yahoo.com,syzkaller.appspotmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-media,39ff299961a7c07f00f0];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,appspotmail.com:email,vger.kernel.org:from_smtp,syzkaller.appspot.com:url,linuxtv.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0981E6D74A7

On 28/06/2026 02:31, Yousef Alhouseen wrote:
> The V4L2 core takes a video_device reference before invoking the
> driver open callback. That reference does not protect em28xx state
> because all three video_device objects are embedded in em28xx_v4l2 and
> use video_device_release_empty().
> 
> If initialization fails after registering a node, the error path can
> unregister it and drop the last em28xx_v4l2 reference while a concurrent
> open has passed the core registration check. The open callback then
> dereferences the freed video_device in video_drvdata(), as observed by
> KASAN. A disconnect has the same lifetime gap.
> 
> Give each successfully registered video node references to both the
> enclosing V4L2 state and the parent em28xx device. Release those
> references from the video_device release callback, after the core has
> drained pending opens and existing file references.

This patch series should fix this issue properly:

https://patchwork.linuxtv.org/project/linux-media/list/?series=26968

Rejecting this patch, manually manipulating refcounts is not the way to go.

Regards,

	Hans

> 
> Fixes: ef74a0b9ff56 ("[media] em28xx: move video_device structs from struct em28xx to struct v4l2")
> Reported-by: syzbot+39ff299961a7c07f00f0@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=39ff299961a7c07f00f0
> Cc: stable@vger.kernel.org
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
>  drivers/media/usb/em28xx/em28xx-video.c | 35 +++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
> index da0422c65e5f..4274a9bcb432 100644
> --- a/drivers/media/usb/em28xx/em28xx-video.c
> +++ b/drivers/media/usb/em28xx/em28xx-video.c
> @@ -2289,6 +2289,31 @@ static void em28xx_free_v4l2(struct kref *ref)
>  	kfree(v4l2);
>  }
>  
> +static void em28xx_vdev_release(struct video_device *vdev)
> +{
> +	struct em28xx_v4l2 *v4l2;
> +	struct em28xx *dev;
> +
> +	switch (vdev->vfl_type) {
> +	case VFL_TYPE_VIDEO:
> +		v4l2 = container_of(vdev, struct em28xx_v4l2, vdev);
> +		break;
> +	case VFL_TYPE_VBI:
> +		v4l2 = container_of(vdev, struct em28xx_v4l2, vbi_dev);
> +		break;
> +	case VFL_TYPE_RADIO:
> +		v4l2 = container_of(vdev, struct em28xx_v4l2, radio_dev);
> +		break;
> +	default:
> +		WARN_ON_ONCE(1);
> +		return;
> +	}
> +
> +	dev = v4l2->dev;
> +	kref_put(&v4l2->ref, em28xx_free_v4l2);
> +	kref_put(&dev->ref, em28xx_free_device);
> +}
> +
>  /*
>   * em28xx_v4l2_open()
>   * inits the device and starts isoc transfer
> @@ -2554,7 +2579,7 @@ static const struct v4l2_ioctl_ops video_ioctl_ops = {
>  static const struct video_device em28xx_video_template = {
>  	.fops		= &em28xx_v4l_fops,
>  	.ioctl_ops	= &video_ioctl_ops,
> -	.release	= video_device_release_empty,
> +	.release	= em28xx_vdev_release,
>  	.tvnorms	= V4L2_STD_ALL,
>  };
>  
> @@ -2583,7 +2608,7 @@ static const struct v4l2_ioctl_ops radio_ioctl_ops = {
>  static struct video_device em28xx_radio_template = {
>  	.fops		= &radio_fops,
>  	.ioctl_ops	= &radio_ioctl_ops,
> -	.release	= video_device_release_empty,
> +	.release	= em28xx_vdev_release,
>  };
>  
>  /* I2C possible address to saa7115, tvp5150, msp3400, tvaudio */
> @@ -2965,6 +2990,8 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  			"unable to register video device (error=%i).\n", ret);
>  		goto unregister_dev;
>  	}
> +	kref_get(&v4l2->ref);
> +	kref_get(&dev->ref);
>  
>  	/* Allocate and fill vbi video_device struct */
>  	if (em28xx_vbi_supported(dev) == 1) {
> @@ -2999,6 +3026,8 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  				"unable to register vbi device\n");
>  			goto unregister_dev;
>  		}
> +		kref_get(&v4l2->ref);
> +		kref_get(&dev->ref);
>  	}
>  
>  	if (em28xx_boards[dev->model].radio.type == EM28XX_RADIO) {
> @@ -3012,6 +3041,8 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  				"can't register radio device\n");
>  			goto unregister_dev;
>  		}
> +		kref_get(&v4l2->ref);
> +		kref_get(&dev->ref);
>  		dev_info(&dev->intf->dev,
>  			 "Registered radio device as %s\n",
>  			 video_device_node_name(&v4l2->radio_dev));


