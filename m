Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB8C4CD47F
	for <lists+linux-media@lfdr.de>; Fri,  4 Mar 2022 13:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232847AbiCDMvS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Mar 2022 07:51:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232332AbiCDMvM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Mar 2022 07:51:12 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FAFB1B1DEB
        for <linux-media@vger.kernel.org>; Fri,  4 Mar 2022 04:50:23 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id kt27so17385601ejb.0
        for <linux-media@vger.kernel.org>; Fri, 04 Mar 2022 04:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HrixOrzT5DDaI61xAtG2tbo7EVFW4Xf4sUGZ9bCTAu8=;
        b=faInEy+YTi6Z3f1Nc0rs4abixNyACcuL+A6e3ZfKw6v9pkVFvc2DMq6itf48j/TgOo
         DmMUecFWrrqXg1BUcSJfJ5Oex51NYgEjkIsPVHGs5F4Tjy2MziMDj136h19IZ/wpLmim
         uMD45Kup8vcpHgfwmNpefTuQbidWRU9ewZIJfPsKLekd33KBtUiYFV7tDMJBUqjUS0/Y
         UrFeA6u9OwvVqiYG4gZHnpOCUNkEV3eottbNABfqgDzc2fq3oTR2eKJK3EmJiBx5+cbj
         b3VC2B1h7jSSdKawmyg2bT56o16Y8kA03JaBfKeu0mv5yNhZJ0Qlp86lvJC4oqUykFg7
         bJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HrixOrzT5DDaI61xAtG2tbo7EVFW4Xf4sUGZ9bCTAu8=;
        b=M+dfjd92N+N6nbKVFO0vXmmni51qDq4tV3BLKWvdAX8cnHc6PhZcRTltJ9KUXa+/it
         P4PEZic4MLjiZcYq159HO5WbUpx5j91EqUP8NOQi4B/ipmVxc5dE0ULWhESnONqPFT+m
         rhURxWkGT3AfRM5e84mgFBJ11KN3GdEKPxjschTBgc62cJfNkJWPWrYBvKiEljj2kUCr
         mlHkKemE5sgZzdy5ZU4QBnADr7s7BtEtIWTI6Bf8xd0ur+AjYpjRotx+1hLEZnl0X3/1
         KV2hPAkl1Lm+WQRP+G95hR5GCFucV+pAvGd9Dd6aqFaOW4t+6Jds404DV3qtxIeQu+5f
         7YcA==
X-Gm-Message-State: AOAM5309XYhpf1+QLM7FK/4gY3KPNSuST2W8hNslhsIRsJPi8wX0VjFn
        BGWld8IDoM40h1LyQWdGfiofPTJPlUcIdMvcwz0=
X-Google-Smtp-Source: ABdhPJzwbZrldhQYchpBHFXOF4RMO2mprPJTeTxenWNPhN55VEXhqGm2N+aSD+G8AbJzue9mrKzIZg==
X-Received: by 2002:a17:907:728b:b0:6da:97db:b66d with SMTP id dt11-20020a170907728b00b006da97dbb66dmr5115886ejc.636.1646398221743;
        Fri, 04 Mar 2022 04:50:21 -0800 (PST)
Received: from shashanks-buildpc.. ([2a02:8109:b540:9438:542e:fe2:e980:5b1])
        by smtp.gmail.com with ESMTPSA id e5-20020a170906374500b006d5825520a7sm1736359ejc.71.2022.03.04.04.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 04:50:21 -0800 (PST)
From:   Shashank Sharma <contactshashanksharma@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl,
        Shashank Sharma <shashank.sharma@amd.com>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Shashank Sharma <contactshashanksharma@gmail.com>
Subject: [PATCH 1/3] edid-decode: Introduce libedid-decode wrapper
Date:   Fri,  4 Mar 2022 13:49:59 +0100
Message-Id: <20220304125001.1732057-1-contactshashanksharma@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Shashank Sharma <shashank.sharma@amd.com>

This patch does some small changes to make the core logic of
edid-decode tool available to a shared library wrapper. With
these changes, the EDID's 'state' variable will be avialble
to another process via some library API calls.

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Jani Nikula <jani.nikula@intel.com>

