Return-Path: <linux-media+bounces-55231-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CC1sMch6sGnLjgIAu9opvQ
	(envelope-from <linux-media+bounces-55231-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:10:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69862257638
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0E483232D4F
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 20:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DEC3E9298;
	Tue, 10 Mar 2026 20:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naTXuOfZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EF23E8C44
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 20:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173200; cv=none; b=arASP/lkPcPAmmeLbeX0fzUUfgHWx9g5SK/95bdHmsiLqxVhe+Ftkb2oQO5CgfB+r54BRu/uwmVlG7zmt32LKNZ9QFRh8A+5ui3oL/kiS7F2fq40NhQUhFYapH6RWcHBztHdROogQaVP2M/PfDuogg8ol+vIg+E8B9Vv9dtQbKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173200; c=relaxed/simple;
	bh=/7JruJpa7ywq82KD85xOZTvhatrgKy0BagtYB7uZ79g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iXBLsDMtH+NyIPOnKt+/ne6fi37G8eNmv3h9ioNHxQPke0fDiFePNBPWyMLoD1wwUiiOShrqo9+xLuWfRVuNZn3Yf9pZVaMtt8PK6vLFtOTJhmR0t7Hscb7I0yXHCur4wEjFW61EiW0FwoJEtmhwtaOUXoIY1l3rjW526ZBp4n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=naTXuOfZ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-829756f3ee9so5955606b3a.2
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 13:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173198; x=1773777998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPe88jYT4Koj6mAx2acbFPR53xRU3O301fVKhXPrOjk=;
        b=naTXuOfZDLAAIoPTkTaHvY+bAxgT0YHcZI5xzbV0WGkhqrAtqzzuoKj5Db/gNeChYX
         x1wivouGjkattpZz6PoJEKg7kmF1QXbG1m3I8HktZ9NjJSyFlH5qmGScAwNiy2//XhVc
         j6x+kOKjhv278n7eOQ42Cofn4hCkDCMFYF4qm6dT8KOzYpfg/jfPHixIZSuJxz2kCiYM
         YszjZ7soDEiXutKyPBeeuVBK1uvNG61U2YmXmttSP/dY13JiFn9zzbLsFRyog3NiC9vm
         m4mwzmvC8mlD67OCBIaBiQGdxBz5Qr2OmhhtUG353ULbTSRDyd9P0Jx3G0kcXLegXQd6
         zOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173198; x=1773777998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qPe88jYT4Koj6mAx2acbFPR53xRU3O301fVKhXPrOjk=;
        b=Wnz+zw20U/D3ywFT1tTmwnn6g9miUuIdXjD2zXrSy7xBZ4x7YTaVnTizX6n1iKepsQ
         dT/oMF2H9hoDDnF4/mjVP7IgrhxrOptvoYJOYr89XBDDw/+/ZH0mVQgxgmKScAnfkBWR
         2k4b3thv1IXjSgUMv5EycIe47t6kvF+wJTVf3xUzt1wcLf7DwIi0DCPjlY9IWzyIJC5b
         Pji7WNRskUdn1hAafDfE70SEDyKdq/sT3pNiW0V9kC9UYqoXVHqj/FYmyN1GaWZWa3DK
         fm4XmvsFg9akoMpc5AJj0Hbc1jrDvOoXt2r/1tFwqF51jZSUU9B+5TSTQC+0byBFDG8/
         nBCA==
X-Forwarded-Encrypted: i=1; AJvYcCXVdwciL3YNu9E3pVhhAnncs5zqNHW+7wczMI2HryyoXj6i+eshg0dBoFrND5Ego/ORK7ojriQg99ArRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8EoBmAVtuCMas8m3jQ23dwc6jmBtibjRCg2iflzzAV044a50h
	NGo9fSW83MXCBJjzklRmcE1vUwL3Ga4FIvOaSLF9njgirE41TZFWzWHY
X-Gm-Gg: ATEYQzzmkvTCuP+P3Ij3AMa3FWo+oFarJ5BNbWpCTGHGDhvGekWSemp/JxqqFbSdpy0
	EGniB0mvRMcIYo2b0e72FgRxmEPW78xX/JfylBzHhnx6RrQufGBRXQwKC1tY6cjmND1RPhPHRub
	nExjx8cCGEZZHB+qpKrXP8mygtAzmfeOAWRXN6vAfoVOvjJ7vgegKjSRFrHNZZW/7UN7WXYovAf
	485YDzEcf77tGu/4YSinRzoJSLgvc0rieYza5z+E7rm8n4Jq2xIFZr+Fnhq2rpY9UV9Bk8H+C21
	Yxonjw7jumHZ8dWXiuiKQ4CvKzPA3SFQ+54b+YliOJMV59U9zEdZGmrdHePqO8UI06tY1c2FfV+
	ryg/n0ITPNsHnj3T/TnosJ6ltkO5BCjp74RJ3MAALmK2th8K/zgXkFIney/1PVOQ4ZrLxLsi+Q7
	th65Ee8cSP0D9rgknJldfICGzQH78IExT3/5HadxGuOkhdem9U
X-Received: by 2002:a05:6a00:2d8f:b0:829:af4a:5ebc with SMTP id d2e1a72fcca58-829f6eed76dmr146730b3a.7.1773173197615;
        Tue, 10 Mar 2026 13:06:37 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:06:37 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 6/7] media: allegro: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:12 +0530
