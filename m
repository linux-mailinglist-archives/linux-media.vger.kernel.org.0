Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDCF66BBD9
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2019 13:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbfGQLvF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jul 2019 07:51:05 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33952 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfGQLvE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jul 2019 07:51:04 -0400
Received: by mail-pg1-f194.google.com with SMTP id n9so4829835pgc.1
        for <linux-media@vger.kernel.org>; Wed, 17 Jul 2019 04:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BT3GMkq4GIjy027YHLDtJdq+Rfg7/G7Q187ry/Wlyhg=;
        b=Y77N3nWXhja+UsOPgMcVd7MhrNHtJUgZUpGEBMUH7f70Xb00PuFFJ586QBvk4MAr15
         jk3Z9Q6t5Wq956KWm0PXVUuRjuRc1HM6AmSDY6w/A8R9ws7/QUWWKURiPSP9lkHfiSnv
         iWG0ueOWObAeLwglNHb5XZzVL+Y12HELvolEReuRvbpn94ZhxcHzuV7bz4TorNrjSumL
         +Zj122E2SsWqjg/L3JTzKcZ7WwSNo72GlHK1HiQ45bsCy1gi3H4UF7QNap2mjD1mH81q
         pzo7p4Aswi0WzpqZoN3iNwKzUYi+JW8pMYgTB4+qqmLAx0lTq5HPagvDV54JsfAvk4ba
         x6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BT3GMkq4GIjy027YHLDtJdq+Rfg7/G7Q187ry/Wlyhg=;
        b=ZP7tEBmY4+NS/hRFC4D6RoQDD9HBB2x0TFElkMPQa5D34UsL68lhXM4TccOfYuHo4D
         plLoHlXd9/vQ5frEUywKOv+qFpV5s6mD8k626RBr1nJmT50JrDpOUL/fxJRe10+9Zfda
         /WaUgB1l0Cloq4i8V7DZu3333Mk5v3i2AI9Xu9f3BBlzGl1IS0kEGt1AZzN0+yURamAF
         tT0c3TRB8UYFgbI1d6T6XW6JslLNlOF4hhLFIhNBOVhZtMz/Jp5E2NWsTJwylJhCdFsL
         u0N/MjEPq8G593QPx+m/rGvbsgikRMjoSWV+0rf8EjFZQo5CQ6stRhHMVl0reLprfk3t
         hICQ==
X-Gm-Message-State: APjAAAVfl/DMz9H3uRKiVym0f3hDv3YzPSA/jAE2eGvQN8/F5iHZ6H+X
        skGrCWaQn74ARP8Ewj/Yj9w0AtGf9Aqq8XKmf9H7kg==
X-Google-Smtp-Source: APXvYqyPoKfFzoxmu8FLTIEyyLVq7NQy+peU8ZfyeP+M7Yyn8Yimphae8KkPOHTDfv1lUahfT0+wvX7W4bamIkUkCQc=
X-Received: by 2002:a63:f312:: with SMTP id l18mr41065583pgh.440.1563364263465;
 Wed, 17 Jul 2019 04:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000717347058d56dcc2@google.com>
In-Reply-To: <000000000000717347058d56dcc2@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 17 Jul 2019 13:50:52 +0200
Message-ID: <CAAeHK+zPDgvDr_Bao9dz_7hGEg+Ud6-tj7pZaihKeYHJ8M386Q@mail.gmail.com>
Subject: Re: KASAN: global-out-of-bounds Read in dvb_pll_attach
To:     syzbot <syzbot+8a8f48672560c8ca59dd@syzkaller.appspotmail.com>,
        bnvandana@gmail.com
Cc:     allison@lohutok.net, hverkuil-cisco@xs4all.nl,
        LKML <linux-kernel@vger.kernel.org>, linux-media@vger.kernel.org,
        USB list <linux-usb@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        rfontana@redhat.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>, tskd08@gmail.com
Content-Type: multipart/mixed; boundary="00000000000094a173058ddf1b3a"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--00000000000094a173058ddf1b3a
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 10, 2019 at 7:18 PM syzbot
<syzbot+8a8f48672560c8ca59dd@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    7829a896 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=150f8c47a00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f6d4561982f71f63
> dashboard link: https://syzkaller.appspot.com/bug?extid=8a8f48672560c8ca59dd
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16384e27a00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16056038600000

