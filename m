Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2FB3E7686
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 17:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391067AbfJ1QgC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 12:36:02 -0400
Received: from gofer.mess.org ([88.97.38.141]:35065 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729420AbfJ1QgC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 12:36:02 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7D7F8C63A9; Mon, 28 Oct 2019 16:36:01 +0000 (GMT)
Date:   Mon, 28 Oct 2019 16:36:01 +0000
From:   Sean Young <sean@mess.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v4l-utils] 50-rc_keymap.conf prevents debian testing from
 booting
Message-ID: <20191028163601.GA24173@gofer.mess.org>
References: <20191028145604.22907-1-sean@mess.org>
 <3293723b-722f-6226-5742-09e7a071ca86@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3293723b-722f-6226-5742-09e7a071ca86@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 28, 2019 at 05:21:02PM +0100, Hans Verkuil wrote:
> On 10/28/19 3:56 PM, Sean Young wrote:
> > If SystemCallFilter is not set for systemd-udevd, then 50-rc_keymap.conf
> > restricts the service to _only_ the bpf syscall, preventing the system
> > from booting.
> > 
> > Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
> 
> Tested-by: Hans Verkuil <hverkuil@xs4all.nl>
> 
> Thanks! I think this should be merged quickly since it is not nice when
> v4l-utils suddenly prevents your system from booting the next time.
> 
> Especially when you discover this two hours before you have to leave
> for the airport to travel to the ELCE conference where you are
> speaker the next day...

Yes, it's been pushed. Sorry about this. I am a little concerned that
loading bpf rc keymaps from udevd is not the best idea. Possibly this should
be done via polkit. These changes seem a little fragile and as this shows,
if it goes wrong then you end up with a system that doesn't boot...

Thanks for your report/test, making a quick turnaround for a fix possible.


Sean
