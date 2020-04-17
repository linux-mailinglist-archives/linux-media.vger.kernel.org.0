Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A013F1AD755
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 09:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728930AbgDQHYH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 03:24:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:34898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728419AbgDQHYH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 03:24:07 -0400
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4CB0E2054F;
        Fri, 17 Apr 2020 07:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587108247;
        bh=VVl6eQijGUYnBJboOjeT+LbLAwqwN9J8c1/DpsLE62o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GGtYUYFg/oe0o91C3yetUX8RyOViYWYJ/jfWLd9vExgJWm9MiA9cYb7NO6q0/V9cr
         KeO1MY5X2OogGXs677cfMETU7OOwBiXaL4m6tnNII03oZ7UKrGoyD7tJ8/FAQZfJwE
         Tq2gYkqeT2JX/3hFTlLy8IHrt2SS7RpRzRexwNfs=
Date:   Fri, 17 Apr 2020 09:24:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     sy0816.kang@samsung.com
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-compat-ioctl32.c: copy reserved2 field in
 get_v4l2_buffer32
Message-ID: <20200417092402.3322e2da@coco.lan>
In-Reply-To: <20200417024543.66785-1-sy0816.kang@samsung.com>
References: <CGME20200417025205epcas2p46d33e64f2de49041d2ca68ecc98fc83e@epcas2p4.samsung.com>
        <20200417024543.66785-1-sy0816.kang@samsung.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 17 Apr 2020 11:45:23 +0900
sy0816.kang@samsung.com escreveu:

> From: Sunyoung Kang <sy0816.kang@samsung.com>
> 
> get_v4l2_buffer32() didn't copy reserved2 field from userspace to driver.
> So the reserved2 value is not received through compat-ioctl32 in driver.
> This patch copy reserved2 field of v4l2_buffer in get_v4l2_buffer32().

Why should it copy reserved values? Those should not be used anywhere.

> 
> Signed-off-by: Sunyoung Kang <sy0816.kang@samsung.com>
> ---
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> index a99e82ec9ab6..e9b2b9c0ec9a 100644
> --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> @@ -665,6 +665,7 @@ static int get_v4l2_buffer32(struct v4l2_buffer __user *p64,
>  	if (V4L2_TYPE_IS_OUTPUT(type))
>  		if (assign_in_user(&p64->bytesused, &p32->bytesused) ||
>  		    assign_in_user(&p64->field, &p32->field) ||
> +		    assign_in_user(&p64->reserved2, &p32->reserved2) ||
>  		    assign_in_user(&p64->timestamp.tv_sec,
>  				   &p32->timestamp.tv_sec) ||
>  		    assign_in_user(&p64->timestamp.tv_usec,



Thanks,
Mauro
