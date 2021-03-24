Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE701347969
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 14:20:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233395AbhCXNTq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 09:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbhCXNTS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 09:19:18 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F3AC061763;
        Wed, 24 Mar 2021 06:19:18 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id q26so12654458qkm.6;
        Wed, 24 Mar 2021 06:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yhQiXcovbyUleNurKIHV7eznErpMFs5V3Dg6eGUK+9U=;
        b=Y3OIriRAsgItz6Wdu53piRhNTb5IPVvC81alyebwKXnkZ/KDTn1YRwUPvecKwsnjgz
         /ZWI128ZfUZFOkWHdot+KKVfvw27XeUxjnjmwI8FRNBzXYTZx6g8d+scE2wnR1CVvlGU
         dftZcjee5JYbN81b8WgxadXumwqys+kA/hAEjILLgw4P+RaJsgwUx03PEhgswREUh+dw
         1Pvo8fdNxPSfUhjLLzwcFLae+cj9BcIxtdvEi/IKLpD8RdR734dTHz1mOeUSPudmlK+N
         GQ27yJqO79BBeA0rN+yyBfPpaDu1VQCnjhDTYab743GkX7kj25s10cm29rf7WOyIY18s
         VsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yhQiXcovbyUleNurKIHV7eznErpMFs5V3Dg6eGUK+9U=;
        b=f+5PNZOpsXBCePgOTxrIOqDK6Uo1lRLIuST/ab1pxrL8oVwESUrTCS91r0t69y5jQZ
         EYmIN0kqvcU10l4mbz9z8c+OPUx7+XB04vG8IVi5S/zrKwoa28UBcULNfy5qmvc03A5i
         lUr7aBtrNJ+YNlncLFJclcyrAEVWGRZcV3YjYlLQMORrB9ORJ54+QgY72/kwyQXSvF8N
         h4avaVDXYyUx9ll2uoeSnu2UMXHQX4eqZMqdU/kzOKwn3QLhLCgep3X/ZEE7+E7xU5DT
         DHBB/u8UjX1TkLRUqKtqqc1Yf/HF82FGXONNW7PAXatGSJP2Bb7E5D6NBnkYhNenXIh6
         8Cyg==
X-Gm-Message-State: AOAM5305yyH1KdmHxbAreMA5osISg10KObuPLGX8uyHgroyOh/qv8A/o
        oQfYtMR9lXkOmNOD/MwsL3rSNQnBL4dI9mIx
X-Google-Smtp-Source: ABdhPJxBFSJmoyXtCCFn5Gp8Zg97bvc61PccvqF3n3CZB9DPuoJhJuv+XK2ra0F1amT+05DZZ5Ofew==
X-Received: by 2002:a05:620a:16dc:: with SMTP id a28mr2985691qkn.442.1616591957531;
        Wed, 24 Mar 2021 06:19:17 -0700 (PDT)
Received: from Slackware.localdomain ([156.146.36.138])
        by smtp.gmail.com with ESMTPSA id b2sm1320932qtb.54.2021.03.24.06.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 06:19:16 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] media: entity: A typo fix
Date:   Wed, 24 Mar 2021 18:51:00 +0530
Message-Id: <20210324132100.18306-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


s/cariers/carriers/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 include/media/media-entity.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index cbdfcb79d0d0..a90e2bf6baf7 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -155,7 +155,7 @@ struct media_link {
  *	uniquely identified by the pad number.
  * @PAD_SIGNAL_ANALOG:
  *	The pad contains an analog signal. It can be Radio Frequency,
- *	Intermediate Frequency, a baseband signal or sub-cariers.
+ *	Intermediate Frequency, a baseband signal or sub-carriers.
  *	Tuner inputs, IF-PLL demodulators, composite and s-video signals
  *	should use it.
  * @PAD_SIGNAL_DV:
--
2.30.1

