Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 189977D69AC
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 13:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234790AbjJYLBw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 07:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234677AbjJYLBr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 07:01:47 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60933D44
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 04:01:42 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B696C433C8;
        Wed, 25 Oct 2023 11:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1698231701;
        bh=1YD3YCRTlBaAan1td1ghKoOBV0EAf0BRMMakToRGbDw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hjFI1AgSt44fevaGYMn9mN2I1fFdqCdoSlutapOY7iIpP/BbCv8GmsDTtR7zoV3Dh
         Sno92lOhbsArxe3JVyLszriR3G2W/lqyqo8OTu2j/H9sgR7WnfP7soKfAktzz48A8E
         PkxyvvRgyhiEr/iruERyKuZYEMaPfe6pBV2oMX9o=
Date:   Wed, 25 Oct 2023 13:01:39 +0200
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
Subject: Re: [PATCH v2 0/8] staging: vc04: Drop custom logging based on printk
Message-ID: <2023102528-anemia-cacti-9622@gregkh>
References: <20231024114428.443528-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024114428.443528-1-umang.jain@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 24, 2023 at 07:44:20AM -0400, Umang Jain wrote:
> Hello,
> 
> This series address the discussion on [1], i.e. removing the printk
> based logging mechanism and migrate it use dynamic debug.
> 
> Patch 1/8 and 2/8 are prep-up patch to pass struct device pointers
> so that we can use dev_dbg() in those functions. 
> 
> Patch 3/8 targets migration of vchiq_log_error() to use dynamic debug
> Patch 4/8 targets migration of vchiq_log_warning() to use dynamic debug
> Patch 5/8 targets rename of vchiq_log_info() to vchiq_log_debug() and
> migration to use dynamic debug.
> Patch 6/8 targets mirgration of vchiq_log_trace to use dynamic debug.
> 
> Patch 7/8 drops a unused macro.
> Patch 8/8 is log levels remnants cleanup along with debugfs entries.
> 
> Changes in v2:
> - Address feedback from v1, added 1/8, 2/8 as new patches
>   Hence, Remove pr_*() based logging in few cases
> - Cleanup debugfs log entries (8/8) and update TODO list
> - Fixed bugs where NULL deference was happening due to unitialised
>   pointers.

Much better, thanks!

But I don't think you're done here, why not just use "real" dev_dbg()
and the like calls instead of your wrapper #defines?  What is that
helping with?  You now have full debug information so the additional
field should not be needed anymore, right?

I'll take this for now, as any future changes can come on top of this.

thanks,

greg k-h
