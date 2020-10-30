Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1857B2A0811
	for <lists+linux-media@lfdr.de>; Fri, 30 Oct 2020 15:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgJ3Oh5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Oct 2020 10:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbgJ3Ohz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Oct 2020 10:37:55 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6529AC0613CF
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 07:37:54 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id n15so6751283wrq.2
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2020 07:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OwtNdHIPSabqM1aRDu7jm8OQIX10dof411XMNae48b0=;
        b=mmMNE5mQrE5Ex3idb16Mw57c1SrldmI18PsAc/aatGvCSPh0OxUKBeczmUeqIg728h
         mghTsn9j8ZrqHvqSuiepxePhZzAetlJ+KUNrd++fT9nGGY0CuxqjA4biJfPpelCU04fD
         lpDwSiZBnakBIusEueqzC1/t+HcWypq4P0iZpHtyPMxi2Q/pcb+k9ENFkqnlw9Q6hKqS
         9GxmKeuGpYrn7iCE5uMiXkv6belgQYQ0R060vWreCrO1nzO3K/rh2amsFNVo0NbUVqFd
         dodc/zxIFBg9/7mw3GcS3yjekZe9mXGyg1bmOYNfeNzygbWufO7UEjALySvjVUdTEOtt
         p4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OwtNdHIPSabqM1aRDu7jm8OQIX10dof411XMNae48b0=;
        b=a84bfwp7PhjCbPiOZMWr+QgBXFkB6TLcXIVFWddrtWu/TIx5MOaptCQCWIVeVfVMWK
         PWlsZYNbpTXkN3VAWYNhMmFEARRiR1OEp6scI7BGcQXBCXXI8rUGNyaMq5q+42aV5+om
         UWOqCyHsgMpHag0Usyl4D39v2YYQCRzXwIxV5XaDSlUMOjrhNHN+d+tGoDX2DsuEvKwe
         5A40jASp8djYOY4YO420WuC92rrGuoHSfuAkCjuOxkv03M+5MtPm2MLugto46gSwv9SQ
         AFHvPURsAdxXmmLWWd/GiCjnDMpq0xYNBDuXkZ3dbtwmQdixw/zjZYsC8/XZRGiUJA1C
         Lj6w==
X-Gm-Message-State: AOAM533eMUCAcRjWLqYci9DOVNAaFtEN6UNIeOdrSzlT05tkJbDZioo6
        LoQRXlJk/FLE09gUylUA45YOSw==
X-Google-Smtp-Source: ABdhPJzcGa5JPgiKW9L1GHX3i2KkDFiru4v1nYIA/xefaOCkFhXzo7NKbTSfOX5xpjiQviBULSGH0w==
X-Received: by 2002:adf:8366:: with SMTP id 93mr3621462wrd.6.1604068672995;
        Fri, 30 Oct 2020 07:37:52 -0700 (PDT)
Received: from localhost.localdomain ([37.172.114.188])
        by smtp.gmail.com with ESMTPSA id y200sm351481wmc.23.2020.10.30.07.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 07:37:52 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     hverkuil@xs4all.nl
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] MAINTAINERS: Add myself as maintainer of the Amlogic GE2D driver
Date:   Fri, 30 Oct 2020 15:37:14 +0100
Message-Id: <20201030143715.577641-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030143715.577641-1-narmstrong@baylibre.com>
References: <20201030143715.577641-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e73636b75f29..db93156dcaba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11412,6 +11412,15 @@ F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
 F:	drivers/media/cec/platform/meson/ao-cec-g12a.c
 F:	drivers/media/cec/platform/meson/ao-cec.c
 
+MESON GE2D DRIVER FOR AMLOGIC SOCS
+M:	Neil Armstrong <narmstrong@baylibre.com>
+L:	linux-media@vger.kernel.org
+L:	linux-amlogic@lists.infradead.org
+S:	Supported
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
+F:	drivers/media/meson/ge2d/
+
 MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
 M:	Liang Yang <liang.yang@amlogic.com>
 L:	linux-mtd@lists.infradead.org
-- 
2.25.1

