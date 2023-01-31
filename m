Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 597BD68273F
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 09:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbjAaIqT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 03:46:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbjAaIp6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 03:45:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55FA64B490;
        Tue, 31 Jan 2023 00:41:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9D4356141C;
        Tue, 31 Jan 2023 08:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616E4C4339B;
        Tue, 31 Jan 2023 08:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1675154503;
        bh=QwRd5J0J2pAHdAMPDGMUjZPulioMdkGd7Df7LIuCqyE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TPdBjLEeU64K2SDfhIlNYjzYtBgHfRpQhAIv8sQPeB/iS0L8RWBHXVNikWW0mJql+
         hrJPX1tsNTLbEEE5z66EabO/aaBxqTErj8Ic1KeYkNzMF5vqMc0JQg5dlhb3qkuDW0
         3AmjTMQ0nmWnspuSFq9OaPiFyv4Uplhh8JzcomMM=
Date:   Tue, 31 Jan 2023 09:41:40 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v3 0/5] [PATCH v3] usb: uvc: improve header files and
 function use
Message-ID: <Y9jURBl93Xq1hzLj@kroah.com>
References: <20230126231456.3402323-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126231456.3402323-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 27, 2023 at 12:14:51AM +0100, Michael Grzeschik wrote:
> This series is improving the use of the uvc_format_desc
> in v4l2-uvc.h and also reuses the declarative strings from
> v4l_fill_fmtdesc.
> 
> This series applies on
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git media-uvc-next-20230115
> 
> which has been merged in the Linux media tree for v6.3 (as shown by
> https://git.linuxtv.org/media_stage.git/commit/?id=82adfe34694c98f1115a7b75cff6af9c4a35dba9).

I've merged that git tag into my usb-next branch and taken this series
as well.  Thanks for sticking with this, and sorry for the complexity in
getting it merged properly.


greg k-h
