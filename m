Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A03732F39
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 14:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbfFCMJn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 08:09:43 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:56181 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726940AbfFCMJn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Jun 2019 08:09:43 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id XlmUhLHgWsDWyXlmYhsyTh; Mon, 03 Jun 2019 14:09:42 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] Various fixes
Message-ID: <f65ca10e-eed8-b2b7-df54-01d8e1f9c7e0@xs4all.nl>
Date:   Mon, 3 Jun 2019 14:09:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLqo358apVUcnIkTyduktpapdhuDNHqyydUR4xVuojLJn5Yc2W2HJFLEF2GllPWrFG3OeDFcCK26P7pbdysIBUZMWigrhRCWzLRFMRIP/72gXm2QYI2I
 tMYz0nZlVOBLS/CraiXRchasiY4Oyafm00JbpwwnDfoIVJnNBHlr3owhPyBnbn9/s6OM9HkCdDxmJA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 69fbb3f47327d959830c94bf31893972b8c8f700:

  media: wl128x: Fix some error handling in fm_v4l2_init_video_device() (2019-06-03 07:20:49 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3i

for you to fetch changes up to b38335752c71ca9603f0a863a6e6eecd641add04:

  media: dt-bindings: Fix vendor-prefixes YAML (2019-06-03 13:58:51 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Colin Ian King (1):
      media: cx23885: remove redundant assignment to err

Dan Carpenter (1):
      media: staging/imx: fix two NULL vs IS_ERR() bugs

Hans Verkuil (1):
      dvb-usb/cxusb-analog.c: fix coccinelle warning, use ktime.h

Maxime Ripard (1):
      media: dt-bindings: Fix vendor-prefixes YAML

Neil Armstrong (1):
      media: platform: ao-cec-g12a: disable regmap fast_io for cec bus regmap

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
 drivers/media/pci/cx23885/cx23885-dvb.c                | 2 --
 drivers/media/platform/meson/ao-cec-g12a.c             | 1 -
 drivers/media/usb/dvb-usb/cxusb-analog.c               | 5 ++---
 drivers/staging/media/imx/imx-media-csi.c              | 4 ++--
 drivers/staging/media/imx/imx7-media-csi.c             | 4 ++--
 6 files changed, 7 insertions(+), 11 deletions(-)
