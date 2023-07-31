Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96A2B769B13
	for <lists+linux-media@lfdr.de>; Mon, 31 Jul 2023 17:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232463AbjGaPrb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Jul 2023 11:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbjGaPr2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Jul 2023 11:47:28 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6720511A
        for <linux-media@vger.kernel.org>; Mon, 31 Jul 2023 08:47:27 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 128951F8A4;
        Mon, 31 Jul 2023 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1690818446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7xzGyeOqADYuhvj9+f7Ht1+vWxKhBHvAgQBKLm+82Kc=;
        b=I2b+aLsv1a+mhlVVFFTmUyeFxV3ah6hcx7cpXBJTWxqyXWC4ij1ICKX4xcOa79AL5CU7Mn
        oTvKXOIiYGT6llyQ0+tcycloVEgQSpi5NTo9Gk15+YK4+rE1NKNK1BSj1MpkZqZo4O6M/k
        p0thvhXAFIoMstb8CMmrGT6YhtYb5Y4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1690818446;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7xzGyeOqADYuhvj9+f7Ht1+vWxKhBHvAgQBKLm+82Kc=;
        b=yWTBfounRAZaa1yN1FUOJOlogvaJkE7A3YoLrkiLvu3mV0+nla53+ok9v0VmwDCd0c7olD
        p0gT1VPRwL9skQCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D3CC61322C;
        Mon, 31 Jul 2023 15:47:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id OFTwMo3Xx2Q3fwAAMHmgww
        (envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:47:25 +0000
From:   Takashi Iwai <tiwai@suse.de>
To:     alsa-devel@alsa-project.org
Cc:     Takashi Iwai <tiwai@suse.de>,
        Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Andrey Utkin <andrey_utkin@fastmail.com>,
        Ismael Luceno <ismael@iodev.co.uk>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 16/24] media: solo6x10: Convert to generic PCM copy ops
Date:   Mon, 31 Jul 2023 17:47:10 +0200
Message-Id: <20230731154718.31048-17-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch converts the solo6x10 driver code to use the new unified
PCM copy callback.  It's a straightforward conversion from *_user() to
*_sockptr() variants.

Cc: Bluecherry Maintainers <maintainers@bluecherrydvr.com>
Cc: Anton Sviridenko <anton@corp.bluecherry.net>
Cc: Andrey Utkin <andrey_utkin@fastmail.com>
Cc: Ismael Luceno <ismael@iodev.co.uk>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/pci/solo6x10/solo6x10-g723.c | 41 +++++-----------------
 1 file changed, 8 insertions(+), 33 deletions(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-g723.c b/drivers/media/pci/solo6x10/solo6x10-g723.c
index 6cebad665565..cf134810b8ec 100644
--- a/drivers/media/pci/solo6x10/solo6x10-g723.c
+++ b/drivers/media/pci/solo6x10/solo6x10-g723.c
@@ -204,12 +204,13 @@ static snd_pcm_uframes_t snd_solo_pcm_pointer(struct snd_pcm_substream *ss)
 	return idx * G723_FRAMES_PER_PAGE;
 }
 
-static int snd_solo_pcm_copy_user(struct snd_pcm_substream *ss, int channel,
-				  unsigned long pos, void __user *dst,
-				  unsigned long count)
+static int snd_solo_pcm_copy(struct snd_pcm_substream *ss, int channel,
+			     unsigned long pos, sockptr_t dst,
+			     unsigned long count)
 {
 	struct solo_snd_pcm *solo_pcm = snd_pcm_substream_chip(ss);
 	struct solo_dev *solo_dev = solo_pcm->solo_dev;
+	unsigned int off = 0;
 	int err, i;
 
 	for (i = 0; i < (count / G723_FRAMES_PER_PAGE); i++) {
@@ -223,35 +224,10 @@ static int snd_solo_pcm_copy_user(struct snd_pcm_substream *ss, int channel,
 		if (err)
 			return err;
 
-		if (copy_to_user(dst, solo_pcm->g723_buf, G723_PERIOD_BYTES))
+		if (copy_to_sockptr_offset(dst, off,
+					   solo_pcm->g723_buf, G723_PERIOD_BYTES))
 			return -EFAULT;
-		dst += G723_PERIOD_BYTES;
-	}
-
-	return 0;
-}
-
-static int snd_solo_pcm_copy_kernel(struct snd_pcm_substream *ss, int channel,
-				    unsigned long pos, void *dst,
-				    unsigned long count)
-{
-	struct solo_snd_pcm *solo_pcm = snd_pcm_substream_chip(ss);
-	struct solo_dev *solo_dev = solo_pcm->solo_dev;
-	int err, i;
-
-	for (i = 0; i < (count / G723_FRAMES_PER_PAGE); i++) {
-		int page = (pos / G723_FRAMES_PER_PAGE) + i;
-
-		err = solo_p2m_dma_t(solo_dev, 0, solo_pcm->g723_dma,
-				     SOLO_G723_EXT_ADDR(solo_dev) +
-				     (page * G723_PERIOD_BLOCK) +
-				     (ss->number * G723_PERIOD_BYTES),
-				     G723_PERIOD_BYTES, 0, 0);
-		if (err)
-			return err;
-
-		memcpy(dst, solo_pcm->g723_buf, G723_PERIOD_BYTES);
-		dst += G723_PERIOD_BYTES;
+		off += G723_PERIOD_BYTES;
 	}
 
 	return 0;
@@ -263,8 +239,7 @@ static const struct snd_pcm_ops snd_solo_pcm_ops = {
 	.prepare = snd_solo_pcm_prepare,
 	.trigger = snd_solo_pcm_trigger,
 	.pointer = snd_solo_pcm_pointer,
-	.copy_user = snd_solo_pcm_copy_user,
-	.copy_kernel = snd_solo_pcm_copy_kernel,
+	.copy = snd_solo_pcm_copy,
 };
 
 static int snd_solo_capture_volume_info(struct snd_kcontrol *kcontrol,
-- 
2.35.3

