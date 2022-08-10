Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 406A358E899
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 10:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231641AbiHJIT1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 04:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbiHJITC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 04:19:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 607BB84EE1
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 01:18:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 14B8860918
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 08:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30188C433D6
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 08:18:58 +0000 (UTC)
Message-ID: <a071cf35-3ed6-3c1b-4546-d4536f1fb6f3@xs4all.nl>
Date:   Wed, 10 Aug 2022 10:18:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Proposal: removal of old vb1 or custom streaming I/O drivers
Content-Language: en-US
To:     linux-media@vger.kernel.org
References: <1ca14c26-2e47-b144-1f5a-02824e81269a@xs4all.nl>
 <ab206a11-0f96-2d97-c17f-1455527ece2a@xs4all.nl>
 <YvJa5znh+5Rj5xTt@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <YvJa5znh+5Rj5xTt@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We have the following drivers still using vb1:

PCI: saa7146, bt8xx, cx18
USB: zr364xx, tm6000
platform: ti/davinci/vpfe_capture, nxp/fsl-viu
staging: atomisp

And these drivers rolls their own streaming I/O implementation:

pci: meye
usb: cpia2
staging: stkwebcam (deprecated, to be removed by the end of the year)

I think we should bite the bullet and move all of these drivers to staging,
mark them deprecated and delete them some time next year if nobody will
convert them to vb2.

That includes atomisp: is that going anywhere? Unless someone does the
hard work of converting it to vb2 I think it should be removed as well.

The two drivers most likely to still be in use somewhere are bt8xx and
cx18. If it turns out that we can't remove them (yet), then I can probably
justify the time to convert cx18 to vb2 myself.

And for bt8xx I would probably be willing to convert it to vb2 as well,
provided we can strip the overlay support from the driver (since, if memory
serves, vb2 doesn't support that) and convert it to vb2. It's a big job, though.

One other thing we can do is to deprecate/remove video capture overlay support
(in the sense of video capture hardware writing directly to a framebuffer).

It's supported by saa7146, bttv, saa7134 and fsl-viu. If we remove vb1
drivers, then that would leave only saa7134 that still supports it.

Removing the API will simplify things.

Regards,

	Hans
