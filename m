Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76F121CA6B9
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 11:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgEHJDV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 05:03:21 -0400
Received: from gofer.mess.org ([88.97.38.141]:51945 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726768AbgEHJDV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 05:03:21 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id F26FAC6429; Fri,  8 May 2020 10:03:19 +0100 (BST)
Date:   Fri, 8 May 2020 10:03:19 +0100
From:   Sean Young <sean@mess.org>
To:     Ralf Schmidt <rds2@gmx.de>
Cc:     linux-media@vger.kernel.org
Subject: Re: Missing Protocols ir-keytable Ubuntu 20.04
Message-ID: <20200508090319.GA32337@gofer.mess.org>
References: <6446b77c-e6de-9d0a-2ed3-691481917b80@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6446b77c-e6de-9d0a-2ed3-691481917b80@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ralf,

On Wed, May 06, 2020 at 02:35:32PM +0200, Ralf Schmidt wrote:
> Only working Receiver: all RF X10 Wireless Receiver
> All Outputs with just upgraded 5.4.0-29-generic Kernel (Ubuntu 20.04LTS)
> and newly installed ir-keytable
> 
> ralf@nexus:~$ ir-keytable --version
> IR keytable control version 1.18.0
> 
> ralf@nexus:~$ sudo ir-keytable -p all
> [sudo] Passwort für ralf:
> Die Protokolle für das Gerät können nicht geändert werden
> Protokolle geändert in other

Well those messages can't both be true.

> /dev/lirc0: kein Empfangsgerät für unverarbeitetes Infrarot
> BPF-Protokoll rc-mm konnte weder in /etc/rc_keymaps/protocols noch in
> /lib/udev/rc_keymaps/protocols gefunden werden
> BPF-Protokoll imon konnte weder in /etc/rc_keymaps/protocols noch in
> /lib/udev/rc_keymaps/protocols gefunden werden
> BPF-Protokoll cec konnte weder in /etc/rc_keymaps/protocols noch in
> /lib/udev/rc_keymaps/protocols gefunden werden
> BPF-Protokoll xmp konnte weder in /etc/rc_keymaps/protocols noch in
> /lib/udev/rc_keymaps/protocols gefunden werden
> BPF-Protokoll sharp konnte weder in /etc/rc_keymaps/protocols noch in
> /lib/udev/rc_keymaps/protocols gefunden werden
> BPF-Protokoll rc-6 konnte weder in /etc/rc_keymaps/protocols noch in
> /lib/udev/rc_keymaps/protocols gefunden werden
> BPF-Protokoll mce_kbd konnte weder in /etc/rc_keymaps/protocols noch in
> /lib/udev/rc_keymaps/protocols gefunden werden
> BPF-Protokoll sanyo konnte weder in /etc/rc_keymaps/protocols noch in
> /lib/udev/rc_keymaps/protocols gefunden werden
> BPF-Protokoll nec konnte weder in /etc/rc_keymaps/protocols noch in
> /lib/udev/rc_keymaps/protocols gefunden werden
> BPF-Protokoll sony konnte weder in /etc/rc_keymaps/protocols noch in
> /lib/udev/rc_keymaps/protocols gefunden werden
> BPF-Protokoll jvc konnte weder in /etc/rc_keymaps/protocols noch in
> /lib/udev/rc_keymaps/protocols gefunden werden
> BPF-Protokoll rc-5-sz konnte weder in /etc/rc_keymaps/protocols noch in
> /lib/udev/rc_keymaps/protocols gefunden werden
> BPF-Protokoll rc-5 konnte weder in /etc/rc_keymaps/protocols noch in
> /lib/udev/rc_keymaps/protocols gefunden werden
> BPF-Protokoll lirc konnte weder in /etc/rc_keymaps/protocols noch in
> /lib/udev/rc_keymaps/protocols gefunden werden
> BPF-Protokoll unknown konnte weder in /etc/rc_keymaps/protocols noch in
> /lib/udev/rc_keymaps/protocols gefunden werden

Oops. Yes, I broke this. ir-keytable should not be doing this. I'll fix
this; in the mean time those messages can be ignored.

-snip-

> But all the protocols are available

Yes, you are right.
 
> On more thing: because off the removed -d parameter, Remotes like the
> Technisat TTS35AI are no longer supported, such Type of Remotes are not
> recognized in /sys/class/rc/.

Hmm it would be good to know more about this. What device is this exactly?
It would be good to have lsusb output.

> Sorry for my bad English

You are very clear and thank you for your bug report.

Thanks,

Sean
