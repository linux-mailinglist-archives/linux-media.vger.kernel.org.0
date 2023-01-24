Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A63DA679D9C
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 16:35:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234647AbjAXPfb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 10:35:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234158AbjAXPfa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 10:35:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B45811E85
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 07:35:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DB009612AC
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 15:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5ADC433D2;
        Tue, 24 Jan 2023 15:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1674574529;
        bh=JuTJarKM0keJT9kOjgnkNTig8/hg3BaBY3T0ftkuWdM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0q6IdGxucGHQ8MF66qwpKClseD5z+B1obOmZKINn74W3YwEAyubE4WEodnu2jCKBv
         X18oWi0RoPy7Vrsew+3DG8SpQSRrxewJyYoezbEYFoT/p9mzs5XDm9VknTGuDrp16K
         S6zOM849smIxWIGky0vRFtT7UHc5X97vp2WZ1K/c=
Date:   Tue, 24 Jan 2023 16:35:24 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        marex@denx.de, kernel@pengutronix.de
Subject: Re: [GIT PULL FOR v6.3] uvcgadget changes
Message-ID: <Y8/6vHUoB4WjbLk2@kroah.com>
References: <20230124144929.GB19219@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230124144929.GB19219@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 24, 2023 at 03:49:29PM +0100, Michael Grzeschik wrote:
> The following changes since commit 82adfe34694c98f1115a7b75cff6af9c4a35dba9:
> 
>  Merge tag 'media-uvc-next-20230115' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux into media_stage (2023-01-22 08:43:14 +0100)
> 
> are available in the Git repository at:
> 
>  git://git.pengutronix.de/mgr/linux tags/uvc-gadget-next-20230124
> 
> for you to fetch changes up to e88f760d0f7054f49aa68b75bf0530840f031d34:
> 
>  usb: uvc: use v4l2_fill_fmtdesc instead of open coded format name (2023-01-24 15:26:07 +0100)
> 
> ----------------------------------------------------------------
> Marek Vasut (1):
>      media: uvcvideo: Add GUID for BGRA/X 8:8:8:8
> 
> Michael Grzeschik (4):
>      usb: uvc: move media/v4l2-uvc.h to usb/uvc.h
>      usb: uvc: move uvc_fmts and uvc_format_by_guid to own compile unit
>      usb: uvc: make uvc_format_desc table const
>      usb: uvc: use v4l2_fill_fmtdesc instead of open coded format name

Sorry, but I can't take patches like this as a pull request.  I want to
see the real patches and get people to review them properly that way.

thanks,

greg k-h
