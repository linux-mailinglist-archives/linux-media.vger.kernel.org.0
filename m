Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C00756FC9CB
	for <lists+linux-media@lfdr.de>; Tue,  9 May 2023 17:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236031AbjEIPDQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 May 2023 11:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236030AbjEIPDO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 May 2023 11:03:14 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8597A3A91
        for <linux-media@vger.kernel.org>; Tue,  9 May 2023 08:03:12 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-30786c6082dso2397670f8f.2
        for <linux-media@vger.kernel.org>; Tue, 09 May 2023 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yngvason.is; s=google; t=1683644591; x=1686236591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pK5NzJ9ziuEkY80D3VsCAngV63DKm6HcJ44c4nALZ6M=;
        b=XMOznpr6W1KHCA3b+rQxaF5bEyjaIcsYUadoMEOEvgkJZD8+jxnACLfdz8qoUCpBOG
         A4oJoNDTz3MPil2JhCRqxGJCYZRsOwNvr4saOm2EqMD+nm+Tg3qYbmQOy4YmB0w2myil
         4ZqRrFOOEpGlJaRNTVXO1VbEsHxf4nLp4zQqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683644591; x=1686236591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pK5NzJ9ziuEkY80D3VsCAngV63DKm6HcJ44c4nALZ6M=;
        b=C9zbyz2yAY1UNvtzQZ94dX7qysKkd9crNP5bCDXnH5b48BN7QgQZLhVA6/yFAuHrAg
         cFHkHG7nxW8roRZzNt6nLRDbvmlAo/QJ7UtKTQSOGqCv1tsXKYJGr0bcVqVEvbe6w0z9
         ffbDMm27XRmMXJp5fkCLRy5Rpp928uUvPnktJlMORLHdLZUQ9ZHOyTZM30UXdf/hHYa1
         RiEq6Yj5sIt9hFrOdGsQ3Fq4uBZLesoLNtt9ryfSv+BO7OIf2c23oUmJkyTyabdL+hEe
         FMFcuT6j4SmsTqz0bHC9BTHv1dJzCj/qgFtQ1s6Cm7mNAEG4UaXDHkfgyAtrDS4NfgIA
         YN0Q==
X-Gm-Message-State: AC+VfDwzBipMzgsauDrMGU9KU2Mwf+8xf5mZEsQ3AABv9S1aqs17l3/y
        G8JygXOpH7L0vZqbTR12T3C/AA==
X-Google-Smtp-Source: ACHHUZ431gDx8koKiopG2pHzobK49xX78f7b+WGWOqHizQK63Gg2QRw2Un0jJXpeolN9dCE6zsn1bg==
X-Received: by 2002:adf:e84e:0:b0:306:35fa:202b with SMTP id d14-20020adfe84e000000b0030635fa202bmr9242698wrn.6.1683644590162;
        Tue, 09 May 2023 08:03:10 -0700 (PDT)
Received: from andri-workstation.turninn.appdynamic.com ([2a01:8280:aa07:ad:7285:c2ff:fef0:4baf])
        by smtp.gmail.com with ESMTPSA id n10-20020a5d400a000000b00307a3045d65sm2588373wrp.46.2023.05.09.08.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 08:03:09 -0700 (PDT)
From:   Andri Yngvason <andri@yngvason.is>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     Andri Yngvason <andri@yngvason.is>
Subject: [PATCH 2/2] media: verisilicon: rockchip_vpu2_hw_jpeg_enc: Add data_offset to source addresses
Date:   Tue,  9 May 2023 15:02:49 +0000
Message-Id: <20230509150249.824440-2-andri@yngvason.is>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509150249.824440-1-andri@yngvason.is>
References: <20230509150249.824440-1-andri@yngvason.is>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This accommodates planes that are backed by a single dmabuf.

Signed-off-by: Andri Yngvason <andri@yngvason.is>
---
 drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
index 52c76fb91c56..716c248dc2bf 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c
@@ -99,7 +99,8 @@ static void rockchip_vpu2_jpeg_enc_set_buffers(struct hantro_dev *vpu,
 	vepu_write_relaxed(vpu, size_left, VEPU_REG_STR_BUF_LIMIT);
 
 	for (i = 0; i < num_planes; i++) {
-		src = vb2_dma_contig_plane_dma_addr(src_buf, i);
+		src = vb2_dma_contig_plane_dma_addr(src_buf, i) +
+			src_buf->planes[i].data_offset;
 		vepu_write_relaxed(vpu, src, __vepu_reg_addr_for_plane(i));
 	}
 }
-- 
2.40.1

