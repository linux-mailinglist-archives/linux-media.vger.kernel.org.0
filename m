Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED2A62284D
	for <lists+linux-media@lfdr.de>; Wed,  9 Nov 2022 11:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbiKIKXS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Nov 2022 05:23:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbiKIKXP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Nov 2022 05:23:15 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC85222A8;
        Wed,  9 Nov 2022 02:23:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7DDC461993;
        Wed,  9 Nov 2022 10:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61638C433D6;
        Wed,  9 Nov 2022 10:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1667989392;
        bh=Pns9i/ep2dezk1wFdEIPvvwLB0N6Lfaxl2Oq/RWdfpk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K/M3JkzsBZ4l5Dd5km1qGHtnXiMi+4A/vJIqoPfwdJuSvwXON6nvTmFGf8EpUSwu0
         uUb0D+1qdn2hC3UDTWTA4OnzoFY8H4vVdTHuzR3QGKmFlTaJD0B9y5FS3Tn7oGjPA1
         uSfPv93NP8JEVOutOpUZPer/24lyid7CW0Ue9VaM=
Date:   Wed, 9 Nov 2022 11:23:10 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH v5] usb: gadget: uvc: add validate and fix function for
 uvc response
Message-ID: <Y2t/jskm7y1lDyBn@kroah.com>
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

What commit id does this fix?  Validating userspace data is a good
thing, so shouldn't this also go to stable kernels?

thanks,

greg k-h
