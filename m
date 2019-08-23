Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 485349AEA2
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 14:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731752AbfHWMB1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 08:01:27 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:34541 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731457AbfHWMB1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 08:01:27 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 18FuikjLnThuu18Fxioubf; Fri, 23 Aug 2019 14:01:25 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.4] Add imx csc/scaler mem2mem device
Message-ID: <9d0cbecd-02dc-3d58-6342-3fb091e9d798@xs4all.nl>
Date:   Fri, 23 Aug 2019 14:01:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJ9mDqPvmaaKH4ldNaUe+PMNkAIVafZeet/QGElCdhqG/0V8474wKPR06pgOdGTrr2JNhbaWxcaQXmQHyWJipfFzf1f2KuD8/87XDLTABudBJTE1EO1o
 6V124vQdbf4rFYYMNLJeEYRUQv2E/fZS2Z2CVKyQWvOaDKWc7FJ6+K4WE0eyXT/ektKtjG2iGC/BksAOZ01ZD1IsKjO0ADUO18g=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 577bbf23b758848f0c4a50d346460b690c753024:

  media: sunxi: Add A10 CSI driver (2019-08-23 07:31:35 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.4n

for you to fetch changes up to ba443b4dd9e15ffefba9d8aa07f419b0d19bf1b4:

  media: imx: add csc/scaler mem2mem device (2019-08-23 13:53:40 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Philipp Zabel (1):
      media: imx: add csc/scaler mem2mem device

 drivers/staging/media/imx/Kconfig                 |   1 +
 drivers/staging/media/imx/Makefile                |   3 +-
 drivers/staging/media/imx/imx-media-csc-scaler.c  | 926 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/imx/imx-media-dev.c         |  28 +-
 drivers/staging/media/imx/imx-media-internal-sd.c |   4 +
 drivers/staging/media/imx/imx-media.h             |  12 +
 6 files changed, 972 insertions(+), 2 deletions(-)
 create mode 100644 drivers/staging/media/imx/imx-media-csc-scaler.c
