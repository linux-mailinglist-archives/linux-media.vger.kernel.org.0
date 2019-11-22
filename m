Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F0891077E9
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2019 20:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbfKVTRV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Nov 2019 14:17:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:51734 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726698AbfKVTRV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Nov 2019 14:17:21 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id AE6AAB275;
        Fri, 22 Nov 2019 19:17:19 +0000 (UTC)
Message-ID: <1574449256.2659.2.camel@suse.com>
Subject: Re: KASAN: use-after-free Read in si470x_int_in_callback (2)
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        syzbot <syzbot+9ca7a12fd736d93e0232@syzkaller.appspotmail.com>
Cc:     andreyknvl@google.com, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Date:   Fri, 22 Nov 2019 20:00:56 +0100
In-Reply-To: <Pine.LNX.4.44L0.1911221031300.1511-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1911221031300.1511-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Freitag, den 22.11.2019, 10:35 -0500 schrieb Alan Stern:
> On Fri, 22 Nov 2019, syzbot wrote:
> 
> > Hello,
> > 
> > syzbot has tested the proposed patch but the reproducer still triggered  
> > crash:
> > INFO: rcu detected stall in dummy_timer
> > 
> > radio-si470x 1-1:0.0: non-zero urb status (-71)
> > radio-si470x 4-1:0.0: non-zero urb status (-71)
> > radio-si470x 3-1:0.0: non-zero urb status (-71)
> 
> Oliver:
> 
> The reason for this stall is because the driver goes into a tight
> resubmit loop when the interrupt URB completes with an unrecognized
> error status.  Instead, the driver should log an error message and
> avoid resubmitting.  Error recovery can be done at a higher level.
> 
> In other words, change the
> 
> 			goto resubmit; /* Maybe we can recover. */
> 
> line in the completion handler into a return.

I thought so, too. That is why I poisoned the URB. Am I dense?

	Regards
		Oliver

