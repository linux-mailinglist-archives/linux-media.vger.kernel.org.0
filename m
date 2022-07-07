Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 021B156AEBA
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 00:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236617AbiGGWrt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 18:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiGGWrs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 18:47:48 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D58561D5D
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 15:47:47 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id r129-20020a1c4487000000b003a2d053adcbso136893wma.4
        for <linux-media@vger.kernel.org>; Thu, 07 Jul 2022 15:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MgjKjyfpijXaCjwFjdyrPNLh1wmtO01bdt7K6TEvAl8=;
        b=kokn1GqReFHN1kVN9OFI8kMMi4X91cyYAO5OruKcDbnmGYSc2ABX0OKtbqwoPjFdUs
         cqRxqzuChnufO5kQLK+EB21Z482JTnNd69/HWmf+3p6H319VPsT5V3sKzrWzz/dZ74ir
         rTOqFqgv1NP6TUb+66koROJ69ZH8L0n3Uhg74U/DaVWnNh9sydKpWlNOx0dAZK0U80cR
         OfPD+cjPyB6u6zQvjf2yX9EbnQmIvDUOeCp6Yq/V05l4C4yCkqwgeJFjmH5+f7pzPSeo
         ErixBLoTTu7t8SiuKUAhxBFMa7dHHS3ry2im7OsRrAuqDdsEB2JZtWnSsB3ki1W+R2JQ
         gnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MgjKjyfpijXaCjwFjdyrPNLh1wmtO01bdt7K6TEvAl8=;
        b=VlEzF6ZWsS0RhH9ZQp/hbDPs9vr7NWn9a8WEY1HdMDs4h5eOusZOrWWUwXN781OToK
         PdJUc+QnFIrl1n9F3cf0dklArfTMsdnpFqEG2ofrGvJVv+LikdMS0aKOYDz2+1cnm7Uv
         aBgoohcIEd4Xq4a1obz8kMX3OuicgEwyr5gdsnGgo4gN2Qj4bt0MTQZkVq6biXglirVT
         nOWXyQ5lmX1+C22ASz23122rxDZT8EROQFRFJCS2adf1V+E2bdu6hHaI1wLyI+CEepxP
         MZ1fQNjcLpc8bQdGgEkvgefENvl3vIaBhOu3T7b3BwlatWg2XihBWYABfcP4mUoo0qlM
         TpMw==
X-Gm-Message-State: AJIora+leJKF3PPkhbeCUrHLpwDGD17s2aoeSlFxPRx08wsRXGkcYfvn
        SyMZokog9aMqgIRAkHfFH9m1mofzTIk=
X-Google-Smtp-Source: AGRyM1uIisCxamyQl27Zek2wzhkvFxeiMYYQDpWoSJWe41hy+LOzmC691gUroxT65vEfjgu9M5vYpw==
X-Received: by 2002:a05:600c:1991:b0:3a1:9fc4:b67d with SMTP id t17-20020a05600c199100b003a19fc4b67dmr157199wmq.49.1657234066147;
        Thu, 07 Jul 2022 15:47:46 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id be12-20020a05600c1e8c00b0039c4d022a44sm241694wmb.1.2022.07.07.15.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 15:47:45 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, jacopo@jmondi.org
Subject: [PATCH v2 0/2] Add iterator for an entity's data links
Date:   Thu,  7 Jul 2022 23:47:31 +0100
Message-Id: <20220707224733.347899-1-djrscally@gmail.com>
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
  media: entity: Add iterator for entity data links
  media: entity: Use dedicated data link iterator

 drivers/media/mc/mc-entity.c | 22 +++++++++++++++++++---
 include/media/media-entity.h | 29 +++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 3 deletions(-)

-- 
2.25.1

