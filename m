Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF7D7AE8B4
	for <lists+linux-media@lfdr.de>; Tue, 26 Sep 2023 11:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234109AbjIZJOE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Sep 2023 05:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234112AbjIZJOD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Sep 2023 05:14:03 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CAC510A
        for <linux-media@vger.kernel.org>; Tue, 26 Sep 2023 02:13:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9E7C433C7;
        Tue, 26 Sep 2023 09:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1695719636;
        bh=Y+odGCOczssjR27qb7hGuZghKba17wGbQ+Fm6GLNnFU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2gydh655lyZCnI+wjfFSVuoKOwPzdGfBn7ZdmdQYpx9dOzM+V6UQnb/Wba/hWeVdv
         vTXx3o01rrnH44UQagmltNR/5/c3QvbDKXRVIGSuF88PXCm8VPfhn2h9dsFxOlmXNj
         Hqtf8x0xAtjSDX+mNjlSoT/Qx7Z+ciSC4vTy2Y/M=
Date:   Tue, 26 Sep 2023 11:13:52 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Umang Jain <umang.jain@ideasonboard.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Dan Carpenter <error27@gmail.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [PATCH RFC] staging: vchiq_arm: move state dump to debugfs
Message-ID: <2023092638-tacky-although-65ef@gregkh>
References: <20230923235325.14329-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230923235325.14329-1-wahrenst@gmx.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Sep 24, 2023 at 01:53:25AM +0200, Stefan Wahren wrote:
> Besides the IOCTL interface the VCHIQ character device also provides
> a state dump of the whole VCHIQ driver via read. Moving the state dump
> function to debugfs has a lot advantages:
> 
> - following changes on state dump doesn't break userspace ABI
> - debug doesn't depend on VCHIQ_CDEV
> - dump code simplifies a lot and reduce the chance of buffer overflows
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
> 
> Hello,
> 
> since recent discussion raised the question about the future of debugfs
> for vchiq [1], i want to submit this cleanup patch as part of the
> discussion. The patch itself based on the latest series [2] of
> Umang Jain to convert VCHIQ into a bus. I'm aware of the checkpatch
> warnings which will be fixed in the next version, but not revelant
> to the discussion.

Looks good to me, thanks for moving this to debugfs.

greg k-h