You need to keep the bot in the recipients and also USB bugs can only
be tested on the usb-fuzzer tree.

#syz test: https://github.com/google/kasan.git usb-fuzzer

>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+8a8f48672560c8ca59dd@syzkaller.appspotmail.com
>
> usb 1-1: dvb_usb_v2: will pass the complete MPEG2 transport stream to the
> software demuxer
> dvbdev: DVB: registering new adapter (774 Friio White ISDB-T USB2.0)
> usb 1-1: media controller created
> dvbdev: dvb_create_media_entity: media entity 'dvb-demux' registered.
> tc90522 0-0018: Toshiba TC90522 attached.
> usb 1-1: DVB: registering adapter 0 frontend 0 (Toshiba TC90522 ISDB-T
> module)...
> dvbdev: dvb_create_media_entity: media entity 'Toshiba TC90522 ISDB-T
> module' registered.
> ==================================================================
> BUG: KASAN: global-out-of-bounds in dvb_pll_attach+0x6c5/0x830
> drivers/media/dvb-frontends/dvb-pll.c:798
> Read of size 4 at addr ffffffff89c9e5e0 by task kworker/0:1/12
>
> CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.2.0-rc6+ #13
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   print_address_description+0x67/0x231 mm/kasan/report.c:188
>   __kasan_report.cold+0x1a/0x32 mm/kasan/report.c:317
>   kasan_report+0xe/0x20 mm/kasan/common.c:614
>   dvb_pll_attach+0x6c5/0x830 drivers/media/dvb-frontends/dvb-pll.c:798
>   dvb_pll_probe+0xfe/0x174 drivers/media/dvb-frontends/dvb-pll.c:877
>   i2c_device_probe+0x790/0xaa0 drivers/i2c/i2c-core-base.c:389
>   really_probe+0x281/0x660 drivers/base/dd.c:509
>   driver_probe_device+0x104/0x210 drivers/base/dd.c:670
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
>   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:843
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2111
>   i2c_new_client_device+0x5b3/0xc40 drivers/i2c/i2c-core-base.c:778
>   i2c_new_device+0x19/0x50 drivers/i2c/i2c-core-base.c:821
>   dvb_module_probe+0xf9/0x220 drivers/media/dvb-core/dvbdev.c:985
>   friio_tuner_attach+0x125/0x1d0 drivers/media/usb/dvb-usb-v2/gl861.c:536
>   dvb_usbv2_adapter_frontend_init
> drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:675 [inline]
>   dvb_usbv2_adapter_init drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:804
> [inline]
>   dvb_usbv2_init drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:865 [inline]
>   dvb_usbv2_probe.cold+0x24dc/0x255d
> drivers/media/usb/dvb-usb-v2/dvb_usb_core.c:980
>   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
>   really_probe+0x281/0x660 drivers/base/dd.c:509
>   driver_probe_device+0x104/0x210 drivers/base/dd.c:670
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
>   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:843
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2111
>   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>   really_probe+0x281/0x660 drivers/base/dd.c:509
>   driver_probe_device+0x104/0x210 drivers/base/dd.c:670
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
>   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:843
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2111
>   usb_new_device.cold+0x8c1/0x1016 drivers/usb/core/hub.c:2534
>   hub_port_connect drivers/usb/core/hub.c:5089 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
>   port_event drivers/usb/core/hub.c:5350 [inline]
>   hub_event+0x1ada/0x3590 drivers/usb/core/hub.c:5432
>   process_one_work+0x905/0x1570 kernel/workqueue.c:2269
>   process_scheduled_works kernel/workqueue.c:2331 [inline]
>   worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
>   kthread+0x30b/0x410 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> The buggy address belongs to the variable:
>   id+0x100/0x120
>
> Memory state around the buggy address:
>   ffffffff89c9e480: fa fa fa fa 00 00 fa fa fa fa fa fa 00 00 00 00
>   ffffffff89c9e500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > ffffffff89c9e580: 00 00 00 00 00 00 00 00 00 00 00 00 fa fa fa fa
>                                                         ^
>   ffffffff89c9e600: 04 fa fa fa fa fa fa fa 04 fa fa fa fa fa fa fa
>   ffffffff89c9e680: 04 fa fa fa fa fa fa fa 04 fa fa fa fa fa fa fa
> ==================================================================
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches

