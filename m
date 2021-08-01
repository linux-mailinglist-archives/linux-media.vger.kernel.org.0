Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B36A3DCA7A
	for <lists+linux-media@lfdr.de>; Sun,  1 Aug 2021 09:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbhHAHIg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Aug 2021 03:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbhHAHIf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Aug 2021 03:08:35 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D46C06175F
        for <linux-media@vger.kernel.org>; Sun,  1 Aug 2021 00:08:27 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id i10so16108750pla.3
        for <linux-media@vger.kernel.org>; Sun, 01 Aug 2021 00:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=3vGAG3kLbSzTM0p/uAMHzKvsD1C7/KevxVEIvUMPMbk=;
        b=NNVKQUhTvyxNGgpMrzfUMQfnoffZF/wHMMDDYFm/I6b70fg8ohLVS/mtTE0u7oNW6C
         7K/y+OxUvnnPL0JOd/EOzQBli2rumrgXZjfpOG70rG/E3mlJS2/fHvVOWkyv6psGuySF
         ruzcc3/RY9GAn6cfhLTA3uWxAEp2ChEW/1JHPnafQiE/L4bJKx4QEGVTc5rjBP2TBH8t
         aRQQmdr41SlB6IE/PrmrNIRkW5pJYKUxWgvkkNI96d5N3Tc9+vr+wT8QjodL6U9tvf8z
         C7P+fS54xp02YWPMll4VOrUG1EzCBSZZtg4iwpRA/N3Pat7zeu6qPfDBOzIesAtROOUZ
         NebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=3vGAG3kLbSzTM0p/uAMHzKvsD1C7/KevxVEIvUMPMbk=;
        b=LWvNDmGiah/hzv93bI+YVrloRtD8ygv+N8VZSlpLPSwqe77sUWIVpqhLkjy9C5kdAQ
         DZvGYHA2CyK66EYpuIXDjIKk0yp+XOFjWaQhzP//IUakkArylYyGxEKgeJYNucr4q1+m
         9r6Ugi/fXQyrnTefwctaNIT8p7gbiqHA/mDF28axeuIhu9TIrHpdac8h8JmK6gv7AkDP
         u1qps6anW3Wo8QvEnV3VP75lz/3cCuNM4ODQoZp0/qlHt7VJpTx3KL79gnCoEipT3T6Z
         sP4Nm6ZSB5gAwfh9z+k9puDxBH1pBRdr2pAB2STrcrpFLLfr/tdeHgCiea/OgIwO0Y9h
         Mk4A==
X-Gm-Message-State: AOAM5317wRkjI8iEPNoNtt2pW+/O1hIHdVV/PYZAAJiXrEYLIK/zVNWZ
        AdXjG5chlrehvpwImozcLOGcpz1U07Go7MP7pFo=
X-Google-Smtp-Source: ABdhPJwSe+24MhdCN+jTNQgH2Jn7RI1tid/bfo6AlHYDz95IBfEkobpzRhJtc1+7qbBFkUOV2BwYrMRYw2LXpS1F8Zo=
X-Received: by 2002:a17:90a:708c:: with SMTP id g12mr11834780pjk.13.1627801706782;
 Sun, 01 Aug 2021 00:08:26 -0700 (PDT)
MIME-Version: 1.0
From:   nil Yi <teroincn@gmail.com>
Date:   Sun, 1 Aug 2021 15:08:16 +0800
Message-ID: <CANTwqXCapbBTXEx1ow9QBw_h0mqCq_myRvmTN=2KpsEEBBJFKg@mail.gmail.com>
Subject: [BUG]: drivers: media: dvb-frontends: rtl2832_sdr.c: a dangling
 pointer may cause double free
To:     crope@iki.fi, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
I found there is a dangling pointer in  rtl2832_sdr_alloc_urbs which
may cause double free in v5.14-rc3

in rtl2832_sdr_alloc_urbs:

379: for (j = 0; j < i; j++)
380:    usb_free_urb(dev->urb_list[j]);
it frees all the urbs but forgets to set the dev->urbs_initialized to
zero, which will be used in function  rtl2832_sdr_free_urbs:

357: for (i = dev->urbs_initialized - 1; i >= 0; i--) {
358:     if (dev->urb_list[i]) {
359:          dev_dbg(&pdev->dev, "free urb=%d\n", i);
360:                /* free the URBs */
361:              usb_free_urb(dev->urb_list[i]);
362: }
363: }
364:    dev->urbs_initialized = 0;


I'm not sure whether this double free would be triggered or not,
similar issue happened in commit b7f870510384 <media: tm6000: double
free if usb disconnect while streaming>

Any feedback would be appreciated, thanks :)


Best wishes,
Lin Yi
