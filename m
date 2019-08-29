Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00D04A19AB
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 14:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbfH2MNc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 08:13:32 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:49791 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726416AbfH2MNc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 08:13:32 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3JItiRXRZDqPe3JIwiNvfI; Thu, 29 Aug 2019 14:13:30 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.4] Small fixes
Message-ID: <7d8c241c-10a5-948a-4e0f-24962e3d7a59@xs4all.nl>
Date:   Thu, 29 Aug 2019 14:13:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNhWBspieS261hDO04BBTqiXAOY8H8krbnkYExMQwCAqSKaEKS1OLdRSVJV0eYePkDufz3ma68LwVXW36fluq+L2XQ+AiuPvPAzmitNilPBHNzJDIB/4
 tyf/XWfhXilm5LxiAWF6x4AlDEIrRf6Mg1ScABBvtKRo5u1Gh9OOsQjkkK5SF8h9gC4M9ps7reW4ww==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 95c520690f5fafb2cda2ec17f8c76ab3422b0174:

  media: don't do a 31 bit shift on a signed int (2019-08-26 14:11:10 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.4p

for you to fetch changes up to 9cb46b4a1ac708ccb776868b3e21271d972e7589:

  media: imx: remove unused including <linux/version.h> (2019-08-29 13:44:16 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Markus Elfring (2):
      media: em28xx: Fix exception handling in em28xx_alloc_urbs()
      media: stm32-dcmi: Delete an unnecessary of_node_put() call in dcmi_probe()

Yizhuo (1):
      pvrusb2: qctrl.flag will be uninitlaized if cx2341x_ctrl_query() returns error code

YueHaibing (1):
      media: imx: remove unused including <linux/version.h>

 drivers/media/platform/stm32/stm32-dcmi.c        | 1 -
 drivers/media/usb/em28xx/em28xx-core.c           | 2 +-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c          | 2 +-
 drivers/staging/media/imx/imx-media-csc-scaler.c | 1 -
 4 files changed, 2 insertions(+), 4 deletions(-)
