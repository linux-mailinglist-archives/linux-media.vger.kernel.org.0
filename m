Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 830D4608CDD
	for <lists+linux-media@lfdr.de>; Sat, 22 Oct 2022 13:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbiJVLlq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Oct 2022 07:41:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiJVLl2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Oct 2022 07:41:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA28A422FE;
        Sat, 22 Oct 2022 04:35:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 812F260CA4;
        Sat, 22 Oct 2022 11:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85932C433C1;
        Sat, 22 Oct 2022 11:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666438535;
        bh=rZIS1WXNn6fGyy4EmBbs2zFeA0sX8jgjAy1ILi/xLCM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jfhxCrZioxvzUn2/pPh+3W+rfhWizOf6k7rwGMbioZ7tKqsV83F/DDpcXHBWkL6ZT
         VBJ+ZbqxeoovZi/OtmWpxYhM0SqlnWGEq/SoVA832FTooSqw8Zj3sKp+7VyKAH+bmo
         umkcHfUlOrhEQJTW9WDfGvCwv0UsZd3nA73tKtps=
Date:   Sat, 22 Oct 2022 13:35:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: gadget: uvc: limit isoc_sg to super speed gadgets
Message-ID: <Y1PVhIGlh1uMR2i/@kroah.com>
References: <20221017221141.3134818-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221017221141.3134818-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 18, 2022 at 12:11:41AM +0200, Michael Grzeschik wrote:
> The overhead of preparing sg data is high for transfers with limited
> payload. When transferring isoc over high-speed usb the maximum payload
> is rather small which is a good argument no to use sg. This patch is
> changing the uvc_video_encode_isoc_sg encode function only to be used
> for super speed gadgets.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 
> ---
> v1 -> v2: - always setting mem and sg elements since now both is working in runtime

I'm guessing this is a "fix"?  If so, what commit id is this a fix for?

And any reason you aren't cc:ing me on these patches?

thanks,

greg k-h
