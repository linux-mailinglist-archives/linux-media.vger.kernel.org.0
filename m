Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61ACC1567E2
	for <lists+linux-media@lfdr.de>; Sat,  8 Feb 2020 22:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727549AbgBHVtb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Feb 2020 16:49:31 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:39174 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbgBHVtb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Feb 2020 16:49:31 -0500
Received: by mail-qv1-f66.google.com with SMTP id y8so1391517qvk.6
        for <linux-media@vger.kernel.org>; Sat, 08 Feb 2020 13:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FWB7diytXLBi/HxKgfo78/zlP1R1x6Uv/TuAt9LDKY0=;
        b=NpW7teX9avABEKCfL1PfnwvsM6n4wkShL3FGIlZ2+8OtHojJ4vkmSebMJQlsrpBrcS
         dk9EopD1YPO3YTd2t11ubUSc+/F5Z24kiicBXjxhxRNrTsOYxI/MDqmJx4bbv8Uv0xbx
         oFY8S2vrps7rj9XA+fZPyOFssQEku0Ke9+NEPjXYrLQlbx6g+QudVmP7PuT1RRxm0BYm
         46GXZYdFVPXuWlc7jvc8PsvAEyt4yqj6bLQz1GtYyiXKBAOv5eNlSbKQyUpV0tM1PJHZ
         34CWysVUg/x9uVrIg4sjW6d8DQuZWsEkfA51f1QQsRx46XD+uw3ZhRxG+Of4NzojakI0
         K+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=FWB7diytXLBi/HxKgfo78/zlP1R1x6Uv/TuAt9LDKY0=;
        b=Pzl2lU46J2hn5zffcBsfAd72RK47a6Zr2x/g+OigUowf9O/BhAwSOfb/It3z1vnZjG
         TAKKRvS0XSULTAnd009Uy4b0qyBPUyulwQk+bpc5MmenazBazBkcJjaFJHshBC3LnRlU
         iPfyGYzEbn/T07iygtrno7zSWQ74cwGZRS6S5RwctrV582H0rRSYpkxvxokUzS/FluXK
         BS48g/5eipWYpT6pjdsbfKKQMO02MHD5aeKBWRbCpyoGPE8oe1QDG+A4bgwVmPq4g+sf
         P9f0dHX1fwASRluPp9JqiT7my6kK6HpjiyIF/UD2eGZDD0mBnSBM8APsTU1Xxgo/34Y3
         p0Fg==
X-Gm-Message-State: APjAAAW41YiPRgyThE5fM7bPWvQgEXb/KATXXp0rPhWEdXm+4k35pKrR
        Jrr/aeef3yrVFP8KaEOAoF+hsKWvndc=
X-Google-Smtp-Source: APXvYqwoPpgdX2axR0Rrm8jlqeWeGlIdK3ZR8GlPVD4KCNPLir0sqQYeYgUiJrbmxf+mAn2yZudmMA==
X-Received: by 2002:a0c:e4cc:: with SMTP id g12mr4214388qvm.237.1581198569793;
        Sat, 08 Feb 2020 13:49:29 -0800 (PST)
Received: from athos.hellosponsor.com (pool-173-68-201-69.nycmny.fios.verizon.net. [173.68.201.69])
        by smtp.gmail.com with ESMTPSA id z26sm3605056qtj.12.2020.02.08.13.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2020 13:49:29 -0800 (PST)
From:   Ilia Mirkin <imirkin@alum.mit.edu>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] edid-decode: add missing time.h include
Date:   Sat,  8 Feb 2020 16:49:27 -0500
Message-Id: <20200208214927.32407-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The emscripten build is sensitive to this (I think it uses musl libc).

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 parse-base-block.cpp | 1 +
 1 file changed, 1 insertion(+)

diff --git a/parse-base-block.cpp b/parse-base-block.cpp
index 714eca1..c3aecdf 100644
--- a/parse-base-block.cpp
+++ b/parse-base-block.cpp
@@ -11,6 +11,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <math.h>
+#include <time.h>
 
 #include "edid-decode.h"
 
-- 
2.24.1

