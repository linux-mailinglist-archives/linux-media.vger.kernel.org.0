Return-Path: <linux-media+bounces-55228-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJA3FS16sGnLjgIAu9opvQ
	(envelope-from <linux-media+bounces-55228-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:08:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB942575E6
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A517431EFCBE
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 20:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430EC3E9282;
	Tue, 10 Mar 2026 20:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bz4rKh7k"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1F83E928A
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 20:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173164; cv=none; b=LVMBq0pqsFP6i9+Lw0EoAPybZpAMlkRaVoU6I+RnIKP6FIoGQSuGLf5Ge58XvnNhFlq7suu7Fx6GVxJuO0SFftNpP+G37K+RdLXTEI3orhWCDadSp5IRvjfcLFNXm+dgVUIOTRUYzJjrA4iTBPVx08gIh9/4G3KNANx2EjcC7kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173164; c=relaxed/simple;
	bh=NmQadLrlb35menLfcI7cw9Gbg/x58iEO/f6P/uOoiYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sOkS1ffgzeXmlNs1D2/wr9TV4z76lxPIL8GDObAgokQ1Dhgh03naRRSpABmNXv3np/MFKHthq/nl2jychswkm8YnHzyoV1t2Kp5LUP/2CTDlLLaOtDUi5VKm+sAVM+7h3WGM8HZ8XZe/GMWsrxCz+qGqdr8RxsILA1hRQpcyoQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bz4rKh7k; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-829a9d08644so2656448b3a.1
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 13:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173163; x=1773777963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zN04QOyvuNYqHR2KOr7qmaUFc0qRULIxaBq4auralkg=;
        b=bz4rKh7kOmROroDv4hrLhYXzb9o24Nd6ogZujfa4PDym+LphfHArTmjT2GvZPtzbOE
         fLR2AexW+e20/zfKgRcCGMAmlwGbs2srBzzMM3m8/bMooa4cjeOpIgiYWaSC29KjzRph
         iaC44eP6S5H0RPLT8JjwIeS4t65p0NYIZ/0u0eBGvhGY+ZWvO7WCH4AXXbngJEVn/Oyi
         pPh0gyDvpPmidF8iy7p3n8PghQvYY5wenGUt8DGPmRxyXOBu24sfnep4B3kbai+hmOQT
         jx6qEbgCr3FOdfdxtkexCi2DpeJDpWDVITy3jFUuMiBCTdrmrQ44CkTRoXAAkoamwgod
         qKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173163; x=1773777963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zN04QOyvuNYqHR2KOr7qmaUFc0qRULIxaBq4auralkg=;
        b=GeVckyIaYXfzG1joDfHCoAPDIvLuiEiDpUgMKg27Mwu9CUHJCUfiglNptIu1NJoGH5
         YgduNQiQwxSg9LiHfR3CybuWCpKQL4csFbZga2CiStaXNZOLUiI4bm68foTyGnkgFbjv
         w0+q0U32U4nei6eHNRxcJNn+o6xQknFu8WgTbk9pUptALUN4Df9IfSmu2rx6PVl7DWnp
         2ILyohZ7zI+nfUNwhKogNoMKgKGKmjWJKEAS46tr6AZVPf13A1G+w/+kGPKjvvg535sA
         ZpOAIk3vEwo2Cg4YmPO7TGM5Wokh2/+AzqgcHdHu1A0DtLJoyjCR4U+RWObfikc5FjNS
         Y1qg==
X-Forwarded-Encrypted: i=1; AJvYcCVdLQsjIF7omRqovLQHZ9BwnSjyq1TUq5sebAvc4uABQrlM1rbRuJW4Q0nasqlH2klxaDsE37/DR3BOvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPiQl9stqhJDeJyIZ8y6cNd2SKss0XAeMxVTSmyk3/ELcWv+Rj
	1dsYt+cEfyPCS1xvT/ClPJXgeyw+SfP+zRTDk1tRj/kpVnx9RN1qDXz1
X-Gm-Gg: ATEYQzw5qjpX3Fx9e2uYWk0Fh9wsRLBILCX/hbxTWPk7ch+lVoAJIkhYGABSPvq2xxU
	jCC7d7b6XJeQ47udBpVY81LwtiXsUby+GA2nAe8/DCa9BK9NmNIPRMJ0LzSMvj2Wir0W1/X9xuI
	xUbstJjMUSP0wIZQ0SDG8Hx8yhJvEqJzmA9tDsts/R8S7OdIm6WMgvpuV/q4ytQMVAUZI6mo8iz
	TciESLDC+4RHer/Sog2Ki/tqoogTdcp0YbxrXu+wUQ/TLPueVnF9Z/GT92NDjvad331gGWwvPeY
	X1YkgVHJM0gvWQgGtNJY2922yaoLehcqJp7g0CvOxBmYzPAp5Sa/cAcnIfQCqcvJpfKRBzGsTsz
	xXZok9oQfhCRw6DUarjSE52l9lyYhtjK5A/wBKjE0veYCpy/tt/Lq5/46YWX0o04I8F7m1p+5zA
	FKrUAVSygaWiW6WWiX38mTWiO2AjXDAH8s2k1pdD3bBy5Qrevk
X-Received: by 2002:a05:6a00:3696:b0:81f:4a06:6f5 with SMTP id d2e1a72fcca58-829f6e71c7bmr133338b3a.4.1773173162881;
        Tue, 10 Mar 2026 13:06:02 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:06:02 -0700 (PDT)
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
Subject: [PATCH 3/7] iio: st_sensors: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:09 +0530
Message-Id: <20260310200513.2162018-4-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AEB942575E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55228-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,mediatek.com,gmail.com,collabora.com,linuxfoundation.org,nexus-software.ie];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,pengutronix.de,nabijaczleweli.xyz,gmail.com,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,linuxfoundation.org];
	RCPT_COUNT_TWELVE(0.00)[43];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.

No functional change intended for kmalloc().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 drivers/iio/common/st_sensors/st_sensors_core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/common/st_sensors/st_sensors_core.c b/drivers/iio/common/st_sensors/st_sensors_core.c
index dac593be5695..f641b62e692b 100644
--- a/drivers/iio/common/st_sensors/st_sensors_core.c
+++ b/drivers/iio/common/st_sensors/st_sensors_core.c
@@ -501,14 +501,14 @@ static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
 
 	byte_for_channel = DIV_ROUND_UP(ch->scan_type.realbits +
 					ch->scan_type.shift, 8);
-	outdata = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);
+	u8 *outdata __free(kfree) = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);
 	if (!outdata)
 		return -ENOMEM;
 
 	err = regmap_bulk_read(sdata->regmap, ch->address,
 			       outdata, byte_for_channel);
 	if (err < 0)
-		goto st_sensors_free_memory;
+		return err;
 
 	if (byte_for_channel == 1)
 		*data = (s8)*outdata;
@@ -517,9 +517,6 @@ static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
 	else if (byte_for_channel == 3)
 		*data = (s32)sign_extend32(get_unaligned_le24(outdata), 23);
 
-st_sensors_free_memory:
-	kfree(outdata);
-
 	return err;
 }
 
-- 
2.34.1


