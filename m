Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 698C5672E9
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2019 18:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbfGLQB2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jul 2019 12:01:28 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37084 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfGLQB2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jul 2019 12:01:28 -0400
Received: by mail-wr1-f68.google.com with SMTP id n9so10525418wrr.4
        for <linux-media@vger.kernel.org>; Fri, 12 Jul 2019 09:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gIFN29Lw2OTtfs+8Ni3gwQuTIENWhJTKg8giXiXIn/Y=;
        b=Auf21Z88mR1z5pDqWakKbf7lcbcqlUkOHHfkzjoC6wNdFIyK/K/oaXcMU0892TzEIZ
         c435z0pg1Iu1DZ1XN1KpX5pP1ugSD6tHlW3/61MgQRzGRBGr00/5E2E2rQyBC71jK9fZ
         wHn0Vvg3bIv3xN6FELIclVCmBXEmDbKHcEI+BmYYQp+COR/hbkAArtVaZcBbXpEKTYxt
         g7+QUx2AUnJMSohu9yN2lXWW39X1MlfM846dzwQPIDY9JH5uCq+/+bzK1bd/eTZD4blM
         ZEQX1wPUG21M4nG9DIZ+dUB1pqiC0vYXY8n4LkHb7pP6Lcayjr9mxQFYpLFzH0/EVk5X
         Gi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gIFN29Lw2OTtfs+8Ni3gwQuTIENWhJTKg8giXiXIn/Y=;
        b=blpqX11eu9/pqXLQ1wcGwwRakfKGdCJ0Jb/zGP2zYIsDH8XG3eCX1gjRLmSuJZ6rlW
         l3QaNNjA6LMqCv252Qi/s+/4m0TNiqpc+YM1RhakVC4ls9MYXUG+aBYFl23n16y/4Lez
         nIWkszHyGR4OpEWZCQsqu4h76vh4L12PENJ2g0LBANHI2sZwgKqCHi7XXHl1tcgV1Lpm
         fO+EfQc11UsPPquwBtbfHIEz7RDRgnjwl0ARerRQuHLfdYpxNayMOa+gsuev25XeCWOz
         0S0j9m7Pi1/SDqi7+O9G95VuMAUrA0pfZnfQLSEwfBFsvSdfbnIPvF3Nbm3p39BCa53s
         /5qg==
X-Gm-Message-State: APjAAAWyaQUeeKQ8ZEERTq+lBwKIjJQWbww5e/VWbjen/stw58LWtqGf
        AOCaJzIvH9VlBmGuo3QROUavltvL
X-Google-Smtp-Source: APXvYqxVoBYA4A2KpR5X7Q5432kJ8yzDKqbeiGwIptzvcmU0N2qXehTUC2+G60K/CcIP04L1d/fi7g==
X-Received: by 2002:adf:a341:: with SMTP id d1mr12314479wrb.260.1562947286265;
        Fri, 12 Jul 2019 09:01:26 -0700 (PDT)
Received: from speedcore.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id o26sm5101696wro.53.2019.07.12.09.01.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 12 Jul 2019 09:01:25 -0700 (PDT)
From:   rawoul@gmail.com
To:     linux-media@vger.kernel.org
Subject: [PATCH] data: add LG55C8 TV EDID
Date:   Fri, 12 Jul 2019 17:59:07 +0200
Message-Id: <20190712155907.13412-1-rawoul@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnaud Vrac <avrac@freebox.fr>

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 data/lg-55c8 | Bin 0 -> 256 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 data/lg-55c8

diff --git a/data/lg-55c8 b/data/lg-55c8
new file mode 100644
index 0000000000000000000000000000000000000000..34d2ec94f363f9dd802be98827ab52137eccacb6
GIT binary patch
literal 256
zcmZSh4+ac!xr_{qARxoY+^`_3g6rMH#UVa3)%XKK7IH8cI=DI{IutrIHh|SIa=c(L
z_*4+pupy$0!J#FYfkBSRszIXALf0We#}z8Vz`*dA!KzZO!-j!N0Stg5e;9n+6+*(G
z0t$>tOw7q2qY@JY<kM1Fgjq$HnS>M+l|&h1<KmN&Q|uj#IK$aR*#pAa8Pi#qZRHNc
z*D>ZX^Drnd?66T_XkcVwW=X#hdxWu~f%y@``NymW7#_3nGCtxre$D81fk91zd16y$
XO`2lBhCl{s1BU`Lgwud-0fCJGyrMw?

literal 0
HcmV?d00001

-- 
2.20.1

