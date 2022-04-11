Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19A724FBBBA
	for <lists+linux-media@lfdr.de>; Mon, 11 Apr 2022 14:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244337AbiDKMKC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Apr 2022 08:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238123AbiDKMKC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Apr 2022 08:10:02 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B8F3E5E2
        for <linux-media@vger.kernel.org>; Mon, 11 Apr 2022 05:07:47 -0700 (PDT)
X-UUID: 408acc89c24e4c0b93259427a3335b59-20220411
X-UUID: 408acc89c24e4c0b93259427a3335b59-20220411
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2066179283; Mon, 11 Apr 2022 20:07:42 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 11 Apr 2022 20:07:40 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Apr 2022 20:07:40 +0800
Message-ID: <2d6b3e21c473a17fa7c81162dd0c8337bfefe3ad.camel@mediatek.com>
Subject: Re: pull request: linux-firmware: Create Mediatek MT8192 SCP
 firmware
From:   "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To:     Josh Boyer <jwboyer@kernel.org>
CC:     Linux Firmware <linux-firmware@kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        <tinghan.shen@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
        <srv_heupstream@mediatek.com>
Date:   Mon, 11 Apr 2022 20:07:40 +0800
In-Reply-To: <CA+5PVA5h0NsA5P+AUWrOOQ4gqu6oMqtDUf2HO=rV30iCyiiHTw@mail.gmail.com>
References: <20220408062722.26813-1-yunfei.dong@mediatek.com>
         <CA+5PVA5h0NsA5P+AUWrOOQ4gqu6oMqtDUf2HO=rV30iCyiiHTw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Josh,

Thanks for your remind.
On Mon, 2022-04-11 at 07:17 -0400, Josh Boyer wrote:
> On Fri, Apr 8, 2022 at 2:27 AM Yunfei Dong <yunfei.dong@mediatek.com>
> wrote:
> > 
> > The following changes since commit
> > 681281e49fb6778831370e5d94e6e1d97f0752d6:
> > 
> >   amdgpu: update PSP 13.0.8 firmware (2022-03-18 07:35:54 -0400)
> > 
> > are available in the Git repository at:
> > 
> >   https://github.com/yunfeidongmediatek/linux_fw_scp_8192 v1
> > 
> > for you to fetch changes up to
> > 3ac2fc85bc7dfcebdb92b5b5808b0268cdfb772d:
> > 
> >   mediatek: Add mt8192 SCP firmware (2022-04-08 10:59:44 +0800)
> > 
> > ----------------------------------------------------------------
> > Yunfei Dong (1):
> >       mediatek: Add mt8192 SCP firmware
> > 
> >  mediatek/mt8192/scp.img | Bin 0 -> 309436 bytes
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  create mode 100644 mediatek/mt8192/scp.img
> 
> This needs an entry added to the WHENCE file
> 
> [jwboyer@vader linux-firmware]$ ./check_whence.py
> E: mediatek/mt8192/scp.img not listed in WHENCE
> 
> Can you fix this and let me know when it's ready to pull?
> 
> josh
Fix it in the latest v1 branch.

Best Regards,
Yunfei Dong


