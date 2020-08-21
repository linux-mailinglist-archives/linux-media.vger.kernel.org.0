Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E309724D83E
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 17:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728049AbgHUPPC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 11:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728036AbgHUPOt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 11:14:49 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B097DC061574;
        Fri, 21 Aug 2020 08:14:48 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id k18so1204421pfp.7;
        Fri, 21 Aug 2020 08:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yQlRGgglVem1yrOY67Y4xRyPDdhuMt3+5qjwOEhr9Ok=;
        b=ZRQxbn+gRDJMepd4KWtM4FYhwQWaxJzPadcNJpglrZyBlxQzjRdbKrYPTHaRDIyyzz
         pXZ+y32FaVikd6YlCPI83aYOIU9uDBizDCWhFBoXwXkpV3XaBEGwuO95sOWGgcWIJWVd
         wTJNDGUKakWt1kSxjmx136c3W9Tn716yBa2QFAjmUVN4a7TUUHV8RHHtaesLJZlw56x0
         5DHOe/oGkY6BWC8AZ+L6d0PXLobFKrmDj03Ml0BAUK/HPhDIsm/nXERzwG9ms7fC9Idy
         c5s3sCtT/d5aXBx9+7ozMZ8VPtc1OfmPxNf0F12etE9IpMRANXJ/RCmu0Mjh8ES2Xx7A
         2I/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yQlRGgglVem1yrOY67Y4xRyPDdhuMt3+5qjwOEhr9Ok=;
        b=E2CCBNKoDQ+nGLmVLO7gmYHX/Eepv7A+cODsQhgcWmiCWQMJmbp9cV6FFFHFJiq7b0
         YkD1+OFLj4k/hy5KWJLXEI6ghLn32ZzZ9eqmoYwgxsVwFzNP74vI9GL5jJkdO2tfbv8N
         /HUhK9wMu+05qF8ZkzHymRWwOcqcTzGlZwhD52h16XIcC7gQJ3BcqYL0wLyO4RDFMssI
         ei0/jxhiBf5+749Hh+eZ7jVAnyD8sXl4a4mmrUNAz7uMgFXDrvtAwGYBsQS7XrN0wDL6
         ED72GWNY3d5G3jeRH/jzU5t/Sod/EFNdu01G3EhpMimUEnw7BMvBnYRw1G894KOQny/b
         +WgQ==
X-Gm-Message-State: AOAM531YkFFDbf9PTP2646jid9894SC1gA7Majeh0DhBjAlYQgDK4Upa
        bWlzyO1679HCQQWp/F4zww==
X-Google-Smtp-Source: ABdhPJwV5ANYGwealcVK8FXUcOhyB+39dfFBFcpqKvsf5pOL909OMvyBmVCg9rnTwdF9pFb1a2iRnw==
X-Received: by 2002:a05:6a00:14c4:: with SMTP id w4mr3012458pfu.20.1598022888104;
        Fri, 21 Aug 2020 08:14:48 -0700 (PDT)
Received: from localhost.localdomain ([2600:3c01::f03c:91ff:fe6e:64cd])
        by smtp.gmail.com with ESMTPSA id s8sm3132422pfc.122.2020.08.21.08.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 08:14:47 -0700 (PDT)
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Peilin Ye <yepeilin.cs@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] v4l2-tpg: Clamp hue in tpg_s_hue()
Date:   Fri, 21 Aug 2020 11:13:43 -0400
Message-Id: <20200821151343.506284-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Setting `hue` by calling tpg_s_hue() directly is risky, since it does not
perform range check. Clamp `hue` to the valid range in tpg_s_hue().

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 include/media/tpg/v4l2-tpg.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/media/tpg/v4l2-tpg.h b/include/media/tpg/v4l2-tpg.h
index eb191e85d363..fd15e5db9f5b 100644
--- a/include/media/tpg/v4l2-tpg.h
+++ b/include/media/tpg/v4l2-tpg.h
@@ -324,6 +324,7 @@ static inline void tpg_s_saturation(struct tpg_data *tpg,
 static inline void tpg_s_hue(struct tpg_data *tpg,
 					s16 hue)
 {
+	hue = clamp_t(s16, hue, -128, 128);
 	if (tpg->hue == hue)
 		return;
 	tpg->hue = hue;
-- 
2.25.1

