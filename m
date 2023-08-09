Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05A94775EAE
	for <lists+linux-media@lfdr.de>; Wed,  9 Aug 2023 14:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbjHIMSy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Aug 2023 08:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjHIMSy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Aug 2023 08:18:54 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CCB61BF0
        for <linux-media@vger.kernel.org>; Wed,  9 Aug 2023 05:18:52 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-76c8dd2ce79so620533785a.1
        for <linux-media@vger.kernel.org>; Wed, 09 Aug 2023 05:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691583531; x=1692188331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CGkTKfm+Uq4LLX887DXfqTuYIIcyhKeb0nnxvNyvAtM=;
        b=BNULxWjVFdDuFnoeDKobWAsW5K56zTyF+W0c63P0QNkAkeB4IGILrZE1i5eifwgS8W
         YjFcx+Pd1AlcWI91kpcfNJT136uNsil/k4WNpTNAz2fuVh4YvRiPnV2gqGFm8M4i4naI
         gIzsgB2HZ/LuzfRQEZSpmxIucq6q7O9PQ4weU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691583531; x=1692188331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGkTKfm+Uq4LLX887DXfqTuYIIcyhKeb0nnxvNyvAtM=;
        b=elWedUhI4AqJi1Q/WMO4LoFyjqMpggrQ7RiBH21LSmBSUQsq9oxuj748Z6CgT3ZkKW
         en4MEtx8XLvUPliL2jcAxN4+DJpOZ0AluTDBhmQOa+4GZxK+PEN2ycTaq3GKGq1Z7KZf
         2dlaOAxbAFV3z6eZ1PZ3AWib8c9c2mOgqtN7XQ62MOorBDixtzkUwZPnymHVfVBM8EnY
         3a3Yz4PSrEGFKEF0gtlcJToHt+qeZ7sh8rQ2zt/lft+hWRY39d2ZVUSHFbvkU9t9KdnN
         I/wJL2LfZyNISMNlpuogChH1aqc7ooKgPXb6zlDsa24Dt0gYRUCLZ5e3GWbzwEvoPrCN
         oA2g==
X-Gm-Message-State: AOJu0YzHuN2XXqbsa7/n4JdPHIJDAFprGxda0jvIi0zimB+kosaRuh6o
        x9jygaDOafV56spyNebJEBO3rXnaH1jr7QeumOvy/w==
X-Google-Smtp-Source: AGHT+IFvxdve/YkNQcjJk3V5MkHkcaQo86TobG22bREO6rAt9O3VmK1uv2x9dUUOcTzaMMi4YB+3MA==
X-Received: by 2002:a05:620a:44c6:b0:76c:d5e0:f93c with SMTP id y6-20020a05620a44c600b0076cd5e0f93cmr3575948qkp.56.1691583530912;
        Wed, 09 Aug 2023 05:18:50 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id d26-20020a05620a167a00b00767d00d10e9sm3910329qko.58.2023.08.09.05.18.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 05:18:50 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-63c70dc7ed2so45309386d6.0
        for <linux-media@vger.kernel.org>; Wed, 09 Aug 2023 05:18:49 -0700 (PDT)
X-Received: by 2002:a05:6214:2302:b0:62f:d00c:7f41 with SMTP id
 gc2-20020a056214230200b0062fd00c7f41mr2960303qvb.26.1691583529618; Wed, 09
 Aug 2023 05:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAMtCRKLwmShiw8PcxD=g6mrPJznUYpPuRogh32oD-sOMmGzxpg@mail.gmail.com>
In-Reply-To: <CAMtCRKLwmShiw8PcxD=g6mrPJznUYpPuRogh32oD-sOMmGzxpg@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 9 Aug 2023 14:18:38 +0200
X-Gmail-Original-Message-ID: <CANiDSCskuAmnks2QWMfMDBH6ba9vW0LGaWX262TNF+3uR2v0rg@mail.gmail.com>
Message-ID: <CANiDSCskuAmnks2QWMfMDBH6ba9vW0LGaWX262TNF+3uR2v0rg@mail.gmail.com>
Subject: Re: Unknown UVC Camera
To:     Larry Stewart <wanslenowski@gmail.com>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI Larry

Looks like your device needs to modeswitch. You probably want to ask
at this forum:
https://www.draisberghof.de/usb_modeswitch/bb/

Regards!

