Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6A8D10DDDF
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2019 15:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbfK3OeA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Nov 2019 09:34:00 -0500
Received: from zeus.seaquake.net ([195.62.218.101]:33347 "EHLO
        zeus.seaquake.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbfK3OeA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Nov 2019 09:34:00 -0500
Received: from [192.168.8.111] (unknown [81.96.60.135])
        by zeus.seaquake.net (Postfix) with ESMTP id 70B1D21C116
        for <linux-media@vger.kernel.org>; Sat, 30 Nov 2019 14:33:58 +0000 (GMT)
To:     linux-media@vger.kernel.org
From:   Steven Maddox <s.maddox@lantizia.me.uk>
Subject: tm6000: new board id [15e4:0140]
Message-ID: <c745d5a7-79a4-a8d8-8caf-5944856e561d@lantizia.me.uk>
Date:   Sat, 30 Nov 2019 14:33:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

New device...

Manufacturer: ION
Model: VCR 2 PC
Vendor/Product id: [15e4:0140]

Manufacturers URL: https://www.ionaudio.com/vcr-2-pc-vcr2pcx110

Chipset: tm6010 (see link to photos below)

Tests made:

- Forced it to use the tm6000 module via...

  echo 15e4 0140 > /sys/bus/usb/drivers/tm6000/new_id

- Closest match (as this also has no DVB but also has composite) was a
"TM6010_BOARD_BEHOLD_VOYAGER" so used...

  modprobe tm6000 card=11

- After selecting input 1 on something like VLC - the video comes out
with a lot of green crap all over it, see this image...

  https://i.snipboard.io/JdSqKQ.jpg

- Also the audio is undecipherable and choppy... however sometimes when
you're not capturing the video - bizarrely the audio becomes clear and
you can capture it just using something like Audacity.  I'm finding it
tough to always reproduce this however.

- Since this is a VCR, clearly no DVB, Radio or Remote functions!

More photos of this unit after I've opened it up here...
https://photos.app.goo.gl/iMmjtgQuyeDK4NdA9

Basically if anyone has the time... I wouldn't mind a second opinion on
getting this to work.  I feel like it's fairly close.

My other option is to take the tm6010 board out of the VCR and put
something else in it which will be less problematic for most Linux-based
distributions (any suggestions?).


~lantizia
