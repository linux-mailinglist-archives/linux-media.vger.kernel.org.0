Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32DB15A131D
	for <lists+linux-media@lfdr.de>; Thu, 25 Aug 2022 16:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241994AbiHYONu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Aug 2022 10:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242094AbiHYON2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Aug 2022 10:13:28 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A884B6D5A
        for <linux-media@vger.kernel.org>; Thu, 25 Aug 2022 07:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1661436778;
        bh=HkBfJbEEXRQ4TY6vu/RyWFpdutnuUMz0oFVpt+WLfZk=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:In-Reply-To:References:Date;
        b=QzartMfxIEgHcMpz5eJO3utrY/VXGzfnBhA10qNXlrXhFv11kmwHUqVXiIa9An/Hd
         3e00X22/utyCjztyRbUpEN3g71Bparx0HZU/6kh0TvPyccn5T/YiukUpUTVAKCv6Xh
         EEvKb1ZPUfQLT2btJXs/UjZUJUxj0UfxUjEbMJjA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from mobalindesk.lan.lan ([95.112.132.55]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MN5iZ-1ohVvw3thN-00J5Lr; Thu, 25
 Aug 2022 16:12:58 +0200
Message-ID: <f78a33006201d6bd417bdac7744ee96c0ea6665b.camel@gmx.net>
Subject: Re: Quanta Computer Inc. Astro HD Cam, not initializing
From:   "Massimo B." <massimo.b@gmx.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
In-Reply-To: <YwSD+68XuLk1zU7v@pendragon.ideasonboard.com>
References: <1e3fff6f44830e910261bfb7629247cd89bf615a.camel@gmx.net>
         <YkGMSaAyUVNWMOsq@pendragon.ideasonboard.com>
         <771493a1110cacd87c42e66eea84c962be789532.camel@gmx.net>
         <YkxLR4Xqsxzu0hh2@pendragon.ideasonboard.com>
         <129a1a8cad21c569e67897ac303cf4ca9d9bca99.camel@gmx.net>
         <YwSD+68XuLk1zU7v@pendragon.ideasonboard.com>
Face:   iVBORw0KGgoAAAANSUhEUgAAADAAAAAwAQMAAABtzGvEAAAAA3NCSVQICAjb4U/gAAAABlBMVEX///8AAABVwtN+AAAACXBIWXMAAA7EAAAOxAGVKw4bAAABGUlEQVQYlUWQsUoDQRCGv71LjB7KSSBwwZCTgFhY2EYIHmJnZRMLo5AXUMRCBMHcE6iPoGBlINpoZXGVeQTFKqSxMgYtTBFcZw7EKfZn2Z2Z7//hr2ysZ+5tqFLmWKVaKKs0vWd9TJx2AibmoQcupj6CCZirqTgzA5hmsdtQWe5/xAREX7uJ3MLP9x4lyieNO5mcOxyM8HH79y/4Cdn9R3JDsts/uGO82yOMJf/ah1Y8tfQEIQt7Z7rCawtNiUpHFgYUdgTxgI1NAW6SvxoqWabbw0Bd5jpQibTNBC1F4nIMk2TWhTqIs+fSVpzfCsVR9eaiJf5W6mtWXK7O+vKR4nWkSYSuFbP4No3Ht6dpSN9pSMYmaXI1/usXT0FM3SoTKAAAAAAASUVORK5CYII=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date:   Thu, 25 Aug 2022 16:12:51 +0200
MIME-Version: 1.0
User-Agent: Evolution 3.44.3 
X-Provags-ID: V03:K1:cC8PhKL67P6iwoqi0NyObqeerpj2+FPEZ/HaDatOgADe5QHID9N
 UYqxKMun1puuQ6/l3M/UwfNCTkTf3TUY4DzMP3W773gqxj0FlNLO+3oPJ05WTnkLcT8oEY3
 C6Y6wiIt0f1AhRN3kSoP2Z+c271TyQ0EnyXQOoZ0NiZRmD+KdO26vrxHwtv4Pa27fMvUDe4
 UXUL+XG5DYnwNW044vSIA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8aB2H2q9c5E=:jiIQOgEAr3x5A/bmQdCDDS
 QYrZV0Hm2VQHrW3yIQJl5AD4zk/RIcTUf8bp7B7uZkME53oudPjkHfU89T49fROkPQSvbpjyx
 zQ9I/H5kd7Tw1nwiFgYPGH41WmaTFi+da4Eb0IqrVh9vzcpBgKaBJSoZBa1GwlMrO2rzvbJJt
 o6HbN7X3Ggq/ohsdjGdzLWIay1ItBQyy3V61ZfUh+BgqtR61r5HLZnrzNsGDXDhc0qRUgRbot
 DzIu4dhTTseLSYE3/pKtAgDh33rhusOF3C5otlYcG45dozW8HU/+7J2wchxZaa+Tq+0ObLMw+
 9VhIr+EdGPP7maKkSZ5v+EJ3CPwwbFzZVFz509SRZbz8v02V6p6A0z9UNUr7Nf3vHDIkdYYdL
 pUWx2FmQCFNCvsKC70/O2qThsaKPZl9/lMntwJtCLVQiySd6Je2jR1l3EIgoL8O7isLC9d3a5
 u21mRVpvhB+MBYVQz5i+ZU1zELcqDWPeP62Bl9aTlr3AKrI4UrHdg6Kslxb2H9Fu0F5/0m7ul
 0zV1uwbbSIR+IFiRu+vCS10QOYoYo00PwXNTu0dzlZBG39RZI2PGarrKHadY9bFZ2fsd/kiLy
 fDh7Yex35rTQWpN/PTbPFgGzQQKY8C89PqeqMDBBMMZvxYymqvL4PF2t0jWGzkbtxbhYFoB0d
 i9tpChSXNDfYBZXcd65B2rrZ/e9Pvbo2e56DgPOXwxIXz86B71+jcngHtm1q2vK4Am2PyexF3
 D5+L3PHAIj3VwtyGQirO1RCIq2siicexaL5dqq59mvXt1MeQ6BaHM8b68WcJKRydIhimutNpI
 Yf45P0meKPGZJEVAHZm0fWR/jcYXEr05dqZKrY9UbcNo0TsigFqzzr2Uliiq4qtbsn5YDoUvG
 dc1sQxRKe6X35FhaVp07BKvtuljebO/eCgC3cP/jNP3TpiD+1h7MiiKMEeKYxmr3a/t0DUJJq
 B7qm3CQ+RSWj23OAALY73s2jVBOxRatpevAD09mkdRhzIi2iTBBve07s+tu3HVI6oSPTPvuXh
 QJBDnufC9dAScRy59K9bzn8AiD04FIt/i0yHfzCaG7xFH/7xAXw8jU+Eo9I1Ik2fxRUebxgNk
 iWu0KsXbvNnIfKR4U2WZoXarYFzG1NSv95ShUuLX64h0eHUGPD7nB9ZSQ==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2022-08-23 at 10:38 +0300, Laurent Pinchart wrote:
> > # cat /etc/udev/rules.d/50-camera.rules=20
> > ACTION=3D=3D"add", SUBSYSTEMS=3D=3D"usb", ATTRS{idVendor}=3D=3D"0408", =
ATTRS{idProduct}=3D=3D"2090", ATTR{bInterfaceClass}=3D=3D"01", ATTR{authori=
zed}=3D"0"

> > From syslog:
> > Aug 22 10:28:46 [kernel] usb 3-11.2: new high-speed USB device number 2=
1 using xhci_hcd
> > Aug 22 10:28:46 [kernel] usb 3-11.2: New USB device found, idVendor=3D0=
408, idProduct=3D2090, bcdDevice=3D21.17
> > Aug 22 10:28:46 [kernel] usb 3-11.2: New USB device strings: Mfr=3D1, P=
roduct=3D2, SerialNumber=3D0
> > Aug 22 10:28:46 [kernel] usb 3-11.2: Product: Astro HD Camera
> > Aug 22 10:28:46 [kernel] usb 3-11.2: Manufacturer: QCM
> > Aug 22 10:28:46 [kernel] usb 3-11.2: Found UVC 1.00 device Astro HD Cam=
era (0408:2090)
> > Aug 22 10:28:46 [kernel] usb 3-11.2: No streaming interface found for t=
erminal 9.
> > Aug 22 10:28:46 [kernel] input: Astro HD Camera: Astro HD Camer as /dev=
ices/pci0000:00/0000:00:14.0/usb3/3-11/3-11.2/3-11.2:1.0/input/input41
> > Aug 22 10:28:51 [kernel] usb 3-11.2: 4:1: cannot set freq 48000 to ep 0=
x84
> > Aug 22 10:28:56 [kernel] usb 3-11.2: 10:3: cannot get min/max values fo=
r control 2 (id 10)

> These messages come from the snd-usb-audio module as far as I can tell.

Ok, let's ignore the audio part of that device and get the camera part work=
ing.
Why has that udev rule stopped working and does not disable the audio anymo=
re?

Getting audio working would be another issue after solving the video part.

Best regards,
Massimo
