Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC08662289D
	for <lists+linux-media@lfdr.de>; Wed,  9 Nov 2022 11:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbiKIKi3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Nov 2022 05:38:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiKIKi2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Nov 2022 05:38:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68470DFE3;
        Wed,  9 Nov 2022 02:38:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0551061957;
        Wed,  9 Nov 2022 10:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8830FC433D6;
        Wed,  9 Nov 2022 10:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1667990306;
        bh=IoxvYqcSGTU/s4p3AVSTXs6CM7o5robjlg0j9/7p+wc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xzo+YWfYhXNmgVQB/Slffp08KhRIqe4fe4KLwWqqjnDuv16NY6awfU3UGCLeyyItm
         9+PG7MXF/+0Y1OHcYBXzi9hUUR8W96UX9DGICJNVLv0SIJgxS7hAVahh/QgNqkSbge
         x+W5BWDUjJN2HFjL5k584W+Ur30dIUMfSUPXWYQc=
Date:   Wed, 9 Nov 2022 11:38:22 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: gadget: uvc: also use try_format in set_format
Message-ID: <Y2uDHpftYLHs1amf@kroah.com>
References: <20221026182240.363055-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026182240.363055-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 26, 2022 at 08:22:40PM +0200, Michael Grzeschik wrote:
> Since e219a712bc06 (usb: gadget: uvc: add v4l2 try_format api call) the
> try_format function is available. With this function includes checks for
> valid configurations programmed in the configfs. We use this function to
> ensure to return valid values on the set_format callback.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 
> ---
>  drivers/usb/gadget/function/uvc_v4l2.c | 72 ++++++++------------------
>  1 file changed, 21 insertions(+), 51 deletions(-)

Again, is this a fix?  And should it go to stable kernels?

thanks,

greg k-h
