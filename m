Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F278810E2BD
	for <lists+linux-media@lfdr.de>; Sun,  1 Dec 2019 18:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbfLARP7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Dec 2019 12:15:59 -0500
Received: from mout.gmx.net ([212.227.15.18]:37455 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726393AbfLARP6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Dec 2019 12:15:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1575220557;
        bh=WfcQmcChZbEZzMGmbvocHLIIHBtZZR03BB4jVPTY46w=;
        h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
        b=LJS1Vk3CMdrYriKCWNsGuX1ZWHQo2xEQ4TilrMS5chyIDHXvdpPJKw7bC5gO6lH3A
         u3sk6jWKCYs/Up5Bf/RInaLT351i0dqIDoPCq2vnIV+DJOWuLTus6tHO02nATel/Sc
         4LMd+lUgfJGU6AtO2NpkJX9mXTx6EcKJFIN1LD/Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.47.81] ([87.148.76.53]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTzf6-1iAPlP1KL4-00QzkJ; Sun, 01
 Dec 2019 18:15:57 +0100
To:     linux-media@vger.kernel.org
From:   "Andreas W. Wieland" <awwieland@gmx.de>
Subject: ir-ctl: invalid scancode '0x857a3a45' for protocol 'nec32'
Cc:     "Andreas W. Wieland" <awwieland@gmx.de>
Message-ID: <9ea5a12d-b981-2289-3f0a-b614378a4bda@gmx.de>
Date:   Sun, 1 Dec 2019 18:15:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LNia+34IthFc3sPcH4Db9tb8KytRyzagLhaT+Dm30Fc/EBLJaq5
 u9U6ueWEUaOFojuykzDmvOwUaexMP/WNAyR8YpFcDQ0WY/OEkKNb9hdhK42+kz9GvE0/mGx
 Kph6Se6zG+XjiVWW6fvt3RJg7geu8kuPj2qzlpZr5CkyNOtpM8vqA319PLiHMrpZe9tk1Xb
 ERv+AuGUK0dhCAIGUU/GQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:V/RQH3Di/WE=:b2O+S8RVK533OO9MOP5maK
 nmLU4mtUhzydvZDZXYHnoF3J6O3Z01FkAqvjUo7OrIwh5p19ZQpBUyEYUSzzUhslv+LbHIamJ
 fdB30PAxrwa2NRdY/UkpvrfmW8K7tKkSUPc0nS83/hfPoCYBQPe50TSRncyupYCAHomgW+zPT
 VXC4i9SJ+8+Wb9glntl8hJ9NH0ROAO3fMFxF1RlyPb1Sa8BxcH4RmMaKnnVrKgwqUKLPjuJGl
 HzsgXBVLLL6gaPqL+Rk9aGQdbGOnsHMto/inOCD1yBG6qvVjAS/x1nbz8s867eVPuR23mj8Kf
 V9vYgP1NZLmq/ZwE7AC+4ph4PgI4ks7iPRAH0+oKOFHQSpEa+PmimG8YupFDFlgXL1E5Rvsid
 /T3wE9SP3B4lU02v6YIBwwFofdBUMJuffff/XaBJhdceO2/7GXcc7LsqovPD1xad/+bqJMA0k
 HcNOhKOvWHz7jrAyE7EYav2M74EtX5aX7KfyyKff+cHgIdI7RmIWA2MSQyOOSrgR61DqW/nfi
 /GZEGjYfhDmMCBn++XlpblP92c5PU6sSPgvYUB2ZT2Fahx5+DHAQSpbJe84nUlYXdZWvuBGys
 W+D+GVFVX/Qxv0+/j21UXYN6n7CS/q9vE11vbMpQTedly+3Ut2hIEkAFgbHe0C0V4ChzV+FVm
 DPiali2pUGojiVmlocaXSc0v1tH0/hFIBB1sslRQA8rNwjNVWn3WT86ORyE8FYET6/uAR/rlW
 Oc85iGFS1EkvHkLY5yeYb2j07xKz/xr6WC6wS++8kVQNaDjMCNIWqZpG68/bsewaHuP2M6PhR
 3CCoWi6rxgtqi4cZXLVo9f/cXud6HwV4gkP3woyNgAlseQtxOe1eB/YeIcrOCtglJkRPjMf/G
 t1YS+DCCxvu/YRnGvumYotqTnT0aVblt7sVL/KsJSuO/IKL1Ys62XxT8FrSh5Rif0VRrd/CkK
 MAsicOMCyAgScUIsM7wJDsoOAXv2dDF7DDGyBDad+jKZkCE9BiJVaCejIhtEDDE+H86OotM/l
 LgFCt7ywbGm1yZcx+tM3PwUazfpsPQ7OBHREmZwG0oglQOmczV5sW27pL1mJ5szuywGmqaUA6
 1Lkrp4gD5V9cbr4j5w6tGdECMaNQ69anoIpHw4YDzpmcGQ1bXQoyH/AWvaxsKz1AOZf4fuArM
 uBIEYg7NCVkMnG6Tnmt0FFm9DRYUKG35yN5Ibz1yRP5VBAqqMGfmKlsGuTNtHVCYuJ3BvH3dP
 oYmIy6TqzN5WzJekIZZLPbOTInN/mGWFKDjCqkWlLOjSdYKZLXPNC2ixtH7U=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear Developers!

I think I have discovered a bug in ir-ctl. My application is pretty
simple: I want to change certain settings on my Yamaha surround receiver
via a Raspberry Pi. For this, I have to transmit keycodes with ir-ctl to
the Yamaha. While this works fine for most keycodes, for some keycodes
errors are thrown.

Basically, I record the scancodes of all functions that I need with
ir-keytable, and later use the recorded scancodes for transmitting, for
example:

root@raspberrypi:~# ir-keytable -v -t
Found device /sys/class/rc/rc1/
Found device /sys/class/rc/rc0/
Parsing uevent /sys/class/rc/rc0/lirc0/uevent
/sys/class/rc/rc0/lirc0/uevent uevent MAJOR=3D252
/sys/class/rc/rc0/lirc0/uevent uevent MINOR=3D0
/sys/class/rc/rc0/lirc0/uevent uevent DEVNAME=3Dlirc0
Input sysfs node is /sys/class/rc/rc0/input0/
Event sysfs node is /sys/class/rc/rc0/input0/event0/
Parsing uevent /sys/class/rc/rc0/input0/event0/uevent
/sys/class/rc/rc0/input0/event0/uevent uevent MAJOR=3D13
/sys/class/rc/rc0/input0/event0/uevent uevent MINOR=3D64
/sys/class/rc/rc0/input0/event0/uevent uevent DEVNAME=3Dinput/event0
Parsing uevent /sys/class/rc/rc0/uevent
/sys/class/rc/rc0/uevent uevent NAME=3Drc-rc6-mce
/sys/class/rc/rc0/uevent uevent DRV_NAME=3Dgpio_ir_recv
/sys/class/rc/rc0/uevent uevent DEV_NAME=3Dgpio_ir_recv
input device is /dev/input/event0
/sys/class/rc/rc0/protocols protocol rc-5 (enabled)
/sys/class/rc/rc0/protocols protocol nec (enabled)
/sys/class/rc/rc0/protocols protocol rc-6 (enabled)
/sys/class/rc/rc0/protocols protocol jvc (enabled)
/sys/class/rc/rc0/protocols protocol sony (enabled)
/sys/class/rc/rc0/protocols protocol rc-5-sz (enabled)
/sys/class/rc/rc0/protocols protocol sanyo (enabled)
/sys/class/rc/rc0/protocols protocol sharp (enabled)
/sys/class/rc/rc0/protocols protocol mce_kbd (enabled)
/sys/class/rc/rc0/protocols protocol xmp (enabled)
/sys/class/rc/rc0/protocols protocol imon (enabled)
/sys/class/rc/rc0/protocols protocol lirc (enabled)
Opening /dev/input/event0
Input Protocol version: 0x00010001
Testing events. Please, press CTRL-C to abort.
30063.090086: lirc protocol(nec32): scancode =3D 0x857a3a45
30063.140081: lirc protocol(nec32): scancode =3D 0x857a3a45 repeat
30063.250082: lirc protocol(nec32): scancode =3D 0x857a3a45 repeat

I now try to transmit exactly that keycode via ir-ctl and get an error
message. Nothing is transmitted:

root@raspberrypi:~# ir-ctl -d /dev/lirc1 -S nec32:0x857a3a45
error: invalid scancode '0x857a3a45' for protocol 'nec32'

As I said, this works fine for most of the keycodes I need, only some
cause this error message. All of the key codes that cause the error are
protocol nec32 and start with 0x8.

My hardware is a Raspberry Pi Zero (latest Raspbian Buster, freshly
updated this morning), a homebrew ir receiver with gpio_ir, a homebrew
transmitter with pwm-ir-tx and the Yamaha Remote is an RAV423 (shipped
with my RX-A3030). IR keytable and ir-ctl both have version number 1.16.3.

If you need further information, please let me know.

I'd like to thank you already in advance for your efforts, and I wish you
Good Luck in finding the problem!

Best Regards,

Andreas
