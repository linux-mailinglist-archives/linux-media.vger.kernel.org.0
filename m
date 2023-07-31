Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8DC2769FA2
	for <lists+linux-media@lfdr.de>; Mon, 31 Jul 2023 19:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjGaRnG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jul 2023 13:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbjGaRm7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jul 2023 13:42:59 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C81F5
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 10:42:58 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5221ee899a0so6381123a12.1
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 10:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690825376; x=1691430176;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fvGS8Cf8uHBXX4sLLvb9alVaBE5v8YLgj7qQTj9mztg=;
        b=r/5ipqO8aa5MQyA8EFDzNe/b3pOQ2qdvKFxMEi8Lnr/oMzdo723tbojRZGlSd/TXcN
         Gure0uNk25u2WRj58ZIwIAvlDm5OJzFue1Wpfl447dNBlqEly+X1Uh5umq0ykpIfldBU
         tHQ7+slJ82LfAdCziUGMUQCQhlblHzxDGcJhmG7eTAvt168aO8dQW+lJ54BZqC/qg2vT
         EcFYId/Ae95n/EfWHcDJQy+ui2UsYavvPv9INGBLJuEgI2oX5Wivq3zL/L1zgc8C5Hv/
         ORLKtrEfObFW9VVikx4D7CJp64fLNKWfWl0KzNcjBf45Uax6v6EB9GAKQt7KnPB3oeTE
         jzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690825376; x=1691430176;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fvGS8Cf8uHBXX4sLLvb9alVaBE5v8YLgj7qQTj9mztg=;
        b=eXvkYYtGYIgYfMVdPnCiE5MY0y4pVGFnMMfKmqmmbi7IJ8Z+k+IY4UNxu6twakLtpx
         2IyeVp0o/nyHuKaDav9e2bCFOLCTHLu4Boysju2s910YumjXFCZK/XxdTfPcJIfupDGC
         FduvwY73F+v2QkU0eYJxu9pC6mbmnxGk5g84KUgYrrw1xO8ecGGTQpTXBPJSD0FgY/HP
         F6QrjU5eR7M5UxhP/l9XsV20+tbeMw91bh7PKWbm5q/PbY1Lcy4TXDUUMkZ0R2EWnM14
         QN/KqCrSkhmBTq8NIRK8CjHJkboev8tcXRXdiW8M/sz0GupDERESTVg8BMV7DJohZSMA
         +p6A==
X-Gm-Message-State: ABy/qLZ+gMkZ7exMAQDwBwyhtE3N8+yj6cJBmxA/tagLcHFGDFwiLBIj
        ufYFwzzmrwkzoOSsPZVlJ2hLf632HxoWHp5JMZ6JceFSnQE=
X-Google-Smtp-Source: APBJJlElczFftKh6ikyLBRHp/Qg/OPqswfntYPJC8GHNS89lPZVYoVJcdAzMVFQkyiaZJfRJ+i2dqI4FlG9gSmKuHpo=
X-Received: by 2002:a50:fa8d:0:b0:522:38cb:d8cb with SMTP id
 w13-20020a50fa8d000000b0052238cbd8cbmr448735edr.20.1690825376246; Mon, 31 Jul
 2023 10:42:56 -0700 (PDT)
MIME-Version: 1.0
From:   Larry Stewart <wanslenowski@gmail.com>
Date:   Mon, 31 Jul 2023 13:42:45 -0400
Message-ID: <CAMtCRKLwmShiw8PcxD=g6mrPJznUYpPuRogh32oD-sOMmGzxpg@mail.gmail.com>
Subject: Unknown UVC Camera
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
     I have an unknown UVC Camera, Brand on the camera is "Ourlife".

When I plug in lsusb shows
Bus 003 Device 015: ID 1f3a:1002 Allwinner Technology mediacom XPRO 415
when i switch to PCCamera on device lsusb shows
Bus 003 Device 014: ID 1f3a:100e Allwinner Technology Android

when I plug in dmesg shows
[  142.809927] usb 3-5: new high-speed USB device number 8 using xhci_hcd
[  142.958438] usb 3-5: New USB device found, idVendor=1f3a,
idProduct=1002, bcdDevice= 2.33
[  142.958451] usb 3-5: New USB device strings: Mfr=2, Product=3, SerialNumber=4
[  142.958456] usb 3-5: Product: Android
[  142.958461] usb 3-5: Manufacturer: USB Developer
[  142.958465] usb 3-5: SerialNumber: 20080411
[  148.294287] usb 3-1: reset high-speed USB device number 2 using xhci_hcd
[  149.260771] usb-storage 3-5:1.0: USB Mass Storage device detected
[  149.260942] scsi host4: usb-storage 3-5:1.0
[  149.261019] usbcore: registered new interface driver usb-storage
[  149.262371] usbcore: registered new interface driver uas
[  150.292847] scsi 4:0:0:0: Direct-Access     USB 2.0  USB Flash
Driver 0100 PQ: 0 ANSI: 2
[  150.293426] sd 4:0:0:0: Attached scsi generic sg2 type 0
[  150.293772] sd 4:0:0:0: Power-on or device reset occurred
[  150.293983] sd 4:0:0:0: [sdb] Media removed, stopped polling
[  150.296022] sd 4:0:0:0: [sdb] Attached SCSI removable disk

when I click PCCamera on device dmesg shows

[  164.962071] usb 3-5: USB disconnect, device number 8
[  165.294356] usb 3-5: new high-speed USB device number 9 using xhci_hcd
[  165.442934] usb 3-5: New USB device found, idVendor=1f3a,
idProduct=100e, bcdDevice= 2.33
[  165.442946] usb 3-5: New USB device strings: Mfr=2, Product=3, SerialNumber=4
[  165.442952] usb 3-5: Product: Android
[  165.442956] usb 3-5: Manufacturer: USB Developer
[  165.442960] usb 3-5: SerialNumber: 20080411
[  165.444949] usb 3-5: Found UVC 1.00 device Android (1f3a:100e)
[  165.445107] usb 3-5: Failed to query (GET_INFO) UVC control 2 on
unit 2: -32 (exp. 1).
[  165.445288] usb 3-5: Failed to query (GET_INFO) UVC control 2 on
unit 1: -32 (exp. 1).
[  165.446367] input: Android: UVC Camera as
/devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5:1.0/input/input22
[  167.962413] usb 3-5: USB disconnect, device number 9
[  168.754380] usb 3-5: new high-speed USB device number 10 using xhci_hcd
[  168.908317] usb 3-5: New USB device found, idVendor=1f3a,
idProduct=1002, bcdDevice= 2.33
[  168.908329] usb 3-5: New USB device strings: Mfr=2, Product=3, SerialNumber=4
[  168.908335] usb 3-5: Product: Android
[  168.908339] usb 3-5: Manufacturer: USB Developer
[  168.908343] usb 3-5: SerialNumber: 20080411
[  168.910482] usb-storage 3-5:1.0: USB Mass Storage device detected
[  168.910727] scsi host4: usb-storage 3-5:1.0
[  169.938974] scsi 4:0:0:0: Direct-Access     USB 2.0  USB Flash
Driver 0100 PQ: 0 ANSI: 2
[  169.939421] sd 4:0:0:0: Attached scsi generic sg2 type 0
[  169.939717] sd 4:0:0:0: Power-on or device reset occurred
[  169.940008] sd 4:0:0:0: [sdb] Media removed, stopped polling
[  169.940685] sd 4:0:0:0: [sdb] Attached SCSI removable disk
