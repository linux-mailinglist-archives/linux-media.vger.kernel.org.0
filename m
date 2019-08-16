Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5ECB907B0
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 20:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbfHPSYT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 14:24:19 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:33302 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbfHPSYT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 14:24:19 -0400
Received: by mail-qt1-f195.google.com with SMTP id v38so7127908qtb.0;
        Fri, 16 Aug 2019 11:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=CVCgjz4ZRTGlXDNPoWQ4eybdK42uJ02OuOk+1ZD+7TM=;
        b=T6PHkLO5n/E64dtYj050nsoUzdL5ForjJcQNx0LC5AKSTRiSKzZCK7q7U15mSMeMBS
         S24cnroTEQJN41mBi7ShBqIYBGWAshuziprWSO+qX3tTTub5M8UWJbpMdA9124+rgeOJ
         kGLxTV2fULFjWCtTDvresTdgk1sStWksADdN5oXJiQv+PPbxMWHURl62fxBWDq20GefF
         zB6ChsM+r5EG7N7F/zbprhRqZt51ZHCI4qZJeu7acXAZuuyW2ncztrPK7qyqzSc8cnDp
         2LH2LxLHF0/tDnJ1Wr9q8mPkJ0FKA83n5RREja0LZkpvJwFf5vOXXsQKuVmuyDtCCXGG
         gvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=CVCgjz4ZRTGlXDNPoWQ4eybdK42uJ02OuOk+1ZD+7TM=;
        b=Tu4BEFX9UeBpo3mC0lDYXVYmNRA/+cg2vYaTWNKPGjHJuPPBCUwdRCCf6YSxCgW+5w
         KByDPjyKYr2JRhsKhS5eYGET2K9GxC9DeM8togWEBe2UU53tD3z1h8jCHALtb6xYFz89
         wd6cNwwMXUOVsKiFy38B/xQvCjJz12dpW+nBhuXeLN8vt/YB7+xsC33tuPhNFZ7zdCI1
         Rp6nSj/T6j+YKQwpqp2/jqfpE6nw3oohMBXRY71W3dj3ZMwkJvJgkRP6mj7wOr2G8yTC
         AFIdWTNU4IWSbSgG0J3qu7QwITt+d98t8oZE+a+hvT4/yjNtUcINug9N60tnlY7cUHpi
         zb/w==
X-Gm-Message-State: APjAAAVV8TFicbCrHDoE35yer3J09jDxUhh9gfv2yonO1hi7ztbI9seN
        7wqWhB6NO46o4nhz6DYjSNsSBTYoHE/TGwRYx9A=
X-Google-Smtp-Source: APXvYqwVoKfHivX5vQN7nv4Z0pu4iK0FOL6nOfKp0VkTogxZoitdDqyVTHQj3P+31K45vOG2NIWgVtYcwBMySP3Q5oo=
X-Received: by 2002:ac8:4896:: with SMTP id i22mr9880951qtq.13.1565979492912;
 Fri, 16 Aug 2019 11:18:12 -0700 (PDT)
MIME-Version: 1.0
From:   Nathan Royce <nroycea+kernel@gmail.com>
Date:   Fri, 16 Aug 2019 13:18:01 -0500
Message-ID: <CALaQ_hruPmgnE5yh_MJLLZ_7sPNEnzX8H-WfR=fBvcfEzfG9Fg@mail.gmail.com>
Subject: Kernel 5.2.8 - au0828 - Tuner Is Busy
To:     sean@mess.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Brad Love <brad@nextdimension.cc>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Right up front, I must say I do NOT have a Hauppauge tuner. I think
it's like maybe Mygica/Geniatech:
Bus 002 Device 004: ID 05e1:0400 Syntek Semiconductor Co., Ltd

Whenever I update my kernel, I edit the
./drivers/media/usb/au0828/au0828-cards.c file adding an entry for my
0x400 device.
I've been doing it for years and it's been working fine... until now...

*****
Aug 16 12:07:20 computerName kernel: usb 2-2.3: Tuner is busy. Error -19
<...18 more repeated entries...>
Aug 16 12:07:20 computerName kernel: usb 2-2.3: Tuner is busy. Error -19
Aug 16 12:07:10 computerName tvheadend[3276]: main: Log started
*****
"w_scan" behaves the same way.

