Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E31D430AA9
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344189AbhJQQ0a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238276AbhJQQ03 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:26:29 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3069EC06161C;
        Sun, 17 Oct 2021 09:24:20 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id y7so12826507pfg.8;
        Sun, 17 Oct 2021 09:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=erv7X8fHupjLDtNjEQfgytidk5c7eiZziW1iku1D0Nw=;
        b=dQw69VLIInKb0gwFYsDBmKAVyRgFXju6DntOOVJSBJfuREFbA/P1NeAyODFvXQkiS8
         EQ8Tw0B4PCTgncR6Z6pnTXuW60DaD0m+W79ArXFB2FYZQNxGH68luu5ELcGJUN0Ixyb/
         O/90aGdkNYWW80wVKjmKm81jrcyq/0RRgRUX/9BoNBWN17wEhEkhVG8TNiJRewfzeLh/
         MZcx5cXbQaqwvOg8+R/hlfq0O22KDyVqzyKSVAYOtELW64x6d4dVu1yretKpow0ub8mN
         Sv8IMUwmoy/8APZ59k1GImD/tkXLnUUaZqCio+yBqOTZJSjns066YBBvJ1Ta/LSsvtwf
         Xlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=erv7X8fHupjLDtNjEQfgytidk5c7eiZziW1iku1D0Nw=;
        b=Uw4ZEGmj34pTA0yf7HSBn7yfu5FV3adD5QZk1DfPvLhoZSK+7E7176/fKkyxVIwvK2
         Gq9+Sr8ju/6ABq6Exlw0wLBtsradBs9BzhAia/fyawyLZRzpzuHe2b83C8mntBpWxnV7
         OsiQcyBTPMT/cpFDqhnZluDzAv+wnoRgJv5HgoY+DISBzrX7g6Is9ya4vjgYXyhBem9/
         juXoEbWnSSXhhtIen8daV2rMV/1lm4R2JjGf7FF/H3XxKZVJG390tk9J54bn+pK6d+P/
         q6uw7jItJ71WNzo5T1w5wB4dy7CL/yM3AlucZ98IpSduxwP9ScgD610R0ck7T+OedOtd
         FScg==
X-Gm-Message-State: AOAM530Ir3hgS2Zvgtc4fGA8iKaPzNgqiT2LoWWYb9muG3WXx7S7EpsB
        N6DGe4fjVbkO3nukWmgGA8E=
X-Google-Smtp-Source: ABdhPJxeStzq5jTrKMsEPqpzBcOcXWQhz753i9Sj0JBQY1qBO4HUFeNRgzvfEfW79zi6nvyX8iBpmQ==
X-Received: by 2002:a62:7850:0:b0:44c:5b71:2506 with SMTP id t77-20020a627850000000b0044c5b712506mr23830036pfc.37.1634487859697;
        Sun, 17 Oct 2021 09:24:19 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id f30sm10814332pfq.142.2021.10.17.09.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:24:19 -0700 (PDT)
From:   Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [BUG 0/5] bug reports for atomisp to make it work
Date:   Mon, 18 Oct 2021 01:23:31 +0900
Message-Id: <20211017162337.44860-1-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

These mails contain RFC patches, which are almost bug report and some
are just bug report, for atomisp to work (again). Tested on Microsoft
Surface 3 (Windows) and Xiaomi Mi Pad 2 (Android model) with v5.15-rc5.
Both are Cherry Trail (ISP2401) devices.

I'm still not used to Linux patch sending flow. Sorry in advance
if there is some weirdness :-) but I did my best.

To try to take a picture, take a look at the series I sent earlier named
("various fixes for atomisp to make it work")

The 1st patch is required to take a picture with atomsip (again):

    [BUG][RFC] media: atomisp: pci: assume run_mode is PREVIEW

The 2nd patch is to avoid kernel warning message:

    [BUG][RFC] media: atomisp: pci: remove dummy_ptr NULL check to avoid
      duplicate active_bo

The 3rd patch is to avoid kernel oops, which is almost required for
using atomisp normally:

    [BUG][RFC] media: atomisp: pci: add NULL check for asd obtained from
      atomisp_video_pipe

The 4th-5th mail is bug reports, no patches for these issues yet:

    [BUG] media: atomisp: `modprobe -r` not working well (dup video4linux,
      ATOMISP_SUBDEV_{0,1})
    [BUG] media: atomisp: atomisp causes touchscreen to stop working on
      Microsoft Surface 3

I added further descriptions at the top of each RFC/BUG mails.

Regards,
Tsuchiya Yuto

Tsuchiya Yuto (5):
  [BUG][RFC] media: atomisp: pci: assume run_mode is PREVIEW
  [BUG][RFC] media: atomisp: pci: remove dummy_ptr NULL check to avoid
    duplicate active_bo
  [BUG][RFC] media: atomisp: pci: add NULL check for asd obtained from
    atomisp_video_pipe
  [BUG] media: atomisp: `modprobe -r` not working well (dup video4linux,
    ATOMISP_SUBDEV_{0,1})
  [BUG] media: atomisp: atomisp causes touchscreen to stop working on
    Microsoft Surface 3

 .../staging/media/atomisp/pci/atomisp_cmd.c   | 73 ++++++++++++++
 .../staging/media/atomisp/pci/atomisp_fops.c  |  6 ++
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 96 ++++++++++++++++++-
 drivers/staging/media/atomisp/pci/hmm/hmm.c   |  4 -
 4 files changed, 174 insertions(+), 5 deletions(-)

-- 
2.33.1

