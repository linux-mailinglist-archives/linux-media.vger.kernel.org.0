Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F65639585C
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 11:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbhEaJrc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 05:47:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:56116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231182AbhEaJra (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 05:47:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1776C611AC;
        Mon, 31 May 2021 09:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622454351;
        bh=04+wAH7j3nqUMel0heO+GqGanLbRhs52MofR9BwnKwQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aTjF5Bdp2vpHbSrbdQKW62blI0c9BUktXqBLFSMz4kZQIc1ifWWN2InIs92ttmMCf
         rW1wq2teFiWvrC1s9wNLQK5FHRcBm1RT5cFdhXAv3Nqhr7rcaALLBvbD6A6xIRLJJy
         hsh1nJD4SbSHHNsB0a1Mehn0iFpShR+CQhOdYTYkp8H/w94oqcBppF/O9N9z+GVC0U
         1LGjzWNfaZJ4dLprS8+be+ahwPSeHpc1FkKXm3BptmRauKRKR3DJCD2qmoaZutq6rS
         miRyt9skglrdmcWQ1/h0PyGJYDMwGC4g7khAoM/om1FHjyAiNRIOg3Go+3goFKd60D
         +Vv2WfOAwiX/w==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lneUU-0003JL-8I; Mon, 31 May 2021 11:45:46 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Eero Lehtinen <debiangamer2@gmail.com>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 1/3] media: gspca/gl860: fix zero-length control requests
Date:   Mon, 31 May 2021 11:44:32 +0200
Message-Id: <20210531094434.12651-2-johan@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531094434.12651-1-johan@kernel.org>
References: <20210531094434.12651-1-johan@kernel.org>
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
2.31.1

