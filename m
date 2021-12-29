Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6164810BF
	for <lists+linux-media@lfdr.de>; Wed, 29 Dec 2021 08:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbhL2Hnp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Dec 2021 02:43:45 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56322 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhL2Hno (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Dec 2021 02:43:44 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AE24464;
        Wed, 29 Dec 2021 08:43:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1640763823;
        bh=geFSxZy6geOUEHcSTNfDKmcsBEeNYZiD0SAcGycGlUE=;
        h=From:To:Cc:Subject:Date:From;
        b=ZyWZJLyvYAFtMw8ZJiA50A4G/xX0lkIQWjfLQJ/thikT/rNcw+K+yBoFsHPbij8ne
         hyCvtc8/70bOToqoDd6BrUUvZh/Pwo9aLK+E1qY3W4Hck6VLsPMXiO2PKBPdagNJrE
         r2LOchBegVgyyMo7k9rBphrOB1i8S+VQ+ctSzxHI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Vedant Paranjape <vedantparanjape160201@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] v4l2-ctl: Operate on output device if specified
Date:   Wed, 29 Dec 2021 09:43:38 +0200
Message-Id: <20211229074338.7505-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The video output get, set and list options operate on the device set by
--device, even if the --out-device option is specified to select a
different output device. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 utils/v4l2-ctl/v4l2-ctl.cpp | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
index 764a7c716159..1c433355c17b 100644
--- a/utils/v4l2-ctl/v4l2-ctl.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl.cpp
@@ -1471,7 +1471,7 @@ int main(int argc, char **argv)
 	io_set(c_fd);
 	stds_set(c_fd);
 	vidcap_set(c_fd);
-	vidout_set(c_fd);
+	vidout_set(out_device ? c_out_fd : c_fd);
 	overlay_set(c_fd);
 	vbi_set(c_fd);
 	sdr_set(c_fd);
@@ -1488,7 +1488,7 @@ int main(int argc, char **argv)
 	io_get(c_fd);
 	stds_get(c_fd);
 	vidcap_get(c_fd);
-	vidout_get(c_fd);
+	vidout_get(out_device ? c_out_fd : c_fd);
 	overlay_get(c_fd);
 	vbi_get(c_fd);
 	sdr_get(c_fd);
@@ -1504,7 +1504,7 @@ int main(int argc, char **argv)
 	io_list(c_fd);
 	stds_list(c_fd);
 	vidcap_list(c_fd);
-	vidout_list(c_fd);
+	vidout_list(out_device ? c_out_fd : c_fd);
 	overlay_list(c_fd);
 	vbi_list(c_fd);
 	sdr_list(c_fd);
-- 
Regards,

Laurent Pinchart

