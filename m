Return-Path: <linux-media+bounces-49280-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2299DCD4BB2
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 06:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F231D300FE16
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 05:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D04B2FBE1F;
	Mon, 22 Dec 2025 05:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBMujDzw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2B52628D
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 05:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766382430; cv=none; b=QgW0pmCOKaLQajTe9NL5A6YN/Czr74ik8i9f7nDMasV/eO9iSueqo1dFvTY1nnuv1ZfmDg8YBzP4gKM9vbv7c16CWikKJUcbj53P6MCG85N1AgRPO6lzoYYgpPl6Dg/x+SqpovVcneFr+xwY3krSElONuQTGpl1UuEfRKPRhOPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766382430; c=relaxed/simple;
	bh=bZp3B3M4jF0rhysmuvRdz/3MaRGTf3rUPfhGnxSYlu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZDWqGkpWk+ZN+b548rjHhbpxNiK+RIKPXAWvvS7QDoUeKLAy4mmG5KaFaLeeTDSg1x5JODQ4EwOX6BMypJ+70AJ1CBBp6NXJjWmnBkV8Vd/+WJJcOJBr1F3IvUKniz/azhxV2Ova6jsfnV1Q6/Dr1m5zYKEaiXJxA1RmoXv1MGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBMujDzw; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ee19b1fe5dso39541361cf.0
        for <linux-media@vger.kernel.org>; Sun, 21 Dec 2025 21:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766382428; x=1766987228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5O0+56Coz2B7LcGuChi784ewUGuX6sSWh6JiztntsY=;
        b=MBMujDzwbzPaNzrevctbAx2JAucG4P78ywerkxrghMrgkE4NPYaNXub+M7C5/5L5FP
         PcajY3uz6hIVcziXxM/jiTuhZFP2UUpNa1c4TUyFVv/c9K5VcTt9/DwIIZks/DEQViQT
         JK507S4LCF26e9MSX432PGTyE7LPYw985jF/hcwJPNLM6Wc1zzUYAiOV5HwXC2KZK/Md
         5P1ASnNatKAvAPaMDJJOQLd2VHH+byTO0UCp76r2mVvuxmN7IdE8WWfJdw8yscQanLBU
         L6auJPMl0TLK0aOIZgpldm5QHnY92hp0GpCaVBTe0gvSl061qRu2HdNL4qjUDFbqRPKR
         I1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766382428; x=1766987228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J5O0+56Coz2B7LcGuChi784ewUGuX6sSWh6JiztntsY=;
        b=DuSObf/gPFOfpYQjgQy4v2YPeGfGKexAtSXpqQEiEbw4HnLOwrCqB8A0GYvcNfFXRe
         6Er+2jtLmEGb+Ci5GfH/QdbR01oCVOzv4mQOPlreakN+CgShpB2BQOWOwOnkOSg4F/Me
         DMZQ7AU/RQawLeknBbtBEcsUjhsFhbDw903B0LZhHROQYcWfrHLhSTQc+ipNaMh85txr
         2Zvldf9y0iRRms1ui7K0eZxFsqE4b7/Ep3YIx1wh5IGtP/HHIWWalsocHgyz+rtcqmg/
         09cy5D30Icp3JRP2bpdeBFp+BLFZ5UJuJ5kreZDZ63Td/SOZX8vSxNFw0lyrG/6Xv3fM
         vG9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6bKBAzlfo7Tmjh+AEbiqvuFidp35CNz8UY6vXEMJOQJ82q2QOyo+P7yitNQCQTLqvLxCjT9FU9QTpzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOmUoxxF0RjK3wORM+T4WjO5SI2kAG/ccikSj5ZfyepcnJuioC
	P9bbxay2hnW0MJPq+y0eNuVOowLPLvJnyqI8LEI5eXfMSm5J9Eu/JihC
