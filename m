Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F661EF52E
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 12:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgFEKTW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 06:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbgFEKTW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 06:19:22 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82D71C08C5C3
        for <linux-media@vger.kernel.org>; Fri,  5 Jun 2020 03:19:21 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id 9so1424875ljv.5
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2020 03:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=CTigQLcH21zASrooZtUJCCI769gjmdMorqb3ADmYSew=;
        b=PjJIiaMuWDrTyiji83bvizFhjhIEjVmMJrdmY9PN7RTa5u6HjBFeCbZch9aTPiZeNF
         ezgNRd2j3ufQhwJ271PQQ9u/SgZPRZc3/uAsSbqgtEYAvjqRqTltUQaFlJfUN9Lyoj1C
         niQftp+FqSTV5zTp2EIHge1gdmlAEGFPFBHmjeyRBsN5/EMVwlH23dNzundjIsaSsKFa
         HKgjwRj38l7+1PoypvSslZM+FyGSQPeX6vG4sxTtX8z/OCO21roX9z/rdDMRgvQsEn6V
         dKaDcXgmRHuoGUUoEUexHJTTVn90fUOkOe0khxLWX6T97gR1VkSZPfNJS1U8oIvfG/3f
         F+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=CTigQLcH21zASrooZtUJCCI769gjmdMorqb3ADmYSew=;
        b=I9VcrEuN9EjCgDYzU92Oc2gF+LBrnQSHAr/6rj+CywNa7TJzKQKFsBKQ5sTHcQ5CNi
         UeuFT35Gyau4gKRMgipwzVbS9RhqKbnmkhVnFHF3wABXqxrsN9+7c4L9DEpO553WJw1a
         vD12fwfnGCpkK29kdzhe9OzzHQQtpwSeY6h2UAdikOil170uA4CnCQioXRE15lMByNDy
         PMKzIqhdD4Epg9Rry0cgRiP7QD9/YIBaiHymkLkKz6roFnReCsJHxWbUHVQNXpeKyW0I
         6uObK8zpb8Blj3EFTjGHDWknANcsCTvcEmYqS1Joz0KwLCe+OGUXXFaL8CzVcqFJHHPd
         BPsA==
X-Gm-Message-State: AOAM532ftWBvg8qOY7Q4btMdu5qK54rA7ACGdwvo2kSW/sWovLSxefsA
        a05TVFLEewYf3viUM39sC81mLZCl5P8APtW5PqUy9nanQIlr+w==
X-Google-Smtp-Source: ABdhPJzZNgLQN9r7B5iOHnsY1wkdfiAMQ/fIT+7mks77XrT7pWeatsV800ZrzB6/xqlbFEBE6l1kZW1ZP5oFnBsYYFI=
X-Received: by 2002:a2e:9c91:: with SMTP id x17mr4744488lji.366.1591352359210;
 Fri, 05 Jun 2020 03:19:19 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 5 Jun 2020 15:49:07 +0530
Message-ID: <CA+G9fYuj7ADfxs+-vY3Hbx5zPceYofCLFy1WRe=-w2_v_J7tSA@mail.gmail.com>
Subject: mainline: v4l2 modules missing Kconfigs
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     ": Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, robert.foss@linaro.org,
        stanimir.varbanov@linaro.org, lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The test v4l2-compliance modprobe-vivid failed

Test error,
VIDEO_DRIVER=vivid.ko
v4l2-existence-check pass
ln: failed to create symbolic link '/lib/modules/5.7.0+/' -> '': No
such file or directory
modprobe: FATAL: Module vivid not found in directory /lib/modules/5.7.0+
modprobe-vivid fail

The investigations shows that,
the following kernel configs are missing on latest mainline builds on
x86, i386 and arm64.
These are still found on arm config.

CONFIG_VIDEOBUF2_CORE=m
CONFIG_VIDEOBUF2_V4L2=m
CONFIG_VIDEOBUF2_MEMOPS=m
CONFIG_VIDEOBUF2_DMA_CONTIG=m
CONFIG_VIDEOBUF2_VMALLOC=m
CONFIG_VIDEO_V4L2_TPG=m

Please suggest the configs required for v4l2 testing.
and any additional test coverage.

We add V4L2 config fragments like this
# Vivid driver for V4L2 tests
CONFIG_VIDEO_VIVID=m
CONFIG_MEDIA_SUPPORT=y
CONFIG_V4L_TEST_DRIVERS=y
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_VIDEO_V4L2=y
CONFIG_VIDEO_DEV=y

git branch: master
git repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
GOOD:
   git commit: cb8e59cc87201af93dfbb6c3dccc8fcad72a09c2
   good config: https://builds.tuxbuild.com/600ssEELJrReeIBY_a4Ghw/kernel.config
BAD:
   git commit: 6929f71e46bdddbf1c4d67c2728648176c67c555
    bad config: https://builds.tuxbuild.com/2eAqpM2VDo7nnt8HXX2Org/kernel.config

Test ref:
https://lkft.validation.linaro.org/scheduler/job/1471386#L1310

Test results comparison,
https://qa-reports.linaro.org/lkft/linux-mainline-oe/build/v5.7-8602-g15a2bc4dbb9c/testrun/2785598/suite/v4l2-compliance/test/modprobe-vivid/history/

- Naresh
