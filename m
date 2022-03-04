Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4FB94CD214
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 11:10:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239509AbiCDKLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 05:11:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbiCDKL0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 05:11:26 -0500
X-Greylist: delayed 333 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 04 Mar 2022 02:10:38 PST
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51BF31A906C
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 02:10:38 -0800 (PST)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id AD38F9BF; Fri,  4 Mar 2022 11:05:02 +0100 (CET)
Date:   Fri, 4 Mar 2022 11:05:01 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     iommu@lists.linux-foundation.org, Yong Wu <yong.wu@mediatek.com>,
        Will Deacon <will@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:MEDIATEK IOMMU DRIVER" 
        <linux-mediatek@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>, kernel@collabora.com,
        linux-media@vger.kernel.org, sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 0/5] iommu/mediatek: Fix tlb flush logic
Message-ID: <YiHkTU2AhHIbkDbb@8bytes.org>
References: <20211208120744.2415-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208120744.2415-1-dafna.hirschfeld@collabora.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 08, 2021 at 02:07:39PM +0200, Dafna Hirschfeld wrote:
> Sebastian Reichel (1):
>   iommu/mediatek: Always check runtime PM status in tlb flush range
>     callback
> 
> Yong Wu (4):
>   iommu/mediatek: Remove for_each_m4u in tlb_sync_all
>   iommu/mediatek: Remove the power status checking in tlb flush all
>   iommu/mediatek: Add tlb_lock in tlb_flush_all
>   iommu/mediatek: Always tlb_flush_all when each PM resume
> 
>  drivers/iommu/mtk_iommu.c | 42 ++++++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 20 deletions(-)

Applied, thanks.
