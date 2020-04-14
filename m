Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 865551A8AB0
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 21:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504722AbgDNT1A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 15:27:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:34674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2504719AbgDNT07 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 15:26:59 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 25BE420771;
        Tue, 14 Apr 2020 19:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586892419;
        bh=UbWeegJc/hCo4TghR8BsqS3HIoPgis3FasoEfOE+ch4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lRl8kIS6Zb5wtSyB4UO4T6Epe2tacxx/QLBEtcbNKbhTMfDgFhVbHkco5jJpRLjhX
         UDjc7OnL9cBW9dh9BIIsIwVZblF7i5jCnuuMjzFtcyq25v8QUWCniTeOdxfBfTgEXR
         hAfcqiV33jZbENWrqc19xYYuXf0zt2BIiJ77FGiI=
Date:   Tue, 14 Apr 2020 21:26:55 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        ezequiel@collabora.com
Subject: Re: [PATCH] media: Makefile: fix test drivers compilation
Message-ID: <20200414212655.4b524781@coco.lan>
In-Reply-To: <20200414190238.1326598-1-helen.koike@collabora.com>
References: <20200414190238.1326598-1-helen.koike@collabora.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 14 Apr 2020 16:02:38 -0300
Helen Koike <helen.koike@collabora.com> escreveu:

> test_drivers/ folder is not being added by media Makefile, so it is not
> being compiled.
> 
> Add test_drivers/ folder in Makefile folder's list.

Applied, thanks!

> 
> Fixes: 4b32216adb010 ("media: split test drivers from platform directory")
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> ---
> 
>  drivers/media/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/Makefile b/drivers/media/Makefile
> index f215f0a89f9e6..693b3f0bf03ee 100644
> --- a/drivers/media/Makefile
> +++ b/drivers/media/Makefile
> @@ -29,6 +29,6 @@ obj-$(CONFIG_CEC_CORE) += cec/
>  # Finally, merge the drivers that require the core
>  #
>  
> -obj-y += common/ platform/ pci/ usb/ mmc/ firewire/ spi/
> +obj-y += common/ platform/ pci/ usb/ mmc/ firewire/ spi/ test_drivers/
>  obj-$(CONFIG_VIDEO_DEV) += radio/
>  



Thanks,
Mauro
