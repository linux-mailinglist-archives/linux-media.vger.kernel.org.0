Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D64DC0705
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2019 16:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbfI0OJQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Sep 2019 10:09:16 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:50713 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726926AbfI0OJQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Sep 2019 10:09:16 -0400
Received: from [IPv6:2001:420:44c1:2577:2521:77be:ff76:8085] ([IPv6:2001:420:44c1:2577:2521:77be:ff76:8085])
        by smtp-cloud8.xs4all.net with ESMTPA
        id DqvniXz8FKKNGDqvriEAO9; Fri, 27 Sep 2019 16:09:15 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dariusz Marcinkiewicz <darekm@google.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v5.5] cec fixes and improvements
Message-ID: <2db83ecb-d773-bec1-e00e-1ad0b6ccb7f0@xs4all.nl>
Date:   Fri, 27 Sep 2019 16:09:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDRjFpItBZRr0rk+bZefviJH606ny4XlBwG98juj3tQPlAI/SllmKP2/4d2EjAmAYhihpB0qyBYwRzNIy4aX3G7JmIf/dZd8qWqxH0dGJ090QDKqZ9fX
 R+xdpxPAIkOM6G/Ectd7enYU/+GyxARU49fUAptH6gJLbPeRVhCJi7hRk/l4AsCES2UHTpIHY8D1/yVJmEMO71Xv+T8ZYTc400wK00kjlofRFOWDe2WOBtAm
 XHut4tIswm94+uD0Vruy1a7TKsMbzV9ZB/LT4NXsua9Mq+hTELvtSRbQcfO+Ci/qoycvNiknBHVc03sVUQ5SIct5A9ERGoXG8MksDJUwAI4=
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

The following changes since commit 6f51fdfd8229d5358c2d6e272cf73478866e8ddc:

  media: videobuf-core.c: poll_wait needs a non-NULL buf pointer (2019-09-05 06:26:57 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5a

for you to fetch changes up to 8d6802763bf5df69ddf254881a6c84381af9967a:

  cec-gpio: add notifier support (2019-09-26 16:13:01 +0200)

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
 11 files changed, 312 insertions(+), 51 deletions(-)
 create mode 100644 Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst
