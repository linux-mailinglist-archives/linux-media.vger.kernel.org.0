Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 113713C66D8
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 01:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbhGLXT4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 19:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhGLXT4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 19:19:56 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659E1C0613DD
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 16:17:07 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id r132so31729294yba.5
        for <linux-media@vger.kernel.org>; Mon, 12 Jul 2021 16:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=qlUNdOXRp8Ky7BYdmnBHfx/7UGdGJPCyQ1Pu4Cj5CWU=;
        b=memRPcJeVkjrKt3D5TolaUyga6ReIRbkRtBbUUihuQKXiularfrRUfi6wBB3JWorKp
         4Nvq83HOO6sn8VqJBflMTnoC9BzOPxHi4vm+dK8C/nvv2/T4HL9c4m9q+N/bxYuFW/AG
         l0ustM40Fhho9sM2gd8U7KR0vLAfNnFkyEFw3s/gJcJGQJ4Rt0uBsqpwuxRHpmG9wvQ8
         7Xv1qv4syfvdWxLNyUw42tBv1VDm78Nb6R5aoce/fryenLzv81HAdEkK4BA5LT0lj9A4
         aOCicX9fEFeaS8T+fR6dWzHxmNluRNO9SVi0jL245CmD5/xVDcXRNvBF/Y7VaGICghWT
         x1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=qlUNdOXRp8Ky7BYdmnBHfx/7UGdGJPCyQ1Pu4Cj5CWU=;
        b=g+1fCQLoQnxLuqg/ivr6Bm3Ppv26cIY/0x2qEekZ5MRAlE/DP5WJ44iiowbWB+da8I
         Uv/zKOMtP6wjzzqVyxE04w1954qtp8+EH3XzsyM7m15QzrhBXDd2mlKFg+tYmvWmnySl
         1tiRyRsavctvq4sEQLW1ydPH2ZHV1LhaumdpihvH1IS3/9hNeK2qWrFxKFTqseiLu4R5
         K2kJPqpnC8eFtKlHMPssvLWL5f9JdXJh7cYkxvIzi6+MLrVPvxGEXKtNBdBmUhuIczy2
         mDxZ7Zk/4tedC6eu5PMwHDU7r+Lx70tl5c7wF6qd8Ame1o9PMoPzJgDF52/9TFYTjPkZ
         wCxQ==
X-Gm-Message-State: AOAM530jn7VO7sx9SP7AjlDsTsBoQ+Gi/m5RCwl3U0A3xanPlL0qlQZ5
        ag/5P8+CTRg2Z12aEzF4opvP1+8+excXR2DA+tRIqU+OaGnOOw==
X-Google-Smtp-Source: ABdhPJxX9796oozvGwBy6FXn9MlWiYkE4du51hwYzsO++UIjwHwF0F0/uWC68hbkmaMj2MjpeGQjLA28K23pL8vv+2U=
X-Received: by 2002:a25:ad65:: with SMTP id l37mr1866953ybe.298.1626131826427;
 Mon, 12 Jul 2021 16:17:06 -0700 (PDT)
MIME-Version: 1.0
From:   Steven Zakulec <spzakulec@gmail.com>
Date:   Mon, 12 Jul 2021 19:16:55 -0400
Message-ID: <CAOraNAaoHE9Xgfs0FNoMyKLP4Qd=FdsxaViJSkyuxf0j2rK5GA@mail.gmail.com>
Subject: How do you capture (raw) VBI on Linux?
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

HI, I am writing to the Linux-media mailing list in hopes that someone
can share how the /dev/vbi device can be captured from under Linux to
disk so it can be processed back into captions.

I've tried a long list of items (listed below), and the only success
I've had under Linux is using old Hauppauge PVR (150 & 250) PCI cards,
and extracting the embedded VBI data from those captures.

I can successfully display closed captions on my Hauppauge HVR-950q
USB device with "zvbi-ntsc-cc -d /dev/vbi0 -c" as long as I start a
capture first in one terminal, then run that command in a second
terminal, so I know that card works.

With my Hauppauge HVR-950q, I've tried the following items:
cat /dev/vbi (both before, during, and after a capture is started on the card

Trying to use ffmpeg to capture /dev/vbi - unclear if this is even
supposed to work, and if so, what the proper commands are

I've tried using zvbi to capture the captions- at best, I can get the
text dumped to a file, but no timestamps, or raw/sliced VBI that I
could convert using ccextractor into a subtitle file.
I had thought one of the commands below should work based on the
descriptions from --help.
zvbi-ntsc-cc -d /dev/vbi0 -r -C vbi.bin
zvbi-ntsc-cc -d /dev/vbi0 -r -R -C vbi.bin

I've tried some of the test tools in the zvbi source code test folder,
but it's not entirely clear if they work with NTSC closed captions.

I'm on Kubuntu 20.04 with kernel 5.4.0-77-generic.

If anyone knows an application/device combination (any Linux OS),
please let me know- this seems totally possible, I just can't figure
out how to make it happen.
Thank you in advance for any insights or guidance you can provide here.
