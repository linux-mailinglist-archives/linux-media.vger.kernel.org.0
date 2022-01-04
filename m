Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B861484167
	for <lists+linux-media@lfdr.de>; Tue,  4 Jan 2022 13:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbiADMBd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jan 2022 07:01:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiADMBb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jan 2022 07:01:31 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F057C061761
        for <linux-media@vger.kernel.org>; Tue,  4 Jan 2022 04:01:31 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id j83so88729269ybg.2
        for <linux-media@vger.kernel.org>; Tue, 04 Jan 2022 04:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=XK475c3Kog66bgLVsQ2DOT53h3U+7E2ZlMjED6i84X4=;
        b=JZpc4uyKozZ+zDtLuvLFdLHD1jhZ8gxxZvvPwE86Sui+aSyG8aEe75eg0Cu+u3OICB
         fPTdgFSpB4DZ71r0C18Ob0if2KCf74mq6T+LlJOfenjxsS8XoYHh8/q1SpMRU+yZMj9T
         +1QacMat3lEeLpcXi0MzW8JGcl+IHGQ5spimUFQHfy2fgNodCXmY0qY0nZojG5zLT6I5
         nkr627qPDg4L7PCHwmCwKT8y+ZAveSbG9GN3OEvku4ENzxSfYfTYgqPwt4nI1DusK8RG
         9Cyv4j2hEqcA3pZICaLIIMGHRmLDgK4eFUd10KrAUZXT983qKrFdp+7FmntwZuwT8Y3T
         +J2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=XK475c3Kog66bgLVsQ2DOT53h3U+7E2ZlMjED6i84X4=;
        b=pae2y0NQflUundScjG5baX/Mpmg9bleFjPMMEFxRP2Jgd6QdIBDpA1k4zxwZZc4Pa1
         FY23X9GiuUvrKypsUc08RLeH+sERB9cK2P9tIQ5ezQwzGtx1OuH5ZcYwtzrIBU8bW10Z
         Oe/Gg53pQ9MfjrGZpBz8pv5a7uJYY3IFIyBAw4nMRVYJ7M1uq3z3E+I8qEqlsKyvXqe2
         1t1RbsofmewO9YzU8pzV2PNwE+l7zcSvomK3K8oCVHS6V5S7iAMR4UsEK3EKLMRgcYMC
         VeavnHR6jpynkSlabhIvDDNzIvGU/5Me3xnkh4GIj/KR8vqeiea0qq7Xu7mFgEAVQVst
         6oVg==
X-Gm-Message-State: AOAM530TswWosaoLl6EWXC2HigjFR2JCHnJjVYw0icJchvcSpC5nnyF0
        ObCnFhHIbj04ZPpq01Ppo1wb618nD2jrlwvV/PIaH9QGFekjUg==
X-Google-Smtp-Source: ABdhPJwBhVQQ39hwVFRKCjI6zQc3/Oq0eWdqRntT1HiaWjK4ksttVbJn8OnoHYBSnq0xmX+gUFGuMVKohPcFW7LrZ9w=
X-Received: by 2002:a25:c841:: with SMTP id y62mr12270623ybf.196.1641297690316;
 Tue, 04 Jan 2022 04:01:30 -0800 (PST)
MIME-Version: 1.0
From:   Vedant Paranjape <vedantparanjape160201@gmail.com>
Date:   Tue, 4 Jan 2022 17:31:19 +0530
Message-ID: <CACGrz-PxtZOn27MzzMtxTdfVird6Ccax2SR6+yqoRB2ufJ0LFQ@mail.gmail.com>
Subject: v4l2-ctl --stream-out-dmabuf example not working
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
I am using the master version of v4l2-utils, found the example to
Stream video from a capture video device (/dev/video1) to an output
video device (/dev/video2) here:
https://manpages.debian.org/unstable/v4l-utils/v4l2-ctl.1.en.html

Here are the steps I have followed.
1) sudo modprobe vivid
2) v4l2-ctl -d0 --stream-mmap --out-device /dev/video3 --stream-out-dmabuf

Here's the output v4l2-ctl --list-devices
<snip>
vivid (platform:vivid-000):
        /dev/video2
        /dev/video3
        /dev/radio0
        /dev/radio1
        /dev/vbi0
        /dev/vbi1
        /dev/swradio0
        /dev/media1

HD WebCam: HD WebCam (usb-0000:00:14.0-7):
        /dev/video0
        /dev/video1
        /dev/media0
</snip>

Error out on running the program:
<snip>
                VIDIOC_G_FMT returned -1 (Invalid argument)
<VIDIOC_QBUF: failed: Invalid argument
handle out -1
handle out2in -1

</snip>

> https://git.linuxtv.org/v4l-utils.git/tree/utils/v4l2-ctl/v4l2-ctl-streaming.cpp#n2669
While I was able to solve the VIDIOC_G_FMT returned -1 (Invalid
argument) by  changing the "fd.g_fmt" to "out_fd.g_fmt"

Regards,
Vedant
