Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF017CDD17
	for <lists+linux-media@lfdr.de>; Wed, 18 Oct 2023 15:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbjJRNW0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Oct 2023 09:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbjJRNWZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Oct 2023 09:22:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58A8E95
        for <linux-media@vger.kernel.org>; Wed, 18 Oct 2023 06:22:23 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61BEBC433C8;
        Wed, 18 Oct 2023 13:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1697635342;
        bh=8+Um29cxdKQH99k0YCMYU1lmGY+TvNwv0ssEVKJ1ujQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P++VYR7rtIcMPQDptRNHO/xcDdDJAAqe9fNh9/3YUa3XS1cOFIkiYMREZ+KQSwTsy
         YZzEW3UAUmfiohQGH7U3R8vyRYCHoKhih46E2htgtnoaVuCHoZT8LuVPOjklOHnzsB
         VwoVeBN9581zsUuL6fwRSHYUy5yfKqzCEKPKZiTk=
Date:   Wed, 18 Oct 2023 15:22:18 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Umang Jain <umang.jain@ideasonboard.com>,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 1/3] staging: vc04_services: Support module
 autoloading using MODULE_DEVICE_TABLE
Message-ID: <2023101803-blank-relative-aa47@gregkh>
References: <20231018054214.824296-1-umang.jain@ideasonboard.com>
 <20231018054214.824296-2-umang.jain@ideasonboard.com>
 <20231018123856.GG11118@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018123856.GG11118@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Oct 18, 2023 at 03:38:56PM +0300, Laurent Pinchart wrote:
> On Wed, Oct 18, 2023 at 11:12:12AM +0530, Umang Jain wrote:
> > VC04 has now a independent bus vchiq_bus to register its devices.
> > However, the module auto-loading for bcm2835-audio and bcm2835-camera
> > currently happens through MODULE_ALIAS() macro specified explicitly.
> > 
> > The correct way to auto-load a module, is when the alias is picked
> > out from MODULE_DEVICE_TABLE(). In order to get there, we need to
> > introduce  vchiq_device_id and add relevant entries in file2alias.c
> > infrastructure so that aliases can be generated. This patch targets
> > adding vchiq_bus_device_id and do_vchiq_bus_entry, in order to
> > generate those alias using the /script/mod/file2alias.c.
> > 
> > Going forward the MODULE_ALIAS() from bcm2835-camera and bcm2835-audio
> > will be dropped, in favour of MODULE_DEVICE_TABLE being used there.
> > 
> > The alias format for vchiq_bus devices will be "vchiq_bus:<dev_name>".
> > Adjust the vchiq_bus_uevent() to reflect that.
> 
> None of the other buses have a "_bus" suffix in the alias or in the
> *_device_id structure name. Is there a reason to make an exception here?

No, it should be dropped, good catch.

thanks,

greg k-h
