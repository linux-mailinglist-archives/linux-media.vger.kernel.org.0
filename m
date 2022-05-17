Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6674A529FAF
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 12:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237799AbiEQKqM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 06:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344530AbiEQKpQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 06:45:16 -0400
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA6C32EDA
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 03:45:15 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id CE154101BE5; Tue, 17 May 2022 11:45:13 +0100 (BST)
Date:   Tue, 17 May 2022 11:45:13 +0100
From:   Sean Young <sean@mess.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org
Subject: Re: [PATCH] imon_raw: respect DMA coherency
Message-ID: <YoN8uWKZ6n2r/ntD@gofer.mess.org>
References: <20220512130321.30599-1-oneukum@suse.com>
 <Yn6F87BxKsOaDYR5@gofer.mess.org>
 <2c6478af-6247-0cbf-8761-7ca288522f7f@suse.com>
 <YoJ+jhKDxUokK207@gofer.mess.org>
 <61569f96-4424-eb40-c546-47353de33501@suse.com>
 <YoNR7ngGGzqxf8+/@gofer.mess.org>
 <a9d957ce-4c20-bbb1-028f-73b4a905d0a8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9d957ce-4c20-bbb1-028f-73b4a905d0a8@suse.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 17, 2022 at 10:28:35AM +0200, Oliver Neukum wrote:
> sorry for being a bit obnoxious about this, but there is a slight issue.

Pointing out potential issues is the opposite of obnoxious :)

> This is the old code:
> 
> static void imon_ir_data(struct imon *imon)
> {
>        struct ir_raw_event rawir = {};
>        u64 data = be64_to_cpu(imon->ir_buf);
>        u8 packet_no = data & 0xff;
>        int offset = 40;
>        int bit;
> 
>        if (packet_no == 0xff)
>                return;
> 
>        dev_dbg(imon->dev, "data: %*ph", 8, &imon->ir_buf);

That should be imon->ir_buf (not &imon->ir_buf) after your changes.

> The dev_dbg() logs the data as it is in the buffer. If you use
> be64_to_cpup() instead of be64_to_cpu() you reverse
> the buffer on a little endian CPU and hence the debug
> output will be changed.

I'm confused. be64_to_cpup() does not do an in-place byte swap on little
endian. 

I've just tested and the debug message still works fine (barring the issue
above).

> The actual driver code is unaffected, because the
> buffer is never used again, so this is not a big deal.
> 
> The error is mine by changing the type of imon->ir_buf
> But the fix is not quite the best.

Your change is good.


Sean
