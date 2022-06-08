Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5DD543DC6
	for <lists+linux-media@lfdr.de>; Wed,  8 Jun 2022 22:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbiFHUsT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jun 2022 16:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234356AbiFHUsK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jun 2022 16:48:10 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64682F5051
        for <linux-media@vger.kernel.org>; Wed,  8 Jun 2022 13:47:37 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id fu3so42224381ejc.7
        for <linux-media@vger.kernel.org>; Wed, 08 Jun 2022 13:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FhCJBllozrMsVOewiDTmDGtBWkpMka58/b7PdCPf/1w=;
        b=RQaHzYxf7kIoIvpIRw3Br0NR8J5lZBWco7S5UXTW/nh2AXHaaZ+6In+g+HaakcNr8+
         Iqsg23cdCbWlkj/9761viebCP1GICesYTOd1epZJ5CJH5OB7NxPGxo+SuNkKEEYhTVpp
         gBYTwvoi4SbT5B5E1PMzeSKMzXLconje8dtLWeodsRf+9ob9tkCZkUt+Fa4W7ah/yG9O
         KwLNQmXVMN4BmfG/9nNWEWHQNRl9sqQLSqDe6lTKlk5GF2UtAP1d+ofs+lZi9V+JFPE7
         PqHHpBQeK3mDXU5eirLpqc2ZODmXZ3oQAUg9ooEmgJyCDtQ1CJjH9ryeMW75L/suqN/+
         VVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FhCJBllozrMsVOewiDTmDGtBWkpMka58/b7PdCPf/1w=;
        b=iYy93FRmPcT1RsryHdwa5XCWSj5iW09FUQRqOG6dUj01ThEU1iAoOzMT/6DbH4FvCc
         0wrUsAiVT1d+8HewXYCw5RftbuEvYsrmzB6cuRz1xendzI3SV8eIn/+hxQpmmpe9A4KR
         n8VB8OU9djBwRdzFNZYU+9au7goHzclvpsxSFJRP4c3jJCtzTHWurlcxLzgrqrQrSa81
         cFmw0dyvU7b6VCmd6Sc7yyq5VFrLV1Pb6WFPcKNAUCv7sMoTNP5hn/VrSnvZuwr0+DZ0
         XBtxQjyDMGn7B3xVfpUXfj2W2Q+RoKv79ZCdN6RI9ZfkxJlvaOWAM2ZEazZ7dBpIjue4
         waJw==
X-Gm-Message-State: AOAM533DJBQiIuKCazv6T57/woi9pVfwk5K5pFvmsATvJlMIj/sw5tph
        1zNTh9W3LP9LHVRrucr2EW+gRg==
X-Google-Smtp-Source: ABdhPJyaDpWbBsoLjIxWTOSgU3pg+xovRe/xUfySxTYGZG6Z/yPOZDiMzl5x5AXZJbBKoCHteaJgTQ==
X-Received: by 2002:a17:906:b18e:b0:710:26db:7a53 with SMTP id w14-20020a170906b18e00b0071026db7a53mr24708040ejy.290.1654721255243;
        Wed, 08 Jun 2022 13:47:35 -0700 (PDT)
Received: from bismarck.berto.se (p4fca22cf.dip0.t-ipconnect.de. [79.202.34.207])
        by smtp.googlemail.com with ESMTPSA id s20-20020a05640217d400b0042617ba6396sm13097432edy.32.2022.06.08.13.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 13:47:34 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] media: rcar-vin: Fix channel routing for Ebisu
Date:   Wed,  8 Jun 2022 22:46:57 +0200
Message-Id: <20220608204657.1101889-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When converting to full Virtual Channel routing an error crept into the
routing table for Ebisu (r8a77990). The routing information is used at
probe time preventing rcar-vin from probing correctly on this SoC, solve
by correcting the routing table.

Fixes: 3e52419ec04f9769 ("media: rcar-{csi2,vin}: Move to full Virtual Channel routing per CSI-2 IP")
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
* Changes since v1
- Corrected the email to Geert and added his Tested-by tag.
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 49bdcfba010b2c8a..4b7a9743554af6c3 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1261,7 +1261,7 @@ static const struct rvin_info rcar_info_r8a77980 = {
 };
 
 static const struct rvin_group_route rcar_info_r8a77990_routes[] = {
-	{ .master = 0, .csi = RVIN_CSI40, .chsel = 0x03 },
+	{ .master = 4, .csi = RVIN_CSI40, .chsel = 0x03 },
 	{ /* Sentinel */ }
 };
 
-- 
2.36.0

