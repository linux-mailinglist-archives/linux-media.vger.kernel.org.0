Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E06794245D2
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 20:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbhJFSQx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 14:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbhJFSQx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 14:16:53 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A65FFC061746
        for <linux-media@vger.kernel.org>; Wed,  6 Oct 2021 11:15:00 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id t12-20020a05621421ac00b00382ea49a7cbso3428750qvc.0
        for <linux-media@vger.kernel.org>; Wed, 06 Oct 2021 11:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=OFpCO9Ekpof7Mo+wqo35t5p6n3tMeT3VNY3MNzTCYMw=;
        b=dXfZn6vNleXzVjWG0T+gLvfQ3d9LCgjRO+fhGL6hw9Mf39oskExQjUSnyZP5Y6jaMR
         QwcAmdrdsYKloiaXS1+sq16anjTS+rFM1c0hyPpIOCk+CQtUoYbw3QXb+aF2FA72msEN
         voIJpEDnYtsL7+PfXqNJgWRM+s7LWA32nm1YNP4aJHtaRLKYpJC4n9bnUZjFBrc3F/s3
         Iou2fZk2gDapnLBZ0TPba5o2q7ncftQ3mQI3nIEjWE2/540i3daXt1ZN4NhXffosiDsq
         +Gh2YUiZK/tOrxNzJXXPWCSIIQb+sXgogV9cl2yLrWHNbQc5WZ1zmqx+8iugjG9Mv2Wp
         aIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=OFpCO9Ekpof7Mo+wqo35t5p6n3tMeT3VNY3MNzTCYMw=;
        b=ZQvz/z90xb+LqUg5rpGle71gsLIOSiCwSw8mpz5u2eV+lo10CxptMZO2X6CIapP5NL
         n2wZD9y/xcyRWJqGbhtAU2ypt2/2jYzTuH3U4F/CahIpJitZEs1bgiM8/HmnDgejXv+L
         M22KGeTNDpj55S9zIX2soooHS/qq5uRjVYzVmITcqfFaDmlQAsCqEx/NEiR8ykJXvBK8
         WAex2X+6MI5pLzKBz+9kXlI++Skvzl6AbscM2bh8FbmxK2xC+BRRVf1Nu4oysaUiIRBv
         wSiax6b1xNMMZjTD4sKPSScBZun1DOFaTFTghs0cRe/RgKZrGseYvyU7E76+dCQIx8lm
         1/Mg==
X-Gm-Message-State: AOAM533YKB1KZUic+yJ2dogWDRNCOzM7sMPpe+QK5/pEblLg3vEnfkS0
        6CvT8Uag5RWskKqmXthO5ZnLtr//mfJyaUeuzIGZ77LHoFxIxLZJGjpALcWbJT++55hqtfOjjs3
        XarbT6O5oP6TqTRhTQT0bLLyql4jc26xQzh73Hrbs7W7TQ7HHRNH74mUFKfw45LsIrd1jHow=
X-Google-Smtp-Source: ABdhPJzNrMG8D8yDmJTD5gN3FQj3Nad2D5wOt+jRQMbOk/iMf76dt59S4ER0A/MxMUGpuHXw44c+wGsHxanJ
X-Received: from jnchase1.nyc.corp.google.com ([2620:0:1003:510:6cce:46f0:5d24:169])
 (user=jnchase job=sendgmr) by 2002:ac8:615c:: with SMTP id
 d28mr197721qtm.103.1633544099764; Wed, 06 Oct 2021 11:14:59 -0700 (PDT)
Date:   Wed,  6 Oct 2021 14:14:57 -0400
Message-Id: <20211006181457.2867037-1-jnchase@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH] MAINTAINERS: update maintainer for ch7322 driver
From:   Jeff Chase <jnchase@google.com>
To:     linux-media@vger.kernel.org
Cc:     jrt@google.com, Jeff Chase <jnchase@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Jeff is leaving Google so Joe will take over.

Signed-off-by: Jeff Chase <jnchase@google.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ee91c5472bc1..3269c6831b81 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4431,7 +4431,7 @@ N:	cros_ec
 N:	cros-ec
 
 CHRONTEL CH7322 CEC DRIVER
-M:	Jeff Chase <jnchase@google.com>
+M:	Joe Tessler <jrt@google.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-- 
2.33.0.800.g4c38ced690-goog

