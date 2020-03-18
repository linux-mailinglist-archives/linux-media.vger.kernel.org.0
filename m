Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6432189CF4
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 14:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgCRN1o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 09:27:44 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:31145 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726777AbgCRN1o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 09:27:44 -0400
X-Halon-ID: 2ae76ec9-691c-11ea-9f40-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 2ae76ec9-691c-11ea-9f40-0050569116f7;
        Wed, 18 Mar 2020 14:27:09 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] [DNI] v4l-utils: Add V4L2_CAP_IO_MC to videodev2.h
Date:   Wed, 18 Mar 2020 14:27:21 +0100
Message-Id: <20200318132722.3089925-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318132722.3089925-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200318132722.3089925-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the define from the out of tree patches for V4L2_CAP_IO_MC
capability. This patch is not intended for consumption but to ease
adding tests to v4l2-compliance while IO_MC makes it way into the
media-tree.

Not-yet-Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 include/linux/videodev2.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index 8c5963ee4a677b57..020dd808e60e1b93 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -481,6 +481,8 @@ struct v4l2_capability {
 
 #define V4L2_CAP_TOUCH                  0x10000000  /* Is a touch device */
 
+#define V4L2_CAP_IO_MC			0x20000000  /* Is input/output controlled by the media controller */
+
 #define V4L2_CAP_DEVICE_CAPS            0x80000000  /* sets device capabilities field */
 
 /*
-- 
2.25.0