--00000000000094a173058ddf1b3a
Content-Type: text/x-patch; charset="US-ASCII"; name="usb-dvb.patch"
Content-Disposition: attachment; filename="usb-dvb.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jy76ow6t0>
X-Attachment-Id: f_jy76ow6t0

RnJvbSBlOWY5MmYyNjdmMGM2ODI0ZGQxMjlkNjg4YWM3ZDFlNjlhNmQ2ZTMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiB2YW5kYW5hYm4gPGJudmFuZGFuYUBnbWFpbC5jb20+CkRhdGU6
IFdlZCwgMTcgSnVsIDIwMTkgMDE6MzQ6MjcgKzA1MzAKU3ViamVjdDogW1BBVENIXSBtZWRpYTpk
dmItZnJvbnRlbmQ6IGZpeCBzeXpib3QgZ2xvYmFsIG91dCBvZiBib3VuZHMgaXNzdWUuCgpSZXBv
cnRlZC1ieTogc3l6Ym90KzhhOGY0ODY3MjU2MGM4Y2E1OWRkQHN5emthbGxlci5hcHBzcG90bWFp
bC5jb20KCnVzYiAxLTE6IGR2Yl91c2JfdjI6IHdpbGwgcGFzcyB0aGUgY29tcGxldGUgTVBFRzIg
dHJhbnNwb3J0IHN0cmVhbSB0byB0aGUKc29mdHdhcmUgZGVtdXhlcgpkdmJkZXY6IERWQjogcmVn
aXN0ZXJpbmcgbmV3IGFkYXB0ZXIgKDc3NCBGcmlpbyBXaGl0ZSBJU0RCLVQgVVNCMi4wKQp1c2Ig
MS0xOiBtZWRpYSBjb250cm9sbGVyIGNyZWF0ZWQKZHZiZGV2OiBkdmJfY3JlYXRlX21lZGlhX2Vu
dGl0eTogbWVkaWEgZW50aXR5ICdkdmItZGVtdXgnIHJlZ2lzdGVyZWQuCnRjOTA1MjIgMC0wMDE4
OiBUb3NoaWJhIFRDOTA1MjIgYXR0YWNoZWQuCnVzYiAxLTE6IERWQjogcmVnaXN0ZXJpbmcgYWRh
cHRlciAwIGZyb250ZW5kIDAgKFRvc2hpYmEgVEM5MDUyMiBJU0RCLVQKbW9kdWxlKS4uLgpkdmJk
ZXY6IGR2Yl9jcmVhdGVfbWVkaWFfZW50aXR5OiBtZWRpYSBlbnRpdHkgJ1Rvc2hpYmEgVEM5MDUy
MiBJU0RCLVQKbW9kdWxlJyByZWdpc3RlcmVkLgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KQlVHOiBLQVNBTjogZ2xvYmFs
LW91dC1vZi1ib3VuZHMgaW4gZHZiX3BsbF9hdHRhY2grMHg2YzUvMHg4MzAKZHJpdmVycy9tZWRp
YS9kdmItZnJvbnRlbmRzL2R2Yi1wbGwuYzo3OTgKUmVhZCBvZiBzaXplIDQgYXQgYWRkciBmZmZm
ZmZmZjg5YzllNWUwIGJ5IHRhc2sga3dvcmtlci8wOjEvMTIKCkNQVTogMCBQSUQ6IDEyIENvbW06
IGt3b3JrZXIvMDoxIE5vdCB0YWludGVkIDUuMi4wLXJjNisgIzEzCkhhcmR3YXJlIG5hbWU6IEdv
b2dsZSBHb29nbGUgQ29tcHV0ZSBFbmdpbmUvR29vZ2xlIENvbXB1dGUgRW5naW5lLCBCSU9TCkdv
b2dsZSAwMS8wMS8yMDExCldvcmtxdWV1ZTogdXNiX2h1Yl93cSBodWJfZXZlbnQKQ2FsbCBUcmFj
ZToKICBfX2R1bXBfc3RhY2sgbGliL2R1bXBfc3RhY2suYzo3NyBbaW5saW5lXQogIGR1bXBfc3Rh
Y2srMHhjYS8weDEzZSBsaWIvZHVtcF9zdGFjay5jOjExMwogIHByaW50X2FkZHJlc3NfZGVzY3Jp
cHRpb24rMHg2Ny8weDIzMSBtbS9rYXNhbi9yZXBvcnQuYzoxODgKICBfX2thc2FuX3JlcG9ydC5j
b2xkKzB4MWEvMHgzMiBtbS9rYXNhbi9yZXBvcnQuYzozMTcKICBrYXNhbl9yZXBvcnQrMHhlLzB4
MjAgbW0va2FzYW4vY29tbW9uLmM6NjE0CiAgZHZiX3BsbF9hdHRhY2grMHg2YzUvMHg4MzAgZHJp
dmVycy9tZWRpYS9kdmItZnJvbnRlbmRzL2R2Yi1wbGwuYzo3OTgKICBkdmJfcGxsX3Byb2JlKzB4
ZmUvMHgxNzQgZHJpdmVycy9tZWRpYS9kdmItZnJvbnRlbmRzL2R2Yi1wbGwuYzo4NzcKICBpMmNf
ZGV2aWNlX3Byb2JlKzB4NzkwLzB4YWEwIGRyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYzozODkK
ICByZWFsbHlfcHJvYmUrMHgyODEvMHg2NjAgZHJpdmVycy9iYXNlL2RkLmM6NTA5CiAgZHJpdmVy
X3Byb2JlX2RldmljZSsweDEwNC8weDIxMCBkcml2ZXJzL2Jhc2UvZGQuYzo2NzAKICBfX2Rldmlj
ZV9hdHRhY2hfZHJpdmVyKzB4MWMyLzB4MjIwIGRyaXZlcnMvYmFzZS9kZC5jOjc3NwogIGJ1c19m
b3JfZWFjaF9kcnYrMHgxNWMvMHgxZTAgZHJpdmVycy9iYXNlL2J1cy5jOjQ1NAogIF9fZGV2aWNl
X2F0dGFjaCsweDIxNy8weDM2MCBkcml2ZXJzL2Jhc2UvZGQuYzo4NDMKICBidXNfcHJvYmVfZGV2
aWNlKzB4MWU0LzB4MjkwIGRyaXZlcnMvYmFzZS9idXMuYzo1MTQKICBkZXZpY2VfYWRkKzB4YWU2
LzB4MTZmMCBkcml2ZXJzL2Jhc2UvY29yZS5jOjIxMTEKICBpMmNfbmV3X2NsaWVudF9kZXZpY2Ur
MHg1YjMvMHhjNDAgZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jOjc3OAogIGkyY19uZXdfZGV2
aWNlKzB4MTkvMHg1MCBkcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmM6ODIxCiAgZHZiX21vZHVs
ZV9wcm9iZSsweGY5LzB4MjIwIGRyaXZlcnMvbWVkaWEvZHZiLWNvcmUvZHZiZGV2LmM6OTg1CiAg
ZnJpaW9fdHVuZXJfYXR0YWNoKzB4MTI1LzB4MWQwIGRyaXZlcnMvbWVkaWEvdXNiL2R2Yi11c2It
djIvZ2w4NjEuYzo1MzYKICBkdmJfdXNidjJfYWRhcHRlcl9mcm9udGVuZF9pbml0CmRyaXZlcnMv
bWVkaWEvdXNiL2R2Yi11c2ItdjIvZHZiX3VzYl9jb3JlLmM6Njc1IFtpbmxpbmVdCiAgZHZiX3Vz
YnYyX2FkYXB0ZXJfaW5pdCBkcml2ZXJzL21lZGlhL3VzYi9kdmItdXNiLXYyL2R2Yl91c2JfY29y
ZS5jOjgwNApbaW5saW5lXQogIGR2Yl91c2J2Ml9pbml0IGRyaXZlcnMvbWVkaWEvdXNiL2R2Yi11
c2ItdjIvZHZiX3VzYl9jb3JlLmM6ODY1IFtpbmxpbmVdCiAgZHZiX3VzYnYyX3Byb2JlLmNvbGQr
MHgyNGRjLzB4MjU1ZApkcml2ZXJzL21lZGlhL3VzYi9kdmItdXNiLXYyL2R2Yl91c2JfY29yZS5j
Ojk4MAogIHVzYl9wcm9iZV9pbnRlcmZhY2UrMHgzMDUvMHg3YTAgZHJpdmVycy91c2IvY29yZS9k
cml2ZXIuYzozNjEKICByZWFsbHlfcHJvYmUrMHgyODEvMHg2NjAgZHJpdmVycy9iYXNlL2RkLmM6
NTA5CiAgZHJpdmVyX3Byb2JlX2RldmljZSsweDEwNC8weDIxMCBkcml2ZXJzL2Jhc2UvZGQuYzo2
NzAKICBfX2RldmljZV9hdHRhY2hfZHJpdmVyKzB4MWMyLzB4MjIwIGRyaXZlcnMvYmFzZS9kZC5j
Ojc3NwogIGJ1c19mb3JfZWFjaF9kcnYrMHgxNWMvMHgxZTAgZHJpdmVycy9iYXNlL2J1cy5jOjQ1
NAogIF9fZGV2aWNlX2F0dGFjaCsweDIxNy8weDM2MCBkcml2ZXJzL2Jhc2UvZGQuYzo4NDMKICBi
dXNfcHJvYmVfZGV2aWNlKzB4MWU0LzB4MjkwIGRyaXZlcnMvYmFzZS9idXMuYzo1MTQKICBkZXZp
Y2VfYWRkKzB4YWU2LzB4MTZmMCBkcml2ZXJzL2Jhc2UvY29yZS5jOjIxMTEKICB1c2Jfc2V0X2Nv
bmZpZ3VyYXRpb24rMHhkZjYvMHgxNjcwIGRyaXZlcnMvdXNiL2NvcmUvbWVzc2FnZS5jOjIwMjMK
ICBnZW5lcmljX3Byb2JlKzB4OWQvMHhkNSBkcml2ZXJzL3VzYi9jb3JlL2dlbmVyaWMuYzoyMTAK
ICB1c2JfcHJvYmVfZGV2aWNlKzB4OTkvMHgxMDAgZHJpdmVycy91c2IvY29yZS9kcml2ZXIuYzoy
NjYKICByZWFsbHlfcHJvYmUrMHgyODEvMHg2NjAgZHJpdmVycy9iYXNlL2RkLmM6NTA5CiAgZHJp
dmVyX3Byb2JlX2RldmljZSsweDEwNC8weDIxMCBkcml2ZXJzL2Jhc2UvZGQuYzo2NzAKICBfX2Rl
dmljZV9hdHRhY2hfZHJpdmVyKzB4MWMyLzB4MjIwIGRyaXZlcnMvYmFzZS9kZC5jOjc3NwogIGJ1
c19mb3JfZWFjaF9kcnYrMHgxNWMvMHgxZTAgZHJpdmVycy9iYXNlL2J1cy5jOjQ1NAogIF9fZGV2
aWNlX2F0dGFjaCsweDIxNy8weDM2MCBkcml2ZXJzL2Jhc2UvZGQuYzo4NDMKICBidXNfcHJvYmVf
ZGV2aWNlKzB4MWU0LzB4MjkwIGRyaXZlcnMvYmFzZS9idXMuYzo1MTQKICBkZXZpY2VfYWRkKzB4
YWU2LzB4MTZmMCBkcml2ZXJzL2Jhc2UvY29yZS5jOjIxMTEKICB1c2JfbmV3X2RldmljZS5jb2xk
KzB4OGMxLzB4MTAxNiBkcml2ZXJzL3VzYi9jb3JlL2h1Yi5jOjI1MzQKICBodWJfcG9ydF9jb25u
ZWN0IGRyaXZlcnMvdXNiL2NvcmUvaHViLmM6NTA4OSBbaW5saW5lXQogIGh1Yl9wb3J0X2Nvbm5l
Y3RfY2hhbmdlIGRyaXZlcnMvdXNiL2NvcmUvaHViLmM6NTIwNCBbaW5saW5lXQogIHBvcnRfZXZl
bnQgZHJpdmVycy91c2IvY29yZS9odWIuYzo1MzUwIFtpbmxpbmVdCiAgaHViX2V2ZW50KzB4MWFk
YS8weDM1OTAgZHJpdmVycy91c2IvY29yZS9odWIuYzo1NDMyCiAgcHJvY2Vzc19vbmVfd29yaysw
eDkwNS8weDE1NzAga2VybmVsL3dvcmtxdWV1ZS5jOjIyNjkKICBwcm9jZXNzX3NjaGVkdWxlZF93
b3JrcyBrZXJuZWwvd29ya3F1ZXVlLmM6MjMzMSBbaW5saW5lXQogIHdvcmtlcl90aHJlYWQrMHg3
YWIvMHhlMjAga2VybmVsL3dvcmtxdWV1ZS5jOjI0MTcKICBrdGhyZWFkKzB4MzBiLzB4NDEwIGtl
cm5lbC9rdGhyZWFkLmM6MjU1CiAgcmV0X2Zyb21fZm9yaysweDI0LzB4MzAgYXJjaC94ODYvZW50
cnkvZW50cnlfNjQuUzozNTIKClRoZSBidWdneSBhZGRyZXNzIGJlbG9uZ3MgdG8gdGhlIHZhcmlh
YmxlOgogIGlkKzB4MTAwLzB4MTIwCgpNZW1vcnkgc3RhdGUgYXJvdW5kIHRoZSBidWdneSBhZGRy
ZXNzOgogIGZmZmZmZmZmODljOWU0ODA6IGZhIGZhIGZhIGZhIDAwIDAwIGZhIGZhIGZhIGZhIGZh
IGZhIDAwIDAwIDAwIDAwCiAgZmZmZmZmZmY4OWM5ZTUwMDogMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAKPiBmZmZmZmZmZjg5YzllNTgwOiAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCBmYSBmYSBmYSBmYQogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KICBmZmZmZmZmZjg5YzllNjAw
OiAwNCBmYSBmYSBmYSBmYSBmYSBmYSBmYSAwNCBmYSBmYSBmYSBmYSBmYSBmYSBmYQogIGZmZmZm
ZmZmODljOWU2ODA6IDA0IGZhIGZhIGZhIGZhIGZhIGZhIGZhIDA0IGZhIGZhIGZhIGZhIGZhIGZh
IGZhCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQotLS0KIGRyaXZlcnMvbWVkaWEvZHZiLWZyb250ZW5kcy9kdmItcGxsLmMg
fCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvZHZiLWZyb250ZW5kcy9kdmItcGxsLmMgYi9kcml2ZXJzL21lZGlhL2R2Yi1m
cm9udGVuZHMvZHZiLXBsbC5jCmluZGV4IGJhMGM0OTEwN2JkMjhiLi4wMzJmMWIyYzJlM2FhZiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS9kdmItZnJvbnRlbmRzL2R2Yi1wbGwuYworKysgYi9k
cml2ZXJzL21lZGlhL2R2Yi1mcm9udGVuZHMvZHZiLXBsbC5jCkBAIC03ODcsNiArNzg3LDkgQEAg
c3RydWN0IGR2Yl9mcm9udGVuZCAqZHZiX3BsbF9hdHRhY2goc3RydWN0IGR2Yl9mcm9udGVuZCAq
ZmUsIGludCBwbGxfYWRkciwKIAlzdHJ1Y3QgZHZiX3BsbF9wcml2ICpwcml2ID0gTlVMTDsKIAlp
bnQgcmV0OwogCWNvbnN0IHN0cnVjdCBkdmJfcGxsX2Rlc2MgKmRlc2M7CisJCisgICAgICAgIGlm
IChkdmJfcGxsX2RldmNvdW50ID4gRFZCX1BMTF9NQVgtMSkKKyAgICAgICAgICAgICAgICByZXR1
cm4gTlVMTDsKIAogCWIxID0ga21hbGxvYygxLCBHRlBfS0VSTkVMKTsKIAlpZiAoIWIxKQo=
--00000000000094a173058ddf1b3a--
