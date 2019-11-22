Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3561074FB
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2019 16:35:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfKVPfQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Nov 2019 10:35:16 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:59378 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726613AbfKVPfP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Nov 2019 10:35:15 -0500
Received: (qmail 2808 invoked by uid 2102); 22 Nov 2019 10:35:14 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 22 Nov 2019 10:35:14 -0500
Date:   Fri, 22 Nov 2019 10:35:14 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+9ca7a12fd736d93e0232@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <hverkuil@xs4all.nl>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <mchehab@kernel.org>,
        <oneukum@suse.com>, <syzkaller-bugs@googlegroups.com>
Subject: Re: KASAN: use-after-free Read in si470x_int_in_callback (2)
In-Reply-To: <0000000000002d684a0597ecf0b5@google.com>
Message-ID: <Pine.LNX.4.44L0.1911221031300.1511-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 22 Nov 2019, syzbot wrote:

> Hello,
> 
> syzbot has tested the proposed patch but the reproducer still triggered  
> crash:
> INFO: rcu detected stall in dummy_timer
> 
> radio-si470x 1-1:0.0: non-zero urb status (-71)
> radio-si470x 4-1:0.0: non-zero urb status (-71)
> radio-si470x 3-1:0.0: non-zero urb status (-71)

Oliver:

The reason for this stall is because the driver goes into a tight
resubmit loop when the interrupt URB completes with an unrecognized
error status.  Instead, the driver should log an error message and
avoid resubmitting.  Error recovery can be done at a higher level.

In other words, change the

			goto resubmit; /* Maybe we can recover. */

line in the completion handler into a return.

Alan Stern

