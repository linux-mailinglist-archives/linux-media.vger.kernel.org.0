Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 407CA199DB5
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 20:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgCaSG6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 14:06:58 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48324 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgCaSG6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 14:06:58 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:1140:6758:982b:112f:3e03:c20d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6C5A7293D6E;
        Tue, 31 Mar 2020 19:06:56 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        dave.stevenson@raspberrypi.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com
Subject: [PATCH] media: i2c: imx219: Fix a bug in imx219_enum_frame_size
Date:   Tue, 31 Mar 2020 20:06:30 +0200
Message-Id: <20200331180630.5703-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When enumerating the frame sizes, the value sent to
imx219_get_format_code should be fse->code
(the code from the ioctl) and not imx219->fmt.code
which is the code set currently in the driver.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/i2c/imx219.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index b1f30debe449..df2a6ed7c8ac 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -781,7 +781,7 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
 
-	if (fse->code != imx219_get_format_code(imx219, imx219->fmt.code))
+	if (fse->code != imx219_get_format_code(imx219, fse->code))
 		return -EINVAL;
 
 	fse->min_width = supported_modes[fse->index].width;
-- 
2.17.1

