Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 092612797E9
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 10:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbgIZIXA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 04:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgIZIXA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 04:23:00 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 222F0C0613CE
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2020 01:23:00 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a22so4301918ljp.13
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2020 01:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=4Aqt4e1Ash+FISMrFbqexVvfkrdj0VgVC3AKeET4JHs=;
        b=p0fP8vOracuL5OeXwAy+rgY5Mdol42CUH30gqxiPx7w6q6xyDlDKrGLFcVeGShmnb3
         IGFMbRbiqjLlAFotoqrVCzAKcdzNQXdg1Lwr+u1mpONrzTCrqYCzTyj9fjafdUcAnNum
         lBErAkbaLL2sRGxikcUp0yD0T3YXmZtey7X8/wN/tuZKlrvFK3UMsPx35NtxbRbIuukb
         F/A3RPvqjXzEBHq3TXZ0dTfcp9LRBCWNSRQzlZg/UHGMvRFsMGdDIwqjzAqRKiCrrVit
         JUYJ/1A1IraFZRD3uAD+ZUZxa+4qQMVx/qX2j4K1qmUdX5YzWLUZS81Y4cxSRGIvCaNW
         Oarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=4Aqt4e1Ash+FISMrFbqexVvfkrdj0VgVC3AKeET4JHs=;
        b=gDH5iqqKTZpA27MlR8ahQM67n7FsrIP1vZFHrHaT3atO8y5mUL/DkURtDAB90+G/mV
         ruaH35fQP6+GFT7G/IpxX/yN0i8Via1KqjS5O1q2ZT/fB4HM3R9/KIZLm2xMsRQ0lY4K
         A+hULGB7AdTsVvSUjKoYjIBI8cRt1Bkk+pMQtFyCXIm5hmGp4SkpHBG0rmqSG6ySHFCM
         HwBOHRDNSrFTwOE54B+sKWlAsj42ULOba5vYzI52KjmnOvLRg1exrVViNzGyiSZ3Tus3
         ZzYnPiGGCAEb04ej6iq2FUCNeSIUHpdBE7SAJuEDU8DTG1YfDNCugTCNblMaA4DHgoW8
         O5fg==
X-Gm-Message-State: AOAM533T3xAPOC0yntNovem6WD6H910d1Ar4tlO1UMwMGIY7e0Uci1e6
        Dms+d1SF0JTZZlrMn93m4umA5kXDCt4+yys77Hc=
X-Google-Smtp-Source: ABdhPJxgtHLqM3GxzuQZ20nibpSVIIcXLFPBvQJLUGD8MZxQR8MgX691rGfnV2ycSPXoE/+UFZMTSLbtCWaMKhOQC/E=
X-Received: by 2002:a2e:8846:: with SMTP id z6mr2254889ljj.457.1601108577486;
 Sat, 26 Sep 2020 01:22:57 -0700 (PDT)
MIME-Version: 1.0
From:   Michael Zimmermann <sigmaepsilon92@gmail.com>
Date:   Sat, 26 Sep 2020 10:22:46 +0200
Message-ID: <CAN9vWDL5rK_UCi-dTUG_Si7MbVSB4hVjvhs1-TEgvdGi+ajUvQ@mail.gmail.com>
Subject: ITE8708 on ASUS PN50 uses a 16 byte io region
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

here's the resource descriptor from my DSDT:
Name (BUF0, ResourceTemplate ()
{
    IO (Decode16,
        0x0000,             // Range Minimum
        0x0000,             // Range Maximum
        0x01,               // Alignment
        0x10,               // Length
        _Y1A)
    IRQNoFlags (_Y1B)
        {}
    DMA (Compatibility, NotBusMaster, Transfer8, )
        {}
})

As you can see it uses 16 bytes for the IO region while the driver
drivers/media/rc/ite-cir.c expects 8.
I don't see any obvious reason why they do that since they only seem
to write two words in there, and if I edit the DSDT to change the
length from 0x10 to 0x8 the linux driver detects the device properly
it works just fine.

So is this a bug on ASUS' side or should we just accept longer regions
for the same device type?

Thanks
Michael
