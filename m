Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A31C224F96
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 15:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbfEUNEG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 09:04:06 -0400
Received: from casper.infradead.org ([85.118.1.10]:56782 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728132AbfEUNEG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 09:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=b7Vvhrpyuo4GHcZV5KayXKOp7OJNQJYnaS24rVFnWcI=; b=nNi2EfhsCHUHouS6AKc4+xJ9fZ
        P2QTZd3uCS0HjVrUoHsQGch9OYlqbIV4DG+1Cm3yQzXbGsrWtDVwwz8vrpoB/JnP49VOxaAAZGUEt
        WUZA9/jDkiN0XeJgU8LQ4hWVjsdhCeKGv8M9+17foWSgyJSkOxpHh5BDdUW7t91ZCHzddtZ/zmkiN
        EyHD4B/uN3da5OipJxNJ3Ql3GpnvRw+TbYe3cmAcGAuZmYkuP2/lmvh0CycpLYfd20Za+sMoE9DD/
        vcn+8PWuqJ90pETyHa+/UOqya5FGLaArbU7GFWOPi3lM7mMivpTqpueNT2IZKO/N+Y57mS1xTiENH
        0K8OnKcQ==;
Received: from 189.27.21.94.dynamic.adsl.gvt.net.br ([189.27.21.94] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hT4R2-0002Pu-0A; Tue, 21 May 2019 13:04:04 +0000
Date:   Tue, 21 May 2019 10:03:59 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL for v5.2] Venus updates - take3
Message-ID: <20190521100359.172e02f5@coco.lan>
In-Reply-To: <20190425214134.31905-1-stanimir.varbanov@linaro.org>
References: <20190425214134.31905-1-stanimir.varbanov@linaro.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 26 Apr 2019 00:41:34 +0300
Stanimir Varbanov <stanimir.varbanov@linaro.org> escreveu:

> Hi Mauro,
> 
> Sorry for the inconvenience, here is the third attempt.

This time, GPG signature is OK, and also the patches are there...

> 
> Added two more fixes for Venus v4 properties and dynamic buffer mode.
> 
> Please pull.
> 
> The following changes since commit 7afa8db323e37b9174cf78a1c9ab0ae7a9f5e7dd:
> 
>   media: vsp1: Add support for missing 16-bit RGB555 formats (2019-04-25 11:07:05 -0400)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-5.2-take3
> 
> for you to fetch changes up to cac29335c397d116ec405a9b67466663de1606dd:
> 
>   venus: helpers: fix dynamic buffer mode for v4 (2019-04-26 00:08:22 +0300)
> 
> ----------------------------------------------------------------
> for v5.2
> 
> ----------------------------------------------------------------
> Alexandre Courbot (1):
>       media: venus: core: fix max load for msm8996 and sdm845

... however, you forgot to add your SOB to the patches you merged here...

> 
> Kelvin Lawson (1):
>       media: venus: Add support for H265 controls

... and here.


I'll apply them anyway, but please next time please remind to use "-s"
when importing patches from other devels.

> 
> Stanimir Varbanov (2):
>       venus: hfi_cmds: add more not-implemented properties
>       venus: helpers: fix dynamic buffer mode for v4
> 
>  drivers/media/platform/qcom/venus/core.c       |  4 ++--
>  drivers/media/platform/qcom/venus/helpers.c    |  7 +++++++
>  drivers/media/platform/qcom/venus/hfi_cmds.c   |  2 ++
>  drivers/media/platform/qcom/venus/venc_ctrls.c | 21 ++++++++++++++++++++-
>  4 files changed, 31 insertions(+), 3 deletions(-)



Thanks,
Mauro
