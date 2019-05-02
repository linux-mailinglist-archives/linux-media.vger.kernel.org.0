Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31C911195A
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 14:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbfEBMtt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 08:49:49 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:50961 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726267AbfEBMts (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 May 2019 08:49:48 -0400
Received: from [IPv6:2001:420:44c1:2579:7549:573e:9131:939b] ([IPv6:2001:420:44c1:2579:7549:573e:9131:939b])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MB9jhHJHEZVjxMB9nh6G4M; Thu, 02 May 2019 14:49:47 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.2] Various fixes
Message-ID: <d5b4a68d-520e-0e93-d44e-07974058d690@xs4all.nl>
Date:   Thu, 2 May 2019 14:49:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHqKno825TTCFHwy23y/rxFOv7kOs+oGvMT3efO6z08DfmXCXn8ptwrbcm5TNYPRsH3DMeKNctge6NrDH9lGJUP46iRnN4tbW7H7VgKRL59/jRg9U0/5
 OCOscuw/YLMakoRHkjwJIzghs0+J750YDxLn/xyAYSXfE54N5Z5jtErDZrw7U7JsOfu0Lz7M8nLLiLBzfox0KQXpGcexc8kUfGKmbM2nEN7XjAUX2FiAhvq8
 CqZCV+th8eMEmurR1W7J5F/TPyjnfe3bz+hZccEAhgSD6YiPlU2HHMNWa4VNT+73
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This previous PR https://patchwork.linuxtv.org/patch/55818/ is now split
in two, one with patches for 5.2 and one with stuff that can go into 5.3.

This PR contains the fixes for 5.2.

Regards,

	Hans

The other patches of that previous PR will be added to a PR for

The following changes since commit 7afa8db323e37b9174cf78a1c9ab0ae7a9f5e7dd:

  media: vsp1: Add support for missing 16-bit RGB555 formats (2019-04-25 11:07:05 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.2k

for you to fetch changes up to 43a25a7f5176a8e7671dd2728f0f25f3c6ebf791:

  tegra-cec: fix cec_notifier_parse_hdmi_phandle return check (2019-05-02 14:39:55 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dan Carpenter (2):
      media: omap_vout: potential buffer overflow in vidioc_dqbuf()
      media: davinci/vpbe: array underflow in vpbe_enum_outputs()

Eugen Hristev (3):
      media: atmel: atmel-isc: limit incoming pixels per frame
      media: atmel: atmel-isc: fix INIT_WORK misplacement
      media: atmel: atmel-isc: fix asd memory allocation

Hans Verkuil (2):
      field-order.rst: clarify FIELD_ANY and FIELD_NONE
      tegra-cec: fix cec_notifier_parse_hdmi_phandle return check

Niklas Söderlund (2):
      rcar-csi2: restart CSI-2 link if error is detected
      rcar-csi2: Propagate the FLD signal for NTSC and PAL

Philipp Zabel (1):
      media: coda: fix unset field and fail on invalid field in buf_prepare

Rui Miguel Silva (1):
      media: staging/imx: add media device to capture register

 Documentation/media/uapi/v4l/field-order.rst  | 16 +++++++---------
 drivers/media/platform/atmel/atmel-isc-regs.h | 19 +++++++++++++++++++
 drivers/media/platform/atmel/atmel-isc.c      | 46 ++++++++++++++++++++++++++++++++++++++++++----
 drivers/media/platform/coda/coda-common.c     | 10 ++++++++++
 drivers/media/platform/davinci/vpbe.c         |  2 +-
 drivers/media/platform/omap/omap_vout.c       | 15 ++++++---------
 drivers/media/platform/rcar-vin/rcar-csi2.c   | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
 drivers/media/platform/tegra-cec/tegra_cec.c  |  4 ++--
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  2 +-
 drivers/staging/media/imx/imx-media-capture.c |  6 +++---
 drivers/staging/media/imx/imx-media-csi.c     |  2 +-
 drivers/staging/media/imx/imx-media.h         |  3 ++-
 drivers/staging/media/imx/imx7-media-csi.c    |  2 +-
 include/media/davinci/vpbe.h                  |  2 +-
 14 files changed, 160 insertions(+), 37 deletions(-)
