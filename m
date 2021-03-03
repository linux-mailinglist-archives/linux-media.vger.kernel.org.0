Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF7E732C788
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355631AbhCDAcK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:32:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243190AbhCCSJb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 13:09:31 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E33C061756
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 10:08:49 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 18so30039503lff.6
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 10:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=2k1x9/2F0daAc7yrdszjwMTF7JbwosGHgJc2YE+hxDA=;
        b=xFq4hpxQkgQ86mv4veM42XCkH2N83AEvVG545IpdplaAI4dztfu2U1BdJ52nHLMUly
         jrG44w4w6N+357xwuKnShymHRBSzfBTURmyb7/AskJ5tOFEDEEmT6CQLmaI8XG4QlzcR
         /Hhpqan4khtcd2qi50Q3tEXpKkQ6aMFdlTonhrCkDbYUotpbBwOucpmFAR8Ct76pH/cj
         LIIhfc5UfcXH21SjSgiMhstyWCoZ4ZKtdaAVeAKm+TSRiUMs8Vl1/JeFy8Rrwlt9jE3c
         oC+TkXps6jJALbuhXANv4nukPpg2O0gjXs6mMA/7PnpsNii5DMBn1i3SDGiwjiCLTyuY
         LTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2k1x9/2F0daAc7yrdszjwMTF7JbwosGHgJc2YE+hxDA=;
        b=EcIcJFbWY+tlwnBaWuxkjUc0F2S6Bg/e2dvHtU8MrRcmKtjjLgJYaFrEs+eRV1VDCD
         RJpr2AHWBnMQpmDuwb3pvuPlXcgHpEK0mObGhxGhRSjcJ24KUHgEad3HOpqyUNdAXSqJ
         /2kQMASyCtbNMXDOjB4q021ezB+XSx5qi7Wk9e4jHN1f3OiO0NnceOF0rOkSkPuD+7jd
         ekQurOd/wE5UQZ8ZNg3NyWXf1Q7th5DGUVNpS6LB7oPx9z+FAe8MZRBbp1ZCWP0llAoo
         bo57KTNXt51f5QGX+pjQQ48FPHan2uyaTs0qIqRMu0ROm++8ZCqNf2Ww2hssY7bUNUn/
         DUdw==
X-Gm-Message-State: AOAM532ICYUi3b7A21q2OD0g4wK3cZRJ/KKTeoL8QHm0qoew5ehj30ho
        9dKTu2oL13U5VHm3y2CrUe7j0w==
X-Google-Smtp-Source: ABdhPJyR0XwEhKlyzT4PSijQxFQZcXbIILQn2ErDLW/maMa0hknN87v5PkpzlPj+YAFsEnUDP6qUKA==
X-Received: by 2002:a05:6512:696:: with SMTP id t22mr15458148lfe.631.1614794928297;
        Wed, 03 Mar 2021 10:08:48 -0800 (PST)
Received: from localhost.localdomain ([85.249.43.69])
        by smtp.googlemail.com with ESMTPSA id j15sm2220990lfm.138.2021.03.03.10.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 10:08:47 -0800 (PST)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Cc:     mchehab@kernel.org, niklas.soderlund@ragnatech.se, bparrot@ti.com,
        mickael.guene@st.com
Subject: [RFC PATCH 0/4] use v4l2_get_link_freq() in CSI receiver drivers
Date:   Wed,  3 Mar 2021 21:08:13 +0300
Message-Id: <20210303180817.12285-1-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset continues the work discussed in the "[RFC] Repurpose
V4L2_CID_PIXEL_RATE for the sampling rate in the pixel array" thread [1].

This patchset follows up the patchset for camss driver [2] of the same
purpose, and makes the rest of the receiver drivers in drivers/media
and drivers/staging/media to use v4l2_get_link_freq() instead of
V4L2_CID_PIXEL_RATE.

This patchset has been build tested only, as I don't have access to the
hardware. Most of the changes are fairly straightforward except for the
ones in the omap4iss driver. I would appreciate if people with better
knowledge of the omap4iss driver reviewed the last patch in this series,
and checked if I got the logic in the driver right.

[1] https://www.spinics.net/lists/linux-media/msg183183.html
[2] "[PATCH v3 0/3] media: qcom: camss: V4L2_CID_PIXEL_RATE/LINK_FREQ fixes"
    posted earlier today


