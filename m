Return-Path: <linux-media+bounces-49378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2EDCD79B1
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 02:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61BF53034A39
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 01:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBE321771C;
	Tue, 23 Dec 2025 01:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzoKlhS4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9FA1F63D9
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 01:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766451715; cv=none; b=L1FnWCYJeUrmW+pKU/ysHsvXcOiG8TFIihOVYyk6Z7wc21XwzbYHwa2Dy88PSgg3tlxllCerWDUmZ7I9U1RqE0RT/3BVIrhpscMluPVe5u2gvclxC2AZkbN4aeuxWW0WzJtqQgbTbp4yFQFntNXVHGC4szL82rjZrzuiX1tA4wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766451715; c=relaxed/simple;
	bh=j663USGjWVhONMnd0T5IsNIHlfEp8/azw3aIm5LkJEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J0fJcnigV6z5juwpU0jEmliZnauEgSqatT65we24RxEnnL/STeek8OmKuO2JSr23+lf7+1umxlr6Q3Kcad5wsPCS39MNn+h/JYshSqSWiGi7CAM4FOufMNljhi51FcMtT5YP4jjkrgn0HhPdTRcFDds6k76fZMF2c6mLKUt8ZAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzoKlhS4; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b25dd7ab33so320569985a.1
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 17:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766451713; x=1767056513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEen2/5FcL6WBLFu+QRzxg1hF1FqbpgsPgShftLpwMo=;
        b=fzoKlhS4ffWD3LtjZihBjFa4+KCrE/5XEPGvpJ6kU4In8CNWfhNVjl6FtC7nViHND/
         T+JqxOvJ5FzIMIIVE56R5MrmXAT+bgobtiCdRcbOhaWQh3/F429TMwq6vZQy3ziZTRRz
         PkUT9x5MhCfQaCdbvwefMAi50mcpbmm25lSpqaEQNrRiagB4WhFyRw7KNz08ALO/NCs7
         fZHhqn5KA713U4OpV4AiJSCRYU5rwEL1sPg51CCQu7qyzEAxraeZeVRq41tPg0OLpAIW
         SiCDa/m1tksSqyW2OGjsTa6K4C2Kx+Ir5mSZMQi//g0D1KP9wTuw7Gs3LfEPGzwrHanA
         LrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766451713; x=1767056513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fEen2/5FcL6WBLFu+QRzxg1hF1FqbpgsPgShftLpwMo=;
        b=hQZy4/o8TtBe5Qsjqsfbhg+iFGsUGbApIIQWE9MEk9oGv40B4rvZ8rK6NJA+nr2F4F
         dboPJeLpm8I549XAxek490qy/amEsznVnRlhkcpQy8Y4AR49XDXPRwIfB1Cf0HAaP/iV
         56FNVMZGRBmTMhL6H0nH9NhUPiylKj72Q+lDD/u+zwqeYoCJ4NhAIeZmMSvk4Y2MZJpP
         7Fi6IhywMZoBdl+Yr2B08qlB9FnOaothCRE+USL+4xN9QtoI0bjnVaA5hLoN9LzjSACF
         2Axn9ViDk72qcl/ikNQVh2KN5V7xlvqnLXDHiLUauopqZx2ZrbQts75gRyn3KPnGqtCd
         ePNw==
X-Forwarded-Encrypted: i=1; AJvYcCVY4dqSA7bKIy83k7yk2npCH9pXPbfv+OPkHg7p9OSLKLzjAttAO7AfqnU5PicUu/LZnqYFhTWiN263BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvY8oXU0U3rT6fE56BUqNdpzaNfORoupcwA6g+IzTyeujiYxVq
	wehDBW1IdxTWrqoMlMKNcXpHFHBeAfTHWSfyZ6tJjmlRAEr6+iO+srv2mAQ1FpOO
X-Gm-Gg: AY/fxX6Mv468vla4QFJIZ/5qk22k6HpVNp6FGo+FvezGaG+mUiWedKWZ74BPbrw8Wuu
	o5UpfeuoFg8gxcMHYEQTfCUWga1K+NO+uTHqfIb3fcNRNahWjrnp2ckscwW5F5INcwERLy1F/Ru
	d1HYvcv7Cp2SGwa6kH3tWH1/NMV1GJfq/cXEUsZc/gxuW+NGyXx1AtOtwektDgc8H+rJIYlOOBB
	Xf2BF4r/QNgwIo8DYkfqvIbSwFuHYechotkBEszdqXKNhhPQqrcV2kdzuwVNuhEwUGC+X0QZTxV
	bop5TiUC/QLU2aDHU0hlMlloBgQRgB/g5sKbClXywgSSignkr//mpHnBXdaGBT4hroCoz+FKnC2
	o2cJ6k9QX0RAjeCXEvG78VUK+NxxkSLV7UU5XprGSbLwITIQwmsLYUEpU/xUiAMnyR6AkCx/Qdm
	GXVkOcpaA/o8rKcca4fySDb8T2ijj1+YBJZ12l9v7fCltLbfgq6xFPMl3FNqPtcjJbARkL0Ddor
	9gAN7zP+y0biXFtX2MhEsZJnvzD+OMwPXX2Ql9xjA==
X-Google-Smtp-Source: AGHT+IFfzGvqWJVUMQfEIWB6QgfHRl+644mdlee0mooq8P1uy7kvYwI4z1xExaEW9uSutL4xtfXBIQ==
X-Received: by 2002:a05:620a:1906:b0:849:d117:e86a with SMTP id af79cd13be357-8c08ff20880mr1926612085a.59.1766451712852;
        Mon, 22 Dec 2025 17:01:52 -0800 (PST)
Received: from seungjin-HP-ENVY-Desktop-TE02-0xxx.dartmouth.edu ([129.170.197.82])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0971ed974sm950786785a.30.2025.12.22.17.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 17:01:52 -0800 (PST)
From: pip-izony <eeodqql09@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Sanghoon Choi <csh0052@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: ttusb-dec: fix heap-buffer-overflow in ttusb_dec_process_urb_frame()
Date: Mon, 22 Dec 2025 20:01:22 -0500
Message-ID: <20251223010121.1142862-2-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222054644.938208-2-eeodqql09@gmail.com>
References: <20251222054644.938208-2-eeodqql09@gmail.com>
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
 v2 -> v3: Add missing comma in the dev_warn argument
 
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
+						"%s: packet too long - discarding\n",
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