Message-Id: <20260310200513.2162018-7-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 69862257638
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,pengutronix.de,nabijaczleweli.xyz,gmail.com,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-55231-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,mediatek.com,gmail.com,collabora.com,linuxfoundation.org,nexus-software.ie];
	RCPT_COUNT_TWELVE(0.00)[43];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.
Remove unused variable e.g. ‘size’ after usage of cleanup API.

No functional change intended for kernel memory allocation.

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 .../media/platform/allegro-dvt/allegro-core.c | 95 +++++--------------
 1 file changed, 24 insertions(+), 71 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index eac3bc9af990..197a368fcb57 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -934,25 +934,20 @@ static int allegro_mbox_send(struct allegro_mbox *mbox, void *msg)
 {
 	struct allegro_dev *dev = mbox->dev;
 	ssize_t size;
-	int err;
-	u32 *tmp;
+	int err = 0;
 
-	tmp = kzalloc(mbox->size, GFP_KERNEL);
-	if (!tmp) {
-		err = -ENOMEM;
-		goto out;
-	}
+	u32 *tmp __free(kfree) = kzalloc(mbox->size, GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
 
 	size = allegro_encode_mail(tmp, msg);
 
 	err = allegro_mbox_write(mbox, tmp, size);
-	kfree(tmp);
 	if (err)
-		goto out;
+		return err;
 
 	allegro_mcu_interrupt(dev);
 
-out:
 	return err;
 }
 
@@ -963,36 +958,29 @@ static int allegro_mbox_send(struct allegro_mbox *mbox, void *msg)
 static int allegro_mbox_notify(struct allegro_mbox *mbox)
 {
 	struct allegro_dev *dev = mbox->dev;
-	union mcu_msg_response *msg;
-	u32 *tmp;
-	int err;
+	int err = 0;
 
-	msg = kmalloc_obj(*msg);
+	union mcu_msg_response *msg __free(kfree) = kmalloc_obj(*msg);
 	if (!msg)
 		return -ENOMEM;
 
 	msg->header.version = dev->fw_info->mailbox_version;
 
-	tmp = kmalloc(mbox->size, GFP_KERNEL);
+	u32 *tmp __free(kfree) = kmalloc(mbox->size, GFP_KERNEL);
 	if (!tmp) {
-		err = -ENOMEM;
-		goto out;
+		return -ENOMEM;
 	}
 
 	err = allegro_mbox_read(mbox, tmp, mbox->size);
 	if (err < 0)
-		goto out;
+		return err;
 
 	err = allegro_decode_mail(msg, tmp);
 	if (err)
-		goto out;
+		return err;
 
 	allegro_handle_message(dev, msg);
 
-out:
-	kfree(tmp);
-	kfree(msg);
-
 	return err;
 }
 
@@ -1480,13 +1468,11 @@ static int allegro_mcu_push_buffer_internal(struct allegro_channel *channel,
 					    enum mcu_msg_type type)
 {
 	struct allegro_dev *dev = channel->dev;
-	struct mcu_msg_push_buffers_internal *msg;
 	struct mcu_msg_push_buffers_internal_buffer *buffer;
 	unsigned int num_buffers = 0;
 	size_t size;
 	struct allegro_buffer *al_buffer;
 	struct list_head *list;
-	int err;
 
 	switch (type) {
 	case MCU_MSG_TYPE_PUSH_BUFFER_REFERENCE:
@@ -1501,9 +1487,9 @@ static int allegro_mcu_push_buffer_internal(struct allegro_channel *channel,
 
 	list_for_each_entry(al_buffer, list, head)
 		num_buffers++;
-	size = struct_size(msg, buffer, num_buffers);
+	size = struct_size((struct mcu_msg_push_buffers_internal *)NULL, buffer, num_buffers);
 
-	msg = kmalloc(size, GFP_KERNEL);
+	struct mcu_msg_push_buffers_internal *msg __free(kfree) = kmalloc(size, GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
@@ -1521,10 +1507,7 @@ static int allegro_mcu_push_buffer_internal(struct allegro_channel *channel,
 		buffer++;
 	}
 
-	err = allegro_mbox_send(dev->mbox_command, msg);
-
-	kfree(msg);
-	return err;
+	return allegro_mbox_send(dev->mbox_command, msg);
 }
 
 static int allegro_mcu_push_buffer_intermediate(struct allegro_channel *channel)
@@ -1621,8 +1604,6 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 				      void *dest, size_t n)
 {
 	struct allegro_dev *dev = channel->dev;
-	struct nal_h264_sps *sps;
-	ssize_t size;
 	unsigned int size_mb = SIZE_MACROBLOCK;
 	/* Calculation of crop units in Rec. ITU-T H.264 (04/2017) p. 76 */
 	unsigned int crop_unit_x = 2;
@@ -1632,7 +1613,7 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 	unsigned int cpb_size;
 	unsigned int cpb_size_scale;
 
-	sps = kzalloc_obj(*sps);
+	struct nal_h264_sps *sps __free(kfree) = kzalloc_obj(*sps);
 	if (!sps)
 		return -ENOMEM;
 
@@ -1715,21 +1696,15 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 	sps->vui.pic_struct_present_flag = 1;
 	sps->vui.bitstream_restriction_flag = 0;
 
-	size = nal_h264_write_sps(&dev->plat_dev->dev, dest, n, sps);
-
-	kfree(sps);
-
-	return size;
+	return nal_h264_write_sps(&dev->plat_dev->dev, dest, n, sps);
 }
 
 static ssize_t allegro_h264_write_pps(struct allegro_channel *channel,
 				      void *dest, size_t n)
 {
 	struct allegro_dev *dev = channel->dev;
-	struct nal_h264_pps *pps;
-	ssize_t size;
 
-	pps = kzalloc_obj(*pps);
+	struct nal_h264_pps *pps __free(kfree) = kzalloc_obj(*pps);
 	if (!pps)
 		return -ENOMEM;
 
@@ -1752,11 +1727,7 @@ static ssize_t allegro_h264_write_pps(struct allegro_channel *channel,
 	pps->pic_scaling_matrix_present_flag = 0;
 	pps->second_chroma_qp_index_offset = 0;
 
-	size = nal_h264_write_pps(&dev->plat_dev->dev, dest, n, pps);
-
-	kfree(pps);
-
-	return size;
+	return nal_h264_write_pps(&dev->plat_dev->dev, dest, n, pps);
 }
 
 static void allegro_channel_eos_event(struct allegro_channel *channel)
@@ -1772,15 +1743,13 @@ static ssize_t allegro_hevc_write_vps(struct allegro_channel *channel,
 				      void *dest, size_t n)
 {
 	struct allegro_dev *dev = channel->dev;
-	struct nal_hevc_vps *vps;
 	struct nal_hevc_profile_tier_level *ptl;
-	ssize_t size;
 	unsigned int num_ref_frames = channel->num_ref_idx_l0;
 	s32 profile = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_profile);
 	s32 level = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_level);
 	s32 tier = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_tier);
 
-	vps = kzalloc_obj(*vps);
+	struct nal_hevc_vps *vps __free(kfree) = kzalloc_obj(*vps);
 	if (!vps)
 		return -ENOMEM;
 
@@ -1800,29 +1769,23 @@ static ssize_t allegro_hevc_write_vps(struct allegro_channel *channel,
 	vps->max_dec_pic_buffering_minus1[0] = num_ref_frames;
 	vps->max_num_reorder_pics[0] = num_ref_frames;
 
-	size = nal_hevc_write_vps(&dev->plat_dev->dev, dest, n, vps);
-
-	kfree(vps);
-
-	return size;
+	return nal_hevc_write_vps(&dev->plat_dev->dev, dest, n, vps);
 }
 
 static ssize_t allegro_hevc_write_sps(struct allegro_channel *channel,
 				      void *dest, size_t n)
 {
 	struct allegro_dev *dev = channel->dev;
-	struct nal_hevc_sps *sps;
 	struct nal_hevc_profile_tier_level *ptl;
 	struct nal_hevc_vui_parameters *vui;
 	struct nal_hevc_hrd_parameters *hrd;
-	ssize_t size;
 	unsigned int cpb_size;
 	unsigned int num_ref_frames = channel->num_ref_idx_l0;
 	s32 profile = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_profile);
 	s32 level = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_level);
 	s32 tier = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_tier);
 
