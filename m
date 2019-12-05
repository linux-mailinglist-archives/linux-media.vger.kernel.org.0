Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 610D9114340
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 16:07:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729574AbfLEPHp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 10:07:45 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:37741 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729489AbfLEPHp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Dec 2019 10:07:45 -0500
Received: from [IPv6:2001:420:44c1:2577:fdbd:26bf:13c5:f58c]
 ([IPv6:2001:420:44c1:2577:fdbd:26bf:13c5:f58c])
        by smtp-cloud8.xs4all.net with ESMTPA
        id csjDi1FBL85rjcsjHi8RA9; Thu, 05 Dec 2019 16:07:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1575558463; bh=aaJEpybqJfOMuUGZNBFpVfMFecC8QGdOyQGmzRexwkk=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tLn6B8kI/U97mgKbRQQGk9NLfky0l3GXOnkWRcEARvfpqdFQ9rbkBYpWQM9yR8QVo
         t4MT4G6PQn15WTYIIKjJy0RDmx3FF48HRcHk78Xp0XnX/QmR128r11qAD4PNGSQPs/
         F1dKEfqdtHTgJcbry6iUfhOknNNgyG4G1NJ9c3yTPyX5lR+qMS5eOLZllNCGHrOVkS
         0xCRoUXhGAvGfZ3O2fc/nJ1XRfnMsF5dksulqwGzrDgytSrydobRUPnfpzzBkmwf6p
         AwowG4OEWyzbIsKEef2D4iycA+1oZtxnHq0bI1N8p5EWiZljuK3j4F7nWUbkWa7Wvg
         io/ysrRxKsx6A==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] cec-ioc-g-mode.rst: remove trailing 'i'
Message-ID: <b9993eba-cc70-771e-6238-aa24eeff6252@xs4all.nl>
Date:   Thu, 5 Dec 2019 16:07:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLhBmWP3x9ZWzkdw29u2tt68hefA6jETAFbp1KWocEigpdo8ddwlIKiB6zLvwiMc0Z7Lt9GgFufMhgtStK/YcLb7Rvk58CFBNkxV17bjljuxrUHMDaGa
 z4s030P2X/vpNrBgFzw00ZpVU4ZHGcZNh0uzfPmQFkXYqSr3+0oJBKLZQxv3rQAFcmye64fW1RFbOSzjM842TlR3QnJ/AaXDg0fjhRAKALMWxkQdfFkotuyP
 phkw+8fvgm9OlUohHil52Un8ELMZR5+ZBZhxbwA/LnLAB1zTWiLwrkghTuclbaat
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove spurious trailing 'i'.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/Documentation/media/uapi/cec/cec-ioc-g-mode.rst b/Documentation/media/uapi/cec/cec-ioc-g-mode.rst
index d0902f356d65..2535b77e3459 100644
--- a/Documentation/media/uapi/cec/cec-ioc-g-mode.rst
+++ b/Documentation/media/uapi/cec/cec-ioc-g-mode.rst
@@ -177,7 +177,7 @@ Available follower modes are:
       - ``CEC_MODE_MONITOR``
       - 0xe0
       - Put the file descriptor into monitor mode. Can only be used in
-	combination with :ref:`CEC_MODE_NO_INITIATOR <CEC-MODE-NO-INITIATOR>`,i
+	combination with :ref:`CEC_MODE_NO_INITIATOR <CEC-MODE-NO-INITIATOR>`,
 	otherwise the ``EINVAL`` error code will be returned.
 	In monitor mode all messages this CEC
 	device transmits and all messages it receives (both broadcast
