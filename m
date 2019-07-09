Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E269636E6
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 15:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbfGIN0c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 09:26:32 -0400
Received: from fortimail.online.lv ([81.198.164.220]:34330 "EHLO
        fortimail.online.lv" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfGIN0b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 09:26:31 -0400
X-Greylist: delayed 602 seconds by postgrey-1.27 at vger.kernel.org; Tue, 09 Jul 2019 09:26:30 EDT
Received: from mailo-proxy2 (smtp.online.lv [81.198.164.193])
        by fortimail.online.lv  with ESMTP id x69DGQGu014050-x69DGQGw014050
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
        for <linux-media@vger.kernel.org>; Tue, 9 Jul 2019 16:16:26 +0300
Received: from mailo-b1 (10.95.60.6) by mailo-proxy2 (Axigen)
 with ESMTPA id 0409FC; Tue, 9 Jul 2019 16:16:26 +0300
Received: from mailo-proxy1 (10.95.60.3) by mailo-b1 (Axigen)
 with ESMTPA id 3BB4BD; Tue, 9 Jul 2019 16:16:26 +0300
Received: from [10.96.45.191] (80.232.242.31) by mailo-proxy1 (Axigen)
 with ESMTPA id 2934A7; Tue, 9 Jul 2019 16:16:26 +0300
To:     linux-media@vger.kernel.org
From:   Raimonds Cicans <ray@apollo.lv>
Subject: Hauppauge WinTV-HVR-935C: cx231xx - analogue part broken?!
Message-ID: <fb939c94-644c-47ae-5830-9c5ea9b3fcc5@apollo.lv>
Date:   Tue, 9 Jul 2019 16:16:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
DomainKey-Status: no signature
DKIM-Status: no signature
X-AXIGEN-DK-Result: No records
X-AXIGEN-DKIM-Result: No records
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

This message is just FYI.

<rant>
I was looking for TV device having single TV (DVB-C & Analogue) input 
and Linux drivers.
After long search I concluded that only viable choice - WinTV-HVR-935C.
I spent ~$100 and two days just to realize that adapter's hybrid tuner 
IC do not have support for analogue part in Linux driver...

Dear drivers developers!!!
Please! Please! Please!
If your driver do not support some main feature - clearly state this in 
source code comments or better in warnings.
</rant>


During tests of analogue part I encountered following errors (Linux 
kernel 5.1.16 with all meaningful debug enabled):

BUG: KASAN: slab-out-of-bounds in mceusb_dev_printdata+0xb1c/0xd10 [mceusb]

BUG: KASAN: slab-out-of-bounds in __wake_up_common+0x598/0x5b0

BUG: KASAN: use-after-free in __mutex_lock+0x10d8/0x1190

BUG: sleeping function called from invalid context at 
include/linux/percpu-rwsem.h:34

BUG: unable to handle kernel NULL pointer dereference at 0000000000000048

Bugs occurred when I was using following software: vlc /xatv / mythtv etc.


I'm personally not interested in further testing and debugging (I 
already spent too much time on it).


BTW, is there any hybrid (analogue/digital) tuner IC with full Linux 
support?


Raimonds Cicans
