Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE0A21F33F5
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 08:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgFIGKW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jun 2020 02:10:22 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:55321 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726886AbgFIGKV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Jun 2020 02:10:21 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id D06A4643;
        Tue,  9 Jun 2020 02:10:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Tue, 09 Jun 2020 02:10:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=G3G/aavXr8lZjHEO6zeY6OOaUQ4
        8mjjAq5MEnUA12T4=; b=Mhge7RMbRevsPgL57gFrKNvzucCKoxHXAqZOBttznKf
        MXyB5+JTKl9P97iLYqIgzLpmkOsguptsx1sSBZXEaHCA0NLOyEsXimc3Vrng6Hla
        iKhIzDTCNO8W9kN6j2MlXej0k6axzAk0dCwAFTsi1doqakzvXakgKhQ9BTrteRHw
        AL648FfGfOKrJQpyx5cspt6p/zM5d1VM5DlXTGURcQ3NaEVWwG1W/hIE39K0fr89
        G3H9wAiumPMYlJ45Y96TQH+IRROLLxb05h+BrHTrTSVziYwJqKuGUOpj6neiowAG
        dT/dGJckOQ7/xOf6YVwWJdiI8/LWK8q3lb52T0CYqnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=G3G/aa
        vXr8lZjHEO6zeY6OOaUQ48mjjAq5MEnUA12T4=; b=uZAneJW0w9rmNzQB1KSsVW
        J68W6VKAfYt8yMBvT0jPAoMXYe1apskTlO91gS/8dVu6Gat/e9ekHW1sqapVwMvO
        lnFav7AMOH7UeccMTfu6zN1NoODQIopUCIPGbWD2a1VWgUQ+Po+osdEN7Z+oIvje
        lQAW+J6Ebc/VkI1iYsE8HmIKQW4K5sF7/M9yzlikkFpHQY7OBX0Ne4WuICNJHCa0
        3Z7mEK4UCLWgQQqabmmuYMCu4YCFJnN59xgSQ2rr4anFYtV+NaxsxMFbnIViGuDO
        rYZznDU/vGyTHCWRHb4bRKWCkZwiKfcqxZEFUU+oIohE6hXiYRb+xHWtkzs3K7Kg
        ==
X-ME-Sender: <xms:yyffXpo9TYLalPVSltZ6DjPbt-NIK3hh8IHzUsTWg9_4o4Eb-YeXdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudehfedguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgv
    rhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvg
    htqeenucggtffrrghtthgvrhhnpeehhfehfffgheelgeeuudelhefgvdefveekudevjeev
    jeevvefggefguddufeeuveenucfkphepuddujedrvddtrdeikedrudefvdenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhht
    thgvrhgvrhesfihhohdqthdrnhgvth
X-ME-Proxy: <xmx:yyffXrqyKX7wvqgSHsRDe7QgbGKkim76L0tFuYMYiJZ0OLbFptnGyw>
    <xmx:yyffXmONLDUwNnE4QMf_jnCD_3tAdenY7N-3wYXNQWGyIv-4ohUF_Q>
    <xmx:yyffXk6RJiG8no0NcHCgXI0Z1oI7bJemzqLw3-OumMWF49QL2xn2yw>
    <xmx:zCffXmQ41cfQHFdHGvSG1_k7E82bWEGCfLQvPdecqfY6WAuGtVIOBA>
Received: from jelly (117-20-68-132.751444.bne.nbn.aussiebb.net [117.20.68.132])
        by mail.messagingengine.com (Postfix) with ESMTPA id 10E36328005D;
        Tue,  9 Jun 2020 02:10:17 -0400 (EDT)
Date:   Tue, 9 Jun 2020 16:10:14 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, linux-input@vger.kernel.org,
        wayland-devel@lists.freedesktop.org, Ralf Schmidt <rds2@gmx.de>
Subject: Re: Missing Protocols ir-keytable Ubuntu 20.04
Message-ID: <20200609061014.GA40603@jelly>
References: <6446b77c-e6de-9d0a-2ed3-691481917b80@gmx.de>
 <20200602160810.GB16671@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602160810.GB16671@gofer.mess.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 02, 2020 at 05:08:10PM +0100, Sean Young wrote:
> Hi,
> 
> On Wed, May 06, 2020 at 02:35:32PM +0200, Ralf Schmidt wrote:
> > On more thing: because off the removed -d parameter, Remotes like the
> > Technisat TTS35AI are no longer supported, such Type of Remotes are not
> > recognized in /sys/class/rc/.
> 
> So I'm now the proud owner of this device.
> 
> This device is a usb dongle which is an IR receiver, but self-describes
> as a usb hid keyboard device. It comes with a remote.
> 
> As far as I can figure out, there is no way to reprogram it.
> 
> So users have been re-mapping scancodes to different keycodes using:
> 
> ir-keytable -d /dev/input/eventN -c -k 0x12:KEY_F1 
> 
> However, ir-keytable was designed load keymaps for rc devices, not hid
> devices. This functionality was intentionally removed, as it was buggy
> in many ways. ir-keytable does not exist for remapping usb hid keyboards.
> 
> This has left some users like Ralf in a situation where they can no longer
> change the key mappings for their remote.
> 
> ir-keytable is probably not the right way to do this; it has no rules to
> do this from udev, for example. What tooling is there for doing this
> and what is the recommended way to do this?

remapping the keys through the udev builtins maybe?
see /usr/lib/udev/hwdb.d/60-keyboard.hwdb

Cheers,
   Peter
