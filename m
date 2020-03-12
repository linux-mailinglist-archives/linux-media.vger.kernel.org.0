Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9B4183552
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 16:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgCLPqf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 11:46:35 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43992 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727526AbgCLPqf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 11:46:35 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 7DD0A296A72
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 0/2] fix fwnode API usage and remove v4l2_mbus_config field
Date:   Thu, 12 Mar 2020 16:46:02 +0100
Message-Id: <20200312154604.24996-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset fixes usage of the APIs.
This fixes the item in the TODO file:

* Don't use v4l2_async_notifier_parse_fwnode_endpoints_by_port().
e.g. isp_parse_of_endpoints in drivers/media/platform/omap3isp/isp.c
cio2_parse_firmware in drivers/media/pci/intel/ipu3/ipu3-cio2.c.

Patches summary:

- The first patch removes the field v4l2_mbus_config from
'struct rkisp1_sensor_async'.

- The second patch removes the usage of
v4l2_async_notifier_parse_fwnode_endpoints_by_port.
The code is very similar to the code in the function cio2_parse_firmware
but instead of iterating the ports it iterates the id's.
The patch also removes the relevant item from the TODO file.

changes since v1:
- patch 2 - in the function rkisp1_subdev_notifier:
1. move the test 'if (next_id == 0)' outside of the while loop
2. remove the 'end' label.
The changes are due to Helen Koike's comments

Dafna Hirschfeld (2):
  media: staging: rkisp1: remove mbus field from rkisp1_sensor_async
  media: staging: rkisp1: replace the call to
    v4l2_async_notifier_parse_fwnode_endpoints_by_port

 drivers/staging/media/rkisp1/TODO            |   3 -
 drivers/staging/media/rkisp1/rkisp1-common.h |   3 +-
 drivers/staging/media/rkisp1/rkisp1-dev.c    | 106 ++++++++++---------
 drivers/staging/media/rkisp1/rkisp1-isp.c    |  52 +++------
 4 files changed, 74 insertions(+), 90 deletions(-)

-- 
2.17.1

