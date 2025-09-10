Return-Path: <linux-media+bounces-42167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AED2AB5125F
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 11:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6A4F1B28255
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 09:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D1731328E;
	Wed, 10 Sep 2025 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ORl1h+mf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13122D660E;
	Wed, 10 Sep 2025 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757496180; cv=none; b=XV3yR5utYT4RKoGCWNgv7YjiLvnm/a3MM2XVss5k36yfFagePVWeJO947UIEwGXCi5TiD/q0Vr7masE/BsAjGQU5kb2o3SgPmnHOTxYTuOIDiwBBrElF1AJ29Me+zVR7tZZkwZwI6Gfso1pafarNFW812Z3gkVcywsypRUQlCrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757496180; c=relaxed/simple;
	bh=yd0ny0R9oIhP7Ea9IXvlxJK03B0rSJN5DFpKsoJYET8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmdeDTHquIdNAcqB6Wye4IazvrAVq7YWY8ED7FYy7U9gIZ6OCY0TALBtc5vYk0GcQJ6GevmJg6k1olvCCsG+p9+JYsv+dUL39pEFO0Czi7agbPbm43XucX42cpFpY60RRz/tvDUT9cr0s3cPZUy99UlMUBK+o1PIMjjkxxGA1JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ORl1h+mf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AC2EFDAB;
	Wed, 10 Sep 2025 11:21:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757496102;
	bh=yd0ny0R9oIhP7Ea9IXvlxJK03B0rSJN5DFpKsoJYET8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ORl1h+mfxb6QAugG0FoJkjw8EykOpXQyVGC7RBKF7svrsjkFQucQZAgOJfsWeNqPU
	 03HAdGcuhIRCK4xYuBhvrFFm4GTqUc9utCO/jOrq3n9ZAPjfHoZos6pDiqj8GVJZY5
	 6Xi+mvGISLffWEU0xIvIPa5IfvDwoh0auPIOUQWk=
Date: Wed, 10 Sep 2025 12:22:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Edward Adam Davis <eadavis@qq.com>
Cc: syzbot+031d0cfd7c362817963f@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH Next] media: mc: Clear minor number before put device
Message-ID: <20250910092233.GA20904@pendragon.ideasonboard.com>
References: <68c097c5.050a0220.3c6139.000a.GAE@google.com>
 <tencent_341BA32545BAFBBB2133249EDE1B774B4908@qq.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_341BA32545BAFBBB2133249EDE1B774B4908@qq.com>

Hello Edward,

On Wed, Sep 10, 2025 at 09:15:27AM +0800, Edward Adam Davis wrote:
> The device minor should not be cleared after the device is released.

The most important piece of information in a commit message is the
reason for the patch. You need to explain *why* this is needed, not just
state it should be done.

> Fixes: 9e14868dc952 ("media: mc: Clear minor number reservation at unregistration time")
> Reported-by: syzbot+031d0cfd7c362817963f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=031d0cfd7c362817963f
> Tested-by: syzbot+031d0cfd7c362817963f@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
>  drivers/media/mc/mc-devnode.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-devnode.c b/drivers/media/mc/mc-devnode.c
> index 0d01cbae98f2..6daa7aa99442 100644
> --- a/drivers/media/mc/mc-devnode.c
> +++ b/drivers/media/mc/mc-devnode.c
> @@ -276,13 +276,10 @@ void media_devnode_unregister(struct media_devnode *devnode)
>  	/* Delete the cdev on this minor as well */
>  	cdev_device_del(&devnode->cdev, &devnode->dev);
>  	devnode->media_dev = NULL;
> +	clear_bit(devnode->minor, media_devnode_nums);
>  	mutex_unlock(&media_devnode_lock);
>  
>  	put_device(&devnode->dev);
> -
> -	mutex_lock(&media_devnode_lock);
> -	clear_bit(devnode->minor, media_devnode_nums);
> -	mutex_unlock(&media_devnode_lock);
>  }
>  
>  /*

-- 
Regards,

Laurent Pinchart

