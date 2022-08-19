Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA9D5997B6
	for <lists+linux-media@lfdr.de>; Fri, 19 Aug 2022 10:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347690AbiHSIgm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Aug 2022 04:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346775AbiHSIgN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Aug 2022 04:36:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529CA48E9F;
        Fri, 19 Aug 2022 01:34:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B8E2CB82668;
        Fri, 19 Aug 2022 08:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF334C433D6;
        Fri, 19 Aug 2022 08:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1660898015;
        bh=+D2Wg1a/O5UimI6at2BG7aW7+TVM/Y73cSP/vFrgmB8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UwEeFS4IVGO+3rmmZa6OoUq+zejprZZz6X/CvooieDDbTnfDm64yw2V5QbgmC5XS1
         pO8319d3Ew0+1Xc0jECBaGQDRPs09bmpFoEFydNoAIj0CQr8ClLari7FAc+TwLuAW4
         LQXyxcD68bqDHHLpM17M7dLBmn+vNmeT24SmwMBU=
Date:   Fri, 19 Aug 2022 10:33:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        kieran.bingham@ideasonboard.com, nicolas@ndufresne.ca,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de
Subject: Re: [PATCH v3] usb: gadget: uvc: increase worker prio to WQ_HIGHPRI
Message-ID: <Yv9K3GPsyw6ZAEMm@kroah.com>
References: <20220720144641.3480432-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720144641.3480432-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 20, 2022 at 04:46:41PM +0200, Michael Grzeschik wrote:
> Likewise to the uvcvideo hostside driver, this patch is changing the

"Likewise" implies a previous patch being mentioned, which I do not see
here :(

> simple workqueue to an async_wq with higher priority. This ensures that
> the worker will not be scheduled away while the video stream is handled.

How will this ensure that?  What happens if yet-another higher priority
task comes in?  This feels like a race that will just never be won
without fixing this properly.

thanks,

greg k-h
