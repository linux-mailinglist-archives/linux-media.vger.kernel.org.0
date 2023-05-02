Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7D4D6F3C5F
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 05:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233062AbjEBD16 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 23:27:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbjEBD14 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 23:27:56 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F0693ABB
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 20:27:55 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 3F3E966032AB;
        Tue,  2 May 2023 04:27:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682998074;
        bh=XkeN/qQVmfmC8oidFHYrDT1UY3Hs94YGtRO8mJj2lNs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=K9eryGCLHZlZRsaNwrLUvVNuo3LpdoVZ10SkwoVU5DOP/IY5Uf2F3rzW3QAEJ7Ys1
         HNrtg106+JfE0L7RzWzwWx/1hCOEY4dOotHAO14e46ipAxV7QbWTpHAaUyJVKhGPQi
         u8m4p7loe8gBGoVsZG7M2NR3L71cTmoSzm35ahOuJSQfiKIAvsrnRjf2zyyboxIkLM
         hbVxln17K7lEnsk4gZXXcWD4mCpULP7XgUrojHY6+vYklhgZpNXBuX1hzv/q30NUCD
         un3W+kvmHH8GvsBNe4dJz6hCB86je465MHAcydcvHhd8EcFq4Igtn89eYHRh/u68/p
         OfUz8KghEdhaQ==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 02/13] media: bttv: replace BUG with WARN_ON
Date:   Mon,  1 May 2023 20:27:20 -0700
Message-Id: <af05ae65c81c7e1d95f3a37063101a763de46e44.1682995256.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1682995256.git.deborah.brouwer@collabora.com>
References: <cover.1682995256.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Both BUG and BUG_ON are replaced with WARN_ON wherever they would still be
present after the vb2 conversion. WARN_ON is sufficient in these cases.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/media/pci/bt8xx/bttv-driver.c | 10 +++++-----
 drivers/media/pci/bt8xx/bttv-risc.c   |  8 ++++----
 drivers/media/pci/bt8xx/bttv-vbi.c    |  6 +++---
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index 0d5fdb8479d5..6e19d3d35ffb 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -1111,8 +1111,8 @@ set_tvnorm(struct bttv *btv, unsigned int norm)
 	const struct bttv_tvnorm *tvnorm;
 	v4l2_std_id id;
 
-	BUG_ON(norm >= BTTV_TVNORMS);
-	BUG_ON(btv->tvnorm >= BTTV_TVNORMS);
+	WARN_ON(norm >= BTTV_TVNORMS);
+	WARN_ON(btv->tvnorm >= BTTV_TVNORMS);
 
 	tvnorm = &bttv_tvnorms[norm];
 
@@ -1910,8 +1910,8 @@ limit_scaled_size_lock       (struct bttv_fh *               fh,
 	__s32 max_height;
 	int rc;
 
-	BUG_ON((int) width_mask >= 0 ||
-	       width_bias >= (unsigned int) -width_mask);
+	WARN_ON((int)width_mask >= 0 ||
+		width_bias >= (unsigned int)(-width_mask));
 
 	/* Make sure tvnorm, vbi_end and the current cropping parameters
 	   remain consistent until we're done. */
@@ -2026,7 +2026,7 @@ static int bttv_resource(struct bttv_fh *fh)
 		res = RESOURCE_VBI;
 		break;
 	default:
-		BUG();
+		WARN_ON(1);
 	}
 	return res;
 }
diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8xx/bttv-risc.c
index 4fa4b9da9634..fae8b10de7a9 100644
--- a/drivers/media/pci/bt8xx/bttv-risc.c
+++ b/drivers/media/pci/bt8xx/bttv-risc.c
@@ -106,7 +106,7 @@ bttv_risc_packed(struct bttv *btv, struct btcx_riscmem *risc,
 
 	/* save pointer to jmp instruction address */
 	risc->jmp = rp;
-	BUG_ON((risc->jmp - risc->cpu + 2) * sizeof(*risc->cpu) > risc->size);
+	WARN_ON((risc->jmp - risc->cpu + 2) * sizeof(*risc->cpu) > risc->size);
 	return 0;
 }
 
@@ -227,7 +227,7 @@ bttv_risc_planar(struct bttv *btv, struct btcx_riscmem *risc,
 
 	/* save pointer to jmp instruction address */
 	risc->jmp = rp;
-	BUG_ON((risc->jmp - risc->cpu + 2) * sizeof(*risc->cpu) > risc->size);
+	WARN_ON((risc->jmp - risc->cpu + 2) * sizeof(*risc->cpu) > risc->size);
 	return 0;
 }
 
@@ -646,7 +646,7 @@ bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 					 bpf,bpl,0,0,buf->vb.height >> 1);
 			break;
 		default:
-			BUG();
+			WARN_ON(1);
 		}
 	}
 
@@ -737,7 +737,7 @@ bttv_buffer_risc(struct bttv *btv, struct bttv_buffer *buf)
 					 0);
 			break;
 		default:
-			BUG();
+			WARN_ON(1);
 		}
 	}
 
diff --git a/drivers/media/pci/bt8xx/bttv-vbi.c b/drivers/media/pci/bt8xx/bttv-vbi.c
index 24b28a05bfd9..0b05309d1fb7 100644
--- a/drivers/media/pci/bt8xx/bttv-vbi.c
+++ b/drivers/media/pci/bt8xx/bttv-vbi.c
@@ -250,7 +250,7 @@ static int try_fmt(struct v4l2_vbi_format *f, const struct bttv_tvnorm *tvnorm,
 	if (min_start > max_start)
 		return -EBUSY;
 
-	BUG_ON(max_start >= max_end);
+	WARN_ON(max_start >= max_end);
 
 	f->sampling_rate    = tvnorm->Fsc;
 	f->samples_per_line = VBI_BPL;
@@ -430,8 +430,8 @@ void bttv_vbi_fmt_reset(struct bttv_vbi_fmt *f, unsigned int norm)
 	real_count              = ((tvnorm->cropcap.defrect.top >> 1)
 				   - tvnorm->vbistart[0]);
 
-	BUG_ON(real_samples_per_line > VBI_BPL);
-	BUG_ON(real_count > VBI_DEFLINES);
+	WARN_ON(real_samples_per_line > VBI_BPL);
+	WARN_ON(real_count > VBI_DEFLINES);
 
 	f->tvnorm               = tvnorm;
 
-- 
2.39.2

