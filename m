Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398E252492B
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 11:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352179AbiELJhA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 05:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352159AbiELJgo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 05:36:44 -0400
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A83B16B7FE
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 02:36:22 -0700 (PDT)
X-KPN-MessageId: be8dde38-d1d6-11ec-9565-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.6])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id be8dde38-d1d6-11ec-9565-00505699b430;
        Thu, 12 May 2022 11:34:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:subject:from:to:mime-version:date:message-id;
        bh=kVS5tEqThBPkbTMWbNicHm8cm0lSl2sq8aw7MtCn1lM=;
        b=JzK5vPXHDZ4Q8KZ8eCHSLYUUeOOrZM8lrT346RBU+60dhCeSDSM4d3e4SKXquroh5bS2A21L9etz4
         8TPUlo9RnFOnDHHJiOa5Iwroamn7cHAGd/w876AvEAwpDV9H2OCstW3HisRpA3eeMQ5+to5nVtmtCU
         RP04NjsqPBfTATaG4S0IzKyXn8FNt6mQPTgOCQlBXQzUw/MclEKqQAJRpEPwDpvu5J8X2uzo55tqnm
         BHDPENQavqjVTWnosbunMBHZqt+c7WLZGAocEZioL0bSDNJuhfJJpYwai755ZRUeNXXrjudseEo2fN
         gRuE7OiYV7Lbv+DwU2XYNWlKmYT7mkQ==
X-KPN-MID: 33|i0KOiYK/eVBccm5f2jqo5d4xrdsiV3Ji/YSDAnGDcCPA5xWLyjaxOJsn7pOh9H3
 iFrJFaSPiLNrNpzey/cC2C9wmBxMJxdXc8NZPc4O3c7s=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|jJZsHRvscpnOJUtSn7dP23nxa2UtJqiwfoRvAyto1Z45yoQT5fZUo/+qlJKaUBI
 hbGo3Sso7pFOKCYOEO70tcQ==
X-Originating-IP: 173.38.220.60
Received: from [10.47.77.219] (unknown [173.38.220.60])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id fa2cef34-d1d6-11ec-b208-00505699772e;
        Thu, 12 May 2022 11:36:20 +0200 (CEST)
Message-ID: <1491f7dd-4c35-135e-7385-dac0cc33d3bb@xs4all.nl>
Date:   Thu, 12 May 2022 11:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] adv7604: try all infoframe types
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When logging the infoframes the adv7604 driver stopped reading
infoframes at the first missing infoframe type. Instead it should
try all supported infoframe types.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index bb0c8fc6d383..497419a5cfdd 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -2505,9 +2505,8 @@ static void adv76xx_log_infoframes(struct v4l2_subdev *sd)
 		union hdmi_infoframe frame;
 		struct i2c_client *client = v4l2_get_subdevdata(sd);

-		if (adv76xx_read_infoframe(sd, i, &frame))
-			return;
-		hdmi_infoframe_log(KERN_INFO, &client->dev, &frame);
+		if (!adv76xx_read_infoframe(sd, i, &frame))
+			hdmi_infoframe_log(KERN_INFO, &client->dev, &frame);
 	}
 }


