Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBB1443DFC
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 09:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbhKCIHp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 04:07:45 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:33468 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230025AbhKCIHl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 04:07:41 -0400
X-UUID: 6260f25acf9f4811aef24097f28d4861-20211103
X-UUID: 6260f25acf9f4811aef24097f28d4861-20211103
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 876285819; Wed, 03 Nov 2021 16:05:02 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 3 Nov 2021 16:05:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 3 Nov 2021 16:05:01 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <hverkuil@xs4all.nl>
CC:     <lecopzer.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <mchehab@kernel.org>,
        <yj.chiang@mediatek.com>
Subject: Re: [PATCH] media: Kconfig: Make DVB_CORE=m possible when MEDIA_SUPPORT=y
Date:   Wed, 3 Nov 2021 16:05:01 +0800
Message-ID: <20211103080501.9968-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <5086eb11-621f-29ed-e2dd-2a262857b78c@xs4all.nl>
References: <5086eb11-621f-29ed-e2dd-2a262857b78c@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> On 05/10/2021 12:51, Lecopzer Chen wrote:
> > A case that we need VIDEO_DEV=y but DVB_CORE=m, and this doesn't
> > work since DVB_CORE is default MEDIA_DIGITAL_TV_SUPPORT and then
> > follows MEDIA_SUPPORT.
> > 
> > Change to tristate to make DVB_CORE=m possible when MEDIA_SUPPORT=y
> > 
> > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > ---
> >  drivers/media/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> > index b07812657cee..c3baf92b4d02 100644
> > --- a/drivers/media/Kconfig
> > +++ b/drivers/media/Kconfig
> > @@ -88,7 +88,7 @@ config MEDIA_ANALOG_TV_SUPPORT
> >  		will disable support for them.
> >  
> >  config MEDIA_DIGITAL_TV_SUPPORT
> > -	bool
> > +	tristate
> >  	prompt "Digital TV" if MEDIA_SUPPORT_FILTER
> >  	default y if !MEDIA_SUPPORT_FILTER
> >  	help
> > 
> 
> I don't think this is the right approach.
> 
> I think the following patch would fix the issue, and it is also in line
> with what config VIDEO_DEV does.
> 
> What do you think, Mauro?
> 
> Regards,
> 
> 	Hans
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> index c3baf92b4d02..46f7b1f75630 100644
> --- a/drivers/media/Kconfig
> +++ b/drivers/media/Kconfig
> @@ -179,8 +179,7 @@ config MEDIA_CONTROLLER
>  #
> 
>  config DVB_CORE
> -	tristate
> -	depends on MEDIA_DIGITAL_TV_SUPPORT
> +	tristate "DVB core"
>  	depends on (I2C || I2C=n)
>  	default MEDIA_DIGITAL_TV_SUPPORT
>  	select CRC32

Hi Hans

Thanks for the patch, both patches work in my test.
But I think your is more intuitive, I've pushed v2 with this patch
with your sign-off-by for the further discussion and reviewing.

Thanks
Lecopzer


