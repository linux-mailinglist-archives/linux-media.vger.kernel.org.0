Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92F7359D182
	for <lists+linux-media@lfdr.de>; Tue, 23 Aug 2022 08:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240315AbiHWGwV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Aug 2022 02:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240062AbiHWGwU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Aug 2022 02:52:20 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4C4332BA9
        for <linux-media@vger.kernel.org>; Mon, 22 Aug 2022 23:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1661237535;
        bh=9UR3SMN+vKkrxK+/4IobXBOmCwFm1i1ZR5Gtl3uk9fY=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:In-Reply-To:References:Date;
        b=GcreWdau92cQ9mXrE39lyLk9bVud3aURtMaNGFDrCj655TENAgyUQ4XdBbz6IcGWo
         BpAbrnRjGU4mw3Z8LkBDbl9Ox9ARa6AmXxM2VGBxHkGbyqYL68gRg4RZz1uDXkUHbO
         8gkzS9Q7QHsSmtBUZVk9P9lIU4nFKx86jGjPbMZI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from mobalindesk.lan.lan ([77.10.34.33]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MD9T7-1oZQC61Q37-0096Nt; Tue, 23
 Aug 2022 08:52:15 +0200
Message-ID: <129a1a8cad21c569e67897ac303cf4ca9d9bca99.camel@gmx.net>
Subject: Re: Quanta Computer Inc. Astro HD Cam, not initializing
From:   "Massimo B." <massimo.b@gmx.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
In-Reply-To: <YkxLR4Xqsxzu0hh2@pendragon.ideasonboard.com>
References: <1e3fff6f44830e910261bfb7629247cd89bf615a.camel@gmx.net>
         <YkGMSaAyUVNWMOsq@pendragon.ideasonboard.com>
         <771493a1110cacd87c42e66eea84c962be789532.camel@gmx.net>
         <YkxLR4Xqsxzu0hh2@pendragon.ideasonboard.com>
Face:   iVBORw0KGgoAAAANSUhEUgAAADAAAAAwAQMAAABtzGvEAAAAA3NCSVQICAjb4U/gAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAABGUlEQVQYlUWQsUoDQRCGv71LjB7KSSBwwZCTgFhY2EYIHmJnZRMLo5AXUMRCBMHcE6iPoGBlINpoZXGVeQTFKqSxMgYtTBFcZw7EKfZn2Z2Z7//hr2ysZ+5tqFLmWKVaKKs0vWd9TJx2AibmoQcupj6CCZirqTgzA5hmsdtQWe5/xAREX7uJ3MLP9x4lyieNO5mcOxyM8HH79y/4Cdn9R3JDsts/uGO82yOMJf/ah1Y8tfQEIQt7Z7rCawtNiUpHFgYUdgTxgI1NAW6SvxoqWabbw0Bd5jpQibTNBC1F4nIMk2TWhTqIs+fSVpzfCsVR9eaiJf5W6mtWXK7O+vKR4nWkSYSuFbP4No3Ht6dpSN9pSMYmaXI1/usXT0FM3SoTKAAAAAAASUVORK5CYII=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date:   Tue, 23 Aug 2022 08:47:14 +0200
MIME-Version: 1.0
User-Agent: Evolution 3.44.3 
X-Provags-ID: V03:K1:v/PaaeACURUUIQJSrJg/Sf3m4Pd3mB4yEcw2ZYQCPZNebajBDI3
 u373DLKWn48GtvuJC1ijw5LpWT8AigweVTs2E2dnCNm6wqmnLaYaA0hplJW+/uovHRSuf9u
 eetx/IsSmlPgkK0YNM4wMR+hCum4S6Hx1c1dgXZTaZ5k8TP1jzRKIFQvvGHOYwMxvnFh3dl
 E8YtaKa/lNg5B2yEpw7RQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IEv5BKgNHyk=:E+o/mBbHXWD9bGk7+OkyDu
 m2CSdl0hhBYMPRUBOa2gRyQ5nCI8ipO3aq90NfFcgrs45Qav5Plv+lt3X6VKhZS6d57DXl0m4
 76DgtQ43aFmh4O4h3thyr1BV8gvoEudpEnx5Y47k2qlaAQjD3XOa5WaLYA3QKpVIrTFdzuEoj
 KNUYCh5g1dqahdtX73cDlBUCq+Us/AE29whOowfl295jNW1hipB7m/+R3TDlAT6+N7W/h5tOJ
 6pHL506L+mngClEG6bqR34U+G0Q1EbChaVntj3Hcky51q1MAa6Lq9pQIOmLLMSMhNA16HaKTu
 7lYZXk+mWQkW86Em9CR6xGpyVJvqu7Q7baAjxaIS2KK1KekKKah8yO/0OygoUUtYV+iwBEeSp
 Ws7jhdqKsMAI/JHVcamjq2GIun96+9GfbtPTm9a28qv4WBBZVqCs2F/mBCAIVcBDsJIitckmW
 c0igznzFjKak2zVQ0qbiEtlqbAUkepeozPYyEHLEKMsjyyXlMVmbZV/QWZtIvrgJ7ZT5AmMTF
 o4vXwZliyWs+tQdQbtVyXHySYKNj7WfR49dUeiRcXiz7EP8MTGWAGL73KebxSR7Qx1Xl2tbu/
 l2vbbqFys+t0upx1e3zDxFS47SN43lTRKhO2hKUf8eUOxAA4sP/abSM4iaz2DGBVOznZJaIAu
 +EHzxIY6k0ykjYq4w/iE0XAUlzoZPYMoyeLmAqpjJJYf7Evms5nE6yLhYqTA/FO5LdGKI7yij
 TGeZyuSh4hNmCjPnu+wMWmXUyU1CajnsH7ekqT75WM7U6WEEZFYMDMJKjPDG2CnU6t6+h/97Z
 6S3rngg1vIzQS6CH6W4Q0Xd28/yABukPqfFIqm+kL7GtP+88l4EQlpTAMXNFkLpVdXY3Ekay5
 7X7VdDeKC8jbu2M0p32mNlZumen332EtQWd+CIBgRE3dJQuY1rtAgpv0BHcxfYBXRBjA6mrx1
 elOR1Z50Aps6RMiiJaN6UnWStj/vamaE1lW1rZ5khI4xzieSaV5Jd3EfDX1wxhjh4XsBQVtqq
 8fNWzlDKrtF3O41ijfR9O+7lLLKMkdowr+zQd8ENgxqXHhs2pGIIg4XkEB+CtrIGFWGk8OYpt
 aP5zU+mMVpOHClczBnRabwBlDXybR28IfasGS3GFut0M2GPiz6Lxm/4+Q==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2022-04-05 at 16:59 +0300, Laurent Pinchart wrote:

> > > The audio interface causes issues, it seems it crashed the webcam
> > > firmware. Could you try blacklisting the snd-usb-audio module and see=
 if
> > > video then works ?

> > Yes, that makes the video part work again.

> So this confirms it's a USB audio issue. It may be possible to work
> around it in the snd-usb-audio driver, but that's beyond my area of
> expertise. You may want to contact the alsa-devel mailing list.

Currently I have again the situation that nothing works. Audio is blacklist=
ed:

# cat /etc/udev/rules.d/50-camera.rules=20
ACTION=3D=3D"add", SUBSYSTEMS=3D=3D"usb", ATTRS{idVendor}=3D=3D"0408", ATTR=
S{idProduct}=3D=3D"2090", ATTR{bInterfaceClass}=3D=3D"01", ATTR{authorized}=
=3D"0"

Re-plugging doesn't make it work again.

From syslog:
Aug 22 10:28:46 [kernel] usb 3-11.2: new high-speed USB device number 21 us=
ing xhci_hcd
Aug 22 10:28:46 [kernel] usb 3-11.2: New USB device found, idVendor=3D0408,=
 idProduct=3D2090, bcdDevice=3D21.17
Aug 22 10:28:46 [kernel] usb 3-11.2: New USB device strings: Mfr=3D1, Produ=
ct=3D2, SerialNumber=3D0
Aug 22 10:28:46 [kernel] usb 3-11.2: Product: Astro HD Camera
Aug 22 10:28:46 [kernel] usb 3-11.2: Manufacturer: QCM
Aug 22 10:28:46 [kernel] usb 3-11.2: Found UVC 1.00 device Astro HD Camera =
(0408:2090)
Aug 22 10:28:46 [kernel] usb 3-11.2: No streaming interface found for termi=
nal 9.
Aug 22 10:28:46 [kernel] input: Astro HD Camera: Astro HD Camer as /devices=
/pci0000:00/0000:00:14.0/usb3/3-11/3-11.2/3-11.2:1.0/input/input41
Aug 22 10:28:51 [kernel] usb 3-11.2: 4:1: cannot set freq 48000 to ep 0x84
Aug 22 10:28:56 [kernel] usb 3-11.2: 10:3: cannot get min/max values for co=
ntrol 2 (id 10)
Aug 22 10:28:56 [mtp-probe] checking bus 3, device 21: "/sys/devices/pci000=
0:00/0000:00:14.0/usb3/3-11/3-11.2"_
Aug 22 10:28:56 [mtp-probe] bus: 3, device: 21 was not an MTP device_
Aug 22 10:28:56 [laptop-mode] Laptop Mode Tools disabled in config file\n
                - Last output repeated 5 times -
Aug 22 10:28:56 [mtp-probe] checking bus 3, device 21: "/sys/devices/pci000=
0:00/0000:00:14.0/usb3/3-11/3-11.2"_
Aug 22 10:28:56 [mtp-probe] bus: 3, device: 21 was not an MTP device_
Aug 22 10:29:02 [kernel] usb 3-11.2: Failed to query (GET_DEF) UVC control =
13 on unit 1: -110 (exp. 8).
                - Last output repeated twice -
Aug 22 10:29:12 [kernel] usb 3-11.2: Failed to query (GET_DEF) UVC control =
2 on unit 2: -110 (exp. 2).
Aug 22 10:29:17 [kernel] usb 3-11.2: Failed to query (GET_DEF) UVC control =
11 on unit 1: -110 (exp. 2).
Aug 22 10:29:22 [kernel] usb 3-11.2: Failed to query (GET_DEF) UVC control =
2 on unit 2: -110 (exp. 2).

Best regards,
Massimo
