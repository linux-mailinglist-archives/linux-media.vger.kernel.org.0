Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8E8D344077
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 13:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbhCVMHM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 08:07:12 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:38257 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230401AbhCVMGr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 08:06:47 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id OJKVlveJw4XAGOJKYlXSx5; Mon, 22 Mar 2021 13:06:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616414806; bh=oaWcgndUGYFX/tlxdj3aYZOEqtXO+yT7nz5z9J4uRwg=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=h/zKwox6DhhK/400Y/55HO7hSUMWNmjmmzgjxo72VrYBGYvj9P2tjIgyi+KCbBtfK
         3ZqHPsHTI/yyyWLsVJTkgBFN9rpTWzudjYST9WEomdV2kL9DUseXGMYbfZ6XfPfHlK
         1TICo7/OZghgourrCKIR5yckvEGGQsRnNM5C3tXtaR/1dsTqYeWZj+9KthNEQ7wrEn
         2mZZfjVZj4wi1fZMerSpyQPDGi4kaMst3a7SYG7sNIdisSkofX8Tk+I/LbKD4xWqqK
         CKpYP6YBdiHtKseFuhKrY9FYXD8FvqOwFpz02150cPn0X6lyULCMD0dzY5KaGIiLGt
         GbTeZQy0s6ZeA==
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] uvcvideo: don't spam the log in uvc_ctrl_restore_values()
Message-ID: <8a546e6a-4da8-078a-0070-e03b673b255e@xs4all.nl>
Date:   Mon, 22 Mar 2021 13:06:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBJKJqNDTYIHU1gPBpFCsIwcqcCElr/NnbwfbkaBhf74DHodOc029kY5dSB0PzY+H2FfVZuiUKezysmanbb2cBXVmA55lM3MqDJTag9mSl3Qo4OXKxkm
 Q7naQj6KQurtYRHfgfn2lNj+WnuekxntXNZn9lmk3+gM6DwEV3oW/G2JhMqx6rbY7glqlM3jzCbjaKWeNdB/yA7eFchbvqxM64zUrRmyDvSwx0rkuwy++I/u
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Don't report the restored controls with dev_info, use dev_dbg instead.
This prevents a lot of noise in the kernel log.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
And one more for your series...
---
 drivers/media/usb/uvc/uvc_ctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 6e7b904bc33d..df6c33932557 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2182,10 +2182,10 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
 			if (!ctrl->initialized || !ctrl->modified ||
 			    (ctrl->info.flags & UVC_CTRL_FLAG_RESTORE) == 0)
 				continue;
-			dev_info(&dev->udev->dev,
-				 "restoring control %pUl/%u/%u\n",
-				 ctrl->info.entity, ctrl->info.index,
-				 ctrl->info.selector);
+			dev_dbg(&dev->udev->dev,
+				"restoring control %pUl/%u/%u\n",
+				ctrl->info.entity, ctrl->info.index,
+				ctrl->info.selector);
 			ctrl->dirty = 1;
 		}

-- 
2.30.0

