Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7244110CDEB
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2019 18:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfK1Rdn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Nov 2019 12:33:43 -0500
Received: from netrider.rowland.org ([192.131.102.5]:37321 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726609AbfK1Rdn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Nov 2019 12:33:43 -0500
Received: (qmail 20969 invoked by uid 500); 28 Nov 2019 12:33:42 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 28 Nov 2019 12:33:42 -0500
Date:   Thu, 28 Nov 2019 12:33:42 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     syzbot <syzbot+9ca7a12fd736d93e0232@syzkaller.appspotmail.com>,
        <andreyknvl@google.com>, <hverkuil@xs4all.nl>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <mchehab@kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: KASAN: use-after-free Read in si470x_int_in_callback (2)
In-Reply-To: <1574938260.21204.5.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.1911281225340.19734-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 28 Nov 2019, Oliver Neukum wrote:

> Hi,
> 
> it is a bit awkward to complain here, as your patch tests as correct
> while mine didn't, but this is a race condition.
> You can't guarantee that urb->status != 0.
> The kill may happen while the completion handler is running for
> a successful transfer.
> 
> I really appreciate your help, but I must understand what is going
> wrong here. You are stopping the resubmit, but how could the resubmit
> ever have not failed?

You probably have figured all this out already, but I'll answer anyway.

The code I changed doesn't race with the error condition you were 
concerned about.  The two are independent, and it doesn't matter if the 
kill happens while the completion handler is running.

In the case my patch addresses, the resubmit does not fail.  Rather, it
succeeds but then the URB completes with a -EPROTO error.  The problem
is that the completion handler then resubmits the URB again, and it
completes again with the same error, right away, in a tight loop --
which prevents the CPU from executing any other code.  The way to fix
the problem is to break the loop by not resubmitting, which is what the
patch does.

Alan Stern

