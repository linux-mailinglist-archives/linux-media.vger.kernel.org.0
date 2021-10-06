Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07B6B423649
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 05:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237204AbhJFD2b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 23:28:31 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:34962 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230317AbhJFD2b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 23:28:31 -0400
X-UUID: 9906b7e1572a4a99a00507de66084554-20211006
X-UUID: 9906b7e1572a4a99a00507de66084554-20211006
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 548676801; Wed, 06 Oct 2021 11:26:36 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Oct 2021 11:26:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Oct 2021 11:26:35 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <mchehab@kernel.org>
CC:     <lecopzer.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] media: Kconfig: Make DVB_CORE=m possible when MEDIA_SUPPORT=y
Date:   Wed, 6 Oct 2021 11:26:35 +0800
Message-ID: <20211006032635.20694-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211005183125.30f7df0a@coco.lan>
References: <20211005183125.30f7df0a@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
> 
> While this change looks simple enough, not sure if this would work
> for all possibilities. If I'm not mistaken, someone proposed
> something similar to it, but it caused troubles with different
> configurations. I don't recall any patch addressing it, but I
> may be wrong.
> 
> Tf I remember correctly, the problem rises when either V4L or DVB
> core is compiled as module and the other one is compiled builtin.
> On such scenario, all drivers that depend on both should be
> compiled as a module, or the build will fail.

I've had a quick test:

CONFIG_MEDIA_SUPPORT=y
CONFIG_MEDIA_SUPPORT_FILTER=y
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=m
CONFIG_DVB_CORE=m
In this set, all the module depends on DVB_CORE
will be =m even if I manually change .config.

I'm not sure which config or module would build failed if DVB is module,
but IMO, any module has explicitly depends on DVB_CORE would follow the
configuation of DVB_CORE, and
the only possible case which build failed should be those
modules need to depend on DVB_CORE but didn't explicitly write
in Kconfig.
Also, I have no idea why someone needs DVB_CORE=m but other modules
depend on it need =y.

If anything I can test please tell me, thanks.


Thanks,
Lecopzer


