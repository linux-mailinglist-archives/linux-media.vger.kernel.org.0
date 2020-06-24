Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EEBC207731
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 17:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404599AbgFXPSR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 11:18:17 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:38293 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390902AbgFXPSQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 11:18:16 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id o7ABjhyBcNb6lo7AEjtpPd; Wed, 24 Jun 2020 17:18:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593011895; bh=GG0sQgvDdR/cm9Lmg54v+0+myla77YAcDHNn2qH8HGU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=EbJKcJpH3Qodh/KtCd3TbksVYVN10FvZlJmlrELB1E/BGN7ekMANiKybeyAOC03yZ
         dMBRe3a5u1xcAFReDAASLD6/gOhZkve2XMgP8bzm0B0VUkFw0gCtPNMqyzSvUyOh6a
         tRGDTM7+wLS+gMxZFbRfQGaXtp4LthjTDcC1m9Hi8KdjNEu50EXJpC+gFaxAcpWJbd
         hyacMh0KnEgJRGDqJwcrbzdxClOi8RqW04x5zVro1Q4gfR4VKOe5UWmYGQeY6C3KC4
         kvMXX7QxzRoadXqjK6fe4vrVzCMAIeHb47uAfPcuEvGi3ZyzMPVc3PctRhdGpEcyR/
         6/F/bqk0TxJIw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.9] More fixes
Message-ID: <29109a40-a46b-8d22-067c-c7082b8cf13b@xs4all.nl>
Date:   Wed, 24 Jun 2020 17:18:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfO/ecfRhD9lt7Otof8S65TACxATwWF56b3+TObtwECL3A1bdLMfUW53dOBPiIXtg0ujc20Qg7xTKYWaxF5xUAisQuLN3RN05ZnSEmPjddeCWyGmCF1Em
 Xi8CuIIS/P4pIMGjTgugPNex/N0uK1CoHf7fRFrg2PmDvA/bonkznpW5KO0m8zsg5Cjb0cd73oM+ig==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit e30cc79cc80fd919b697a15c5000d9f57487de8e:

  media: media-request: Fix crash if memory allocation fails (2020-06-23 15:19:37 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.9d

for you to fetch changes up to b575b09dfe0f78a542623deae3705a3aa77033e3:

  media: vsp1: dl: Fix NULL pointer dereference on unbind (2020-06-24 17:12:42 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Andrey Konovalov (1):
      media: camss: use proper media entity function for subdevices

Chen Zhou (1):
      media: coda: jpeg: add NULL check after kmalloc

Colin Ian King (1):
      media: cx231xx: remove redundant assignment to variable err

Dafna Hirschfeld (1):
      media: staging: rkisp1: cap: remove support of BGR666 format

Dan Carpenter (1):
      firewire: Using uninitialized values in node_probe()

Eizan Miyamoto (5):
      mtk-mdp: remove mtk_mdp_comp.regs from mtk_mdp_comp.h
      mtk-mdp: handle vb2_dma_contig_set_max_seg_size errors during probe
      mtk-mdp: handle vpu_wdt_reg_handler() errors during probe
      mtk-mdp: convert mtk_mdp_dev.comp array to list
      mtk-mdp: Remove mtk_mdp_comp.id and supporting functionality

Eugen Hristev (1):
      media: atmel: atmel-sama5d2-isc: fix warning in configs without OF

Eugeniu Rosca (1):
      media: vsp1: dl: Fix NULL pointer dereference on unbind

Francois Buergisser (1):
      mtk-mdp: Remove states for format checks

Gustavo A. R. Silva (1):
      media: usb: pwc: pwc.h: Replace zero-length array with flexible-array member

 drivers/media/firewire/firedtv-fw.c              |  2 ++
 drivers/media/platform/atmel/atmel-sama5d2-isc.c |  2 ++
 drivers/media/platform/coda/coda-jpeg.c          |  5 +++-
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c    | 60 +++++------------------------------------
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h    | 23 +++-------------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c    | 69 ++++++++++++++++++++++++++++++-----------------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h    | 12 ++++++---
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c     | 90 +++++++++++++++++++++++--------------------------------------
 drivers/media/platform/qcom/camss/camss-csid.c   |  2 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c |  2 +-
 drivers/media/platform/qcom/camss/camss-ispif.c  |  2 +-
 drivers/media/platform/vsp1/vsp1_dl.c            |  2 ++
 drivers/media/usb/cx231xx/cx231xx-417.c          |  2 +-
 drivers/media/usb/pwc/pwc.h                      |  2 +-
 drivers/staging/media/rkisp1/rkisp1-capture.c    |  4 ---
 15 files changed, 112 insertions(+), 167 deletions(-)
