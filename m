Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2EA10A26E
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 17:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbfKZQsn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 11:48:43 -0500
Received: from mail-qv1-f67.google.com ([209.85.219.67]:43016 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727532AbfKZQsm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 11:48:42 -0500
Received: by mail-qv1-f67.google.com with SMTP id cg2so7550095qvb.10
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2019 08:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H+zPkA8+xnxZt5YlzMia4m3XjGDeqnWO3gTXHV1iMw8=;
        b=W1vVEnMAfoWOr9tfIE4OO7WOdRBMvYJr1iYrardHluig0uJv5ZiQhcgVfJ3jvNvIZn
         5kq0zjR2/vxZonoHZQVDPtM4lUJp4HOZHu0tnX8UuXvpVV56VDkDVEefvhcqjRWoqlH+
         etupSk6HtmMFYihC1R1e70per9jH8vSzZ/2wc1M4miC+8HvX2AwZF/seoaRNhElD8NKA
         Tvxihiz+wMGJxqwlQsZgLnb5N1KqAHj6VU5oxSVt5eRJvtXyeVlIKITU2YRT6J62NWET
         DoiM4OKNeA9coOEkNFgB/aH1l7GxvjMWgL/wOTyDHmseVIyr5y+4a1JpRi+5sgaAX1Ty
         h76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H+zPkA8+xnxZt5YlzMia4m3XjGDeqnWO3gTXHV1iMw8=;
        b=ThwSrwZOeaK3EW2amm2ehsZPk6ZPWhT5IHR64spSvxUp2BPB2vCl6vWwe0IOyF4BJD
         jv0sBCCJhm8EvbWrxH0K0EuY1O/HtCoK8np8yxuHl/afrHhlJkig/wo558LD+MUtzasY
         irbkN6usMzof3/+3Ak87o7gZLnEIxeeSEcQ7Sn6hMyjvsH8yJLMx6sdxju+Wm2RiUlj6
         4/u8sS8Ubs3d1SPW94/cvuXye57KZxKnfL4pcfPWP/yN/s0t3pwrTKhGJXlWf/+xyGtg
         b+gjP5wo+DK1U0MB1s/UXknZyaw2vwr9NIlQ7T4PZPTlKIHmhOCojH04C4prcqV8iTDT
         u94w==
X-Gm-Message-State: APjAAAVbzOaD8sNt1MOnRqCkWuNASQJ0sLQogo2daeZSjExuBYYynprZ
        Wb5SkYoYa0iM/RjIx0iJbpU=
X-Google-Smtp-Source: APXvYqzLtSh3CFHeSjcjesN7FVQ5aF0i3rYiD9rP9xs+OmFmlzVG5T/rlkNfe2f+aPpLGoxvpDF2+w==
X-Received: by 2002:a0c:f114:: with SMTP id i20mr34101622qvl.167.1574786921642;
        Tue, 26 Nov 2019 08:48:41 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id e5sm5936362qtq.29.2019.11.26.08.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 08:48:41 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     mchehab@kernel.org, p.zabel@pengutronix.de
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org
Subject: [PATCH] Documentation: media: dtv-frontend.rst: fix a few minor typos
Date:   Tue, 26 Nov 2019 13:40:51 -0300
Message-Id: <20191126164051.39920-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Fix a few minor typos throughout the document without changing the
meaning of the sentences.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/media/kapi/dtv-frontend.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/media/kapi/dtv-frontend.rst b/Documentation/media/kapi/dtv-frontend.rst
index fbc5517c8d5a..b362109bb131 100644
--- a/Documentation/media/kapi/dtv-frontend.rst
+++ b/Documentation/media/kapi/dtv-frontend.rst
@@ -15,8 +15,8 @@ The header file for this API is named ``dvb_frontend.h`` and located in
 Demodulator driver
 ^^^^^^^^^^^^^^^^^^
 
-The demodulator driver is responsible to talk with the decoding part of the
-hardware. Such driver should implement :c:type:`dvb_frontend_ops`, with
+The demodulator driver is responsible for talking with the decoding part of the
+hardware. Such driver should implement :c:type:`dvb_frontend_ops`, which
 tells what type of digital TV standards are supported, and points to a
 series of functions that allow the DVB core to command the hardware via
 the code under ``include/media/dvb_frontend.c``.
@@ -120,7 +120,7 @@ Satellite TV reception is::
 
 .. |delta|   unicode:: U+00394
 
-The ``include/media/dvb_frontend.c`` has a kernel thread with is
+The ``include/media/dvb_frontend.c`` has a kernel thread which is
 responsible for tuning the device. It supports multiple algorithms to
 detect a channel, as defined at enum :c:func:`dvbfe_algo`.
 
@@ -220,11 +220,11 @@ Signal strength (:ref:`DTV-STAT-SIGNAL-STRENGTH`)
   - As the gain is visible through the set of registers that adjust the gain,
     typically, this statistics is always available [#f3]_.
 
-  - Drivers should try to make it available all the times, as this statistics
+  - Drivers should try to make it available all the times, as these statistics
     can be used when adjusting an antenna position and to check for troubles
     at the cabling.
 
-  .. [#f3] On a few devices, the gain keeps floating if no carrier.
+  .. [#f3] On a few devices, the gain keeps floating if there is no carrier.
      On such devices, strength report should check first if carrier is
      detected at the tuner (``FE_HAS_CARRIER``, see :c:type:`fe_status`),
      and otherwise return the lowest possible value.
@@ -232,7 +232,7 @@ Signal strength (:ref:`DTV-STAT-SIGNAL-STRENGTH`)
 Carrier Signal to Noise ratio (:ref:`DTV-STAT-CNR`)
   - Signal to Noise ratio for the main carrier.
 
-  - Signal to Noise measurement depends on the device. On some hardware, is
+  - Signal to Noise measurement depends on the device. On some hardware, it is
     available when the main carrier is detected. On those hardware, CNR
     measurement usually comes from the tuner (e. g. after ``FE_HAS_CARRIER``,
     see :c:type:`fe_status`).
@@ -323,8 +323,8 @@ A typical example of the logic that handle status and statistics is::
 		.read_status = foo_get_status_and_stats,
 	};
 
-Statistics collect
-^^^^^^^^^^^^^^^^^^
+Statistics collection
+^^^^^^^^^^^^^^^^^^^^^
 
 On almost all frontend hardware, the bit and byte counts are stored by
 the hardware after a certain amount of time or after the total bit/block
-- 
2.24.0