On Mon, 31 Jul 2023 at 20:24, Larry Stewart <wanslenowski@gmail.com> wrote:
>
> Hello,
>      I have an unknown UVC Camera, Brand on the camera is "Ourlife".
>
> When I plug in lsusb shows
> Bus 003 Device 015: ID 1f3a:1002 Allwinner Technology mediacom XPRO 415
> when i switch to PCCamera on device lsusb shows
> Bus 003 Device 014: ID 1f3a:100e Allwinner Technology Android
>
> when I plug in dmesg shows
> [  142.809927] usb 3-5: new high-speed USB device number 8 using xhci_hcd
> [  142.958438] usb 3-5: New USB device found, idVendor=1f3a,
> idProduct=1002, bcdDevice= 2.33
> [  142.958451] usb 3-5: New USB device strings: Mfr=2, Product=3, SerialNumber=4
> [  142.958456] usb 3-5: Product: Android
> [  142.958461] usb 3-5: Manufacturer: USB Developer
> [  142.958465] usb 3-5: SerialNumber: 20080411
> [  148.294287] usb 3-1: reset high-speed USB device number 2 using xhci_hcd
> [  149.260771] usb-storage 3-5:1.0: USB Mass Storage device detected
> [  149.260942] scsi host4: usb-storage 3-5:1.0
> [  149.261019] usbcore: registered new interface driver usb-storage
> [  149.262371] usbcore: registered new interface driver uas
> [  150.292847] scsi 4:0:0:0: Direct-Access     USB 2.0  USB Flash
> Driver 0100 PQ: 0 ANSI: 2
> [  150.293426] sd 4:0:0:0: Attached scsi generic sg2 type 0
> [  150.293772] sd 4:0:0:0: Power-on or device reset occurred
> [  150.293983] sd 4:0:0:0: [sdb] Media removed, stopped polling
> [  150.296022] sd 4:0:0:0: [sdb] Attached SCSI removable disk
>
> when I click PCCamera on device dmesg shows
>
> [  164.962071] usb 3-5: USB disconnect, device number 8
> [  165.294356] usb 3-5: new high-speed USB device number 9 using xhci_hcd
> [  165.442934] usb 3-5: New USB device found, idVendor=1f3a,
> idProduct=100e, bcdDevice= 2.33
> [  165.442946] usb 3-5: New USB device strings: Mfr=2, Product=3, SerialNumber=4
> [  165.442952] usb 3-5: Product: Android
> [  165.442956] usb 3-5: Manufacturer: USB Developer
> [  165.442960] usb 3-5: SerialNumber: 20080411
> [  165.444949] usb 3-5: Found UVC 1.00 device Android (1f3a:100e)
> [  165.445107] usb 3-5: Failed to query (GET_INFO) UVC control 2 on
> unit 2: -32 (exp. 1).
> [  165.445288] usb 3-5: Failed to query (GET_INFO) UVC control 2 on
> unit 1: -32 (exp. 1).
> [  165.446367] input: Android: UVC Camera as
> /devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5:1.0/input/input22
> [  167.962413] usb 3-5: USB disconnect, device number 9
> [  168.754380] usb 3-5: new high-speed USB device number 10 using xhci_hcd
> [  168.908317] usb 3-5: New USB device found, idVendor=1f3a,
> idProduct=1002, bcdDevice= 2.33
> [  168.908329] usb 3-5: New USB device strings: Mfr=2, Product=3, SerialNumber=4
> [  168.908335] usb 3-5: Product: Android
> [  168.908339] usb 3-5: Manufacturer: USB Developer
> [  168.908343] usb 3-5: SerialNumber: 20080411
> [  168.910482] usb-storage 3-5:1.0: USB Mass Storage device detected
> [  168.910727] scsi host4: usb-storage 3-5:1.0
> [  169.938974] scsi 4:0:0:0: Direct-Access     USB 2.0  USB Flash
> Driver 0100 PQ: 0 ANSI: 2
> [  169.939421] sd 4:0:0:0: Attached scsi generic sg2 type 0
> [  169.939717] sd 4:0:0:0: Power-on or device reset occurred
> [  169.940008] sd 4:0:0:0: [sdb] Media removed, stopped polling
> [  169.940685] sd 4:0:0:0: [sdb] Attached SCSI removable disk



-- 
Ricardo Ribalda
