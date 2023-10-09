Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA377BD853
	for <lists+linux-media@lfdr.de>; Mon,  9 Oct 2023 12:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346112AbjJIKQT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Oct 2023 06:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346121AbjJIKQS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Oct 2023 06:16:18 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB1BDAB
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 03:16:16 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B24C433C7;
        Mon,  9 Oct 2023 10:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1696846576;
        bh=RSSmBe2hBTVt5zo3o9PsUHPyXSee+Ceb+hlfyxj1OxM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1NWXqfFxwZCDZNLjtbeDlsdfaMmJmRVLJczlRzq6WTh+3MhTv0DACUOHbjMaE1jZJ
         UtTix9FQIns7d4LTyXyeCJtfTxQusHfYj7chvkOQLFOrHG1Vcec8CoHT6QwK4Hc3HW
         h+WY1ckDlhKll5K3ykMVIhGJwV2RrAisppKgMZ2E=
Date:   Mon, 9 Oct 2023 12:16:14 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Umang Jain <umang.jain@ideasonboard.com>
Cc:     linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH] staging: vc04_services: vchiq_bus: Do not kfree device
Message-ID: <2023100902-common-myself-e3f4@gregkh>
References: <20231009060906.33407-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009060906.33407-1-umang.jain@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 09, 2023 at 11:39:06AM +0530, Umang Jain wrote:
> As per device_register() documentation, this kfree() on error path will
> crash. The call to put_device() is all that is needed here to free the
> memory.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c | 1 -
>  1 file changed, 1 deletion(-)

This needs a "Fixes:" tag, right?

thanks,

greg k-h
