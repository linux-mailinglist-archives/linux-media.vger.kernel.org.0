Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE80155418
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2020 10:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbgBGJAG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Feb 2020 04:00:06 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50422 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbgBGJAG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Feb 2020 04:00:06 -0500
Received: from localhost.localdomain (p200300CB87166A00301E621E2266094E.dip0.t-ipconnect.de [IPv6:2003:cb:8716:6a00:301e:621e:2266:94e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 468AE295A80;
        Fri,  7 Feb 2020 09:00:04 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
Subject: [PATCH 0/4] media: staging: rkisp1: add serialization to the isp and resizer ops
Date:   Fri,  7 Feb 2020 09:59:47 +0100
Message-Id: <20200207085951.5226-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Subdevices' ops callbacks can be called either through uAPI with
ioctl or through kAPI with the v4l2_subdev_call macro. Therefore
the lock of the subdevice node is not set and instead the driver
itself is responsible for serializing the ops.
This patchset adds serialization to the isp and resizer subdevices.
A mutex field 'ops_lock' is added to the inner struct of each of them.

The ops_lock is then used in the following operations:

set_fmt, get_fmt, set_selection, get_selection, s_stream

Serialization for enum_mbus_code is not needed since this operation
is independent of the specific configuration.

Patches summary:

patch 1 Changes two functions that return int to return void
        and removes a redundant check of error since the functions don't fail.

patch 2 moves the check that the bus type is DPHY before initializing registers
        in the s_stream callback of the isp.

patch 3 adds serialization for the isp subdevice.

patch 4 adds serialization for the resizer subdevice.


Dafna Hirschfeld (4):
  media: staging: rkisp1: change function to return void instead of int
  media: staging: rkisp1: isp: check for dphy bus before initializations
    in s_stream
  media: staging: rkisp1: add serialization to the isp subdev ops
  media: staging: rkisp1: add serialization to the resizer subdev ops

 drivers/staging/media/rkisp1/rkisp1-common.h  |  3 ++
 drivers/staging/media/rkisp1/rkisp1-isp.c     | 51 ++++++++++---------
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 16 +++++-
 3 files changed, 45 insertions(+), 25 deletions(-)

-- 
2.17.1

