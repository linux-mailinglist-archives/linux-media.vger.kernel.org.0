Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 955435537E8
	for <lists+linux-media@lfdr.de>; Tue, 21 Jun 2022 18:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352255AbiFUQfF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jun 2022 12:35:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352213AbiFUQfD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jun 2022 12:35:03 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7903F25284
        for <linux-media@vger.kernel.org>; Tue, 21 Jun 2022 09:35:02 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id e25so15851126wrc.13
        for <linux-media@vger.kernel.org>; Tue, 21 Jun 2022 09:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eg28em4LI9DLECiDRD7r9cLV5mNj5wb3+H9hSoqZFsA=;
        b=cWFNfbSnnhXfzhW1H7lsdWhITHyPFVTTenycpKUHkL5pw4fChH/fKdeM9nyaSeOfMv
         3H5u2ajAx7eQihPlff9IFa91OfoiCiYOssn/KG7EnFHrLklJsUgGwVrUX4jaRPMb1YLW
         BnYOb664cuAygmPv8oLfGZz8qAAnVJrdv6OevSgNurxJXQL43zEVDcSlEtSdW7imwMel
         RHvmq6drl4Dnt7dnrn/+Amxz7134+deemociPYZBeT3EyMsjklnT3hxl93WHN5TCLHvY
         lWsVaonujN/cyffk2LZTFtJFALze7Kkod9M3+51eZ+5vf+P0lij+y+m+uMoiSWjj/301
         n0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eg28em4LI9DLECiDRD7r9cLV5mNj5wb3+H9hSoqZFsA=;
        b=biAFx6whC07ItGbuE8NP7PGfT3q25vmxTeDOq6UIXGonLO1NjBdoiIeJTofsfGyBVp
         B7WJqp7SfmqphkQ+xdK0prLD4XQFpIHaaVNPDdRC1oGXWTXWEfIUb+18LVHk3J8/xQ5P
         2HkGCtpzco8qz3jxTm/lOkP9kRayEoP4QHM1xt4fHZei75HwEeM1sZT0Ment53nN9ilz
         0XamlgxD2ACt6q+3jxvtfbhMCRHwaU/KOkYLWv9ECW1sMliOyhuZXEOMGODkwrBjginL
         x+NuDx0Vr/0xhX+vCm9CYbYYh+pjn9LHt5GFPzZXuE4yimC6Bjx8EOtqKtRC+RQRqLM+
         v84g==
X-Gm-Message-State: AJIora8yGjOEheWWCTvuak62mmh9f+G8uJcPvROesEiqm0nLDmiw24Sd
        s1QtvetpKm7X5ZB4J00XM7nS6f/WlGM=
X-Google-Smtp-Source: AGRyM1uoOk83YewagwG4KvaoGc/g3opIkeF1WIiAQZmx04VYjosOuv2+lJuggOupDyTF7U+Bl5qm3g==
X-Received: by 2002:a5d:584e:0:b0:218:511f:c8ea with SMTP id i14-20020a5d584e000000b00218511fc8eamr29863191wrf.664.1655829301024;
        Tue, 21 Jun 2022 09:35:01 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id v184-20020a1cacc1000000b0039c454067ddsm18649887wme.15.2022.06.21.09.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 09:35:00 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com
Subject: [PATCH 0/2] Add iterator for an entity's data links
Date:   Tue, 21 Jun 2022 17:34:55 +0100
Message-Id: <20220621163457.766496-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
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

There are a bunch of places in the kernel where code iterates over an entity's
links to perform some action. Those almost invariably have the implicit
assumption that those links are data links, which might not be true following
the introduction of ancillary links. Add a dedicated iterator that skips any
non data links for use instead, which will allow that assumption to hold true.

Daniel Scally (2):
  media: media-entity.h: Add iterator for entity data links
  media: entity: Use dedicated data link iterator

 drivers/media/mc/mc-entity.c |  6 +++---
 include/media/media-entity.h | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 3 deletions(-)

-- 
2.25.1

