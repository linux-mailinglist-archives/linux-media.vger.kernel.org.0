Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B07A15BDCE
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 12:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729854AbgBMLjH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 06:39:07 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:35918 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729428AbgBMLjH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 06:39:07 -0500
Received: by mail-qk1-f196.google.com with SMTP id w25so5330768qki.3
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2020 03:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vtb9eIKcbPoSEKTomO0TCS7RPzPWQCmDk06xrCb8upo=;
        b=J8/hzRd6Y7M47AJKUzTXL1iLrpJom6v/fjdoI9JBCAnKqxvU0VTwbOUtKDVS69ZbGy
         jE1wqHbVAcsITTYJq/llTU9U760wVj40oZsQXjWFi214eIOilDAPNIpTcembrc01ZG/W
         Zr1hOloFR5kjzzX7gFvSOLT5O0Upsq+xoT7hOZu2AgR9fU39fRm72Oi2EsEgys+WQgnX
         9XXhIw5dm3Je3pYeweKGciFC6PZlYvmWcmufMI00AdwtXQJWVnF+jmKpdff6QPIygov3
         leXKGz7tI9F/FHECM/e0fbfH4gEqveHE1qkZ6IQ+Gruj58s0VR/UvyRPPUA+Ya1wG18B
         dK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Vtb9eIKcbPoSEKTomO0TCS7RPzPWQCmDk06xrCb8upo=;
        b=b90yXHGA0vZx9g7UMoQ19aiCBU7Nqc/Yk1F3NfzJWx2d5hZubEd2gXRNVs1VKVlVxV
         PNNbFExCjQVHS5CKXsdJ2VBipG4yRdZ3I9FzQu0KeIjlUZPG6iFGxlXEnczKE2/x1+IA
         +ej1iXH7Pw//LQI4ZIPVrNKBizPRY4ShjBpnv0f2K2WaVew98Hyhba1SU7jLBeQe8dCe
         cP+CLUsBvtI4BprMUi/3QjwhbytHo9a4JL/8kyPR+SmArSzVK57z4dparkFHaJHmpPoA
         dOk440JqAfNdZcpJr7I5m4RWF5OODpob7bhWRCln8sU0g9bU6weYPTfvZKiFYWaDw94Q
         rCeQ==
X-Gm-Message-State: APjAAAVhtOmp9hXnnZEvHIA4oLQ4Btu37eb+Ik5cVk/XF+8TTMrINNo/
        5PaDnruWm2nEQtdUbTBzyiYXhyrCvBY=
X-Google-Smtp-Source: APXvYqw6Dwbvb744x8zgJC5aYwe88JYmTDiC0fmIV7lWNJA7VKn850k8pVSmorDKKxxA9VmONigx2w==
X-Received: by 2002:a05:620a:1383:: with SMTP id k3mr10678036qki.252.1581593946288;
        Thu, 13 Feb 2020 03:39:06 -0800 (PST)
Received: from athos.hellosponsor.com (pool-173-68-201-69.nycmny.fios.verizon.net. [173.68.201.69])
        by smtp.gmail.com with ESMTPSA id v125sm1123854qkb.52.2020.02.13.03.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 03:39:05 -0800 (PST)
From:   Ilia Mirkin <imirkin@alum.mit.edu>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH v2 2/2] edid-decode: add build rule for emscripten output
Date:   Thu, 13 Feb 2020 06:39:03 -0500
Message-Id: <20200213113903.23994-2-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213113903.23994-1-imirkin@alum.mit.edu>
References: <20200213113903.23994-1-imirkin@alum.mit.edu>
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

