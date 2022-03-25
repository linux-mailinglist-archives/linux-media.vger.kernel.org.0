Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 573C04E6E5B
	for <lists+linux-media@lfdr.de>; Fri, 25 Mar 2022 07:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244939AbiCYGsc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Mar 2022 02:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239394AbiCYGsb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Mar 2022 02:48:31 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED43C6ED8
        for <linux-media@vger.kernel.org>; Thu, 24 Mar 2022 23:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1648190815;
        bh=N5zgCdBVwH6ZAHjx+Mj18eXqO4Wyj4xBhSD0oUjIENQ=;
        h=X-UI-Sender-Class:Subject:From:To:Date;
        b=UX8NfKjFBjwBzuoEiJh8dDVRuwnpcBjVdOu1D64eRFS8tjvJWpZ8yrS0DEWeBln82
         WTbGp9dxRAJwhUqSZeAM5h6b2kbp6rmBVKkE/t5dfp9ugd40X0NDAoS0OQ22qpXWFg
         ZrOJ+ocRfkMhjfPf7ymaj/+qQUXnAKiZfiBnHrQc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from mobalindesk.lan.lan ([77.8.233.244]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7sHo-1nToEP1b6I-004ySO; Fri, 25
 Mar 2022 07:46:55 +0100
Message-ID: <1e3fff6f44830e910261bfb7629247cd89bf615a.camel@gmx.net>
Subject: Quanta Computer Inc. Astro HD Cam, not initializing
From:   "Massimo B." <massimo.b@gmx.net>
To:     linux-media@vger.kernel.org
Face:   iVBORw0KGgoAAAANSUhEUgAAADAAAAAwAQMAAABtzGvEAAAAA3NCSVQICAjb4U/gAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAABGUlEQVQYlUWQsUoDQRCGv71LjB7KSSBwwZCTgFhY2EYIHmJnZRMLo5AXUMRCBMHcE6iPoGBlINpoZXGVeQTFKqSxMgYtTBFcZw7EKfZn2Z2Z7//hr2ysZ+5tqFLmWKVaKKs0vWd9TJx2AibmoQcupj6CCZirqTgzA5hmsdtQWe5/xAREX7uJ3MLP9x4lyieNO5mcOxyM8HH79y/4Cdn9R3JDsts/uGO82yOMJf/ah1Y8tfQEIQt7Z7rCawtNiUpHFgYUdgTxgI1NAW6SvxoqWabbw0Bd5jpQibTNBC1F4nIMk2TWhTqIs+fSVpzfCsVR9eaiJf5W6mtWXK7O+vKR4nWkSYSuFbP4No3Ht6dpSN9pSMYmaXI1/usXT0FM3SoTKAAAAAAASUVORK5CYII=
Content-Type: text/plain; charset="UTF-8"
Date:   Fri, 25 Mar 2022 07:41:55 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.42.4 
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9Jtbr3qx6KNLWQbM90w4/YLlP86Xf6wm7jLGzdANZz39+em8hOJ
 j3qBIK+jzvjlDnl0E6sHiTEB5K9mV8gU3NFn9uiPrs+kS1mQ3qDhgQoJuypP8snWHaa+2f3
 KY4/WLrFX+6WWoL42wUDG0iOoL/cIXuwZ4XSwdNed47Tl3cnCZ/MvwbdX7U60I0xgsyYPCH
 +TLYDCwi1Up4mDAauLOXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rQkZE20Spkg=:CZqrAVFM+c20j6D2jt+bgB
 V1vDPT0r53apg0DvG1apK4L8/pKKGwGlngJwDmgzSGBupyiITv1vjfd3xWEts59btCemqBOuo
 jfmQ4GxA0LPGmNCz9xhj6UabNu12uuKy79hjU0TP/Ll4f6tuRG5j1JCBfHEwRaQFOQR7U7GzE
 OygsU9RIAMajgnft57MOCQhSyiHA+mwnYKfDbBWdeVM8+DZynpqhBtmDVRj3BY517Y9QWIOSL
 5ZyWUpIWAOlHCtA8YiTiPrBDLl7uoctCXtLWrTM7ur9zDgqydjEZ8dER87y6QPrbB2ow7H1j9
 3JgZu9l6mIYdwcGyVZ6JoD6tKhAl85R1Y7yzbadq4xAH97ccBAkYjl/0B0XicdzShU4X3MLI/
 ClWP/Bh98e1jr4OY5Mv1+NvqRkrJLozvSNtwrefKUNEinGKbOkCYmd2X+czmQ3XPwiz2QlpGP
 DPoAmzKygRr1R/SLlKGREyYC8sBMr24p6gIwt6ZreI/l8eBjNPtfE2xaoYwpDg3mn7XrgV+Ym
 K3EGI/r1ziwAwG3uF5PzfpDa554YIxhVhL0DQHIchH7WVg5P+kGXAjfsFMb7JfxitTjTFiYgC
 3vTnXhUkjj3B7YN2twXGmzDEB3OAX7p7j+eLHv/yHNLMFe5ZtxfrEIPyL+j6Lh6AQFkSeFKaT
 j3sIbtnEzVONHrLM6MXloggJCkwUpC1rhoSssnAH3fyN4sTJCELpb6Wxh+FEGBoQjrfOHC0IE
 aHnsgHepbTEO0aO8h2IPlq8X8ZACMd5sbjKqBZL5XzLmyb/i63ogszq/KJvnvSMR+2FsVLQmO
 /7sn/Z+JyB5OVskZqol2ziL1B5PQKTGrt3oT487VNDX3tSplU7vwtPuYdMFjFCW3TS7Nt2Bap
 5t0G8CRm5HiqK1DfFueACclNecpjmv7vSp1bSTI5vGJXr50/M63f0D9upe6i66ZX4CSP+upR2
 EjkotrWUReoBrGunz5yWZNNuhF/toNiVZQTQugN0/4nEGMrHK1gPnIfPFVScN432Vop3VDNCa
 mKTW8M1KrwwZ+AGc9ZF7Gc8RyT32t2Rmf9Vxe3mU79voJu52PI+SBTJ5kOplK3pdRaFzWnSP6
 WJDXuIxJ9TOjqE=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Coming from
https://sourceforge.net/p/linux-uvc/mailman/message/37622481/
without getting any response...

I have a combined USB Camera with microphone:
Bus 003 Device 004: ID 0408:2090 Quanta Computer, Inc. Astro HD Camera

Some while ago I had the camera working, just needed to disable the microp=
hone
because if issues with pulseaudio. Now with 5.15.23-gentoo, nothing works
anymore with that camera, no video and no audio input:

https://forums.gentoo.org/viewtopic-p-8693533.html

Is this the right place to discuss this hardware?


I'm testing with guvcview, and it does not start anymore:

Mar 02 10:41:49 [kernel] usb 3-12.2: USB disconnect, device number 12
Mar 02 10:41:57 [kernel] usb 3-12.2: new high-speed USB device number 14 u=
sing
xhci_hcd
Mar 02 10:41:57 [kernel] usb 3-12.2: New USB device found, idVendor=3D0408=
,
idProduct=3D2090, bcdDevice=3D21.17
Mar 02 10:41:57 [kernel] usb 3-12.2: New USB device strings: Mfr=3D1, Prod=
uct=3D2,
SerialNumber=3D0
Mar 02 10:41:57 [kernel] usb 3-12.2: Product: Astro HD Camera
Mar 02 10:41:57 [kernel] usb 3-12.2: Manufacturer: QCM
Mar 02 10:41:57 [kernel] usb 3-12.2: Found UVC 1.00 device Astro HD Camera
(0408:2090)
Mar 02 10:41:57 [kernel] usb 3-12.2: No streaming interface found for term=
inal
9.
Mar 02 10:41:57 [kernel] input: Astro HD Camera: Astro HD Camer as
/devices/pci0000:00/0000:00:14.0/usb3/3-12/3-12.2/3-12.2:1.0/input/input22
Mar 02 10:42:02 [kernel] usb 3-12.2: 4:1: cannot set freq 48000 to ep 0x84
Mar 02 10:42:08 [kernel] usb 3-12.2: 10:3: cannot get min/max values for c=
ontrol
2 (id 10)
Mar 02 10:42:08 [mtp-probe] checking bus 3, device 14:
"/sys/devices/pci0000:00/0000:00:14.0/usb3/3-12/3-12.2"_
Mar 02 10:42:08 [mtp-probe] bus: 3, device: 14 was not an MTP device_
Mar 02 10:42:08 [mtp-probe] checking bus 3, device 14:
"/sys/devices/pci0000:00/0000:00:14.0/usb3/3-12/3-12.2"_
Mar 02 10:42:08 [mtp-probe] bus: 3, device: 14 was not an MTP device_
Mar 02 10:42:13 [kernel] usb 3-12.2: Failed to query (GET_DEF) UVC control=
 13 on
unit 1: -110 (exp. 8).
Mar 02 10:42:18 [kernel] usb 3-12.2: Failed to query (GET_DEF) UVC control=
 2 on
unit 2: -110 (exp. 2).
Mar 02 10:42:23 [kernel] usb 3-12.2: Failed to query (GET_DEF) UVC control=
 13 on
unit 1: -110 (exp. 8).
Mar 02 10:42:28 [kernel] usb 3-12.2: Failed to query (GET_DEF) UVC control=
 2 on
unit 2: -110 (exp. 2).
Mar 02 10:42:33 [kernel] usb 3-12.2: Failed to query (GET_DEF) UVC control=
 11 on
unit 1: -110 (exp. 2).
Mar 02 10:42:38 [kernel] usb 3-12.2: Failed to query (GET_DEF) UVC control=
 13 on
unit 1: -110 (exp. 8).
                - Last output repeated twice -
Mar 02 10:42:49 [kernel] usb 3-12.2: Failed to query (GET_DEF) UVC control=
 11 on
unit 1: -110 (exp. 2).
Mar 02 10:42:54 [kernel] usb 3-12.2: Failed to query (GET_DEF) UVC control=
 13 on
unit 1: -110 (exp. 8).
                - Last output repeated twice -
Mar 02 10:43:04 [kernel] usb 3-12.2: Failed to query (GET_DEF) UVC control=
 11 on
unit 1: -110 (exp. 2).

Booting the machine with the device connected I see many repeating lines l=
ike
this in the log until unplugging the device:

Mar 08 10:44:59 [kernel] usb 3-12.2: 4:1: usb_set_interface failed (-71)
Mar 08 10:44:59 [kernel] usb 3-12.2: 4:0: usb_set_interface failed (-71)
                - Last output repeated twice -
Mar 08 10:44:59 [kernel] usb 3-12.2: 4:1: usb_set_interface failed (-71)
Mar 08 10:44:59 [kernel] usb 3-12.2: 4:0: usb_set_interface failed (-71)


Best regards,
Massimo

