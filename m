Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24FC21F5510
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 14:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728933AbgFJMnJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 08:43:09 -0400
Received: from gofer.mess.org ([88.97.38.141]:44045 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728595AbgFJMnI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 08:43:08 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id E53C2C638A; Wed, 10 Jun 2020 13:43:06 +0100 (BST)
Date:   Wed, 10 Jun 2020 13:43:06 +0100
From:   Sean Young <sean@mess.org>
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     linux-media@vger.kernel.org, linux-input@vger.kernel.org,
        wayland-devel@lists.freedesktop.org, Ralf Schmidt <rds2@gmx.de>
Subject: Re: Missing Protocols ir-keytable Ubuntu 20.04
Message-ID: <20200610124306.GA14497@gofer.mess.org>
References: <6446b77c-e6de-9d0a-2ed3-691481917b80@gmx.de>
 <20200602160810.GB16671@gofer.mess.org>
 <20200609061014.GA40603@jelly>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200609061014.GA40603@jelly>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 09, 2020 at 04:10:14PM +1000, Peter Hutterer wrote:
> On Tue, Jun 02, 2020 at 05:08:10PM +0100, Sean Young wrote:
> > Hi,
> > 
> > On Wed, May 06, 2020 at 02:35:32PM +0200, Ralf Schmidt wrote:
> > > On more thing: because off the removed -d parameter, Remotes like the
> > > Technisat TTS35AI are no longer supported, such Type of Remotes are not
> > > recognized in /sys/class/rc/.
> > 
> > So I'm now the proud owner of this device.
> > 
> > This device is a usb dongle which is an IR receiver, but self-describes
> > as a usb hid keyboard device. It comes with a remote.
> > 
> > As far as I can figure out, there is no way to reprogram it.
> > 
> > So users have been re-mapping scancodes to different keycodes using:
> > 
> > ir-keytable -d /dev/input/eventN -c -k 0x12:KEY_F1 
> > 
> > However, ir-keytable was designed load keymaps for rc devices, not hid
> > devices. This functionality was intentionally removed, as it was buggy
> > in many ways. ir-keytable does not exist for remapping usb hid keyboards.
> > 
> > This has left some users like Ralf in a situation where they can no longer
> > change the key mappings for their remote.
> > 
> > ir-keytable is probably not the right way to do this; it has no rules to
> > do this from udev, for example. What tooling is there for doing this
> > and what is the recommended way to do this?
> 
> remapping the keys through the udev builtins maybe?
> see /usr/lib/udev/hwdb.d/60-keyboard.hwdb

That's a good idea.

Ralf, what keyboard mappings are you using?

Thanks,

Sean
