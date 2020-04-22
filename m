Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72EE41B33FF
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 02:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgDVAho (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 20:37:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbgDVAhn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 20:37:43 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74802C0610D5
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:43 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id 145so158589pfw.13
        for <linux-media@vger.kernel.org>; Tue, 21 Apr 2020 17:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WgMX4GY/VIemHiy8TcvV0K+VhOwT+3Lkg2y3ZP4ifUA=;
        b=ooxVtmj1KvZwcNn79SnVfPs7MP8gC4UHKJ6TwtTgkf0LybBb4VCiDW56XKQePx6j/x
         LqiVy8kXSjMNfSlH4wofw1+enFf2yaHF7b0luoKWwwm3PpiP4NGpqG7C1EaCmtU3Uh4n
         eU+35KcJz+DuUfOneV4u2ZmK+UcWAsLWSZjyho/ooNpXXuS0b1XA0INi1fLU1cLCim7M
         zu/gUbMEzYC2D19KKqQGK68zcvyH8787aXV+QTDQlpxzOZ4x4GEn2+2qa4gTLYvj85A1
         PFkfnXTO4tgTd40zV29wLjhQc5xWSldbo3s5EJXOlMe9aQWDcbNljJ5wxwB8n1gvgFvg
         607w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WgMX4GY/VIemHiy8TcvV0K+VhOwT+3Lkg2y3ZP4ifUA=;
        b=Fmw56TZm99iYe0rBAzo2GWH5fREU0l1ljsAbAlCARibZlGtjhRgmn6TA3ML8HLzeoP
         GJ2s7x8pf5o3dp1802mD+eP9mPb5/6OMmKddvAlZkf27c8n3J7pLj39Ah0ja+OMqnd04
         OF3qWDWudueCvE47sp8EmKvkr90xGkQfksH2XmzCtEgv2l/MegcGZUmttpeVLM5VVgwB
         y+Uv8hoAdvjSzLJ9vb5DcGcEWJ65G964mT6ypcbyU3G8v/gmuRr9Gl9JHMFns1e1t9HK
         k7yMsDhUzKgbiXTfat+PTr6CLermU9e8yfhGXNfSEJzBeQVYs3uGJVwb+n4I6ybVHgD5
         3nYw==
X-Gm-Message-State: AGi0Pub9i/qAP9XhAZI8Bagi9oW2JHAPjLHb5nU6d4cTinzj5lwPQbWV
        WpBV76sghxP4rvmCOzi9DU77UAyN
X-Google-Smtp-Source: APiQypJKDVc8mBjvNaa5O/YY+ahnBBnGAxS/Av1kdkpZCg7ydviZoA5WKmGVD22S3+aE6QQ+iASN1w==
X-Received: by 2002:a62:7cca:: with SMTP id x193mr4300796pfc.96.1587515862384;
        Tue, 21 Apr 2020 17:37:42 -0700 (PDT)
Received: from localhost.localdomain (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id y16sm1359676pfp.45.2020.04.21.17.37.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 17:37:41 -0700 (PDT)
From:   Rosen Penev <rosenp@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 05/12] utils: add copy assignment operator
Date:   Tue, 21 Apr 2020 17:37:28 -0700
Message-Id: <20200422003735.3891-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200422003735.3891-1-rosenp@gmail.com>
References: <20200422003735.3891-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Found with -Wdeprecated

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 utils/common/cv4l-helpers.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index a8089930..9505e334 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -830,6 +830,10 @@ public:
 	{
 		init(b);
 	}
+	cv4l_buffer operator= (const cv4l_buffer &b)
+	{
+		return *this;
+	}
 	virtual ~cv4l_buffer() {}
 
 	void init(unsigned type = 0, unsigned memory = 0, unsigned index = 0)
-- 
2.25.2