X-Gm-Gg: AY/fxX5zW4kLxiqBv75a8p0OExeeKsvJLmbzkDk3KzQ8Dd29U8s6YQyRXwuc0moJAPN
	040JlM6SzJAonCn0lwR/Te3vEPOrhNamy8xkw88k09x/egNSAT3S9dRXGmclDtkZQtJ8Y20SjUa
	TGxwxNcdcbrlGTeXrMNliQmohff2DhMJ3uhQni4lyVK5vPDbLQ+kouNHBpE/wbeAAJzAyX1xJJG
	VyVQPiJoz0wcmQIWlXo31jfeYjQdCOdx7nzgg3yHacm+VMDemdxFxdmkTm23PcnG8e62Q3W9SdU
	/HY3i6uKlWgpd27RRC143f5HmGLDe5M5wSkNJycdonQegp5MvYcUCk6W1TCNpG9eMd1yW5dSIkf
	ZBZiC4CafdwJf96xUiVEMXoOP1XC5t2rDM6i4pJLtQhowo/ziElhO1ebN42vASFbGoh8tO+vowz
	BMnPp3IRxaYPXtAXNe82sq83VuD6baC/37sMhpQQOsJqEqUvtutiEYPTv9OMq3dWS7ljuXbcbfw
	gomxGJRQZAm9XtD7e0f8HZwZD0NvPu4gCcbr7xw9w==
X-Google-Smtp-Source: AGHT+IFuqRyXN12/t7Apv0AtBlIrZWa/o5aPY93pmyxOGgZLK6Cfew8XTFlELI+JhpHCe4WrbDHhLg==
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr162379141cf.27.1766382427983;
        Sun, 21 Dec 2025 21:47:07 -0800 (PST)
Received: from seungjin-HP-ENVY-Desktop-TE02-0xxx.dartmouth.edu ([129.170.197.82])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac66841bsm67948781cf.30.2025.12.21.21.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 21:47:06 -0800 (PST)
From: pip-izony <eeodqql09@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Sanghoon Choi <csh0052@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: ttusb-dec: fix heap-buffer-overflow in ttusb_dec_process_urb_frame()
Date: Mon, 22 Dec 2025 00:46:45 -0500
Message-ID: <20251222054644.938208-2-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222002019.882867-2-eeodqql09@gmail.com>
References: <20251222002019.882867-2-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Seungjin Bae <eeodqql09@gmail.com>

The `ttusb_dec_process_urb_frame()` parses the PVA packet from the
USB device. However, it doesn't check whether the calculated
`packet_payload_length` exceeds the size of the `packet` buffer.

The `packet` buffer has a fixed size of `MAX_PVA_LENGTH + 4`. However,
`packet_payload_length` is derived from 2 bytes of the input data,
allowing a maximum value of 65543 bytes (8 + 0xFFFF).

If a malicious USB device sends a packet with crafted data, it
triggers a heap buffer overflow. This allows an attacker to overwrite
adjacent fields in the `struct ttusb_dec`. Specifically, the `a_pes2ts`
field, which contains a callback function pointer, is located after the
`packet` buffer. Overwriting this pointer can lead to control flow
hijacking.

Fix this by adding a bounds check for the parsed length against the
buffer size.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Co-developed-by: Sanghoon Choi <csh0052@gmail.com>
Signed-off-by: Sanghoon Choi <csh0052@gmail.com>
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 v1 -> v2: Change warning function
 
 drivers/media/usb/ttusb-dec/ttusb_dec.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index b4575fe89c95..0e983783e787 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -703,10 +703,19 @@ static void ttusb_dec_process_urb_frame(struct ttusb_dec *dec, u8 *b,
 
 			if (dec->packet_type == TTUSB_DEC_PACKET_PVA &&
 			    dec->packet_length == 8) {
-				dec->packet_state++;
-				dec->packet_payload_length = 8 +
+				int len = 8 +
 					(dec->packet[6] << 8) +
 					dec->packet[7];
+
+				if (len > MAX_PVA_LENGTH + 4) {
+					dev_warn(&dec->udev->dev,
+						"%s: packet too long - discarding\n"
+						__func__);
+					dec->packet_state = 0;
+				} else {
+					dec->packet_state++;
+					dec->packet_payload_length = len;
+				}
 			} else if (dec->packet_type ==
 					TTUSB_DEC_PACKET_SECTION &&
 				   dec->packet_length == 5) {
-- 
2.43.0


