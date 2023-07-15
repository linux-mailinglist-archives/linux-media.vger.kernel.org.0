Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7EC754634
	for <lists+linux-media@lfdr.de>; Sat, 15 Jul 2023 04:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjGOCQ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jul 2023 22:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjGOCQ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jul 2023 22:16:28 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12A3D30DF
        for <linux-media@vger.kernel.org>; Fri, 14 Jul 2023 19:16:26 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 1FA216607064;
        Sat, 15 Jul 2023 03:16:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1689387385;
        bh=c0E3oU28NP/o6F0xmBkfSx+OCVZc2wDFhT67ENqE/oU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RWpFG31AcPhmvNUhb0xrnSZiXOXPLm9/axVdzmpxQ+3xDxY4WvvWqE3dofUxsFsW4
         39Wv6eZP4r9+VnarRqaQPHd8uBXAnHrJ8+7moYbSRXejzhvLIn9p8IGfqkcjpwdLeC
         MPM1I47tOMYK3mg93X9JqWTwM+wThNZXYQpzph68mrgWzacwyUFfrXTZPEybwyDaj6
         PeBQ4w9XQhzJMw88S/lXGwEDAp/XdcqXTVk0f6QiUF3CVjS9NtFuuBvYyncgmmNpFR
         uL5+HM79LyKR3Nw4NI7oUPTM49nWJtNq0PZb4jXrPFooaPpMF8XKNBA3/XpMElZYC9
         1pzR4HtLCsnYw==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, deborahbrouwer3563@gmail.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v3 02/13] media: bttv: replace BUG with WARN_ON
Date:   Fri, 14 Jul 2023 19:15:58 -0700
Message-Id: <c854348e55dcbb961b44c49d75cf161142be37f3.1689379982.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1689379982.git.deborah.brouwer@collabora.com>
References: <cover.1689379982.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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
2.40.1

