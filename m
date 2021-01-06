Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83E3B2EC05E
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 16:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbhAFP0k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 10:26:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbhAFP0k (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 10:26:40 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C9DC061357
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 07:26:00 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id x20so7268729lfe.12
        for <linux-media@vger.kernel.org>; Wed, 06 Jan 2021 07:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ginkgobioworks.com; s=ginkgo;
        h=mime-version:from:date:message-id:subject:to;
        bh=LzAKrtThwbvswnV4alSNSV75aEFwgdQlK8xiVCA7cO4=;
        b=EGWxlj66a9uCEjW2VCo9P4DGQGmeOZ2zJXvb+mXnLiYZiyvAWW32cK8EkHczzRQGjf
         EatcoznAPdGEuUp/D//QICGJSc54+U4nUrhIUPxvByuoSohaLw8hH8pxJcuhcx4lUhvc
         QKsBByNZPUoyb05hZN1cMPkZJt1TrrbYTTVBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=LzAKrtThwbvswnV4alSNSV75aEFwgdQlK8xiVCA7cO4=;
        b=tbL34Q1ZjOXqqsUINH1QR6OopCaxlRdT8M/l4w4zdFVyXzylS1hRY0Pt9GvvTNqXKP
         F0NegXGMCctT6JfIZ8383n7ysl6iO2bJq/EXCrUlncKUxB4ATkkeNBFSetvH4NrZdnXV
         9HDzbRAeiu5vP4Vx5cwOmSk3hYqHGGEMck/TSTuJLr8ePj4pcbTBP4yV0q/BIQ6vR39W
         cexiTmGKTUcIMTPnK3ZynsWPY2QK/vkTUQ4B9ZLL6dW6CXxgp9Qo13LgVaYoMrc7BJr5
         YsH5YNL2u4no8ng+9IJ+ZoVPeTnvemdRs0z59sUMFlr8bj2ZQLUkEZebnyUPC9ndl3zK
         dJ0w==
X-Gm-Message-State: AOAM530/sX1FqMtIIN3VSTM0FLCHFVa6tL+7vd3/rAPBVFSJVOEmZtYL
        9ENAcubKCA7YZyE4XlZxb8zkhby37e9DoHNcVBcKJYT7I9c=
X-Google-Smtp-Source: ABdhPJy0D+9gvSP5Q46QApD/iRcoITQTxPgA1PT0AaoTy4DObet3oP25yZjkcFVWNgZlSXUu52SIHLuyIhXdNTwagO8=
X-Received: by 2002:ac2:4d44:: with SMTP id 4mr2036810lfp.627.1609946758270;
 Wed, 06 Jan 2021 07:25:58 -0800 (PST)
MIME-Version: 1.0
From:   Matthew Chapman <mchapman@ginkgobioworks.com>
Date:   Wed, 6 Jan 2021 10:25:46 -0500
Message-ID: <CAJYzkmQ6CndAs_ke9GkU++rYZO9WNhyM3pfZj_iEML1X5Gv6SQ@mail.gmail.com>
Subject: new uvcvideo camera Coleman branded
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello, I've got a unlisted camera here:
  Vendor: Coleman (yes, the camping people) branded,
  model: CX14WP
  usb vid,pid says:  uvcvideo: Found UVC 1.00 device Android (1f3a:100e)

It is detected by the uvcvideo module, but it doesn't seem to work.
I'm on debian buster, 4.19 kernel, the uvcvideo module reports SW
version 1.1.1

Kernel report below. I'm happy to help in debugging if necessary. I
would just need a pointer in the right direction.

  [ 8993.857089] usb 2-4: new high-speed USB device number 3 using xhci_hcd
  [ 8994.008204] usb 2-4: New USB device found, idVendor=1f3a,
idProduct=100e, bcdDevice= 2.33
  [ 8994.008207] usb 2-4: New USB device strings: Mfr=2, Product=3,
SerialNumber=4
  [ 8994.008208] usb 2-4: Product: Android
  [ 8994.008209] usb 2-4: Manufacturer: USB Developer
  [ 8994.008210] usb 2-4: SerialNumber: 20080411
  [ 8994.030083] uvcvideo: Found UVC 1.00 device Android (1f3a:100e)
  [ 8994.030084] uvcvideo: Forcing device quirks to 0x80 by module
parameter for testing purpose.
  [ 8994.030084] uvcvideo: Please report required quirks to the
linux-uvc-devel mailing list.
  [ 8994.545135] uvcvideo: Failed to query (GET_INFO) UVC control 2 on
unit 1: -110 (exp. 1).
  [ 8994.545341] uvcvideo: Failed to query (GET_INFO) UVC control 2 on
unit 2: -32 (exp. 1).
  [ 8994.547179] uvcvideo 2-4:1.0: Entity type for entity Processing 2
was not initialized!
  [ 8994.547181] uvcvideo 2-4:1.0: Entity type for entity Camera 1 was
not initialized!
  [ 8994.547243] input: Android: UVC Camera as
/devices/pci0000:00/0000:00:01.2/0000:01:00.0/0000:02:08.0/0000:06:00.1/usb2/2-4/2-4:1.0/input/input20
  [ 8995.089150] uvcvideo: Failed to query (GET_DEF) UVC control 2 on
unit 2: -110 (exp. 2).
  [ 8995.601140] uvcvideo: Failed to query (GET_DEF) UVC control 2 on
unit 2: -110 (exp. 2).
  [ 8996.113144] uvcvideo: Failed to query (GET_DEF) UVC control 2 on
unit 2: -110 (exp. 2).
  [ 8996.625166] uvcvideo: Failed to query (GET_DEF) UVC control 2 on
unit 2: -110 (exp. 2).
  [ 8997.137149] uvcvideo: Failed to query (GET_DEF) UVC control 2 on
unit 2: -110 (exp. 2).
  [ 8997.649152] uvcvideo: Failed to query (GET_DEF) UVC control 2 on
unit 2: -110 (exp. 2).
  [ 8998.161174] uvcvideo: Failed to query (GET_DEF) UVC control 2 on
unit 2: -110 (exp. 2).
  [ 8998.673175] uvcvideo: Failed to query (GET_DEF) UVC control 2 on
unit 2: -110 (exp. 2).
  [ 9001.497160] usb 2-4: USB disconnect, device number 3
  [ 9002.013124] usb 2-4: new high-speed USB device number 4 using xhci_hcd
  [ 9002.163630] usb 2-4: New USB device found, idVendor=1f3a,
idProduct=1002, bcdDevice= 2.33
  [ 9002.163633] usb 2-4: New USB device strings: Mfr=2, Product=3,
SerialNumber=4
  [ 9002.163634] usb 2-4: Product: Android
  [ 9002.163635] usb 2-4: Manufacturer: USB Developer
  [ 9002.163636] usb 2-4: SerialNumber: 20080411
  [ 9002.164525] usb-storage 2-4:1.0: USB Mass Storage device detected

... it then goes on to attach as a mass-storage device.
