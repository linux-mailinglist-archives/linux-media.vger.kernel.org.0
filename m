Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D29F256D60
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 12:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbgH3K4T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 06:56:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:45772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726406AbgH3K4P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 06:56:15 -0400
Received: from coco.lan (ip5f5ad5b3.dynamic.kabel-deutschland.de [95.90.213.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 75EEB207DA;
        Sun, 30 Aug 2020 10:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598784974;
        bh=sDyP8wiayeZR0DcWXLBDe1i+k6BXoERi+SI05wLU1/E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Davr/tK53989y0mwAZ9+8YEHKNQCfFEXOMch1W5q6syHRskpVTvSF9LCiH2Z9MkYi
         pJB0wajFSGa5y6CNN8Uw3yXBzBrLqS5GNSeQu5LST8HBjRfXCY899PbSj2KDViTIZV
         S89fABLWMwqIQgFnBtIoe8gZTfo/vveR6EkTN/Zw=
Date:   Sun, 30 Aug 2020 12:56:09 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH] remoteproc: scp: add COMPILE_TEST dependency
Message-ID: <20200830125601.468a24d8@coco.lan>
In-Reply-To: <20200821115832.2893484-1-acourbot@chromium.org>
References: <20200821115832.2893484-1-acourbot@chromium.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 21 Aug 2020 20:58:32 +0900
Alexandre Courbot <acourbot@chromium.org> escreveu:

> This will improve this driver's build coverage.

There is a pending pull request for media which seems to depend
on this patch. Without it, COMPILE_TEST breaks at linux-media
git tree, if I pick it. See:

	https://lore.kernel.org/linux-media/20200830104650.0dd4d751@coco.lan/T/#t

The best here would be to get an ack from the remoteproc
maintainers to get this patch merged via the media tree.

Alternatively, this patch could be applied on a stable topic branch
at remoteproc tree, which would be merged at the media tree, or
cherry-picked on media after being committed at remoteproc tree.

Regards,
Mauro

> 
> Reported-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/remoteproc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index c6659dfea7c7..d1fcada71017 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -43,7 +43,7 @@ config INGENIC_VPU_RPROC
>  
>  config MTK_SCP
>  	tristate "Mediatek SCP support"
> -	depends on ARCH_MEDIATEK
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
>  	select RPMSG_MTK_SCP
>  	help
>  	  Say y here to support Mediatek's System Companion Processor (SCP) via



Thanks,
Mauro
