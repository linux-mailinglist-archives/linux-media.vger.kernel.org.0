Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBE946068C
	for <lists+linux-media@lfdr.de>; Sun, 28 Nov 2021 14:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357636AbhK1Ngi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Nov 2021 08:36:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235495AbhK1Neg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Nov 2021 08:34:36 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC88C0619D8
        for <linux-media@vger.kernel.org>; Sun, 28 Nov 2021 05:25:05 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id j3so30500406wrp.1
        for <linux-media@vger.kernel.org>; Sun, 28 Nov 2021 05:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nmZRc5ErwsS/Ewa5E1yYdb3LaeQF1fMRo5QVoF/2Eqo=;
        b=kTvTBvU9M+OjgbkKilv1qHJ9Tl35amBDAAgNPHxFyozJNsVMIjnN2zFe2vaRlfwbDr
         jCXtJy3h7Wp4kBqBhDPtGT60FagMQU94S45XPiuZURCyKSa2yeZF/j/IeU7NhtWghovL
         wfFtuBhWOD2s+TCjiccG7KSA89nwfD7mXRSvB/SYj4ASvh9tlWrP/hXI7WOWsEdyida7
         J4OfswCjHFn/tWZ1TYdOWyyIn1Uhvu9FAxrqxeBOlRBXy9tvT1mCqX//1S4s5/zlmOPS
         3zOBvXkKGf0emnsrapZVzb8Q/BwXabMKWsspZPaNQ3HRpIPyE/8Jr76+6iASgR4jj5XV
         fHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nmZRc5ErwsS/Ewa5E1yYdb3LaeQF1fMRo5QVoF/2Eqo=;
        b=RoicZqIBKSkJyEUtNsos0LZkUFRqTGXgwOG/+MTcdLtsxiH+jClUNsZiKVeKtkdVis
         raKdykBUgYZSXL9mjU4MQbVXJUftCAkWVXgZzeUYEpXNmwlXx0heArGBPLJN/q5SGcLl
         NkNZbz+DFb0YQw41wbXpahPxi9iQG8gM4nvaND2QRH5Oo/lk/7gPJ6V4789aXHpqh4uy
         CymEJyaYFAuLKQTD2dL03ObMQq4Hk/UbtKq7O2lUB6kABJD7ZbrjcmKgpGiQ2MfBE730
         YShG8TMy+Ulgc3vc/9lyI+TijsdhSKkaAml7m/evj1VMIEcGTmSc7ImYeXihGNqQ+bYD
         HYrQ==
X-Gm-Message-State: AOAM532eMh1UTsvMtmna0m2uLIOFeim4XJnDt1BnoxyI4xCi2T+vU/F5
        wJuNrNdjQ4sfC8WBDEzZ3iEKMhXIepUYX05y
X-Google-Smtp-Source: ABdhPJwFKOgmrHyRZaG28+KjMjeJzOmmK7My59a9ldaCf5d4L5gR2FEiUIJUarZVZmYysxSavslSHQ==
X-Received: by 2002:adf:f189:: with SMTP id h9mr28151235wro.463.1638105904176;
        Sun, 28 Nov 2021 05:25:04 -0800 (PST)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id bg34sm15911535wmb.47.2021.11.28.05.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 05:25:03 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-vin: Do not hold the group lock when unregistering notifier
Date:   Sun, 28 Nov 2021 14:24:59 +0100
Message-Id: <20211128132459.142829-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no need to hold the group lock when unregistering the notifier,
but doing so triggers a warning about a possible cyclic lock dependency.

The lock warning cover the case where a subdevice is about to be bound
to the notifier at the same time as it's unregistered. The locking for
this scenario is handled in the v4l2-async framework so it's safe to
remove the lock in the driver. This match the locking logic in the
driver for when the notifier in question is registered.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 1d92cc8ede8f8a3e..b58c8bbe1cf33908 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -349,12 +349,10 @@ static int rvin_group_parse_of(struct rvin_dev *vin, unsigned int port,
 
 static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
 {
-	mutex_lock(&vin->group->lock);
 	if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
 		v4l2_async_nf_unregister(&vin->group->notifier);
 		v4l2_async_nf_cleanup(&vin->group->notifier);
 	}
-	mutex_unlock(&vin->group->lock);
 }
 
 static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
-- 
2.34.1

