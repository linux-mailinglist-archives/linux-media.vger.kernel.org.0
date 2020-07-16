Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2522C2226CE
	for <lists+linux-media@lfdr.de>; Thu, 16 Jul 2020 17:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbgGPPVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 11:21:21 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:44693 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728590AbgGPPVU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 11:21:20 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id w5hDj6Gq7NPeYw5hGjWJp8; Thu, 16 Jul 2020 17:21:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594912879; bh=EyNiEzuK5EsbCRFcydamKmDKhO3X+A8JWvHv+QkDgvA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rMJGSadXjLj4BMUrbt9oI3Pvhqq68GKNij4kLFdmiAEVWvjWJjnxu+BkQQLbV4ZOG
         3jbQRhLuqYAfVeSgxu4QrKm4WRXYQqKWdR1qhBihHUTq6lJcHwO1oPjxVUJVyVu6C9
         xETwbKC6U9LG+pgB6IGPamUhiHzxUhVoQvKjvdIScGoFXTrIi2j3TudYpYPiF7Gu5Z
         Jwb1iZFlE6kHvYSq/lzAG6bqPdGVPRsAM/NJODFUPpzZE6qSUSj9xPBrD4C+fwxRy7
         aAE9zZPKIHhpynlpuIzlJF07zizclAvDj8gVNmgYMBmkjhyiPymYBfdAYFn+dQNzvo
         QCztREfDQ2SEA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     jacopo mondi <jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.9] v4l2-subdev: Introduce [g|s]et_mbus_format pad op
Message-ID: <288a55d1-9cb9-72fc-c8d2-02b96bae2805@xs4all.nl>
Date:   Thu, 16 Jul 2020 17:21:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOet+FxBftHoqCo0TH5BKa7LYt2Gw4QiSyL++uxH3PyIjt9+5raiW36HZM/pzB5h0eAl+6GNuMqJzNAB95QDwp4xFnLTPyqRSqnfNcnBpaLtz5PLOUNj
 koeVKof7hpLFXEosS+kqPtNaaTX7DAEttbf5T+8YPQpZxYsewbnC6vuBA+Vo9r/8NBzjE4rBeVS6VNldIPrdmsG+fOlxMLCl98E=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Also contains a quick unrelated doc fix.

Regards,

	Hans

The following changes since commit 6f01dfb760c027d5dd6199d91ee9599f2676b5c6:

  media: cros-ec-cec: do not bail on device_init_wakeup failure (2020-07-04 12:45:45 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.9i

for you to fetch changes up to b1dbf57c880bff6c3f0c09d4cab86fd9a3b9cd95:

  colorspaces-details.rst: fix V4L2_COLORSPACE_JPEG description (2020-07-16 17:03:41 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
      colorspaces-details.rst: fix V4L2_COLORSPACE_JPEG description

Jacopo Mondi (10):
      media: v4l2-subdev: Introduce [get|set]_mbus_config pad ops
      media: i2c: Use the new get_mbus_config pad op
      media: i2c: ov6650: Use new [get|set]_mbus_config ops
      media: pxa_camera: Use the new set_mbus_config op
      media: v4l2-subdev: Remove [s|g]_mbus_config video ops
      media: v4l2- mediabus: Add usage note for V4L2_MBUS_*
      staging: media: imx: Update TODO entry
      media: i2c: adv748x: Adjust TXA data lanes number
      media: i2c: adv748x: Implement get_mbus_config
      media: rcar-csi2: Negotiate data lanes number

 Documentation/userspace-api/media/v4l/colorspaces-details.rst |   4 +-
 drivers/media/i2c/adv7180.c                                   |   7 +-
 drivers/media/i2c/adv748x/adv748x-core.c                      |  31 +++++--
 drivers/media/i2c/adv748x/adv748x-csi2.c                      |  31 +++++++
 drivers/media/i2c/adv748x/adv748x.h                           |   1 +
 drivers/media/i2c/ml86v7667.c                                 |   7 +-
 drivers/media/i2c/mt9m001.c                                   |   7 +-
 drivers/media/i2c/mt9m111.c                                   |   7 +-
 drivers/media/i2c/ov6650.c                                    |  56 ++++++++----
 drivers/media/i2c/ov9640.c                                    |   7 +-
 drivers/media/i2c/tc358743.c                                  |   7 +-
 drivers/media/i2c/tvp5150.c                                   |   7 +-
 drivers/media/platform/pxa_camera.c                           | 189 +++++++++++----------------------------
 drivers/media/platform/rcar-vin/rcar-csi2.c                   |  75 ++++++++++++++--
 drivers/staging/media/imx/TODO                                |   4 +
 include/media/v4l2-mediabus.h                                 |  33 ++++++-
 include/media/v4l2-subdev.h                                   |  37 +++++---
 17 files changed, 303 insertions(+), 207 deletions(-)
