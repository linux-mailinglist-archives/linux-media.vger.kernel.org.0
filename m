Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCA331F6FA
	for <lists+linux-media@lfdr.de>; Fri, 19 Feb 2021 11:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbhBSKD7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Feb 2021 05:03:59 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:34935 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229527AbhBSKD4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Feb 2021 05:03:56 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id D2cvlVHc35126D2cylppEN; Fri, 19 Feb 2021 11:03:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1613728992; bh=t0PnevyRqdnrV4VbPw/eC+8QfQhBYfXHrdTMX3DvHxA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=I0JeTnQv95VDy3fz81vA8qsR/3QZY9j4NaOS+9P9hfEgia2WTgKeVedi0t60LyRz6
         LG/YAfAg/XPRxD1d90EdviaxGFEE6BP3Gmd3ugI+uI993VamEJb6tIfXW3Js1vDzDm
         F2HocACtiycixirw+tvMZ/G4OyHKjArD5h1/RRb4vtz7K0gfC9H4mozDqrNPd+MAeS
         g8JvEkrceC5DjAD6P+WpGlVtYq5Wd+J6vd0jOPNTJMYDEqzA8rzOATDuihKfl4jOTE
         vXxiakzxu7UB5gIGnrkTd64zC6StUQhzW9bKgwTArcAseuTsd5024lhdZOIERhwFdG
         N3tZhgvQURStw==
Subject: Re: [UNKNOWN IVTV CARD] Sony Vaio [4444:0016]
To:     Nomeji <nomeji@emersion.fr>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <9brq4bzh3iOdgN_xYdtatDjws7V_-dA4M-kqhL3VKMbp_u2tCKwqwmX_mnq9nGsjNQDzy82C11l017C1xOwgMe1gXa1eSnnXwGvd31xXIbQ=@emersion.fr>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <54a1560b-97b9-ae72-6f95-6e199c99fa9e@xs4all.nl>
Date:   Fri, 19 Feb 2021 11:03:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <9brq4bzh3iOdgN_xYdtatDjws7V_-dA4M-kqhL3VKMbp_u2tCKwqwmX_mnq9nGsjNQDzy82C11l017C1xOwgMe1gXa1eSnnXwGvd31xXIbQ=@emersion.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPXW5l+O+x7PKgukpA6rLy0H1On//+PhD3OLp4/v2nRBbslIABgma4Fj/6DxODuJUXgL0JjCzSxEFO7bljbJgHW/QNivczTARBxPrzDiQsM2fQT9iRbT
 f6fFhKUXK6VA6oeEGUalfjKQLKk+cqSsJpZmAe9o83c8/YcT6kq6DOvghniB7baTleSj5pXQ4MHsiZXlf+KVEYkjmPByU+JoI/Ufl3zbLn9/DDXzAJcMd82p
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/02/2021 10:16, Nomeji wrote:
> I've found an old PCI TV Card gathered from a Sony Vaio desktop PC. It looks really similar to a Haupauge PVR-150 or PVR-250 except it's recognized as a Sony device in lspci.
> ivtv default it to PVR-150 but it's probably more similar to a PVR-250. Is there a way to default it to PVR-250 instead of PVR-150?

If you run 'modinfo ivtv' you'll see a cardtype module option.

So you can load ivtv with 'modprobe ivtv cardtype=1' to have it select a PVR-250.

Note that there is support for a 'Sony VAIO Giga Pocket (ENX Kikyou)' (cardtype 28),
which might match as well with your hardware.

Regards,

	Hans

> 
> Here is dmesg log:
> 
> [   16.163433] ivtv: Start initialization, version 1.4.3
> [   16.163486] ivtv0: Initializing card 0
> [   16.163490] ivtv0: Unknown card: vendor/device: [4444:0016]
> [   16.163491] ivtv0:               subsystem vendor/device: [104d:816d]
> [   16.163492] ivtv0:               cx23416 based
> [   16.163493] ivtv0: Defaulting to Hauppauge WinTV PVR-150 card
> [   16.163494] ivtv0: Please mail the vendor/device and subsystem vendor/device IDs and what kind of
> [   16.163495] ivtv0: card you have to the linux-media mailinglist (<a target="_blank" rel="noreferrer nofollow noopener" href="http://www.linuxtv.org">www.linuxtv.org</a>)
> [   16.163496] ivtv0: Prefix your subject line with [UNKNOWN IVTV CARD].
> [   16.221120] tveeprom: Encountered bad packet header [aa]. Corrupt or not a Hauppauge eeprom.
> [   16.221125] ivtv0: Invalid EEPROM
> [   16.286450] iTCO_vendor_support: vendor-support=0
> [   16.287559] cx25840 10-0044: Unable to detect h/w, assuming cx23887
> [   16.288569] cx25840 10-0044: cx23887 A/V decoder found @ 0x88 (ivtv i2c driver #0)
> 
> I2C mapping looks different:
> 
> [   16.486000] wm8775 10-001b: I2C: cannot write 000 to register R23
> [   16.489015] wm8775 10-001b: I2C: cannot write 000 to register R7
> [   16.492025] wm8775 10-001b: I2C: cannot write 021 to register R11
> [   16.494767] ieee80211 phy0: rt2x00_set_rf: Info - RF chipset 0003 detected
> [   16.494815] ieee80211 phy0: Selected rate control algorithm 'minstrel_ht'
> [   16.495228] wm8775 10-001b: I2C: cannot write 102 to register R12
> [   16.498773] wm8775 10-001b: I2C: cannot write 000 to register R13
> [   16.501784] wm8775 10-001b: I2C: cannot write 1d4 to register R14
> [   16.505141] wm8775 10-001b: I2C: cannot write 1d4 to register R15
> [   16.508270] wm8775 10-001b: I2C: cannot write 1bf to register R16
> [   16.511266] wm8775 10-001b: I2C: cannot write 185 to register R17
> [   16.514249] wm8775 10-001b: I2C: cannot write 0a2 to register R18
> [   16.517250] wm8775 10-001b: I2C: cannot write 005 to register R19
> [   16.520254] wm8775 10-001b: I2C: cannot write 07a to register R20
> [   16.523256] wm8775 10-001b: I2C: cannot write 102 to register R21
> [   16.531703] ivtv0: Registered device video0 for encoder MPG (4096 kB)
> [   16.531746] ivtv0: Registered device video32 for encoder YUV (2048 kB)
> [   16.531893] ivtv0: Registered device vbi0 for encoder VBI (1024 kB)
> [   16.531930] ivtv0: Registered device video24 for encoder PCM (320 kB)
> [   16.531960] ivtv0: Registered device radio0 for encoder radio
> [   16.531961] ivtv0: Initialized card: Hauppauge WinTV PVR-150
> [   16.532019] ivtv: End initialization
> 
> As you can see in the log, card as a "cx23416" (same as PVR-250) but ivtv still load "cx25840". Could I get it to load "cx23416"?
> 
> Nomeji
> 
> 
> 
> 
> 

