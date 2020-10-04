Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58EBC282BA4
	for <lists+linux-media@lfdr.de>; Sun,  4 Oct 2020 18:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbgJDQFB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 4 Oct 2020 12:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDQFB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 4 Oct 2020 12:05:01 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2068C0613CE
        for <linux-media@vger.kernel.org>; Sun,  4 Oct 2020 09:05:00 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e2so6383598wme.1
        for <linux-media@vger.kernel.org>; Sun, 04 Oct 2020 09:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YUAliNzUxEV3fGqBNzaKM0Sdb1oaRVBPRykSh+Rv6kc=;
        b=ncd8tqSVhw3Rko9aFtRbVyTuZXIRhZnGmsEqE4CIgWVIBa8hdQ/saBKHZAz1OTRaze
         VIIcGsJgohPkyZ04+5IhO1p0Pb9TppQvYZONVu5rrpikA6I/Cj2Bk/SMqdPL3j5tS18y
         Ec9z7cY/7OblHur2iOdHZWyWGpvEJmYHbxLPCNlaKdSTAoSay7Y0pffTOyMuk3StxCAP
         VxVMY8tEtdwIpF8AMlQLWww1pDYmCr8Ubhl5YrJTREXTir6oM+8S84ZQo/5LkDqLpWnW
         vQgZQIsmm9ibXHw64DzVa8ERchqVEE24Vx2I4UUXYEsLqqMYuWnszr1VnperZ5Q8J18W
         Wszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YUAliNzUxEV3fGqBNzaKM0Sdb1oaRVBPRykSh+Rv6kc=;
        b=c9oXI1Z+9gfga73uEfSDoylHS7KFRbLQrtdu25jC/0x9yM+cqw6ZtGJ41lwKNX8ANn
         AhTADq8F/kJbQDLs2qcl99JNAYUxi5g0V7lEBdeeT6OoNTiFKr6c4j9IXFxXhbxCbWQL
         qboNJW6ybv3FxPZd23QHFKgiJNic8287JgDUyvJVN/Fq47Umn51DClaKLISNOLhUETJ+
         qaP7M4Fx4fXSqFI3oRl9UYhxGPtWO04huQyNYqhC+/BtC/spu54/WoFA9JynniAeSqt0
         M1YZBdJAG3QW+nTOXF+fhYlMQ78AlFyTajKHnbmK2sLyHQiCo+b1P7u750kShk4Lya4b
         G7DA==
X-Gm-Message-State: AOAM531I71lXbUX3OqXj3ATKkTzHnj3nA5kXpSwk7FaoNpURmhJrkTZo
        URRBGCL4UrhlOsRS3GsXJODwN0tXI05zPw==
X-Google-Smtp-Source: ABdhPJzmIv41wO8zPfqRrgAbtDzEk7r9hDrRhJcLEt2uK29/TwvMcAuGIiydI81MpMFpJs3oCtKoJg==
X-Received: by 2002:a1c:4006:: with SMTP id n6mr2850281wma.46.1601827499261;
        Sun, 04 Oct 2020 09:04:59 -0700 (PDT)
Received: from basti.fritz.box (p200300d1ff3ff900fb4ff0aa470a9f8b.dip0.t-ipconnect.de. [2003:d1:ff3f:f900:fb4f:f0aa:470a:9f8b])
        by smtp.gmail.com with ESMTPSA id s11sm9137709wrt.43.2020.10.04.09.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 09:04:58 -0700 (PDT)
From:   Sebastian Fricke <sebastian.fricke.linux@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl,
        Sebastian Fricke <sebastian.fricke.linux@gmail.com>
Subject: [PATCH v4l-utils] README: Update build requirements for debian
Date:   Sun,  4 Oct 2020 18:04:39 +0200
Message-Id: <20201004160439.23425-1-sebastian.fricke.linux@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current set of required packages was not sufficient to complete the
`make`, after following the usual route of:
`sudo apt-get install debhelper dh-autoreconf autotools-dev\
                      autoconf-archive doxygen graphviz libasound2-dev\
                      libtool libjpeg-dev qtbase5-dev libqt5opengl5-dev\
                      libudev-dev libx11-dev pkg-config udev make gcc git`
`./bootstrap.sh`
`./configure`
`make`

The following error was presented:
`moc: could not find a Qt installation of ''`

Fix this issue by adding the `qt5-default` package to the list of
requirements.

Fixes: 8d2093a8a4bc43622cd68aeb85fb2b817de55993

Tested on: Debian version: Debian GNU/Linux 10 & Debian GNU/Linux 9
(Buster & Stretch(inside of a lxc container))
Additionally, I tested to build on a fresh VM, where I faced the same
problem.

Signed-off-by: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
---
 README | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/README b/README
index 75823e2d..a7759171 100644
--- a/README
+++ b/README
@@ -29,10 +29,9 @@ each distro.
 
 On Debian and derivated distributions, you need to install the following
 packages with apt-get or aptitude:
-	debhelper dh-autoreconf autotools-dev autoconf-archive
-        doxygen graphviz libasound2-dev
-	libtool libjpeg-dev qtbase5-dev libqt5opengl5-dev libudev-dev libx11-dev
-	pkg-config udev make gcc git
+    debhelper dh-autoreconf autotools-dev autoconf-archive doxygen graphviz
+    libasound2-dev libtool libjpeg-dev qtbase5-dev qt5-default
+    libqt5opengl5-dev libudev-dev libx11-dev pkg-config udev make gcc git
 
 
 On Fedora, the package list for a minimal install with dnf or yum is:
-- 
2.20.1

