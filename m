Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0897322C247
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 11:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgGXJbB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 05:31:01 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:60199 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726742AbgGXJbA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 05:31:00 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id yu2bjKJJRywL5yu2cjSksA; Fri, 24 Jul 2020 11:30:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595583058; bh=+XZmX3YWS5BzUYXc2o9LFZxvT5b28NpCr+z44+rr48A=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=HQSG+/KLu0FlbvrQmDalRuPWIB413VQ3+RCp3g/pmrGskq9vvKUR5RRPEqsL701D/
         bWbxCIgR34t3D/44/lW1w6akRdVC0WoGHZw24Q7I2gw7dPPBeHCRiQ3lJbeBpFVSLs
         Dbc2fEt7CM8YYnz1NoLoG1MqpJV40JgdLeQOJmAzoDRZVhDywtDH/t7CfoDeFVY+3s
         XfW/SJ/TS8JuTG93Hzi3PSI4eE8KthsPAhcDvXobWKocbGTUdMTmd4B8xciKg6zhQb
         2ixYtMxV9Rv9hEacJ8qXeqquvs4f57KGEM/nVKr5lT2iLx5jNQKbCnOc9daq8KhQ53
         P98sWoTblKOpg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.9] Various fixes
Message-ID: <f337a056-4da1-36b1-7a4e-0863300978b6@xs4all.nl>
Date:   Fri, 24 Jul 2020 11:30:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNUrko0+mWCalfyqAtgLW30JEHDRCicgWh7R0BaTAvrUxRtV7alJzDtqlHL/SuyBuGp2GuL0UUkzNfLMEm9dpZ4XhXPfcgYNcHN4OjY3lKPDIjqSkP6q
 7B+RWn1QA7WZK8gznV/5U0KaGpj34xmUt8ljXrHcXigqF86C1RGJeCE2Be2cwYzEhoomE5bHgKodUXvtengRRQMSVRjq9meCMc0Z1Wqauy3gAyIFSN6meZo9
 brX5Ymj7NiEJ1fO96TJ6622jZDYH4HVRO5gpkvomtp8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 8f2a4a9d5ff5202d0b3e3a144ebb9b67aabadd29:

  media: dvbdev.h: keep * together with the type (2020-07-19 14:26:25 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.9k

for you to fetch changes up to d6df6a7c1afc9e6024ff7799ead657299deef58e:

  media: camss: fix memory leaks on error handling paths in probe (2020-07-24 11:23:51 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Colin Ian King (2):
      media: allegro: fix potential null dereference on header
      media: radio: remove redundant assignment to variable retval

Colton Lewis (2):
      v4l2: Correct kernel-doc inconsistency
      v4l2: Correct kernel-doc inconsistency

Dan Carpenter (2):
      media: allegro: fix an error pointer vs NULL check
      media: mtk-mdp: Fix a refcounting bug on error in init

Evgeny Novikov (2):
      media: davinci: vpif_capture: fix potential double free
      media: camss: fix memory leaks on error handling paths in probe

Hans Verkuil (1):
      meye: fix missing pm_mchip_mode field

Jian-Jia Su (1):
      media: v4l2-dev/ioctl: Fix document for VIDIOC_QUERYCAP

Vaibhav Gupta (2):
      saa7164: use generic power management
      media: cafe-driver: use generic power management

 Documentation/userspace-api/media/v4l/vidioc-querycap.rst |  4 ++--
 drivers/media/pci/meye/meye.h                             |  2 --
 drivers/media/pci/saa7164/saa7164-core.c                  |  3 ---
 drivers/media/platform/davinci/vpif_capture.c             |  2 --
 drivers/media/platform/marvell-ccic/cafe-driver.c         | 31 +++++++------------------------
 drivers/media/platform/marvell-ccic/mcam-core.c           |  3 ---
 drivers/media/platform/marvell-ccic/mcam-core.h           |  2 --
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c             | 16 ++++++++++++----
 drivers/media/platform/qcom/camss/camss.c                 | 30 ++++++++++++++++++++----------
 drivers/media/radio/si4713/radio-usb-si4713.c             |  2 +-
 drivers/staging/media/allegro-dvt/allegro-core.c          |  2 +-
 drivers/staging/media/allegro-dvt/allegro-mail.c          |  3 +--
 include/media/v4l2-mc.h                                   |  8 ++++----
 include/media/v4l2-subdev.h                               |  4 ++--
 14 files changed, 50 insertions(+), 62 deletions(-)
