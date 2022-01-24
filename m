Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2E64976CF
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 01:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240677AbiAXA4V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 19:56:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235417AbiAXA4V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 19:56:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3BDEC06173B
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 16:56:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8FEE0611EA
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 00:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4605DC340E3;
        Mon, 24 Jan 2022 00:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642985779;
        bh=FPwGCSRtEcpp/2O8UuQi0yF+SRZORjFHX421dhsUA/I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qWgK8q16U/qiJuaaq4LefLOqMGxg9bbTk/HOCfa4FIL8D5lrWVsHhNl9S4wYPm+yo
         6Ofy38jqc1zAxL9YJ6v8HD6UCYkYeV5JWkr5QUgyh5X6pvsxfd6sXQXZE1qWZOEZhS
         I2lsK1lAlq3G3E0SSZZ6reOtJfslMn40XnKY8ErCwyTahC/eRsIVfnAwwgE7uaPfhV
         z0AMvothQ8KubxoBxXB4VlHDfVNj0uuEWvLolykro9ROPE9aIjzapGLAHhlpM61tZ6
         fYyXuJC9vABdw7ZKDUkK8iP7ocHYJykXcRaY3bjIyduxMpqkjuD8RNJzgNtkuO+KkR
         awz0OIOT/ITBg==
Date:   Mon, 24 Jan 2022 01:56:15 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR v5.18] rc core patches
Message-ID: <20220124015609.268b6938@coco.lan>
In-Reply-To: <YemJ7jU3oKJHvfnV@gofer.mess.org>
References: <YemJ7jU3oKJHvfnV@gofer.mess.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 20 Jan 2022 16:12:30 +0000
Sean Young <sean@mess.org> escreveu:

> Hi Mauro,
> 
> A few small changes, mostly simplifying things.
> 
> Sean
> 
> The following changes since commit ef483454f92bb2b8fe9ac4ec64cb00de61b87724:
> 
>   media: staging: media: zoran: drop read/write support (2022-01-12 07:11:58 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/syoung/media_tree.git tags/v5.18a
> 
> for you to fetch changes up to 40edd4dd217a080cb5b7d5af9da04fd773234d10:
> 
>   media: mtk-cir: simplify code (2022-01-15 11:45:38 +0000)
> 
> ----------------------------------------------------------------
> v5.18a
> 
> ----------------------------------------------------------------
> Peiwei Hu (1):
>       media: ir_toy: free before error exiting
> 
> Sean Young (5):
>       media: lirc: remove unused lirc features

See my comments with regards to this one.

The remaining patches were applied, thanks!

Regards,
Mauro

>       media: lirc: simplify gap calculation
>       media: mtk-cir: reduce message end to fix nec repeats
>       media: mtk-cir: remove superfluous ir_raw_event_reset()
>       media: mtk-cir: simplify code
> 
>  .../userspace-api/media/rc/lirc-get-features.rst   | 18 ----------
>  drivers/media/rc/ir_toy.c                          |  2 +-
>  drivers/media/rc/lirc_dev.c                        | 19 ++++-------
>  drivers/media/rc/mtk-cir.c                         | 39 +++++++++++-----------
>  include/media/rc-core.h                            |  6 +---
>  include/uapi/linux/lirc.h                          |  4 ---
>  tools/include/uapi/linux/lirc.h                    | 11 +++---
>  7 files changed, 33 insertions(+), 66 deletions(-)



Thanks,
Mauro
