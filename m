Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A62EA126C85
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 20:04:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729469AbfLSSr3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 13:47:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:40352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727897AbfLSSr2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 13:47:28 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 608B5206D7;
        Thu, 19 Dec 2019 18:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576781247;
        bh=3K4N9OE0RaryNp4KTlU4FXDaW7UdwQ7b4wXkp9IHSQQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YzBqfSdLlQ7Anlqif0sYhL6I2rea6sCwEOd9TlhCbhZTr75YDTBdv7H24YNOKIqlH
         4/pk2DyKxoW8g4VFbdADSq+dW/ecgOQFHs6OB96v+TEiJM3ZTvBASA7mxOU7yhwkCZ
         tNp0c0R75rhf8dOL24GYM4nmlBMoArerKBvCuvcI=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, linux-media@vger.kernel.org,
        Martin Bugge <marbugge@cisco.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thierry Reding <treding@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>
Subject: [PATCH 4.9 143/199] video/hdmi: Fix AVI bar unpack
Date:   Thu, 19 Dec 2019 19:33:45 +0100
Message-Id: <20191219183223.107627157@linuxfoundation.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219183214.629503389@linuxfoundation.org>
References: <20191219183214.629503389@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

commit 6039f37dd6b76641198e290f26b31c475248f567 upstream.

The bar values are little endian, not big endian. The pack
function did it right but the unpack got it wrong. Fix it.

Cc: stable@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: Martin Bugge <marbugge@cisco.com>
Cc: Hans Verkuil <hans.verkuil@cisco.com>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Fixes: 2c676f378edb ("[media] hdmi: added unpack and logging functions for InfoFrames")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20190919132853.30954-1-ville.syrjala@linux.intel.com
Reviewed-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/video/hdmi.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- a/drivers/video/hdmi.c
+++ b/drivers/video/hdmi.c
@@ -1032,12 +1032,12 @@ static int hdmi_avi_infoframe_unpack(str
 	if (ptr[0] & 0x10)
 		frame->active_aspect = ptr[1] & 0xf;
 	if (ptr[0] & 0x8) {
-		frame->top_bar = (ptr[5] << 8) + ptr[6];
-		frame->bottom_bar = (ptr[7] << 8) + ptr[8];
+		frame->top_bar = (ptr[6] << 8) | ptr[5];
+		frame->bottom_bar = (ptr[8] << 8) | ptr[7];
 	}
 	if (ptr[0] & 0x4) {
-		frame->left_bar = (ptr[9] << 8) + ptr[10];
-		frame->right_bar = (ptr[11] << 8) + ptr[12];
+		frame->left_bar = (ptr[10] << 8) | ptr[9];
+		frame->right_bar = (ptr[12] << 8) | ptr[11];
 	}
 	frame->scan_mode = ptr[0] & 0x3;
 


