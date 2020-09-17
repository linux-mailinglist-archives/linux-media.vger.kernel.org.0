Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5573C26D97D
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 12:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgIQKsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 06:48:18 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:48535 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726610AbgIQKsP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 06:48:15 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id IrSMkLuDlPTBMIrSOkleDD; Thu, 17 Sep 2020 12:48:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600339684; bh=AzAB49aVVaUND4YnF8uGNEABBUCnkDFtnbe97Pm7FEk=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=T8+dHuXFrVYK/bRuQqNU6MAvn92BjALGa9VfkkC4tf575dYfWEgxEO3VwPOM2k5rm
         gcN1Lbfj4HAT9E+jo6kJ6QWX5vIHl8ZNTLDj14lr1Ma5PuvVsdM6lexsUyLSe21PpJ
         tiRbzPrAFmJe8e5Mvs/Sdf9nq36fx4af2Km4/qZnjRyH83OJbZR/Okv2Qyx12fQYKM
         30orTBO42M5+R3VguZylzIZ9cvtinVf7hfrqzGwlT8MrJoXNZtYwTxwrjCfVv4AEGk
         T0kdDK5N59kSWd4P9rsTCwzHtVEW0pvM7j50F4TBohpEX3TQf0XPzrB3QRFNBYOMYr
         Tjnvx+eX6Sxgw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.10] Various fixes (mostly rcar related)
Message-ID: <0f564827-1eae-1660-95a5-86b910e44b26@xs4all.nl>
Date:   Thu, 17 Sep 2020 12:48:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPZrii2M/2eCy94tdlTQJ9T4qHfRC/jJz/7uL9lVWyguC4oQZX+VYHgPY1qlk9E4Wxpl6GtEf7BdrSZpUbu9dsoQKkC9H6JmCzCzNb4y7E4Ic+VRJTeS
 84fAGJvuhnn/2kj6cJLX/1+earAM0P/fWx7r4s0b78AI7+OzrrA5r7kEnsYhlUdWNHRR2IMZRvXVvwy+0rYB1fiM3VI03r3C7I2zj9FeqFh3y6pDkhpdO7DD
 vVeLRlRvAUNMCYZElpZjgEupUKwBmF2ohANYBIxsEAdngytSXl+U+40qY1eJE9uVdIHhOxTSBlb2Kvhh1GTwDems0gZ+XD0c6uvkML9x+BRmAwvUwtqAFL0m
 85EV1EDrwxqUg7mvF62Mo4bA9fjPOg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 741043b02c2e00c8fea1a0f6f8ce43c6326cd9e8:

  media: vidtv: don't initialize cnr2qual var (2020-09-14 16:10:08 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.10b

for you to fetch changes up to 9dc9f890aefe01530f6934004aac36f1a6feb44c:

  media: rcar-vin: Enable YDS bit depending on bus_width and data_shift (2020-09-17 12:40:05 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Lad Prabhakar (9):
      dt-bindings: media: renesas,vin: Add device tree support for r8a7742
      media: rcar-fcp: Update description for VIDEO_RENESAS_FCP Kconfig entry
      media: rcar-vin: Kconfig: Update help description for VIDEO_RCAR_CSI2 config
      media: rcar-vin: Kconfig: Update help description for VIDEO_RCAR_VIN config
      dt-bindings: media: renesas,csi2: Add R8A774E1 support
      dt-bindings: media: renesas,vin: Add R8A774E1 support
      media: rcar-csi2: Enable support for R8A774E1
      media: rcar-vin: Enable support for R8A774E1
      media: rcar-vin: Enable YDS bit depending on bus_width and data_shift

Vaibhav Gupta (1):
      saa7134: use generic power management

Xiaolong Huang (1):
      media: media/pci: prevent memory leak in bttv_probe

 Documentation/devicetree/bindings/media/renesas,csi2.yaml |  1 +
 Documentation/devicetree/bindings/media/renesas,vin.yaml  |  2 ++
 drivers/media/pci/bt8xx/bttv-driver.c                     | 13 ++++++++++---
 drivers/media/pci/saa7134/saa7134-core.c                  | 27 +++++++++------------------
 drivers/media/platform/Kconfig                            |  4 ++--
 drivers/media/platform/rcar-vin/Kconfig                   |  4 ++--
 drivers/media/platform/rcar-vin/rcar-core.c               | 49 ++++++++++++++++++++++++++++++++++++++++++++-----
 drivers/media/platform/rcar-vin/rcar-csi2.c               |  4 ++++
 drivers/media/platform/rcar-vin/rcar-dma.c                | 17 ++++++++++++++---
 drivers/media/platform/rcar-vin/rcar-vin.h                |  5 +++--
 10 files changed, 91 insertions(+), 35 deletions(-)
