Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8993EC873
	for <lists+linux-media@lfdr.de>; Sun, 15 Aug 2021 11:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236837AbhHOJuH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Aug 2021 05:50:07 -0400
Received: from m12-14.163.com ([220.181.12.14]:59052 "EHLO m12-14.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232507AbhHOJuG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Aug 2021 05:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=j4Ctu
        fsCUUXVndQoU5TT3EhFbHd1YiPF+jmPmLtqC/Q=; b=WU0Fo5t+Wkq9Q0Lf+HEWO
        AfOvXuuV4lo8wkS3zpCgUvb4qckhO1I4jLT3BoH31ksYLagjp5qVmhrWEtXf1r0V
        4IX8+KZI6VQvbBRXHr5sUvCfTiXkAzFjFutUsEraytMRofZgpK7hbpojm3AfmBAE
        F3T2UDNVzg043zf340dIoU=
Received: from nilus-desk (unknown [120.229.1.29])
        by smtp10 (Coremail) with SMTP id DsCowAD3Utcj4xhhQQShCA--.13269S3;
        Sun, 15 Aug 2021 17:49:24 +0800 (CST)
Date:   Sun, 15 Aug 2021 17:49:23 +0800
From:   Nil Yi <teroincn@163.com>
To:     crope@iki.fi, linux-media@vger.kernel.org
Subject: [PATCH] media: usb: airspy: clean the freed pointer and counter
Message-ID: <20210815094923.GA70558@nilus-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CM-TRANSID: DsCowAD3Utcj4xhhQQShCA--.13269S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw1UXr1rur4xAr47tFWrZrb_yoW3trc_GF
        1ruwn7Wr1UWF1rJr1jkr1IyrWvy3yfXw4IkFyrt343Jr10yws0yr4DZ34kJanrXFnF9r95
        JrnIgF13Crn3GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8XVy7UUUUU==
X-Originating-IP: [120.229.1.29]
X-CM-SenderInfo: 5whu0xxqfqqiywtou0bp/1tbiSgbvElPAPaDsbgABs8
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After urb was freed, the pointer and counter need to be
cleaned.

Signed-off-by: Nil Yi <teroincn@163.com>
---
 drivers/media/usb/airspy/airspy.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index 7a81be797..d56845261 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -415,8 +415,11 @@ static int airspy_alloc_urbs(struct airspy *s)
 		dev_dbg(s->dev, "alloc urb=%d\n", i);
 		s->urb_list[i] = usb_alloc_urb(0, GFP_ATOMIC);
 		if (!s->urb_list[i]) {
-			for (j = 0; j < i; j++)
+			for (j = 0; j < i; j++) {
 				usb_free_urb(s->urb_list[j]);
+				s->urb_list[j] = NULL;
+			}
+			s->urbs_initialized = 0;
 			return -ENOMEM;
 		}
 		usb_fill_bulk_urb(s->urb_list[i],
-- 
2.17.1

