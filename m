Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C68B7D69B7
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 13:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234656AbjJYLDc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 07:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjJYLDb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 07:03:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9ADC1
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 04:03:29 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1E7C433C8;
        Wed, 25 Oct 2023 11:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1698231809;
        bh=Aa57aTVELvtasTdJr4xDdJMqfS+s+yVwDJlL6+u2dCM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EKyxDa2lU2R6ezw0pLmooF8XUeITjd9FUERmZEgBIrS3865haVuWekmDn3/2Y5jLi
         +TuHGnXmO68Num9MxWK8dddAuOs+nsJJhnq8HrcVIEbMblnVbD/4cCiLEqgRgYY+14
         vxRbDJn2wx2g8GpraSviv+4/UjzFyK1sB0AHem5g=
Date:   Wed, 25 Oct 2023 13:03:26 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Umang Jain <umang.jain@ideasonboard.com>
Cc:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v2 8/8] staging: vc04_services: Drop log level mechanisms
Message-ID: <2023102543-chapter-spending-4978@gregkh>
References: <20231024114428.443528-1-umang.jain@ideasonboard.com>
 <20231024114428.443528-9-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024114428.443528-9-umang.jain@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 24, 2023 at 07:44:28AM -0400, Umang Jain wrote:
> Drop the log level remnants since the logs are now ported to use
> dynamic logging. Drop macros, externs and global variables which
> were used in the log level mechanisms along with debugfs log entries.
> 
> Update the drivers/staging/vc04_services/interface/TODO list as well.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/staging/vc04_services/interface/TODO  |   5 -
>  .../interface/vchiq_arm/vchiq_arm.c           |   4 -
>  .../interface/vchiq_arm/vchiq_arm.h           |   3 -
>  .../interface/vchiq_arm/vchiq_core.c          |  87 ++++++---------
>  .../interface/vchiq_arm/vchiq_core.h          |  11 --
>  .../interface/vchiq_arm/vchiq_debugfs.c       | 103 ------------------
>  6 files changed, 33 insertions(+), 180 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
> index 6d9d4a800aa7..05eb5140d096 100644
> --- a/drivers/staging/vc04_services/interface/TODO
> +++ b/drivers/staging/vc04_services/interface/TODO
> @@ -23,11 +23,6 @@ should properly handle a module unload. This also includes that all
>  resources must be freed (kthreads, debugfs entries, ...) and global
>  variables avoided.
>  
> -* Cleanup logging mechanism
> -
> -The driver should probably be using the standard kernel logging mechanisms
> -such as dev_info, dev_dbg, and friends.
> -
>  * Documentation
>  
>  A short top-down description of this driver's architecture (function of

I dropped this chunk, and the changlog description of it, as I'm not
fully convinced that this portion is done yet.  You did the hard work, I
think the remaining tiny bit can probably be scripted.

thanks,

greg k-h
