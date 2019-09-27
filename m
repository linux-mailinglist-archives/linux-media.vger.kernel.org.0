Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48FE4C07FC
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 16:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbfI0OvS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 10:51:18 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:47237 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727213AbfI0OvS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 10:51:18 -0400
Received: from [IPv6:2001:420:44c1:2577:2521:77be:ff76:8085] ([IPv6:2001:420:44c1:2577:2521:77be:ff76:8085])
        by smtp-cloud8.xs4all.net with ESMTPA
        id DraTiYG2AKKNGDraWiEMUv; Fri, 27 Sep 2019 16:51:16 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dariusz Marcinkiewicz <darekm@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL v2 FOR v5.5] cec fixes and improvements
Message-ID: <ad5d2c2f-3752-4082-1a01-c3a0a96abc8e@xs4all.nl>
Date:   Fri, 27 Sep 2019 16:51:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEhHaIeb9S6wIFn8ZA3bSR8LML+fJv0azNYGuftZD89EQpytwkEsX7nc9NU0tLA645Zs8KtGA/+Zjk3w9uow62a2k4ZEUZlszQQM7F87u3ciKo6P3FQ+
 jLjPaVILKJfOnEWeS4c8wh2kkxPqQg74jWyRJUJ3o0hGBXrkPlpqGM/aN8sOV8jH7bfec3dy/mlg7lobteJcGdpGkE+D65wgfsl/WGmALNqjTEfWnz9fhkf5
 DYkZ9DaLKBZq36g5tSHsY2dscIUeewaWmTp8gpfoQ0M29JrbIiQMXEAaJQ1knZ0ejEPEh6UEAK1MK3Bxt0rV0Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are various fixes and improvements for the CEC framework.

In particular this enables the new CEC_ADAP_G_CONNECTOR_INFO ioctl that
Dariusz has been working on.

Once this is merged, v4l-utils will also need to be updated to use the
new ioctl and the new UI_CMD defines: patches for that are ready to be
applied once this lands.

Regards,

	Hans

Changes since v1:

- Fix UI_CMD documentation issues and spurious _
- Fix an issue with the tag order in patch 5.

The following changes since commit 6f51fdfd8229d5358c2d6e272cf73478866e8ddc:

  media: videobuf-core.c: poll_wait needs a non-NULL buf pointer (2019-09-05 06:26:57 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5a3

for you to fetch changes up to 1a62612282401cdfad4761d775617346f4d30073:

  cec-gpio: add notifier support (2019-09-27 16:49:03 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dariusz Marcinkiewicz (2):
      cec: expose the new connector info API
      cec: document CEC_ADAP_G_CONNECTOR_INFO and capability

Hans Verkuil (4):
      uapi/linux/cec.h: add defines for the CEC UI Command Operand
      cec/cec-adap.c: use new UI_CMD defines
      cec.h: CEC_OP_REC_FLAG_ values were swapped
      cec-gpio: add notifier support

 Documentation/media/cec.h.rst.exceptions                  |  89 +++++++++++++++++++++++++++++++++
 Documentation/media/uapi/cec/cec-funcs.rst                |   1 +
 Documentation/media/uapi/cec/cec-ioc-adap-g-caps.rst      |   6 ++-
 Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst | 105 +++++++++++++++++++++++++++++++++++++++
 Documentation/media/uapi/cec/cec-ioc-dqevent.rst          |   8 +++
 drivers/media/cec/cec-adap.c                              |  12 +++--
 drivers/media/cec/cec-api.c                               |  20 ++++++++
 drivers/media/cec/cec-core.c                              |   5 --
 drivers/media/platform/Kconfig                            |   1 +
 drivers/media/platform/cec-gpio/cec-gpio.c                |  41 ++++++++++++----
 include/media/cec.h                                       |  31 ------------
 include/uapi/linux/cec.h                                  | 133 +++++++++++++++++++++++++++++++++++++++++++++++++-
 12 files changed, 401 insertions(+), 51 deletions(-)
 create mode 100644 Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst
