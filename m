Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70EE630A379
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 09:42:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232290AbhBAIlm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 03:41:42 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:45187 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230215AbhBAIlm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 03:41:42 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6UlUluI7Cefbk6UlYlfjMZ; Mon, 01 Feb 2021 09:41:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612168860; bh=Mrq5nhUH3mPozIgbsd41folik7YKycFqHNUXBxmDFf0=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=PmdaCN+qgWYvDKiavfkCSjB4Pb0tOEiXKxsN7+cpLFOK9j7doHOKk0ZUhvxaxvt9B
         rxdStUsRwK26iybtoWilM6rLhvXytaswZ+7Swl0aAWZTnhNiQJKHkN1pFxibgk/oon
         Nz7pqPdzaTHb+P+ol5tDcKf+3ZRlraX0iuYWhLFmd09+mo7xuEuu9y9s2MfHmJ+Du8
         0oM5KnnhcngkGRsEfdSVg0bQVpMM5wnipYHl5cudSIXSjTKaO3Wx5UHpZuGQhRtVsR
         3Rcc3tnvnYxaMSWQ8HlEkfsBWZCKdorfBsjTuk+4er6L7gvBRzpk0gtgD8wHABhsAn
         QIHCZx8LouI4w==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH resend] uvc: strncpy -> strscpy
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <4ecb8867-6678-aa1a-3d86-65f815d34f5b@xs4all.nl>
Date:   Mon, 1 Feb 2021 09:40:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDevxaPhfchkxOfNzkdZq5TsGKHVi4armuARcBTRYbcJ78q7zpVmYDX1KUbdzCVJx4XJ4I7jGYi5Ux9QPPSFC5JukDkFgDjgF1MJbrH8wC7JcPkoVCMx
 z90Qewt2oyzJIYJvu+MR1gTE2ITsOGV9RVqbY0HphU7U8Lhm15b4nIfLT9wyKR+bx1H5kJ4m1gDocARJSDdalx9vka8dJdnL1XBpn1VHlHyKUY0/VN4v0Z4Z
 fGcyy7y7NMNFyaZPTrN9dw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The use of strncpy is discouraged, use strscpy instead.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 1abc122a0977..30ef2a3110f7 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1553,7 +1553,7 @@ static int uvc_gpio_parse(struct uvc_device *dev)
 	unit->gpio.bmControls[0] = 1;
 	unit->get_cur = uvc_gpio_get_cur;
 	unit->get_info = uvc_gpio_get_info;
-	strncpy(unit->name, "GPIO", sizeof(unit->name) - 1);
+	strscpy(unit->name, "GPIO", sizeof(unit->name));

 	list_add_tail(&unit->list, &dev->entities);

