Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 281115A9B48
	for <lists+linux-media@lfdr.de>; Thu,  1 Sep 2022 17:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234069AbiIAPJA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Sep 2022 11:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233923AbiIAPI4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Sep 2022 11:08:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5683884ED8
        for <linux-media@vger.kernel.org>; Thu,  1 Sep 2022 08:08:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DBEEFB82793
        for <linux-media@vger.kernel.org>; Thu,  1 Sep 2022 15:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43171C433D6;
        Thu,  1 Sep 2022 15:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662044931;
        bh=TWmyedFoOiNPeCFn4RiR91e2o+XyPv30sdPDdn7MWFE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NOYiGJ55NQJ+8cvqR93q5Mo6Wly8uvtGl+7GQQBjqWDHj1E24AsvoK7PlLZyJkwJ9
         1Sgbq8jk4rN92Kh//E2GW+TUZP86L9m+Cnb3SdHs0NGypGCRMG8t4bFqTqvSjnZl1X
         Kc78LRxEdsX8MLgBS9oa1MShNUDF46X0F7DTtdXz5kOmQ+K4vfv1HX4B4LJ7S5sMX/
         VZZSbUX3CThHdFawqvYVlpftfZjmJU5HXLANOhfUcw7u2hYCf3XUfIqOZYMJSsX+Sz
         I7vIpklK8gHRqIfvvkMNVD4m+b++2RI9t4p9rbG9OwHXgFDwuTLqFoVZE2hEDdUKRe
         lUfafOtzWfcEA==
Date:   Thu, 1 Sep 2022 17:08:46 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/14] media: atomisp: More cleanups / code removal
Message-ID: <20220901170846.0fe20bf4@coco.lan>
In-Reply-To: <20220901094626.11513-1-hdegoede@redhat.com>
References: <20220901094626.11513-1-hdegoede@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu,  1 Sep 2022 11:46:12 +0200
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi Mauro,
> 
> Here is a second set of atomisp cleanups / code removal.
> This applies on top of my previous v2 series from here:
> https://lore.kernel.org/linux-media/20220822150610.45186-1-hdegoede@redhat.com/
> 
> I plan to do more atomisp work the coming few weeks. So I'm thinking
> it might be better / easier for you if I just send you a pull-req based
> on 6.0-rc1 with all atomisp patches bundled around rc5/rc6 time.
> 
> Would that work for you ?

Yes, that works for me. I'm actually proritizing PRs over normal patches
from media maintainers. As you're doing most of work on it, I can
start picking PRs from you related to atomisp.

This will help to speedup merging atomisp patches, as I usually pick
PRs once per week.

> 
> I do plan to keep sending out (incremental) patch-sets with my work
> (like this one) for review / comments.

Perfect.
> 
> Regards,
> 
> Hans
> 
> 
> Dan Carpenter (1):
>   media: atomisp: prevent integer overflow in sh_css_set_black_frame()
> 
> Hans de Goede (13):
>   media: atomisp: Fix device_caps reporting of the registered video-devs
>   media: atomisp: Remove file-injection support
>   media: atomisp: Remove atomisp_file_fops and atomisp_file_ioctl_ops
>   media: atomisp: Remove the outq videobuf queue
>   media: atomisp: Remove never set file_input flag
>   media: atomisp: Remove the ACC device node
>   media: atomisp: Remove some further ATOMISP_ACC_* related dead code
>   media: atomisp: Remove empty atomisp_css_set_cont_prev_start_time()
>     function
>   media: atomisp: Split subdev and video-node registration into 2 steps
>   media: atomisp: Register /dev/* nodes at the end of
>     atomisp_pci_probe()
>   media: atomisp: Remove loading mutex
>   media: atomisp: Fix v4l2_fh resource leak on open errors
>   media: atomisp: Simplify v4l2_fh_open() error handling
> 
>  drivers/staging/media/atomisp/Makefile        |   1 -
>  .../media/atomisp/include/linux/atomisp.h     |  14 --
>  .../staging/media/atomisp/pci/atomisp_cmd.c   | 134 +---------
>  .../staging/media/atomisp/pci/atomisp_cmd.h   |   2 -
>  .../media/atomisp/pci/atomisp_compat.h        |   6 -
>  .../media/atomisp/pci/atomisp_compat_css20.c  |  26 --
>  .../staging/media/atomisp/pci/atomisp_file.c  | 229 ------------------
>  .../staging/media/atomisp/pci/atomisp_file.h  |  44 ----
>  .../staging/media/atomisp/pci/atomisp_fops.c  | 187 ++------------
>  .../media/atomisp/pci/atomisp_internal.h      |  16 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.c | 192 ++-------------
>  .../staging/media/atomisp/pci/atomisp_ioctl.h |   4 -
>  .../media/atomisp/pci/atomisp_subdev.c        |  95 ++------
>  .../media/atomisp/pci/atomisp_subdev.h        |  47 +---
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |  99 +++-----
>  .../staging/media/atomisp/pci/atomisp_v4l2.h  |   3 -
>  .../staging/media/atomisp/pci/sh_css_params.c |   4 +-
>  17 files changed, 104 insertions(+), 999 deletions(-)
>  delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_file.c
>  delete mode 100644 drivers/staging/media/atomisp/pci/atomisp_file.h
> 



Thanks,
Mauro
