Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A44E2268FE6
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 17:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgINP3Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 11:29:25 -0400
Received: from mail.v3.sk ([167.172.186.51]:60496 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726297AbgINP2r (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 11:28:47 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 9B1F1DF1C5;
        Mon, 14 Sep 2020 15:27:18 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id jvFD0hC9-Cd0; Mon, 14 Sep 2020 15:27:18 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 0D230DFA6A;
        Mon, 14 Sep 2020 15:27:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id WDfPBBW1a30S; Mon, 14 Sep 2020 15:27:17 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id B37F0DF1C5;
        Mon, 14 Sep 2020 15:27:17 +0000 (UTC)
Date:   Mon, 14 Sep 2020 17:28:34 +0200
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: marvell-ccic: Pass __maybe_unused to the PM hooks
Message-ID: <20200914152834.GA2969213@demiurge.local>
References: <20200914114244.6036-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914114244.6036-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 14, 2020 at 08:42:43AM -0300, Fabio Estevam wrote:
> Building for the riscv allmodconfig target leads to the following
> build warnings:
> 
> drivers/media/platform/marvell-ccic/mmp-driver.c:347:12: warning: 'mmpcam_resume' defined but not used [-Wunused-function]
> drivers/media/platform/marvell-ccic/mmp-driver.c:338:12: warning: 'mmpcam_suspend' defined but not used [-Wunused-function]
> 
> This happens because the generated .config does not select CONFIG_PM and 
> CONFIG_PM_SLEEP options.
> 
> Mark the PM hooks as __maybe_unused to avoid such warnings.
> 
> Reported-by: Olof's autobuilder <build@lixom.net>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Thanks for the patch.
Two equivalent patches have been sent to linux-media@ before though.

Cheers
Lubo

> ---
>  drivers/media/platform/marvell-ccic/mmp-driver.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/media/platform/marvell-ccic/mmp-driver.c
> index c4b28a00a3a2..097d7775e1ee 100644
> --- a/drivers/media/platform/marvell-ccic/mmp-driver.c
> +++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
> @@ -307,7 +307,7 @@ static int mmpcam_platform_remove(struct platform_device *pdev)
>   * Suspend/resume support.
>   */
>  
> -static int mmpcam_runtime_resume(struct device *dev)
> +static __maybe_unused int mmpcam_runtime_resume(struct device *dev)
>  {
>  	struct mmp_camera *cam = dev_get_drvdata(dev);
>  	struct mcam_camera *mcam = &cam->mcam;
> @@ -321,7 +321,7 @@ static int mmpcam_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static int mmpcam_runtime_suspend(struct device *dev)
> +static __maybe_unused int mmpcam_runtime_suspend(struct device *dev)
>  {
>  	struct mmp_camera *cam = dev_get_drvdata(dev);
>  	struct mcam_camera *mcam = &cam->mcam;
> @@ -335,7 +335,7 @@ static int mmpcam_runtime_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int mmpcam_suspend(struct device *dev)
> +static __maybe_unused int mmpcam_suspend(struct device *dev)
>  {
>  	struct mmp_camera *cam = dev_get_drvdata(dev);
>  
> @@ -344,7 +344,7 @@ static int mmpcam_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int mmpcam_resume(struct device *dev)
> +static __maybe_unused int mmpcam_resume(struct device *dev)
>  {
>  	struct mmp_camera *cam = dev_get_drvdata(dev);
>  
> -- 
> 2.17.1
> 
