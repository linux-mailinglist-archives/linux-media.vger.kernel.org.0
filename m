Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1618188CCB
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 19:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgCQSHL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 14:07:11 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35308 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbgCQSHL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 14:07:11 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:113f:ad1c:f038:27d4:2beb:6e6b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8D5FA294279;
        Tue, 17 Mar 2020 18:07:09 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v3 0/2] media: staging: rkisp1: fix fwnode API usage and remove v4l2_mbus_config field
Date:   Tue, 17 Mar 2020 19:06:59 +0100
Message-Id: <20200317180701.6035-1-dafna.hirschfeld@collabora.com>
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

changes since v2:
patch 1: rename the field parallel_bus_flags to mbus_flags
and set it to vep->bus.mipi_csi2.flags instead of 0
so that the original logic does not change, but only the fields names.

patch 2: in the function rkisp1_subdev_notifier:
- remove a newline between a call to 'fwnode_graph_get_endpoint_by_id' to the test of its ret value.
- define 'next_id' as 'unsigned int' instead of 'int'
- rename 'parallel_bus_flags' to 'mbus_flags' and set it to vep.bus.mipi_csi2.flags instead of 0
(this follows previous patch of the series)
- when no remote sensor is found, log it with dev_dbg instead of dev_warn


Dafna Hirschfeld (2):
  media: staging: rkisp1: remove mbus field from rkisp1_sensor_async
  media: staging: rkisp1: replace the call to
    v4l2_async_notifier_parse_fwnode_endpoints_by_port

 drivers/staging/media/rkisp1/TODO            |   3 -
 drivers/staging/media/rkisp1/rkisp1-common.h |   3 +-
 drivers/staging/media/rkisp1/rkisp1-dev.c    | 104 ++++++++++---------
 drivers/staging/media/rkisp1/rkisp1-isp.c    |  52 +++-------
 4 files changed, 72 insertions(+), 90 deletions(-)

-- 
2.17.1

