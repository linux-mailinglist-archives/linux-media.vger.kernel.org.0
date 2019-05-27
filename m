Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6E3A2B356
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 13:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfE0LjD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 07:39:03 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:51033 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726185AbfE0LjD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 07:39:03 -0400
Received: from [IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13] ([IPv6:2001:983:e9a7:1:10b2:2e62:e4b1:bd13])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VDy0ham82sDWyVDy1hZ1Ke; Mon, 27 May 2019 13:39:01 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] Add analog mode support for Medion MD95700
Message-ID: <092534be-0a75-4e90-151b-15667450ba0e@xs4all.nl>
Date:   Mon, 27 May 2019 13:39:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHIWsnf0uXIUuI1sYNsfyjt0KNZuXXfzpWHYR4PzsUFqZfbRHxOr39rIjnGq/pSMHyeRcVjKahi9ju6RMHNiQQ8njRJAVtYt3cA72YpcidnG9fFl1CM1
 MmREwoqHN8M9Jiid9UUq/HWR68fSsjBE4reN1e7KgW03Kc4re0QteTMiiQP3S3sZXyaO6N6DfbvIpPtmkkjHe7GHHApy8yCYtmSkukZGJeU3ilR8nzjWXNO9
 4XoiltGQSKzWfRG5nfmB2wHTEeWjVqx8HqtmHT4ICu3OSny8JvNIEflzT6wH0s9ZwBVvLRUYptnqpxf2HGFJeg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 2c41cc0be07b5ee2f1167f41cd8a86fc5b53d82c:

  media: venus: firmware: fix leaked of_node references (2019-05-24 09:03:06 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3e

for you to fetch changes up to 38eaf2f243d1985cc8b7c4c9fd2210b731850b91:

  cxusb: add raw mode support for Medion MD95700 (2019-05-27 13:15:57 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Maciej S. Szmigiero (8):
      cx25840: don't open-code cx25840_reset() inside cx25840_load_fw()
      cx25840: g_std operation really implements querystd operation
      cx25840: implement g_std operation
      cx25840: add pin to pad mapping and output format configuration
      cx25840: set_fmt operation should clamp out-of-range picture sizes
      cxusb: implement Medion MD95700 digital / analog coexistence
      cxusb: add analog mode support for Medion MD95700
      cxusb: add raw mode support for Medion MD95700

 drivers/media/i2c/cx25840/cx25840-core.c |  554 +++++++++++++++++++---
 drivers/media/i2c/cx25840/cx25840-core.h |   15 +
 drivers/media/i2c/cx25840/cx25840-vbi.c  |    4 +
 drivers/media/usb/dvb-usb/Kconfig        |   16 +-
 drivers/media/usb/dvb-usb/Makefile       |    3 +
 drivers/media/usb/dvb-usb/cxusb-analog.c | 1971 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/usb/dvb-usb/cxusb.c        |  451 +++++++++++++++---
 drivers/media/usb/dvb-usb/cxusb.h        |  158 +++++++
 drivers/media/usb/dvb-usb/dvb-usb-dvb.c  |    5 +-
 drivers/media/usb/dvb-usb/dvb-usb-init.c |   13 +
 drivers/media/usb/dvb-usb/dvb-usb.h      |   10 +
 drivers/media/v4l2-core/v4l2-ioctl.c     |    3 +-
 include/media/drv-intf/cx25840.h         |  105 ++++-
 13 files changed, 3173 insertions(+), 135 deletions(-)
 create mode 100644 drivers/media/usb/dvb-usb/cxusb-analog.c
