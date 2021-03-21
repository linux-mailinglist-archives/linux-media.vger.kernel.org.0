Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7A7E3431E2
	for <lists+linux-media@lfdr.de>; Sun, 21 Mar 2021 10:36:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbhCUJgR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Mar 2021 05:36:17 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:42951 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229766AbhCUJfy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Mar 2021 05:35:54 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id NuUvlm7UDDUxpNuUyloIPw; Sun, 21 Mar 2021 10:35:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616319353; bh=GmmbTe4p5jHS5q9eMBc5rzriTE8bzGL4x8bMNRWgxC4=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=riXzOir4qAYQR967U7g1+TZ19TU+4Oau9aF12BYZJ8E5tOWl9Kc4sQED2Zij+yD9g
         vAQ3sdfHUeCDe8Is5F9oW5NHlD0mcwc+0Dnm2PxT0Qq6G/BJbvqWVjtUgKvCJX/w1f
         aUOcrV0Lm+vih5SM5SGo1NotElVxS8BU6XQe32ZALWNdtNXINmWlgoGTnbuEFqf08S
         ivegW+coWzzcuVfppAWl68dTwK3c9vVYa2xg2yIbli27k6hpKSzXPGytJK13QnNvBb
         Tu4JrsORiwVl2ZY2Ho5aJvnC3593V5HbkJOqwPW6yrERhQYqpHM+oAovFrSPrD4Iof
         jhtcqbSImcjDw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.13] Various fixes
Message-ID: <dc47d8d9-f12c-d583-5b0e-a3039188cbf0@xs4all.nl>
Date:   Sun, 21 Mar 2021 10:35:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfH4yNuQLBrytU4rhUdSzzckuRrY2KpCvpqyIwh21jDgbFEhIlxOzeaWEKRbaHgcCRUbviPBIZL0ou4yeaXKdKTo6v21/86iM+ip62a5ZO0cDRZzbv1Kj
 DLgfuakRfqPDLEQ8nQEwZ/bAj9yXkSTBoqImmPm9ojbP0jIbqbushqk8CYXcLbXrBXmaKmc8hSXYSGpPpGy6DlV3cr0mtErhL8c=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 2842027ffb066b62467fde803ecac8024b0fc51e:

  media: imx: imx7_mipi_csis: Print shadow registers in mipi_csis_dump_regs() (2021-03-05 15:31:03 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13l

for you to fetch changes up to df870d75ff036d4e7c37200b20bff4886b8ab0e7:

  media: cx25821: switch from 'pci_' to 'dma_' API (2021-03-21 10:24:50 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Antti Keränen (1):
      media: v4l2-mc: fix a warning message

Christophe JAILLET (1):
      media: cx25821: switch from 'pci_' to 'dma_' API

Fabio Estevam (2):
      media: coda: Remove unneeded of_match_ptr()
      media: rkvdec: Remove of_match_ptr()

Hans Verkuil (3):
      vidioc-g-ext-ctrls.rst: reformat tables and clarify which vs ctrl_class
      buffer.rst: fix incorrect :c:type
      adv7604: writing a one-block EDID failed

Ricardo Ribalda (1):
      media: videobuf2: Exit promptly if size = 0

Stanimir Varbanov (1):
      v4l2-ctrls: Fix h264 hierarchical coding type menu ctrl

Wolfram Sang (1):
      media: i2c: adv7842: remove open coded version of SMBus block write

zuoqilin (1):
      media/pci/pt1: Assign value when defining variables

 Documentation/userspace-api/media/v4l/buffer.rst             |  2 +-
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst | 42 ++++++++++++++++++------------------------
 drivers/media/common/videobuf2/videobuf2-dma-sg.c            |  2 +-
 drivers/media/i2c/adv7604.c                                  | 30 ++++++++++++++++--------------
 drivers/media/i2c/adv7842.c                                  | 27 +++++++--------------------
 drivers/media/pci/cx25821/cx25821-alsa.c                     |  2 +-
 drivers/media/pci/cx25821/cx25821-core.c                     | 10 +++++-----
 drivers/media/pci/pt1/pt1.c                                  |  6 ++----
 drivers/media/platform/coda/coda-common.c                    |  2 +-
 drivers/media/v4l2-core/v4l2-ctrls.c                         |  8 ++++++++
 drivers/media/v4l2-core/v4l2-mc.c                            |  2 +-
 drivers/staging/media/rkvdec/rkvdec.c                        |  2 +-
 12 files changed, 62 insertions(+), 73 deletions(-)