-	sps = kzalloc_obj(*sps);
+	struct nal_hevc_sps *sps __free(kfree) = kzalloc_obj(*sps);
 	if (!sps)
 		return -ENOMEM;
 
@@ -1913,11 +1876,7 @@ static ssize_t allegro_hevc_write_sps(struct allegro_channel *channel,
 
 	hrd->vcl_hrd[0].cbr_flag[0] = !v4l2_ctrl_g_ctrl(channel->mpeg_video_frame_rc_enable);
 
-	size = nal_hevc_write_sps(&dev->plat_dev->dev, dest, n, sps);
-
-	kfree(sps);
-
-	return size;
+	return nal_hevc_write_sps(&dev->plat_dev->dev, dest, n, sps);
 }
 
 static ssize_t allegro_hevc_write_pps(struct allegro_channel *channel,
@@ -1925,11 +1884,9 @@ static ssize_t allegro_hevc_write_pps(struct allegro_channel *channel,
 				      void *dest, size_t n)
 {
 	struct allegro_dev *dev = channel->dev;
-	struct nal_hevc_pps *pps;
-	ssize_t size;
 	int i;
 
-	pps = kzalloc_obj(*pps);
+	struct nal_hevc_pps *pps = kzalloc_obj(*pps);
 	if (!pps)
 		return -ENOMEM;
 
@@ -1960,11 +1917,7 @@ static ssize_t allegro_hevc_write_pps(struct allegro_channel *channel,
 
 	pps->lists_modification_present_flag = channel->enable_reordering;
 
-	size = nal_hevc_write_pps(&dev->plat_dev->dev, dest, n, pps);
-
-	kfree(pps);
-
-	return size;
+	return nal_hevc_write_pps(&dev->plat_dev->dev, dest, n, pps);
 }
 
 static u64 allegro_put_buffer(struct allegro_channel *channel,
-- 
2.34.1


