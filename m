Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F85733CFDA
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 09:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234710AbhCPI3C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 04:29:02 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:60117 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233674AbhCPI2w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 04:28:52 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id M54Kl0beb4ywlM54NlAEvx; Tue, 16 Mar 2021 09:28:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615883331; bh=+kqVOuNhUm1dZmhVFGGGFM9n2QfjsRX4Q8vxCpIphW0=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=s2vgUXhBkMOxKZdbBjkIASihpZzaoMpP63xpOs27FormOKOm3bPKx4APMq+QEnuef
         +l7Tbcf7PoQmvd0VqKlav74Y0D4xRQ6cBeBOg9qja89YoX6K8FiborqAx5g+vnPant
         zoOGKI8Kn/5vyMQgFlfv9/PFN3skNzxjODd0yrW2zTt6eNLNX1Q+bQro7ajXLwocMR
         J+ODDdqm/pxwVlqE/nA3lFFNygtrQOp1BHjMlpE5aRu3OWKBPu/zUkTADa1UpROzs0
         eBU/QvbR2aWGIzjqPmLCxZLSTy3BE0M5dKM+r5j7lmsTi06TfvpR6KauiquZLXi+XX
         uYK2DAyDAXHmg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.13] Various fixes
Message-ID: <2b1c3894-0de4-fdbb-5fd5-004765a5a5ea@xs4all.nl>
Date:   Tue, 16 Mar 2021 09:28:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHNpDWIV0b1iTjVID19FsUmQ2eziFqZYWuA3tHVz02L4qOOj/vtKEl04oCr9A/6oCsTYyWY/gXLD2nPFgwnjkiZypEWjJaygFyqM9e0ARoewkY7mVQ2B
 Ss/OxLZZg4E9krRxaHRxN+0dCvdSZzrz99FFqAilzcVCykJAA7AQPWpGRFaZbrqQETvHTfnugYHHnn7ov9nwA0c7Sz35ZptQcuU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 1c5ab1e2286f4ca6347744e9d4cace5fad5ffa39:

  Merge tag 'v5.12-rc2' into patchwork (2021-03-07 17:46:50 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13j

for you to fetch changes up to a19a42501dcae664335e7377bd421a2a823077ad:

  radio-si476x: rectify spelling and grammar (2021-03-16 09:23:47 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Bhaskar Chowdhury (1):
      media: pci: saa7164: Rudimentary spelling fixes in the file saa7164-types.h

Daniel Niv (1):
      media/saa7164: fix saa7164_encoder_register() memory leak bugs

Fabio Estevam (2):
      media: camera-mx2: Remove unused header file
      media: camera-mx3: Remove unused header file

Hans Verkuil (6):
      media/usb/gspca/w996Xcf.c: /** -> /*
      v4l2-dev.c: show which events are requested by poll()
      v4l2-ioctl.c: fix timestamp format
      gspca/sq905.c: fix uninitialized variable
      v4l2-ctrls.c: initialize flags field of p_fwht_params
      ext-ctrls-codec.rst: fix typos

Liu Ying (1):
      media: docs: Fix data organization of MEDIA_BUS_FMT_RGB101010_1X30

Ricardo Ribalda (1):
      media: videobuf2: Explicitly state max size of planes

Xiaofeng Cao (2):
      media: Correct 'so'
      radio-si476x: rectify spelling and grammar

 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 12 +++++------
 Documentation/userspace-api/media/v4l/subdev-formats.rst  |  4 ++--
 drivers/media/Kconfig                                     |  2 +-
 drivers/media/pci/saa7164/saa7164-encoder.c               | 20 +++++++++--------
 drivers/media/pci/saa7164/saa7164-types.h                 |  4 ++--
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c     |  2 +-
 drivers/media/radio/radio-si476x.c                        |  6 +++---
 drivers/media/usb/gspca/sq905.c                           |  2 +-
 drivers/media/usb/gspca/w996Xcf.c                         |  3 +--
 drivers/media/v4l2-core/v4l2-ctrls.c                      |  2 ++
 drivers/media/v4l2-core/v4l2-dev.c                        |  5 +++--
 drivers/media/v4l2-core/v4l2-ioctl.c                      |  2 +-
 include/linux/platform_data/media/camera-mx2.h            | 31 --------------------------
 include/linux/platform_data/media/camera-mx3.h            | 43 -------------------------------------
 include/media/videobuf2-core.h                            |  6 ++++--
 15 files changed, 38 insertions(+), 106 deletions(-)
 delete mode 100644 include/linux/platform_data/media/camera-mx2.h
 delete mode 100644 include/linux/platform_data/media/camera-mx3.h
