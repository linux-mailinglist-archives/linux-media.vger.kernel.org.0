Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C29D3446ECB
	for <lists+linux-media@lfdr.de>; Sat,  6 Nov 2021 16:55:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234529AbhKFP5h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Nov 2021 11:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234504AbhKFP5b (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Nov 2021 11:57:31 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8308DC061714;
        Sat,  6 Nov 2021 08:54:50 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id z206so14265446iof.0;
        Sat, 06 Nov 2021 08:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a7XNPVMIy98WZ+IbOsiYnn8UHL05ZLnQcKzciYPO5ok=;
        b=bWJSfuEH8vrp/4kT7BNRQT+Z6LVsDcHOX1hw6yUdNfZ6iAgOMsY3YL3HFWcfCiYPKu
         lXAJhmd/2dDUtoc5J1/3JUbUDvesmDE9n7Ttwjnks28/Pasc7GzxZY4g4p0l+2d0BgNc
         U3fpjVeE7Ll/DmNeq+Ps+C8ck/psM59JJXgmmWHlsdlFmnQm9v1ZRa3JoG91dQ0xbbqH
         C9Vv95utJOdqCttZAyYaILf2e8XByHIh0BPZjbB8OfBL6uyvKC6fvnUPHp0i9cGDAr9x
         ev47Py0ZBAw5huiDPIC8gWTr0QOn/ER62kHgmwxN63PgkdInXIbOtS2bFf8VhFnNfx0s
         yYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a7XNPVMIy98WZ+IbOsiYnn8UHL05ZLnQcKzciYPO5ok=;
        b=KaiMkj6eZmjv6ymCZf49lw6mpDtSzYyD740wLRakfd4fKcnGb1TmGw6gQEWPLmwuEV
         4C4YUh08UI7JcmyVFulGMW4pFFiU5i21o+uQCyAi/pbuPbK2uVrynBGVo+evDcPOirFv
         KVyRLXZfs3V5c4RX2l1VvxCenbOzrB5em7wkp69o6L26JnQ5YVmgtr/NYh4YGCXCEkJW
         Q+6N5QDH+sI1w/1HBXLaIKMkDorTGdQohPtq1jp+raJoyvZXje+aT1RkMvzm+5ZkTmVZ
         UusIQoR8rXJBwzX82x65D8xREjjfTjH9crYbMhgR/TUgNAr9Ikt8PqY2y3NVmXxkBvls
         fPLA==
X-Gm-Message-State: AOAM533oiJDYelPHT3F3ZhrDP/ST1LaZ8cBCpDZJtgwPiicvgwhJrjN6
        K99p1KTOdVEIm3+nRmyEhg0=
X-Google-Smtp-Source: ABdhPJzEjVwqo8hUmbWdU7/Wbj/y7B7b5TydZWgt5ZaoTxhCBhIqv6pnYBf6XK/BL7BRz4CRYaTZDw==
X-Received: by 2002:a6b:6b08:: with SMTP id g8mr4714187ioc.150.1636214089881;
        Sat, 06 Nov 2021 08:54:49 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:64ba:1c0f:6d36:c11d])
        by smtp.gmail.com with ESMTPSA id d2sm5718313ilg.77.2021.11.06.08.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 08:54:49 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     tharvey@gateworks.com, frieder.schrempf@kontron.de,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        aford@beaconembedded.com, cstevens@beaconembedded.com,
        jagan@amarulasolutions.com, Adam Ford <aford173@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 3/5] arm64: defconfig: Enable VIDEO_IMX_MEDIA
Date:   Sat,  6 Nov 2021 10:54:25 -0500
Message-Id: <20211106155427.753197-3-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211106155427.753197-1-aford173@gmail.com>
References: <20211106155427.753197-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To use a camera, the CSIS and CSI drivers need to be enabled with
VIDEO_IMX_MEDIA.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  No Change

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e2b9bdd702..bc261cf2ef5a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -958,6 +958,7 @@ CONFIG_MFD_CROS_EC_DEV=y
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
 CONFIG_VIDEO_HANTRO=m
+CONFIG_VIDEO_IMX_MEDIA=m
 CONFIG_CHROME_PLATFORMS=y
 CONFIG_CROS_EC=y
 CONFIG_CROS_EC_I2C=y
-- 
2.32.0

