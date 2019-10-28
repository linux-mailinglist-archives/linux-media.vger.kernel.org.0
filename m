Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBE6E6F55
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2019 10:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732530AbfJ1JrB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Oct 2019 05:47:01 -0400
Received: from gofer.mess.org ([88.97.38.141]:47643 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730038AbfJ1JrB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Oct 2019 05:47:01 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id CB0B1C6394; Mon, 28 Oct 2019 09:46:59 +0000 (GMT)
Date:   Mon, 28 Oct 2019 09:46:59 +0000
From:   Sean Young <sean@mess.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v4l-utils v2 2/2] keytable: cannot load BPF decoders from
 udevd
Message-ID: <20191028094659.GA25747@gofer.mess.org>
References: <20191024153305.22150-1-sean@mess.org>
 <20191024153305.22150-2-sean@mess.org>
 <db373e7d-4ead-7b4f-1e2b-d5dd18975184@xs4all.nl>
 <20191027145451.GA13871@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191027145451.GA13871@gofer.mess.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Oct 27, 2019 at 02:54:51PM +0000, Sean Young wrote:
> On Sun, Oct 27, 2019 at 03:18:55PM +0100, Hans Verkuil wrote:
> > After this was installed on my debian system (running the 'testing' version
> > of debian) the laptop would no longer boot since the systemd-udevd service
> > failed to load.
> > 
> > My laptop runs systemd 242.
> > 
> > After removing the installed 50-rc_keymap.conf it worked again.
> > 
> > So either this file is no good, or it requires a newer systemd for it to
> > work.
> 
> I think I know what the problem is. On Fedora, for the systemd-udevd.service
> there is this setting.
> SystemCallFilter=@system-service @module @raw-io
> then 50-rc_keymap.conf adds:
> SystemCallFilter=bpf
> Which is concatenated to the end.
> 
> On the debian version of systemd, SystemCallFilter is not set. So
> SystemCallFilter=bpf
> means that only the bpf syscall is allowed. 
> 
> I'm not sure what the correct solution is. I'll try a few things and if I
> don't come up with anything, I'll have to revert.
> 
> Suggestions welcome :)

I think this could be solved by having configure check for SystemCallFilter,
like so:

	grep -s SystemCallFilter /lib/systemd/system/systemd-udevd.service 

and then installing the override if needed. I'll try to do this in the next
few days.

Thanks,
Sean
