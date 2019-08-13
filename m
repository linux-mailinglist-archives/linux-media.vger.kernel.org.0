Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECFA08C10C
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 20:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbfHMSso (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 14:48:44 -0400
Received: from egyptian.birch.relay.mailchannels.net ([23.83.209.56]:62353
        "EHLO egyptian.birch.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727721AbfHMSso (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 14:48:44 -0400
X-Sender-Id: dreamhost|x-authsender|brad@b-rad.cc
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 1D7D634328C;
        Tue, 13 Aug 2019 18:48:41 +0000 (UTC)
Received: from pdx1-sub0-mail-a47.g.dreamhost.com (100-96-148-111.trex.outbound.svc.cluster.local [100.96.148.111])
        (Authenticated sender: dreamhost)
        by relay.mailchannels.net (Postfix) with ESMTPA id 4A92E343272;
        Tue, 13 Aug 2019 18:48:40 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|brad@b-rad.cc
Received: from pdx1-sub0-mail-a47.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:2500 (trex/5.17.5);
        Tue, 13 Aug 2019 18:48:41 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|brad@b-rad.cc
X-MailChannels-Auth-Id: dreamhost
X-Attack-Coil: 7f79ffc2625a2aee_1565722120875_1259897381
X-MC-Loop-Signature: 1565722120874:2696070897
X-MC-Ingress-Time: 1565722120874
Received: from pdx1-sub0-mail-a47.g.dreamhost.com (localhost [127.0.0.1])
        by pdx1-sub0-mail-a47.g.dreamhost.com (Postfix) with ESMTP id 0B5867F152;
        Tue, 13 Aug 2019 11:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=nextdimension.cc; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=
        nextdimension.cc; bh=VaBStVepHcZHe2FemoOuMBmbBa0=; b=guSIC+Nn+zq
        9RBxzpe6yNT93HOa8I0OEFwxVCFKRg5RvNce6hSxKfyKKD816y39mAs8FuG1++d+
        DpTnmxxtCCWeFcN0tNGBJ1G2rM4184tkc+dDsZwWNvsOtQhpN5nMYvT26XXprIzl
        WvD0aSYpHBBKqjofkFM0z4TfTOzTbG8c=
Received: from [192.168.0.21] (67-198-57-188.static.grandenetworks.net [67.198.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: brad@b-rad.cc)
        by pdx1-sub0-mail-a47.g.dreamhost.com (Postfix) with ESMTPSA id 0D4527F14D;
        Tue, 13 Aug 2019 11:48:35 -0700 (PDT)
Subject: Re: [PATCH] media: em28xx: modules workqueue not inited for 2nd
 device
To:     Sean Young <sean@mess.org>, Brad Love <brad@nextdimension.cc>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        syzbot <syzbot+b7f57261c521087d89bb@syzkaller.appspotmail.com>,
        andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
References: <0000000000004bcc0d058faf01c4@google.com>
 <20190811051110.hsdwmjrbvqgrmssc@gofer.mess.org>
 <614221186ed37383778d8890d39e829a0e924796.camel@collabora.com>
 <20190813091059.6ec46psv67y7msef@gofer.mess.org>
X-DH-BACKEND: pdx1-sub0-mail-a47
From:   Brad Love <brad@nextdimension.cc>
Openpgp: preference=signencrypt
Autocrypt: addr=brad@nextdimension.cc; prefer-encrypt=mutual; keydata=
 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
Message-ID: <2a716666-ed08-3c64-1c16-1c34afed6de4@nextdimension.cc>
Date:   Tue, 13 Aug 2019 13:48:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190813091059.6ec46psv67y7msef@gofer.mess.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-VR-OUT-STATUS: OK
X-VR-OUT-SCORE: -90
X-VR-OUT-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddruddviedguddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucggtfgfnhhsuhgsshgtrhhisggvpdfftffgtefojffquffvnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddutddmnecujfgurhepuffvfhfhkffffgggjggtgfesthhqredttdefjeenucfhrhhomhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqeenucfkphepieejrdduleekrdehjedrudekkeenucfrrghrrghmpehmohguvgepshhmthhppdhhvghloheplgduledvrdduieekrddtrddvudgnpdhinhgvthepieejrdduleekrdehjedrudekkedprhgvthhurhhnqdhprghthhepuehrrgguucfnohhvvgcuoegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtqedpmhgrihhlfhhrohhmpegsrhgrugesnhgvgihtughimhgvnhhsihhonhdrtggtpdhnrhgtphhtthhopehsvggrnhesmhgvshhsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Sean,


On 13/08/2019 04.10, Sean Young wrote:
> Hi Brad,
>
> On Mon, Aug 12, 2019 at 10:21:39AM -0300, Ezequiel Garcia wrote:
>> On Sun, 2019-08-11 at 06:11 +0100, Sean Young wrote:
>>> syzbot reports an error on flush_request_modules() for the second dev=
ice.
>>> This workqueue was never initialised so simply remove the offending l=
ine.
>>>
>>> usb 1-1: USB disconnect, device number 2
>>> em28xx 1-1:1.153: Disconnecting em28xx #1
>>> ------------[ cut here ]------------
>>> WARNING: CPU: 0 PID: 12 at kernel/workqueue.c:3031
>>> __flush_work.cold+0x2c/0x36 kernel/workqueue.c:3031
>>> Kernel panic - not syncing: panic_on_warn set ...
>>> CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.3.0-rc2+ #25
>>> Hardware name: Google Google Compute Engine/Google Compute Engine, BI=
OS
>>> Google 01/01/2011
>>> Workqueue: usb_hub_wq hub_event
>>> Call Trace:
>>>   __dump_stack lib/dump_stack.c:77 [inline]
>>>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>>>   panic+0x2a3/0x6da kernel/panic.c:219
>>>   __warn.cold+0x20/0x4a kernel/panic.c:576
>>>   report_bug+0x262/0x2a0 lib/bug.c:186
>>>   fixup_bug arch/x86/kernel/traps.c:179 [inline]
>>>   fixup_bug arch/x86/kernel/traps.c:174 [inline]
>>>   do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
>>>   do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
>>>   invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1026
>>> RIP: 0010:__flush_work.cold+0x2c/0x36 kernel/workqueue.c:3031
>>> Code: 9a 22 00 48 c7 c7 20 e4 c5 85 e8 d9 3a 0d 00 0f 0b 45 31 e4 e9 =
98 86
>>> ff ff e8 51 9a 22 00 48 c7 c7 20 e4 c5 85 e8 be 3a 0d 00 <0f> 0b 45 3=
1 e4
>>> e9 7d 86 ff ff e8 36 9a 22 00 48 c7 c7 20 e4 c5 85
>>> RSP: 0018:ffff8881da20f720 EFLAGS: 00010286
>>> RAX: 0000000000000024 RBX: dffffc0000000000 RCX: 0000000000000000
>>> RDX: 0000000000000000 RSI: ffffffff8128a0fd RDI: ffffed103b441ed6
>>> RBP: ffff8881da20f888 R08: 0000000000000024 R09: fffffbfff11acd9a
>>> R10: fffffbfff11acd99 R11: ffffffff88d66ccf R12: 0000000000000000
>>> R13: 0000000000000001 R14: ffff8881c6685df8 R15: ffff8881d2a85b78
>>>   flush_request_modules drivers/media/usb/em28xx/em28xx-cards.c:3325 =
[inline]
>>>   em28xx_usb_disconnect.cold+0x280/0x2a6
>>> drivers/media/usb/em28xx/em28xx-cards.c:4023
>>>   usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
>>>   __device_release_driver drivers/base/dd.c:1120 [inline]
>>>   device_release_driver_internal+0x404/0x4c0 drivers/base/dd.c:1151
>>>   bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
>>>   device_del+0x420/0xb10 drivers/base/core.c:2288
>>>   usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
>>>   usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2199
>>>   hub_port_connect drivers/usb/core/hub.c:4949 [inline]
>>>   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
>>>   port_event drivers/usb/core/hub.c:5359 [inline]
>>>   hub_event+0x1454/0x3640 drivers/usb/core/hub.c:5441
>>>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>>>   process_scheduled_works kernel/workqueue.c:2331 [inline]
>>>   worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
>>>   kthread+0x318/0x420 kernel/kthread.c:255
>>>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>>> Kernel Offset: disabled
>>> Rebooting in 86400 seconds..
>>>
>>> Reported-by: syzbot+b7f57261c521087d89bb@syzkaller.appspotmail.com
>>> Signed-off-by: Sean Young <sean@mess.org>
>> I reviewed the syzbot report, but was left head-scratching and
>> failing to see how the module-loading worker was supposed to be used :=
-)
>>
>> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
>>
>> Also, this seems a bug, so how about this tag?
>>
>> Fixes: be7fd3c3a8c5e ("media: em28xx: Hauppauge DualHD second tuner fu=
nctionality)
> Would you mind reviewing this change please Brad? You added the dual_ts=

> feature to the driver so it would be good to have your view on this.
>
> Thanks
> Sean


Hmmm. I've never encountered this oops, nor had it reported to me. Looks
like the second device indeed never calls request_modules, and when I
did the cleanup I just duplicated all the teardown. Since everything
works without the second workqueue already, I don't think the second
device needs to initialize it's own. So, I think your solution is proper.=



Reviewed-by: Brad Love <brad@nextdimension.cc>



>>> ---
>>>  drivers/media/usb/em28xx/em28xx-cards.c | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/=
usb/em28xx/em28xx-cards.c
>>> index 6e33782c3ca6..5983e72a0622 100644
>>> --- a/drivers/media/usb/em28xx/em28xx-cards.c
>>> +++ b/drivers/media/usb/em28xx/em28xx-cards.c
>>> @@ -4019,7 +4019,6 @@ static void em28xx_usb_disconnect(struct usb_in=
terface *intf)
>>>  		dev->dev_next->disconnected =3D 1;
>>>  		dev_info(&dev->intf->dev, "Disconnecting %s\n",
>>>  			 dev->dev_next->name);
>>> -		flush_request_modules(dev->dev_next);
>>>  	}
>>> =20
>>>  	dev->disconnected =3D 1;

