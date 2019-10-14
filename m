Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D42EED5DA9
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 10:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730476AbfJNIkZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 04:40:25 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:45979 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730434AbfJNIkY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 04:40:24 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:9cd4:edb1:3831:f13d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id JvttiFYwLop0AJvtuidA9a; Mon, 14 Oct 2019 10:40:23 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Vandana BN <bnvandana@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCHv6 0/3] v4l2-core: improve ioctl validation
Date:   Mon, 14 Oct 2019 10:40:18 +0200
Message-Id: <20191014084021.54191-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOnlyq0tdyyrSuYq9vwWwT4k7/AVO6IDySEVaLcV39siTm/bJYQm/bza7AUVwOFfFTASJbOkOjZgC9oIp1QA+szmM4FV9zkQ3e3GAUHHgC/WeHBTZaTy
 Th1pbYomE9XBps1WyF1xHxU/cLZalEn8BVWBoyXaSrwD2FeJSaZED7h8lQN0C222pZcz4p/Lc7QV0fEqJ7d99c49BJ3UbJGbb/8OLG4Wsp+0dmE/PxN4buLQ
 X2Fo0tv5KLBQjssNKFPs/XwDPflyGJZf7AG7UZWVYf/7mCgTYejCgUFzPSJFCvC8rw8BeRV9xoiPEPJXkvveI8DddFz/zzbX+i1qKJ0qHWFA8LjVc8n4PUG3
 ccXIIqV6M15xVV5zkNUSCgpuUCM57w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This supersedes https://www.mail-archive.com/linux-media@vger.kernel.org/msg150027.html
based on feedback from Laurent:

https://www.mail-archive.com/linux-media@vger.kernel.org/msg150117.html

and Sakari:

https://www.mail-archive.com/linux-media@vger.kernel.org/msg150129.html

This v6 only moves some code from patch 1 to patch 3, the final code
is the same as for v5. I plan to make a PR for this very soon together
with the vivid metadata patches that need this.

Regards,

	Hans

Changes in v6:

Patch 1/3 dropped the check against GRABBER for the g_parm ioctl,
but that is too early: this should be done in patch 3/3 where this
code no longer applies to touch devices (which was the reason for
the GRABBER test).

Changes in v5:

I now check if a GRABBER device is a video or metadata device
(or both!) by checking device_caps.


Hans Verkuil (2):
  v4l2-dev: simplify the SDR checks
  v4l2-dev: fix is_tch checks

Vandana BN (1):
  v4l2-core: correctly validate video and metadata ioctls

 drivers/media/v4l2-core/v4l2-dev.c   | 104 ++++++++++++++++-----------
 drivers/media/v4l2-core/v4l2-ioctl.c |  16 ++++-
 2 files changed, 75 insertions(+), 45 deletions(-)

-- 
2.23.0

