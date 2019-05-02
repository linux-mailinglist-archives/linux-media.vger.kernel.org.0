Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DDCF119DD
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 15:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbfEBNOF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 09:14:05 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:36687 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726197AbfEBNOE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 May 2019 09:14:04 -0400
Received: from [IPv6:2001:420:44c1:2579:7549:573e:9131:939b] ([IPv6:2001:420:44c1:2579:7549:573e:9131:939b])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MBXChHT8GZVjxMBXGh6Mbb; Thu, 02 May 2019 15:14:02 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "eugen.hristev@microchip.com" <eugen.hristev@microchip.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] atmel-isc and coda enhancements
Message-ID: <1fc4f310-aa97-fa5f-ed1b-1253caabb003@xs4all.nl>
Date:   Thu, 2 May 2019 15:13:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKV2AXmXqr4mlbSjFLkC8wwjBSZiAI0+MBxxPUxsnZXxAFEQNQHnqJdP1sgAToGQmasihcI0K0WJRvQQVwKzK41R6wbPISgbqsPEPWC35N3lpCTNmklk
 mJdMmjs4B75MjGVqZHt5pvu0RdIN+lOGqmHZglLXRkdda8pzPCiIOg/Bgc/evhWi0yPsKnT+wC+ONRASP0PDMa2dirioxgTd8XsEnvAsRQdfqrbw0ThGGD3j
 2m+77j8CImBHmveAlXNPKvdOfkiUJrOT6HPHlXRLAyrZQAiJHGCKuC5vNP9h3I+w4mtp9zu1+NUrRD44KK53MHd3D8ShohJg/Iy/izHStf2F8WUtJYSdh5gb
 0dmhLxWd
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This previous PR https://patchwork.linuxtv.org/patch/55818/ is now split
in two, one with patches for 5.2 and one with stuff that can go into 5.3.

This PR contains the patches with new features for 5.3.

Regards,

	Hans

The following changes since commit 7afa8db323e37b9174cf78a1c9ab0ae7a9f5e7dd:

  media: vsp1: Add support for missing 16-bit RGB555 formats (2019-04-25 11:07:05 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3a

for you to fetch changes up to 73d1351fb7d7dafd88d15848bfacfe9f16b13351:

  media: coda: use v4l2_m2m_buf_copy_metadata (2019-05-02 15:04:53 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Eugen Hristev (4):
      media: atmel: atmel-isc: reworked white balance feature
      media: v4l2-ctrl: fix flags for DO_WHITE_BALANCE
      media: atmel: atmel-isc: add support for DO_WHITE_BALANCE
      media: atmel: atmel-isc: make try_fmt error less verbose

Philipp Zabel (12):
      media: coda: move register debugging to coda_debug level 3
      media: coda: move job ready message to coda_debug level 2
      media: coda: add coda_frame_type_char helper
      media: coda: improve decoder job finished debug message
      media: coda: demote s_ctrl debug messages to level 2
      media: coda: add menu strings to s_ctrl debug output
      media: coda: update profile and level controls after sequence initialization
      media: coda: add decoder MPEG-4 profile and level controls
      media: v4l2-ctrl: add MPEG-2 profile and level controls
      media: coda: add decoder MPEG-2 profile and level controls
      media: coda: add lockdep asserts
      media: coda: use v4l2_m2m_buf_copy_metadata

 Documentation/media/uapi/v4l/ext-ctrls-codec.rst |  56 +++++++++++++++++++
 drivers/media/platform/atmel/atmel-isc-regs.h    |   6 ++-
 drivers/media/platform/atmel/atmel-isc.c         | 263 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 drivers/media/platform/coda/Makefile             |   2 +-
 drivers/media/platform/coda/coda-bit.c           |  69 +++++++++++++++++++-----
 drivers/media/platform/coda/coda-common.c        | 129 +++++++++++++++++++++++++++++++++-----------
 drivers/media/platform/coda/coda-mpeg2.c         |  44 +++++++++++++++
 drivers/media/platform/coda/coda-mpeg4.c         |  48 +++++++++++++++++
 drivers/media/platform/coda/coda.h               |  14 +++++
 drivers/media/platform/coda/coda_regs.h          |   2 +-
 drivers/media/v4l2-core/v4l2-ctrls.c             |  24 +++++++++
 include/uapi/linux/v4l2-controls.h               |  18 +++++++
 12 files changed, 597 insertions(+), 78 deletions(-)
 create mode 100644 drivers/media/platform/coda/coda-mpeg2.c
 create mode 100644 drivers/media/platform/coda/coda-mpeg4.c
