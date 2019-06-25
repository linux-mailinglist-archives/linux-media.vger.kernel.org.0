Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF9D54E13
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 13:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbfFYL7r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 07:59:47 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:48122 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbfFYL7r (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 07:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=WVc8q6y93SYpRT1chlA10sfqhajF11rcQO6Hj2rX7zk=; b=G8VscHai0IaiWfpJmWlQq6ZQf
        PnYE91UD+3C1niAMJ63y9eOpvGHMbxu5nAOR7EpV3Isda1fH+GKM5q/92U2qxFL1ybu7TjSycMBKs
        b2wSq4kxN3ko2jTucCyWA76cEK+GebGu4AEjav60yxPMaK4oZrmluFLyUqMa4Mb7sz+c09Oz1YYtW
        5FX4n5cz0UtJr54Ggi+H/5pbPJ8cNP4NADQ+jtJpxulT4nCECNmKILmsJGrGQTflzsKwWu1MViTjW
        6oXIAcWQ15mlbPr9r5qrbDvbVp9TRuq5dOzjuvAbmp9zTBZhUsXNFL94N5xTc7VT+KSm0bGu4SWlS
        uM0dFEpjg==;
Received: from 177.205.71.220.dynamic.adsl.gvt.net.br ([177.205.71.220] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hfk71-0006IV-0I; Tue, 25 Jun 2019 11:59:47 +0000
Date:   Tue, 25 Jun 2019 08:59:43 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [Media summit topic] Criteria to drop drivers from staging - Was:
 Re: [PATCH] media: schedule removal for legacy staging drivers
Message-ID: <20190625085943.20609c4c@coco.lan>
In-Reply-To: <0fed8053f3f3a45762f2547c8ebc4e0d2728abd0.1561463295.git.mchehab+samsung@kernel.org>
References: <0fed8053f3f3a45762f2547c8ebc4e0d2728abd0.1561463295.git.mchehab+samsung@kernel.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For the next Media Summit, I'd like to discuss some criteria in order to avoid
drivers to stay at staging from longer than needed.

We have drivers at staging that aren't touched since 2014 (except for trivial
and cleanup changes or due to changes at kABI). It sounds really doubtful that
such drivers will get any care anytime soon.

The way I see from some developers is that they rush to get stuff under 
staging, but, once the code is there, they relax and pretend that their 
drivers are already at the Linux Kernel and are first class citizens.

I suspect that part of such behavior is due to some sort of pressure from
the vendors that are sponsoring their work, but, once things enter at
staging, they stop their sponsorship to fix the problems there.

Staging is not supposed to work like that: once the driver gets merged there,
developers and their sponsors should actually be committing to do whatever
required to get the driver done to be part of the Linux Kernel's full body,
and not to stay forever on a sort of Kernel's refugee camp. 

If, for whatever reason this doesn't happen, we should be dropping those
drivers after a while.

So, I'd like to discuss a set of criteria we'll be adopting in order to
decide when it is time to send unloved staging code to /dev/null.

Regards,
Mauro


Em Tue, 25 Jun 2019 08:48:26 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> Keeping legacy problematic code forever is not a good idea.
> 
> So, let's schedule a date for those legacy stuff to rest in piece.
> 
> If someone wants to steps up and take them from the staging ostracism
> and do give them a rejuvenation shower in order to address the
> isues pointed on their TODO lists, be our guest!
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  drivers/staging/media/bcm2048/TODO      | 6 ++++++
>  drivers/staging/media/davinci_vpfe/TODO | 7 +++++++
>  drivers/staging/media/omap4iss/TODO     | 7 +++++++
>  drivers/staging/media/soc_camera/TODO   | 9 +++++++++
>  4 files changed, 29 insertions(+)
> 
> diff --git a/drivers/staging/media/bcm2048/TODO b/drivers/staging/media/bcm2048/TODO
> index 6bee2a2dad68..478984672c9b 100644
> --- a/drivers/staging/media/bcm2048/TODO
> +++ b/drivers/staging/media/bcm2048/TODO
> @@ -1,3 +1,9 @@
> +NOTE:
> +   The bcm2048 driver fixes on this TODO were not addressed yet.
> +   It has been a long time since the last related change.
> +   Unless someone steps up addressing those, this driver is
> +   scheduled to be removed for Kernel 5.4.
> +
>  TODO:
>  
>  From the initial code review:
> diff --git a/drivers/staging/media/davinci_vpfe/TODO b/drivers/staging/media/davinci_vpfe/TODO
> index cc8bd9306f2a..9d4577a911c9 100644
> --- a/drivers/staging/media/davinci_vpfe/TODO
> +++ b/drivers/staging/media/davinci_vpfe/TODO
> @@ -1,3 +1,10 @@
> +NOTE:
> +   The davinci_vpfe driver fixes on this TODO were not addressed yet.
> +   It has been a long time since the last related change.
> +   Unless someone steps up addressing those, this driver is
> +   scheduled to be removed for Kernel 5.4.
> +
> +
>  TODO (general):
>  ==================================
>  
> diff --git a/drivers/staging/media/omap4iss/TODO b/drivers/staging/media/omap4iss/TODO
> index 4d220ef82653..fb90be3c1f32 100644
> --- a/drivers/staging/media/omap4iss/TODO
> +++ b/drivers/staging/media/omap4iss/TODO
> @@ -1,3 +1,10 @@
> +NOTE:
> +   The omap4iss driver fixes on this TODO were not addressed yet.
> +   It has been a long time since the last related change.
> +   Unless someone steps up addressing those, this driver is
> +   scheduled to be removed for Kernel 5.4.
> +
> +
>  * Fix FIFO/buffer overflows and underflows
>  * Replace dummy resizer code with a real implementation
>  * Fix checkpatch errors and warnings
> diff --git a/drivers/staging/media/soc_camera/TODO b/drivers/staging/media/soc_camera/TODO
> index 932af6443b67..677dcdc1de61 100644
> --- a/drivers/staging/media/soc_camera/TODO
> +++ b/drivers/staging/media/soc_camera/TODO
> @@ -1,3 +1,12 @@
> +NOTE:
> +   The old drivers that depends on SoC camera framework require
> +   conversion. We're not accepting any patches that are doing just
> +   checkpatch or style fixes before such conversion.
> +
> +   If nobody steps up addressing those, this driver is scheduled to be
> +   removed for Kernel 5.5.
> +
> +
>  The SoC camera framework is obsolete and scheduled for removal in the near
>  future. Developers are encouraged to convert the drivers to use the
>  regular V4L2 API if these drivers are still needed (and if someone has the



Thanks,
Mauro
