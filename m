Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA1C75427
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 18:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729389AbfGYQgo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 12:36:44 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50872 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729324AbfGYQgo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 12:36:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=dvI8DMCPB0mVch084EkucfID+Hct74Ut5pchD8Hr/xk=; b=f5bG5qcBSUXjs1eXTsJg3rcR5
        R9FSTdM623LUf3dBD9znKlEq6nRmC12I34IVXQ0mZy7Ig6X68U6dWIJa8HO7YC5KpmWN7bP3nYcVK
        oBC5qs3md54/yCYcUiW/ie6DMHY17KzpdtJ22wCpkJ2RRvTMzr8QZq8fzucmpima0OfHEngj3LXGW
        PF46zvP2q+ACD0QWreRLikZOAgIam5iTnpcIe7bfgmGOvG7JOOsoJ/z6Brr/yij8WinEMpqXV3KfT
        wCVKlK65wSD1l8faJnRrTMHCoeLwXVy6TIlDK/LZLWPdstRugFaF3cEUqacpiCKIsgZMzjKag17SF
        t2/AnN3LQ==;
Received: from [179.95.31.157] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqgjT-0000Ue-0b; Thu, 25 Jul 2019 16:36:43 +0000
Date:   Thu, 25 Jul 2019 13:36:39 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= 
        <niklas.soderlund@ragnatech.se>
Subject: Re: [GIT PULL FOR v5.4] Support RK3399 VP8 decoding, various fixes,
 rcar-vin improvements
Message-ID: <20190725133639.5291ae58@coco.lan>
In-Reply-To: <71f1bbc8-6b98-968d-b3ec-f331d517124a@xs4all.nl>
References: <71f1bbc8-6b98-968d-b3ec-f331d517124a@xs4all.nl>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 25 Jul 2019 17:33:47 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> Hi Mauro,
> 
> Please note the 'v4l2-dev: fix WARN_ON(!vdev->device_caps)' patch. Sorry about
> that. I did test the original patch with vimc, but test-media doesn't actually
> create a FAIL if a module can't be loaded. I'll fix that.
> 
> Other than that it's the usual fixes/cleanups and also it adds RK3399 VP8 decoding.
> 
> Regards,
> 
> 	Hans
> 
> The following changes since commit 6ddb094a9f8c451c42bc7c58cfed22275e8a1e38:
> 
>   media: staging/intel-ipu3: Use dev_get_drvdata where possible (2019-07-25 06:45:46 -0400)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.4e2
> 
> for you to fetch changes up to bb636bb902862c0008d7cd96ebae38fe41656233:
> 
>   media: v4l2-core: introduce a helper to unregister a I2C subdev (2019-07-25 17:13:27 +0200)
> 

...

> Ezequiel Garcia (9):

...

>       media: v4l2-core: Module re-organization
>       media: v4l2-core: move spi helpers out of v4l2-common.c
>       media: v4l2-core: move i2c helpers out of v4l2-common.c
>       media: v4l2-core: introduce a helper to unregister a SPI subdev
>       media: v4l2-core: introduce a helper to unregister a I2C subdev

Didn't apply those. The first patch is incomplete, as it is keeping
MODULE_FOO at the now-dead v4l2-common module.

As the other patches depend on it, I just applied the non-related
patches, keeping this out of the patches merged upstream.

Thanks,
Mauro
