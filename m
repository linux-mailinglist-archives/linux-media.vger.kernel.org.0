Return-Path: <linux-media+bounces-9020-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9938889F1F6
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 14:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA3F81C21351
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 12:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B96715B576;
	Wed, 10 Apr 2024 12:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YTVLi4rG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE2215B12E
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 12:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712751882; cv=none; b=cC9WokT7xv1tmBnqJkLu0hjAX2ENliKtMIykXAtt6A4TaIFrJIPeus6pQM18AUJR0fAiizmNhuar4bI9ea+6mTRY3Jyy+hArEC2dYvfoZNMDeB4P+rPJyx787uFHEpBrlWvt+9LyrFgsvoml5376e3WAyBvgUA0v30RmXzIPYTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712751882; c=relaxed/simple;
	bh=VxCGXNSti7mYfnBvR6+4fLs7SRhuKscu5GzRYGQSjhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T6t1sY4CD2BpfM4AdZjUKyQb6ZzGHcb5LBqEYNw4FQLZZXWXWg8dDmJiJ4Vvuvh1YhHKd73Tpzvbq75iEqoLlaa5D4IDUlriNZg5f0Ng++0x960X/feu/+fGRaEUP+i3y06b3CeCall+nfJ19OHZAQUR9bE5sJhfQJc7mXy2u84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YTVLi4rG; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-434a6024e2fso22453361cf.0
        for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 05:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712751880; x=1713356680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUIlEzeKDdt/kW+iR+gyTxS6xtOvltAaKzIdl1cntp8=;
        b=YTVLi4rG/JQEJQ6HjInbnGt4kGfjv+jPyUyIzoz+cc2mHv88l/v+nN3XTT3jEVU6pT
         CgnBNKez5rIj5rBnx049gx7sGARe0th+espbyV+zYi3sl98EhdQ5vSD4GWvTy9jzAAB4
         LbOR8R/cGVDvou2GBBAIJmvb2wfFhBAL7WCRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712751880; x=1713356680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUIlEzeKDdt/kW+iR+gyTxS6xtOvltAaKzIdl1cntp8=;
        b=q982A3oKmuDCjlVugrUI0bjRtH6ItDPdx4pPwDFspD/M9CHbkTXpOIhzk6Jir/xbx8
         m3ZSjhTvuJ+DUSY/b+QGTKBLKbRwxunwREkJX4AJKsGA9ZOBCE/HEasg9E3H6o/Gl+FP
         g1jpshWQEaEL82uLIprUsc3h2nvGO2RmjKOLnGS1M78qDC+Pxr55hkgaVabEv20EKRHP
         UZTPxZIBho3AQGbKQDZjsvHYtCcE/0o3poUUpOJjzldq+N6N/PDm66YsPo4Hvs81GGh0
         SWd9PlZB4WuX9IICMWaZVt32pa4sba+HmJA/6TxQAdqdlv2R2ZYHeFFgXiOugFe7t4Zo
         ZjMg==
X-Forwarded-Encrypted: i=1; AJvYcCX4XrnEd5dUkaKwyhRX4pTrOsdcfrEtveYuKdxx5mFp0dPhBJYXFC2pvC2+mVGodeSUfshELiWe2CwCNpHfMzJsSrBRZjMVDR7swCE=
X-Gm-Message-State: AOJu0YzJYc2WbZwbE794F6NRvrSqDsEfUYRniPvLzgrY9wed977HsJSG
	YglLO4WNQ6gmcxYnZm/tuFunrity/c4uQsivXA0WFc4xRPdHJEZfplZHwHUZy+ZtILWixAGZG88
	=
X-Google-Smtp-Source: AGHT+IHjv55W8B3JTfAxR3jtqM118qBjh2u5zb8b0xUS9LyY2r59GizLh0fI+ICqFWsglx6sCiE1zg==
X-Received: by 2002:a05:622a:528d:b0:434:e3bd:b351 with SMTP id dr13-20020a05622a528d00b00434e3bdb351mr6689698qtb.29.1712751880009;
        Wed, 10 Apr 2024 05:24:40 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id jy14-20020a05622a818e00b00434ce53c664sm1921579qtb.80.2024.04.10.05.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 05:24:39 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 10 Apr 2024 12:24:37 +0000
Subject: [PATCH 1/3] media: dvb: as102-fe: Fix as10x_register_addr packing
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240410-pack-v1-1-70f287dd8a66@chromium.org>
References: <20240410-pack-v1-0-70f287dd8a66@chromium.org>
In-Reply-To: <20240410-pack-v1-0-70f287dd8a66@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

This structure is embedded in multiple other structures that are packed,
which conflicts with it being aligned.

drivers/media/usb/as102/as10x_cmd.h:379:30: warning: field reg_addr within 'struct as10x_dump_memory::(unnamed at drivers/media/usb/as102/as10x_cmd.h:373:2)' is less aligned than 'struct as10x_register_addr' and is usually due to 'struct as10x_dump_memory::(unnamed at drivers/media/usb/as102/as10x_cmd.h:373:2)' being packed, which can lead to unaligned accesses [-Wunaligned-access]

Mark it as being packed.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/as102_fe_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/as102_fe_types.h b/drivers/media/dvb-frontends/as102_fe_types.h
index 297f9520ebf9d..8a4e392c88965 100644
--- a/drivers/media/dvb-frontends/as102_fe_types.h
+++ b/drivers/media/dvb-frontends/as102_fe_types.h
@@ -174,6 +174,6 @@ struct as10x_register_addr {
 	uint32_t addr;
 	/* register mode access */
 	uint8_t mode;
-};
+} __packed;
 
 #endif

-- 
2.44.0.478.gd926399ef9-goog


