Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3CA790B1E
	for <lists+linux-media@lfdr.de>; Sat, 17 Aug 2019 00:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbfHPWla (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 18:41:30 -0400
Received: from egyptian.birch.relay.mailchannels.net ([23.83.209.56]:57172
        "EHLO egyptian.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727660AbfHPWla (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 18:41:30 -0400
X-Sender-Id: dreamhost|x-authsender|brad@b-rad.cc
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id AB57C8C2A6D;
        Fri, 16 Aug 2019 22:41:26 +0000 (UTC)
Received: from pdx1-sub0-mail-a19.g.dreamhost.com (100-96-85-40.trex.outbound.svc.cluster.local [100.96.85.40])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id D64E78C2B6B;
        Fri, 16 Aug 2019 22:41:25 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@b-rad.cc
Received: from pdx1-sub0-mail-a19.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.17.5);
        Fri, 16 Aug 2019 22:41:26 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@b-rad.cc
X-MailChannels-Auth-Id: dreamhost
X-Industry-Cure: 49f2c09047be8173_1565995286404_3126391345
X-MC-Loop-Signature: 1565995286404:3136823738
X-MC-Ingress-Time: 1565995286403
Received: from pdx1-sub0-mail-a19.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a19.g.dreamhost.com (Postfix) with ESMTP id CD2C682CB5;
        Fri, 16 Aug 2019 15:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=
        subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=
        nextdimension.cc; bh=FC/mN0wRZKCYzs01bF95LoKg1QU=; b=XbB9d1HiUbO
        2Bj66Q0M7lqOshcrC5IbOzW2qNnwG0UpKiKS8cTzofBLhcoBbqkqe0w/4euSaJ6l
        ZnuzON83fwaGDFM7IqZqdK9ZF0/gUrvY4FfID6KhPpuaB/JtQ4SxGc9a3C4Pw7gm
        SJ8OCYcmO5Ls/tsMUJLx9Usds5t4jS/I=
Received: from [192.168.0.21] (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@b-rad.cc)
        by pdx1-sub0-mail-a19.g.dreamhost.com (Postfix) with ESMTPSA id 4CD9282CA8;
        Fri, 16 Aug 2019 15:41:16 -0700 (PDT)
Subject: Re: Kernel 5.2.8 - au0828 - Tuner Is Busy
To:     Nathan Royce <nroycea+kernel@gmail.com>, sean@mess.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Brad Love <brad@nextdimension.cc>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <CALaQ_hruPmgnE5yh_MJLLZ_7sPNEnzX8H-WfR=fBvcfEzfG9Fg@mail.gmail.com>
X-DH-BACKEND: pdx1-sub0-mail-a19
From:   Brad Love <brad@nextdimension.cc>
Openpgp: preference=signencrypt
Autocrypt: addr=brad@nextdimension.cc; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e616d881-25e2-c295-2a98-b51c8cbcbc81@nextdimension.cc>
Date:   Fri, 16 Aug 2019 17:41:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CALaQ_hruPmgnE5yh_MJLLZ_7sPNEnzX8H-WfR=fBvcfEzfG9Fg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: -85
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudefgedgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuggftfghnshhusghstghrihgsvgdpffftgfetoffjqffuvfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdludehmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtqhertddtfeejnecuhfhrohhmpeeurhgrugcunfhovhgvuceosghrrggusehnvgigthguihhmvghnshhiohhnrdgttgeqnecuffhomhgrihhnpehlkhhmlhdrohhrghenucfkphepieejrdduleekrdehjedrudekkeenucfrrghrrghmpehmohguvgepshhmthhppdhhvghloheplgduledvrdduieekrddtrddvudgnpdhinhgvthepieejrdduleekrdehjedrudekkedprhgvthhurhhnqdhprghthhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqedpmhgrihhlfhhrohhmpegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtpdhnrhgtphhtthhopehnrhhohigtvggrodhkvghrnhgvlhesghhmrghilhdrtghomhenucevlhhushhtvghrufhiiigvpedt
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nathan,


On 16/08/2019 13.18, Nathan Royce wrote:
> Right up front, I must say I do NOT have a Hauppauge tuner. I think
> it's like maybe Mygica/Geniatech:
> Bus 002 Device 004: ID 05e1:0400 Syntek Semiconductor Co., Ltd
>
> Whenever I update my kernel, I edit the
> ./drivers/media/usb/au0828/au0828-cards.c file adding an entry for my
> 0x400 device.
> I've been doing it for years and it's been working fine... until now...=

>
> *****
> Aug 16 12:07:20 computerName kernel: usb 2-2.3: Tuner is busy. Error -1=
9
> <...18 more repeated entries...>
> Aug 16 12:07:20 computerName kernel: usb 2-2.3: Tuner is busy. Error -1=
9
> Aug 16 12:07:10 computerName tvheadend[3276]: main: Log started
> *****
> "w_scan" behaves the same way.
>
> *****


I don't have a "woodbury", but I have a Hauppauge 950Q sitting around
and tested it on latest mainline kernel. w_scan is ok and streaming is
fine. There's no unexpected errors. The 950Q uses the same au0828 bridge
and au8522 demod as woodbury, but a different tuner. Your problem
wouldn't appear to be a general au0828 issue.

You might have to check out git bisect. That will be the quickest way to
get to the bottom, if you've got points A and B, and are
building/running your own kernel.

Cheers,

Brad






> $ modprobe au0828
> Aug 16 12:52:52 computerName kernel: videodev: Linux video capture
> interface: v2.00
> Aug 16 12:52:52 computerName kernel: au0828: au0828_init() Debugging is=
 enabled
> Aug 16 12:52:52 computerName kernel: au0828: au0828 driver loaded
> Aug 16 12:52:52 computerName kernel: au0828: au0828_usb_probe() vendor
> id 0x5e1 device id 0x400 ifnum:0
> Aug 16 12:52:52 computerName kernel: au0828: au0828_gpio_setup()
> Aug 16 12:52:52 computerName kernel: au0828: au0828_i2c_register()
> Aug 16 12:52:52 computerName kernel: au0828: i2c bus registered
> Aug 16 12:52:52 computerName kernel: au0828: au0828_card_setup()
> Aug 16 12:52:52 computerName kernel: tveeprom: Encountered bad packet
> header [20]. Corrupt or not a Hauppauge eeprom.
> Aug 16 12:52:52 computerName kernel: au0828: hauppauge_eeprom:
> warning: unknown hauppauge model #0
> Aug 16 12:52:52 computerName kernel: au0828: hauppauge_eeprom:
> hauppauge eeprom: model=3D0
> Aug 16 12:52:52 computerName kernel: au0828: au0828_analog_register
> called for intf#0!
> Aug 16 12:52:52 computerName kernel: au0828: au0828_dvb_register()
> Aug 16 12:52:52 computerName kernel: au8522 7-0047: creating new instan=
ce
> Aug 16 12:52:52 computerName kernel: tda18271 7-0060: creating new inst=
ance
> Aug 16 12:52:52 computerName kernel: tda18271: TDA18271HD/C2 detected @=
 7-0060
> Aug 16 12:52:53 computerName kernel: au0828: dvb_register()
> Aug 16 12:52:53 computerName kernel: dvbdev: DVB: registering new
> adapter (au0828)
> Aug 16 12:52:53 computerName kernel: usb 2-2.3: DVB: registering
> adapter 0 frontend 0 (Auvitek AU8522 QAM/8VSB Frontend)...
> Aug 16 12:52:53 computerName kernel: dvbdev: dvb_create_media_entity:
> media entity 'Auvitek AU8522 QAM/8VSB Frontend' registered.
> Aug 16 12:52:53 computerName kernel: dvbdev: dvb_create_media_entity:
> media entity 'dvb-demux' registered.
> Aug 16 12:52:53 computerName kernel: au0828: Registered device AU0828
> [Hauppauge Woodbury]
> Aug 16 12:52:53 computerName kernel: usbcore: registered new interface
> driver au0828
> *****
> The "eeprom" thing has never been an issue with regard to my tuner
> working. It still worked in spite of it.
>
> It's odd because:
> *****
> $ lsmod | grep au0828
> au0828                 86016  0
> tveeprom               28672  1 au0828
> dvb_core              176128  1 au0828
> v4l2_common            20480  1 au0828
> videobuf2_vmalloc      20480  2 dvb_core,au0828
> videobuf2_v4l2         28672  1 au0828
> videobuf2_common       61440  3 videobuf2_v4l2,dvb_core,au0828
> videodev              253952  4
> v4l2_common,videobuf2_v4l2,videobuf2_common,au0828
> rc_core                61440  1 au0828
> media                  61440  6
> videodev,snd_usb_audio,videobuf2_v4l2,dvb_core,videobuf2_common,au0828
>
> $ ls -la /dev/dvb/adapter0/
> total 0
> drwxr-xr-x  2 root root     120 Aug 16 12:01 .
> drwxr-xr-x  3 root root      60 Aug 16 12:01 ..
> crw-rw----+ 1 root video 212, 4 Aug 16 12:01 demux0
> crw-rw----+ 1 root video 212, 5 Aug 16 12:01 dvr0
> crw-rw----+ 1 root video 212, 3 Aug 16 12:01 frontend0
> crw-rw----+ 1 root video 212, 7 Aug 16 12:01 net0
> *****
>
> The previous kernel version I was on that worked was 5.1.15.
> I just reverted back to the previous version and it's working again.
> I don't know what broke and where, between the versions.
>
> I saw https://lkml.org/lkml/2019/1/21/1020 but this is back in January
> so I don't know if something was more recently applied to au0828 that
> makes use of the API.
> "lsof" didn't show anything related to "/dev/dvb" being used.
>
> Oh neat! Someone posted a neat git feature which I tried and I get:
> *****
> $ git log --graph --pretty=3Dformat:'%Cred%h%Creset -%C(yellow)%d%Crese=
t
> %s %Cgreen(%cr)%Creset' --abbrev-commit --date=3Drelative
> v5.1.15..v5.2.8 drivers/media/usb/au0828/
> * be50f19fee84 - media: au0828: fix null dereference in error path (12 =
days ago)
> * c942fddf8793 - treewide: Replace GPLv2 boilerplate/reference with
> SPDX - rule 157 (3 months ago)
> * 16216333235a - treewide: Replace GPLv2 boilerplate/reference with
> SPDX - rule 1 (3 months ago)
> * ec8f24b7faaf - treewide: Add SPDX license identifier -
> Makefile/Kconfig (3 months ago)
> * 14340de506c9 - media: prefix header search paths with $(srctree)/ (3
> months ago)
> * f604f0f5afb8 - media: au0828: stop video streaming only when last
> user stops (4 months ago)
> * 898bc40bfcc2 - media: au0828: Fix NULL pointer dereference in
> au0828_analog_stream_enable() (4 months ago)
> * 383b0e5b6ebb - media: au0828: fix enable and disable source audio
> and video inconsistencies (4 months ago)
> * 812658d88d26 - media: change au0828 to use Media Device Allocator
> API (4 months ago)
> * b60a5b8dcf49 - media: Kconfig files: use the right help coding style
> (5 months ago)
> * f712e5358d43 - media: au0828: minor fix to a misleading comment in
> _close() (5 months ago)
> *****
> Note the 812658d88d26 commit.
> So if I did the git command correctly, then it WAS added between these =
versions.
> Any thoughts on if it is broken or if I can hack in a fix to force it
> to ignore it being thought as being busy?

