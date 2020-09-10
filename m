Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE3A3263F98
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 10:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730312AbgIJIXE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 10 Sep 2020 04:23:04 -0400
Received: from mail.v3.sk ([167.172.186.51]:39634 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730302AbgIJIWt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 04:22:49 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 4F2E2DFA45;
        Thu, 10 Sep 2020 08:21:08 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id JjWdI58MP4mg; Thu, 10 Sep 2020 08:21:05 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 5050BDFA56;
        Thu, 10 Sep 2020 08:21:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 0yK8XgzSVxvC; Thu, 10 Sep 2020 08:21:04 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 50621DFA45;
        Thu, 10 Sep 2020 08:21:03 +0000 (UTC)
Date:   Thu, 10 Sep 2020 10:22:21 +0200
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     corbet@lwn.net, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] media: marvell-ccic: Fix -Wunused-function warnings
Message-ID: <20200910082221.GA1115782@demiurge.local>
References: <20200910080933.40684-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200910080933.40684-1-yuehaibing@huawei.com>
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 10, 2020 at 04:09:33PM +0800, YueHaibing wrote:
> If CONFIG_PM is n, gcc warns:
> 
> drivers/media/platform/marvell-ccic/mmp-driver.c:347:12: warning: ‘mmpcam_resume’ defined but not used [-Wunused-function]
>  static int mmpcam_resume(struct device *dev)
>             ^~~~~~~~~~~~~
> drivers/media/platform/marvell-ccic/mmp-driver.c:338:12: warning: ‘mmpcam_suspend’ defined but not used [-Wunused-function]
>  static int mmpcam_suspend(struct device *dev)
>             ^~~~~~~~~~~~~~
> drivers/media/platform/marvell-ccic/mmp-driver.c:324:12: warning: ‘mmpcam_runtime_suspend’ defined but not used [-Wunused-function]
>  static int mmpcam_runtime_suspend(struct device *dev)
>             ^~~~~~~~~~~~~~~~~~~~~~
> drivers/media/platform/marvell-ccic/mmp-driver.c:310:12: warning: ‘mmpcam_runtime_resume’ defined but not used [-Wunused-function]
>  static int mmpcam_runtime_resume(struct device *dev)
>             ^~~~~~~~~~~~~~~~~~~~~
> 
> Mark them as __maybe_unused to fix this.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Your colleague seems to sent out an equivalent patch:
https://lore.kernel.org/lkml/20200910080933.40684-1-yuehaibing@huawei.com/

Cheers
Lubo

> ---
>  drivers/media/platform/marvell-ccic/mmp-driver.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/marvell-ccic/mmp-driver.c b/drivers/media/platform/marvell-ccic/mmp-driver.c
> index c4b28a00a3a2..032fdddbbecc 100644
> --- a/drivers/media/platform/marvell-ccic/mmp-driver.c
> +++ b/drivers/media/platform/marvell-ccic/mmp-driver.c
> @@ -307,7 +307,7 @@ static int mmpcam_platform_remove(struct platform_device *pdev)
>   * Suspend/resume support.
>   */
>  
> -static int mmpcam_runtime_resume(struct device *dev)
> +static int __maybe_unused mmpcam_runtime_resume(struct device *dev)
>  {
>  	struct mmp_camera *cam = dev_get_drvdata(dev);
>  	struct mcam_camera *mcam = &cam->mcam;
> @@ -321,7 +321,7 @@ static int mmpcam_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static int mmpcam_runtime_suspend(struct device *dev)
> +static int __maybe_unused mmpcam_runtime_suspend(struct device *dev)
>  {
>  	struct mmp_camera *cam = dev_get_drvdata(dev);
>  	struct mcam_camera *mcam = &cam->mcam;
> @@ -335,7 +335,7 @@ static int mmpcam_runtime_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int mmpcam_suspend(struct device *dev)
> +static int __maybe_unused mmpcam_suspend(struct device *dev)
>  {
>  	struct mmp_camera *cam = dev_get_drvdata(dev);
>  
> @@ -344,7 +344,7 @@ static int mmpcam_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int mmpcam_resume(struct device *dev)
> +static int __maybe_unused mmpcam_resume(struct device *dev)
>  {
>  	struct mmp_camera *cam = dev_get_drvdata(dev);
>  
> -- 
> 2.17.1
> 
> 
