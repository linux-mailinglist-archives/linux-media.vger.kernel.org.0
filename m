Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB14634090
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 16:51:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233553AbiKVPvY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 10:51:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiKVPvX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 10:51:23 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD24716C2;
        Tue, 22 Nov 2022 07:51:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 0580ECE1D9F;
        Tue, 22 Nov 2022 15:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D907C433D6;
        Tue, 22 Nov 2022 15:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1669132279;
        bh=lWd5x0V3lXHg5SggtZkzO0kT0BBqPdsaqNDQOKegjGg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PNAuVEXm1ndFeWsqWs5CO3sC/mXj1G5ZtFaF58i9NckRgPGHVTNZgnQvRq5QVDWnv
         u3yj1jk6BQu+q4rIrVjEvAZkYycucnqpLVgDSU49u16i3kCRZ/WayB6yBS8NImB1F9
         i2xcXA53WCnhseUgKQClB8dWQWgA2zaSbs/pnPDo=
Date:   Tue, 22 Nov 2022 16:51:15 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH v5] usb: gadget: uvc: add validate and fix function for
 uvc response
Message-ID: <Y3zv8+Tqa6v1q8Jz@kroah.com>
References: <20221025222657.1883922-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025222657.1883922-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 26, 2022 at 12:26:57AM +0200, Michael Grzeschik wrote:
> When the userspace gets the setup requests for UVC_GET_CUR UVC_GET_MIN,
> UVC_GET_MAX, UVC_GET_DEF it will fill out the ctrl response. This data
> needs to be validated. Since the kernel also knows the limits for valid
> cases, it can fixup the values in case the userspace is setting invalid
> data.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 
> ---
> v1: -> v4:
> - new patch
> v4: -> v5:
> - changed uvcg_info to uvcg_dbg for fixups, updated info strings
> 
>  drivers/usb/gadget/function/f_uvc.c    |  4 +-

Does not apply to 6.1-rc6 :(

Please rebase and resubmit.

thanks,

greg k-h
