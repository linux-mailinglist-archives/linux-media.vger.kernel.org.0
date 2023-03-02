Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 496AE6A7B2C
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 07:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjCBGFG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 01:05:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbjCBGFE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 01:05:04 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C1A216AD9
        for <linux-media@vger.kernel.org>; Wed,  1 Mar 2023 22:04:32 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id f13so63267815edz.6
        for <linux-media@vger.kernel.org>; Wed, 01 Mar 2023 22:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677737069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=b3PlUPvAl9Ue5W7oKW8yovzbSiARFbGhwF0xl64UtYc=;
        b=U8PdHLF9LVUHhkBLWrciNox63AkcbM0h0KSvcapQTRGutWGjJjGAA7VJsLLinF9W5m
         YtRYpvu29KK/AqIWZghaUolGmNEjO/oPSwZjhIVez9imm8N54lxlhFU7yWyUFJwj6Ram
         z/EZ5oc9RF4l6MLNV2U6Nkj5/NtqYF3fFTV1zdCK0D7gGfZdMxCJrpv3uX2bQ7cNhEE9
         X7Bj04VvihS/4Vbtm1QUa7oUEzq0ZiwKg9qtMpDPptOAW6nV5KQLuVdj/jTVQpm5m3SZ
         XUQA91UJMuX+oDXfaJDArodPifSPpOiZjBaMRaZIzjgAU0noUYiw1oN5MnUjpaWamh5/
         AoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677737069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b3PlUPvAl9Ue5W7oKW8yovzbSiARFbGhwF0xl64UtYc=;
        b=TF4rmNZdkU4sdWLKnZSTnAHP59jnmc2K86gJMErCdPE6qBqki8BvqFMEZEegq1SKru
         GryG99Kq2dBsbnPXAj/TBGXt+lSAr2JvMj2VDXnmphV0An6aPTcg+necMFvcqk3hEk0R
         OqsXn9aBMHpXsaxHD7AdxGFGxVF8jgO6YXV+ItvWtTbDCoGb+xiGVduZbmHULDpFPuz4
         aXZmCWGt76F3wh50fsPl+XmlqQUWi+M79O35MTH2+tQjSIzV5dgQV15rT1Rivt4ufN0e
         vMWM/j+30FcDlPCG4LIsLVj6JOv7tk8mXfCDeKBqw2KVBnefwWBndMC7+Da1+iFIfTPK
         YD7Q==
X-Gm-Message-State: AO0yUKUmEn4D9PWTrq1J/scGMkkNzjcEbt/nbY3TmCDN7X04SWKJj2bl
        XZUZ7Om8PW8VPwfD/9sB7zf4fVrVa0I=
X-Google-Smtp-Source: AK7set/9MzB77CPD2IEf9ARhvXLJmYx3o0zXQV7PFpa6tm62MLMk1J1PZVk+fGAqwMbIBNB9oTrBkA==
X-Received: by 2002:a17:906:430b:b0:8aa:9abe:8edd with SMTP id j11-20020a170906430b00b008aa9abe8eddmr7652349ejm.66.1677737069535;
        Wed, 01 Mar 2023 22:04:29 -0800 (PST)
Received: from aero-laptop.. (hst-221-91.medicom.bg. [84.238.221.91])
        by smtp.gmail.com with ESMTPSA id c22-20020a50f616000000b004c07b11deb8sm186819edn.64.2023.03.01.22.04.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 22:04:29 -0800 (PST)
From:   Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR v6.3] Venus fixes
Date:   Thu,  2 Mar 2023 08:04:13 +0200
Message-Id: <20230302060413.67239-1-stanimir.k.varbanov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This pull request includes a fix for regression in venus hardware reset.
The reverted commit has been merged in v6.2. 

Please pull.

regards,
Stan

The following changes since commit 3e62aba8284de0994a669d07983299242e68fe72:

  media: imx-mipi-csis: Check csis_fmt validity before use (2023-02-26 11:21:33 +0100)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/tag-venus-fixes-for-v6.3

for you to fetch changes up to 1440cfcf24db8c50d929d3c35ab6f87f868fa628:

  Revert "venus: firmware: Correct non-pix start and end addresses" (2023-03-02 07:52:10 +0200)

----------------------------------------------------------------
Venus fixes for v6.3

----------------------------------------------------------------
Javier Martinez Canillas (1):
      Revert "venus: firmware: Correct non-pix start and end addresses"

 drivers/media/platform/qcom/venus/firmware.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
