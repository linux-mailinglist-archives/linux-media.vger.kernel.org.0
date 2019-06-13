Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE2C44734
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 18:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393109AbfFMQ5m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 12:57:42 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:54954 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729919AbfFMA4z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 20:56:55 -0400
Received: by mail-it1-f193.google.com with SMTP id m138so14015362ita.4
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2019 17:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vDoai9FCo61ADmdBZ301WDQL6Wz5//hlF5tMXgOfZE0=;
        b=X/LiudSWZp9Iz25IabKtdWZDyYAscHnEUIFCfxzHs9cUGv1j9qo6qqxWbJfs/+G08i
         Sq7r3p3PIqX0Y2Eos/c9kZaZYXo1fBG+uQw9FUSZVtdAt6vpKKOs1yXFsbp/Kcap4dg7
         eAI0nH2TLtBVVYwfhxxYXwWVepai9QC2cqdBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vDoai9FCo61ADmdBZ301WDQL6Wz5//hlF5tMXgOfZE0=;
        b=Zndmcp6eyed6BFQqJHCoiEdaqLJ7iQwRDmpQGVSPyphPbEjw2PyitroIklIN7+OcV2
         srmxZPpkURQOHv6+JQA0i8tQ8xu+Yv4EoeLG7QBnaSWeZ05P1nSOWwaYUGvLWZGCHsIN
         fzfHK2bZD2sUYRlzidhJ72sYK8sW4DAJRk+WCeASKlaqx0qrLVPNeUPNErIi3z2HF+ah
         Os4tsuf8NszSC5eWAZTQHMvJZZX6+lM1btwIRHW1iVxlTYz2U5cxIjT1r7pQvPCSHG8d
         GuVRE5+++9UVLuZrmI8qYFXZlhDNzhUcQYdTIm15vo/jBFaXq1+nQN5aIi7X1dbyQkhY
         y1EQ==
X-Gm-Message-State: APjAAAXCXo2wrALGCIocwKHmqKbHsrcBvS32mP0jJ5VjuZou55PNEy+O
        LPEuLGdHLoPH6/qiX+yjW8NsPg==
X-Google-Smtp-Source: APXvYqxWUG4rZuOF4BB6tuA67BAXPogoGWe0YzMR4tUPqlrcc1Ht7bmCaKoHBSC2CaY/YVkfC9LRFw==
X-Received: by 2002:a24:4084:: with SMTP id n126mr1693248ita.16.1560387414768;
        Wed, 12 Jun 2019 17:56:54 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id c2sm551310iok.53.2019.06.12.17.56.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 17:56:54 -0700 (PDT)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: videodev2.h: Fix shifting signed 32-bit value by 31 bits problem
Date:   Wed, 12 Jun 2019 18:56:52 -0600
Message-Id: <20190613005652.7423-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix v4l2_fourcc define to use "U" cast to avoid shifting signed 32-bit
value by 31 bits problem. This isn't a problem for kernel builds with
gcc.

This could be problem since this header is part of public API which
could be included for builds using compilers that don't handle this
condition safely resulting in undefined behavior.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 include/uapi/linux/videodev2.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 1050a75fb7ef..9d9705ceda76 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -80,7 +80,7 @@
 /*  Four-character-code (FOURCC) */
 #define v4l2_fourcc(a, b, c, d)\
 	((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
-#define v4l2_fourcc_be(a, b, c, d)	(v4l2_fourcc(a, b, c, d) | (1 << 31))
+#define v4l2_fourcc_be(a, b, c, d)	(v4l2_fourcc(a, b, c, d) | (1U << 31))
 
 /*
  *	E N U M S
-- 
2.17.1

