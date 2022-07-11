Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39C7C57088D
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 18:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbiGKQvJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 12:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbiGKQvI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 12:51:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1F432B96
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 09:51:07 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05D23326;
        Mon, 11 Jul 2022 18:51:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657558266;
        bh=KOgT+6L+h1zlwGrFOLmavt4b32iztY2zE9g1TXtIcnQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RNDDKIDbH0TvJbQ6BhEdvEF65PSJlsrgLJGkRzxJ5plhNm5d1zsgShLBeZ2uYP0W+
         Q6BpC9vJz8Oc+vPTPePNsTX7MnW7QGtQGUDrpovdlJoFCRfjRqv+DRxKd9+GhqfDN/
         jakKOmjQdMM5ZSm665Kmcu8jyfNdbqzi0nM5+xp4=
Date:   Mon, 11 Jul 2022 19:50:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Riesch <michael.riesch@wolfvision.net>
Cc:     "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Helen Koike <helen.koike@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org
Subject: Re: [PATCH v3 44/46] media: rkisp1: Add infrastructure to support
 ISP features
Message-ID: <YsxU32X+C6nV1YPU@pendragon.ideasonboard.com>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
 <20220711124248.2683-45-laurent.pinchart@ideasonboard.com>
 <7f32db4b-7355-ec48-2e9f-b1db6c24a560@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7f32db4b-7355-ec48-2e9f-b1db6c24a560@wolfvision.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On Mon, Jul 11, 2022 at 06:37:51PM +0200, Michael Riesch wrote:
> On 7/11/22 14:42, Laurent Pinchart wrote:
> > [...]
> >  /*
> >   * struct rkisp1_info - Model-specific ISP Information
> >   *
> > @@ -106,6 +119,7 @@ enum rkisp1_isp_pad {
> >   * @isrs: array of ISP interrupt descriptors
> >   * @isr_size: number of entries in the @isrs array
> >   * @isp_ver: ISP version
> > + * @features: bitmatk of rkisp1_feature features implemented by the ISP
> 
> s/bitmatk/bitmask ?

Thanks for spotting this. I've fixed the typo locally, I don't plan to
post a v4 just for that.

> > [...]

-- 
Regards,

Laurent Pinchart
