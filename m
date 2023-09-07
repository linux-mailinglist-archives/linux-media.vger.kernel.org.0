Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D98FA797886
	for <lists+linux-media@lfdr.de>; Thu,  7 Sep 2023 18:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236920AbjIGQsH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 12:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243830AbjIGQrf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 12:47:35 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C911FE4
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 09:47:09 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso1091826f8f.0
        for <linux-media@vger.kernel.org>; Thu, 07 Sep 2023 09:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105133; x=1694709933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIu4eWCkEOSVtI8FoLJRLwwONGivM5mrULXtY5Z5HVI=;
        b=AA/YqvAFDZN9rOcDorb2MG7U6C8fvjdXzMa6+aGvx6sXT3HnfxYUO7BOijDh4WJB7n
         bgb5IId4m8wHdAKh/vEOVQ8nfFLjLh3LohER0xFFquuGi77WXhuOXVLTTaMGBcKi1QWC
         S+Vg6UuaQTVgKJ72Y7x/Y1ZLsHxArK9Cc4iNssN1g/haI1+sujBOJnqMZSqHHcK9GeSd
         CtzShgVtVH9Vr86UH3ODKOGECFur2eg4ANclTrzj5kt/tuHzrogMPUuqe0zvLzfqPlN4
         4p5r4Ltlb8qawgzcaS6PS8TromFh6J0jCS8tOounKpQCC2Tx9+h91X6ZlSk91Js6hTc4
         ww/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694105133; x=1694709933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIu4eWCkEOSVtI8FoLJRLwwONGivM5mrULXtY5Z5HVI=;
        b=kCR0H2ljZDgOzO1Z3rZbWzpgH4RlXk31r0pktgmr/X+CW68Xz7l+Hs/C4ghQRPoWbo
         j193erTNMhZSVSvT4N62stK7C92Avlp6gSKZZdb09S0SdolTZQcWzEvyqiaAMK2RIvvs
         CdIfa3b/JjKHte+uGkKgDKZBkBxMJTw8mkCT9Xt36YS9UXyhNma2hr856v5Ui1t5/su+
         QNLVo4bDTEn5J7RKGQ1MSJ/vslB96ZYxJbtPfiALhf8r6ird8N7qan1w6pGXa2DfUID1
         l8UBJ9NfGqnSNz2VAfUKiL1r3QWDRqzhjNil+uki0LRUm//t8w4O8pkB1l3FcJrpIMYY
         nVkw==
X-Gm-Message-State: AOJu0Yz888EtYDT/KnqZlVtqTQzyUqY+AdNn2tNZC8TnYDX5JAEL9CvF
        9mocoQnZ1rEmwj04JA4E6w9LItcqbK2pc12igUo=
X-Google-Smtp-Source: AGHT+IHYQm/x1ttHvlb4nOLzsoqtQcWa1sflGXM/+Y5olsT43jMQsj+a+Uw0WpuUCkC0LtSmUtNegg==
X-Received: by 2002:adf:d0ca:0:b0:317:e1fb:d56a with SMTP id z10-20020adfd0ca000000b00317e1fbd56amr5095651wrh.40.1694105077152;
        Thu, 07 Sep 2023 09:44:37 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d15-20020adffd8f000000b00317ab75748bsm23822145wrr.49.2023.09.07.09.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 09:44:36 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 17/17] media: qcom: camss: Comment CSID dt_id field
Date:   Thu,  7 Sep 2023 17:44:10 +0100
Message-ID: <20230907164410.36651-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
References: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Digging into the documentation we find that the DT_ID bitfield is used to
map the six bit DT to a two bit ID code. This value is concatenated to the
VC bitfield to create a CID value. DT_ID is the two least significant bits
of CID and VC the most significant bits.

Originally we set dt_id = vc * 4 in and then subsequently set dt_id = vc.

commit 3c4ed72a16bc ("media: camss: sm8250: Virtual channels for CSID")
silently fixed the multiplication by four which would give a better
value for the generated CID without mentioning what was being done or why.

Next up I haplessly changed the value back to "dt_id = vc * 4" since there
didn't appear to be any logic behind it.

Hans asked what the change was for and I honestly couldn't remember the
provenance of it, so I dug in.

Link: https://lore.kernel.org/linux-arm-msm/edd4bf9b-0e1b-883c-1a4d-50f4102c3924@xs4all.nl/

Add a comment so the next hapless programmer doesn't make this same
mistake.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 6ba2b10326444..cee50fc87e9de 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -352,6 +352,11 @@ static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 vc)
 		phy_sel = csid->phy.csiphy_id;
 
 	if (enable) {
+		/*
+		 * A value caled 'CID' gets generated internal to CAMSS logic
+		 * which is a concatenation of [vc:6 | dt_id:2] hence we reuse
+		 * the least significant two bits of the VC to 'stuff' the CID value.
+		 */
 		u8 dt_id = vc;
 
 		if (tg->enabled) {
-- 
2.41.0

