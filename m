Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 696C132270B
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 09:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232076AbhBWIWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Feb 2021 03:22:38 -0500
Received: from m12-12.163.com ([220.181.12.12]:45289 "EHLO m12-12.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231827AbhBWIWg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Feb 2021 03:22:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=WkVer
        pXlIp60/ioVyNfOx6vWJcNSG4ZJfb0aQ4sAIwM=; b=SMMFlFLGTX4D5zrKFIec1
        CzwOraC84cT/kb0pxYS9e2LM/6+qcbWIDMh5w+RxXiIe6/brpWxBjh8O9p1am8hS
        7YzWeaGKXLNW1J03G49mI72g1X37k9x1YKGakn2oxd2YtXni/Ggh+IrCUzcKpxEB
        0W2l8MIDaHi6Yp/++c7Ygw=
Received: from COOL-20201222LC.ccdomain.com (unknown [218.94.48.178])
        by smtp8 (Coremail) with SMTP id DMCowAAHrcHZujRgT39qRw--.15652S2;
        Tue, 23 Feb 2021 16:20:43 +0800 (CST)
From:   dingsenjie@163.com
To:     mchehab@kernel.org, hverkuil@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        dingsenjie <dingsenjie@yulong.com>
Subject: [PATCH] media/usb:Remove superfluous "breaks"
Date:   Tue, 23 Feb 2021 16:20:31 +0800
Message-Id: <20210223082031.18096-1-dingsenjie@163.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowAAHrcHZujRgT39qRw--.15652S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF4UCFWfXr1UuF17KrykXwb_yoW8CF1Dpa
        1UC3s0yryDtF15Wr1kXws8CryFkwn2yayYkFZxC3ZYgwn2y3y3XayIkryfuFZ0yayxGr1x
        J3W5WryUJa1xtrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2OJ5UUUUU=
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5glqw25hqmxvi6rwjhhfrp/xtbBRQJCyFPAKJicewABsI
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: dingsenjie <dingsenjie@yulong.com>

Remove superfluous "breaks", as there is a "return" before them.

Signed-off-by: dingsenjie <dingsenjie@yulong.com>
---
 drivers/media/usb/pwc/pwc-if.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/usb/pwc/pwc-if.c b/drivers/media/usb/pwc/pwc-if.c
index 6186963..f48c86c 100644
--- a/drivers/media/usb/pwc/pwc-if.c
+++ b/drivers/media/usb/pwc/pwc-if.c
@@ -857,7 +857,6 @@ static int usb_pwc_probe(struct usb_interface *intf, const struct usb_device_id
 			break;
 		default:
 			return -ENODEV;
-			break;
 		}
 	}
 	else if (vendor_id == 0x069A) {
@@ -869,7 +868,6 @@ static int usb_pwc_probe(struct usb_interface *intf, const struct usb_device_id
 			break;
 		default:
 			return -ENODEV;
-			break;
 		}
 	}
 	else if (vendor_id == 0x046d) {
@@ -928,7 +926,6 @@ static int usb_pwc_probe(struct usb_interface *intf, const struct usb_device_id
 			break;
 		default:
 			return -ENODEV;
-			break;
 		}
 	}
 	else if (vendor_id == 0x055d) {
@@ -954,7 +951,6 @@ static int usb_pwc_probe(struct usb_interface *intf, const struct usb_device_id
 			break;
 		default:
 			return -ENODEV;
-			break;
 		}
 	}
 	else if (vendor_id == 0x041e) {
@@ -973,7 +969,6 @@ static int usb_pwc_probe(struct usb_interface *intf, const struct usb_device_id
 			break;
 		default:
 			return -ENODEV;
-			break;
 		}
 	}
 	else if (vendor_id == 0x04cc) {
@@ -985,7 +980,6 @@ static int usb_pwc_probe(struct usb_interface *intf, const struct usb_device_id
 			break;
 		default:
 			return -ENODEV;
-			break;
 		}
 	}
 	else if (vendor_id == 0x06be) {
@@ -998,7 +992,6 @@ static int usb_pwc_probe(struct usb_interface *intf, const struct usb_device_id
 			break;
 		default:
 			return -ENODEV;
-			break;
 		}
 
 	}
@@ -1016,7 +1009,6 @@ static int usb_pwc_probe(struct usb_interface *intf, const struct usb_device_id
 			break;
 		default:
 			return -ENODEV;
-			break;
 		}
 	}
 	else
-- 
1.9.1


