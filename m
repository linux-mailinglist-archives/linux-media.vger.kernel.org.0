Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94239560BF3
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 23:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbiF2Vty (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 17:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbiF2Vtx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 17:49:53 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE767DF3
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 14:49:52 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id w83so23484695oiw.1
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 14:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fi-uba-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=gvxGfzXvIEpT+Qlne4HBVykXhgHAAdCiVA/2CCgvaUw=;
        b=kzQXU2dJor252JJAFcaAt6Rp6z8woVwC+XlWIclZraEKjuZFQ3yiVxissCZWhFEkG/
         Zw7y3lOwiMlAL/FIi2MihDBWq8WW2SK3pQNMaisdZNDkQ68tzQ+MMl0USv1jBHn+qvkE
         w6Uxf+1q/n6oSYHXKF3DZGzcgW2/iS1BgZ6MAEn9NMF0SaKsusWWr4W19o387hxElnwg
         p41Cu5m1MU5cWZG3r8x+ntqRtH88GCq1JmSPhPi9IFg+4AvcQmEvDhCYltRp484560iQ
         LBD2BE6vpwigEx8hosvr9RzYGT0M86nZWjmX0AJE2teY9YgYt7R5MqnZiGc31ApC3gtO
         fi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=gvxGfzXvIEpT+Qlne4HBVykXhgHAAdCiVA/2CCgvaUw=;
        b=kJa0x7El6IhjV7BaNj7Rz1A7EUwk8miWs2drlUL6g4mU19fToznk7C8JEgoat3s9EO
         2mlwY+vWnbSiSu2R2Mq6tIrYNPlTOIBH68S3xZw/Jda6u7U/WJPq5RWw9/GkeO1iU8Nf
         TXe2V9L4Pgnj98hChsz8zgMknjL+wmqUxr70Y6NnjfO7qjszqxqEqKBok6TtZ8vBl8v5
         nNOpVqecKTlckg+QhUJ129kYNjicCkZUo3n+eywwZkL5dh90TqnsfzQhnQaogZBn4PN/
         CSHg9uXmyFVK564n0OxSvOdktpaFjdHkqgkQgmyKNdp61jiC0cxTfUyvbmFnCtebQi8N
         YZ2A==
X-Gm-Message-State: AJIora/UnfHJ9NRcR+ZkAUANszcb3noLgflnuDtYuRAITr6Gn4Zxn1Vk
        mDGWtc8ohKo9ChkBEDtghRvzZp4/Sf6gFLtT
X-Google-Smtp-Source: AGRyM1uUx+sltPSW197VribFoTckD8IGgpXtxi+sgWIrDDpWjipmv3rugy6CHjoriEn/sZGhjDn3lg==
X-Received: by 2002:aca:618b:0:b0:32f:3e2c:60d1 with SMTP id v133-20020aca618b000000b0032f3e2c60d1mr3366067oib.123.1656539391397;
        Wed, 29 Jun 2022 14:49:51 -0700 (PDT)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com. [209.85.160.46])
        by smtp.gmail.com with ESMTPSA id a26-20020a9d725a000000b00616d713c062sm4843413otk.28.2022.06.29.14.49.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 14:49:50 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-f2a4c51c45so23241190fac.9
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 14:49:50 -0700 (PDT)
X-Received: by 2002:a05:6870:1485:b0:f3:bd4:aab0 with SMTP id
 k5-20020a056870148500b000f30bd4aab0mr3380440oab.229.1656539390020; Wed, 29
 Jun 2022 14:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <CALFMp8vtr3jjGApAoehc4vuS9mNprtGqrRd2+tSfCHbTTKj4og@mail.gmail.com>
In-Reply-To: <CALFMp8vtr3jjGApAoehc4vuS9mNprtGqrRd2+tSfCHbTTKj4og@mail.gmail.com>
From:   Juan Antonio Zuloaga Mellino <jzuloaga@fi.uba.ar>
Date:   Wed, 29 Jun 2022 18:49:38 -0300
X-Gmail-Original-Message-ID: <CALFMp8sXqJLw3MUvvAKztKWU_HyrSNEkDE0TA-UDDwVuwGF9AQ@mail.gmail.com>
Message-ID: <CALFMp8sXqJLw3MUvvAKztKWU_HyrSNEkDE0TA-UDDwVuwGF9AQ@mail.gmail.com>
Subject: Fwd: Help supporting IT9910 chipset
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi. I've an ezcap295hd. It's an usb video grabber based on the IT9910
chipset manufactured by ITE Tech. Inc.

I wasn't able to find linux support for it. Is anybody working on it?

The chipset and device vendors were not helpful providing usb specs.
But I attempted to reverse the usb communication on windows and it
doesn't seem too complex.

It has 3 endpoints, I inferred that it works as follows:

ENDPOINT 1 Bulk OUT: Control Output
ENDPOINT 2 Bulk IN: Control Input
ENDPOINT 3 Bulk OUT: MPEG-TS Stream

So far I was able to extract and play the video stream from a pcapng.

I've some experience writing USB user space applications, but no
experience writing kernel modules nor with the video4linux api.

If nobody is working on this chipset I'd like to attempt to write a
driver for it.

Also, does anybody know of a module for a device similar to this one
that I could base my driver on? It would be of great help.

I'll leave lsusb output and attach a pcapng in case anybody wants to
check it out.

Regards.

Juan Zuloaga

/**********************************/
pcapng:  https://drive.google.com/file/d/1SCSLbJPqrUZKC7QXBO_En-p6JBcy_nTG/view?usp=sharing
/*********************************/

Bus 003 Device 026: ID 048d:9910 Integrated Technology Express, Inc.
IT9910 chipset based grabber
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x048d Integrated Technology Express, Inc.
  idProduct          0x9910 IT9910 chipset based grabber
  bcdDevice            1.00
  iManufacturer           1 ITE TECH. INC.
  iProduct                2 ezcap HD Capture
  iSerial                 3
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0027
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0000
  (Bus Powered)
