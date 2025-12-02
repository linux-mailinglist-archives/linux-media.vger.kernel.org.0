Return-Path: <linux-media+bounces-48007-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB64C9A043
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 05:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 98655345A1F
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 04:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18EF2F6160;
	Tue,  2 Dec 2025 04:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8JVH/0F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AE6298CA3
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 04:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764650212; cv=none; b=GUXf35RUaZapmV5ZDHcLSD2xmgFoO29kEQTrrSPzrHZwGnhBexy6L0VVVgFucseJJdj6PVfn0Z4EhRIXc2kEGJZRsemUWxCcEUms5Hqw8v5FUpHluxwWnwuqrlPGnAlcxKKL2VIKHXU3v5QrZRTSQyzfU3kupsHMrVWSmmSKgKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764650212; c=relaxed/simple;
	bh=uztr99jXyVDE+rM6ZL/q4gD8ShKX2EOcNEkecFJOCzc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KiGknlaBNojMLbIO1kjBiAeUN9e9o57GBzXmcdBZVCpoOTf3JHbWqCQLAh9Edn2kIhdZSXX/GcIVV9WFW8tUE7sNc3owAuLePTaedW099kQ4WxtihJsGlFSx6Wi6j3Gvbs7JubAgMXuj/3WLHmZYwdAMDWaX9NjMEs5PYHqxIpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8JVH/0F; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-882475d8851so52270316d6.2
        for <linux-media@vger.kernel.org>; Mon, 01 Dec 2025 20:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764650208; x=1765255008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CZXcm3pVPSgYpBQIYoiMazKwJj1xJBDN+gS0g1GRGyk=;
        b=U8JVH/0FQ1iHGHuB8jbA3VisISEdnMQs/TvHNureZBbjanIog57KwVJrgK1qwmzXH0
         uA9bVXjW5Qq7BJec3eVudVM641jFgkKRjn5L+8+z8SLqYCWaAmQt/J8tHjCCdhUiiTNs
         QjL6IqkfvDvtMBI72cizsca6i+/u1UTasCdolawduFDHXN1Uf80ZAOornZdXN83hjyRl
         SFHv0PzVII6Ev5cJs+eMpH7Rgp0OMqQN7ghG6Z5d8p/Yqe3BRNRkpJ9qhvABP2oDm/fs
         fXHPXS9WwLlpbTd/wBdIsIOcJnvNy02GZpKZcj8nDcYTRU1V9Qzq0XX5kxDD4nmbsbBN
         Z+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764650208; x=1765255008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZXcm3pVPSgYpBQIYoiMazKwJj1xJBDN+gS0g1GRGyk=;
        b=hh79uaizFjpFku3G6Ojr967GsPOzN6T+YeqkQ86dJT9ngVTCgQsUSpkht2kJkqrqWx
         A5Jf3iizrsZ742oLLGSbaQVEOTiVhNHiadr50eRrvcU+yUZhLGhHNQ2Imn3Dul6RzBUN
         0CazTLGHk6y6uKxyTIxDWEUVw9K464+NhdG1QYTFe5kRlxUsIpz0nGixgc4dNWjxvNmC
         YgFKebq6x18wO4Idx8EaUavykGyPyJtRLdU0MNsP5SSshY/vniddtHKEzYDQy8zRwvc1
         /zOTl8i9cmcxglqdFw3UfFvT/kfq2BuDXq7+brOchbIlA02mkT1xXBBt97KeGkf9zTXt
         eS2A==
X-Gm-Message-State: AOJu0YxlS/HJK2Ucq9HtUKN7qh8iWOE+zPhsCwLqUBp0pF9PHiKklC4Q
	uXuHjgtnjdFwgzlQK1Yd+Bp6J1peLIgc1R8ENxmqUCQ8VedrcILYZhKP
X-Gm-Gg: ASbGncvN5H8fd4ZhlWzgmKOGSZwFFA7w/Rb1uHi1Tx63eZ4Beckk7oNFVtVsiVRI2DS
	w70nE+wSGaAV2ngbly9IOlrv5vdlxGVFz0tAy4Pz4bhRhY9TfGUBCLa+Bg6oxJZEz1iVR6HSxVE
	dJmQnf03FgHLr3OPgHPPfgnmk1UXotxMWVDIzZcqvnao0r3eDl7hujkq7JEIrJkSpdCkS+XvJNW
	h0aLp8LKmzGE2c4qVfASVOLGdhcvWrGunPIg2g5HAv48JUxIdufYkaWaNH6NFoHkLKtTpNOHHQW
	sHzmgzTonDh5Egsem3BvuaRU4m9gZwwx6+hUdqYVTxC598fBO19Kh6fM38tRVhs+9WgYtpPaanQ
	iAzqm1f9RnaY6bXygPZkk84g2FuvHcK2dCdFEtcH4gVtT1bstN0nXH7cZod8eOLNZIVSPv3wjiF
	EJW24KXI/jXB/ivzL/dn7yrWKDzO2zX6cV5FK62+6iZ1c=
X-Google-Smtp-Source: AGHT+IGlsw4JUgSM3DvEN1wcddrs7VleWqlBhzUVtKwBmL2QYMdm8vFeNApEL3suO1oMsIuXgGXOnA==
X-Received: by 2002:a05:6214:448b:b0:87d:c94a:17f4 with SMTP id 6a1803df08f44-8847c534fc2mr644037986d6.62.1764650207945;
        Mon, 01 Dec 2025 20:36:47 -0800 (PST)
Received: from kernel-internship-machine.. ([143.110.209.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88652b6d7d5sm96461976d6.49.2025.12.01.20.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 20:36:47 -0800 (PST)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: Abylay Ospan <aospan@amazon.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vivek Balachandhar TN <vivek.balachandhar@gmail.com>
Subject: [PATCH] media: lnbh25: use %*ph for I2C write dump
Date: Tue,  2 Dec 2025 04:36:46 +0000
Message-Id: <20251202043646.2291889-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the hand-rolled %02x formatting of the I2C write buffer in the
lnbh25 driver with the %*ph format specifier. %*ph is the preferred
helper for printing a buffer in hexadecimal and makes the debug output
clearer and more consistent.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/media/dvb-frontends/lnbh25.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/lnbh25.c b/drivers/media/dvb-frontends/lnbh25.c
index 41bec050642b..629445ea16d6 100644
--- a/drivers/media/dvb-frontends/lnbh25.c
+++ b/drivers/media/dvb-frontends/lnbh25.c
@@ -110,9 +110,10 @@ static int lnbh25_set_voltage(struct dvb_frontend *fe,
 	}
 	priv->config[1] = data1_reg;
 	dev_dbg(&priv->i2c->dev,
-		"%s(): %s, I2C 0x%x write [ %02x %02x %02x ]\n",
+		"%s(): %s, I2C 0x%x write [ %*ph ]\n",
 		__func__, vsel, priv->i2c_address,
-		priv->config[0], priv->config[1], priv->config[2]);
+		3, priv->config);
+
 	ret = i2c_transfer(priv->i2c, &msg, 1);
 	if (ret >= 0 && ret != 1)
 		ret = -EIO;
-- 
2.34.1


