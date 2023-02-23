Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDEA6A045D
	for <lists+linux-media@lfdr.de>; Thu, 23 Feb 2023 10:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233413AbjBWJC5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Feb 2023 04:02:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232983AbjBWJC4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Feb 2023 04:02:56 -0500
Received: from smtprelay06.ispgateway.de (smtprelay06.ispgateway.de [80.67.18.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D9D469E
        for <linux-media@vger.kernel.org>; Thu, 23 Feb 2023 01:02:54 -0800 (PST)
Received: from [84.189.181.231] (helo=machtnix.gbl.hw9a.de)
        by smtprelay06.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_DHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lutz@willerding.net>)
        id 1pV7V6-0002bd-JV
        for linux-media@vger.kernel.org; Thu, 23 Feb 2023 10:02:52 +0100
Message-ID: <83f9ba3c-18bb-e0cd-e5ac-7c3281f2b5f8@willerding.net>
Date:   Thu, 23 Feb 2023 10:02:52 +0100
MIME-Version: 1.0
From:   Lutz <lutz@willerding.net>
Subject: UVC device not yet supported
To:     linux-media@vger.kernel.org
Content-Language: de-DE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Df-Sender: MzQ3MzMwMQ==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

just got a Endoskop camera from pearl, very cheap device (12,99€) and 
connected it to a debian 11.

I'm trying to get a picture or stream from this camera, an came across 
this page:

https://www.ideasonboard.org/uvc/

There is a section you'd like to be notified if a UVC device is not 
listed there.

So this is my motivation to email you :)


Device is recogniced and listed in lsusb:

Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 008: ID 04cf:8819 Myson Century, Inc. USB 2.0 SD/MMC Reader
---> Bus 001 Device 009: ID 1908:2311 GEMBIRD Generic UVC 1.00 camera 
[AppoTech AX2311]  <---
Bus 001 Device 006: ID 05e3:0608 Genesys Logic, Inc. Hub
Bus 001 Device 004: ID 0b05:19af ASUSTek Computer, Inc. AURA LED Controller
Bus 001 Device 007: ID 046d:c326 Logitech, Inc. Washable Keyboard K310
Bus 001 Device 005: ID 0557:8021 ATEN International Co., Ltd Hub
Bus 001 Device 003: ID 0409:005a NEC Corp. HighSpeed Hub
Bus 001 Device 002: ID 041e:4083 Creative Technology, Ltd Live! Cam 
Socialize [VF0640]
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

but no usable video device is created - at least i can not get a picture 
from it.

The Creative Live! Cam does create a stream. I think this problem could 
be solvable by some udev rules?

there is also a hw-probe for my machine:

https://linux-hardware.org/?probe=4f19f71811

tia for any hints

lutz willerding


