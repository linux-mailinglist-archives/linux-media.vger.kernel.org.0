Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1B2A1DAAF1
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 08:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbgETGri (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 02:47:38 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:48813 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726369AbgETGri (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 02:47:38 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.west.internal (Postfix) with ESMTP id D7724D1C;
        Wed, 20 May 2020 02:47:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 20 May 2020 02:47:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=oZGdJLeSGB/zw
        +6x9k3Co/WGEFpH0nRNgCfC7XHqDNw=; b=YyOcAtFB/ljnrqmxWzgfGGCSgXLxw
        Q42o/zai0c9AO7ECzKZL3nc3zKEU7Vhk7pQtsxRnRrm4YWFD73m+w1eTBbEyBj98
        k86kWLRNy/UfbKyl/h189Bpu9qMTTnInK5Zn/GEPHxf563HEceaQN9HKoKPrX8Sv
        dOzpqySFIEgghDFVdLI0dcLYavbW+PBgNZEKYewkEaC3vakXFkZwwnd8R3AiLeFR
        0XIfXFlqlc3RQh2CGuTQoUGm6SJDWA1806EPWopiB2QvDp8RVHiV9NqB+5OKm1MS
        Ak5Im8lvctmU2mCSsJNfhL0D6bNCZTrSW8z4S18ZBFCICNtWprV9FaaCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=oZGdJLeSGB/zw+6x9k3Co/WGEFpH0nRNgCfC7XHqDNw=; b=1O8SNbXr
        7wrHsiMfLyJYw3g8yGGJDpQYQvYiygdSkwT2/eo+h5nbZUq5GkUyZhfQ9BYYKmco
        s8ENe+qv470mtMjNb7zDWouuExKMn0nwbir8ajZJTGhSYdqRVzYcCjvc/zYJpZRu
        0PZJbeexgdVSXB66xGbBP1FlfZW1XeU0fuT6/rCde/0JhzLaXfUfE7qZjBnWUfh8
        o8/lQ+VJC3ke8YURox8r1u4Jet38IzS6rFm9NlwShMW/Y0/b+1EBM/93WDj/jVEi
        ic+/Fl5m7U7OYwlmSmrq32j+DDIPyGE9aY8P3KvI0xKG9vgJoIrcn05zIyGDy5hY
        dnN+g34npVMKdg==
X-ME-Sender: <xms:htLEXpnidDH7zLEUMGen76s2MMgQ0Dqntt5k_ZZGtejaIds8vOqtug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtkedguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
    rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpeduuefffe
    eiteeludevieetgeeiueelfeeifffhheetveeiveelfeetheeuhfektdenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecukfhppedukedtrddvfeehrdefrdehgeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhi
    sehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:htLEXk0NXO3PXWS5KqwCRvjjpbUH7oJuL3gbTlPiRrCYopG-OMXRRQ>
    <xmx:htLEXvovgcR4-XxIrzvAVJKQMGw0CR_4apR0YTcsERXdRwn9RbZCdQ>
    <xmx:htLEXpl1dwcJr-KpIkleLO71QX09_Fb51qJQXECVWuEv3FcpfQczOQ>
    <xmx:iNLEXpwuqZrd-ahDQ3Qdk_hug6IarPC8LFcr6h8QTWxJ9FgFA2ryzM6ISlA>
Received: from workstation.flets-east.jp (ad003054.dynamic.ppp.asahi-net.or.jp [180.235.3.54])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1BF67328005E;
        Wed, 20 May 2020 02:47:31 -0400 (EDT)
From:   Takashi Sakamoto <o-takashi@sakamocchi.jp>
To:     oscar.carter@gmx.com, keescook@chromium.org, mchehab@kernel.org,
        clemens@ladisch.de, tiwai@suse.de, perex@perex.cz
Cc:     kernel-hardening@lists.openwall.com,
        linux1394-devel@lists.sourceforge.net,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        levonshe@gmail.com, alsa-devel@alsa-project.org,
        stefanr@s5r6.in-berlin.de
Subject: [PATCH 1/2] firewire-core: add kernel API to construct multichannel isoc context
Date:   Wed, 20 May 2020 15:47:25 +0900
Message-Id: <20200520064726.31838-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200520064726.31838-1-o-takashi@sakamocchi.jp>
References: <20200520064726.31838-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In 1394 OHCI specification, IR context has several modes. One of mode
is 'multiChanMode'. For this mode, Linux FireWire stack has
FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL flag apart from FW_ISO_CONTEXT_RECEIVE,
and associated internal callback. However, code of firewire-core driver
includes cast of function callback for the mode and this brings
inconvenient to effort of Control Flow Integrity builds.

This commit is a preparation to remove the cast. A new kernel API for the
mode is added and existent API is specific for FW_ISO_CONTEXT_RECEIVE and
FW_ISO_CONTEXT_TRANSMIT modes. Actually, no in-kernel driver uses the mode
and the additional kernel API is never used at present.

Reported-by: Oscar Carter <oscar.carter@gmx.com>
Reference: https://lore.kernel.org/lkml/20200519173425.4724-1-oscar.carter@gmx.com/
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-iso.c | 17 +++++++++++++++++
 include/linux/firewire.h    |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/drivers/firewire/core-iso.c b/drivers/firewire/core-iso.c
index 185b0b78b3d6..07e967594f27 100644
--- a/drivers/firewire/core-iso.c
+++ b/drivers/firewire/core-iso.c
@@ -152,6 +152,23 @@ struct fw_iso_context *fw_iso_context_create(struct fw_card *card,
 }
 EXPORT_SYMBOL(fw_iso_context_create);
 
+struct fw_iso_context *fw_iso_mc_context_create(struct fw_card *card,
+		int type, int channel, int speed, size_t header_size,
+		fw_iso_mc_callback_t callback, void *callback_data)
+{
+	struct fw_iso_context *ctx;
+
+	ctx = fw_iso_context_create(card, type, channel, speed, header_size,
+				    NULL, callback_data);
+	if (IS_ERR(ctx))
+		return ctx;
+
+	ctx->callback.mc = callback;
+
+	return ctx;
+}
+EXPORT_SYMBOL(fw_iso_mc_context_create);
+
 void fw_iso_context_destroy(struct fw_iso_context *ctx)
 {
 	ctx->card->driver->free_iso_context(ctx);
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index aec8f30ab200..9477814ab12a 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -453,6 +453,9 @@ struct fw_iso_context {
 struct fw_iso_context *fw_iso_context_create(struct fw_card *card,
 		int type, int channel, int speed, size_t header_size,
 		fw_iso_callback_t callback, void *callback_data);
+struct fw_iso_context *fw_iso_mc_context_create(struct fw_card *card,
+		int type, int channel, int speed, size_t header_size,
+		fw_iso_mc_callback_t callback, void *callback_data);
 int fw_iso_context_set_channels(struct fw_iso_context *ctx, u64 *channels);
 int fw_iso_context_queue(struct fw_iso_context *ctx,
 			 struct fw_iso_packet *packet,
-- 
2.25.1

