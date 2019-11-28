Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 759EB10CB9C
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2019 16:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbfK1PTt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Nov 2019 10:19:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:44972 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726436AbfK1PTs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Nov 2019 10:19:48 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id E2C3AB1EB;
        Thu, 28 Nov 2019 15:19:46 +0000 (UTC)
Message-ID: <1574954383.21204.11.camel@suse.com>
Subject: Re: KASAN: use-after-free Read in si470x_int_in_callback (2)
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        syzbot <syzbot+9ca7a12fd736d93e0232@syzkaller.appspotmail.com>
Cc:     andreyknvl@google.com, hverkuil@xs4all.nl,
        Kernel development list <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, USB list <linux-usb@vger.kernel.org>,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Date:   Thu, 28 Nov 2019 16:19:43 +0100
In-Reply-To: <Pine.LNX.4.44L0.1911271610270.1319-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1911271610270.1319-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Mittwoch, den 27.11.2019, 16:11 -0500 schrieb Alan Stern:
> Oliver:
> 
> Make of this what you will...

Hi,

first, thank you. Second, this is teaching me to question my
assumptions. There is no disconnect at all. We are busy looping
in the error handler as we have virtual hardware in this test,
which can execute an URB without waiting for hardware.

So should we kill error handling for this case?

	Regards
		Oliver

