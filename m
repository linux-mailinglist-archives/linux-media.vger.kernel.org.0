Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E78D744FF59
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 08:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbhKOHsu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 02:48:50 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:16837 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbhKOHsr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 02:48:47 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 1AF7Kprr080859;
        Mon, 15 Nov 2021 15:20:51 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 15 Nov
 2021 15:44:26 +0800
From:   Jammy Huang <jammy_huang@aspeedtech.com>
To:     <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <hverkuil-cisco@xs4all.nl>,
        <sakari.ailus@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/9] add aspeed-jpeg support for aspeed-video
Date:   Mon, 15 Nov 2021 15:44:28 +0800
Message-ID: <20211115074437.28079-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1AF7Kprr080859
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The aim of this series is to add aspeed-jpeg support for aspeed-video
driver.

To achieve this major goal some refactors are included.

In the last, debugfs information is also updated per this change.

Changes in v4:
 - Add definition for the Aspeed JPEG format
 - Reserve controls for ASPEED
 - Use s_fmt to update format rather than new control
 - Update aspeed hq quality range, 1 ~ 12


Jammy Huang (9):
  media: aspeed: move err-handling together to the bottom
  media: aspeed: use v4l2_info/v4l2_warn/v4l2_dbg for log
  media: aspeed: add more debug log messages
  media: aspeed: refactor to gather format/compress settings
  media: v4l: Add definition for the Aspeed JPEG format
  media: v4l2-ctrls: Reserve controls for ASPEED
  media: aspeed: Support aspeed mode to reduce compressed data
  media: aspeed: add comments and macro
  media: aspeed: Extend debug message

 .../media/uapi/v4l/pixfmt-reserved.rst        |  12 +
 drivers/media/platform/aspeed-video.c         | 464 ++++++++++++++----
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/aspeed-video.h             |  15 +
 include/uapi/linux/v4l2-controls.h            |   5 +
 include/uapi/linux/videodev2.h                |   1 +
 6 files changed, 413 insertions(+), 85 deletions(-)
 create mode 100644 include/uapi/linux/aspeed-video.h

-- 
2.25.1

