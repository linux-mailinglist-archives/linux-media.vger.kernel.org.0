Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A36327B62F
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 22:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgI1UZQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 16:25:16 -0400
Received: from mout02.posteo.de ([185.67.36.142]:43583 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726409AbgI1UZQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 16:25:16 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id F14F22400FC
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 22:25:13 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4C0Yt14Pknz6tmJ
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 22:25:13 +0200 (CEST)
From:   Stefan von Andrian-Werburg <stefan@andrian.de>
Subject: Webcam Driver
To:     linux-media@vger.kernel.org
Message-ID: <81e0504c-245a-6c81-4be4-498cb5a57140@andrian.de>
Date:   Mon, 28 Sep 2020 22:25:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I am looking for a driver for a webcam with  ID 0735:0269

It is listed either as

* Asuscom Network HD 1080P

or as

* HD 1080P  PC-Camera, Manufacturer: Sonix Technology Co., Ltd. 
SerialNumber: SN0001

May you help me out?

Thank you very much and all the best,

Stefan

PS: I received the following protocol:

kernel: [ 2103.968371] uvcvideo: Found UVC 1.00 device HD 1080P 
PC-Camera (0735:0269)
kernel: [ 2103.994598] uvcvideo 3-2:1.0: Entity type for entity 
Extension 4 was not initialized!
kernel: [ 2103.994603] uvcvideo 3-2:1.0: Entity type for entity 
Extension 3 was not initialized!
kernel: [ 2103.994606] uvcvideo 3-2:1.0: Entity type for entity 
Processing 2 was not initialized!
kernel: [ 2103.994608] uvcvideo 3-2:1.0: Entity type for entity Camera 1 
was not initialized!
kernel: [ 2103.994815] input: HD 1080P PC-Camera: HD 1080P   as 
/devices/pci0000:00/0000:00:14.0/usb3/3-2/3-2:1.0/input/input14
kernel: [ 2104.031864] usb 3-2: 3:1: cannot get freq at ep 0x84
mtp-probe: checking bus 3, device 5: 
"/sys/devices/pci0000:00/0000:00:14.0/usb3/3-2"
mtp-probe: bus: 3, device: 5 was not an MTP device
systemd-udevd[5133]: controlC1: Process '/usr/sbin/alsactl -E 
HOME=/run/alsa -E XDG_RUNTIME_DIR=/run/alsa/runtime restore 1' failed 
with exit code 99.
mtp-probe: checking bus 3, device 5: 
"/sys/devices/pci0000:00/0000:00:14.0/usb3/3-2"
mtp-probe: bus: 3, device: 5 was not an MTP device
kernel: [ 2104.764436] usb 3-2: 3:1: cannot get freq at ep 0x84






