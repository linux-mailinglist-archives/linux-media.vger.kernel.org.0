Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBB87156BDD
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2020 18:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbgBIRto (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Feb 2020 12:49:44 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:34231 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727420AbgBIRtn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Feb 2020 12:49:43 -0500
Received: by mail-qt1-f194.google.com with SMTP id h12so3468750qtu.1
        for <linux-media@vger.kernel.org>; Sun, 09 Feb 2020 09:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vtb9eIKcbPoSEKTomO0TCS7RPzPWQCmDk06xrCb8upo=;
        b=RfgDyxlVV8i6SwmbIdqnbOwTtHuHhpaN/SSTmzDsKaJ47/LAqo+mfO1UmXK5fDnSbi
         wvk9wktv1juHdYy2hsSRAaA0BKOi4/1bnYQjbzv+ztBwx9DGe3drM39IAhPpKt6wI/X8
         apEUHaQN4n7lqSV2gDJb/TR7m2Sr0g7QK8PXJG0qFYAB29ptPM+QSUwgZ2XsSxvQJTfr
         FZBslgsfIPDrLLBBIHq58hMl4FAdvtKrTVRihxkz7B0P5lkWXIzsCHzEoXCwH6th0f5C
         hS6HdlEV5LpTadmPog+38braXvfa2WR+g5Sr0QKXbsBbbTi8pbqaqaD92mjD+bbd3pvZ
         nAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Vtb9eIKcbPoSEKTomO0TCS7RPzPWQCmDk06xrCb8upo=;
        b=tZ0RJUGf3bB31DQOL3TTtAJYnsqrAuoum9cAJnsqYHWmiij9F+7vKcG4AEKiIPJA2+
         ZSkoefkItcu8t07Mgr4pqSZ+Rd/X7Hq2QpaOLBnXGI5ryhmUkKdZZl8skQqXwNofEKn0
         vR7M63WGUT5qHvPZLPrq+8eVXybGyoF8Fov5U73YaER3uuAFOCL4DX4pMw88CAE1AZSa
         7bzeh8e9gJOTlnO89tCwEgc3TgWVzgp+eUgLBd2NJkTPzDRAuAf8a+PzZ3L2ZpW8CJw6
         9gi+m58j5Q2NTlT3yzWcHv3Km6zBllA3eswrdRl11DE1Hg0+2EBAONNGEpVD0wuRTuuL
         EW2A==
X-Gm-Message-State: APjAAAXmoCOCFFgc8I7+lHZ6coLKQMsxpP4kew1q+qh6ET22Y/3nR47T
        eGMxNhaGnnjK3QwwBKXfrYGVYqfkpXA=
X-Google-Smtp-Source: APXvYqzWsBjZqeiMfGzOMxh7O73eiWgS+qa4F9uuA3ykPJei7jI9c+1SSGLDy9MXqNTglOI4QxGJFw==
X-Received: by 2002:ac8:7415:: with SMTP id p21mr6969835qtq.122.1581270582472;
        Sun, 09 Feb 2020 09:49:42 -0800 (PST)
Received: from athos.hellosponsor.com (pool-173-68-201-69.nycmny.fios.verizon.net. [173.68.201.69])
        by smtp.gmail.com with ESMTPSA id 206sm4621095qkf.132.2020.02.09.09.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 09:49:41 -0800 (PST)
From:   Ilia Mirkin <imirkin@alum.mit.edu>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH 2/2] edid-decode: add build rule for emscripten output
Date:   Sun,  9 Feb 2020 12:49:37 -0500
Message-Id: <20200209174937.22844-3-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200209174937.22844-1-imirkin@alum.mit.edu>
References: <20200209174937.22844-1-imirkin@alum.mit.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

All I can really say is that this works in my current setup. This
current setup was not the first setup I tried, with lots of random
flailing around emscripten and binaryen versions to be compatible with
my LLVM version. Perhaps later emscripten needs slightly different flags
to export functions, who knows.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index 6db6386..49ad39b 100644
--- a/Makefile
+++ b/Makefile
@@ -1,6 +1,8 @@
 bindir ?= /usr/bin
 mandir ?= /usr/share/man
 
+EMXX ?= em++
+
 SOURCES = edid-decode.cpp parse-base-block.cpp parse-cta-block.cpp \
 	  parse-displayid-block.cpp parse-ls-ext-block.cpp \
 	  parse-di-ext-block.cpp parse-vtb-ext-block.cpp
@@ -13,6 +15,9 @@ sha = -DSHA=$(shell if [ -d .git ]; then git rev-parse HEAD ; else printf '"not
 edid-decode: $(SOURCES) edid-decode.h Makefile
 	$(CXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(WARN_FLAGS) -g $(sha) -o $@ $(SOURCES) -lm
 
+edid-decode.js: $(SOURCES) edid-decode.h Makefile
+	$(EMXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(WARN_FLAGS) $(sha) -s EXPORTED_FUNCTIONS='["_parse_edid"]' -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]' -o $@ $(SOURCES) -lm
+
 clean:
 	rm -f edid-decode
 
-- 
2.24.1

