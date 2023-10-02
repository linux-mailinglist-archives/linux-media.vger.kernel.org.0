Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E37467B4C25
	for <lists+linux-media@lfdr.de>; Mon,  2 Oct 2023 09:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235631AbjJBHD6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Oct 2023 03:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235584AbjJBHD5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Oct 2023 03:03:57 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 386C99F
        for <linux-media@vger.kernel.org>; Mon,  2 Oct 2023 00:03:55 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B55C433C9;
        Mon,  2 Oct 2023 07:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1696230234;
        bh=isgnctD6bZsWxvGPwcAKUrW6UxJWxJhNMPC0jAIu7UQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KslYNypf83wtmI2w0wIVp6wxb7GFnTX8Yc9ADxVSxtw8Tsm+vCq88CI5QIrrgiZkb
         4MUeq10REzvjPylRTJasVcmS54YM/QgjsaQiY6R/DLlMqS4Ct9fybP0M4iKDgY54PE
         yT0U1JINc/GrhTQuzR9JBNcssBNnwkJ8xBhKd2bo=
Date:   Mon, 2 Oct 2023 09:03:51 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     laurent.pinchart@ideasonboard.com, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, john@keeping.me.uk,
        alsi@bang-olufsen.dk, ruslan.bilovol@gmail.com,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: gadget: u_audio: initialize spinlocks
Message-ID: <2023100239-atop-twisty-2040@gregkh>
References: <20231002064231.2336627-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002064231.2336627-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 02, 2023 at 08:42:31AM +0200, Michael Grzeschik wrote:
> When using uac2 with lockdep enabled, the kernel is throwing this
> message, due to uninitialized spinlocks. We initialize them now.
> 
> [   24.668867] The code is fine but needs lockdep annotation, or maybe
> [   24.675878] you didn't initialize this object before use?
> [   24.681910] turning off the locking correctness validator.
> [   24.688038] CPU: 0 PID: 348 Comm: irq/43-dwc3 Tainted: G         C         6.5.0-20230919-1+ #14
> [   24.697866] Hardware name: WolfVision PF5 (DT)
> [   24.702831] Call trace:
> [   24.705559]  dump_backtrace+0xac/0x130
> [   24.709755]  show_stack+0x30/0x48
> [   24.713456]  dump_stack_lvl+0x60/0xb0
> [   24.717552]  dump_stack+0x18/0x28
> [   24.721254]  register_lock_class+0x4e8/0x4f8
> [   24.726029]  __lock_acquire+0x88/0x2130
> [   24.730314]  lock_acquire+0x17c/0x338
> [   24.734403]  _raw_spin_lock_irqsave+0x60/0x90
> [   24.739274]  u_audio_get_capture_srate+0x34/0x68
> [   24.744436]  afunc_setup+0x2d8/0x538
> [   24.748431]  composite_setup+0x1a8/0x1ba8
> [   24.752913]  configfs_composite_setup+0x88/0xc0
> [   24.757974]  dwc3_ep0_interrupt+0x5e8/0xab8
> [   24.762648]  dwc3_process_event_buf+0x424/0xbb0
> [   24.767717]  dwc3_thread_interrupt+0x4c/0x90
> [   24.772488]  irq_thread_fn+0x34/0xb8
> [   24.776484]  irq_thread+0x1a0/0x290
> [   24.780379]  kthread+0x10c/0x120
> [   24.783985]  ret_from_fork+0x10/0x20
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

What commit id does this fix?

thanks,

greg k-h