*****
$ modprobe au0828
Aug 16 12:52:52 computerName kernel: videodev: Linux video capture
interface: v2.00
Aug 16 12:52:52 computerName kernel: au0828: au0828_init() Debugging is enabled
Aug 16 12:52:52 computerName kernel: au0828: au0828 driver loaded
Aug 16 12:52:52 computerName kernel: au0828: au0828_usb_probe() vendor
id 0x5e1 device id 0x400 ifnum:0
Aug 16 12:52:52 computerName kernel: au0828: au0828_gpio_setup()
Aug 16 12:52:52 computerName kernel: au0828: au0828_i2c_register()
Aug 16 12:52:52 computerName kernel: au0828: i2c bus registered
Aug 16 12:52:52 computerName kernel: au0828: au0828_card_setup()
Aug 16 12:52:52 computerName kernel: tveeprom: Encountered bad packet
header [20]. Corrupt or not a Hauppauge eeprom.
Aug 16 12:52:52 computerName kernel: au0828: hauppauge_eeprom:
warning: unknown hauppauge model #0
Aug 16 12:52:52 computerName kernel: au0828: hauppauge_eeprom:
hauppauge eeprom: model=0
Aug 16 12:52:52 computerName kernel: au0828: au0828_analog_register
called for intf#0!
Aug 16 12:52:52 computerName kernel: au0828: au0828_dvb_register()
Aug 16 12:52:52 computerName kernel: au8522 7-0047: creating new instance
Aug 16 12:52:52 computerName kernel: tda18271 7-0060: creating new instance
Aug 16 12:52:52 computerName kernel: tda18271: TDA18271HD/C2 detected @ 7-0060
Aug 16 12:52:53 computerName kernel: au0828: dvb_register()
Aug 16 12:52:53 computerName kernel: dvbdev: DVB: registering new
adapter (au0828)
Aug 16 12:52:53 computerName kernel: usb 2-2.3: DVB: registering
adapter 0 frontend 0 (Auvitek AU8522 QAM/8VSB Frontend)...
Aug 16 12:52:53 computerName kernel: dvbdev: dvb_create_media_entity:
media entity 'Auvitek AU8522 QAM/8VSB Frontend' registered.
Aug 16 12:52:53 computerName kernel: dvbdev: dvb_create_media_entity:
media entity 'dvb-demux' registered.
Aug 16 12:52:53 computerName kernel: au0828: Registered device AU0828
[Hauppauge Woodbury]
Aug 16 12:52:53 computerName kernel: usbcore: registered new interface
driver au0828
*****
The "eeprom" thing has never been an issue with regard to my tuner
working. It still worked in spite of it.

It's odd because:
*****
$ lsmod | grep au0828
au0828                 86016  0
tveeprom               28672  1 au0828
dvb_core              176128  1 au0828
v4l2_common            20480  1 au0828
videobuf2_vmalloc      20480  2 dvb_core,au0828
videobuf2_v4l2         28672  1 au0828
videobuf2_common       61440  3 videobuf2_v4l2,dvb_core,au0828
videodev              253952  4
v4l2_common,videobuf2_v4l2,videobuf2_common,au0828
rc_core                61440  1 au0828
media                  61440  6
videodev,snd_usb_audio,videobuf2_v4l2,dvb_core,videobuf2_common,au0828

$ ls -la /dev/dvb/adapter0/
total 0
drwxr-xr-x  2 root root     120 Aug 16 12:01 .
drwxr-xr-x  3 root root      60 Aug 16 12:01 ..
crw-rw----+ 1 root video 212, 4 Aug 16 12:01 demux0
crw-rw----+ 1 root video 212, 5 Aug 16 12:01 dvr0
crw-rw----+ 1 root video 212, 3 Aug 16 12:01 frontend0
crw-rw----+ 1 root video 212, 7 Aug 16 12:01 net0
*****

The previous kernel version I was on that worked was 5.1.15.
I just reverted back to the previous version and it's working again.
I don't know what broke and where, between the versions.

I saw https://lkml.org/lkml/2019/1/21/1020 but this is back in January
so I don't know if something was more recently applied to au0828 that
makes use of the API.
"lsof" didn't show anything related to "/dev/dvb" being used.

Oh neat! Someone posted a neat git feature which I tried and I get:
*****
$ git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset
%s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative
v5.1.15..v5.2.8 drivers/media/usb/au0828/
* be50f19fee84 - media: au0828: fix null dereference in error path (12 days ago)
* c942fddf8793 - treewide: Replace GPLv2 boilerplate/reference with
SPDX - rule 157 (3 months ago)
* 16216333235a - treewide: Replace GPLv2 boilerplate/reference with
SPDX - rule 1 (3 months ago)
* ec8f24b7faaf - treewide: Add SPDX license identifier -
Makefile/Kconfig (3 months ago)
* 14340de506c9 - media: prefix header search paths with $(srctree)/ (3
months ago)
* f604f0f5afb8 - media: au0828: stop video streaming only when last
user stops (4 months ago)
* 898bc40bfcc2 - media: au0828: Fix NULL pointer dereference in
au0828_analog_stream_enable() (4 months ago)
* 383b0e5b6ebb - media: au0828: fix enable and disable source audio
and video inconsistencies (4 months ago)
* 812658d88d26 - media: change au0828 to use Media Device Allocator
API (4 months ago)
* b60a5b8dcf49 - media: Kconfig files: use the right help coding style
(5 months ago)
* f712e5358d43 - media: au0828: minor fix to a misleading comment in
_close() (5 months ago)
*****
Note the 812658d88d26 commit.
So if I did the git command correctly, then it WAS added between these versions.
Any thoughts on if it is broken or if I can hack in a fix to force it
to ignore it being thought as being busy?
