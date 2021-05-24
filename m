Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52B4538E504
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 13:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232792AbhEXLLT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 07:11:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:36652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232728AbhEXLLK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 07:11:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D6DE6120E;
        Mon, 24 May 2021 11:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621854581;
        bh=i4o9pM1TO4UbXp2eyfjZ3b0JJ10hVOg6gx1op1DjUOE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fNbZ+fIe83UGwa0r1jyRRXpxE/ZXt69KNUQHtGUvzOtNdxPqqoT6pBUz3Ev4ePOwc
         Gq6H789irbR9WaeiOpLAd9sHz3FczWjIEz9kAKPwXw39AHWxqNUI92rUCDDQiwn2Ey
         ic/JsMvWsZ09zwAOahHcinNfI4MbVrQgGt56fOJJH3O+4wEdbyAxxMLBg3xeLS8clF
         Ql7BgFDQaBQOiIusBRO7FlDHIBp/LmtNzeL+ZvI4LnPl1Vhsg2g7q+H4WKirIjQjTm
         L+c14I8QAbfDHhHKpY0HhLMPvTlQ2STeToyuVXqPosz/1pIOSh8wSpQm7csgkbasYm
         YUPfPOw1Dd6fA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ll8Sp-0006Pp-BJ; Mon, 24 May 2021 13:09:39 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/3] media: gspca/gl860: fix zero-length control requests
Date:   Mon, 24 May 2021 13:09:18 +0200
Message-Id: <20210524110920.24599-2-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210524110920.24599-1-johan@kernel.org>
References: <20210524110920.24599-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The direction of the pipe argument must match the request-type direction
bit or control requests may fail depending on the host-controller-driver
implementation.

Control transfers without a data stage are treated as OUT requests by
the USB stack and should be using usb_sndctrlpipe(). Failing to do so
will now trigger a warning.

Fix the gl860_RTx() helper so that zero-length control reads fail with
an error message instead. Note that there are no current callers that
would trigger this.

Fixes: 4f7cb8837cec ("V4L/DVB (12954): gspca - gl860: Addition of GL860 based webcams")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/usb/gspca/gl860/gl860.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/gspca/gl860/gl860.c b/drivers/media/usb/gspca/gl860/gl860.c
index 2c05ea2598e7..ce4ee8bc75c8 100644
--- a/drivers/media/usb/gspca/gl860/gl860.c
+++ b/drivers/media/usb/gspca/gl860/gl860.c
@@ -561,8 +561,8 @@ int gl860_RTx(struct gspca_dev *gspca_dev,
 					len, 400 + 200 * (len > 1));
 			memcpy(pdata, gspca_dev->usb_buf, len);
 		} else {
-			r = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
-					req, pref, val, index, NULL, len, 400);
+			gspca_err(gspca_dev, "zero-length read request\n");
+			r = -EINVAL;
 		}
 	}
 
-- 
2.26.3

