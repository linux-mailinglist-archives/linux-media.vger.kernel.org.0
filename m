Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB90E261B0
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 12:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728693AbfEVKYf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 06:24:35 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:39135 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728527AbfEVKYf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 06:24:35 -0400
Received: from [IPv6:2001:420:44c1:2579:69f9:edb3:2367:c945] ([IPv6:2001:420:44c1:2579:69f9:edb3:2367:c945])
        by smtp-cloud9.xs4all.net with ESMTPA
        id TOQ9h5EkKsDWyTOQDhKbVt; Wed, 22 May 2019 12:24:33 +0200
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] cec: various fixes/enhancements
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <b242ea68-4fb4-d5e7-2dd8-2aedf3521bc8@xs4all.nl>
Date:   Wed, 22 May 2019 12:24:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOT3TXvtZBAjScWgQ7yoCthrqPzCQpLRHZkgnzaVZR9bdVlZyeub6GOOV4rX7Cs4xxE+ZVheWgxAN82po40XYC4MlnHp+Q1p0mDwVAoSqIY3HCyyFH7Y
 9/C7CWjg5ZTdJTIXOrkHm+V8aJrYdHE7r9SNHXKHxiabTtFJgiN1YJmbL1K+sRf0md4Kdq6xKhpSTZQGg01ItH+P6biH8u6rDdwi1t/A/VDdhhXI0+xrfM3x
 Y/gA7xHT4W+d+6SR26Nh9gijtwhOuW/hJYrceZjn4oJu5tub7c602w7pnFq0ntzy
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Various cec fixes and enhancements.

This includes an API addition: CEC_MSG_FL_RAW. This requires CAP_SYS_RAWIO
and when set skips all sanity checks except some core checks such as checking
the payload length.

This flag is typically used when debugging CEC issues with devices that do
not properly follow the specification.

Regards,

	Hans

The following changes since commit bc8c479a5b19bd44f7379e42e627170957985ee9:

  media: venus: helpers: fix dynamic buffer mode for v4 (2019-05-21 09:03:25 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-cec-raw2

for you to fetch changes up to 2505737aa94392958287c44104dc1e2d5c4ffc63:

  cec-ioc-g-mode.rst: be more specific when EPERM is returned (2019-05-22 11:24:38 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (9):
      cec: mark devnode as registered before actually registering it
      cec-gpio: use disable/enable_irq
      cec: cec_transmit_msg_fh: do sanity checks first
      cec: move check from cec_transmit to cec_transmit_msg_fh
      cec: add CEC_MSG_FL_RAW flag and msg_is_raw helper function
      cec-ioc-receive.rst: document CEC_MSG_FL_RAW
      cec: support CEC_MSG_FL_RAW
      cec: allow any initiator for Ping and Image/Text View On
      cec-ioc-g-mode.rst: be more specific when EPERM is returned

 Documentation/media/uapi/cec/cec-ioc-g-mode.rst  |   3 ++-
 Documentation/media/uapi/cec/cec-ioc-receive.rst |  15 +++++++++++-
 drivers/media/cec/cec-adap.c                     | 112 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------
 drivers/media/cec/cec-api.c                      |   8 -------
 drivers/media/cec/cec-core.c                     |   3 ++-
 drivers/media/cec/cec-priv.h                     |   5 ++++
 drivers/media/platform/cec-gpio/cec-gpio.c       |  28 +++++++++--------------
 include/uapi/linux/cec.h                         |   1 +
 8 files changed, 107 insertions(+), 68 deletions(-)
