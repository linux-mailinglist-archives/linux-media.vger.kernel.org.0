Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 863331EBE1E
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 16:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbgFBO3D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 10:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbgFBO3D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jun 2020 10:29:03 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D62C08C5C0
        for <linux-media@vger.kernel.org>; Tue,  2 Jun 2020 07:29:03 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id x1so12944333ejd.8
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2020 07:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dyRgWg3ExRYIP8F32kMB418okb1im36WXmeupUeHBm0=;
        b=iM8jy+7MBU0hqRUEN6bYTIRHALaCT36wm3zlJfko6+RvEZdI/3h5HQOhIBsKDGnCIl
         pb13stmRTp1Tg6BVXCxjSalCw8fL3HsMMvdmjsFprllTLUbcirqJYCNCgwpQKrG0LSpF
         OcZ3s1b0kzrpPY9ElWPDaFRphyrkRv+JW7srBeOpDtPGyfqceHMWDr87nsHFWrXMEg3+
         L/l2PSNqf17r3k0ZX/1AtFlSXvBIliB4j5Uq1nU5Z0pfMBlbIT8lHQZhPe08neWbf6P5
         o9mHR2R1JXGW93wzvQyCsSHSB/ETnW/87ofN5x2gRQ/GgbsOCrihyzxsyw6P99VZcdZ7
         Ohfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dyRgWg3ExRYIP8F32kMB418okb1im36WXmeupUeHBm0=;
        b=DJdMwq5P8z/VK29TNsYtLgkZXfiB22yKphH2YwIm5eZf1ZlZ/7p2xZbe9PQNNTM2nI
         CKPrpWxgILnVxRoa7P37e6sGFkiCHUU0gzK/AMX3DqrHfFrkL0IiVpMdi9l8rhrhTQyu
         yMX7MhMnG5HZ6uMiizKcjDcLeDLGL+8Fzwe1r5gvMffl9xGSkDnLpakkKiYZ5FEUYtJx
         N71Iu7tuP7O8w8oPzSrVu5ZS8gewKuIW779/d83/TKiyqTOPAkCgNRqZqomeSz++Xfja
         40t6s+zUvu4YMP6AJs2CYrBtBms3253raO3e+lm8+wX8njkfcwfIdu+Poxn7PKcSGAIz
         rcuw==
X-Gm-Message-State: AOAM5309z9WJr+147ReQSf44tAXqdxIHCvkDdNZTEw0Tb8HipMAFec7F
        udMIQb8VEmRKsmatpwiFSfrKaNUT
X-Google-Smtp-Source: ABdhPJxNRHotV60InucGZk1CkRdYYxjtRptW4hNik5NlSrfPuSuSedKYELoPvFpxApy+QwoM7qxzZw==
X-Received: by 2002:a17:906:4a8d:: with SMTP id x13mr13346624eju.26.1591108141595;
        Tue, 02 Jun 2020 07:29:01 -0700 (PDT)
Received: from pythagoras.local (x4d065456.dyn.telefonica.de. [77.6.84.86])
        by smtp.gmail.com with ESMTPSA id m30sm1637487eda.16.2020.06.02.07.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 07:29:01 -0700 (PDT)
From:   Marvin Schmidt <marvin.schmidt1987@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Marvin Schmidt <marvin.schmidt1987@gmail.com>
Subject: [PATCH v4l-utils] mc_nextgen_test: Link against argp library
Date:   Tue,  2 Jun 2020 16:28:53 +0200
Message-Id: <20200602142853.2355987-1-marvin.schmidt1987@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Otherwise the build fails on systems where the argp library is
standalone and not part of the C library itself (e.g. systems using the
musl libc + argp-standalone):

/usr/x86_64-pc-linux-musl/bin/armv7-unknown-linux-musleabihf-ld: mc_nextgen_test-mc_nextgen_test.o: in function `parse_opt':
mc_nextgen_test.c:(.text+0x1dc): undefined reference to `argp_state_help'
/usr/x86_64-pc-linux-musl/bin/armv7-unknown-linux-musleabihf-ld: mc_nextgen_test.c:(.text+0x2e8): undefined reference to `argp_state_help'
/usr/x86_64-pc-linux-musl/bin/armv7-unknown-linux-musleabihf-ld: mc_nextgen_test-mc_nextgen_test.o: in function `main':
mc_nextgen_test.c:(.text.startup+0x30): undefined reference to `argp_parse'
collect2: error: ld returned 1 exit status
make[3]: *** [Makefile:570: mc_nextgen_test] Error 1
make[3]: *** Waiting for unfinished jobs....

Signed-off-by: Marvin Schmidt <marvin.schmidt1987@gmail.com>
---
 contrib/test/Makefile.am | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/test/Makefile.am b/contrib/test/Makefile.am
index ded3c1f4..55e4ba09 100644
--- a/contrib/test/Makefile.am
+++ b/contrib/test/Makefile.am
@@ -42,7 +42,7 @@ sdlcam_CFLAGS = -I../.. $(SDL2_CFLAGS)
 sdlcam_LDADD = ../../lib/libv4l2/libv4l2.la  ../../lib/libv4lconvert/libv4lconvert.la
 
 mc_nextgen_test_CFLAGS = $(LIBUDEV_CFLAGS)
-mc_nextgen_test_LDFLAGS = $(LIBUDEV_LIBS)
+mc_nextgen_test_LDFLAGS = $(ARGP_LIBS) $(LIBUDEV_LIBS)
 
 
 ioctl_test_SOURCES = ioctl-test.c ioctl-test.h ioctl_32.h ioctl_64.h
-- 
2.26.2

