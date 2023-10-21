Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 643F47D1C52
	for <lists+linux-media@lfdr.de>; Sat, 21 Oct 2023 11:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjJUJ70 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Oct 2023 05:59:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbjJUJ7Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Oct 2023 05:59:24 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126ED1A3
        for <linux-media@vger.kernel.org>; Sat, 21 Oct 2023 02:59:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A86C433C7;
        Sat, 21 Oct 2023 09:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1697882359;
        bh=wWc6rIlaxv84go1O69XljTR9y8Dp7PH3NzWmbHaSc28=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EyS5G5XkJVgDPijceBEcmuOW9Sp+1+fiLlgDB1vQS9JkQgcKivVlPzjfDiuZh94RB
         nFuhDLcATWm3Wat5vFPa44mmBENjYPgvwFQWwlTWlq4cUh/VyjqhdfVR5KAipi05Yy
         4aT7+lEe+JHixyU7kfHENZrQn5MCl+nNxGoWfGPs=
Date:   Sat, 21 Oct 2023 11:59:17 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Umang Jain <umang.jain@ideasonboard.com>
Cc:     linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Dan Carpenter <error27@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 1/4] staging: vc04: Convert vchiq_log_error() to use
 dynamic debug
Message-ID: <2023102128-bacteria-improper-66f5@gregkh>
References: <20231019082147.384723-1-umang.jain@ideasonboard.com>
 <20231019082147.384723-2-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019082147.384723-2-umang.jain@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 19, 2023 at 01:51:44PM +0530, Umang Jain wrote:
> Move vchiq_log_error() custom logging wrapper based on printk,
> to use dynamic debug. To categorise, enum vchiq_log_category
> has been introduced, which will become the part of the error
> string format that will be logged to dynamic debug (for grep).
> 
> All the vchiq_log_error() calls are adjusted to use the
> dynamic debug wrapper. vchiq_loud_error_*() has been removed
> as a part of this patch and replaced with dev_err (so that
> they directly end up in kernel log, even if dynamic debug
> isn't enabled), which serves the purpose.
> 
> For cases where struct device pointer `dev` is not available,
> NULL can be passed to vchiq_log_error() to log to dynamic debug
> using pr_debug().

Ick, no, no need for that.  Please don't have yet-another-logging-macro
for this subsystem, use the "real" ones, in the code, so that we don't
have to context-switch every time we come across one of these calls.

So use dev_*() for real, where all of these have device pointers.  And
where they do not, use pr_*() so it stands out in bad ways so that those
places can then be fixed up to use the proper logging macros as well
(i.e. pass the device pointer into those functions in later patches.)

Same for the other patches in this series, let's make this simpler, not
more complex please.

thanks,

greg k-h
