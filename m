Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8457A2F98B4
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 05:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730255AbhAREgc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jan 2021 23:36:32 -0500
Received: from mx1.toile-libre.net ([195.88.84.107]:48991 "EHLO
        mx1.toile-libre.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731229AbhAREgb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jan 2021 23:36:31 -0500
X-Greylist: delayed 419 seconds by postgrey-1.27 at vger.kernel.org; Sun, 17 Jan 2021 23:35:55 EST
Received: by mx1.toile-libre.net (Postfix, from userid 58)
        id 0602C1F37D; Mon, 18 Jan 2021 05:28:09 +0100 (CET)
Received: from [192.168.2.20] (bras-base-tsrvpq3228w-grc-13-76-67-179-156.dsl.bell.ca [76.67.179.156])
        by mx1.toile-libre.net (Postfix) with ESMTPSA id 5B0C41F2D2
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 05:28:06 +0100 (CET)
To:     linux-media@vger.kernel.org
From:   Julien Bellion <julien.bellion@free.fr>
Subject: YGTek 2k webcam not supported
Message-ID: <f27356d0-2627-1281-78b2-38cf6123e945@free.fr>
Date:   Sun, 17 Jan 2021 23:28:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------12F8EAD476192ADB0635177D"
Content-Language: fr
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------12F8EAD476192ADB0635177D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,


I have bought a 2k uvc webcam. It is recognized by the system but I 
can't use it (I use Cheese on Debian testing for my tests).

The first time, the webcam is found, when I select it the application 
freezes and I see nothing.

If I unplug and replug the webcam, then it is not proposed until I 
restart the computer (or hibernate it).


The webcam is not listed in the supported devices list, but recognised 
as a uvc device (as seen in joined lsusb output).


What can I do to make this webcam work on my Linux laptop ?


Thx

Julien


--------------12F8EAD476192ADB0635177D
Content-Type: text/x-log; charset=UTF-8;
 name="dmesg.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dmesg.log"

[36894.352719] uvcvideo: uvc_v4l2_poll
[36894.352869] uvcvideo: uvc_v4l2_poll
[36894.352892] uvcvideo: uvc_v4l2_poll
[36894.364643] uvcvideo: uvc_v4l2_poll
[36894.364811] uvcvideo: uvc_v4l2_poll
[36894.364834] uvcvideo: uvc_v4l2_poll
[36894.377153] uvcvideo: uvc_v4l2_poll
[36894.377327] uvcvideo: uvc_v4l2_poll
[36894.377350] uvcvideo: uvc_v4l2_poll
[36894.388503] uvcvideo: uvc_v4l2_poll
[36894.388669] uvcvideo: uvc_v4l2_poll
[36894.388692] uvcvideo: uvc_v4l2_poll
[36894.400285] uvcvideo: uvc_v4l2_poll
[36894.400489] uvcvideo: uvc_v4l2_poll
[36894.400528] uvcvideo: uvc_v4l2_poll
[36894.409608] uvcvideo: uvc_v4l2_poll
[36894.409812] uvcvideo: uvc_v4l2_poll
[36894.412922] uvcvideo: uvc_v4l2_poll
[36894.413076] uvcvideo: uvc_v4l2_poll
[36894.413099] uvcvideo: uvc_v4l2_poll
[36894.424314] uvcvideo: uvc_v4l2_poll
[36894.424483] uvcvideo: uvc_v4l2_poll
[36894.424507] uvcvideo: uvc_v4l2_poll
[36894.436461] uvcvideo: uvc_v4l2_poll
[36894.436614] uvcvideo: uvc_v4l2_poll
[36894.436635] uvcvideo: uvc_v4l2_poll
[36894.448120] uvcvideo: uvc_v4l2_poll
[36894.448236] uvcvideo: uvc_v4l2_poll
[36894.448251] uvcvideo: uvc_v4l2_poll
[36894.460188] uvcvideo: uvc_v4l2_poll
[36894.460329] uvcvideo: uvc_v4l2_poll
[36894.460345] uvcvideo: uvc_v4l2_poll
[36894.472375] uvcvideo: uvc_v4l2_poll
[36894.472482] uvcvideo: uvc_v4l2_poll
[36894.472495] uvcvideo: uvc_v4l2_poll
[36894.483422] uvcvideo: uvc_v4l2_poll
[36894.483511] uvcvideo: uvc_v4l2_poll
[36894.483520] uvcvideo: uvc_v4l2_poll
[36894.687888] uvcvideo: uvc_v4l2_poll
[36894.688050] uvcvideo: uvc_v4l2_poll
[36894.688073] uvcvideo: uvc_v4l2_poll
[36894.699658] uvcvideo: uvc_v4l2_poll
[36894.699838] uvcvideo: uvc_v4l2_poll
[36894.699861] uvcvideo: uvc_v4l2_poll
[36894.711110] uvcvideo: uvc_v4l2_poll
[36894.711277] uvcvideo: uvc_v4l2_poll
[36894.711299] uvcvideo: uvc_v4l2_poll
[36894.723100] uvcvideo: uvc_v4l2_poll
[36894.723275] uvcvideo: uvc_v4l2_poll
[36894.723299] uvcvideo: uvc_v4l2_poll
[36894.735403] uvcvideo: uvc_v4l2_poll
[36894.735568] uvcvideo: uvc_v4l2_poll
[36894.735592] uvcvideo: uvc_v4l2_poll
[36894.747403] uvcvideo: uvc_v4l2_poll
[36894.747550] uvcvideo: uvc_v4l2_poll
[36894.747573] uvcvideo: uvc_v4l2_poll
[36894.759237] uvcvideo: uvc_v4l2_poll
[36894.759413] uvcvideo: uvc_v4l2_poll
[36894.759452] uvcvideo: uvc_v4l2_poll
[36894.772458] uvcvideo: uvc_v4l2_poll
[36894.772630] uvcvideo: uvc_v4l2_poll
[36894.772667] uvcvideo: uvc_v4l2_poll
[36894.783367] uvcvideo: uvc_v4l2_poll
[36894.783522] uvcvideo: uvc_v4l2_poll
[36894.783545] uvcvideo: uvc_v4l2_poll
[36894.795483] uvcvideo: uvc_v4l2_poll
[36894.795818] uvcvideo: uvc_v4l2_poll
[36894.795856] uvcvideo: uvc_v4l2_poll
[36894.807497] uvcvideo: uvc_v4l2_poll
[36894.807944] uvcvideo: uvc_v4l2_poll
[36894.809296] uvcvideo: uvc_v4l2_poll
[36894.819327] uvcvideo: uvc_v4l2_poll
[36894.819519] uvcvideo: uvc_v4l2_poll
[36894.819543] uvcvideo: uvc_v4l2_poll
[36894.831452] uvcvideo: uvc_v4l2_poll
[36894.831881] uvcvideo: uvc_v4l2_poll
[36894.831922] uvcvideo: uvc_v4l2_poll
[36894.843189] uvcvideo: uvc_v4l2_poll
[36894.843377] uvcvideo: uvc_v4l2_poll
[36894.843400] uvcvideo: uvc_v4l2_poll
[36894.855297] uvcvideo: uvc_v4l2_poll
[36894.855483] uvcvideo: uvc_v4l2_poll
[36894.855506] uvcvideo: uvc_v4l2_poll
[36894.871308] uvcvideo: uvc_v4l2_poll
[36894.871493] uvcvideo: uvc_v4l2_poll
[36894.871517] uvcvideo: uvc_v4l2_poll
[36894.879064] uvcvideo: uvc_v4l2_poll
[36894.879245] uvcvideo: uvc_v4l2_poll
[36894.879267] uvcvideo: uvc_v4l2_poll
[36894.890839] uvcvideo: uvc_v4l2_poll
[36894.891023] uvcvideo: uvc_v4l2_poll
[36894.891047] uvcvideo: uvc_v4l2_poll
[36894.902893] uvcvideo: uvc_v4l2_poll
[36894.903077] uvcvideo: uvc_v4l2_poll
[36894.903100] uvcvideo: uvc_v4l2_poll
[36894.914656] uvcvideo: uvc_v4l2_poll
[36894.914850] uvcvideo: uvc_v4l2_poll
[36894.915392] uvcvideo: uvc_v4l2_poll
[36894.926619] uvcvideo: uvc_v4l2_poll
[36894.926784] uvcvideo: uvc_v4l2_poll
[36894.926807] uvcvideo: uvc_v4l2_poll
[36894.938722] uvcvideo: uvc_v4l2_poll
[36894.938891] uvcvideo: uvc_v4l2_poll
[36894.938914] uvcvideo: uvc_v4l2_poll
[36894.950618] uvcvideo: uvc_v4l2_poll
[36894.950784] uvcvideo: uvc_v4l2_poll
[36894.950807] uvcvideo: uvc_v4l2_poll
[36894.963511] uvcvideo: uvc_v4l2_poll
[36894.963875] uvcvideo: uvc_v4l2_poll
[36894.964503] uvcvideo: uvc_v4l2_poll
[36894.974454] uvcvideo: uvc_v4l2_poll
[36894.974633] uvcvideo: uvc_v4l2_poll
[36894.974674] uvcvideo: uvc_v4l2_poll
[36894.986427] uvcvideo: uvc_v4l2_poll
[36894.986580] uvcvideo: uvc_v4l2_poll
[36894.986604] uvcvideo: uvc_v4l2_poll
[36894.998487] uvcvideo: uvc_v4l2_poll
[36894.998641] uvcvideo: uvc_v4l2_poll
[36894.998664] uvcvideo: uvc_v4l2_poll
[36895.010608] uvcvideo: uvc_v4l2_poll
[36895.010778] uvcvideo: uvc_v4l2_poll
[36895.010806] uvcvideo: uvc_v4l2_poll
[36895.022425] uvcvideo: uvc_v4l2_poll
[36895.022582] uvcvideo: uvc_v4l2_poll
[36895.022606] uvcvideo: uvc_v4l2_poll
[36895.036322] uvcvideo: uvc_v4l2_poll
[36895.036496] uvcvideo: uvc_v4l2_poll
[36895.036533] uvcvideo: uvc_v4l2_poll
[36895.046405] uvcvideo: uvc_v4l2_poll
[36895.046550] uvcvideo: uvc_v4l2_poll
[36895.046573] uvcvideo: uvc_v4l2_poll
[36895.058380] uvcvideo: uvc_v4l2_poll
[36895.058534] uvcvideo: uvc_v4l2_poll
[36895.058557] uvcvideo: uvc_v4l2_poll
[36895.070608] uvcvideo: uvc_v4l2_poll
[36895.070754] uvcvideo: uvc_v4l2_poll
[36895.070777] uvcvideo: uvc_v4l2_poll
[36895.082252] uvcvideo: uvc_v4l2_poll
[36895.082399] uvcvideo: uvc_v4l2_poll
[36895.082422] uvcvideo: uvc_v4l2_poll
[36895.153509] uvcvideo: uvc_v4l2_poll
[36895.153597] uvcvideo: uvc_v4l2_poll
[36895.153616] uvcvideo: uvc_v4l2_poll
[36895.416128] uvcvideo: uvc_v4l2_poll
[36895.416207] uvcvideo: uvc_v4l2_poll
[36895.417519] uvcvideo: uvc_v4l2_poll
[36895.428414] uvcvideo: uvc_v4l2_poll
[36895.439370] uvcvideo: uvc_v4l2_poll
[36895.439405] uvcvideo: uvc_v4l2_poll
[36895.509189] uvcvideo: uvc_v4l2_poll
[36895.509384] uvcvideo: uvc_v4l2_poll
[36895.509420] uvcvideo: uvc_v4l2_poll
[36895.752611] uvcvideo: uvc_v4l2_poll
[36895.752761] uvcvideo: uvc_v4l2_poll
[36895.752784] uvcvideo: uvc_v4l2_poll
[36895.764391] uvcvideo: uvc_v4l2_poll
[36895.765288] uvcvideo: uvc_v4l2_poll
[36895.765317] uvcvideo: uvc_v4l2_poll
[36895.776277] uvcvideo: uvc_v4l2_poll
[36895.776464] uvcvideo: uvc_v4l2_poll
[36895.777964] uvcvideo: uvc_v4l2_poll
[36895.787864] uvcvideo: uvc_v4l2_poll
[36895.788109] uvcvideo: uvc_v4l2_poll
[36895.792818] uvcvideo: uvc_v4l2_poll
[36895.799786] uvcvideo: uvc_v4l2_poll
[36895.799981] uvcvideo: uvc_v4l2_poll
[36895.800831] uvcvideo: uvc_v4l2_poll
[36895.811666] uvcvideo: uvc_v4l2_poll
[36895.811863] uvcvideo: uvc_v4l2_poll
[36895.812700] uvcvideo: uvc_v4l2_poll
[36895.823660] uvcvideo: uvc_v4l2_poll
[36895.823878] uvcvideo: uvc_v4l2_poll
[36895.826405] uvcvideo: uvc_v4l2_poll
[36895.836592] uvcvideo: uvc_v4l2_poll
[36895.836792] uvcvideo: uvc_v4l2_poll
[36895.837667] uvcvideo: uvc_v4l2_poll
[36895.847606] uvcvideo: uvc_v4l2_poll
[36895.847835] uvcvideo: uvc_v4l2_poll
[36895.851042] uvcvideo: uvc_v4l2_poll
[36895.859535] uvcvideo: uvc_v4l2_poll
[36895.859854] uvcvideo: uvc_v4l2_poll
[36895.860646] uvcvideo: uvc_v4l2_poll
[36895.871765] uvcvideo: uvc_v4l2_poll
[36895.871964] uvcvideo: uvc_v4l2_poll
[36895.872742] uvcvideo: uvc_v4l2_poll
[36895.883846] uvcvideo: uvc_v4l2_poll
[36895.884048] uvcvideo: uvc_v4l2_poll
[36895.885743] uvcvideo: uvc_v4l2_poll
[36895.895790] uvcvideo: uvc_v4l2_poll
[36895.895991] uvcvideo: uvc_v4l2_poll
[36895.896724] uvcvideo: uvc_v4l2_poll
[36895.907662] uvcvideo: uvc_v4l2_poll
[36895.907829] uvcvideo: uvc_v4l2_poll
[36895.908570] uvcvideo: uvc_v4l2_poll
[36895.919670] uvcvideo: uvc_v4l2_poll
[36895.919853] uvcvideo: uvc_v4l2_poll
[36895.921058] uvcvideo: uvc_v4l2_poll
[36895.931465] uvcvideo: uvc_v4l2_poll
[36895.931820] uvcvideo: uvc_v4l2_poll
[36895.933307] uvcvideo: uvc_v4l2_poll
[36895.946834] uvcvideo: uvc_v4l2_poll
[36895.947240] uvcvideo: uvc_v4l2_poll
[36895.948308] uvcvideo: uvc_v4l2_poll
[36895.955264] uvcvideo: uvc_v4l2_poll
[36895.955442] uvcvideo: uvc_v4l2_poll
[36895.956335] uvcvideo: uvc_v4l2_poll
[36895.967037] uvcvideo: uvc_v4l2_poll
[36895.967237] uvcvideo: uvc_v4l2_poll
[36895.968092] uvcvideo: uvc_v4l2_poll
[36895.978993] uvcvideo: uvc_v4l2_poll
[36895.979178] uvcvideo: uvc_v4l2_poll
[36895.980045] uvcvideo: uvc_v4l2_poll
[36895.990906] uvcvideo: uvc_v4l2_poll
[36895.991104] uvcvideo: uvc_v4l2_poll
[36895.992257] uvcvideo: uvc_v4l2_poll
[36896.003027] uvcvideo: uvc_v4l2_poll
[36896.003222] uvcvideo: uvc_v4l2_poll
[36896.004102] uvcvideo: uvc_v4l2_poll
[36896.014995] uvcvideo: uvc_v4l2_poll
[36896.015190] uvcvideo: uvc_v4l2_poll
[36896.016458] uvcvideo: uvc_v4l2_poll
[36896.026895] uvcvideo: uvc_v4l2_poll
[36896.027131] uvcvideo: uvc_v4l2_poll
[36896.028813] uvcvideo: uvc_v4l2_poll
[36896.039706] uvcvideo: uvc_v4l2_poll
[36896.039918] uvcvideo: uvc_v4l2_poll
[36896.041149] uvcvideo: uvc_v4l2_poll
[36896.051034] uvcvideo: uvc_v4l2_poll
[36896.051233] uvcvideo: uvc_v4l2_poll
[36896.052391] uvcvideo: uvc_v4l2_poll
[36896.063005] uvcvideo: uvc_v4l2_poll
[36896.063206] uvcvideo: uvc_v4l2_poll
[36896.064147] uvcvideo: uvc_v4l2_poll
[36896.074897] uvcvideo: uvc_v4l2_poll
[36896.075102] uvcvideo: uvc_v4l2_poll
[36896.076791] uvcvideo: uvc_v4l2_poll
[36896.086591] uvcvideo: uvc_v4l2_poll
[36896.086787] uvcvideo: uvc_v4l2_poll
[36896.087845] uvcvideo: uvc_v4l2_poll
[36896.098706] uvcvideo: uvc_v4l2_poll
[36896.098904] uvcvideo: uvc_v4l2_poll
[36896.099863] uvcvideo: uvc_v4l2_poll
[36896.110616] uvcvideo: uvc_v4l2_poll
[36896.110798] uvcvideo: uvc_v4l2_poll
[36896.111602] uvcvideo: uvc_v4l2_poll
[36896.182431] uvcvideo: uvc_v4l2_poll
[36896.182533] uvcvideo: uvc_v4l2_poll
[36896.182555] uvcvideo: uvc_v4l2_poll
[36896.301635] uvcvideo: uvc_v4l2_poll
[36896.301734] uvcvideo: uvc_v4l2_poll
[36896.301756] uvcvideo: uvc_v4l2_poll
[36896.575733] uvcvideo: uvc_v4l2_poll
[36896.575848] uvcvideo: uvc_v4l2_poll
[36896.576715] uvcvideo: uvc_v4l2_poll
[36896.668968] uvcvideo: uvc_v4l2_poll
[36896.669188] uvcvideo: uvc_v4l2_release
[36898.177381] usb 2-1: USB disconnect, device number 9
[36898.495724] usb 2-1: new high-speed USB device number 10 using xhci_hcd
[36898.645253] usb 2-1: New USB device found, idVendor=1d6d, idProduct=0105, bcdDevice= 0.10
[36898.645257] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[36898.645259] usb 2-1: Product: webcam
[36898.645261] usb 2-1: Manufacturer: YGTek
[36898.645263] usb 2-1: SerialNumber: YG_U700.2020.0904.1200
[36898.646096] uvcvideo: Probing generic UVC device 1
[36898.646236] uvcvideo: Found format MJPEG.
[36898.646239] uvcvideo: - 640x480 (25.0 fps)
[36898.646241] uvcvideo: - 800x600 (25.0 fps)
[36898.646243] uvcvideo: - 1280x720 (25.0 fps)
[36898.646245] uvcvideo: - 1280x960 (25.0 fps)
[36898.646247] uvcvideo: - 1920x1080 (25.0 fps)
[36898.646248] uvcvideo: - 2304x1296 (25.0 fps)
[36898.646250] uvcvideo: - 2560x1440 (25.0 fps)
[36898.646252] uvcvideo: Found format H.264.
[36898.646253] uvcvideo: - 640x480 (25.0 fps)
[36898.646254] uvcvideo: - 800x600 (25.0 fps)
[36898.646255] uvcvideo: - 1280x720 (25.0 fps)
[36898.646256] uvcvideo: - 1280x960 (25.0 fps)
[36898.646257] uvcvideo: - 1920x1080 (25.0 fps)
[36898.646258] uvcvideo: - 2304x1296 (25.0 fps)
[36898.646259] uvcvideo: - 2560x1440 (25.0 fps)
[36898.646261] uvcvideo: Unknown video format 35363248-0000-0010-8000-00aa00389b71
[36898.646262] uvcvideo: Found format 35363248-0000-0010-8000-00aa003.
[36898.646263] uvcvideo: - 640x480 (25.0 fps)
[36898.646264] uvcvideo: - 800x600 (25.0 fps)
[36898.646265] uvcvideo: - 1280x720 (25.0 fps)
[36898.646266] uvcvideo: - 1280x960 (25.0 fps)
[36898.646267] uvcvideo: - 1920x1080 (25.0 fps)
[36898.646268] uvcvideo: - 2304x1296 (25.0 fps)
[36898.646269] uvcvideo: - 2560x1440 (25.0 fps)
[36898.646270] uvcvideo: Found format YUV 4:2:2 (YUYV).
[36898.646271] uvcvideo: - 320x240 (25.0 fps)
[36898.646272] uvcvideo: - 640x360 (25.0 fps)
[36898.646273] uvcvideo: - 640x480 (25.0 fps)
[36898.646274] uvcvideo: - 720x480 (25.0 fps)
[36898.646275] uvcvideo: - 800x600 (25.0 fps)
[36898.646276] uvcvideo: - 1024x576 (25.0 fps)
[36898.646280] uvcvideo: Found a Status endpoint (addr 81).
[36898.646281] uvcvideo: Found UVC 1.00 device webcam (1d6d:0105)
[36898.646285] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/2 to device 1 entity 1
[36898.646397] uvcvideo: Adding mapping 'Exposure, Auto' to control 00000000-0000-0000-0000-000000000001/2.
[36898.646398] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/4 to device 1 entity 1
[36898.646565] uvcvideo: Adding mapping 'Exposure (Absolute)' to control 00000000-0000-0000-0000-000000000001/4.
[36898.646567] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device 1 entity 2
[36898.646712] uvcvideo: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2.
[36898.646714] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device 1 entity 2
[36898.646876] uvcvideo: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3.
[36898.646877] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device 1 entity 2
[36898.647026] uvcvideo: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7.
[36898.647027] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/8 to device 1 entity 2
[36898.647183] uvcvideo: Adding mapping 'Sharpness' to control 00000000-0000-0000-0000-000000000101/8.
[36898.647185] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/10 to device 1 entity 2
[36898.647333] uvcvideo: Adding mapping 'White Balance Temperature' to control 00000000-0000-0000-0000-000000000101/10.
[36898.647334] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/4 to device 1 entity 2
[36898.647466] uvcvideo: Adding mapping 'Gain' to control 00000000-0000-0000-0000-000000000101/4.
[36898.647467] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/5 to device 1 entity 2
[36898.647582] uvcvideo: Adding mapping 'Power Line Frequency' to control 00000000-0000-0000-0000-000000000101/5.
[36898.647682] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/11 to device 1 entity 2
[36898.647822] uvcvideo: Adding mapping 'White Balance Temperature, Auto' to control 00000000-0000-0000-0000-000000000101/11.
[36898.647826] uvcvideo: Scanning UVC chain: OT 4 <- XU 3 <- PU 2 <- IT 1
[36898.647834] uvcvideo: Found a valid video chain (1 -> 4).
[36898.648774] input: webcam: WEBCAM as /devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1:1.0/input/input28
[36898.649014] uvcvideo: UVC device initialized.
[36899.167665] uvcvideo: Suspending interface 1
[36899.167670] uvcvideo: Suspending interface 0
[36899.580969] uvcvideo: uvc_v4l2_open
[36899.648104] uvcvideo: Resuming interface 0
[36899.648106] uvcvideo: Resuming interface 1
[36899.966234] uvcvideo: uvc_v4l2_release
[36899.967690] uvcvideo: uvc_v4l2_open
[36899.969261] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
[36899.969263] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[36899.983159] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
[36899.983161] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[36899.997051] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
[36899.997053] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[36900.010920] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
[36900.010922] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[36900.024934] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
[36900.024936] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[36900.039288] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
[36900.039290] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[36900.053191] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
[36900.053193] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[36900.067182] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
[36900.067183] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[36900.081333] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
[36900.081335] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[36900.121487] uvcvideo: uvc_v4l2_poll
[36900.164557] uvcvideo: uvc_v4l2_poll
[36900.172015] uvcvideo: uvc_v4l2_poll
[36900.172260] uvcvideo: uvc_v4l2_poll
[36900.172380] uvcvideo: uvc_v4l2_poll
[36900.178695] uvcvideo: uvc_v4l2_poll
[36900.179018] uvcvideo: uvc_v4l2_poll
[36900.179060] uvcvideo: uvc_v4l2_poll
[36900.179075] uvcvideo: uvc_v4l2_poll
[36900.179092] uvcvideo: uvc_v4l2_poll
[36900.394033] uvcvideo: uvc_v4l2_poll
[36900.394072] uvcvideo: uvc_v4l2_poll
[36900.619388] uvcvideo: uvc_v4l2_poll
[36900.620805] uvcvideo: uvc_v4l2_poll
[36900.620822] uvcvideo: uvc_v4l2_poll
[36900.632056] uvcvideo: uvc_v4l2_poll
[36900.632122] uvcvideo: uvc_v4l2_poll
[36900.632129] uvcvideo: uvc_v4l2_poll
[36900.643687] uvcvideo: uvc_v4l2_poll
[36900.643760] uvcvideo: uvc_v4l2_poll
[36900.643767] uvcvideo: uvc_v4l2_poll
[36900.655344] uvcvideo: uvc_v4l2_poll
[36900.655420] uvcvideo: uvc_v4l2_poll
[36900.655431] uvcvideo: uvc_v4l2_poll
[36900.667312] uvcvideo: uvc_v4l2_poll
[36900.667376] uvcvideo: uvc_v4l2_poll
[36900.667383] uvcvideo: uvc_v4l2_poll
[36900.679429] uvcvideo: uvc_v4l2_poll
[36900.679508] uvcvideo: uvc_v4l2_poll
[36900.679516] uvcvideo: uvc_v4l2_poll
[36900.691111] uvcvideo: uvc_v4l2_poll
[36900.691200] uvcvideo: uvc_v4l2_poll
[36900.691207] uvcvideo: uvc_v4l2_poll
[36900.702932] uvcvideo: uvc_v4l2_poll
[36900.703008] uvcvideo: uvc_v4l2_poll
[36900.703015] uvcvideo: uvc_v4l2_poll
[36900.715095] uvcvideo: uvc_v4l2_poll
[36900.715171] uvcvideo: uvc_v4l2_poll
[36900.715178] uvcvideo: uvc_v4l2_poll
[36900.727694] uvcvideo: uvc_v4l2_poll
[36900.727770] uvcvideo: uvc_v4l2_poll
[36900.727777] uvcvideo: uvc_v4l2_poll
[36900.738163] uvcvideo: uvc_v4l2_poll
[36900.738239] uvcvideo: uvc_v4l2_poll
[36900.738246] uvcvideo: uvc_v4l2_poll
[36900.942802] uvcvideo: uvc_v4l2_poll
[36900.942976] uvcvideo: uvc_v4l2_poll
[36900.942999] uvcvideo: uvc_v4l2_poll
[36900.954987] uvcvideo: uvc_v4l2_poll
[36900.955160] uvcvideo: uvc_v4l2_poll
[36900.955183] uvcvideo: uvc_v4l2_poll
[36900.966788] uvcvideo: uvc_v4l2_poll
[36900.966961] uvcvideo: uvc_v4l2_poll
[36900.966984] uvcvideo: uvc_v4l2_poll
[36900.978539] uvcvideo: uvc_v4l2_poll
[36900.978692] uvcvideo: uvc_v4l2_poll
[36900.978716] uvcvideo: uvc_v4l2_poll
[36900.990642] uvcvideo: uvc_v4l2_poll
[36900.990820] uvcvideo: uvc_v4l2_poll
[36900.990844] uvcvideo: uvc_v4l2_poll
[36901.002279] uvcvideo: uvc_v4l2_poll
[36901.002474] uvcvideo: uvc_v4l2_poll
[36901.002512] uvcvideo: uvc_v4l2_poll
[36901.014490] uvcvideo: uvc_v4l2_poll
[36901.014636] uvcvideo: uvc_v4l2_poll
[36901.014660] uvcvideo: uvc_v4l2_poll
[36901.027116] uvcvideo: uvc_v4l2_poll
[36901.027332] uvcvideo: uvc_v4l2_poll
[36901.027366] uvcvideo: uvc_v4l2_poll
[36901.038038] uvcvideo: uvc_v4l2_poll
[36901.038198] uvcvideo: uvc_v4l2_poll
[36901.038248] uvcvideo: uvc_v4l2_poll
[36901.049865] uvcvideo: uvc_v4l2_poll
[36901.050027] uvcvideo: uvc_v4l2_poll
[36901.050050] uvcvideo: uvc_v4l2_poll
[36901.061918] uvcvideo: uvc_v4l2_poll
[36901.062098] uvcvideo: uvc_v4l2_poll
[36901.062121] uvcvideo: uvc_v4l2_poll
[36901.073501] uvcvideo: uvc_v4l2_poll
[36901.073648] uvcvideo: uvc_v4l2_poll
[36901.073671] uvcvideo: uvc_v4l2_poll
[36901.085656] uvcvideo: uvc_v4l2_poll
[36901.085829] uvcvideo: uvc_v4l2_poll
[36901.085853] uvcvideo: uvc_v4l2_poll
[36901.097174] uvcvideo: uvc_v4l2_poll
[36901.097328] uvcvideo: uvc_v4l2_poll
[36901.097353] uvcvideo: uvc_v4l2_poll
[36901.109062] uvcvideo: uvc_v4l2_poll
[36901.109180] uvcvideo: uvc_v4l2_poll
[36901.109195] uvcvideo: uvc_v4l2_poll
[36901.121416] uvcvideo: uvc_v4l2_poll
[36901.121571] uvcvideo: uvc_v4l2_poll
[36901.121594] uvcvideo: uvc_v4l2_poll
[36901.132995] uvcvideo: uvc_v4l2_poll
[36901.133111] uvcvideo: uvc_v4l2_poll
[36901.133126] uvcvideo: uvc_v4l2_poll
[36901.145074] uvcvideo: uvc_v4l2_poll
[36901.145195] uvcvideo: uvc_v4l2_poll
[36901.145211] uvcvideo: uvc_v4l2_poll
[36901.157138] uvcvideo: uvc_v4l2_poll
[36901.157262] uvcvideo: uvc_v4l2_poll
[36901.157278] uvcvideo: uvc_v4l2_poll
[36901.168912] uvcvideo: uvc_v4l2_poll
[36901.169034] uvcvideo: uvc_v4l2_poll
[36901.169050] uvcvideo: uvc_v4l2_poll
[36901.180927] uvcvideo: uvc_v4l2_poll
[36901.181048] uvcvideo: uvc_v4l2_poll
[36901.181063] uvcvideo: uvc_v4l2_poll
[36901.373153] uvcvideo: uvc_v4l2_poll
[36901.373303] uvcvideo: uvc_v4l2_poll
[36901.373326] uvcvideo: uvc_v4l2_poll
[36901.385256] uvcvideo: uvc_v4l2_poll
[36901.385422] uvcvideo: uvc_v4l2_poll
[36901.385446] uvcvideo: uvc_v4l2_poll
[36901.397060] uvcvideo: uvc_v4l2_poll
[36901.397222] uvcvideo: uvc_v4l2_poll
[36901.397246] uvcvideo: uvc_v4l2_poll
[36901.409001] uvcvideo: uvc_v4l2_poll
[36901.409166] uvcvideo: uvc_v4l2_poll
[36901.409189] uvcvideo: uvc_v4l2_poll
[36901.421548] uvcvideo: uvc_v4l2_poll
[36901.421707] uvcvideo: uvc_v4l2_poll
[36901.421730] uvcvideo: uvc_v4l2_poll
[36901.433367] uvcvideo: uvc_v4l2_poll
[36901.433544] uvcvideo: uvc_v4l2_poll
[36901.433568] uvcvideo: uvc_v4l2_poll
[36901.445461] uvcvideo: uvc_v4l2_poll
[36901.445627] uvcvideo: uvc_v4l2_poll
[36901.445650] uvcvideo: uvc_v4l2_poll
[36901.457490] uvcvideo: uvc_v4l2_poll
[36901.457714] uvcvideo: uvc_v4l2_poll
[36901.458946] uvcvideo: uvc_v4l2_poll
[36901.469233] uvcvideo: uvc_v4l2_poll
[36901.469464] uvcvideo: uvc_v4l2_poll
[36901.469506] uvcvideo: uvc_v4l2_poll
[36901.481234] uvcvideo: uvc_v4l2_poll
[36901.481425] uvcvideo: uvc_v4l2_poll
[36901.481449] uvcvideo: uvc_v4l2_poll
[36901.493304] uvcvideo: uvc_v4l2_poll
[36901.493496] uvcvideo: uvc_v4l2_poll
[36901.493521] uvcvideo: uvc_v4l2_poll
[36901.505052] uvcvideo: uvc_v4l2_poll
[36901.505242] uvcvideo: uvc_v4l2_poll
[36901.505265] uvcvideo: uvc_v4l2_poll
[36901.521357] uvcvideo: uvc_v4l2_poll
[36901.521464] uvcvideo: uvc_v4l2_poll
[36901.521486] uvcvideo: uvc_v4l2_poll
[36901.565096] uvcvideo: uvc_v4l2_poll
[36901.565196] uvcvideo: uvc_v4l2_poll
[36901.565217] uvcvideo: uvc_v4l2_poll
[36901.709275] uvcvideo: uvc_v4l2_poll
[36901.709461] uvcvideo: uvc_v4l2_poll
[36901.709485] uvcvideo: uvc_v4l2_poll
[36901.933704] uvcvideo: uvc_v4l2_poll
[36901.933826] uvcvideo: uvc_v4l2_poll
[36901.934110] uvcvideo: uvc_v4l2_poll
[36901.944175] uvcvideo: uvc_v4l2_poll
[36901.948502] uvcvideo: uvc_v4l2_poll
[36901.948544] uvcvideo: uvc_v4l2_poll
[36901.953976] uvcvideo: uvc_v4l2_poll
[36901.954211] uvcvideo: uvc_v4l2_poll
[36902.026990] uvcvideo: uvc_v4l2_poll
[36902.027261] uvcvideo: uvc_v4l2_poll
[36902.027288] uvcvideo: uvc_v4l2_poll
[36902.323713] uvcvideo: uvc_v4l2_poll
[36902.323807] uvcvideo: uvc_v4l2_poll
[36902.662994] uvcvideo: uvc_v4l2_poll
[36902.663346] uvcvideo: uvc_v4l2_poll
[36902.663383] uvcvideo: uvc_v4l2_poll
[36902.724014] uvcvideo: uvc_v4l2_poll
[36902.724859] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
[36902.724861] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[36902.738789] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
[36902.738792] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[36902.752584] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
[36902.752586] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[36902.766498] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
[36902.766500] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[36902.780243] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
[36902.780245] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[36902.794254] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
[36902.794256] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[36902.808128] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
[36902.808130] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[36902.822255] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
[36902.822257] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[36902.836120] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
[36902.836122] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[36902.850215] uvcvideo: uvc_v4l2_poll
[36902.851956] uvcvideo: uvc_v4l2_poll
[36902.852421] uvcvideo: uvc_v4l2_poll
[36903.138795] uvcvideo: uvc_v4l2_poll
[36903.138883] uvcvideo: uvc_v4l2_poll
[36903.346453] uvcvideo: uvc_v4l2_poll
[36903.346628] uvcvideo: uvc_v4l2_poll
[36903.346649] uvcvideo: uvc_v4l2_poll
[36903.358330] uvcvideo: uvc_v4l2_poll
[36903.358524] uvcvideo: uvc_v4l2_poll
[36903.358548] uvcvideo: uvc_v4l2_poll
[36903.370277] uvcvideo: uvc_v4l2_poll
[36903.370467] uvcvideo: uvc_v4l2_poll
[36903.370490] uvcvideo: uvc_v4l2_poll
[36903.382250] uvcvideo: uvc_v4l2_poll
[36903.382479] uvcvideo: uvc_v4l2_poll
[36903.382516] uvcvideo: uvc_v4l2_poll
[36903.394326] uvcvideo: uvc_v4l2_poll
[36903.394524] uvcvideo: uvc_v4l2_poll
[36903.395288] uvcvideo: uvc_v4l2_poll
[36903.406192] uvcvideo: uvc_v4l2_poll
[36903.406391] uvcvideo: uvc_v4l2_poll
[36903.406429] uvcvideo: uvc_v4l2_poll
[36903.419276] uvcvideo: uvc_v4l2_poll
[36903.419432] uvcvideo: uvc_v4l2_poll
[36903.419454] uvcvideo: uvc_v4l2_poll
[36903.430397] uvcvideo: uvc_v4l2_poll
[36903.430560] uvcvideo: uvc_v4l2_poll
[36903.430582] uvcvideo: uvc_v4l2_poll
[36903.442237] uvcvideo: uvc_v4l2_poll
[36903.442427] uvcvideo: uvc_v4l2_poll
[36903.442465] uvcvideo: uvc_v4l2_poll
[36903.454406] uvcvideo: uvc_v4l2_poll
[36903.454556] uvcvideo: uvc_v4l2_poll
[36903.454592] uvcvideo: uvc_v4l2_poll
[36903.466190] uvcvideo: uvc_v4l2_poll
[36903.466350] uvcvideo: uvc_v4l2_poll
[36903.466371] uvcvideo: uvc_v4l2_poll
[36903.477938] uvcvideo: uvc_v4l2_poll
[36903.478079] uvcvideo: uvc_v4l2_poll
[36903.478104] uvcvideo: uvc_v4l2_poll
[36903.489985] uvcvideo: uvc_v4l2_poll
[36903.490145] uvcvideo: uvc_v4l2_poll
[36903.490167] uvcvideo: uvc_v4l2_poll
[36903.501943] uvcvideo: uvc_v4l2_poll
[36903.502103] uvcvideo: uvc_v4l2_poll
[36903.502124] uvcvideo: uvc_v4l2_poll
[36903.514802] uvcvideo: uvc_v4l2_poll
[36903.514956] uvcvideo: uvc_v4l2_poll
[36903.514978] uvcvideo: uvc_v4l2_poll
[36903.525975] uvcvideo: uvc_v4l2_poll
[36903.526130] uvcvideo: uvc_v4l2_poll
[36903.526151] uvcvideo: uvc_v4l2_poll
[36903.537902] uvcvideo: uvc_v4l2_poll
[36903.538168] uvcvideo: uvc_v4l2_poll
[36903.538211] uvcvideo: uvc_v4l2_poll
[36903.550119] uvcvideo: uvc_v4l2_poll
[36903.550306] uvcvideo: uvc_v4l2_poll
[36903.550330] uvcvideo: uvc_v4l2_poll
[36903.562098] uvcvideo: uvc_v4l2_poll
[36903.562269] uvcvideo: uvc_v4l2_poll
[36903.562292] uvcvideo: uvc_v4l2_poll
[36903.574181] uvcvideo: uvc_v4l2_poll
[36903.574355] uvcvideo: uvc_v4l2_poll
[36903.574378] uvcvideo: uvc_v4l2_poll
[36903.585838] uvcvideo: uvc_v4l2_poll
[36903.586019] uvcvideo: uvc_v4l2_poll
[36903.586043] uvcvideo: uvc_v4l2_poll
[36903.597640] uvcvideo: uvc_v4l2_poll
[36903.597852] uvcvideo: uvc_v4l2_poll
[36903.597896] uvcvideo: uvc_v4l2_poll
[36903.610587] uvcvideo: uvc_v4l2_poll
[36903.610759] uvcvideo: uvc_v4l2_poll
[36903.610783] uvcvideo: uvc_v4l2_poll
[36903.621411] uvcvideo: uvc_v4l2_poll
[36903.621564] uvcvideo: uvc_v4l2_poll
[36903.621586] uvcvideo: uvc_v4l2_poll
[36903.633631] uvcvideo: uvc_v4l2_poll
[36903.633843] uvcvideo: uvc_v4l2_poll
[36903.633882] uvcvideo: uvc_v4l2_poll
[36903.645470] uvcvideo: uvc_v4l2_poll
[36903.645680] uvcvideo: uvc_v4l2_poll
[36903.645705] uvcvideo: uvc_v4l2_poll
[36903.657339] uvcvideo: uvc_v4l2_poll
[36903.657496] uvcvideo: uvc_v4l2_poll
[36903.657518] uvcvideo: uvc_v4l2_poll
[36903.669526] uvcvideo: uvc_v4l2_poll
[36903.669676] uvcvideo: uvc_v4l2_poll
[36903.669697] uvcvideo: uvc_v4l2_poll
[36903.681637] uvcvideo: uvc_v4l2_poll
[36903.681789] uvcvideo: uvc_v4l2_poll
[36903.681810] uvcvideo: uvc_v4l2_poll
[36903.693490] uvcvideo: uvc_v4l2_poll
[36903.693641] uvcvideo: uvc_v4l2_poll
[36903.693662] uvcvideo: uvc_v4l2_poll
[36903.705187] uvcvideo: uvc_v4l2_poll
[36903.705337] uvcvideo: uvc_v4l2_poll
[36903.705358] uvcvideo: uvc_v4l2_poll
[36903.717813] uvcvideo: uvc_v4l2_poll
[36903.717971] uvcvideo: uvc_v4l2_poll
[36903.717991] uvcvideo: uvc_v4l2_poll
[36903.729308] uvcvideo: uvc_v4l2_poll
[36903.729463] uvcvideo: uvc_v4l2_poll
[36903.729484] uvcvideo: uvc_v4l2_poll
[36903.741159] uvcvideo: uvc_v4l2_poll
[36903.741288] uvcvideo: uvc_v4l2_poll
[36903.741303] uvcvideo: uvc_v4l2_poll
[36903.752851] uvcvideo: uvc_v4l2_poll
[36903.752979] uvcvideo: uvc_v4l2_poll
[36903.753001] uvcvideo: uvc_v4l2_poll
[36903.764878] uvcvideo: uvc_v4l2_poll
[36903.764988] uvcvideo: uvc_v4l2_poll
[36903.765001] uvcvideo: uvc_v4l2_poll
[36903.777133] uvcvideo: uvc_v4l2_poll
[36903.777239] uvcvideo: uvc_v4l2_poll
[36903.777252] uvcvideo: uvc_v4l2_poll
[36903.788853] uvcvideo: uvc_v4l2_poll
[36903.788968] uvcvideo: uvc_v4l2_poll
[36903.788981] uvcvideo: uvc_v4l2_poll
[36903.801090] uvcvideo: uvc_v4l2_poll
[36903.801196] uvcvideo: uvc_v4l2_poll
[36903.801208] uvcvideo: uvc_v4l2_poll
[36903.816845] uvcvideo: uvc_v4l2_poll
[36903.816957] uvcvideo: uvc_v4l2_poll
[36903.816970] uvcvideo: uvc_v4l2_poll
[36903.825950] uvcvideo: uvc_v4l2_poll
[36903.826056] uvcvideo: uvc_v4l2_poll
[36903.826069] uvcvideo: uvc_v4l2_poll
[36903.836792] uvcvideo: uvc_v4l2_poll
[36903.836899] uvcvideo: uvc_v4l2_poll
[36903.836911] uvcvideo: uvc_v4l2_poll
[36903.848668] uvcvideo: uvc_v4l2_poll
[36903.848843] uvcvideo: uvc_v4l2_poll
[36903.848855] uvcvideo: uvc_v4l2_poll
[36903.860692] uvcvideo: uvc_v4l2_poll
[36903.860803] uvcvideo: uvc_v4l2_poll
[36903.860816] uvcvideo: uvc_v4l2_poll
[36903.872348] uvcvideo: uvc_v4l2_poll
[36903.872417] uvcvideo: uvc_v4l2_poll
[36903.872429] uvcvideo: uvc_v4l2_poll
[36904.135855] uvcvideo: uvc_v4l2_poll
[36904.135958] uvcvideo: uvc_v4l2_poll
[36904.135980] uvcvideo: uvc_v4l2_poll
[36904.147785] uvcvideo: uvc_v4l2_poll
[36904.147951] uvcvideo: uvc_v4l2_poll
[36904.147974] uvcvideo: uvc_v4l2_poll
[36904.159883] uvcvideo: uvc_v4l2_poll
[36904.160041] uvcvideo: uvc_v4l2_poll
[36904.160065] uvcvideo: uvc_v4l2_poll
[36904.171610] uvcvideo: uvc_v4l2_poll
[36904.171785] uvcvideo: uvc_v4l2_poll
[36904.171809] uvcvideo: uvc_v4l2_poll
[36904.183957] uvcvideo: uvc_v4l2_poll
[36904.184124] uvcvideo: uvc_v4l2_poll
[36904.184148] uvcvideo: uvc_v4l2_poll
[36904.195292] uvcvideo: uvc_v4l2_poll
[36904.195463] uvcvideo: uvc_v4l2_poll
[36904.195492] uvcvideo: uvc_v4l2_poll
[36904.208238] uvcvideo: uvc_v4l2_poll
[36904.208401] uvcvideo: uvc_v4l2_poll
[36904.208424] uvcvideo: uvc_v4l2_poll
[36904.219755] uvcvideo: uvc_v4l2_poll
[36904.219918] uvcvideo: uvc_v4l2_poll
[36904.219941] uvcvideo: uvc_v4l2_poll
[36904.231435] uvcvideo: uvc_v4l2_poll
[36904.231745] uvcvideo: uvc_v4l2_poll
[36904.231952] uvcvideo: uvc_v4l2_poll
[36904.243364] uvcvideo: uvc_v4l2_poll
[36904.243527] uvcvideo: uvc_v4l2_poll
[36904.243749] uvcvideo: uvc_v4l2_poll
[36904.255426] uvcvideo: uvc_v4l2_poll
[36904.255765] uvcvideo: uvc_v4l2_poll
[36904.255803] uvcvideo: uvc_v4l2_poll
[36904.267287] uvcvideo: uvc_v4l2_poll
[36904.267434] uvcvideo: uvc_v4l2_poll
[36904.267458] uvcvideo: uvc_v4l2_poll
[36904.279305] uvcvideo: uvc_v4l2_poll
[36904.279455] uvcvideo: uvc_v4l2_poll
[36904.279478] uvcvideo: uvc_v4l2_poll
[36904.291315] uvcvideo: uvc_v4l2_poll
[36904.291465] uvcvideo: uvc_v4l2_poll
[36904.291489] uvcvideo: uvc_v4l2_poll
[36904.303858] uvcvideo: uvc_v4l2_poll
[36904.304003] uvcvideo: uvc_v4l2_poll
[36904.304034] uvcvideo: uvc_v4l2_poll
[36904.315138] uvcvideo: uvc_v4l2_poll
[36904.315287] uvcvideo: uvc_v4l2_poll
[36904.315310] uvcvideo: uvc_v4l2_poll
[36904.327149] uvcvideo: uvc_v4l2_poll
[36904.327327] uvcvideo: uvc_v4l2_poll
[36904.327366] uvcvideo: uvc_v4l2_poll
[36904.339102] uvcvideo: uvc_v4l2_poll
[36904.339287] uvcvideo: uvc_v4l2_poll
[36904.339328] uvcvideo: uvc_v4l2_poll
[36904.350931] uvcvideo: uvc_v4l2_poll
[36904.351086] uvcvideo: uvc_v4l2_poll
[36904.351110] uvcvideo: uvc_v4l2_poll
[36904.362684] uvcvideo: uvc_v4l2_poll
[36904.362817] uvcvideo: uvc_v4l2_poll
[36904.362840] uvcvideo: uvc_v4l2_poll
[36904.374814] uvcvideo: uvc_v4l2_poll
[36904.374982] uvcvideo: uvc_v4l2_poll
[36904.375007] uvcvideo: uvc_v4l2_poll
[36904.386727] uvcvideo: uvc_v4l2_poll
[36904.386905] uvcvideo: uvc_v4l2_poll
[36904.386930] uvcvideo: uvc_v4l2_poll
[36904.399388] uvcvideo: uvc_v4l2_poll
[36904.399788] uvcvideo: uvc_v4l2_poll
[36904.399830] uvcvideo: uvc_v4l2_poll
[36904.410842] uvcvideo: uvc_v4l2_poll
[36904.411047] uvcvideo: uvc_v4l2_poll
[36904.411088] uvcvideo: uvc_v4l2_poll
[36904.422666] uvcvideo: uvc_v4l2_poll
[36904.422844] uvcvideo: uvc_v4l2_poll
[36904.422867] uvcvideo: uvc_v4l2_poll
[36904.434763] uvcvideo: uvc_v4l2_poll
[36904.434932] uvcvideo: uvc_v4l2_poll
[36904.434956] uvcvideo: uvc_v4l2_poll
[36904.446575] uvcvideo: uvc_v4l2_poll
[36904.446761] uvcvideo: uvc_v4l2_poll
[36904.446795] uvcvideo: uvc_v4l2_poll
[36904.458532] uvcvideo: uvc_v4l2_poll
[36904.458703] uvcvideo: uvc_v4l2_poll
[36904.458727] uvcvideo: uvc_v4l2_poll
[36904.470760] uvcvideo: uvc_v4l2_poll
[36904.470933] uvcvideo: uvc_v4l2_poll
[36904.470958] uvcvideo: uvc_v4l2_poll
[36904.482365] uvcvideo: uvc_v4l2_poll
[36904.482546] uvcvideo: uvc_v4l2_poll
[36904.482570] uvcvideo: uvc_v4l2_poll
[36904.494225] uvcvideo: uvc_v4l2_poll
[36904.494394] uvcvideo: uvc_v4l2_poll
[36904.494419] uvcvideo: uvc_v4l2_poll
[36904.506430] uvcvideo: uvc_v4l2_poll
[36904.506580] uvcvideo: uvc_v4l2_poll
[36904.506603] uvcvideo: uvc_v4l2_poll
[36904.518291] uvcvideo: uvc_v4l2_poll
[36904.518442] uvcvideo: uvc_v4l2_poll
[36904.518466] uvcvideo: uvc_v4l2_poll
[36904.530339] uvcvideo: uvc_v4l2_poll
[36904.530490] uvcvideo: uvc_v4l2_poll
[36904.530513] uvcvideo: uvc_v4l2_poll
[36904.542115] uvcvideo: uvc_v4l2_poll
[36904.542268] uvcvideo: uvc_v4l2_poll
[36904.542292] uvcvideo: uvc_v4l2_poll
[36904.554227] uvcvideo: uvc_v4l2_poll
[36904.554411] uvcvideo: uvc_v4l2_poll
[36904.554447] uvcvideo: uvc_v4l2_poll
[36904.566166] uvcvideo: uvc_v4l2_poll
[36904.566342] uvcvideo: uvc_v4l2_poll
[36904.566375] uvcvideo: uvc_v4l2_poll
[36904.578233] uvcvideo: uvc_v4l2_poll
[36904.578409] uvcvideo: uvc_v4l2_poll
[36904.578444] uvcvideo: uvc_v4l2_poll
[36904.590274] uvcvideo: uvc_v4l2_poll
[36904.590429] uvcvideo: uvc_v4l2_poll
[36904.590453] uvcvideo: uvc_v4l2_poll
[36904.602521] uvcvideo: uvc_v4l2_poll
[36904.602661] uvcvideo: uvc_v4l2_poll
[36904.602694] uvcvideo: uvc_v4l2_poll
[36905.246289] uvcvideo: uvc_v4l2_poll
[36905.246384] uvcvideo: uvc_v4l2_poll
[36905.428533] uvcvideo: uvc_v4l2_poll
[36905.428615] uvcvideo: uvc_v4l2_poll
[36905.428665] uvcvideo: uvc_v4l2_poll
[36905.428950] uvcvideo: uvc_v4l2_poll
[36905.429026] uvcvideo: uvc_v4l2_poll
[36905.439840] uvcvideo: uvc_v4l2_poll
[36905.440418] uvcvideo: uvc_v4l2_poll
[36905.440455] uvcvideo: uvc_v4l2_poll
[36905.451851] uvcvideo: uvc_v4l2_poll
[36905.452509] uvcvideo: uvc_v4l2_poll
[36905.452547] uvcvideo: uvc_v4l2_poll
[36905.465456] uvcvideo: uvc_v4l2_poll
[36905.465901] uvcvideo: uvc_v4l2_poll
[36905.465932] uvcvideo: uvc_v4l2_poll
[36905.476759] uvcvideo: uvc_v4l2_poll
[36905.477164] uvcvideo: uvc_v4l2_poll
[36905.477201] uvcvideo: uvc_v4l2_poll
[36905.487554] uvcvideo: uvc_v4l2_poll
[36905.488961] uvcvideo: uvc_v4l2_poll
[36905.488999] uvcvideo: uvc_v4l2_poll
[36905.500621] uvcvideo: uvc_v4l2_poll
[36905.501062] uvcvideo: uvc_v4l2_poll
[36905.501102] uvcvideo: uvc_v4l2_poll
[36905.511573] uvcvideo: uvc_v4l2_poll
[36905.511910] uvcvideo: uvc_v4l2_poll
[36905.511945] uvcvideo: uvc_v4l2_poll
[36905.524026] uvcvideo: uvc_v4l2_poll
[36905.524135] uvcvideo: uvc_v4l2_poll
[36905.524544] uvcvideo: uvc_v4l2_poll
[36905.530977] uvcvideo: uvc_v4l2_poll
[36905.531030] uvcvideo: uvc_v4l2_poll
[36905.535590] uvcvideo: uvc_v4l2_poll
[36905.536020] uvcvideo: uvc_v4l2_poll
[36905.536063] uvcvideo: uvc_v4l2_poll
[36905.547649] uvcvideo: uvc_v4l2_poll
[36905.548178] uvcvideo: uvc_v4l2_poll
[36905.548216] uvcvideo: uvc_v4l2_poll
[36905.560608] uvcvideo: uvc_v4l2_poll
[36905.562744] uvcvideo: uvc_v4l2_poll
[36905.562789] uvcvideo: uvc_v4l2_poll
[36905.571469] uvcvideo: uvc_v4l2_poll
[36905.573193] uvcvideo: uvc_v4l2_poll
[36905.573242] uvcvideo: uvc_v4l2_poll
[36905.583502] uvcvideo: uvc_v4l2_poll
[36905.584119] uvcvideo: uvc_v4l2_poll
[36905.584159] uvcvideo: uvc_v4l2_poll
[36905.596449] uvcvideo: uvc_v4l2_poll
[36905.596755] uvcvideo: uvc_v4l2_poll
[36905.596784] uvcvideo: uvc_v4l2_poll
[36905.607241] uvcvideo: uvc_v4l2_poll
[36905.610807] uvcvideo: uvc_v4l2_poll
[36905.610846] uvcvideo: uvc_v4l2_poll
[36905.619192] uvcvideo: uvc_v4l2_poll
[36905.619963] uvcvideo: uvc_v4l2_poll
[36905.620007] uvcvideo: uvc_v4l2_poll
[36905.630939] uvcvideo: uvc_v4l2_poll
[36905.631433] uvcvideo: uvc_v4l2_poll
[36905.631475] uvcvideo: uvc_v4l2_poll
[36905.643676] uvcvideo: uvc_v4l2_poll
[36905.644204] uvcvideo: uvc_v4l2_poll
[36905.644236] uvcvideo: uvc_v4l2_poll
[36905.655967] uvcvideo: uvc_v4l2_poll
[36905.656586] uvcvideo: uvc_v4l2_poll
[36905.656633] uvcvideo: uvc_v4l2_poll
[36905.906580] uvcvideo: uvc_v4l2_poll
[36905.907041] uvcvideo: uvc_v4l2_poll
[36905.907070] uvcvideo: uvc_v4l2_poll
[36905.918125] uvcvideo: uvc_v4l2_poll
[36905.918768] uvcvideo: uvc_v4l2_poll
[36905.918815] uvcvideo: uvc_v4l2_poll
[36905.930151] uvcvideo: uvc_v4l2_poll
[36905.930748] uvcvideo: uvc_v4l2_poll
[36905.930782] uvcvideo: uvc_v4l2_poll
[36905.944126] uvcvideo: uvc_v4l2_poll
[36905.946565] uvcvideo: uvc_v4l2_poll
[36905.946600] uvcvideo: uvc_v4l2_poll
[36905.954339] uvcvideo: uvc_v4l2_poll
[36905.956872] uvcvideo: uvc_v4l2_poll
[36905.956922] uvcvideo: uvc_v4l2_poll
[36905.966094] uvcvideo: uvc_v4l2_poll
[36905.966755] uvcvideo: uvc_v4l2_poll
[36905.966790] uvcvideo: uvc_v4l2_poll
[36905.977769] uvcvideo: uvc_v4l2_poll
[36905.978288] uvcvideo: uvc_v4l2_poll
[36905.978318] uvcvideo: uvc_v4l2_poll
[36905.993047] uvcvideo: uvc_v4l2_poll
[36905.993458] uvcvideo: uvc_v4l2_poll
[36905.993502] uvcvideo: uvc_v4l2_poll
[36906.002050] uvcvideo: uvc_v4l2_poll
[36906.002880] uvcvideo: uvc_v4l2_poll
[36906.002925] uvcvideo: uvc_v4l2_poll
[36906.014089] uvcvideo: uvc_v4l2_poll
[36906.014705] uvcvideo: uvc_v4l2_poll
[36906.014735] uvcvideo: uvc_v4l2_poll
[36906.026779] uvcvideo: uvc_v4l2_poll
[36906.027442] uvcvideo: uvc_v4l2_poll
[36906.027485] uvcvideo: uvc_v4l2_poll
[36906.037964] uvcvideo: uvc_v4l2_poll
[36906.039407] uvcvideo: uvc_v4l2_poll
[36906.039447] uvcvideo: uvc_v4l2_poll
[36906.049814] uvcvideo: uvc_v4l2_poll
[36906.050357] uvcvideo: uvc_v4l2_poll
[36906.050397] uvcvideo: uvc_v4l2_poll
[36906.061706] uvcvideo: uvc_v4l2_poll
[36906.062332] uvcvideo: uvc_v4l2_poll
[36906.062371] uvcvideo: uvc_v4l2_poll
[36906.073868] uvcvideo: uvc_v4l2_poll
[36906.077369] uvcvideo: uvc_v4l2_poll
[36906.077402] uvcvideo: uvc_v4l2_poll
[36906.086460] uvcvideo: uvc_v4l2_poll
[36906.086982] uvcvideo: uvc_v4l2_poll
[36906.087009] uvcvideo: uvc_v4l2_poll
[36906.099210] uvcvideo: uvc_v4l2_poll
[36906.099924] uvcvideo: uvc_v4l2_poll
[36906.099978] uvcvideo: uvc_v4l2_poll
[36906.110744] uvcvideo: uvc_v4l2_poll
[36906.111244] uvcvideo: uvc_v4l2_poll
[36906.111279] uvcvideo: uvc_v4l2_poll
[36906.121367] uvcvideo: uvc_v4l2_poll
[36906.121714] uvcvideo: uvc_v4l2_poll
[36906.121741] uvcvideo: uvc_v4l2_poll
[36906.134153] uvcvideo: uvc_v4l2_poll
[36906.134542] uvcvideo: uvc_v4l2_poll
[36906.134589] uvcvideo: uvc_v4l2_poll
[36906.384613] uvcvideo: uvc_v4l2_poll
[36906.385130] uvcvideo: uvc_v4l2_poll
[36906.385169] uvcvideo: uvc_v4l2_poll
[36906.396499] uvcvideo: uvc_v4l2_poll
[36906.396955] uvcvideo: uvc_v4l2_poll
[36906.396995] uvcvideo: uvc_v4l2_poll
[36906.409607] uvcvideo: uvc_v4l2_poll
[36906.409963] uvcvideo: uvc_v4l2_poll
[36906.410002] uvcvideo: uvc_v4l2_poll
[36906.420594] uvcvideo: uvc_v4l2_poll
[36906.422175] uvcvideo: uvc_v4l2_poll
[36906.422219] uvcvideo: uvc_v4l2_poll
[36906.432239] uvcvideo: uvc_v4l2_poll
[36906.432775] uvcvideo: uvc_v4l2_poll
[36906.432814] uvcvideo: uvc_v4l2_poll
[36906.444240] uvcvideo: uvc_v4l2_poll
[36906.444686] uvcvideo: uvc_v4l2_poll
[36906.444725] uvcvideo: uvc_v4l2_poll
[36906.456739] uvcvideo: uvc_v4l2_poll
[36906.457145] uvcvideo: uvc_v4l2_poll
[36906.457187] uvcvideo: uvc_v4l2_poll
[36906.468529] uvcvideo: uvc_v4l2_poll
[36906.468976] uvcvideo: uvc_v4l2_poll
[36906.469012] uvcvideo: uvc_v4l2_poll
[36906.481056] uvcvideo: uvc_v4l2_poll
[36906.483352] uvcvideo: uvc_v4l2_poll
[36906.483384] uvcvideo: uvc_v4l2_poll
[36906.493033] uvcvideo: uvc_v4l2_poll
[36906.493496] uvcvideo: uvc_v4l2_poll
[36906.493535] uvcvideo: uvc_v4l2_poll
[36906.504428] uvcvideo: uvc_v4l2_poll
[36906.504815] uvcvideo: uvc_v4l2_poll
[36906.504857] uvcvideo: uvc_v4l2_poll
[36906.516433] uvcvideo: uvc_v4l2_poll
[36906.516882] uvcvideo: uvc_v4l2_poll
[36906.516913] uvcvideo: uvc_v4l2_poll
[36906.528294] uvcvideo: uvc_v4l2_poll
[36906.528781] uvcvideo: uvc_v4l2_poll
[36906.528811] uvcvideo: uvc_v4l2_poll
[36906.540083] uvcvideo: uvc_v4l2_poll
[36906.545596] uvcvideo: uvc_v4l2_poll
[36906.545631] uvcvideo: uvc_v4l2_poll
[36906.552177] uvcvideo: uvc_v4l2_poll
[36906.552668] uvcvideo: uvc_v4l2_poll
[36906.552706] uvcvideo: uvc_v4l2_poll
[36906.564006] uvcvideo: uvc_v4l2_poll
[36906.564414] uvcvideo: uvc_v4l2_poll
[36906.564459] uvcvideo: uvc_v4l2_poll
[36906.577949] uvcvideo: uvc_v4l2_poll
[36906.580388] uvcvideo: uvc_v4l2_poll
[36906.580422] uvcvideo: uvc_v4l2_poll
[36906.588036] uvcvideo: uvc_v4l2_poll
[36906.589606] uvcvideo: uvc_v4l2_poll
[36906.589653] uvcvideo: uvc_v4l2_poll
[36906.599834] uvcvideo: uvc_v4l2_poll
[36906.600224] uvcvideo: uvc_v4l2_poll
[36906.600255] uvcvideo: uvc_v4l2_poll
[36906.612187] uvcvideo: uvc_v4l2_poll
[36906.612724] uvcvideo: uvc_v4l2_poll
[36906.612759] uvcvideo: uvc_v4l2_poll
[36906.626464] uvcvideo: uvc_v4l2_poll
[36906.627010] uvcvideo: uvc_v4l2_poll
[36906.627054] uvcvideo: uvc_v4l2_poll
[36906.635776] uvcvideo: uvc_v4l2_poll
[36906.636946] uvcvideo: uvc_v4l2_poll
[36906.636997] uvcvideo: uvc_v4l2_poll
[36906.647438] uvcvideo: uvc_v4l2_poll
[36906.648310] uvcvideo: uvc_v4l2_poll
[36906.648355] uvcvideo: uvc_v4l2_poll
[36906.667219] uvcvideo: uvc_v4l2_poll
[36906.667296] uvcvideo: uvc_v4l2_poll
[36906.668705] uvcvideo: uvc_v4l2_poll
[36906.675291] uvcvideo: uvc_v4l2_poll
[36906.676198] uvcvideo: uvc_v4l2_poll
[36907.030453] uvcvideo: uvc_v4l2_poll
[36907.031677] uvcvideo: uvc_v4l2_poll
[36907.031860] uvcvideo: uvc_v4l2_poll
[36907.041830] uvcvideo: uvc_v4l2_poll
[36907.041936] uvcvideo: uvc_v4l2_poll
[36907.041952] uvcvideo: uvc_v4l2_poll
[36907.054063] uvcvideo: uvc_v4l2_poll
[36907.054204] uvcvideo: uvc_v4l2_poll
[36907.054220] uvcvideo: uvc_v4l2_poll
[36907.066022] uvcvideo: uvc_v4l2_poll
[36907.066141] uvcvideo: uvc_v4l2_poll
[36907.066157] uvcvideo: uvc_v4l2_poll
[36907.077646] uvcvideo: uvc_v4l2_poll
[36907.077732] uvcvideo: uvc_v4l2_poll
[36907.077742] uvcvideo: uvc_v4l2_poll
[36907.089989] uvcvideo: uvc_v4l2_poll
[36907.090061] uvcvideo: uvc_v4l2_poll
[36907.090072] uvcvideo: uvc_v4l2_poll
[36907.101499] uvcvideo: uvc_v4l2_poll
[36907.101564] uvcvideo: uvc_v4l2_poll
[36907.101571] uvcvideo: uvc_v4l2_poll
[36907.113780] uvcvideo: uvc_v4l2_poll
[36907.113856] uvcvideo: uvc_v4l2_poll
[36907.113864] uvcvideo: uvc_v4l2_poll
[36907.125867] uvcvideo: uvc_v4l2_poll
[36907.125931] uvcvideo: uvc_v4l2_poll
[36907.125938] uvcvideo: uvc_v4l2_poll
[36907.137927] uvcvideo: uvc_v4l2_poll
[36907.138005] uvcvideo: uvc_v4l2_poll
[36907.138012] uvcvideo: uvc_v4l2_poll
[36907.149896] uvcvideo: uvc_v4l2_poll
[36907.149969] uvcvideo: uvc_v4l2_poll
[36907.149976] uvcvideo: uvc_v4l2_poll
[36907.162523] uvcvideo: uvc_v4l2_poll
[36907.162592] uvcvideo: uvc_v4l2_poll
[36907.162600] uvcvideo: uvc_v4l2_poll
[36907.173496] uvcvideo: uvc_v4l2_poll
[36907.173567] uvcvideo: uvc_v4l2_poll
[36907.173575] uvcvideo: uvc_v4l2_poll
[36907.185440] uvcvideo: uvc_v4l2_poll
[36907.185509] uvcvideo: uvc_v4l2_poll
[36907.185516] uvcvideo: uvc_v4l2_poll
[36907.197575] uvcvideo: uvc_v4l2_poll
[36907.197646] uvcvideo: uvc_v4l2_poll
[36907.197653] uvcvideo: uvc_v4l2_poll
[36907.209465] uvcvideo: uvc_v4l2_poll
[36907.209530] uvcvideo: uvc_v4l2_poll
[36907.209536] uvcvideo: uvc_v4l2_poll
[36907.221499] uvcvideo: uvc_v4l2_poll
[36907.221572] uvcvideo: uvc_v4l2_poll
[36907.221579] uvcvideo: uvc_v4l2_poll
[36907.233347] uvcvideo: uvc_v4l2_poll
[36907.233419] uvcvideo: uvc_v4l2_poll
[36907.233426] uvcvideo: uvc_v4l2_poll
[36907.245302] uvcvideo: uvc_v4l2_poll
[36907.245377] uvcvideo: uvc_v4l2_poll
[36907.245385] uvcvideo: uvc_v4l2_poll
[36907.257420] uvcvideo: uvc_v4l2_poll
[36907.257493] uvcvideo: uvc_v4l2_poll
[36907.257500] uvcvideo: uvc_v4l2_poll
[36907.269640] uvcvideo: uvc_v4l2_poll
[36907.269717] uvcvideo: uvc_v4l2_poll
[36907.269724] uvcvideo: uvc_v4l2_poll
[36907.281348] uvcvideo: uvc_v4l2_poll
[36907.281415] uvcvideo: uvc_v4l2_poll
[36907.281422] uvcvideo: uvc_v4l2_poll
[36907.293368] uvcvideo: uvc_v4l2_poll
[36907.293431] uvcvideo: uvc_v4l2_poll
[36907.293438] uvcvideo: uvc_v4l2_poll
[36907.305413] uvcvideo: uvc_v4l2_poll
[36907.305481] uvcvideo: uvc_v4l2_poll
[36907.305488] uvcvideo: uvc_v4l2_poll
[36907.317347] uvcvideo: uvc_v4l2_poll
[36907.317410] uvcvideo: uvc_v4l2_poll
[36907.317417] uvcvideo: uvc_v4l2_poll
[36907.329018] uvcvideo: uvc_v4l2_poll
[36907.329083] uvcvideo: uvc_v4l2_poll
[36907.329090] uvcvideo: uvc_v4l2_poll
[36907.341030] uvcvideo: uvc_v4l2_poll
[36907.341113] uvcvideo: uvc_v4l2_poll
[36907.341124] uvcvideo: uvc_v4l2_poll
[36907.353019] uvcvideo: uvc_v4l2_poll
[36907.353092] uvcvideo: uvc_v4l2_poll
[36907.353099] uvcvideo: uvc_v4l2_poll
[36907.366015] uvcvideo: uvc_v4l2_poll
[36907.366080] uvcvideo: uvc_v4l2_poll
[36907.366087] uvcvideo: uvc_v4l2_poll
[36907.376530] uvcvideo: uvc_v4l2_poll
[36907.376596] uvcvideo: uvc_v4l2_poll
[36907.376603] uvcvideo: uvc_v4l2_poll
[36907.388663] uvcvideo: uvc_v4l2_poll
[36907.388739] uvcvideo: uvc_v4l2_poll
[36907.388746] uvcvideo: uvc_v4l2_poll
[36907.400667] uvcvideo: uvc_v4l2_poll
[36907.400709] uvcvideo: uvc_v4l2_poll
[36907.400716] uvcvideo: uvc_v4l2_poll
[36907.412779] uvcvideo: uvc_v4l2_poll
[36907.412844] uvcvideo: uvc_v4l2_poll
[36907.412851] uvcvideo: uvc_v4l2_poll
[36907.424783] uvcvideo: uvc_v4l2_poll
[36907.424852] uvcvideo: uvc_v4l2_poll
[36907.424859] uvcvideo: uvc_v4l2_poll
[36907.436713] uvcvideo: uvc_v4l2_poll
[36907.436780] uvcvideo: uvc_v4l2_poll
[36907.436787] uvcvideo: uvc_v4l2_poll
[36907.557374] uvcvideo: uvc_v4l2_poll
[36907.557526] uvcvideo: uvc_v4l2_poll
[36907.557550] uvcvideo: uvc_v4l2_poll
[36907.567714] uvcvideo: uvc_v4l2_poll
[36907.567817] uvcvideo: uvc_v4l2_poll
[36907.567839] uvcvideo: uvc_v4l2_poll
[36907.829648] uvcvideo: uvc_v4l2_poll
[36907.829725] uvcvideo: uvc_v4l2_poll
[36907.830036] uvcvideo: uvc_v4l2_poll
[36907.831711] uvcvideo: uvc_v4l2_poll
[36907.843383] uvcvideo: uvc_v4l2_poll
[36907.843943] uvcvideo: uvc_v4l2_poll
[36907.844134] uvcvideo: uvc_v4l2_poll
[36907.857816] uvcvideo: uvc_v4l2_poll
[36907.858256] uvcvideo: uvc_v4l2_poll
[36907.858316] uvcvideo: uvc_v4l2_poll
[36907.938603] uvcvideo: uvc_v4l2_poll
[36907.938760] uvcvideo: uvc_v4l2_poll
[36907.940055] uvcvideo: uvc_v4l2_poll
[36908.666987] uvcvideo: uvc_v4l2_poll
[36908.667076] uvcvideo: uvc_v4l2_poll
[36908.667211] uvcvideo: uvc_v4l2_poll
[36908.667393] uvcvideo: uvc_v4l2_poll
[36908.667428] uvcvideo: uvc_v4l2_poll
[36908.760270] uvcvideo: uvc_v4l2_poll
[36908.760444] uvcvideo: uvc_v4l2_poll
[36908.761677] uvcvideo: uvc_v4l2_poll
[36908.928768] usb 2-1: USB disconnect, device number 10
[36909.174070] uvcvideo: uvc_v4l2_poll
[36909.174137] uvcvideo: uvc_v4l2_poll
[36909.174144] uvcvideo: uvc_v4l2_poll
[36909.182636] uvcvideo: uvc_v4l2_poll
[36909.182700] uvcvideo: uvc_v4l2_poll
[36909.182708] uvcvideo: uvc_v4l2_poll
[36909.194585] uvcvideo: uvc_v4l2_poll
[36909.194656] uvcvideo: uvc_v4l2_poll
[36909.194664] uvcvideo: uvc_v4l2_poll
[36909.206447] uvcvideo: uvc_v4l2_poll
[36909.206522] uvcvideo: uvc_v4l2_poll
[36909.206530] uvcvideo: uvc_v4l2_poll
[36909.218641] uvcvideo: uvc_v4l2_poll
[36909.218707] uvcvideo: uvc_v4l2_poll
[36909.218714] uvcvideo: uvc_v4l2_poll
[36909.230466] uvcvideo: uvc_v4l2_poll
[36909.230533] uvcvideo: uvc_v4l2_poll
[36909.230540] uvcvideo: uvc_v4l2_poll
[36909.231579] usb 2-1: new high-speed USB device number 11 using xhci_hcd
[36909.242367] uvcvideo: uvc_v4l2_poll
[36909.242431] uvcvideo: uvc_v4l2_poll
[36909.242438] uvcvideo: uvc_v4l2_poll
[36909.254318] uvcvideo: uvc_v4l2_poll
[36909.254399] uvcvideo: uvc_v4l2_poll
[36909.254407] uvcvideo: uvc_v4l2_poll
[36909.267072] uvcvideo: uvc_v4l2_poll
[36909.267138] uvcvideo: uvc_v4l2_poll
[36909.267145] uvcvideo: uvc_v4l2_poll
[36909.278421] uvcvideo: uvc_v4l2_poll
[36909.278486] uvcvideo: uvc_v4l2_poll
[36909.278494] uvcvideo: uvc_v4l2_poll
[36909.290193] uvcvideo: uvc_v4l2_poll
[36909.290259] uvcvideo: uvc_v4l2_poll
[36909.290266] uvcvideo: uvc_v4l2_poll
[36909.302514] uvcvideo: uvc_v4l2_poll
[36909.302589] uvcvideo: uvc_v4l2_poll
[36909.302596] uvcvideo: uvc_v4l2_poll
[36909.314295] uvcvideo: uvc_v4l2_poll
[36909.314362] uvcvideo: uvc_v4l2_poll
[36909.314369] uvcvideo: uvc_v4l2_poll
[36909.326301] uvcvideo: uvc_v4l2_poll
[36909.326375] uvcvideo: uvc_v4l2_poll
[36909.326388] uvcvideo: uvc_v4l2_poll
[36909.338196] uvcvideo: uvc_v4l2_poll
[36909.338280] uvcvideo: uvc_v4l2_poll
[36909.338287] uvcvideo: uvc_v4l2_poll
[36909.350174] uvcvideo: uvc_v4l2_poll
[36909.350240] uvcvideo: uvc_v4l2_poll
[36909.350247] uvcvideo: uvc_v4l2_poll
[36909.362716] uvcvideo: uvc_v4l2_poll
[36909.362778] uvcvideo: uvc_v4l2_poll
[36909.362786] uvcvideo: uvc_v4l2_poll
[36909.374029] uvcvideo: uvc_v4l2_poll
[36909.374094] uvcvideo: uvc_v4l2_poll
[36909.374101] uvcvideo: uvc_v4l2_poll
[36909.381210] usb 2-1: New USB device found, idVendor=1d6d, idProduct=0105, bcdDevice= 0.10
[36909.381212] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[36909.381213] usb 2-1: Product: webcam
[36909.381214] usb 2-1: Manufacturer: YGTek
[36909.381215] usb 2-1: SerialNumber: YG_U700.2020.0904.1200
[36909.381879] uvcvideo: Probing generic UVC device 1
[36909.382030] uvcvideo: Found format MJPEG.
[36909.382033] uvcvideo: - 640x480 (25.0 fps)
[36909.382034] uvcvideo: - 800x600 (25.0 fps)
[36909.382035] uvcvideo: - 1280x720 (25.0 fps)
[36909.382036] uvcvideo: - 1280x960 (25.0 fps)
[36909.382037] uvcvideo: - 1920x1080 (25.0 fps)
[36909.382038] uvcvideo: - 2304x1296 (25.0 fps)
[36909.382039] uvcvideo: - 2560x1440 (25.0 fps)
[36909.382041] uvcvideo: Found format H.264.
[36909.382042] uvcvideo: - 640x480 (25.0 fps)
[36909.382043] uvcvideo: - 800x600 (25.0 fps)
[36909.382044] uvcvideo: - 1280x720 (25.0 fps)
[36909.382045] uvcvideo: - 1280x960 (25.0 fps)
[36909.382046] uvcvideo: - 1920x1080 (25.0 fps)
[36909.382047] uvcvideo: - 2304x1296 (25.0 fps)
[36909.382049] uvcvideo: - 2560x1440 (25.0 fps)
[36909.382050] uvcvideo: Unknown video format 35363248-0000-0010-8000-00aa00389b71
[36909.382052] uvcvideo: Found format 35363248-0000-0010-8000-00aa003.
[36909.382053] uvcvideo: - 640x480 (25.0 fps)
[36909.382054] uvcvideo: - 800x600 (25.0 fps)
[36909.382056] uvcvideo: - 1280x720 (25.0 fps)
[36909.382057] uvcvideo: - 1280x960 (25.0 fps)
[36909.382058] uvcvideo: - 1920x1080 (25.0 fps)
[36909.382059] uvcvideo: - 2304x1296 (25.0 fps)
[36909.382060] uvcvideo: - 2560x1440 (25.0 fps)
[36909.382061] uvcvideo: Found format YUV 4:2:2 (YUYV).
[36909.382062] uvcvideo: - 320x240 (25.0 fps)
[36909.382064] uvcvideo: - 640x360 (25.0 fps)
[36909.382065] uvcvideo: - 640x480 (25.0 fps)
[36909.382066] uvcvideo: - 720x480 (25.0 fps)
[36909.382068] uvcvideo: - 800x600 (25.0 fps)
[36909.382069] uvcvideo: - 1024x576 (25.0 fps)
[36909.382074] uvcvideo: Found a Status endpoint (addr 81).
[36909.382075] uvcvideo: Found UVC 1.00 device webcam (1d6d:0105)
[36909.382079] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/2 to device 1 entity 1
[36909.382216] uvcvideo: Adding mapping 'Exposure, Auto' to control 00000000-0000-0000-0000-000000000001/2.
[36909.382219] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/4 to device 1 entity 1
[36909.382335] uvcvideo: Adding mapping 'Exposure (Absolute)' to control 00000000-0000-0000-0000-000000000001/4.
[36909.382338] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device 1 entity 2
[36909.382472] uvcvideo: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2.
[36909.382474] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device 1 entity 2
[36909.382625] uvcvideo: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3.
[36909.382627] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device 1 entity 2
[36909.382779] uvcvideo: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7.
[36909.382781] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/8 to device 1 entity 2
[36909.382912] uvcvideo: Adding mapping 'Sharpness' to control 00000000-0000-0000-0000-000000000101/8.
[36909.382914] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/10 to device 1 entity 2
[36909.383011] uvcvideo: Adding mapping 'White Balance Temperature' to control 00000000-0000-0000-0000-000000000101/10.
[36909.383012] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/4 to device 1 entity 2
[36909.383151] uvcvideo: Adding mapping 'Gain' to control 00000000-0000-0000-0000-000000000101/4.
[36909.383152] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/5 to device 1 entity 2
[36909.383238] uvcvideo: Adding mapping 'Power Line Frequency' to control 00000000-0000-0000-0000-000000000101/5.
[36909.383239] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/11 to device 1 entity 2
[36909.383385] uvcvideo: Adding mapping 'White Balance Temperature, Auto' to control 00000000-0000-0000-0000-000000000101/11.
[36909.383387] uvcvideo: Scanning UVC chain: OT 4 <- XU 3 <- PU 2 <- IT 1
[36909.383392] uvcvideo: Found a valid video chain (1 -> 4).
[36909.385911] uvcvideo: uvc_v4l2_poll
[36909.385970] uvcvideo: uvc_v4l2_poll
[36909.386011] uvcvideo: uvc_v4l2_poll
[36909.388849] input: webcam: WEBCAM as /devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1:1.0/input/input29
[36909.388885] uvcvideo: UVC device initialized.
[36909.409934] uvcvideo: uvc_v4l2_poll
[36909.410005] uvcvideo: uvc_v4l2_poll
[36909.410012] uvcvideo: uvc_v4l2_poll
[36909.422057] uvcvideo: uvc_v4l2_poll
[36909.422130] uvcvideo: uvc_v4l2_poll
[36909.422138] uvcvideo: uvc_v4l2_poll
[36909.433904] uvcvideo: uvc_v4l2_poll
[36909.433968] uvcvideo: uvc_v4l2_poll
[36909.433975] uvcvideo: uvc_v4l2_poll
[36909.445834] uvcvideo: uvc_v4l2_poll
[36909.445895] uvcvideo: uvc_v4l2_poll
[36909.445902] uvcvideo: uvc_v4l2_poll
[36909.458288] uvcvideo: uvc_v4l2_poll
[36909.458350] uvcvideo: uvc_v4l2_poll
[36909.458357] uvcvideo: uvc_v4l2_poll
[36909.469737] uvcvideo: uvc_v4l2_poll
[36909.469814] uvcvideo: uvc_v4l2_poll
[36909.469827] uvcvideo: uvc_v4l2_poll
[36909.481652] uvcvideo: uvc_v4l2_poll
[36909.481714] uvcvideo: uvc_v4l2_poll
[36909.481722] uvcvideo: uvc_v4l2_poll
[36909.493897] uvcvideo: uvc_v4l2_poll
[36909.493960] uvcvideo: uvc_v4l2_poll
[36909.493968] uvcvideo: uvc_v4l2_poll
[36909.517697] uvcvideo: uvc_v4l2_poll
[36909.517770] uvcvideo: uvc_v4l2_poll
[36909.517777] uvcvideo: uvc_v4l2_poll
[36909.529599] uvcvideo: uvc_v4l2_poll
[36909.529638] uvcvideo: uvc_v4l2_poll
[36909.529645] uvcvideo: uvc_v4l2_poll
[36909.541596] uvcvideo: uvc_v4l2_poll
[36909.541662] uvcvideo: uvc_v4l2_poll
[36909.541669] uvcvideo: uvc_v4l2_poll
[36909.565523] uvcvideo: uvc_v4l2_poll
[36909.565564] uvcvideo: uvc_v4l2_poll
[36909.565571] uvcvideo: uvc_v4l2_poll
[36909.625433] uvcvideo: uvc_v4l2_poll
[36909.625499] uvcvideo: uvc_v4l2_poll
[36909.625506] uvcvideo: uvc_v4l2_poll
[36909.637064] uvcvideo: uvc_v4l2_poll
[36909.637134] uvcvideo: uvc_v4l2_poll
[36909.637142] uvcvideo: uvc_v4l2_poll
[36909.649104] uvcvideo: uvc_v4l2_poll
[36909.649174] uvcvideo: uvc_v4l2_poll
[36909.649181] uvcvideo: uvc_v4l2_poll
[36909.660883] uvcvideo: uvc_v4l2_poll
[36909.660945] uvcvideo: uvc_v4l2_poll
[36909.660953] uvcvideo: uvc_v4l2_poll
[36909.874990] uvcvideo: uvc_v4l2_poll
[36909.875073] uvcvideo: uvc_v4l2_poll
[36909.875296] uvcvideo: uvc_v4l2_poll
[36909.877371] uvcvideo: uvc_v4l2_poll
[36909.891940] uvcvideo: uvc_v4l2_poll
[36909.892256] uvcvideo: uvc_v4l2_poll
[36909.892372] uvcvideo: uvc_v4l2_poll
[36909.903011] uvcvideo: uvc_v4l2_poll
[36909.903334] uvcvideo: uvc_v4l2_poll
[36909.903389] uvcvideo: uvc_v4l2_poll
[36909.968146] uvcvideo: uvc_v4l2_poll
[36909.968343] uvcvideo: uvc_v4l2_poll
[36909.969674] uvcvideo: uvc_v4l2_poll
[36910.427052] uvcvideo: uvc_v4l2_poll
[36910.427202] uvcvideo: uvc_v4l2_poll
[36910.427225] uvcvideo: uvc_v4l2_poll
[36910.438790] uvcvideo: uvc_v4l2_poll
[36910.438952] uvcvideo: uvc_v4l2_poll
[36910.438981] uvcvideo: uvc_v4l2_poll
[36910.450859] uvcvideo: uvc_v4l2_poll
[36910.450994] uvcvideo: uvc_v4l2_poll
[36910.451015] uvcvideo: uvc_v4l2_poll
[36910.462492] uvcvideo: uvc_v4l2_poll
[36910.462621] uvcvideo: uvc_v4l2_poll
[36910.462641] uvcvideo: uvc_v4l2_poll
[36910.474604] uvcvideo: uvc_v4l2_poll
[36910.474739] uvcvideo: uvc_v4l2_poll
[36910.474759] uvcvideo: uvc_v4l2_poll
[36910.486933] uvcvideo: uvc_v4l2_poll
[36910.487099] uvcvideo: uvc_v4l2_poll
[36910.487132] uvcvideo: uvc_v4l2_poll
[36910.498530] uvcvideo: uvc_v4l2_poll
[36910.498676] uvcvideo: uvc_v4l2_poll
[36910.498698] uvcvideo: uvc_v4l2_poll
[36910.510662] uvcvideo: uvc_v4l2_poll
[36910.510800] uvcvideo: uvc_v4l2_poll
[36910.510821] uvcvideo: uvc_v4l2_poll
[36910.522451] uvcvideo: uvc_v4l2_poll
[36910.522589] uvcvideo: uvc_v4l2_poll
[36910.522610] uvcvideo: uvc_v4l2_poll
[36910.534773] uvcvideo: uvc_v4l2_poll
[36910.534911] uvcvideo: uvc_v4l2_poll
[36910.534933] uvcvideo: uvc_v4l2_poll
[36910.546691] uvcvideo: uvc_v4l2_poll
[36910.546829] uvcvideo: uvc_v4l2_poll
[36910.546849] uvcvideo: uvc_v4l2_poll
[36910.558425] uvcvideo: uvc_v4l2_poll
[36910.558560] uvcvideo: uvc_v4l2_poll
[36910.558581] uvcvideo: uvc_v4l2_poll
[36910.570477] uvcvideo: uvc_v4l2_poll
[36910.570616] uvcvideo: uvc_v4l2_poll
[36910.570637] uvcvideo: uvc_v4l2_poll
[36910.582432] uvcvideo: uvc_v4l2_poll
[36910.582595] uvcvideo: uvc_v4l2_poll
[36910.582629] uvcvideo: uvc_v4l2_poll
[36910.594241] uvcvideo: uvc_v4l2_poll
[36910.594379] uvcvideo: uvc_v4l2_poll
[36910.594400] uvcvideo: uvc_v4l2_poll
[36910.606129] uvcvideo: uvc_v4l2_poll
[36910.606272] uvcvideo: uvc_v4l2_poll
[36910.606293] uvcvideo: uvc_v4l2_poll
[36910.617822] uvcvideo: uvc_v4l2_poll
[36910.617949] uvcvideo: uvc_v4l2_poll
[36910.617970] uvcvideo: uvc_v4l2_poll
[36910.629971] uvcvideo: uvc_v4l2_poll
[36910.630109] uvcvideo: uvc_v4l2_poll
[36910.630131] uvcvideo: uvc_v4l2_poll
[36910.641795] uvcvideo: uvc_v4l2_poll
[36910.641955] uvcvideo: uvc_v4l2_poll
[36910.641990] uvcvideo: uvc_v4l2_poll
[36910.655874] uvcvideo: uvc_v4l2_poll
[36910.656001] uvcvideo: uvc_v4l2_poll
[36910.656021] uvcvideo: uvc_v4l2_poll
[36910.665906] uvcvideo: uvc_v4l2_poll
[36910.666043] uvcvideo: uvc_v4l2_poll
[36910.666064] uvcvideo: uvc_v4l2_poll
[36910.678266] uvcvideo: uvc_v4l2_poll
[36910.678404] uvcvideo: uvc_v4l2_poll
[36910.678425] uvcvideo: uvc_v4l2_poll
[36910.689987] uvcvideo: uvc_v4l2_poll
[36910.690129] uvcvideo: uvc_v4l2_poll
[36910.690150] uvcvideo: uvc_v4l2_poll
[36910.702022] uvcvideo: uvc_v4l2_poll
[36910.702164] uvcvideo: uvc_v4l2_poll
[36910.702185] uvcvideo: uvc_v4l2_poll
[36910.713785] uvcvideo: uvc_v4l2_poll
[36910.713923] uvcvideo: uvc_v4l2_poll
[36910.713944] uvcvideo: uvc_v4l2_poll
[36910.725893] uvcvideo: uvc_v4l2_poll
[36910.726031] uvcvideo: uvc_v4l2_poll
[36910.726052] uvcvideo: uvc_v4l2_poll
[36910.737712] uvcvideo: uvc_v4l2_poll
[36910.737855] uvcvideo: uvc_v4l2_poll
[36910.737877] uvcvideo: uvc_v4l2_poll
[36910.749358] uvcvideo: uvc_v4l2_poll
[36910.749482] uvcvideo: uvc_v4l2_poll
[36910.749503] uvcvideo: uvc_v4l2_poll
[36910.761840] uvcvideo: uvc_v4l2_poll
[36910.761976] uvcvideo: uvc_v4l2_poll
[36910.761998] uvcvideo: uvc_v4l2_poll
[36910.773691] uvcvideo: uvc_v4l2_poll
[36910.773795] uvcvideo: uvc_v4l2_poll
[36910.773827] uvcvideo: uvc_v4l2_poll
[36910.785422] uvcvideo: uvc_v4l2_poll
[36910.785514] uvcvideo: uvc_v4l2_poll
[36910.785534] uvcvideo: uvc_v4l2_poll
[36910.881461] uvcvideo: uvc_v4l2_poll
[36910.881568] uvcvideo: uvc_v4l2_poll
[36910.881593] uvcvideo: uvc_v4l2_poll
[36910.893090] uvcvideo: uvc_v4l2_poll
[36910.893291] uvcvideo: uvc_v4l2_poll
[36910.893334] uvcvideo: uvc_v4l2_poll
[36910.904812] uvcvideo: uvc_v4l2_poll
[36910.905001] uvcvideo: uvc_v4l2_poll
[36910.905042] uvcvideo: uvc_v4l2_poll
[36910.916853] uvcvideo: uvc_v4l2_poll
[36910.917012] uvcvideo: uvc_v4l2_poll
[36910.917035] uvcvideo: uvc_v4l2_poll
[36910.928532] uvcvideo: uvc_v4l2_poll
[36910.928685] uvcvideo: uvc_v4l2_poll
[36910.928709] uvcvideo: uvc_v4l2_poll
[36911.130959] uvcvideo: uvc_v4l2_poll
[36911.131035] uvcvideo: uvc_v4l2_poll
[36911.131169] uvcvideo: uvc_v4l2_poll
[36911.132666] uvcvideo: uvc_v4l2_poll
[36911.145516] uvcvideo: uvc_v4l2_poll
[36911.145853] uvcvideo: uvc_v4l2_poll
[36911.145921] uvcvideo: uvc_v4l2_poll
[36911.223958] uvcvideo: uvc_v4l2_poll
[36911.224088] uvcvideo: uvc_v4l2_poll
[36911.224845] uvcvideo: uvc_v4l2_poll
[36911.981901] uvcvideo: uvc_v4l2_poll
[36911.982051] uvcvideo: uvc_v4l2_poll
[36911.982075] uvcvideo: uvc_v4l2_poll
[36911.993456] uvcvideo: uvc_v4l2_poll
[36911.993607] uvcvideo: uvc_v4l2_poll
[36911.993630] uvcvideo: uvc_v4l2_poll
[36912.005224] uvcvideo: uvc_v4l2_poll
[36912.005363] uvcvideo: uvc_v4l2_poll
[36912.005387] uvcvideo: uvc_v4l2_poll
[36912.016979] uvcvideo: uvc_v4l2_poll
[36912.017161] uvcvideo: uvc_v4l2_poll
[36912.017199] uvcvideo: uvc_v4l2_poll
[36912.029168] uvcvideo: uvc_v4l2_poll
[36912.029357] uvcvideo: uvc_v4l2_poll
[36912.029381] uvcvideo: uvc_v4l2_poll
[36912.041137] uvcvideo: uvc_v4l2_poll
[36912.041323] uvcvideo: uvc_v4l2_poll
[36912.041348] uvcvideo: uvc_v4l2_poll
[36912.053323] uvcvideo: uvc_v4l2_poll
[36912.053500] uvcvideo: uvc_v4l2_poll
[36912.053524] uvcvideo: uvc_v4l2_poll
[36912.065389] uvcvideo: uvc_v4l2_poll
[36912.065561] uvcvideo: uvc_v4l2_poll
[36912.065585] uvcvideo: uvc_v4l2_poll
[36912.077790] uvcvideo: uvc_v4l2_poll
[36912.078020] uvcvideo: uvc_v4l2_poll
[36912.078064] uvcvideo: uvc_v4l2_poll
[36912.088858] uvcvideo: uvc_v4l2_poll
[36912.089026] uvcvideo: uvc_v4l2_poll
[36912.089049] uvcvideo: uvc_v4l2_poll
[36912.100894] uvcvideo: uvc_v4l2_poll
[36912.101076] uvcvideo: uvc_v4l2_poll
[36912.101100] uvcvideo: uvc_v4l2_poll
[36912.112465] uvcvideo: uvc_v4l2_poll
[36912.112627] uvcvideo: uvc_v4l2_poll
[36912.112651] uvcvideo: uvc_v4l2_poll
[36912.124630] uvcvideo: uvc_v4l2_poll
[36912.124801] uvcvideo: uvc_v4l2_poll
[36912.124825] uvcvideo: uvc_v4l2_poll
[36912.136571] uvcvideo: uvc_v4l2_poll
[36912.136739] uvcvideo: uvc_v4l2_poll
[36912.136762] uvcvideo: uvc_v4l2_poll
[36912.148277] uvcvideo: uvc_v4l2_poll
[36912.148424] uvcvideo: uvc_v4l2_poll
[36912.148447] uvcvideo: uvc_v4l2_poll
[36912.160013] uvcvideo: uvc_v4l2_poll
[36912.160189] uvcvideo: uvc_v4l2_poll
[36912.160212] uvcvideo: uvc_v4l2_poll
[36912.172273] uvcvideo: uvc_v4l2_poll
[36912.172459] uvcvideo: uvc_v4l2_poll
[36912.172483] uvcvideo: uvc_v4l2_poll
[36912.579554] uvcvideo: uvc_v4l2_poll
[36912.579721] uvcvideo: uvc_v4l2_poll
[36912.579745] uvcvideo: uvc_v4l2_poll
[36912.591247] uvcvideo: uvc_v4l2_poll
[36912.591412] uvcvideo: uvc_v4l2_poll
[36912.591435] uvcvideo: uvc_v4l2_poll
[36912.603295] uvcvideo: uvc_v4l2_poll
[36912.603506] uvcvideo: uvc_v4l2_poll
[36912.603541] uvcvideo: uvc_v4l2_poll
[36912.615360] uvcvideo: uvc_v4l2_poll
[36912.615602] uvcvideo: uvc_v4l2_poll
[36912.615628] uvcvideo: uvc_v4l2_poll
[36912.627173] uvcvideo: uvc_v4l2_poll
[36912.627333] uvcvideo: uvc_v4l2_poll
[36912.627356] uvcvideo: uvc_v4l2_poll
[36912.639328] uvcvideo: uvc_v4l2_poll
[36912.639624] uvcvideo: uvc_v4l2_poll
[36912.639667] uvcvideo: uvc_v4l2_poll
[36912.651256] uvcvideo: uvc_v4l2_poll
[36912.651534] uvcvideo: uvc_v4l2_poll
[36912.652372] uvcvideo: uvc_v4l2_poll
[36912.664574] uvcvideo: uvc_v4l2_poll
[36912.664777] uvcvideo: uvc_v4l2_poll
[36912.664804] uvcvideo: uvc_v4l2_poll
[36912.675285] uvcvideo: uvc_v4l2_poll
[36912.675547] uvcvideo: uvc_v4l2_poll
[36912.675605] uvcvideo: uvc_v4l2_poll
[36912.687341] uvcvideo: uvc_v4l2_poll
[36912.687626] uvcvideo: uvc_v4l2_poll
[36912.687652] uvcvideo: uvc_v4l2_poll
[36912.699524] uvcvideo: uvc_v4l2_poll
[36912.699713] uvcvideo: uvc_v4l2_poll
[36912.699737] uvcvideo: uvc_v4l2_poll
[36912.711016] uvcvideo: uvc_v4l2_poll
[36912.711201] uvcvideo: uvc_v4l2_poll
[36912.711224] uvcvideo: uvc_v4l2_poll
[36912.723320] uvcvideo: uvc_v4l2_poll
[36912.723609] uvcvideo: uvc_v4l2_poll
[36912.723646] uvcvideo: uvc_v4l2_poll
[36912.735001] uvcvideo: uvc_v4l2_poll
[36912.735198] uvcvideo: uvc_v4l2_poll
[36912.735222] uvcvideo: uvc_v4l2_poll
[36912.746790] uvcvideo: uvc_v4l2_poll
[36912.746961] uvcvideo: uvc_v4l2_poll
[36912.746985] uvcvideo: uvc_v4l2_poll
[36912.760132] uvcvideo: uvc_v4l2_poll
[36912.760326] uvcvideo: uvc_v4l2_poll
[36912.760350] uvcvideo: uvc_v4l2_poll
[36912.770895] uvcvideo: uvc_v4l2_poll
[36912.771102] uvcvideo: uvc_v4l2_poll
[36912.771126] uvcvideo: uvc_v4l2_poll
[36912.782981] uvcvideo: uvc_v4l2_poll
[36912.783156] uvcvideo: uvc_v4l2_poll
[36912.783177] uvcvideo: uvc_v4l2_poll
[36912.794835] uvcvideo: uvc_v4l2_poll
[36912.794957] uvcvideo: uvc_v4l2_poll
[36912.794970] uvcvideo: uvc_v4l2_poll
[36912.806490] uvcvideo: uvc_v4l2_poll
[36912.806603] uvcvideo: uvc_v4l2_poll
[36912.806613] uvcvideo: uvc_v4l2_poll
[36912.818608] uvcvideo: uvc_v4l2_poll
[36912.818711] uvcvideo: uvc_v4l2_poll
[36912.818721] uvcvideo: uvc_v4l2_poll
[36912.830417] uvcvideo: uvc_v4l2_poll
[36912.830522] uvcvideo: uvc_v4l2_poll
[36912.830875] uvcvideo: uvc_v4l2_poll
[36912.842444] uvcvideo: uvc_v4l2_poll
[36912.842545] uvcvideo: uvc_v4l2_poll
[36912.842555] uvcvideo: uvc_v4l2_poll
[36912.854467] uvcvideo: uvc_v4l2_poll
[36912.854574] uvcvideo: uvc_v4l2_poll
[36912.854584] uvcvideo: uvc_v4l2_poll
[36912.866567] uvcvideo: uvc_v4l2_poll
[36912.866689] uvcvideo: uvc_v4l2_poll
[36912.866705] uvcvideo: uvc_v4l2_poll
[36912.878390] uvcvideo: uvc_v4l2_poll
[36912.878491] uvcvideo: uvc_v4l2_poll
[36912.878501] uvcvideo: uvc_v4l2_poll
[36912.890363] uvcvideo: uvc_v4l2_poll
[36912.890416] uvcvideo: uvc_v4l2_poll
[36912.890425] uvcvideo: uvc_v4l2_poll
[36912.902082] uvcvideo: uvc_v4l2_poll
[36912.902202] uvcvideo: uvc_v4l2_poll
[36912.902218] uvcvideo: uvc_v4l2_poll
[36912.914032] uvcvideo: uvc_v4l2_poll
[36912.914126] uvcvideo: uvc_v4l2_poll
[36912.914136] uvcvideo: uvc_v4l2_poll
[36912.926150] uvcvideo: uvc_v4l2_poll
[36912.926247] uvcvideo: uvc_v4l2_poll
[36912.926257] uvcvideo: uvc_v4l2_poll
[36912.938100] uvcvideo: uvc_v4l2_poll
[36912.938201] uvcvideo: uvc_v4l2_poll
[36912.938211] uvcvideo: uvc_v4l2_poll
[36912.949984] uvcvideo: uvc_v4l2_poll
[36912.950083] uvcvideo: uvc_v4l2_poll
[36912.950093] uvcvideo: uvc_v4l2_poll
[36912.962163] uvcvideo: uvc_v4l2_poll
[36912.962268] uvcvideo: uvc_v4l2_poll
[36912.962694] uvcvideo: uvc_v4l2_poll
[36912.974007] uvcvideo: uvc_v4l2_poll
[36912.974107] uvcvideo: uvc_v4l2_poll
[36912.974117] uvcvideo: uvc_v4l2_poll
[36912.986160] uvcvideo: uvc_v4l2_poll
[36912.986264] uvcvideo: uvc_v4l2_poll
[36912.986274] uvcvideo: uvc_v4l2_poll
[36912.997756] uvcvideo: uvc_v4l2_poll
[36912.997854] uvcvideo: uvc_v4l2_poll
[36912.997864] uvcvideo: uvc_v4l2_poll
[36913.009779] uvcvideo: uvc_v4l2_poll
[36913.009877] uvcvideo: uvc_v4l2_poll
[36913.009887] uvcvideo: uvc_v4l2_poll
[36913.021657] uvcvideo: uvc_v4l2_poll
[36913.021778] uvcvideo: uvc_v4l2_poll
[36913.021791] uvcvideo: uvc_v4l2_poll
[36913.033721] uvcvideo: uvc_v4l2_poll
[36913.033820] uvcvideo: uvc_v4l2_poll
[36913.033830] uvcvideo: uvc_v4l2_poll
[36913.045710] uvcvideo: uvc_v4l2_poll
[36913.045809] uvcvideo: uvc_v4l2_poll
[36913.045819] uvcvideo: uvc_v4l2_poll
[36913.057723] uvcvideo: uvc_v4l2_poll
[36913.057822] uvcvideo: uvc_v4l2_poll
[36913.057832] uvcvideo: uvc_v4l2_poll
[36913.069457] uvcvideo: uvc_v4l2_poll
[36913.069565] uvcvideo: uvc_v4l2_poll
[36913.069928] uvcvideo: uvc_v4l2_poll
[36913.081301] uvcvideo: uvc_v4l2_poll
[36913.081401] uvcvideo: uvc_v4l2_poll
[36913.081411] uvcvideo: uvc_v4l2_poll
[36913.093283] uvcvideo: uvc_v4l2_poll
[36913.093390] uvcvideo: uvc_v4l2_poll
[36913.093683] uvcvideo: uvc_v4l2_poll
[36913.105224] uvcvideo: uvc_v4l2_poll
[36913.105303] uvcvideo: uvc_v4l2_poll
[36913.105310] uvcvideo: uvc_v4l2_poll
[36913.117091] uvcvideo: uvc_v4l2_poll
[36913.117131] uvcvideo: uvc_v4l2_poll
[36913.117138] uvcvideo: uvc_v4l2_poll
[36913.128922] uvcvideo: uvc_v4l2_poll
[36913.129009] uvcvideo: uvc_v4l2_poll
[36913.129016] uvcvideo: uvc_v4l2_poll
[36913.140786] uvcvideo: uvc_v4l2_poll
[36913.140861] uvcvideo: uvc_v4l2_poll
[36913.140868] uvcvideo: uvc_v4l2_poll
[36913.152400] uvcvideo: uvc_v4l2_poll
[36913.152486] uvcvideo: uvc_v4l2_poll
[36913.152493] uvcvideo: uvc_v4l2_poll
[36913.885354] uvcvideo: uvc_v4l2_poll
[36913.885473] uvcvideo: uvc_v4l2_poll
[36914.026555] uvcvideo: uvc_v4l2_poll
[36914.026744] uvcvideo: uvc_v4l2_poll
[36914.026778] uvcvideo: uvc_v4l2_poll
[36914.038070] uvcvideo: uvc_v4l2_poll
[36914.038235] uvcvideo: uvc_v4l2_poll
[36914.038258] uvcvideo: uvc_v4l2_poll
[36914.051083] uvcvideo: uvc_v4l2_poll
[36914.051251] uvcvideo: uvc_v4l2_poll
[36914.051275] uvcvideo: uvc_v4l2_poll
[36914.062432] uvcvideo: uvc_v4l2_poll
[36914.062604] uvcvideo: uvc_v4l2_poll
[36914.062630] uvcvideo: uvc_v4l2_poll
[36914.074092] uvcvideo: uvc_v4l2_poll
[36914.074258] uvcvideo: uvc_v4l2_poll
[36914.074282] uvcvideo: uvc_v4l2_poll
[36914.086098] uvcvideo: uvc_v4l2_poll
[36914.086278] uvcvideo: uvc_v4l2_poll
[36914.086301] uvcvideo: uvc_v4l2_poll
[36914.098197] uvcvideo: uvc_v4l2_poll
[36914.098367] uvcvideo: uvc_v4l2_poll
[36914.098390] uvcvideo: uvc_v4l2_poll
[36914.110049] uvcvideo: uvc_v4l2_poll
[36914.110213] uvcvideo: uvc_v4l2_poll
[36914.110237] uvcvideo: uvc_v4l2_poll
[36914.121956] uvcvideo: uvc_v4l2_poll
[36914.122124] uvcvideo: uvc_v4l2_poll
[36914.122147] uvcvideo: uvc_v4l2_poll
[36914.134134] uvcvideo: uvc_v4l2_poll
[36914.134312] uvcvideo: uvc_v4l2_poll
[36914.134336] uvcvideo: uvc_v4l2_poll
[36914.146601] uvcvideo: uvc_v4l2_poll
[36914.146775] uvcvideo: uvc_v4l2_poll
[36914.146799] uvcvideo: uvc_v4l2_poll
[36914.158180] uvcvideo: uvc_v4l2_poll
[36914.158345] uvcvideo: uvc_v4l2_poll
[36914.158369] uvcvideo: uvc_v4l2_poll
[36914.170026] uvcvideo: uvc_v4l2_poll
[36914.170175] uvcvideo: uvc_v4l2_poll
[36914.170198] uvcvideo: uvc_v4l2_poll
[36914.182366] uvcvideo: uvc_v4l2_poll
[36914.182531] uvcvideo: uvc_v4l2_poll
[36914.182554] uvcvideo: uvc_v4l2_poll
[36914.194372] uvcvideo: uvc_v4l2_poll
[36914.194537] uvcvideo: uvc_v4l2_poll
[36914.194560] uvcvideo: uvc_v4l2_poll
[36914.206181] uvcvideo: uvc_v4l2_poll
[36914.206359] uvcvideo: uvc_v4l2_poll
[36914.206382] uvcvideo: uvc_v4l2_poll
[36914.218127] uvcvideo: uvc_v4l2_poll
[36914.218294] uvcvideo: uvc_v4l2_poll
[36914.218318] uvcvideo: uvc_v4l2_poll
[36914.230123] uvcvideo: uvc_v4l2_poll
[36914.230306] uvcvideo: uvc_v4l2_poll
[36914.230330] uvcvideo: uvc_v4l2_poll
[36914.242386] uvcvideo: uvc_v4l2_poll
[36914.242553] uvcvideo: uvc_v4l2_poll
[36914.242578] uvcvideo: uvc_v4l2_poll
[36914.253819] uvcvideo: uvc_v4l2_poll
[36914.254034] uvcvideo: uvc_v4l2_poll
[36914.254073] uvcvideo: uvc_v4l2_poll
[36914.265486] uvcvideo: uvc_v4l2_poll
[36914.265670] uvcvideo: uvc_v4l2_poll
[36914.265695] uvcvideo: uvc_v4l2_poll
[36914.277681] uvcvideo: uvc_v4l2_poll
[36914.277873] uvcvideo: uvc_v4l2_poll
[36914.277909] uvcvideo: uvc_v4l2_poll
[36914.289864] uvcvideo: uvc_v4l2_poll
[36914.290046] uvcvideo: uvc_v4l2_poll
[36914.290069] uvcvideo: uvc_v4l2_poll
[36914.301571] uvcvideo: uvc_v4l2_poll
[36914.301814] uvcvideo: uvc_v4l2_poll
[36914.301852] uvcvideo: uvc_v4l2_poll
[36914.313548] uvcvideo: uvc_v4l2_poll
[36914.313708] uvcvideo: uvc_v4l2_poll
[36914.313733] uvcvideo: uvc_v4l2_poll
[36914.325583] uvcvideo: uvc_v4l2_poll
[36914.325751] uvcvideo: uvc_v4l2_poll
[36914.325774] uvcvideo: uvc_v4l2_poll
[36914.337736] uvcvideo: uvc_v4l2_poll
[36914.337910] uvcvideo: uvc_v4l2_poll
[36914.337933] uvcvideo: uvc_v4l2_poll
[36914.349790] uvcvideo: uvc_v4l2_poll
[36914.349954] uvcvideo: uvc_v4l2_poll
[36914.349978] uvcvideo: uvc_v4l2_poll
[36914.361511] uvcvideo: uvc_v4l2_poll
[36914.361682] uvcvideo: uvc_v4l2_poll
[36914.361706] uvcvideo: uvc_v4l2_poll
[36914.373322] uvcvideo: uvc_v4l2_poll
[36914.373530] uvcvideo: uvc_v4l2_poll
[36914.373573] uvcvideo: uvc_v4l2_poll
[36914.385115] uvcvideo: uvc_v4l2_poll
[36914.385304] uvcvideo: uvc_v4l2_poll
[36914.385339] uvcvideo: uvc_v4l2_poll
[36914.397026] uvcvideo: uvc_v4l2_poll
[36914.397194] uvcvideo: uvc_v4l2_poll
[36914.397218] uvcvideo: uvc_v4l2_poll
[36914.409043] uvcvideo: uvc_v4l2_poll
[36914.409205] uvcvideo: uvc_v4l2_poll
[36914.409229] uvcvideo: uvc_v4l2_poll
[36914.636367] uvcvideo: uvc_v4l2_poll
[36914.636517] uvcvideo: uvc_v4l2_poll
[36914.636540] uvcvideo: uvc_v4l2_poll
[36914.648610] uvcvideo: uvc_v4l2_poll
[36914.648773] uvcvideo: uvc_v4l2_poll
[36914.648797] uvcvideo: uvc_v4l2_poll
[36914.660764] uvcvideo: uvc_v4l2_poll
[36914.660925] uvcvideo: uvc_v4l2_poll
[36914.660948] uvcvideo: uvc_v4l2_poll
[36914.672560] uvcvideo: uvc_v4l2_poll
[36914.672725] uvcvideo: uvc_v4l2_poll
[36914.672749] uvcvideo: uvc_v4l2_poll
[36914.684283] uvcvideo: uvc_v4l2_poll
[36914.684427] uvcvideo: uvc_v4l2_poll
[36914.684450] uvcvideo: uvc_v4l2_poll
[36914.696422] uvcvideo: uvc_v4l2_poll
[36914.696577] uvcvideo: uvc_v4l2_poll
[36914.696601] uvcvideo: uvc_v4l2_poll
[36914.708302] uvcvideo: uvc_v4l2_poll
[36914.708438] uvcvideo: uvc_v4l2_poll
[36914.708461] uvcvideo: uvc_v4l2_poll
[36914.720349] uvcvideo: uvc_v4l2_poll
[36914.720476] uvcvideo: uvc_v4l2_poll
[36914.720500] uvcvideo: uvc_v4l2_poll
[36914.732385] uvcvideo: uvc_v4l2_poll
[36914.732567] uvcvideo: uvc_v4l2_poll
[36914.732591] uvcvideo: uvc_v4l2_poll
[36914.744561] uvcvideo: uvc_v4l2_poll
[36914.744732] uvcvideo: uvc_v4l2_poll
[36914.744757] uvcvideo: uvc_v4l2_poll
[36914.756019] uvcvideo: uvc_v4l2_poll
[36914.756182] uvcvideo: uvc_v4l2_poll
[36914.756205] uvcvideo: uvc_v4l2_poll
[36914.767809] uvcvideo: uvc_v4l2_poll
[36914.768012] uvcvideo: uvc_v4l2_poll
[36914.768037] uvcvideo: uvc_v4l2_poll
[36914.779794] uvcvideo: uvc_v4l2_poll
[36914.779993] uvcvideo: uvc_v4l2_poll
[36914.780031] uvcvideo: uvc_v4l2_poll
[36914.791541] uvcvideo: uvc_v4l2_poll
[36914.791715] uvcvideo: uvc_v4l2_poll
[36914.791738] uvcvideo: uvc_v4l2_poll
[36914.803882] uvcvideo: uvc_v4l2_poll
[36914.804055] uvcvideo: uvc_v4l2_poll
[36914.804078] uvcvideo: uvc_v4l2_poll
[36914.816032] uvcvideo: uvc_v4l2_poll
[36914.816204] uvcvideo: uvc_v4l2_poll
[36914.816227] uvcvideo: uvc_v4l2_poll
[36914.827969] uvcvideo: uvc_v4l2_poll
[36914.828141] uvcvideo: uvc_v4l2_poll
[36914.828165] uvcvideo: uvc_v4l2_poll
[36914.840082] uvcvideo: uvc_v4l2_poll
[36914.840262] uvcvideo: uvc_v4l2_poll
[36914.840286] uvcvideo: uvc_v4l2_poll
[36914.851817] uvcvideo: uvc_v4l2_poll
[36914.852015] uvcvideo: uvc_v4l2_poll
[36914.852053] uvcvideo: uvc_v4l2_poll
[36914.863787] uvcvideo: uvc_v4l2_poll
[36914.863954] uvcvideo: uvc_v4l2_poll
[36914.863978] uvcvideo: uvc_v4l2_poll
[36914.875707] uvcvideo: uvc_v4l2_poll
[36914.875863] uvcvideo: uvc_v4l2_poll
[36914.875886] uvcvideo: uvc_v4l2_poll
[36914.887625] uvcvideo: uvc_v4l2_poll
[36914.887839] uvcvideo: uvc_v4l2_poll
[36914.887876] uvcvideo: uvc_v4l2_poll
[36914.899697] uvcvideo: uvc_v4l2_poll
[36914.899878] uvcvideo: uvc_v4l2_poll
[36914.899917] uvcvideo: uvc_v4l2_poll
[36914.911533] uvcvideo: uvc_v4l2_poll
[36914.911704] uvcvideo: uvc_v4l2_poll
[36914.911728] uvcvideo: uvc_v4l2_poll
[36914.923550] uvcvideo: uvc_v4l2_poll
[36914.923709] uvcvideo: uvc_v4l2_poll
[36914.923734] uvcvideo: uvc_v4l2_poll
[36914.935714] uvcvideo: uvc_v4l2_poll
[36914.935927] uvcvideo: uvc_v4l2_poll
[36914.935969] uvcvideo: uvc_v4l2_poll
[36914.947401] uvcvideo: uvc_v4l2_poll
[36914.947615] uvcvideo: uvc_v4l2_poll
[36914.947744] uvcvideo: uvc_v4l2_poll
[36914.959241] uvcvideo: uvc_v4l2_poll
[36914.959377] uvcvideo: uvc_v4l2_poll
[36914.959400] uvcvideo: uvc_v4l2_poll
[36914.971360] uvcvideo: uvc_v4l2_poll
[36914.971581] uvcvideo: uvc_v4l2_poll
[36914.971611] uvcvideo: uvc_v4l2_poll
[36914.983319] uvcvideo: uvc_v4l2_poll
[36914.983600] uvcvideo: uvc_v4l2_poll
[36914.983636] uvcvideo: uvc_v4l2_poll
[36914.995316] uvcvideo: uvc_v4l2_poll
[36914.995578] uvcvideo: uvc_v4l2_poll
[36914.995607] uvcvideo: uvc_v4l2_poll
[36915.007209] uvcvideo: uvc_v4l2_poll
[36915.007365] uvcvideo: uvc_v4l2_poll
[36915.007388] uvcvideo: uvc_v4l2_poll
[36915.018923] uvcvideo: uvc_v4l2_poll
[36915.019014] uvcvideo: uvc_v4l2_poll
[36915.019031] uvcvideo: uvc_v4l2_poll
[36915.962537] uvcvideo: uvc_v4l2_poll
[36915.962622] uvcvideo: uvc_v4l2_poll
[36916.019998] uvcvideo: uvc_v4l2_poll
[36916.020089] uvcvideo: uvc_v4l2_poll
[36916.020498] uvcvideo: uvc_v4l2_poll
[36916.020755] uvcvideo: uvc_v4l2_release
[36918.407693] uvcvideo: Suspending interface 1
[36918.407697] uvcvideo: Suspending interface 0
[36919.684485] usb 2-1: USB disconnect, device number 11
[36920.003518] usb 2-1: new high-speed USB device number 12 using xhci_hcd
[36920.157225] usb 2-1: New USB device found, idVendor=1d6d, idProduct=0105, bcdDevice= 0.10
[36920.157232] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[36920.157236] usb 2-1: Product: webcam
[36920.157239] usb 2-1: Manufacturer: YGTek
[36920.157242] usb 2-1: SerialNumber: YG_U700.2020.0904.1200
[36920.158131] uvcvideo: Probing generic UVC device 1
[36920.158327] uvcvideo: Found format MJPEG.
[36920.158333] uvcvideo: - 640x480 (25.0 fps)
[36920.158337] uvcvideo: - 800x600 (25.0 fps)
[36920.158342] uvcvideo: - 1280x720 (25.0 fps)
[36920.158345] uvcvideo: - 1280x960 (25.0 fps)
[36920.158348] uvcvideo: - 1920x1080 (25.0 fps)
[36920.158351] uvcvideo: - 2304x1296 (25.0 fps)
[36920.158353] uvcvideo: - 2560x1440 (25.0 fps)
[36920.158356] uvcvideo: Found format H.264.
[36920.158359] uvcvideo: - 640x480 (25.0 fps)
[36920.158362] uvcvideo: - 800x600 (25.0 fps)
[36920.158364] uvcvideo: - 1280x720 (25.0 fps)
[36920.158366] uvcvideo: - 1280x960 (25.0 fps)
[36920.158369] uvcvideo: - 1920x1080 (25.0 fps)
[36920.158371] uvcvideo: - 2304x1296 (25.0 fps)
[36920.158373] uvcvideo: - 2560x1440 (25.0 fps)
[36920.158377] uvcvideo: Unknown video format 35363248-0000-0010-8000-00aa00389b71
[36920.158380] uvcvideo: Found format 35363248-0000-0010-8000-00aa003.
[36920.158383] uvcvideo: - 640x480 (25.0 fps)
[36920.158385] uvcvideo: - 800x600 (25.0 fps)
[36920.158387] uvcvideo: - 1280x720 (25.0 fps)
[36920.158390] uvcvideo: - 1280x960 (25.0 fps)
[36920.158392] uvcvideo: - 1920x1080 (25.0 fps)
[36920.158394] uvcvideo: - 2304x1296 (25.0 fps)
[36920.158397] uvcvideo: - 2560x1440 (25.0 fps)
[36920.158399] uvcvideo: Found format YUV 4:2:2 (YUYV).
[36920.158402] uvcvideo: - 320x240 (25.0 fps)
[36920.158404] uvcvideo: - 640x360 (25.0 fps)
[36920.158406] uvcvideo: - 640x480 (25.0 fps)
[36920.158409] uvcvideo: - 720x480 (25.0 fps)
[36920.158411] uvcvideo: - 800x600 (25.0 fps)
[36920.158413] uvcvideo: - 1024x576 (25.0 fps)
[36920.158422] uvcvideo: Found a Status endpoint (addr 81).
[36920.158425] uvcvideo: Found UVC 1.00 device webcam (1d6d:0105)
[36920.158435] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/2 to device 1 entity 1
[36920.158623] uvcvideo: Adding mapping 'Exposure, Auto' to control 00000000-0000-0000-0000-000000000001/2.
[36920.158630] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/4 to device 1 entity 1
[36920.158819] uvcvideo: Adding mapping 'Exposure (Absolute)' to control 00000000-0000-0000-0000-000000000001/4.
[36920.158825] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device 1 entity 2
[36920.158991] uvcvideo: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2.
[36920.158995] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device 1 entity 2
[36920.159180] uvcvideo: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3.
[36920.159184] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device 1 entity 2
[36920.159323] uvcvideo: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7.
[36920.159327] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/8 to device 1 entity 2
[36920.159508] uvcvideo: Adding mapping 'Sharpness' to control 00000000-0000-0000-0000-000000000101/8.
[36920.159521] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/10 to device 1 entity 2
[36920.159683] uvcvideo: Adding mapping 'White Balance Temperature' to control 00000000-0000-0000-0000-000000000101/10.
[36920.159690] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/4 to device 1 entity 2
[36920.159967] uvcvideo: Adding mapping 'Gain' to control 00000000-0000-0000-0000-000000000101/4.
[36920.159972] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/5 to device 1 entity 2
[36920.160405] uvcvideo: Adding mapping 'Power Line Frequency' to control 00000000-0000-0000-0000-000000000101/5.
[36920.160409] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/11 to device 1 entity 2
[36920.160624] uvcvideo: Adding mapping 'White Balance Temperature, Auto' to control 00000000-0000-0000-0000-000000000101/11.
[36920.160630] uvcvideo: Scanning UVC chain: OT 4 <- XU 3 <- PU 2 <- IT 1
[36920.160706] uvcvideo: Found a valid video chain (1 -> 4).
[36920.161730] input: webcam: WEBCAM as /devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1:1.0/input/input30
[36920.163676] uvcvideo: UVC device initialized.
[36930.431874] usb 2-1: USB disconnect, device number 12
[36930.763298] usb 2-1: new high-speed USB device number 13 using xhci_hcd
[36930.913109] usb 2-1: New USB device found, idVendor=1d6d, idProduct=0105, bcdDevice= 0.10
[36930.913111] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[36930.913113] usb 2-1: Product: webcam
[36930.913114] usb 2-1: Manufacturer: YGTek
[36930.913114] usb 2-1: SerialNumber: YG_U700.2020.0904.1200
[36930.913843] uvcvideo: Probing generic UVC device 1
[36930.913988] uvcvideo: Found format MJPEG.
[36930.913990] uvcvideo: - 640x480 (25.0 fps)
[36930.913991] uvcvideo: - 800x600 (25.0 fps)
[36930.913992] uvcvideo: - 1280x720 (25.0 fps)
[36930.913993] uvcvideo: - 1280x960 (25.0 fps)
[36930.913994] uvcvideo: - 1920x1080 (25.0 fps)
[36930.913995] uvcvideo: - 2304x1296 (25.0 fps)
[36930.913996] uvcvideo: - 2560x1440 (25.0 fps)
[36930.913997] uvcvideo: Found format H.264.
[36930.913998] uvcvideo: - 640x480 (25.0 fps)
[36930.913998] uvcvideo: - 800x600 (25.0 fps)
[36930.913999] uvcvideo: - 1280x720 (25.0 fps)
[36930.914000] uvcvideo: - 1280x960 (25.0 fps)
[36930.914000] uvcvideo: - 1920x1080 (25.0 fps)
[36930.914001] uvcvideo: - 2304x1296 (25.0 fps)
[36930.914001] uvcvideo: - 2560x1440 (25.0 fps)
[36930.914002] uvcvideo: Unknown video format 35363248-0000-0010-8000-00aa00389b71
[36930.914003] uvcvideo: Found format 35363248-0000-0010-8000-00aa003.
[36930.914004] uvcvideo: - 640x480 (25.0 fps)
[36930.914005] uvcvideo: - 800x600 (25.0 fps)
[36930.914005] uvcvideo: - 1280x720 (25.0 fps)
[36930.914006] uvcvideo: - 1280x960 (25.0 fps)
[36930.914006] uvcvideo: - 1920x1080 (25.0 fps)
[36930.914007] uvcvideo: - 2304x1296 (25.0 fps)
[36930.914008] uvcvideo: - 2560x1440 (25.0 fps)
[36930.914008] uvcvideo: Found format YUV 4:2:2 (YUYV).
[36930.914009] uvcvideo: - 320x240 (25.0 fps)
[36930.914009] uvcvideo: - 640x360 (25.0 fps)
[36930.914010] uvcvideo: - 640x480 (25.0 fps)
[36930.914011] uvcvideo: - 720x480 (25.0 fps)
[36930.914011] uvcvideo: - 800x600 (25.0 fps)
[36930.914012] uvcvideo: - 1024x576 (25.0 fps)
[36930.914014] uvcvideo: Found a Status endpoint (addr 81).
[36930.914015] uvcvideo: Found UVC 1.00 device webcam (1d6d:0105)
[36930.914018] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/2 to device 1 entity 1
[36930.914165] uvcvideo: Adding mapping 'Exposure, Auto' to control 00000000-0000-0000-0000-000000000001/2.
[36930.914166] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/4 to device 1 entity 1
[36930.914294] uvcvideo: Adding mapping 'Exposure (Absolute)' to control 00000000-0000-0000-0000-000000000001/4.
[36930.914295] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device 1 entity 2
[36930.914447] uvcvideo: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2.
[36930.914448] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device 1 entity 2
[36930.914600] uvcvideo: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3.
[36930.914602] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device 1 entity 2
[36930.914750] uvcvideo: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7.
[36930.914752] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/8 to device 1 entity 2
[36930.914885] uvcvideo: Adding mapping 'Sharpness' to control 00000000-0000-0000-0000-000000000101/8.
[36930.914887] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/10 to device 1 entity 2
[36930.915033] uvcvideo: Adding mapping 'White Balance Temperature' to control 00000000-0000-0000-0000-000000000101/10.
[36930.915035] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/4 to device 1 entity 2
[36930.915179] uvcvideo: Adding mapping 'Gain' to control 00000000-0000-0000-0000-000000000101/4.
[36930.915180] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/5 to device 1 entity 2
[36930.918720] uvcvideo: Adding mapping 'Power Line Frequency' to control 00000000-0000-0000-0000-000000000101/5.
[36930.918722] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/11 to device 1 entity 2
[36930.918852] uvcvideo: Adding mapping 'White Balance Temperature, Auto' to control 00000000-0000-0000-0000-000000000101/11.
[36930.918854] uvcvideo: Scanning UVC chain: OT 4 <- XU 3 <- PU 2 <- IT 1
[36930.918858] uvcvideo: Found a valid video chain (1 -> 4).
[36930.919655] input: webcam: WEBCAM as /devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1:1.0/input/input31
[36930.919856] uvcvideo: UVC device initialized.
[36941.184155] usb 2-1: USB disconnect, device number 13
[36941.495241] usb 2-1: new high-speed USB device number 14 using xhci_hcd
[36941.645280] usb 2-1: New USB device found, idVendor=1d6d, idProduct=0105, bcdDevice= 0.10
[36941.645287] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[36941.645291] usb 2-1: Product: webcam
[36941.645294] usb 2-1: Manufacturer: YGTek
[36941.645297] usb 2-1: SerialNumber: YG_U700.2020.0904.1200
[36941.646256] uvcvideo: Probing generic UVC device 1
[36941.646441] uvcvideo: Found format MJPEG.
[36941.646445] uvcvideo: - 640x480 (25.0 fps)
[36941.646448] uvcvideo: - 800x600 (25.0 fps)
[36941.646450] uvcvideo: - 1280x720 (25.0 fps)
[36941.646453] uvcvideo: - 1280x960 (25.0 fps)
[36941.646455] uvcvideo: - 1920x1080 (25.0 fps)
[36941.646458] uvcvideo: - 2304x1296 (25.0 fps)
[36941.646460] uvcvideo: - 2560x1440 (25.0 fps)
[36941.646463] uvcvideo: Found format H.264.
[36941.646466] uvcvideo: - 640x480 (25.0 fps)
[36941.646468] uvcvideo: - 800x600 (25.0 fps)
[36941.646471] uvcvideo: - 1280x720 (25.0 fps)
[36941.646473] uvcvideo: - 1280x960 (25.0 fps)
[36941.646475] uvcvideo: - 1920x1080 (25.0 fps)
[36941.646478] uvcvideo: - 2304x1296 (25.0 fps)
[36941.646480] uvcvideo: - 2560x1440 (25.0 fps)
[36941.646484] uvcvideo: Unknown video format 35363248-0000-0010-8000-00aa00389b71
[36941.646487] uvcvideo: Found format 35363248-0000-0010-8000-00aa003.
[36941.646489] uvcvideo: - 640x480 (25.0 fps)
[36941.646492] uvcvideo: - 800x600 (25.0 fps)
[36941.646494] uvcvideo: - 1280x720 (25.0 fps)
[36941.646497] uvcvideo: - 1280x960 (25.0 fps)
[36941.646499] uvcvideo: - 1920x1080 (25.0 fps)
[36941.646501] uvcvideo: - 2304x1296 (25.0 fps)
[36941.646504] uvcvideo: - 2560x1440 (25.0 fps)
[36941.646506] uvcvideo: Found format YUV 4:2:2 (YUYV).
[36941.646508] uvcvideo: - 320x240 (25.0 fps)
[36941.646511] uvcvideo: - 640x360 (25.0 fps)
[36941.646513] uvcvideo: - 640x480 (25.0 fps)
[36941.646515] uvcvideo: - 720x480 (25.0 fps)
[36941.646518] uvcvideo: - 800x600 (25.0 fps)
[36941.646520] uvcvideo: - 1024x576 (25.0 fps)
[36941.646530] uvcvideo: Found a Status endpoint (addr 81).
[36941.646534] uvcvideo: Found UVC 1.00 device webcam (1d6d:0105)
[36941.646543] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/2 to device 1 entity 1
[36941.646693] uvcvideo: Adding mapping 'Exposure, Auto' to control 00000000-0000-0000-0000-000000000001/2.
[36941.646697] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/4 to device 1 entity 1
[36941.646839] uvcvideo: Adding mapping 'Exposure (Absolute)' to control 00000000-0000-0000-0000-000000000001/4.
[36941.646844] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device 1 entity 2
[36941.647006] uvcvideo: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2.
[36941.647010] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device 1 entity 2
[36941.647454] uvcvideo: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3.
[36941.647460] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device 1 entity 2
[36941.647707] uvcvideo: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7.
[36941.647714] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/8 to device 1 entity 2
[36941.648193] uvcvideo: Adding mapping 'Sharpness' to control 00000000-0000-0000-0000-000000000101/8.
[36941.648201] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/10 to device 1 entity 2
[36941.648404] uvcvideo: Adding mapping 'White Balance Temperature' to control 00000000-0000-0000-0000-000000000101/10.
[36941.648410] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/4 to device 1 entity 2
[36941.648617] uvcvideo: Adding mapping 'Gain' to control 00000000-0000-0000-0000-000000000101/4.
[36941.648624] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/5 to device 1 entity 2
[36941.648774] uvcvideo: Adding mapping 'Power Line Frequency' to control 00000000-0000-0000-0000-000000000101/5.
[36941.648778] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/11 to device 1 entity 2
[36941.648979] uvcvideo: Adding mapping 'White Balance Temperature, Auto' to control 00000000-0000-0000-0000-000000000101/11.
[36941.648985] uvcvideo: Scanning UVC chain: OT 4 <- XU 3 <- PU 2 <- IT 1
[36941.648998] uvcvideo: Found a valid video chain (1 -> 4).
[36941.649890] input: webcam: WEBCAM as /devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1:1.0/input/input32
[36941.649999] uvcvideo: UVC device initialized.
[36951.951611] uvcvideo: uvc_v4l2_open
[36951.951717] uvcvideo: uvc_v4l2_release
[36951.954704] uvcvideo: uvc_v4l2_open
[36951.954736] uvcvideo: uvc_v4l2_release
[36951.956253] uvcvideo: uvc_v4l2_open
[36951.956302] uvcvideo: uvc_v4l2_release
[36951.956448] uvcvideo: uvc_v4l2_open
[36951.956461] uvcvideo: uvc_v4l2_release
[36952.043920] uvcvideo: uvc_v4l2_open
[36952.044001] uvcvideo: uvc_v4l2_release
[36952.045650] uvcvideo: uvc_v4l2_open
[36952.045683] uvcvideo: uvc_v4l2_release
[36952.046041] uvcvideo: uvc_v4l2_open
[36952.046077] uvcvideo: uvc_v4l2_release
[36952.046264] uvcvideo: uvc_v4l2_open
[36952.046276] uvcvideo: uvc_v4l2_release
[36952.123679] uvcvideo: uvc_v4l2_open
[36952.123768] uvcvideo: uvc_v4l2_release
[36952.127058] uvcvideo: uvc_v4l2_open
[36952.127089] uvcvideo: uvc_v4l2_release
[36952.127510] uvcvideo: uvc_v4l2_open
[36952.127544] uvcvideo: uvc_v4l2_release
[36952.128288] uvcvideo: uvc_v4l2_open
[36952.128301] uvcvideo: uvc_v4l2_release
[36952.198688] uvcvideo: uvc_v4l2_open
[36952.198762] uvcvideo: uvc_v4l2_release
[36952.201548] uvcvideo: uvc_v4l2_open
[36952.201578] uvcvideo: uvc_v4l2_release
[36952.202106] uvcvideo: uvc_v4l2_open
[36952.202142] uvcvideo: uvc_v4l2_release
[36952.202319] uvcvideo: uvc_v4l2_open
[36952.202335] uvcvideo: uvc_v4l2_release
[36952.292856] uvcvideo: uvc_v4l2_open
[36952.292931] uvcvideo: uvc_v4l2_release
[36952.295341] uvcvideo: uvc_v4l2_open
[36952.295372] uvcvideo: uvc_v4l2_release
[36952.295935] uvcvideo: uvc_v4l2_open
[36952.295969] uvcvideo: uvc_v4l2_release
[36952.296136] uvcvideo: uvc_v4l2_open
[36952.296147] uvcvideo: uvc_v4l2_release
[36952.376751] uvcvideo: uvc_v4l2_open
[36952.376831] uvcvideo: uvc_v4l2_release
[36952.380216] uvcvideo: uvc_v4l2_open
[36952.380245] uvcvideo: uvc_v4l2_release
[36952.381133] uvcvideo: uvc_v4l2_open
[36952.381167] uvcvideo: uvc_v4l2_release
[36952.381280] uvcvideo: uvc_v4l2_open
[36952.381291] uvcvideo: uvc_v4l2_release
[36957.567589] usb 2-1: 3:1: usb_set_interface failed (-110)
[36962.687396] usb 2-1: 3:1: usb_set_interface failed (-110)
[36967.807435] usb 2-1: 3:1: usb_set_interface failed (-110)
[36972.927296] usb 2-1: 3:1: usb_set_interface failed (-110)
[36978.047211] usb 2-1: 3:1: usb_set_interface failed (-110)
[36983.167087] usb 2-1: 3:1: usb_set_interface failed (-110)
[36988.286855] usb 2-1: 3:1: usb_set_interface failed (-110)
[36993.406963] usb 2-1: 3:1: usb_set_interface failed (-110)
[36998.526681] usb 2-1: 3:1: usb_set_interface failed (-110)
[37003.646858] usb 2-1: 3:1: usb_set_interface failed (-110)
[37008.766606] usb 2-1: 3:1: usb_set_interface failed (-110)
[37013.886744] usb 2-1: 3:1: usb_set_interface failed (-110)
[37019.006620] usb 2-1: 3:1: usb_set_interface failed (-110)
[37024.126423] usb 2-1: 3:1: usb_set_interface failed (-110)
[37029.246253] usb 2-1: 3:1: usb_set_interface failed (-110)
[37034.366241] usb 2-1: 3:1: usb_set_interface failed (-110)
[37039.485980] usb 2-1: 3:1: usb_set_interface failed (-110)
[37044.606094] usb 2-1: 3:1: usb_set_interface failed (-110)
[37049.726168] usb 2-1: 3:1: usb_set_interface failed (-110)
[37054.845760] usb 2-1: 3:1: usb_set_interface failed (-110)
[37059.965619] usb 2-1: 3:1: usb_set_interface failed (-110)
[37060.252937] uvcvideo: uvc_v4l2_open
[37060.253166] uvcvideo: uvc_v4l2_release
[37060.253830] uvcvideo: uvc_v4l2_open
[37060.321697] uvcvideo: Resuming interface 0
[37060.321701] uvcvideo: Resuming interface 1
[37060.322039] uvcvideo: uvc_v4l2_release
[37062.821426] uvcvideo: Suspending interface 1
[37062.821428] uvcvideo: Suspending interface 0
[37065.085695] usb 2-1: 3:1: usb_set_interface failed (-110)
[37070.205551] usb 2-1: 3:1: usb_set_interface failed (-110)
[37075.325538] usb 2-1: 3:1: usb_set_interface failed (-110)
[37076.117953] usb 2-1: USB disconnect, device number 14
[37080.445323] usb 2-1: 3:1: usb_set_interface failed (-110)
[37092.192939] usb 2-1: new high-speed USB device number 15 using xhci_hcd
[37092.342802] usb 2-1: New USB device found, idVendor=1d6d, idProduct=0105, bcdDevice= 0.10
[37092.342805] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[37092.342807] usb 2-1: Product: webcam
[37092.342808] usb 2-1: Manufacturer: YGTek
[37092.342809] usb 2-1: SerialNumber: YG_U700.2020.0904.1200
[37092.343569] uvcvideo: Probing generic UVC device 1
[37092.343719] uvcvideo: Found format MJPEG.
[37092.343722] uvcvideo: - 640x480 (25.0 fps)
[37092.343723] uvcvideo: - 800x600 (25.0 fps)
[37092.343725] uvcvideo: - 1280x720 (25.0 fps)
[37092.343727] uvcvideo: - 1280x960 (25.0 fps)
[37092.343729] uvcvideo: - 1920x1080 (25.0 fps)
[37092.343730] uvcvideo: - 2304x1296 (25.0 fps)
[37092.343732] uvcvideo: - 2560x1440 (25.0 fps)
[37092.343734] uvcvideo: Found format H.264.
[37092.343736] uvcvideo: - 640x480 (25.0 fps)
[37092.343737] uvcvideo: - 800x600 (25.0 fps)
[37092.343739] uvcvideo: - 1280x720 (25.0 fps)
[37092.343741] uvcvideo: - 1280x960 (25.0 fps)
[37092.343742] uvcvideo: - 1920x1080 (25.0 fps)
[37092.343744] uvcvideo: - 2304x1296 (25.0 fps)
[37092.343746] uvcvideo: - 2560x1440 (25.0 fps)
[37092.343748] uvcvideo: Unknown video format 35363248-0000-0010-8000-00aa00389b71
[37092.343750] uvcvideo: Found format 35363248-0000-0010-8000-00aa003.
[37092.343752] uvcvideo: - 640x480 (25.0 fps)
[37092.343753] uvcvideo: - 800x600 (25.0 fps)
[37092.343755] uvcvideo: - 1280x720 (25.0 fps)
[37092.343756] uvcvideo: - 1280x960 (25.0 fps)
[37092.343758] uvcvideo: - 1920x1080 (25.0 fps)
[37092.343759] uvcvideo: - 2304x1296 (25.0 fps)
[37092.343761] uvcvideo: - 2560x1440 (25.0 fps)
[37092.343762] uvcvideo: Found format YUV 4:2:2 (YUYV).
[37092.343764] uvcvideo: - 320x240 (25.0 fps)
[37092.343766] uvcvideo: - 640x360 (25.0 fps)
[37092.343768] uvcvideo: - 640x480 (25.0 fps)
[37092.343770] uvcvideo: - 720x480 (25.0 fps)
[37092.343771] uvcvideo: - 800x600 (25.0 fps)
[37092.343773] uvcvideo: - 1024x576 (25.0 fps)
[37092.343779] uvcvideo: Found a Status endpoint (addr 81).
[37092.343781] uvcvideo: Found UVC 1.00 device webcam (1d6d:0105)
[37092.343786] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/2 to device 1 entity 1
[37092.343936] uvcvideo: Adding mapping 'Exposure, Auto' to control 00000000-0000-0000-0000-000000000001/2.
[37092.343939] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/4 to device 1 entity 1
[37092.344078] uvcvideo: Adding mapping 'Exposure (Absolute)' to control 00000000-0000-0000-0000-000000000001/4.
[37092.344082] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device 1 entity 2
[37092.344224] uvcvideo: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2.
[37092.344227] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device 1 entity 2
[37092.344396] uvcvideo: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3.
[37092.344398] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device 1 entity 2
[37092.344546] uvcvideo: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7.
[37092.344548] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/8 to device 1 entity 2
[37092.344677] uvcvideo: Adding mapping 'Sharpness' to control 00000000-0000-0000-0000-000000000101/8.
[37092.344679] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/10 to device 1 entity 2
[37092.344853] uvcvideo: Adding mapping 'White Balance Temperature' to control 00000000-0000-0000-0000-000000000101/10.
[37092.344858] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/4 to device 1 entity 2
[37092.345246] uvcvideo: Adding mapping 'Gain' to control 00000000-0000-0000-0000-000000000101/4.
[37092.345249] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/5 to device 1 entity 2
[37092.345392] uvcvideo: Adding mapping 'Power Line Frequency' to control 00000000-0000-0000-0000-000000000101/5.
[37092.345395] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/11 to device 1 entity 2
[37092.345516] uvcvideo: Adding mapping 'White Balance Temperature, Auto' to control 00000000-0000-0000-0000-000000000101/11.
[37092.345520] uvcvideo: Scanning UVC chain: OT 4 <- XU 3 <- PU 2 <- IT 1
[37092.345528] uvcvideo: Found a valid video chain (1 -> 4).
[37092.346264] input: webcam: WEBCAM as /devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1:1.0/input/input33
[37092.346315] uvcvideo: UVC device initialized.
[37092.373178] uvcvideo: uvc_v4l2_open
[37092.373283] uvcvideo: uvc_v4l2_release
[37092.378987] uvcvideo: uvc_v4l2_open
[37092.379037] uvcvideo: uvc_v4l2_release
[37092.379915] uvcvideo: uvc_v4l2_open
[37092.379956] uvcvideo: uvc_v4l2_release
[37092.383624] uvcvideo: uvc_v4l2_open
[37092.383656] uvcvideo: uvc_v4l2_release
[37100.028681] uvcvideo: Suspending interface 1
[37100.028682] uvcvideo: Suspending interface 0
[37107.976981] uvcvideo: Resuming interface 0
[37107.976987] uvcvideo: Resuming interface 1
[37110.480505] uvcvideo: Suspending interface 1
[37110.480511] uvcvideo: Suspending interface 0
[37127.340632] uvcvideo: Resuming interface 0
[37127.340637] uvcvideo: Resuming interface 1
[37129.848104] uvcvideo: Suspending interface 1
[37129.848109] uvcvideo: Suspending interface 0
[37135.584254] uvcvideo: Resuming interface 0
[37135.584259] uvcvideo: Resuming interface 1
[37138.091978] uvcvideo: Suspending interface 1
[37138.091984] uvcvideo: Suspending interface 0
[37284.308613] usb 2-1: USB disconnect, device number 15
[37308.004005] usb 2-4: new high-speed USB device number 16 using xhci_hcd
[37308.153969] usb 2-4: New USB device found, idVendor=1d6d, idProduct=0105, bcdDevice= 0.10
[37308.153976] usb 2-4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[37308.153980] usb 2-4: Product: webcam
[37308.153983] usb 2-4: Manufacturer: YGTek
[37308.153986] usb 2-4: SerialNumber: YG_U700.2020.0904.1200
[37308.155033] uvcvideo: Probing generic UVC device 4
[37308.155221] uvcvideo: Found format MJPEG.
[37308.155227] uvcvideo: - 640x480 (25.0 fps)
[37308.155232] uvcvideo: - 800x600 (25.0 fps)
[37308.155236] uvcvideo: - 1280x720 (25.0 fps)
[37308.155240] uvcvideo: - 1280x960 (25.0 fps)
[37308.155244] uvcvideo: - 1920x1080 (25.0 fps)
[37308.155248] uvcvideo: - 2304x1296 (25.0 fps)
[37308.155253] uvcvideo: - 2560x1440 (25.0 fps)
[37308.155257] uvcvideo: Found format H.264.
[37308.155262] uvcvideo: - 640x480 (25.0 fps)
[37308.155266] uvcvideo: - 800x600 (25.0 fps)
[37308.155271] uvcvideo: - 1280x720 (25.0 fps)
[37308.155275] uvcvideo: - 1280x960 (25.0 fps)
[37308.155279] uvcvideo: - 1920x1080 (25.0 fps)
[37308.155284] uvcvideo: - 2304x1296 (25.0 fps)
[37308.155288] uvcvideo: - 2560x1440 (25.0 fps)
[37308.155293] uvcvideo: Unknown video format 35363248-0000-0010-8000-00aa00389b71
[37308.155298] uvcvideo: Found format 35363248-0000-0010-8000-00aa003.
[37308.155303] uvcvideo: - 640x480 (25.0 fps)
[37308.155307] uvcvideo: - 800x600 (25.0 fps)
[37308.155312] uvcvideo: - 1280x720 (25.0 fps)
[37308.155316] uvcvideo: - 1280x960 (25.0 fps)
[37308.155320] uvcvideo: - 1920x1080 (25.0 fps)
[37308.155325] uvcvideo: - 2304x1296 (25.0 fps)
[37308.155329] uvcvideo: - 2560x1440 (25.0 fps)
[37308.155333] uvcvideo: Found format YUV 4:2:2 (YUYV).
[37308.155338] uvcvideo: - 320x240 (25.0 fps)
[37308.155343] uvcvideo: - 640x360 (25.0 fps)
[37308.155347] uvcvideo: - 640x480 (25.0 fps)
[37308.155351] uvcvideo: - 720x480 (25.0 fps)
[37308.155356] uvcvideo: - 800x600 (25.0 fps)
[37308.155360] uvcvideo: - 1024x576 (25.0 fps)
[37308.155372] uvcvideo: Found a Status endpoint (addr 81).
[37308.155377] uvcvideo: Found UVC 1.00 device webcam (1d6d:0105)
[37308.155389] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/2 to device 4 entity 1
[37308.155549] uvcvideo: Adding mapping 'Exposure, Auto' to control 00000000-0000-0000-0000-000000000001/2.
[37308.155557] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/4 to device 4 entity 1
[37308.155719] uvcvideo: Adding mapping 'Exposure (Absolute)' to control 00000000-0000-0000-0000-000000000001/4.
[37308.155727] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device 4 entity 2
[37308.156363] uvcvideo: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2.
[37308.156368] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device 4 entity 2
[37308.156544] uvcvideo: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3.
[37308.156551] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device 4 entity 2
[37308.156696] uvcvideo: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7.
[37308.156700] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/8 to device 4 entity 2
[37308.156893] uvcvideo: Adding mapping 'Sharpness' to control 00000000-0000-0000-0000-000000000101/8.
[37308.156900] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/10 to device 4 entity 2
[37308.157066] uvcvideo: Adding mapping 'White Balance Temperature' to control 00000000-0000-0000-0000-000000000101/10.
[37308.157071] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/4 to device 4 entity 2
[37308.157311] uvcvideo: Adding mapping 'Gain' to control 00000000-0000-0000-0000-000000000101/4.
[37308.157316] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/5 to device 4 entity 2
[37308.157442] uvcvideo: Adding mapping 'Power Line Frequency' to control 00000000-0000-0000-0000-000000000101/5.
[37308.157446] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/11 to device 4 entity 2
[37308.157566] uvcvideo: Adding mapping 'White Balance Temperature, Auto' to control 00000000-0000-0000-0000-000000000101/11.
[37308.157571] uvcvideo: Scanning UVC chain: OT 4 <- XU 3 <- PU 2 <- IT 1
[37308.157585] uvcvideo: Found a valid video chain (1 -> 4).
[37308.159302] input: webcam: WEBCAM as /devices/pci0000:00/0000:00:14.0/usb2/2-4/2-4:1.0/input/input34
[37308.159579] uvcvideo: UVC device initialized.
[37308.224386] uvcvideo: uvc_v4l2_open
[37308.224466] uvcvideo: uvc_v4l2_release
[37308.226518] uvcvideo: uvc_v4l2_open
[37308.226550] uvcvideo: uvc_v4l2_release
[37308.227264] uvcvideo: uvc_v4l2_open
[37308.227302] uvcvideo: uvc_v4l2_release
[37308.227478] uvcvideo: uvc_v4l2_open
[37308.227493] uvcvideo: uvc_v4l2_release
[37315.867670] uvcvideo: Suspending interface 1
[37315.867672] uvcvideo: Suspending interface 0
[37354.654916] uvcvideo: Resuming interface 0
[37354.654922] uvcvideo: Resuming interface 1
[37369.674297] uvcvideo: Suspending interface 1
[37369.674303] uvcvideo: Suspending interface 0
[37374.482178] usb 2-4: USB disconnect, device number 16
[37422.268846] usb 2-2: new high-speed USB device number 17 using xhci_hcd
[37422.418201] usb 2-2: New USB device found, idVendor=1d6d, idProduct=0105, bcdDevice= 0.10
[37422.418204] usb 2-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[37422.418206] usb 2-2: Product: webcam
[37422.418208] usb 2-2: Manufacturer: YGTek
[37422.418209] usb 2-2: SerialNumber: YG_U700.2020.0904.1200
[37422.418923] uvcvideo: Probing generic UVC device 2
[37422.419083] uvcvideo: Found format MJPEG.
[37422.419085] uvcvideo: - 640x480 (25.0 fps)
[37422.419087] uvcvideo: - 800x600 (25.0 fps)
[37422.419089] uvcvideo: - 1280x720 (25.0 fps)
[37422.419091] uvcvideo: - 1280x960 (25.0 fps)
[37422.419093] uvcvideo: - 1920x1080 (25.0 fps)
[37422.419094] uvcvideo: - 2304x1296 (25.0 fps)
[37422.419096] uvcvideo: - 2560x1440 (25.0 fps)
[37422.419097] uvcvideo: Found format H.264.
[37422.419099] uvcvideo: - 640x480 (25.0 fps)
[37422.419101] uvcvideo: - 800x600 (25.0 fps)
[37422.419102] uvcvideo: - 1280x720 (25.0 fps)
[37422.419104] uvcvideo: - 1280x960 (25.0 fps)
[37422.419106] uvcvideo: - 1920x1080 (25.0 fps)
[37422.419107] uvcvideo: - 2304x1296 (25.0 fps)
[37422.419109] uvcvideo: - 2560x1440 (25.0 fps)
[37422.419112] uvcvideo: Unknown video format 35363248-0000-0010-8000-00aa00389b71
[37422.419114] uvcvideo: Found format 35363248-0000-0010-8000-00aa003.
[37422.419115] uvcvideo: - 640x480 (25.0 fps)
[37422.419117] uvcvideo: - 800x600 (25.0 fps)
[37422.419119] uvcvideo: - 1280x720 (25.0 fps)
[37422.419120] uvcvideo: - 1280x960 (25.0 fps)
[37422.419122] uvcvideo: - 1920x1080 (25.0 fps)
[37422.419124] uvcvideo: - 2304x1296 (25.0 fps)
[37422.419125] uvcvideo: - 2560x1440 (25.0 fps)
[37422.419127] uvcvideo: Found format YUV 4:2:2 (YUYV).
[37422.419128] uvcvideo: - 320x240 (25.0 fps)
[37422.419130] uvcvideo: - 640x360 (25.0 fps)
[37422.419132] uvcvideo: - 640x480 (25.0 fps)
[37422.419134] uvcvideo: - 720x480 (25.0 fps)
[37422.419136] uvcvideo: - 800x600 (25.0 fps)
[37422.419137] uvcvideo: - 1024x576 (25.0 fps)
[37422.419143] uvcvideo: Found a Status endpoint (addr 81).
[37422.419146] uvcvideo: Found UVC 1.00 device webcam (1d6d:0105)
[37422.419151] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/2 to device 2 entity 1
[37422.419293] uvcvideo: Adding mapping 'Exposure, Auto' to control 00000000-0000-0000-0000-000000000001/2.
[37422.419296] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/4 to device 2 entity 1
[37422.419461] uvcvideo: Adding mapping 'Exposure (Absolute)' to control 00000000-0000-0000-0000-000000000001/4.
[37422.419466] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device 2 entity 2
[37422.419590] uvcvideo: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2.
[37422.419593] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device 2 entity 2
[37422.419729] uvcvideo: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3.
[37422.419732] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device 2 entity 2
[37422.419872] uvcvideo: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7.
[37422.419875] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/8 to device 2 entity 2
[37422.420015] uvcvideo: Adding mapping 'Sharpness' to control 00000000-0000-0000-0000-000000000101/8.
[37422.420018] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/10 to device 2 entity 2
[37422.420153] uvcvideo: Adding mapping 'White Balance Temperature' to control 00000000-0000-0000-0000-000000000101/10.
[37422.420155] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/4 to device 2 entity 2
[37422.420292] uvcvideo: Adding mapping 'Gain' to control 00000000-0000-0000-0000-000000000101/4.
[37422.420294] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/5 to device 2 entity 2
[37422.420424] uvcvideo: Adding mapping 'Power Line Frequency' to control 00000000-0000-0000-0000-000000000101/5.
[37422.420426] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/11 to device 2 entity 2
[37422.420557] uvcvideo: Adding mapping 'White Balance Temperature, Auto' to control 00000000-0000-0000-0000-000000000101/11.
[37422.420559] uvcvideo: Scanning UVC chain: OT 4 <- XU 3 <- PU 2 <- IT 1
[37422.420566] uvcvideo: Found a valid video chain (1 -> 4).
[37422.421426] input: webcam: WEBCAM as /devices/pci0000:00/0000:00:14.0/usb2/2-2/2-2:1.0/input/input35
[37422.421819] uvcvideo: UVC device initialized.
[37430.854416] uvcvideo: uvc_v4l2_open
[37430.920952] uvcvideo: Resuming interface 0
[37430.920953] uvcvideo: Resuming interface 1
[37430.921131] uvcvideo: uvc_v4l2_release
[37431.249448] uvcvideo: uvc_v4l2_open
[37431.249544] uvcvideo: uvc_v4l2_release
[37431.260056] uvcvideo: uvc_v4l2_open
[37431.260132] uvcvideo: uvc_v4l2_release
[37431.353847] uvcvideo: uvc_v4l2_open
[37431.354035] uvcvideo: uvc_v4l2_release
[37431.389780] uvcvideo: uvc_v4l2_open
[37431.389805] uvcvideo: Trying format 0x56595559 (YUYV): 0x0.
[37431.389808] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[37431.403680] uvcvideo: uvc_v4l2_release
[37431.405857] uvcvideo: uvc_v4l2_open
[37431.405873] uvcvideo: Trying format 0x56595559 (YUYV): 640x480.
[37431.405874] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[37431.419954] uvcvideo: Setting frame interval to 1/30 (333333).
[37431.463269] uvcvideo: Device requested 3060 B/frame bandwidth.
[37431.463273] uvcvideo: Selecting alternate setting 11 (3060 B/frame bandwidth).
[37431.463497] uvcvideo: Allocated 5 URB buffers of 32x3060 bytes each.
[37431.463527] uvcvideo: uvc_v4l2_poll
[37431.485631] uvcvideo: Trying format 0x56595559 (YUYV): 0x0.
[37431.485633] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[37431.768676] uvcvideo: Frame complete (EOF found).
[37431.768712] uvcvideo: frame 1 stats: 2189/242/2431 packets, 1/1634/2431 pts (early initial), 2430/2431 scr, last pts/stc/sof 1059664553/1064448957/148
[37431.768996] uvcvideo: uvc_v4l2_poll
[37431.769055] uvcvideo: uvc_v4l2_poll
[37431.783832] uvcvideo: Trying format 0x56595559 (YUYV): 0x0.
[37431.783839] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[37431.868663] uvcvideo: Frame complete (EOF found).
[37431.868671] uvcvideo: frame 2 stats: 556/241/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1064450247/1069230955/248
[37431.868734] uvcvideo: uvc_v4l2_poll
[37431.868808] uvcvideo: uvc_v4l2_poll
[37431.879389] uvcvideo: Trying format 0x56595559 (YUYV): 0x0.
[37431.879391] uvcvideo: Using default frame interval 33333.3 us (30.0 fps).
[37431.968640] uvcvideo: Frame complete (EOF found).
[37431.968646] uvcvideo: frame 3 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1069235940/1074018955/348
[37431.968694] uvcvideo: uvc_v4l2_poll
[37431.968714] uvcvideo: uvc_v4l2_poll
[37432.068671] uvcvideo: Frame complete (EOF found).
[37432.068674] uvcvideo: frame 4 stats: 556/241/797 packets, 1/1/797 pts (early initial), 796/797 scr, last pts/stc/sof 1074021632/1078800955/447
[37432.068707] uvcvideo: uvc_v4l2_poll
[37432.068733] uvcvideo: uvc_v4l2_poll
[37432.168695] uvcvideo: Frame complete (EOF found).
[37432.168706] uvcvideo: frame 5 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1078807327/1083588955/547
[37432.168796] uvcvideo: uvc_v4l2_poll
[37432.168859] uvcvideo: uvc_v4l2_poll
[37432.268719] uvcvideo: Frame complete (EOF found).
[37432.268730] uvcvideo: frame 6 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1083593020/1088376957/647
[37432.268822] uvcvideo: uvc_v4l2_poll
[37432.268884] uvcvideo: uvc_v4l2_poll
[37432.368679] uvcvideo: Frame complete (EOF found).
[37432.368689] uvcvideo: frame 7 stats: 556/241/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1088378713/1093158955/746
[37432.368778] uvcvideo: uvc_v4l2_poll
[37432.368833] uvcvideo: uvc_v4l2_poll
[37432.468692] uvcvideo: Frame complete (EOF found).
[37432.468703] uvcvideo: frame 8 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1093164406/1097946953/846
[37432.468867] uvcvideo: uvc_v4l2_poll
[37432.468927] uvcvideo: uvc_v4l2_poll
[37432.568741] uvcvideo: Frame complete (EOF found).
[37432.568764] uvcvideo: frame 9 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1097950099/1102734953/946
[37432.568841] uvcvideo: uvc_v4l2_poll
[37432.568901] uvcvideo: uvc_v4l2_poll
[37432.668703] uvcvideo: Frame complete (EOF found).
[37432.668714] uvcvideo: frame 10 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1102735793/1107516953/1045
[37432.668872] uvcvideo: uvc_v4l2_poll
[37432.668929] uvcvideo: uvc_v4l2_poll
[37432.716506] usb 2-2: USB disconnect, device number 17
[37432.768689] uvcvideo: Frame complete (EOF found).
[37432.768697] uvcvideo: frame 11 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1107521486/1112304955/1145
[37432.768754] uvcvideo: uvc_v4l2_poll
[37432.768798] uvcvideo: uvc_v4l2_poll
[37432.868661] uvcvideo: Frame complete (EOF found).
[37432.868665] uvcvideo: frame 12 stats: 556/242/798 packets, 0/0/798 pts (early initial), 797/798 scr, last pts/stc/sof 1112307179/1117092953/1245
[37432.868744] uvcvideo: uvc_v4l2_poll
[37432.868769] uvcvideo: uvc_v4l2_poll
[37432.968661] uvcvideo: Frame complete (EOF found).
[37432.968665] uvcvideo: frame 13 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1117092873/1121874950/1345
[37432.968744] uvcvideo: uvc_v4l2_poll
[37432.968766] uvcvideo: uvc_v4l2_poll
[37433.036438] usb 2-2: new high-speed USB device number 18 using xhci_hcd
[37433.064668] uvcvideo: Frame complete (EOF found).
[37433.064708] uvcvideo: uvc_v4l2_poll
[37433.064734] uvcvideo: uvc_v4l2_poll
[37433.068631] uvcvideo: frame 14 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1121878567/1126662950/1444
[37433.164718] uvcvideo: Frame complete (EOF found).
[37433.164722] uvcvideo: frame 15 stats: 556/241/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1126664259/1131444950/1544
[37433.164816] uvcvideo: uvc_v4l2_poll
[37433.164842] uvcvideo: uvc_v4l2_poll
[37433.194004] usb 2-2: New USB device found, idVendor=1d6d, idProduct=0105, bcdDevice= 0.10
[37433.194006] usb 2-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[37433.194008] usb 2-2: Product: webcam
[37433.194008] usb 2-2: Manufacturer: YGTek
[37433.194009] usb 2-2: SerialNumber: YG_U700.2020.0904.1200
[37433.194639] uvcvideo: Probing generic UVC device 2
[37433.194787] uvcvideo: Found format MJPEG.
[37433.194789] uvcvideo: - 640x480 (25.0 fps)
[37433.194790] uvcvideo: - 800x600 (25.0 fps)
[37433.194791] uvcvideo: - 1280x720 (25.0 fps)
[37433.194791] uvcvideo: - 1280x960 (25.0 fps)
[37433.194792] uvcvideo: - 1920x1080 (25.0 fps)
[37433.194793] uvcvideo: - 2304x1296 (25.0 fps)
[37433.194794] uvcvideo: - 2560x1440 (25.0 fps)
[37433.194795] uvcvideo: Found format H.264.
[37433.194796] uvcvideo: - 640x480 (25.0 fps)
[37433.194796] uvcvideo: - 800x600 (25.0 fps)
[37433.194797] uvcvideo: - 1280x720 (25.0 fps)
[37433.194798] uvcvideo: - 1280x960 (25.0 fps)
[37433.194799] uvcvideo: - 1920x1080 (25.0 fps)
[37433.194799] uvcvideo: - 2304x1296 (25.0 fps)
[37433.194800] uvcvideo: - 2560x1440 (25.0 fps)
[37433.194801] uvcvideo: Unknown video format 35363248-0000-0010-8000-00aa00389b71
[37433.194802] uvcvideo: Found format 35363248-0000-0010-8000-00aa003.
[37433.194803] uvcvideo: - 640x480 (25.0 fps)
[37433.194804] uvcvideo: - 800x600 (25.0 fps)
[37433.194804] uvcvideo: - 1280x720 (25.0 fps)
[37433.194805] uvcvideo: - 1280x960 (25.0 fps)
[37433.194806] uvcvideo: - 1920x1080 (25.0 fps)
[37433.194807] uvcvideo: - 2304x1296 (25.0 fps)
[37433.194808] uvcvideo: - 2560x1440 (25.0 fps)
[37433.194809] uvcvideo: Found format YUV 4:2:2 (YUYV).
[37433.194810] uvcvideo: - 320x240 (25.0 fps)
[37433.194811] uvcvideo: - 640x360 (25.0 fps)
[37433.194812] uvcvideo: - 640x480 (25.0 fps)
[37433.194813] uvcvideo: - 720x480 (25.0 fps)
[37433.194814] uvcvideo: - 800x600 (25.0 fps)
[37433.194815] uvcvideo: - 1024x576 (25.0 fps)
[37433.194819] uvcvideo: Found a Status endpoint (addr 81).
[37433.194821] uvcvideo: Found UVC 1.00 device webcam (1d6d:0105)
[37433.194825] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/2 to device 2 entity 1
[37433.194960] uvcvideo: Adding mapping 'Exposure, Auto' to control 00000000-0000-0000-0000-000000000001/2.
[37433.194962] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/4 to device 2 entity 1
[37433.195097] uvcvideo: Adding mapping 'Exposure (Absolute)' to control 00000000-0000-0000-0000-000000000001/4.
[37433.195099] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device 2 entity 2
[37433.195227] uvcvideo: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2.
[37433.195228] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device 2 entity 2
[37433.195311] uvcvideo: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3.
[37433.195312] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device 2 entity 2
[37433.195457] uvcvideo: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7.
[37433.195458] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/8 to device 2 entity 2
[37433.195604] uvcvideo: Adding mapping 'Sharpness' to control 00000000-0000-0000-0000-000000000101/8.
[37433.195605] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/10 to device 2 entity 2
[37433.195760] uvcvideo: Adding mapping 'White Balance Temperature' to control 00000000-0000-0000-0000-000000000101/10.
[37433.195762] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/4 to device 2 entity 2
[37433.195909] uvcvideo: Adding mapping 'Gain' to control 00000000-0000-0000-0000-000000000101/4.
[37433.195911] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/5 to device 2 entity 2
[37433.196038] uvcvideo: Adding mapping 'Power Line Frequency' to control 00000000-0000-0000-0000-000000000101/5.
[37433.196039] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/11 to device 2 entity 2
[37433.196121] uvcvideo: Adding mapping 'White Balance Temperature, Auto' to control 00000000-0000-0000-0000-000000000101/11.
[37433.196123] uvcvideo: Scanning UVC chain: OT 4 <- XU 3 <- PU 2 <- IT 1
[37433.196127] uvcvideo: Found a valid video chain (1 -> 4).
[37433.196988] input: webcam: WEBCAM as /devices/pci0000:00/0000:00:14.0/usb2/2-2/2-2:1.0/input/input36
[37433.197391] uvcvideo: UVC device initialized.
[37433.264718] uvcvideo: Frame complete (EOF found).
[37433.264723] uvcvideo: frame 16 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1131449952/1136232950/1644
[37433.264814] uvcvideo: uvc_v4l2_poll
[37433.264840] uvcvideo: uvc_v4l2_poll
[37433.364668] uvcvideo: Frame complete (EOF found).
[37433.364672] uvcvideo: frame 17 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1136235647/1141020950/1743
[37433.364769] uvcvideo: uvc_v4l2_poll
[37433.364801] uvcvideo: uvc_v4l2_poll
[37433.464722] uvcvideo: Frame complete (EOF found).
[37433.464726] uvcvideo: frame 18 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1141021340/1145802947/1843
[37433.464818] uvcvideo: uvc_v4l2_poll
[37433.464844] uvcvideo: uvc_v4l2_poll
[37433.564716] uvcvideo: Frame complete (EOF found).
[37433.564720] uvcvideo: frame 19 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1145807033/1150590947/1943
[37433.564813] uvcvideo: uvc_v4l2_poll
[37433.564839] uvcvideo: uvc_v4l2_poll
[37433.664716] uvcvideo: Frame complete (EOF found).
[37433.664720] uvcvideo: frame 20 stats: 556/241/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1150592726/1155372945/2042
[37433.664815] uvcvideo: uvc_v4l2_poll
[37433.664841] uvcvideo: uvc_v4l2_poll
[37433.764661] uvcvideo: Frame complete (EOF found).
[37433.764664] uvcvideo: frame 21 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1155378419/1160160945/94
[37433.764742] uvcvideo: uvc_v4l2_poll
[37433.764762] uvcvideo: uvc_v4l2_poll
[37433.864660] uvcvideo: Frame complete (EOF found).
[37433.864663] uvcvideo: frame 22 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1160164113/1164948945/194
[37433.864692] uvcvideo: uvc_v4l2_poll
[37433.864714] uvcvideo: uvc_v4l2_poll
[37433.964714] uvcvideo: Frame complete (EOF found).
[37433.964731] uvcvideo: frame 23 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1164949806/1169730945/294
[37433.964788] uvcvideo: uvc_v4l2_poll
[37433.964843] uvcvideo: uvc_v4l2_poll
[37434.064654] uvcvideo: Frame complete (EOF found).
[37434.064664] uvcvideo: frame 24 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1169735499/1174518945/393
[37434.064723] uvcvideo: uvc_v4l2_poll
[37434.064767] uvcvideo: uvc_v4l2_poll
[37434.164648] uvcvideo: Frame complete (EOF found).
[37434.164664] uvcvideo: frame 25 stats: 556/242/798 packets, 0/0/798 pts (early initial), 797/798 scr, last pts/stc/sof 1174521193/1179306945/493
[37434.164726] uvcvideo: uvc_v4l2_poll
[37434.164771] uvcvideo: uvc_v4l2_poll
[37434.264682] uvcvideo: Frame complete (EOF found).
[37434.264692] uvcvideo: frame 26 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1179306887/1184088945/593
[37434.264793] uvcvideo: uvc_v4l2_poll
[37434.264846] uvcvideo: uvc_v4l2_poll
[37434.364650] uvcvideo: Frame complete (EOF found).
[37434.364664] uvcvideo: frame 27 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1184092580/1188876945/692
[37434.364746] uvcvideo: uvc_v4l2_poll
[37434.364800] uvcvideo: uvc_v4l2_poll
[37434.460701] uvcvideo: Frame complete (EOF found).
[37434.460711] uvcvideo: frame 28 stats: 556/241/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1188878272/1193658944/792
[37434.460887] uvcvideo: uvc_v4l2_poll
[37434.460947] uvcvideo: uvc_v4l2_poll
[37434.560673] uvcvideo: Frame complete (EOF found).
[37434.560683] uvcvideo: frame 29 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1193663967/1198446945/892
[37434.560785] uvcvideo: uvc_v4l2_poll
[37434.560833] uvcvideo: uvc_v4l2_poll
[37434.660673] uvcvideo: Frame complete (EOF found).
[37434.660684] uvcvideo: frame 30 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1198449660/1203234944/992
[37434.660797] uvcvideo: uvc_v4l2_poll
[37434.660851] uvcvideo: uvc_v4l2_poll
[37434.760655] uvcvideo: Frame complete (EOF found).
[37434.760673] uvcvideo: frame 31 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1203235353/1208016942/1091
[37434.760780] uvcvideo: uvc_v4l2_poll
[37434.760831] uvcvideo: uvc_v4l2_poll
[37434.860640] uvcvideo: Frame complete (EOF found).
[37434.860645] uvcvideo: frame 32 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1208021046/1212804942/1191
[37434.860684] uvcvideo: uvc_v4l2_poll
[37434.860706] uvcvideo: uvc_v4l2_poll
[37434.960657] uvcvideo: Frame complete (EOF found).
[37434.960661] uvcvideo: frame 33 stats: 556/241/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1212806741/1217586942/1291
[37434.960685] uvcvideo: uvc_v4l2_poll
[37434.960706] uvcvideo: uvc_v4l2_poll
[37435.060664] uvcvideo: Frame complete (EOF found).
[37435.060668] uvcvideo: frame 34 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1217592433/1222374942/1390
[37435.060695] uvcvideo: uvc_v4l2_poll
[37435.060714] uvcvideo: uvc_v4l2_poll
[37435.160679] uvcvideo: Frame complete (EOF found).
[37435.160683] uvcvideo: frame 35 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1222378126/1227162944/1490
[37435.160770] uvcvideo: uvc_v4l2_poll
[37435.160795] uvcvideo: uvc_v4l2_poll
[37435.260668] uvcvideo: Frame complete (EOF found).
[37435.260672] uvcvideo: frame 36 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1227163819/1231944944/1590
[37435.260705] uvcvideo: uvc_v4l2_poll
[37435.260728] uvcvideo: uvc_v4l2_poll
[37435.360714] uvcvideo: Frame complete (EOF found).
[37435.360718] uvcvideo: frame 37 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1231949513/1236732944/1689
[37435.360808] uvcvideo: uvc_v4l2_poll
[37435.360833] uvcvideo: uvc_v4l2_poll
[37435.460715] uvcvideo: Frame complete (EOF found).
[37435.460719] uvcvideo: frame 38 stats: 556/242/798 packets, 0/0/798 pts (early initial), 797/798 scr, last pts/stc/sof 1236735207/1241520944/1789
[37435.460806] uvcvideo: uvc_v4l2_poll
[37435.460831] uvcvideo: uvc_v4l2_poll
[37435.560714] uvcvideo: Frame complete (EOF found).
[37435.560718] uvcvideo: frame 39 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1241520900/1246302942/1889
[37435.560804] uvcvideo: uvc_v4l2_poll
[37435.560829] uvcvideo: uvc_v4l2_poll
[37435.660655] uvcvideo: Frame complete (EOF found).
[37435.660659] uvcvideo: frame 40 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1246306592/1251090942/1989
[37435.660679] uvcvideo: uvc_v4l2_poll
[37435.660698] uvcvideo: uvc_v4l2_poll
[37435.756670] uvcvideo: Frame complete (EOF found).
[37435.756674] uvcvideo: frame 41 stats: 556/241/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1251092287/1255872942/40
[37435.756713] uvcvideo: uvc_v4l2_poll
[37435.756738] uvcvideo: uvc_v4l2_poll
[37435.856644] uvcvideo: Frame complete (EOF found).
[37435.856649] uvcvideo: frame 42 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1255877979/1260660942/140
[37435.856680] uvcvideo: uvc_v4l2_poll
[37435.856704] uvcvideo: uvc_v4l2_poll
[37435.956638] uvcvideo: Frame complete (EOF found).
[37435.956643] uvcvideo: frame 43 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1260663673/1265448942/240
[37435.956689] uvcvideo: uvc_v4l2_poll
[37435.956716] uvcvideo: uvc_v4l2_poll
[37436.056669] uvcvideo: Frame complete (EOF found).
[37436.056673] uvcvideo: frame 44 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1265449366/1270230944/339
[37436.056758] uvcvideo: uvc_v4l2_poll
[37436.056781] uvcvideo: uvc_v4l2_poll
[37436.156718] uvcvideo: Frame complete (EOF found).
[37436.156722] uvcvideo: frame 45 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1270235059/1275018944/439
[37436.156813] uvcvideo: uvc_v4l2_poll
[37436.156839] uvcvideo: uvc_v4l2_poll
[37436.256717] uvcvideo: Frame complete (EOF found).
[37436.256734] uvcvideo: frame 46 stats: 556/241/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1275020753/1279800945/539
[37436.256866] uvcvideo: uvc_v4l2_poll
[37436.257034] uvcvideo: uvc_v4l2_poll
[37436.356667] uvcvideo: Frame complete (EOF found).
[37436.356684] uvcvideo: frame 47 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1279806446/1284588942/638
[37436.356763] uvcvideo: uvc_v4l2_poll
[37436.356806] uvcvideo: uvc_v4l2_poll
[37436.456668] uvcvideo: Frame complete (EOF found).
[37436.456683] uvcvideo: frame 48 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1284592140/1289376945/738
[37436.456786] uvcvideo: uvc_v4l2_poll
[37436.456833] uvcvideo: uvc_v4l2_poll
[37436.556705] uvcvideo: Frame complete (EOF found).
[37436.556715] uvcvideo: frame 49 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1289377833/1294158945/838
[37436.556872] uvcvideo: uvc_v4l2_poll
[37436.556925] uvcvideo: uvc_v4l2_poll
[37436.656739] uvcvideo: Frame complete (EOF found).
[37436.656749] uvcvideo: frame 50 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1294163527/1298946945/938
[37436.656905] uvcvideo: uvc_v4l2_poll
[37436.656957] uvcvideo: uvc_v4l2_poll
[37436.756701] uvcvideo: Frame complete (EOF found).
[37436.756712] uvcvideo: frame 51 stats: 556/242/798 packets, 0/0/798 pts (early initial), 797/798 scr, last pts/stc/sof 1298949219/1303734945/1037
[37436.756782] uvcvideo: uvc_v4l2_poll
[37436.756836] uvcvideo: uvc_v4l2_poll
[37436.856689] uvcvideo: Frame complete (EOF found).
[37436.856720] uvcvideo: frame 52 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1303734912/1308516945/1137
[37436.856869] uvcvideo: uvc_v4l2_poll
[37436.857068] uvcvideo: uvc_v4l2_poll
[37436.956714] uvcvideo: Frame complete (EOF found).
[37436.956729] uvcvideo: frame 53 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1308520607/1313304944/1237
[37436.956789] uvcvideo: uvc_v4l2_poll
[37436.956845] uvcvideo: uvc_v4l2_poll
[37437.052750] uvcvideo: Frame complete (EOF found).
[37437.052930] uvcvideo: uvc_v4l2_poll
[37437.052990] uvcvideo: uvc_v4l2_poll
[37437.056648] uvcvideo: frame 54 stats: 556/241/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1313306300/1318086942/1336
[37437.152749] uvcvideo: Frame complete (EOF found).
[37437.152761] uvcvideo: frame 55 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1318091993/1322874944/1436
[37437.152942] uvcvideo: uvc_v4l2_poll
[37437.153002] uvcvideo: uvc_v4l2_poll
[37437.252749] uvcvideo: Frame complete (EOF found).
[37437.252760] uvcvideo: frame 56 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1322877686/1327662942/1536
[37437.252933] uvcvideo: uvc_v4l2_poll
[37437.252992] uvcvideo: uvc_v4l2_poll
[37437.352758] uvcvideo: Frame complete (EOF found).
[37437.352770] uvcvideo: frame 57 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1327663379/1332444942/1635
[37437.352950] uvcvideo: uvc_v4l2_poll
[37437.353009] uvcvideo: uvc_v4l2_poll
[37437.452649] uvcvideo: Frame complete (EOF found).
[37437.452654] uvcvideo: frame 58 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1332449073/1337232942/1735
[37437.452692] uvcvideo: uvc_v4l2_poll
[37437.452722] uvcvideo: uvc_v4l2_poll
[37437.552724] uvcvideo: Frame complete (EOF found).
[37437.552730] uvcvideo: frame 59 stats: 556/242/798 packets, 0/0/798 pts (early initial), 797/798 scr, last pts/stc/sof 1337234766/1342020942/1835
[37437.552773] uvcvideo: uvc_v4l2_poll
[37437.552805] uvcvideo: uvc_v4l2_poll
[37437.652670] uvcvideo: Frame complete (EOF found).
[37437.652675] uvcvideo: frame 60 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1342020459/1346802942/1935
[37437.652775] uvcvideo: uvc_v4l2_poll
[37437.652807] uvcvideo: uvc_v4l2_poll
[37437.752635] uvcvideo: Frame complete (EOF found).
[37437.752640] uvcvideo: frame 61 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1346806153/1351590944/2034
[37437.752677] uvcvideo: uvc_v4l2_poll
[37437.752704] uvcvideo: uvc_v4l2_poll
[37437.852640] uvcvideo: Frame complete (EOF found).
[37437.852645] uvcvideo: frame 62 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1351591847/1356372944/86
[37437.852683] uvcvideo: uvc_v4l2_poll
[37437.852714] uvcvideo: uvc_v4l2_poll
[37437.952649] uvcvideo: Frame complete (EOF found).
[37437.952652] uvcvideo: frame 63 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1356377540/1361160942/186
[37437.952682] uvcvideo: uvc_v4l2_poll
[37437.952704] uvcvideo: uvc_v4l2_poll
[37438.052679] uvcvideo: Frame complete (EOF found).
[37438.052683] uvcvideo: frame 64 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1361163232/1365948942/285
[37438.052717] uvcvideo: uvc_v4l2_poll
[37438.052743] uvcvideo: uvc_v4l2_poll
[37438.152716] uvcvideo: Frame complete (EOF found).
[37438.152720] uvcvideo: frame 65 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1365948927/1370730945/385
[37438.152756] uvcvideo: uvc_v4l2_poll
[37438.152783] uvcvideo: uvc_v4l2_poll
[37438.252724] uvcvideo: Frame complete (EOF found).
[37438.252740] uvcvideo: frame 66 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1370734619/1375518947/485
[37438.252862] uvcvideo: uvc_v4l2_poll
[37438.252919] uvcvideo: uvc_v4l2_poll
[37438.352646] uvcvideo: Frame complete (EOF found).
[37438.352659] uvcvideo: frame 67 stats: 556/241/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1375520313/1380300945/584
[37438.352742] uvcvideo: uvc_v4l2_poll
[37438.352800] uvcvideo: uvc_v4l2_poll
[37438.371664] uvcvideo: uvc_v4l2_open
[37438.371747] uvcvideo: uvc_v4l2_release
[37438.375279] uvcvideo: uvc_v4l2_open
[37438.375760] uvcvideo: uvc_v4l2_open
[37438.375806] uvcvideo: uvc_v4l2_release
[37438.376109] uvcvideo: uvc_v4l2_open
[37438.376181] uvcvideo: uvc_v4l2_release
[37438.377075] uvcvideo: uvc_v4l2_open
[37438.377089] uvcvideo: uvc_v4l2_release
[37438.381231] uvcvideo: uvc_v4l2_open
[37438.381348] uvcvideo: uvc_v4l2_release
[37438.396293] uvcvideo: uvc_v4l2_release
[37438.448642] uvcvideo: Frame complete (EOF found).
[37438.448646] uvcvideo: frame 68 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1380306006/1385088944/684
[37438.448682] uvcvideo: uvc_v4l2_poll
[37438.448706] uvcvideo: uvc_v4l2_poll
[37438.477163] uvcvideo: uvc_v4l2_open
[37438.477242] uvcvideo: uvc_v4l2_release
[37438.480208] uvcvideo: uvc_v4l2_open
[37438.480320] uvcvideo: uvc_v4l2_open
[37438.480342] uvcvideo: uvc_v4l2_release
[37438.480473] uvcvideo: uvc_v4l2_release
[37438.481017] uvcvideo: uvc_v4l2_open
[37438.481480] uvcvideo: uvc_v4l2_release
[37438.481638] uvcvideo: uvc_v4l2_open
[37438.481654] uvcvideo: uvc_v4l2_release
[37438.481940] uvcvideo: uvc_v4l2_open
[37438.482044] uvcvideo: uvc_v4l2_release
[37438.548655] uvcvideo: Frame complete (EOF found).
[37438.548659] uvcvideo: frame 69 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1385091699/1389876944/784
[37438.548687] uvcvideo: uvc_v4l2_poll
[37438.548713] uvcvideo: uvc_v4l2_poll
[37438.648657] uvcvideo: Frame complete (EOF found).
[37438.648660] uvcvideo: frame 70 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1389877393/1394658944/884
[37438.648688] uvcvideo: uvc_v4l2_poll
[37438.648706] uvcvideo: uvc_v4l2_poll
[37438.748636] uvcvideo: Frame complete (EOF found).
[37438.748639] uvcvideo: frame 71 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1394663086/1399446944/983
[37438.748676] uvcvideo: uvc_v4l2_poll
[37438.748701] uvcvideo: uvc_v4l2_poll
[37438.848673] uvcvideo: Frame complete (EOF found).
[37438.848678] uvcvideo: frame 72 stats: 556/242/798 packets, 0/0/798 pts (early initial), 797/798 scr, last pts/stc/sof 1399448780/1404234944/1083
[37438.848758] uvcvideo: uvc_v4l2_poll
[37438.848779] uvcvideo: uvc_v4l2_poll
[37438.948652] uvcvideo: Frame complete (EOF found).
[37438.948656] uvcvideo: frame 73 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1404234473/1409016942/1183
[37438.948685] uvcvideo: uvc_v4l2_poll
[37438.948706] uvcvideo: uvc_v4l2_poll
[37439.048639] uvcvideo: Frame complete (EOF found).
[37439.048644] uvcvideo: frame 74 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1409020167/1413804945/1282
[37439.048679] uvcvideo: uvc_v4l2_poll
[37439.048702] uvcvideo: uvc_v4l2_poll
[37439.148638] uvcvideo: Frame complete (EOF found).
[37439.148643] uvcvideo: frame 75 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1413805859/1418586945/1382
[37439.148675] uvcvideo: uvc_v4l2_poll
[37439.148697] uvcvideo: uvc_v4l2_poll
[37439.248636] uvcvideo: Frame complete (EOF found).
[37439.248640] uvcvideo: frame 76 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1418591552/1423374947/1482
[37439.248674] uvcvideo: uvc_v4l2_poll
[37439.248697] uvcvideo: uvc_v4l2_poll
[37439.348663] uvcvideo: Frame complete (EOF found).
[37439.348667] uvcvideo: frame 77 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1423377247/1428162945/1582
[37439.348696] uvcvideo: uvc_v4l2_poll
[37439.348718] uvcvideo: uvc_v4l2_poll
[37439.448718] uvcvideo: Frame complete (EOF found).
[37439.448722] uvcvideo: frame 78 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1428162940/1432944947/1681
[37439.448760] uvcvideo: uvc_v4l2_poll
[37439.448785] uvcvideo: uvc_v4l2_poll
[37439.548720] uvcvideo: Frame complete (EOF found).
[37439.548724] uvcvideo: frame 79 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1432948633/1437732947/1781
[37439.548786] uvcvideo: uvc_v4l2_poll
[37439.548823] uvcvideo: uvc_v4l2_poll
[37439.648651] uvcvideo: Frame complete (EOF found).
[37439.648656] uvcvideo: frame 80 stats: 556/241/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1437734326/1442514945/1881
[37439.648693] uvcvideo: uvc_v4l2_poll
[37439.648714] uvcvideo: uvc_v4l2_poll
[37439.744720] uvcvideo: Frame complete (EOF found).
[37439.744776] uvcvideo: uvc_v4l2_poll
[37439.744802] uvcvideo: uvc_v4l2_poll
[37439.748634] uvcvideo: frame 81 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1442520019/1447302945/1980
[37439.844653] uvcvideo: Frame complete (EOF found).
[37439.844656] uvcvideo: frame 82 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1447305713/1452090945/32
[37439.844686] uvcvideo: uvc_v4l2_poll
[37439.844706] uvcvideo: uvc_v4l2_poll
[37439.944640] uvcvideo: Frame complete (EOF found).
[37439.944644] uvcvideo: frame 83 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1452091406/1456872945/132
[37439.944674] uvcvideo: uvc_v4l2_poll
[37439.944698] uvcvideo: uvc_v4l2_poll
[37440.044683] uvcvideo: Frame complete (EOF found).
[37440.044687] uvcvideo: frame 84 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1456877100/1461660945/231
[37440.044783] uvcvideo: uvc_v4l2_poll
[37440.044808] uvcvideo: uvc_v4l2_poll
[37440.144719] uvcvideo: Frame complete (EOF found).
[37440.144723] uvcvideo: frame 85 stats: 556/242/798 packets, 0/0/798 pts (early initial), 797/798 scr, last pts/stc/sof 1461662793/1466448944/331
[37440.144786] uvcvideo: uvc_v4l2_poll
[37440.144822] uvcvideo: uvc_v4l2_poll
[37440.244655] uvcvideo: Frame complete (EOF found).
[37440.244659] uvcvideo: frame 86 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1466448487/1471230944/431
[37440.244690] uvcvideo: uvc_v4l2_poll
[37440.244710] uvcvideo: uvc_v4l2_poll
[37440.344640] uvcvideo: Frame complete (EOF found).
[37440.344645] uvcvideo: frame 87 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1471234180/1476018944/531
[37440.344677] uvcvideo: uvc_v4l2_poll
[37440.344700] uvcvideo: uvc_v4l2_poll
[37440.444662] uvcvideo: Frame complete (EOF found).
[37440.444666] uvcvideo: frame 88 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1476019872/1480800944/630
[37440.444695] uvcvideo: uvc_v4l2_poll
[37440.444716] uvcvideo: uvc_v4l2_poll
[37440.544664] uvcvideo: Frame complete (EOF found).
[37440.544667] uvcvideo: frame 89 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1480805567/1485588944/730
[37440.544765] uvcvideo: uvc_v4l2_poll
[37440.544797] uvcvideo: uvc_v4l2_poll
[37440.644682] uvcvideo: Frame complete (EOF found).
[37440.644686] uvcvideo: frame 90 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1485591260/1490376944/830
[37440.644799] uvcvideo: uvc_v4l2_poll
[37440.644829] uvcvideo: uvc_v4l2_poll
[37440.744716] uvcvideo: Frame complete (EOF found).
[37440.744720] uvcvideo: frame 91 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1490376953/1495158944/929
[37440.744781] uvcvideo: uvc_v4l2_poll
[37440.744812] uvcvideo: uvc_v4l2_poll
[37440.844717] uvcvideo: Frame complete (EOF found).
[37440.844721] uvcvideo: frame 92 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1495162646/1499946945/1029
[37440.844772] uvcvideo: uvc_v4l2_poll
[37440.844791] uvcvideo: uvc_v4l2_poll
[37440.944650] uvcvideo: Frame complete (EOF found).
[37440.944654] uvcvideo: frame 93 stats: 556/241/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1499948341/1504728944/1129
[37440.944728] uvcvideo: uvc_v4l2_poll
[37440.944745] uvcvideo: uvc_v4l2_poll
[37441.044633] uvcvideo: Frame complete (EOF found).
[37441.044637] uvcvideo: frame 94 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1504734033/1509516944/1228
[37441.044677] uvcvideo: uvc_v4l2_poll
[37441.044694] uvcvideo: uvc_v4l2_poll
[37441.140652] uvcvideo: Frame complete (EOF found).
[37441.140656] uvcvideo: frame 95 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1509519726/1514304944/1328
[37441.140687] uvcvideo: uvc_v4l2_poll
[37441.140704] uvcvideo: uvc_v4l2_poll
[37441.240721] uvcvideo: Frame complete (EOF found).
[37441.240725] uvcvideo: frame 96 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1514305419/1519086939/1428
[37441.240762] uvcvideo: uvc_v4l2_poll
[37441.240782] uvcvideo: uvc_v4l2_poll
[37441.340751] uvcvideo: Frame complete (EOF found).
[37441.340763] uvcvideo: frame 97 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1519091113/1523874939/1528
[37441.340861] uvcvideo: uvc_v4l2_poll
[37441.340908] uvcvideo: uvc_v4l2_poll
[37441.440750] uvcvideo: Frame complete (EOF found).
[37441.440761] uvcvideo: frame 98 stats: 556/241/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1523876807/1528656939/1627
[37441.440855] uvcvideo: uvc_v4l2_poll
[37441.440902] uvcvideo: uvc_v4l2_poll
[37441.540677] uvcvideo: Frame complete (EOF found).
[37441.540687] uvcvideo: frame 99 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1528662500/1533444937/1727
[37441.540762] uvcvideo: uvc_v4l2_poll
[37441.540806] uvcvideo: uvc_v4l2_poll
[37441.640752] uvcvideo: Frame complete (EOF found).
[37441.640763] uvcvideo: frame 100 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1533448192/1538232937/1827
[37441.640852] uvcvideo: uvc_v4l2_poll
[37441.640898] uvcvideo: uvc_v4l2_poll
[37441.740748] uvcvideo: Frame complete (EOF found).
[37441.740759] uvcvideo: frame 101 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1538233887/1543014937/1926
[37441.740845] uvcvideo: uvc_v4l2_poll
[37441.740893] uvcvideo: uvc_v4l2_poll
[37441.840747] uvcvideo: Frame complete (EOF found).
[37441.840788] uvcvideo: frame 102 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1543019579/1547802937/2026
[37441.841161] uvcvideo: uvc_v4l2_poll
[37441.841210] uvcvideo: uvc_v4l2_poll
[37441.940695] uvcvideo: Frame complete (EOF found).
[37441.940732] uvcvideo: frame 103 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1547805273/1552590936/78
[37441.940979] uvcvideo: uvc_v4l2_poll
[37441.941037] uvcvideo: uvc_v4l2_poll
[37442.040652] uvcvideo: Frame complete (EOF found).
[37442.040664] uvcvideo: frame 104 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1552590966/1557372936/177
[37442.040741] uvcvideo: uvc_v4l2_poll
[37442.040791] uvcvideo: uvc_v4l2_poll
[37442.140680] uvcvideo: Frame complete (EOF found).
[37442.140720] uvcvideo: frame 105 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1557376661/1562160937/277
[37442.140872] uvcvideo: uvc_v4l2_poll
[37442.141043] uvcvideo: uvc_v4l2_poll
[37442.240742] uvcvideo: Frame complete (EOF found).
[37442.240754] uvcvideo: frame 106 stats: 556/241/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1562162353/1566942936/377
[37442.240832] uvcvideo: uvc_v4l2_poll
[37442.240880] uvcvideo: uvc_v4l2_poll
[37442.340692] uvcvideo: Frame complete (EOF found).
[37442.340703] uvcvideo: frame 107 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1566948046/1571730934/477
[37442.340770] uvcvideo: uvc_v4l2_poll
[37442.340814] uvcvideo: uvc_v4l2_poll
[37442.436754] uvcvideo: Frame complete (EOF found).
[37442.436862] uvcvideo: uvc_v4l2_poll
[37442.436908] uvcvideo: uvc_v4l2_poll
[37442.440665] uvcvideo: frame 108 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1571733739/1576518934/576
[37442.536753] uvcvideo: Frame complete (EOF found).
[37442.536764] uvcvideo: frame 109 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1576519433/1581300931/676
[37442.536862] uvcvideo: uvc_v4l2_poll
[37442.536909] uvcvideo: uvc_v4l2_poll
[37442.636707] uvcvideo: Frame complete (EOF found).
[37442.636718] uvcvideo: frame 110 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1581305127/1586088931/776
[37442.636817] uvcvideo: uvc_v4l2_poll
[37442.636862] uvcvideo: uvc_v4l2_poll
[37442.736751] uvcvideo: Frame complete (EOF found).
[37442.736762] uvcvideo: frame 111 stats: 556/241/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1586090820/1590870931/875
[37442.736857] uvcvideo: uvc_v4l2_poll
[37442.736902] uvcvideo: uvc_v4l2_poll
[37442.836746] uvcvideo: Frame complete (EOF found).
[37442.836756] uvcvideo: frame 112 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1590876512/1595658931/975
[37442.836847] uvcvideo: uvc_v4l2_poll
[37442.836889] uvcvideo: uvc_v4l2_poll
[37442.936719] uvcvideo: Frame complete (EOF found).
[37442.936724] uvcvideo: frame 113 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1595662207/1600446931/1075
[37442.936800] uvcvideo: uvc_v4l2_poll
[37442.936820] uvcvideo: uvc_v4l2_poll
[37443.036720] uvcvideo: Frame complete (EOF found).
[37443.036724] uvcvideo: frame 114 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1600447899/1605228933/1174
[37443.036798] uvcvideo: uvc_v4l2_poll
[37443.036818] uvcvideo: uvc_v4l2_poll
[37443.136718] uvcvideo: Frame complete (EOF found).
[37443.136755] uvcvideo: frame 115 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1605233593/1610016931/1274
[37443.136932] uvcvideo: uvc_v4l2_poll
[37443.136981] uvcvideo: uvc_v4l2_poll
[37443.236747] uvcvideo: Frame complete (EOF found).
[37443.236803] uvcvideo: frame 116 stats: 556/242/798 packets, 1/1/798 pts (early initial), 797/798 scr, last pts/stc/sof 1610019286/1614804931/1374
[37443.236982] uvcvideo: uvc_v4l2_poll
[37443.237030] uvcvideo: uvc_v4l2_poll
[37443.336743] uvcvideo: Frame complete (EOF found).
[37443.336797] uvcvideo: frame 117 stats: 555/242/797 packets, 0/0/797 pts (early initial), 796/797 scr, last pts/stc/sof 1614804981/1619586931/1474
[37443.336974] uvcvideo: uvc_v4l2_poll
[37443.337024] uvcvideo: uvc_v4l2_poll
[37443.386065] uvcvideo: uvc_v4l2_release
[37445.861889] uvcvideo: Suspending interface 1
[37445.861895] uvcvideo: Suspending interface 0
[37446.100141] uvcvideo: Suspending interface 1
[37446.100145] uvcvideo: Suspending interface 0

--------------12F8EAD476192ADB0635177D
Content-Type: text/x-log; charset=UTF-8;
 name="lsusb.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="lsusb.log"


Bus 002 Device 015: ID 1d6d:0105 YGTek webcam
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x1d6d 
  idProduct          0x0105 
  bcdDevice            0.10
  iManufacturer           1 YGTek
  iProduct                2 webcam
  iSerial                 3 YG_U700.2020.0904.1200
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0510
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          4 config
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 Video
      bFunctionSubClass       3 Video Interface Collection
      bFunctionProtocol       0 
      iFunction               5 WEBCAM
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      1 Video Control
      bInterfaceProtocol      0 
      iInterface              0 
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x004e
        dwClockFrequency       48.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       1
      VideoControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Camera Sensor
        bAssocTerminal          0
        iTerminal               0 
        wObjectiveFocalLengthMin      0
        wObjectiveFocalLengthMax      0
        wOcularFocalLength            0
        bControlSize                  3
        bmControls           0x0000000a
          Auto-Exposure Mode
          Exposure Time (Absolute)
      VideoControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 2
        bSourceID               1
        wMaxMultiplier          0
        bControlSize            2
        bmControls     0x0000165b
          Brightness
          Contrast
          Saturation
          Sharpness
          White Balance Temperature
          Gain
          Power Line Frequency
          White Balance Temperature, Auto
        iProcessing             0 
        bmVideoStandards     0x1b
          None
          NTSC - 525/60
          SECAM - 625/50
          NTSC - 625/50
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 3
        guidExtensionCode         {a29e7641-de04-47e3-8b2b-f4341aff8888}
        bNumControls           16
        bNrInPins               1
        baSourceID( 0)          2
        bControlSize            2
        bmControls( 0)       0xff
        bmControls( 1)       0xff
        iExtension              0 
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             4
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               3
        iTerminal               0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               8
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      VideoStreaming Interface Descriptor:
        bLength                            14
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         1
        wTotalLength                   0x0408
        bEndPointAddress                  131
        bmInfo                              0
        bTerminalLink                       4
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
      VideoStreaming Interface Descriptor:
        bLength                            11
        bDescriptorType                    36
        bDescriptorSubtype                  6 (FORMAT_MJPEG)
        bFormatIndex                        1
        bNumFrameDescriptors                7
        bFlags                              0
          Fixed-size samples: No
        bDefaultFrameIndex                  5
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 1 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize      960000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           960
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize     2457600
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2304
        wHeight                          1296
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize     5971968
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize     7372800
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        2
        bNumFrameDescriptors                7
        guidFormat                            {34363248-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                       0
        bDefaultFrameIndex                  5
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
        bVariableSize                     1
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           960
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2304
        wHeight                          1296
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            28
        bDescriptorType                    36
        bDescriptorSubtype                 16 (FORMAT_FRAME_BASED)
        bFormatIndex                        3
        bNumFrameDescriptors                7
        guidFormat                            {35363248-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                       0
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
        bVariableSize                     1
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           960
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2304
        wHeight                          1296
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                 17 (FRAME_FRAME_BASED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2560
        wHeight                          1440
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwBytesPerLine                      0
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        4
        bNumFrameDescriptors                6
        guidFormat                            {32595559-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  6
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize      153600
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            720
        wHeight                           480
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize      691200
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            800
        wHeight                           600
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize      960000
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                            34
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1024
        wHeight                           576
        dwMinBitRate                 18432000
        dwMaxBitRate                 55296000
        dwMaxVideoFrameBufferSize     1179648
        dwDefaultFrameInterval         400000
        bFrameIntervalType                  2
        dwFrameInterval( 0)            400000
        dwFrameInterval( 1)            500000
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x03fc  1x 1020 bytes
        bInterval               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass        14 Video
      bInterfaceSubClass      2 Video Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         2
      bInterfaceCount         2
      bFunctionClass          1 Audio
      bFunctionSubClass       2 Streaming
      bFunctionProtocol       0 
      iFunction               6 WEBCAM
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0 
      iInterface              0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x0026
        bInCollection           1
        baInterfaceNr(0)        3
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Microphone
        bAssocTerminal          0
        bNrChannels             1
        wChannelConfig     0x0000
        iChannelNames           0 
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               5
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                 8
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 5
        bSourceID               1
        bControlSize            1
        bmaControls(0)       0x03
          Mute Control
          Volume Control
        iFeature                0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                255 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             1
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        16000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x89  EP 9 IN
        bmAttributes            1
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0080  1x 128 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  bNumConfigurations      0
Device Status:     0x0000
  (Bus Powered)

--------------12F8EAD476192ADB0635177D--
