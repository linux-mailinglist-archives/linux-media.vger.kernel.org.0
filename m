Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27380416E6D
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 11:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245031AbhIXJEf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 05:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244555AbhIXJEe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 05:04:34 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0EC2C061757
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 02:03:01 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id y28so37244835lfb.0
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 02:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=llwuQxMnfqimzNJJvFgIveLT6522ylZK2Dd9XgPpNOs=;
        b=voXNnwR32rEsIYJzAi81MedAUopUk+yolmiw1vzuy5IjDyfqTLyqzMNftv+57FOd/+
         TuscLfoKLwbzeFU6coohOl2y2+4nEbZtVrzVOfsd9gmNRPW+MhmfmgpnwwycjJ0YEWso
         bZcH2Cnm4fXGMa9bgXLs9DXVDjLvrsT/LiWdVzLMTKSxzpqeCZStWTFOuUaBPmonzDwP
         b581pQ4FaQfA4BOVF5oxP9wHVKTn5UDthUFSfudLBTAjLJUFqnRgkcSKC2nZqMbpyJ7E
         TjnBJ2kDImn/CFj0UJezzp4TmnB86FQdcbkpwv3OU2rgKKjiJlwWfEwks22KEau6E38P
         n0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=llwuQxMnfqimzNJJvFgIveLT6522ylZK2Dd9XgPpNOs=;
        b=RbfhdMxuxu0FKtQ+KLBO6bMySK17xIn5KIhqVYZ7jAe9dXU3K09tS1j/kj7inOhD1L
         2ykZApOWrkfuJUoioTXKlzrTtCzDTklLk2EtoeyILUnplfFNOE7Chu9KOjmYk+6oSmIn
         XIvyVGdWwKRE3ZyFndPBDzQ7TYNNEGyKmbmYg0WR6DAr+r61VkubS8hbmp8QFpKD3bDX
         IeH98IM09PnYHWudNMQiAcgCVN9B+/sLDi5GpLEd70VZZEiCKzspB52V5Q3RJ+5XQE6d
         gF+CCdLGv78Z1uMUKBtiE0W9xdksNIliQRtRgLYWLBTBfLOEDReT6S4LjWsD+0YXoUoX
         an+Q==
X-Gm-Message-State: AOAM532S5uqU6ghzRoDKDLq4dOQjdmKAUv55YSy75wr7Cob7ECxCfmxo
        naFTCvDOym6eMKMCixI54pd4fQ==
X-Google-Smtp-Source: ABdhPJxCYyMKdaffGxCHyszJqKodq6Upo7VtTwjbiOpw/Im9sn5dk9YHQ1eOSUgqX25G0ah5uvfV1g==
X-Received: by 2002:a05:651c:211a:: with SMTP id a26mr9933964ljq.305.1632474180010;
        Fri, 24 Sep 2021 02:03:00 -0700 (PDT)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id d19sm689572lfa.252.2021.09.24.02.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 02:02:59 -0700 (PDT)
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH] media: rcar-csi2: fix R8A77980 support
Date:   Fri, 24 Sep 2021 12:02:45 +0300
Message-Id: <20210924090244.3459-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>

Add missing initialization of num_channels field.

Fixes: 3ba37c2bcb0c ("media: rcar-csi2: add R8A77980 support")
Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index e28eff039688..f4d3c6dead30 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -1146,6 +1146,7 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77980 = {
 	.init_phtw = rcsi2_init_phtw_h3_v3h_m3n,
 	.hsfreqrange = hsfreqrange_h3_v3h_m3n,
 	.csi0clkfreqrange = 0x20,
+	.num_channels = 4,
 	.clear_ulps = true,
 };
 
-- 
2.30.2

