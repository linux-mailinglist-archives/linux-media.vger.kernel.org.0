Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3768379787B
	for <lists+linux-media@lfdr.de>; Thu,  7 Sep 2023 18:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244289AbjIGQrO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Sep 2023 12:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234922AbjIGQqx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Sep 2023 12:46:53 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DCD92125
        for <linux-media@vger.kernel.org>; Thu,  7 Sep 2023 09:46:20 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-402cc6b8bedso13271075e9.1
        for <linux-media@vger.kernel.org>; Thu, 07 Sep 2023 09:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105077; x=1694709877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIu4eWCkEOSVtI8FoLJRLwwONGivM5mrULXtY5Z5HVI=;
        b=Zg6OBfUH4MExpnSfXQB3UVHFUUKI1ixC15c3XqL5WZQYf7FpAURcJgiicPUwFSPWW/
         uGclQ0DZhVIdeOxNG9hHhUpSa/AokckeED6ffsXDxU3qe7wDUGVAPL+AMnk1pF+f7la3
         rY2ckNU3ZY2Y3amh+5ghwswnX9LqVIpQDdKeB1VkHevANpGXiOHNQHPYOfzp3+1Ob61P
         4AVQImJ41RKowwuM4L87uGGiTM4Mam3uw0pv/AhsVIj6CsyuGUd7AoSzq8rOpRAXB9VF
         bCs2DGj44UOkg9ckKD7B+LyQTSI70SLa5XXKJLwDyzZQ8tEAlPC3H53PVygCYuXQ8p0q
         sjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694105077; x=1694709877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIu4eWCkEOSVtI8FoLJRLwwONGivM5mrULXtY5Z5HVI=;
        b=OaX/mQq9riEz2Z2nZNx7RksQn2ZTGpRgix/DKgTP25m2mJo7ymU9yx1JTiqyIJtDOR
         SvisbDSetIaGTeocz5/+XyCy/sQx4mQPlVvKd3IEnU6DDgH9FUPKWSf8TNziCaNmVloe
         zZRv4k8bCx+r5FECkI2oahMbitDifQpODc8EWrOgToCiaWcoCdbdfxcrH+FB/oUroqx4
         VYsfsILpfMHLDztZbViaO0FGJPdcBKY6S1yTvzUlXDsIC1i30omMm7Nu+PjWHMLFu4ys
         l+K3KhVjoTH9ZoNf0zITB6mjT6ctklAF4HR+8KuhrNdTbY0FFhaBTodjUpdb+Bp+KJm4
         /+UA==
X-Gm-Message-State: AOJu0YypE4XvZZPR3MXVLzjWcZ58EA5KnCEtj8jHvhpUunO2XBibWxl6
        OGQqROJqxdW7yeUpvauzuM9v/w==
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

