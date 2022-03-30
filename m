Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC6B64EC8F4
	for <lists+linux-media@lfdr.de>; Wed, 30 Mar 2022 17:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348463AbiC3QAR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Mar 2022 12:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344504AbiC3QAQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Mar 2022 12:00:16 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A0C22BB05
        for <linux-media@vger.kernel.org>; Wed, 30 Mar 2022 08:58:29 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id bi12so42510992ejb.3
        for <linux-media@vger.kernel.org>; Wed, 30 Mar 2022 08:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0vLHdjBkKx+KDSA9pg5hEvg/695Zf8dcX/zmgDC32DM=;
        b=NL/8Obb4peFY4kjjN7NhumAFf1uGUAs+V1qUgB13QMrh2HQGE2KQzfPidgOkNAu2uk
         XLB+mP4B7m/GF4mjrEmmgpzi84e4a7dazn2fxvTJm/O4b/7rokM0krp82dcsviBsDyYZ
         VeivwfWG7M+FfxlmWF4KEl/BVIyt2AaO+7mwUtae9fLdZtXuiyFCg9cWcUnfXmNBsidk
         9smNuQe1ig10ShlKuCo1IZz+4lu1noadH1sqdhNQJe51xQq4s+lfc7oXujXkpqD/XUFO
         4uxNLvv6ZoRlZvkE90zZ0iPBI3vCfdZzW+z97h64dx4zXIEviF/qvIPem7E8L4LXYBE7
         G67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0vLHdjBkKx+KDSA9pg5hEvg/695Zf8dcX/zmgDC32DM=;
        b=SLPjpBM9zARphkX1eAg7ZbMhCWc93J4u8kOBDyhFVeHCpoJK4ijg6NX/XSA+AFxdH6
         O6M3oC9JNvAMTfhqXJb19L05P0ezDhBs/lDo4uNRHsLcE0x1Lw9Q3LVKo6TEgyQCMLAd
         /xTKRV3GQYx2rIisar+NxnhKPJuPZ/sBGOs8ag1+kp0B5mVPKB2as5PN5G63jaVKQ0+c
         veA5hbzqDSymmL0CgoeOm+hWiiKkz2exuvJoa1dR4hMp5bsx6pXPjKMtaXx7g81LHsT2
         nHLRLR40okRmHHLxrI0J/dx1+Pow80U4UqiCICHbn5mk2fq4oIAeUCBnbDLl9pLO99VY
         n8qg==
X-Gm-Message-State: AOAM5320JrysPwwe4xIPgOUFSAlMTf/YK54UTOhBo5iRmZxv/yWOuTyY
        UmYQLaHAfQZtQvVfJTUZt5h7jg==
X-Google-Smtp-Source: ABdhPJwtIh9sz8VfgTav2NOZfxxqE+m0j4tK1DNJNRFmfvLvJxeTggrADQuGJH3XYucjvviQxb16ww==
X-Received: by 2002:a17:906:e8b:b0:6e1:2387:35ef with SMTP id p11-20020a1709060e8b00b006e1238735efmr148263ejf.583.1648655907611;
        Wed, 30 Mar 2022 08:58:27 -0700 (PDT)
Received: from bismarck.berto.se (p4fca22cf.dip0.t-ipconnect.de. [79.202.34.207])
        by smtp.googlemail.com with ESMTPSA id h14-20020a056402280e00b0041957289726sm10831086ede.79.2022.03.30.08.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 08:58:26 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-vin: Remove stray blank line
Date:   Wed, 30 Mar 2022 17:58:11 +0200
Message-Id: <20220330155811.1185758-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove a stray blank line between function definition and body.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 64cb05b3907c28e5..4f36e9df7effeb2b 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -891,7 +891,6 @@ static const struct media_device_ops rvin_csi2_media_ops = {
 
 static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
 				 const struct rvin_group_route *route)
-
 {
 	struct media_entity *source = &group->remotes[route->csi].subdev->entity;
 	struct media_entity *sink = &group->vin[id]->vdev.entity;
-- 
2.35.1

