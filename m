Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68713287ECC
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 00:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730599AbgJHWub (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 18:50:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:39352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbgJHWub (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Oct 2020 18:50:31 -0400
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C3A822247;
        Thu,  8 Oct 2020 22:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602197430;
        bh=vE/jOrsh2d0Vmbyb+yROgHAw1ECxmWXhlG+9om1RoSI=;
        h=Date:From:To:Cc:Subject:From;
        b=El0N/7HA5rfubB/G899U+dZau0juBBLYbdVGd0h/4z+HWNalGuFzpPflM0XUHxkxL
         B+Bxtibtm2wRsGXQYuoR5l5GfOcMltDcjgCbtGeLiSBGLCic0kN2E9XnoNYzAkFm0i
         1gLkYaZitkQnH7svYUOT6m+piYH2CEugqxknSEaE=
Date:   Thu, 8 Oct 2020 17:55:53 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org
Subject: [PATCH][next] media: pxa_camera: Use fallthrough pseudo-keyword
Message-ID: <20201008225553.GA14597@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to enable -Wimplicit-fallthrough for Clang[1], replace the
existing /* fall through  */ comments with the new pseudo-keyword
macro fallthrough[2].

[1] https://git.kernel.org/linus/e2079e93f562c7f7a030eb7642017ee5eabaaa10
[2] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/media/platform/pxa_camera.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index e47520fcb93c..b664ce7558a1 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -1256,7 +1256,7 @@ static void pxa_camera_setup_cicr(struct pxa_camera_dev *pcdev,
 		 * transformation. Note that UYVY is the only format that
 		 * should be used if pxa framebuffer Overlay2 is used.
 		 */
-		/* fall through */
+		fallthrough;
 	case V4L2_PIX_FMT_UYVY:
 	case V4L2_PIX_FMT_VYUY:
 	case V4L2_PIX_FMT_YUYV:
@@ -1667,7 +1667,7 @@ static int pxa_camera_get_formats(struct v4l2_device *v4l2_dev,
 				"Providing format %s using code %d\n",
 				pxa_camera_formats[0].name, code.code);
 		}
-	/* fall through */
+		fallthrough;
 	case MEDIA_BUS_FMT_VYUY8_2X8:
 	case MEDIA_BUS_FMT_YUYV8_2X8:
 	case MEDIA_BUS_FMT_YVYU8_2X8:
-- 
2.27.0

