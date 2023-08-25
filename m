Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C46B8787DF2
	for <lists+linux-media@lfdr.de>; Fri, 25 Aug 2023 04:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236629AbjHYCtv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 22:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233203AbjHYCt1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 22:49:27 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54341FCB
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 19:49:24 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bba48b0bd2so4404915ad.3
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 19:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692931764; x=1693536564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mXGXLKS3jNZtWjpP8MUeUNI8wguvALNNe8QcWuaTTAc=;
        b=Mj1W1eqcThgQTlQYu1yvNbtvQH/G5alkFNQy+YuuNyLjj4Hnae2wGWDYKymil8WYMh
         WCLCxv/Su3Tu4DbXSDGi+N1vhvTsiDpzz/SR9b5Zk4YRuBWqlU1H+0WmeJ3Pyn892zw8
         WptBDyuOgu2IVHdBERb8/a8/xUD1iCOpwm6Gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931764; x=1693536564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXGXLKS3jNZtWjpP8MUeUNI8wguvALNNe8QcWuaTTAc=;
        b=bgKFEffZFHsTGMhc0nkoPxZ4kb8vyV8qR+yf95txHx/uTnL+Ko3qZUHZF0CZ3onw6h
         btKnh/pVKPgYYToK2B+Olw+oDr8Dva38G/njrgO7dxwoOKwBLSUVCTGHN7+afaOUjHKB
         LD9unapLu5kH4d+MPQ3c++dpPEFl6mIJ4cbDO01zVJSMTMv3l6zeTQ6kBLCPu92Kz8YS
         vBrgRsmpHmI6Clm4T2tQFzV8tdQtqY4UCXQJ8us7cMwIDwitOskO0nHS1VwZyQ1QvGcO
         G/++LRsZIkfa+3aIbkHskJ67Sn0OOaNi2/W/ti61jSY4ubigmnEDNSM2inuJYwBXnf3U
         VP9Q==
X-Gm-Message-State: AOJu0YxCmIckD22HD8WvADUZCoBEyGzqDtg65bhGMhgdRdA8zq4E/wAS
        wSdeVTABsPgyUc7tnNoj8hwBUwIiASUIuMvV6DA=
X-Google-Smtp-Source: AGHT+IGNYtCTR8SWTybJF6A/n55k6TG7mlB9uXu6QZZkx9rf59w+jxMBHqodnR3YX5bLWYANu9sCzA==
X-Received: by 2002:a17:902:d345:b0:1bb:1e69:28be with SMTP id l5-20020a170902d34500b001bb1e6928bemr13861764plk.42.1692931764287;
        Thu, 24 Aug 2023 19:49:24 -0700 (PDT)
Received: from rekanorman3.syd.corp.google.com ([2401:fa00:9:14:9fe1:d4b1:42cc:882f])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902a3ca00b001bb0eebd90asm420847plb.245.2023.08.24.19.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:49:23 -0700 (PDT)
From:   Reka Norman <rekanorman@chromium.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Daisuke Nojiri <dnojiri@chromium.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Stefan Adolfsson <sadolfsson@google.com>,
        Reka Norman <rekanorman@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v2 0/9] media: cros-ec-cec: Add support for multiple ports
Date:   Fri, 25 Aug 2023 12:43:53 +1000
Message-ID: <20230825024735.1443836-1-rekanorman@chromium.org>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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

Changes in v2:
- Make port_num unsigned in handle_cec_event
- Use NULL-terminated arrays for the conns field of cec_dmi_match
- Use a NULL-terminated conns array for the Dibbi match table entry

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

 .../media/cec/platform/cros-ec/cros-ec-cec.c  | 379 ++++++++++++++----
 .../linux/platform_data/cros_ec_commands.h    |  66 ++-
 2 files changed, 357 insertions(+), 88 deletions(-)

-- 
2.42.0.rc2.253.gd59a3bf2b4-goog

