Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF13D6A0491
	for <lists+linux-media@lfdr.de>; Thu, 23 Feb 2023 10:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233589AbjBWJRp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Feb 2023 04:17:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjBWJRo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Feb 2023 04:17:44 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 836E64FC8E
        for <linux-media@vger.kernel.org>; Thu, 23 Feb 2023 01:17:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id C1163CE1F82
        for <linux-media@vger.kernel.org>; Thu, 23 Feb 2023 09:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2497C4339C;
        Thu, 23 Feb 2023 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677143860;
        bh=TziV0sGtNmJ5jLkrWB9nNF+F5MXF6aRvlpXLf0vu188=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Y2nyhw0qIicf3OBxOofy3cETsZI9eRxq0T1qimLreGQbHYTXNQ7+a0xwVR2PZJesh
         W1dAUl0puE/mkVGhQ8KhRKezlz+ElZiFiehyA8dKEQeaYrdL0bnbonIcTqsBcU1Oto
         wtM009rng6CnURwYCcA7z6xZR8GKDoE1CeWHlgg7dS1FYISmtMelrTMCr0DvueNlFx
         tLbASO5UDdrW0xxUUiykrA46zpea042r5MgHuXv6cHt75bw1fQD13ZUQvM41YEpHIv
         zSMwSZs3Hfi7ciCA4Y/1x8Ow2ZFQP9yomVZzSJziIB9LC909ytlNDA4ALf944WPsFM
         1eNBPYRZF2CBw==
Date:   Thu, 23 Feb 2023 10:17:34 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/10] media: atomisp: Remove depth-mode and continuous
 mode support
Message-ID: <20230223101734.5f3bb8e3@coco.lan>
In-Reply-To: <20230221145906.8113-1-hdegoede@redhat.com>
References: <20230221145906.8113-1-hdegoede@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 21 Feb 2023 15:58:56 +0100
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi All,
> 
> This is the first step of the removal of special/obscure features
> discussed here:
> 
> https://lore.kernel.org/linux-media/ea81b17b-7d1f-a5e1-11dd-04db310e1e50@redhat.com/
> 
> Plus some follow-up patches removing some dead code (some new dead
> code as well as some pre-existing dead code).

Nice cleanup. Yeah, I was considering doing this for some time,
as those "extra" modes are meant to be used only on Android.

Regards,
Mauro

> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (10):
>   media: atomisp: Remove depth-mode support
>   media: atomisp: Remove continuous mode support
>   media: atomisp: Remove delayed_init related code
>   media: atomisp: Remove crop_needs_override from atomisp_set_fmt()
>   media: atomisp: Remove atomisp_css_enable_raw_binning()
>   media: atomisp: Remove atomisp_get_metadata_type()
>   media: atomisp: Remove unused SOC_CAMERA, XENON_FLASH and FILE_INPUT
>     subdev types
>   media: atomisp: Remove ATOMISP_USE_YUVPP()
>   media: atomisp: Remove yuvpp_mode
>   media: atomisp: Remove online_process setting
> 
>  .../media/atomisp/include/linux/atomisp.h     |  26 -
>  .../atomisp/include/linux/atomisp_platform.h  |   9 +-
>  .../staging/media/atomisp/pci/atomisp_cmd.c   | 744 ++----------------
>  .../staging/media/atomisp/pci/atomisp_cmd.h   |   9 -
>  .../media/atomisp/pci/atomisp_compat.h        |   7 -
>  .../media/atomisp/pci/atomisp_compat_css20.c  | 321 +-------
>  .../staging/media/atomisp/pci/atomisp_fops.c  | 110 +--
>  .../media/atomisp/pci/atomisp_internal.h      |  21 -
>  .../staging/media/atomisp/pci/atomisp_ioctl.c | 162 +---
>  .../staging/media/atomisp/pci/atomisp_ioctl.h |   3 -
>  .../media/atomisp/pci/atomisp_subdev.c        |  78 +-
>  .../media/atomisp/pci/atomisp_subdev.h        |  16 -
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  |  35 +-
>  13 files changed, 129 insertions(+), 1412 deletions(-)
> 



Thanks,
Mauro
