Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6C7B1364F
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2019 01:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbfECXpU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 May 2019 19:45:20 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44254 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbfECXpU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 May 2019 19:45:20 -0400
Received: by mail-pg1-f194.google.com with SMTP id z16so3439083pgv.11;
        Fri, 03 May 2019 16:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=YwU0rEAoU3W17Opegh7mF+iV9cwzVugNkEFNcWTlMS4=;
        b=N4ls73dujYNHFvMXFxBqEq7JfnVVj/+Nwi1F7ujWUhejmumxykj3wuGRHLGFReW99q
         Z+wBbYIH3LGgGCTyGTzuz5CErGUB5Is4W1dPTGSsC5XD5Mm5istGcnCvCLHBO+LQag/J
         BrMCZhqgwpAQvi7br01ycABkrY/lU6ZG8QuZ3GSDtYQeVEXg8DjrdYzG6kKR+ehc0PFE
         7I8r643XSCYVZOxqzYJ7lKHdghnk86ExnwP2CGFs6qQryj7HT60ir9/lHGABH3i3Jxte
         +jAxUHjnoh0SVLYLgXjHj3ILLXuip7qmogHqaX7ILhizUaKyWRTWw1VZ6KJfRxKU8Pfo
         Tozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=YwU0rEAoU3W17Opegh7mF+iV9cwzVugNkEFNcWTlMS4=;
        b=kYZBDV6oy80hfqlsDFvqxViftxoNI58RlVA1X6qKhpI6xEXO7PhZHV4v/f0qQN2RtJ
         AROJ0bhFdN0qMRCIC7qEriFkalAk/rAbaObKwB0UVn5bbluorJaepyQmCMNdaREWvy1a
         K+PyXZ/RJ73qhUIPpvQrrBlADf/JR808czj81uoMTdXauRMpPwaaQAtXe9GprMOngIWC
         i0Cw1tlhXt4x9/fck3FD+TSGiF/pGnsLb989yrrekgKmwhpUG5cHZu6yJKDJFYKZJFKQ
         KB7k4q7DNW77sN5aIJyUebYgyMcImCi6VQ9aD5MBtlBd7eX/VWD4IDmpB7bPCo6KjgNB
         w9Ow==
X-Gm-Message-State: APjAAAUfPCvIP6La7LhkR1fSC6Bshh+AcseCeRNnLuv/wacoK4im96fv
        D1vT4YdVJvDCzxRNLMmEx6UH4fRa
X-Google-Smtp-Source: APXvYqxrXFp43Iis9R2K9Ny+WO/pkUJ5leYbrRI3UnraGRuqllaEvG0ru5TSKh2jIdtNSHP7WnA48Q==
X-Received: by 2002:a63:5f42:: with SMTP id t63mr14176377pgb.275.1556927118425;
        Fri, 03 May 2019 16:45:18 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id z9sm3861582pga.92.2019.05.03.16.45.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 16:45:17 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] [media] docs-rst: Clarify older field vs. first transmitted field
Date:   Fri,  3 May 2019 16:45:07 -0700
Message-Id: <20190503234508.23183-1-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a paragraph to make it more clear that video equipment will transmit
fields in the same order the fields were captured, and replace some of
the "is transmitted first" language with "is the older field", since the
latter is the important info for motion compensation applications.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 Documentation/media/uapi/v4l/field-order.rst | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/Documentation/media/uapi/v4l/field-order.rst b/Documentation/media/uapi/v4l/field-order.rst
index 3fb473e3b8e2..19d13ecde1d7 100644
--- a/Documentation/media/uapi/v4l/field-order.rst
+++ b/Documentation/media/uapi/v4l/field-order.rst
@@ -51,6 +51,11 @@ determined by the video standard. Hence the distinction between temporal
 and spatial order of fields. The diagrams below should make this
 clearer.
 
+In V4L it is assumed that all video cameras transmit fields on the media
+bus in the same order they were captured, so if the top field was
+captured first (is the older field), the top field is also transmitted
+first on the bus.
+
 All video capture and output devices must report the current field
 order. Some drivers may permit the selection of a different order, to
 this end applications initialize the ``field`` field of struct
@@ -103,10 +108,10 @@ enum v4l2_field
     * - ``V4L2_FIELD_INTERLACED``
       - 4
       - Images contain both fields, interleaved line by line. The temporal
-	order of the fields (whether the top or bottom field is first
-	transmitted) depends on the current video standard. M/NTSC
-	transmits the bottom field first, all other standards the top
-	field first.
+	order of the fields (whether the top or bottom field is older)
+	depends on the current video standard. In M/NTSC the bottom
+	field is the older field. In all other standards the top field
+	is the older field.
     * - ``V4L2_FIELD_SEQ_TB``
       - 5
       - Images contain both fields, the top field lines are stored first
@@ -137,11 +142,11 @@ enum v4l2_field
     * - ``V4L2_FIELD_INTERLACED_TB``
       - 8
       - Images contain both fields, interleaved line by line, top field
-	first. The top field is transmitted first.
+	first. The top field is the older field.
     * - ``V4L2_FIELD_INTERLACED_BT``
       - 9
       - Images contain both fields, interleaved line by line, top field
-	first. The bottom field is transmitted first.
+	first. The bottom field is the older field.
 
 
 
-- 
2.17.1

