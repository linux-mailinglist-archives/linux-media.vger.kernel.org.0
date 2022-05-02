Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95CAF516FFF
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 15:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235090AbiEBNJr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 09:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234924AbiEBNJq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 09:09:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B82464C3;
        Mon,  2 May 2022 06:06:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AEE146133F;
        Mon,  2 May 2022 13:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AE0C385AC;
        Mon,  2 May 2022 13:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1651496777;
        bh=8XYddznJIl/gU5lhFJK7ZW4/j2NWR84fJI8NOxuSgQM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pDz3lWKgEmS8hfZ8IOiXpVMYVkv1CoubXaMUrJbQEctU0cbyssOczu5Tcc1Wd+bwT
         ru7BMGqbPnGzRe9k4Efe8VZhKyARKshfnrWy0WaaXNHy5wAlsaZeNkEu9VOjRb0KtG
         uzV/cbJmaQ46eMGA1qr+OiJH2FDtf6yz7SzF/Zj8=
Date:   Mon, 2 May 2022 15:06:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Sean Young <sean@mess.org>, Alan Stern <stern@rowland.harvard.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jarod Wilson <jarod@redhat.com>,
        syzbot <syzbot+c558267ad910fc494497@syzkaller.appspotmail.com>,
        andreyknvl@google.com, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v2 (resend)] media: imon: reorganize serialization
Message-ID: <Ym/XR2ARHKFDzAl5@kroah.com>
References: <62dddbb9-3053-f284-f9db-3beda5e8e951@I-love.SAKURA.ne.jp>
 <YmaMY/XKBmEfl8i6@gofer.mess.org>
 <YmbF071fSKUff6R2@rowland.harvard.edu>
 <YmbKiPna01aMQhJw@gofer.mess.org>
 <349f3e34-41ed-f832-3b22-ae10c50e3868@I-love.SAKURA.ne.jp>
 <Ymel5XtWC7rwpiXF@gofer.mess.org>
 <e17d6647-2c65-638b-1469-f546da7d0ba8@I-love.SAKURA.ne.jp>
 <21ffa07a-1bc1-cb1f-eef4-6c3a73953061@I-love.SAKURA.ne.jp>
 <Ym/UQpEV46W6frqH@kroah.com>
 <ae9de04c-3d00-1e5e-cd45-bb3baf4f6184@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae9de04c-3d00-1e5e-cd45-bb3baf4f6184@I-love.SAKURA.ne.jp>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 02, 2022 at 10:04:22PM +0900, Tetsuo Handa wrote:
> On 2022/05/02 21:53, Greg KH wrote:
> >> @@ -153,6 +153,24 @@ struct imon_context {
> >>  	const struct imon_usb_dev_descr *dev_descr;
> >>  					/* device description with key */
> >>  					/* table for front panels */
> >> +	/*
> >> +	 * Fields for deferring free_imon_context().
> >> +	 *
> >> +	 * Since reference to "struct imon_context" is stored into
> >> +	 * "struct file_operations"->private_data, we need to remember
> >> +	 * how many file descriptors might access this "struct imon_context".
> >> +	 */
> >> +	refcount_t users;
> > 
> > Are you sure this is going to work properly?
> > 
> > How do you handle userspace passing around file descriptors to other
> > processes?
> > 
> > You really should not ever have to count this.
> 
> Passing around file descriptors results in nothing but delay of freeing memory.
> Is this so fatal problem?

Not at all, it's just that any driver that tries to count open calls
usually is wrong as they forget about this type of thing, which is why I
asked.

thanks,

greg k-h
