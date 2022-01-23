Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2C56497205
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 15:21:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233494AbiAWOVn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 09:21:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232277AbiAWOVn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 09:21:43 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C71E5C06173B
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 06:21:42 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id p15so14138428ejc.7
        for <linux-media@vger.kernel.org>; Sun, 23 Jan 2022 06:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BjGVNSzNwjAE+Vn3RXe8iOrWczsdtRqJy4ELA3RuEEY=;
        b=E92mjIG9/8A3/0dQhkLtkc1QViIf8ze4ELv+PoCAaATL60UdUneenDrxlm2gIgWz/s
         xQsNuqmLzeHOLNe0AzJeEqlR3FRZKlHb+taFsT0L4sHrd4K5Fva+v0Hebo7tJ84a8fHN
         dsVxTRtnUM9eJv/B1YAfsTrl5l64+64+vwlvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BjGVNSzNwjAE+Vn3RXe8iOrWczsdtRqJy4ELA3RuEEY=;
        b=LhJsfn0tcry4M6EQFnAudKpZUgxlQ+D9sYcTNAE1Q3nWlcRFcDEQV4qwyFxPbpT2Rn
         6PxNV213b2/04gK7Vsv/h+AyFW5wf5UbW8weySY/Fma9E+2RRnoFov9rCqfwNoXZopRm
         dY5fiiZMrumd4kSlad7Fy6tY5dTYBqajsVqeGqz1k3T6brTpl4TY4airIuoaAnW4IaNT
         8Ngsj32HqsEpR6zxayRCVpIDdwXE62MQ7DrVbW72TJ5zeRUobJdFGUnXyEF+xl87Ewix
         dJMD3EjflDGoHMZQXNmkTictaOb2nkb51a8qu5u3j8Zblz18vZuio2ILtQjXWSYHu1bO
         sn1A==
X-Gm-Message-State: AOAM532TXtu1wPMKYoIwDXE4RoGXpyFUhBtqixFAHP1PrviQoD4Cw6RW
        21tpRUWVYcU4N+4il2vInnhoaqasYy/l0w==
X-Google-Smtp-Source: ABdhPJxVjQSYBVRmtUfIwuyFPiK0vBcXMLpMfcaJ0unlFTQ2lTyOireqQhg1Ui+je9sBth9kzIUjXw==
X-Received: by 2002:a17:907:1b21:: with SMTP id mp33mr9299015ejc.580.1642947701243;
        Sun, 23 Jan 2022 06:21:41 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id k6sm5114767edx.41.2022.01.23.06.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 06:21:40 -0800 (PST)
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Cc:     Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v4 0/1] media: ovm6211: Adds support for OVM6211
Date:   Sun, 23 Jan 2022 16:21:33 +0200
Message-Id: <20220123142134.3074180-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4: More unused header files removed, use media_entity_cleanup() where
necessary and some other minor cleanups.

v3: As usual, not everything is perfect, hence v3.  The patch set is now merged
into one big patch, redundant code was removed and the end result tested on the
board.  DT bindings are coming some time later.

v2: Removes an unused function (ovm6211_set_pix_clk) and this patch series is
now based on media/master; Didn't receive any comments about the RFC version,
thus i assume everything is perfect... :P

This patch adds ovm6211 driver into the staging directory.  It also creates
media/i2c entry, where ovm6211.c lives for now, to mimic the generic media
source tree.

Petko Manolov (1):
  media: ovm6211: Adds support for OVM6211

 drivers/media/i2c/Kconfig   |   10 +
 drivers/media/i2c/Makefile  |    1 +
 drivers/media/i2c/ovm6211.c | 1032 +++++++++++++++++++++++++++++++++++
 3 files changed, 1043 insertions(+)
 create mode 100644 drivers/media/i2c/ovm6211.c


base-commit: 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c
-- 
2.30.2

