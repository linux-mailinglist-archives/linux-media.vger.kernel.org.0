Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC4E58EA6C
	for <lists+linux-media@lfdr.de>; Wed, 10 Aug 2022 12:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbiHJKYr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Aug 2022 06:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiHJKYW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Aug 2022 06:24:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52200753B9
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 03:24:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E2BA2611E1
        for <linux-media@vger.kernel.org>; Wed, 10 Aug 2022 10:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604DBC433C1;
        Wed, 10 Aug 2022 10:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660127060;
        bh=A9n0ekddhE/ILKgpE9xuXhXw57UgdQthPZuHvrqKmh8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Q/0xI5G4LGfgFEHEGJOu66beOYwB8VMzmPlaEsKeL68vXsFQ8lNWuhemRYG62CSLi
         IC4vwAA+TqMlLxuY0k/U9gil//92ctShWaAWZxY/xZfp6KKVW3Z6gTiUzXPQH2ZYPs
         1JqtHW8kGB/DIdSqPieckBAHtXYEnS1dP94g5E5LH7xkM6tvVyt/yFv5d4/bAMNsj9
         OOBTVbRRaCtD/H+xKntap7UXVxisVUAwAgL+MJe+Vqr8bEinHvCop7IMHtkuGMKshl
         HM+litTl5S5MFGr6tBjUysqknF3yn8SFz66L0yqNpf4eLthtmTVLsJpyIOs5hXOF/7
         WgUqVkpbvJ+dQ==
Date:   Wed, 10 Aug 2022 12:24:16 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: Proposal: removal of old vb1 or custom streaming I/O drivers
Message-ID: <20220810122409.5303e8f9@coco.lan>
In-Reply-To: <a071cf35-3ed6-3c1b-4546-d4536f1fb6f3@xs4all.nl>
References: <1ca14c26-2e47-b144-1f5a-02824e81269a@xs4all.nl>
        <ab206a11-0f96-2d97-c17f-1455527ece2a@xs4all.nl>
        <YvJa5znh+5Rj5xTt@pendragon.ideasonboard.com>
        <a071cf35-3ed6-3c1b-4546-d4536f1fb6f3@xs4all.nl>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 10 Aug 2022 10:18:56 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> We have the following drivers still using vb1:
> 
> PCI: saa7146, bt8xx, cx18
> USB: zr364xx, tm6000
> platform: ti/davinci/vpfe_capture, nxp/fsl-viu
> staging: atomisp
> 
> And these drivers rolls their own streaming I/O implementation:
> 
> pci: meye
> usb: cpia2
> staging: stkwebcam (deprecated, to be removed by the end of the year)
> 
> I think we should bite the bullet and move all of these drivers to staging,
> mark them deprecated and delete them some time next year if nobody will
> convert them to vb2.
> 
> That includes atomisp: is that going anywhere? Unless someone does the
> hard work of converting it to vb2 I think it should be removed as well.

There have been improvements at atomisp driver. Hans de Goede has been
doing some work. As far as I understand, he's planning to get VB2 and
libcamera support for it. I'm also working on it when I have some spare
time available.

> The two drivers most likely to still be in use somewhere are bt8xx and
> cx18. If it turns out that we can't remove them (yet), then I can probably
> justify the time to convert cx18 to vb2 myself.

Yeah, bt8xx is probably still widely used, specially on analog camera
multi-port capture scenarios. Not sure about cx18 usage those days.

IMO, once we get bt8xx, atomisp (and maybe cx18) converted to VB2, it
should be OK to remove the other drivers. 

For now, we can move them to staging, adding a TODO explaining that they
should be ported to VB2 or they'll be removed.

Scheduling removal to the end of the year is probably not doable, as
the patch moving them to staging would be merged only around Oct.
We should grant at least two Kernel cycles for people to convert the
drivers - assuming that someone would do that for some driver(s).

> And for bt8xx I would probably be willing to convert it to vb2 as well,
> provided we can strip the overlay support from the driver (since, if memory
> serves, vb2 doesn't support that) and convert it to vb2. It's a big job, though.

It sounds OK on my eyes to remove overlay support from bt8xx during VB2
conversion. We should probably add a warning about such removal before
that (see below).

> One other thing we can do is to deprecate/remove video capture overlay support
> (in the sense of video capture hardware writing directly to a framebuffer).
> 
> It's supported by saa7146, bttv, saa7134 and fsl-viu. If we remove vb1
> drivers, then that would leave only saa7134 that still supports it.
> 
> Removing the API will simplify things.

It probably makes sense to add an error-level printks, printed only once,
when someone uses VIDIOC_OVERLAY ioctl, warning that this is a deprecated
feature that will be removed soon, for the drivers that still supports it.

For sure once we get rid of the VB1 drivers that use overlay, it makes
sense to also remove its support for saa7134. Maybe even before ;-)

Thanks,
Mauro