Signed-off-by: Shashank Sharma <contactshashanksharma@gmail.com>
---
 Makefile        | 22 +++++++++++++++++++++-
 edid-decode.cpp | 15 ++++++++++++++-
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 1843700..ebf3370 100644
--- a/Makefile
+++ b/Makefile
@@ -1,14 +1,20 @@
 ifeq ($(OS),Windows_NT)
 	bindir ?= /usr/bin
 	mandir ?= /usr/share/man
+	libdir ?= /usr/lib
+	includedir ?= /usr/include
 else
 	UNAME_S := $(shell uname -s)
 	ifeq ($(UNAME_S),Darwin)
 		bindir ?= /usr/local/sbin
 		mandir ?= /usr/local/share/man
+		libdir ?= /usr/local/lib
+		includedir ?= /usr/include
 	else
 		bindir ?= /usr/bin
 		mandir ?= /usr/share/man
+		libdir ?= /usr/lib
+		includedir ?= /usr/include
 	endif
 endif
 
@@ -19,6 +25,11 @@ SOURCES = edid-decode.cpp parse-base-block.cpp parse-cta-block.cpp \
 	  parse-di-ext-block.cpp parse-vtb-ext-block.cpp calc-gtf-cvt.cpp
 WARN_FLAGS = -Wall -Wextra -Wno-missing-field-initializers -Wno-unused-parameter -Wimplicit-fallthrough
 
+LIB_NAME = libedid-decode.so
+LIB_FLAGS = -fPIC
+LIBLINK_FLAGS = -shared
+LIB_SOURCES = libedid-decode-api.cpp
+
 all: edid-decode
 
 sha = -DSHA=$(shell if test -d .git ; then git rev-parse --short=12 HEAD ; fi)
@@ -30,11 +41,20 @@ edid-decode: $(SOURCES) edid-decode.h oui.h Makefile
 edid-decode.js: $(SOURCES) edid-decode.h oui.h Makefile
 	$(EMXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(WARN_FLAGS) $(sha) $(date) -s EXPORTED_FUNCTIONS='["_parse_edid"]' -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]' -o $@ $(SOURCES) -lm
 
+libedid-decode: $(SOURCES) edid-decode.h oui.h Makefile
+	$(CXX) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) $(WARN_FLAGS) -g $(LIB_FLAGS) $(sha) $(date) $(LIBLINK_FLAGS) -o $(LIB_NAME) $(LIB_SOURCES) $(SOURCES) -lm
+
 clean:
-	rm -f edid-decode
+	rm -f edid-decode libedid-decode.so
 
 install:
 	mkdir -p $(DESTDIR)$(bindir)
 	install -m 0755 edid-decode $(DESTDIR)$(bindir)
 	mkdir -p $(DESTDIR)$(mandir)/man1
 	install -m 0644 edid-decode.1 $(DESTDIR)$(mandir)/man1
+
+install-lib:
+	mkdir -p $(DESTDIR)$(libdir)
+	mkdir -p $(DESTDIR)$(includedir)
+	install -m 0755 libedid-decode.so $(DESTDIR)$(libdir)
+	install -m 0644 libedid-decode-api.h $(DESTDIR)$(includedir)
diff --git a/edid-decode.cpp b/edid-decode.cpp
index 4a90aba..babff4a 100644
--- a/edid-decode.cpp
+++ b/edid-decode.cpp
@@ -21,7 +21,7 @@
 #define STR(x) #x
 #define STRING(x) STR(x)
 
-static edid_state state;
+edid_state state;
 
 static unsigned char edid[EDID_PAGE_SIZE * EDID_MAX_BLOCKS];
 static bool odd_hex_digits;
@@ -1012,6 +1012,19 @@ static bool extract_edid(int fd, FILE *error)
 	state.edid_size = edid_data.size();
 	return true;
 }
+struct edid_state *extract_edid_state(int fd, FILE *error)
+{
+	bool ret;
+
+	ret = extract_edid(fd, error);
+	if (ret) {
+		/* update the number of blocks */
+		state.num_blocks = state.edid_size / EDID_PAGE_SIZE;
+		return &state;
+	}
+
+	return NULL;
+}
 
 static unsigned char crc_calc(const unsigned char *b)
 {
-- 
2.32.0

