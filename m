Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234F634A7F6
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 14:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhCZNTh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 09:19:37 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:44891 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229882AbhCZNTH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 09:19:07 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id PmMgl50VX43ycPmMkl3lwX; Fri, 26 Mar 2021 14:19:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616764746; bh=XFwB8lNGG/PoztTlQE2ZWLxvoRXPfG2lERyMv+lwx/U=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=EUWbdRR0eJy/r7qVDU9G25N9F4mIUXgZByurMVOhHFuhGFV0CP3lzEI1Ytz6zv4n8
         vTuHIqxb6E/8LNmLHcTGSLEGuvRsdYdj8d/+WgQnWhgrowbhdDnIh57A28ZGviI+1N
         +0jtjt28UQyHPgsVT1tebB50NY+uZGQuwe85/zQi5ObNFR17/+Ts/5EqwLwMwPvKAM
         PwUWiUQQWq7MVQ3WDWfo2wgxA/9pOEzITLn+PWlH0nOLcXfq4kuT8PymjT4HFrI57m
         8OaXPrz4uz5oKkn0c/dJy8rcxjaQul5o/mRQqsEwaYd/hG1V4hn85GE8WKf18j7v04
         iOQMm3HULZ7rg==
To:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2] drm/bridge: adv7511: fix support for large EDIDs
Message-ID: <eeefa323-1273-10f9-0e26-0efc41ab8763@xs4all.nl>
Date:   Fri, 26 Mar 2021 14:19:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfHFTotcOZlQvI4R+7yJnKTXZFDSrFYvOWA2ESOG/SfcZoNotP72IBOXXe4ctUCvvyU92x7YObpsD8mOWKV4TxXXtdeuyEk517hu9AUm669pd+6a838oY
 huLrUrHFg9DwDTrtHrwnemlAZt7l6//HrmjM6WHEpYuNZNuG/Elw/IvVbgmC7x+ImHz8ISo3lVAgtXlS9Fd8pK82wXlGfRivugC8ChoFU67dkZbodaDuxbcx
 bx7pIpY42HfoTP2KGdp2LrXHzCssCum/KQ5h2sl07ujLMjUwOBEYB8TOg38A8MFcIFkEC8RkZCKna9AQI/19qAXLQ0jBw8n7lw/7U7QgchM=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While testing support for large (> 256 bytes) EDIDs on the Renesas
Koelsch board I noticed that the adv7511 bridge driver only read the
first two blocks.

The media V4L2 version for the adv7511 (drivers/media/i2c/adv7511-v4l2.c)
handled this correctly.

Besides a simple bug when setting the segment register (it was set to the
block number instead of block / 2), the logic of the code was also weird.
In particular reading the DDC_STATUS is odd: this is unrelated to EDID
reading.

The reworked code just waits for any EDID segment reads to finish (this
does nothing if the a segment is already read), checks if the desired
segment matches the read segment, and if not, then it requests the new
segment and waits again for the EDID segment to be read.

Finally it checks if the currently buffered EDID segment contains the
desired EDID block, and if not it will update the EDID buffer from
the adv7511.

Tested with my Koelsch board and with EDIDs of 1, 2, 3 and 4 blocks.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Changes since v2: make current_edid_segment an int (it's set to -1 after all)
and use that instead of reading ADV7511_REG_EDID_SEGMENT. Also sprinkle a
few comments in the code.
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 40 +++++++++++++-------
 2 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index a9bb734366ae..3dd29c578fc9 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -342,7 +342,7 @@ struct adv7511 {
 	unsigned int f_audio;
 	unsigned int audio_source;

-	unsigned int current_edid_segment;
+	int current_edid_segment;
 	uint8_t edid_buf[256];
 	bool edid_read;

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 76555ae64e9c..43fefdd8d92b 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -327,7 +327,12 @@ static void adv7511_set_link_config(struct adv7511 *adv7511,

 static void __adv7511_power_on(struct adv7511 *adv7511)
 {
+	/*
+	 * The adv7511 will start reading the first EDID segment as
+	 * soon as it is powered on.
+	 */
 	adv7511->current_edid_segment = -1;
+	adv7511->edid_read = false;

 	regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER,
 			   ADV7511_POWER_POWER_DOWN, 0);
@@ -526,6 +531,7 @@ static int adv7511_wait_for_edid(struct adv7511 *adv7511, int timeout)
 static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
 				  size_t len)
 {
+	unsigned int need_segment = block / 2;
 	struct adv7511 *adv7511 = data;
 	struct i2c_msg xfer[2];
 	uint8_t offset;
@@ -535,23 +541,29 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
 	if (len > 128)
 		return -EINVAL;

-	if (adv7511->current_edid_segment != block / 2) {
-		unsigned int status;
+	/* wait for any ongoing EDID segment reads to finish */
+	adv7511_wait_for_edid(adv7511, 200);

-		ret = regmap_read(adv7511->regmap, ADV7511_REG_DDC_STATUS,
-				  &status);
+	/*
+	 * If the current read segment does not match what we need, then
+	 * write the new segment and wait for it to be read.
+	 *
+	 * Note that after power on the adv7511 starts reading segment 0
+	 * of the EDID automatically. So if current_edid_segment < 0, then
+	 * we do not need to write the EDID_SEGMENT register again, since
+	 * it is already reading segment 0.
+	 */
+	if (adv7511->current_edid_segment >= 0 &&
+	    adv7511->current_edid_segment != need_segment) {
+		adv7511->edid_read = false;
+		regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
+			     need_segment);
+		ret = adv7511_wait_for_edid(adv7511, 200);
 		if (ret < 0)
 			return ret;
+	}

-		if (status != 2) {
-			adv7511->edid_read = false;
-			regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
-				     block);
-			ret = adv7511_wait_for_edid(adv7511, 200);
-			if (ret < 0)
-				return ret;
-		}
-
+	if (adv7511->current_edid_segment != need_segment) {
 		/* Break this apart, hopefully more I2C controllers will
 		 * support 64 byte transfers than 256 byte transfers
 		 */
@@ -579,7 +591,7 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
 			offset += 64;
 		}

-		adv7511->current_edid_segment = block / 2;
+		adv7511->current_edid_segment = need_segment;
 	}

 	if (block % 2 == 0)
-- 
2.30.1

