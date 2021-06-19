Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62FE93AD869
	for <lists+linux-media@lfdr.de>; Sat, 19 Jun 2021 09:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233463AbhFSHbI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Jun 2021 03:31:08 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:56425 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232445AbhFSHbH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Jun 2021 03:31:07 -0400
X-UUID: 89e90070255a46ffbeaf675968f97a16-20210619
X-UUID: 89e90070255a46ffbeaf675968f97a16-20210619
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 472223609; Sat, 19 Jun 2021 15:28:55 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 19 Jun 2021 15:28:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 19 Jun 2021 15:28:53 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <sean@mess.org>
CC:     <lecopzer.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <mchehab@kernel.org>,
        <yj.chiang@mediatek.com>
Subject: Re: [PATCH] media: Kconfig: Fix DVB_CORE can't be selected as module
Date:   Sat, 19 Jun 2021 15:28:53 +0800
Message-ID: <20210619072853.25882-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210618162334.GA31513@gofer.mess.org>
References: <20210618162334.GA31513@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> On Tue, Jun 08, 2021 at 06:14:51PM +0800, Lecopzer Chen wrote:
> > The DVB_CORE now depends on MEDIA_DIGITAL_TV_SUPPORT and
> > default MEDIA_DIGITAL_TV_SUPPORT, and this makes it can never be =m
> > since the type of MEDIA_DIGITAL_TV_SUPPORT is bool.
> 
> First of all, the distributions carrry dvb_core as a module, so clearly
> it possible to set DVB_CORE=m.
> 
> As far as I can see, if MEDIA_SUPPORT=m, then DVB_CORE=m. 
> 
> So it is possible.

Thanks for review.

After checking, It does change DVB_CORE=m if MEDIA_SUPPORT=m.

We had MEDIA_SUPPORT=y, thus misunderstood by 'default MEDIA_DIGITAL_TV_SUPPORT'.

Thanks again for figuring out this.


-Lecopzer
