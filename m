Return-Path: <linux-media+bounces-50365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D86D0F4DE
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 16:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6E953064C09
	for <lists+linux-media@lfdr.de>; Sun, 11 Jan 2026 15:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA81B330B2B;
	Sun, 11 Jan 2026 15:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OtuAkmWp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6991D318BAF;
	Sun, 11 Jan 2026 15:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768145549; cv=none; b=vEF30o4+UAwju5HRklkeG9QJsbvSn3lllC471C3ZXh4BtjIwVyv6O2MUqlIYE8O58EIGIfeuNNFR0rzKklABhWJUas9UgRZBZfjd5LjDf8myBevEhlTG0290yN18rr8ODeSeyCoVkQNNQUDaQzbeR/MSX+7Y6Q26HXxGl5WJPLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768145549; c=relaxed/simple;
	bh=YKUjPJu4L2XFGRRiHGMv/cEQPKJwxTSS9OoppgDEUE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQYTuZssXdAZ80t9ltIRRlbiXAsXC3GRm9N4X09FriibBLmN+UiH5t7S+f3fm4MO0Kscw5TuZaX/e2llaAGmBSYfY9TtGZO2LRfHFaSe+28z9otLJYI6zr/gmUvAZX1Wq4B+zvO91c0WTdX7zC44FoVh3aaamotk+sGk25NXU3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OtuAkmWp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3F95633F;
	Sun, 11 Jan 2026 16:31:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768145513;
	bh=YKUjPJu4L2XFGRRiHGMv/cEQPKJwxTSS9OoppgDEUE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OtuAkmWpKc3rbe/23h0zXJ67ssZXamPzxBrFVUKAuxpkalckdMM6SqWvxyAoGiHv0
	 n0diO3SLNW7tnWyYWqKaECYO7oD01vs82HXTLJ5smXIYX/7InMEF+mpemxUxQugxdS
	 JR2KQhBp0k1HsMC8qjs2mlZQ3o4ZaK5FUpvejpcc=
Date: Sun, 11 Jan 2026 17:31:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Edward Adam Davis <eadavis@qq.com>
Cc: syzbot+16062f26c6480975e5ed@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH 1/2] media: em28xx-video: add the unregister of video/VBI
 entity
Message-ID: <20260111153156.GA4474@pendragon.ideasonboard.com>
References: <69608280.050a0220.1c677c.03b0.GAE@google.com>
 <tencent_0D8C88E7C506C4D2C2064149816ECB6EDB06@qq.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_0D8C88E7C506C4D2C2064149816ECB6EDB06@qq.com>

On Sun, Jan 11, 2026 at 01:29:10PM +0800, Edward Adam Davis wrote:
> When creating a media graph, a failure occurred due to the lack of
> a corresponding decoder. During the subsequent media device release
> process, the video and VBI devices were not properly unregistered,
> leading to a use-after-free vulnerability reported by syzbot [1].

You have no idea what this means, do you ?

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
>  #endif
>  }
>  

-- 
Regards,

Laurent Pinchart

