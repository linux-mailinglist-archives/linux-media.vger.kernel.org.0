Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68032432416
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 18:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232814AbhJRQtQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 12:49:16 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:24225 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231495AbhJRQtP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 12:49:15 -0400
X-Greylist: delayed 360 seconds by postgrey-1.27 at vger.kernel.org; Mon, 18 Oct 2021 12:49:15 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1634575260;
    s=strato-dkim-0002; d=schepmann.de;
    h=Date:Message-ID:Subject:From:To:Cc:Date:From:Subject:Sender;
    bh=Ca+wlYYDwWB93mJKJ9iwSBTZSyclk/0S5VU8WCLiwSg=;
    b=R8RGu3F8+bgo7y+Hr0LfURNe1WqJRTaBiL0m7/G/wvcCTAn0cK0xi1a1VjdPTHc7a/
    RSlxSAfhSBVAvOp/sXzkCTwM3GTlBzQI75aqgb+CDBxQjxxayE5iWtgtU6clJFH9wUN1
    gjGK1EW6AyImV+Sb49KCL0UGv9Na3Lv/wsU0w3TmyPwL8ej8gfOO2zgbbyeITLngvTLD
    mYmU2UpmtbejtI1U6C4z9FS7s1ZOI1Pofc7RMMVRWnMozVzmrF1RShiq88m+9FRjOaAb
    TAvbTNo8JtguZccRnzxLYVsndIuwo45rqUyKrHOHSnoL77rAFidJmF7wKJSXkFp6mtUt
    ZHAA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":KmkIfFiIaPwJgcTzoxCAM9+H+dvshPpqKzm/2++gu8KR07e+sHGTMcXmfB3arwy25rYldR/JeJYsezvQQQD6PwxUhbPEOqetRjOo+w=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2003:f6:3f3e:4d00:3630:82b6:9c64:ec6c]
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id t00f79x9IGf0o04
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate)
    for <linux-media@vger.kernel.org>;
    Mon, 18 Oct 2021 18:41:00 +0200 (CEST)
To:     linux-media@vger.kernel.org
From:   Felix Schepmann <felix@schepmann.de>
Subject: camera not supported in your device-list does not work
Message-ID: <3158098a-c508-a8e0-dfba-d30b59c26d34@schepmann.de>
Date:   Mon, 18 Oct 2021 18:41:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

i am using a webcam with the following dmesg-output when inserting, 
which is not showing any video signal:

[  405.386690] usb 3-1.2: USB disconnect, device number 4
[  411.018485] usb 3-1.1: USB disconnect, device number 3
[  414.105490] usb 3-1.1: new high-speed USB device number 7 using xhci_hcd
[  414.285316] usb 3-1.1: New USB device found, idVendor=0c45, 
idProduct=6366, bcdDevice= 1.00
[  414.285331] usb 3-1.1: New USB device strings: Mfr=2, Product=1, 
SerialNumber=3
[  414.285338] usb 3-1.1: Product: USB 2.0 Camera
[  414.285343] usb 3-1.1: Manufacturer: Sonix Technology Co., Ltd.
[  414.285348] usb 3-1.1: SerialNumber: SN0001
[  414.288227] uvcvideo: Found UVC 1.00 device USB 2.0 Camera (0c45:6366)
[  414.315921] input: USB 2.0 Camera: USB Camera as 
/devices/pci0000:00/0000:00:1c.4/0000:03:00.0/0000:04:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1:1.0/input/input52
[  414.365853] usb 3-1.1: 3:1: cannot get freq at ep 0x84
[  414.721869] usb 3-1.1: 3:1: cannot get freq at ep 0x84
[  414.791189] usb 3-1.1: 3:1: cannot get freq at ep 0x84

Maybe you could tell me what else of information I should show you?

When I connect to this cam from e.g. firefox it's activity light turns 
on, but no video-stream ist shown in my Web-conferencing screen.

regards, Felix



