Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4B95787CF
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 10:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbfG2Iyg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 04:54:36 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40613 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbfG2Iyg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 04:54:36 -0400
Received: by mail-lf1-f67.google.com with SMTP id b17so41504068lff.7
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2019 01:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=3AKaeYPpG4Jdj2uJ0zOwGBPVJEQq1UR02Z4tiIXe3tk=;
        b=l+tYB5kCgHGllsWdRlnwZkOmu7f0rplk5eOJXlY/KPasvAnKar5hccvflgzUItR8FT
         Ags9t946tz4p/8Hy8aIgx6ZxSGp2TkC3SMt7mIS6plW/Yl7MOAegeExQsfOoJRWjVRVc
         P+jWZ/piqqaajZR30w51jY/uaj+7geU9bRCN7i6vy0f3uoXtUeKcZ3+PAkt0WtA4EPdO
         CK2xk+WOEUTqgxnhnl0Q+95SikF7GChwTn7v7sYjfefsiu6fWXYblnffEjMBVWFK3WiQ
         KZpfOO3QUrRwo8PyuNx8tLdQ6+q84ibLXE9SwJ+sR6vFBDwITA+zNIoZTq80l43pYQZO
         6piQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=3AKaeYPpG4Jdj2uJ0zOwGBPVJEQq1UR02Z4tiIXe3tk=;
        b=gOy5DNIWrnlS4ohaH0bJyxx7lv+BVSHJtcV2EbJBRt4UHnSG+YnCEvJMl12OUMHh/f
         rYDqjkHFEoL2Otty3Ku/S2rNvmZB9QXso9yL6lUwZfgD478YtRYanw67rQO54oe3Q6CE
         P9Re2Cfdp3IZmhizojY95Shkflq38Hbah3KvIZlV+rVX7jGuIlrc37EmaafgZoiTljph
         3/R1ygsNs5DrXXcVI4AhS0eBjmGsan75dSM7Ewty3fXwAc0QuslvNOjEzMoKQqf2w5vn
         dGcfU0U6LzI9yBnkItw5R6hTUsiHdQK2crn9MkF5kkWJRmaZAcWE9OvA1IQfrlqfDSLE
         5nUA==
X-Gm-Message-State: APjAAAXjeZUuYesUBbuNzTzTafsSthdWvS2jrKbjO0835dhmgaOPm7Kw
        BAhNAcidIZYI32vjV59OP0XvBaSOw1eDl2exNSSh6g==
X-Google-Smtp-Source: APXvYqzN2WgCBz75JRZqxtyxnKBtGCQd56zO1/jN/xQ+VmHZg+VBIBHetW1zYazPKw4clqZUq5TMz8WKIFZuTUELZTU=
X-Received: by 2002:a19:c503:: with SMTP id w3mr45382483lfe.139.1564390474240;
 Mon, 29 Jul 2019 01:54:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac2:4186:0:0:0:0:0 with HTTP; Mon, 29 Jul 2019 01:54:33
 -0700 (PDT)
From:   Vincent McIntyre <vincent.mcintyre@gmail.com>
Date:   Mon, 29 Jul 2019 18:54:33 +1000
Message-ID: <CAEsFdVMFa3qY5TdUTPqQ4=_cCx6ePzMOw31FLC+erR7_39hgFw@mail.gmail.com>
Subject: build failures on ubuntu 16.04 (4.15.0.55.76)
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I am getting build failures in v4l2-fwnode.c. I'm sending this because
the daily build logs
are not showing any errors for this kernel (version below).

I've tried flushing the git checkout and rerunning but I still get the failures.
I can send a fuller log off-list if you like.

/home/me/git/clones/media_build/v4l/v4l2-fwnode.c: In function
'v4l2_fwnode_endpoint_parse_csi2_bus':
/home/me/git/clones/media_build/v4l/v4l2-fwnode.c:166:9: error:
implicit declaration of function 'fwnode_property_count_u32'
[-Werror=implicit-function-declaration]
  rval = fwnode_property_count_u32(fwnode, "data-lanes");
         ^
/home/me/git/clones/media_build/v4l/v4l2-fwnode.c: In function
'v4l2_fwnode_endpoint_alloc_parse':
/home/me/git/clones/media_build/v4l/v4l2-fwnode.c:527:9: error:
implicit declaration of function 'fwnode_property_count_u64'
[-Werror=implicit-function-declaration]
  rval = fwnode_property_count_u64(fwnode, "link-frequencies");
         ^
/home/me/git/clones/media_build/v4l/v4l2-fwnode.c: At top level:
cc1: warning: unrecognized command line option '-Wno-format-truncation'
cc1: some warnings being treated as errors
scripts/Makefile.build:339: recipe for target
'/home/me/git/clones/media_build/v4l/v4l2-fwnode.o' failed
make[3]: *** [/home/me/git/clones/media_build/v4l/v4l2-fwnode.o] Error 1
Makefile:1552: recipe for target
'_module_/home/me/git/clones/media_build/v4l' failed
make[2]: *** [_module_/home/me/git/clones/media_build/v4l] Error 2
make[2]: Leaving directory '/usr/src/linux-headers-4.15.0-47-generic'
Makefile:51: recipe for target 'default' failed
make[1]: *** [default] Error 2
make[1]: Leaving directory '/home/me/git/clones/media_build/v4l'
Makefile:26: recipe for target 'all' failed
make: *** [all] Error 2
build failed at ./build line 526

$ cat /proc/version_signature
Ubuntu 4.15.0-55.60~16.04.2-generic 4.15.18

Also seen on
Ubuntu 4.15.0-47.50~16.04.1-generic 4.15.18

$ git --no-pager log -1
commit 5158c420e7a0929fa58c56ac437e274e8b1c37d1
Author: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date:   Fri Jul 26 09:26:30 2019 +0200

    Remove const from fwnode_property_count_u32/u64

    Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>


$ cd media;  git --no-pager log -1
commit d2b4387f3bdf016e266d23cf657465f557721488
Author: Eddie James <eajames@linux.ibm.com>
Date:   Tue Dec 11 11:57:01 2018 -0500

    media: platform: Add Aspeed Video Engine driver

    The Video Engine (VE) embedded in the Aspeed AST2400 and AST2500 SOCs
    can capture and compress video data from digital or analog sources. With
    the Aspeed chip acting a service processor, the Video Engine can capture
    the host processor graphics output.

    Add a V4L2 driver to capture video data and compress it to JPEG images.
    Make the video frames available through the V4L2 streaming interface.

    Signed-off-by: Eddie James <eajames@linux.ibm.com>
    Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
    Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Kind regards
Vince
