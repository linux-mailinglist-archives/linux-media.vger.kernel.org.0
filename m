Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C11D9AA588
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 16:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730477AbfIEOOT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 10:14:19 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:31898 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726048AbfIEOOT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 10:14:19 -0400
X-UUID: 2f11ff7d98724b569e3e90e98073f37c-20190905
X-UUID: 2f11ff7d98724b569e3e90e98073f37c-20190905
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 742702825; Thu, 05 Sep 2019 22:14:14 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Sep 2019 22:14:10 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Sep 2019 22:14:10 +0800
Message-ID: <1567692852.22453.55.camel@mtksdccf07>
Subject: Re: [RFC PATCH V2 3/4] media: platform: Add Mediatek FD driver
 KConfig
From:   Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?= 
        <Sean.Cheng@mediatek.com>,
        "Sj Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?=" 
        <sj.huang@mediatek.com>,
        Christie Yu =?UTF-8?Q?=28=E6=B8=B8=E9=9B=85=E6=83=A0=29?= 
        <christie.yu@mediatek.com>,
        Frederic Chen =?UTF-8?Q?=28=E9=99=B3=E4=BF=8A=E5=85=83=29?= 
        <Frederic.Chen@mediatek.com>,
        Jungo Lin =?UTF-8?Q?=28=E6=9E=97=E6=98=8E=E4=BF=8A=29?= 
        <jungo.lin@mediatek.com>,
        Rynn Wu =?UTF-8?Q?=28=E5=90=B3=E8=82=B2=E6=81=A9=29?= 
        <Rynn.Wu@mediatek.com>,
        Po-Yang Huang =?UTF-8?Q?=28=E9=BB=83=E6=9F=8F=E9=99=BD=29?= 
        <po-yang.huang@mediatek.com>,
        "shik@chromium.org" <shik@chromium.org>,
        "suleiman@chromium.org" <suleiman@chromium.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Date:   Thu, 5 Sep 2019 22:14:12 +0800
In-Reply-To: <20190905123054.GL5035@pendragon.ideasonboard.com>
References: <1562661672-22439-1-git-send-email-Jerry-Ch.chen@mediatek.com>
         <1562661672-22439-4-git-send-email-Jerry-Ch.chen@mediatek.com>
         <20190905123054.GL5035@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, 2019-09-05 at 20:30 +0800, Laurent Pinchart wrote:
> Hi Jerry,
> 
> Thank you for the patch.
> 
> On Tue, Jul 09, 2019 at 04:41:11PM +0800, Jerry-ch Chen wrote:
> > From: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> > 
> > This patch adds KConfig for Mediatek Face Detection driver (FD).
> > FD is embedded in Mediatek SoCs. It can provide hardware
> > accelerated face detection function.
> > 
> > Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.com>
> 
> You can squash this patch with 4/4, there's no need to keep it separate.
> 

I appreciate your comments,

Ok, I will squash it.

> > ---
> >  drivers/media/platform/Kconfig            |  2 ++
> >  drivers/media/platform/mtk-isp/fd/Kconfig | 17 +++++++++++++++++
> >  2 files changed, 19 insertions(+)
> >  create mode 100644 drivers/media/platform/mtk-isp/fd/Kconfig
> > 
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > index a505e9f..ae99258e 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -32,6 +32,8 @@ source "drivers/media/platform/davinci/Kconfig"
> >  
> >  source "drivers/media/platform/omap/Kconfig"
> >  
> > +source "drivers/media/platform/mtk-isp/fd/Kconfig"
> > +
> >  config VIDEO_ASPEED
> >  	tristate "Aspeed AST2400 and AST2500 Video Engine driver"
> >  	depends on VIDEO_V4L2
> > diff --git a/drivers/media/platform/mtk-isp/fd/Kconfig b/drivers/media/platform/mtk-isp/fd/Kconfig
> > new file mode 100644
> > index 0000000..0c5eaf0
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-isp/fd/Kconfig
> > @@ -0,0 +1,17 @@
> > +config VIDEO_MEDIATEK_FD
> > +	bool "Mediatek face detection processing function"
> > +	select DMA_SHARED_BUFFER
> > +	select VIDEOBUF2_DMA_CONTIG
> > +	select VIDEOBUF2_CORE
> > +	select VIDEOBUF2_V4L2
> > +	select VIDEOBUF2_MEMOPS
> > +	select VIDEOBUF2_VMALLOC
> 
> Do you need both VIDEOBUF2_DMA_CONTIG and VIDEOBUF2_VMALLOC ? The driver
> doesn't seem to make use of VIDEOBUF2_VMALLOC.
> 

No, I should remove it. and also would like to update as following:

        depends on VIDEO_V4L2
        depends on ARCH_MEDIATEK || COMPILE_TEST
        select VIDEOBUF2_DMA_CONTIG
        select VIDEOBUF2_CORE
        select VIDEOBUF2_V4L2
        select VIDEOBUF2_MEMOPS
        select MEDIA_CONTROLLER
        select MTK_SCP

> > +	select MEDIA_CONTROLLER
> > +
> > +	default n
> > +	help
> > +		Support the Face Detectioin (FD) feature.
> 
> s/Detectioin/Detection/
> 
Typo fixed.

> Maybe "... feature found in the Mediatek <list of SoCs> SoCs." ?

I will refine as:
Support the Face Detection (FD) feature in the Mediatek mt8183 Soc.

Thanks and best regards,
Jerry
> 
> > +
> > +		FD driver is a V4L2 memory-to-memory device driver which
> > +		provides hardware accelerated face detection function,
> > +		it can detect different sizes of faces in a raw image.
> 


