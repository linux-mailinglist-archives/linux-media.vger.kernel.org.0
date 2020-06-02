Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0121EBFA3
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 18:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgFBQIN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 12:08:13 -0400
Received: from gofer.mess.org ([88.97.38.141]:60071 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726000AbgFBQIM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jun 2020 12:08:12 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 2A60FC63DD; Tue,  2 Jun 2020 17:08:11 +0100 (BST)
Date:   Tue, 2 Jun 2020 17:08:10 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-input@vger.kernel.org,
        wayland-devel@lists.freedesktop.org
Cc:     Ralf Schmidt <rds2@gmx.de>
Subject: Re: Missing Protocols ir-keytable Ubuntu 20.04
Message-ID: <20200602160810.GB16671@gofer.mess.org>
References: <6446b77c-e6de-9d0a-2ed3-691481917b80@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6446b77c-e6de-9d0a-2ed3-691481917b80@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Wed, May 06, 2020 at 02:35:32PM +0200, Ralf Schmidt wrote:
> On more thing: because off the removed -d parameter, Remotes like the
> Technisat TTS35AI are no longer supported, such Type of Remotes are not
> recognized in /sys/class/rc/.

So I'm now the proud owner of this device.

This device is a usb dongle which is an IR receiver, but self-describes
as a usb hid keyboard device. It comes with a remote.

As far as I can figure out, there is no way to reprogram it.

So users have been re-mapping scancodes to different keycodes using:

ir-keytable -d /dev/input/eventN -c -k 0x12:KEY_F1 

However, ir-keytable was designed load keymaps for rc devices, not hid
devices. This functionality was intentionally removed, as it was buggy
in many ways. ir-keytable does not exist for remapping usb hid keyboards.

This has left some users like Ralf in a situation where they can no longer
change the key mappings for their remote.

ir-keytable is probably not the right way to do this; it has no rules to
do this from udev, for example. What tooling is there for doing this
and what is the recommended way to do this?


Sean
