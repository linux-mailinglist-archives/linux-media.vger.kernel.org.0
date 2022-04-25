Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1391C50E501
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 18:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235796AbiDYQEd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 12:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243185AbiDYQE3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 12:04:29 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 66E9410FEE
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 09:01:24 -0700 (PDT)
Received: (qmail 806562 invoked by uid 1000); 25 Apr 2022 12:01:23 -0400
Date:   Mon, 25 Apr 2022 12:01:23 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Sean Young <sean@mess.org>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Jarod Wilson <jarod@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzbot <syzbot+c558267ad910fc494497@syzkaller.appspotmail.com>,
        andreyknvl@google.com, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: possible deadlock in display_open
Message-ID: <YmbF071fSKUff6R2@rowland.harvard.edu>
References: <00000000000043b599058faf0145@google.com>
 <5a06c7f1-9a29-99e4-c700-fec3f09509d2@I-love.SAKURA.ne.jp>
 <YmZny7mzugFe0t+X@gofer.mess.org>
 <62dddbb9-3053-f284-f9db-3beda5e8e951@I-love.SAKURA.ne.jp>
 <YmaMY/XKBmEfl8i6@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmaMY/XKBmEfl8i6@gofer.mess.org>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 25, 2022 at 12:56:19PM +0100, Sean Young wrote:
> On Mon, Apr 25, 2022 at 08:14:12PM +0900, Tetsuo Handa wrote:
> > On 2022/04/25 18:20, Sean Young wrote:
> > > The problem is there are imon devices which have two usb interfaces, even
> > > though it is one device. The probe and disconnect function of both usb
> > > interfaces can run concurrently.
> > > 
> > > Of course, this depends on probe/disconnect functions being allowed to run
> > > concurrently on different interfaces of the same usb device.
> > 
> > I don't have real hardware to confirm. If you have an imon device which has
> > two usb interfaces, please try below debug printk() patch in order to see
> > whether the caller is already holding locks for serialization.
> 
> I am afraid calling debug_show_held_locks() is not really going to tell us
> this information. This should be figured out from understanding the usb
> stack, not from seeing if the probe happens to be concurrent.
> 
> Just because the locks were not held, does not mean that the usb interface
> initialization is not concurrent.

The driver and USB cores guarantee that when an interface is probed, 
both the interface and its USB device are locked.  Ditto for when the 
disconnect callback gets run.  So concurrent probing/disconnection of 
multiple interfaces on the same device is not possible.

Alan Stern
