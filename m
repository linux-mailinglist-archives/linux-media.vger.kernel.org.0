Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAF6E77B074
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 06:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233045AbjHNEd3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 00:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233040AbjHNEdT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 00:33:19 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF6CFB
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 21:33:16 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bc63ef9959so34546535ad.2
        for <linux-media@vger.kernel.org>; Sun, 13 Aug 2023 21:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691987596; x=1692592396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JGX2iQreR4Wa0lEJRVthG1ZLrq79VS9RRmn8uvS4tBw=;
        b=ReM7E/zJUHj/2KoAnU/iyMfZfy0EDj8RbAiNZqdllHBsHTqXMjVsIukPm6CcNsmU8H
         IIxwpd16TYxaYMxKOcotA6ZC0D7bTIOJ5G/OUrO1SLPvArdnekH8sqqB+J0EAwZ4ii6/
         RgnDKUczA0XpHMepz7C4LaxVrXpnKGWoGfPrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691987596; x=1692592396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGX2iQreR4Wa0lEJRVthG1ZLrq79VS9RRmn8uvS4tBw=;
        b=O2vMD6aZZKuRqObiZznsm6nqp0iZ9SJHj31WCFUbctfcmDqR8Sg++m2m3dBcklqjGW
         Vl3zrUX7xYxSfZiNfEfObq6q7+SEZglzpZAhIdPnp4M6tGCYGgO7il3rB3pOy4fpIZoB
         iIimv9XrgU6di4+eCw7OihP9jAsnIzF/BgXIAsb9dvoSn6dy9dXwxOmMh3spBR2aN+Oy
         JD5SkKzRrnTXibHjUIM9okUV7vVUnIon6S7XcPaCEbR+bpU/dBgRmOc3czH6LBNlAJqr
         S5W2Z5dlVbiny+OaNVcWquNIXR/sqegMCe3N5ic28KGDJ6VzupTTH3dafhzwQvbGuNjP
         b8cQ==
X-Gm-Message-State: AOJu0YzDiY2LHkWD8S9GoQrtMxTSQlWU/sZb6YRRIGLqMonnHcWuhDZK
        fJb/VkxwCWq8GJO4gwX3NPsrfw==
X-Google-Smtp-Source: AGHT+IECfYOTOeL7Do4LXrA/RmqwOQo4GC8Ctl2U+2iZsd6BHgi+Q0ahMo2jCeaKtY142l90DpEN1g==
X-Received: by 2002:a17:902:d4c4:b0:1bc:411f:1097 with SMTP id o4-20020a170902d4c400b001bc411f1097mr9455934plg.47.1691987596346;
        Sun, 13 Aug 2023 21:33:16 -0700 (PDT)
Received: from rekanorman3.syd.corp.google.com ([2401:fa00:9:14:4ae6:d1a4:27c2:80ff])
        by smtp.gmail.com with ESMTPSA id ju17-20020a170903429100b001bdb0483e65sm6761865plb.265.2023.08.13.21.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 21:33:16 -0700 (PDT)
From:   Reka Norman <rekanorman@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Daisuke Nojiri <dnojiri@chromium.org>,
        Stefan Adolfsson <sadolfsson@google.com>,
        Reka Norman <rekanorman@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 0/9] media: cros-ec-cec: Add support for multiple ports
Date:   Mon, 14 Aug 2023 14:29:09 +1000
Message-ID: <20230814043140.1108917-1-rekanorman@chromium.org>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


The Google Dibbi chromebox will have two HDMI ports with CEC enabled via
its EC. Currently, the cros-ec-cec driver and the host command interface
to the EC assume there is only one port. E.g. the commands have no
parameter to indicated which port to operate on.

This series adds support for multiple ports. The driver is modified to
manage an array of ports, each with their own CEC adapter and notifier.
The host command interface is modified to support multiple ports. All
changes to interface are backwards compatible.


Reka Norman (9):
  media: cros-ec-cec: Use cros_ec_cmd to send host commands
  media: cros-ec-cec: Manage an array of ports
  media: cros-ec-cec: Support multiple ports in set/get host commands
  media: cros-ec-cec: Support multiple ports in write command
  media: cros-ec-cec: Support multiple ports in MKBP cec_events
  media: cros-ec-cec: Support receiving messages from multiple ports
  media: cros-ec-cec: Allow specifying multiple HDMI connectors
  media: cros-ec-cec: Get number of CEC ports from EC
  media: cros-ec-cec: Add Dibbi to the match table

 .../media/cec/platform/cros-ec/cros-ec-cec.c  | 376 ++++++++++++++----
 .../linux/platform_data/cros_ec_commands.h    |  66 ++-
 2 files changed, 354 insertions(+), 88 deletions(-)

-- 
2.41.0.640.ga95def55d0-goog

