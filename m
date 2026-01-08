Return-Path: <linux-media+bounces-50225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F045D021DC
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 11:30:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B4A1300956D
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 10:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EFA3D7D06;
	Thu,  8 Jan 2026 10:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIDr4HIu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426A9488509
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 10:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867775; cv=none; b=moUtU7CRBW70H6k4Bvs3ToDUuQOel8hNS3fpllSAhx7X0g2CmVYktiQn73SOjzAgzlUTHja9Hxn1mm1n/1DJw2CR4c+LdbIJhyLl8ZI8g1lRoFNDRTHjBwTK+y8nkqRlpviVJeXJUvzzDWle4gTdSQ9DBCSABn7Szqo4LJ9ZzXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867775; c=relaxed/simple;
	bh=cciAH27QjO8hhFwLUzg9rCR+ScNohzdYvCltagUcs9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dxiiqaOIQB4xw7jYc1eJHuVSO+4ODt4ZNL6JOCDS2D/rRrIIAbwGD60hh9hJU8+YhRlX1Ng125kv8Zb8VWYrfgPG5Aoi/CIL1M+HufF1pFSVGMP05C8l4I+3dPKnXHvMR+ZqKKtHcwalt1J3mZvav5Sj8qm44ew9anafTHw75HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIDr4HIu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so19739615e9.3
        for <linux-media@vger.kernel.org>; Thu, 08 Jan 2026 02:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767867764; x=1768472564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LISdj6PXistqTRgia6JO9824biFrrkxl+bFzcjedfhQ=;
        b=SIDr4HIu1t/nXyU9m9WRKz0FsFgY76IrldgjojH2/+S+HjELSVf/FfqmTnusAfRRxh
         F/o91gND/9urR1eS/r2ZFpVh5JG9sPM0ofHiCUQBM+N9MOCOGr5/RCSyXHxyCJMkQOIz
         T9OVKl7B+XU9BA4jOu7X1Qp53JT7tBoz0BSDk0MV9bHzO3ylkkNsJg5h1SgQyU6u9M3Y
         c0iDHNqe6EUTcn1NE8l2VW/is/FbKkkSfo7pCJnJg4b5Eg16WbnrzT1T6fTpyMViLgrQ
         o1zDpVrGTlD95w2X9/rqGNrJSCe8Vs8uo4i3KI+tSwGy5rso0a3Cve+2LDsRk+g9Hx6K
         s7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767867764; x=1768472564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LISdj6PXistqTRgia6JO9824biFrrkxl+bFzcjedfhQ=;
        b=UiFdb/Hs9Y69+tOHc6mLGuUUo3dseuDdRjex1pAhmXSLoF17JiiNUqZybLiNATwaGX
         tjkpz5WqrilnciNi0riiQo9zM2Z2ZPnjQtGNKe3EjnljKr7sH9A8oXhrSc9NpRd75OgX
         ZSepKlmDrKyuc4FPGrHGejm0WYYkY9BGXhf28T1jI6YYrqK+BRQpdzjwAkRQzVGuFxOj
         aJO//mCbIZCCPv8GxXxbSszFNy5pFiPPgOUjwMLdbMjIA+WSu4Mg/qipKT//mgCXKPKr
         5+XLjjnZVoHyHtdAuRwuv8Oe1o2EmVRETDArrEspUDyWsLVvnmSxMID8ppJutrwlQW7E
         X/cw==
X-Gm-Message-State: AOJu0YzCN5qntJ2/xgx/DCSHDogRM6wWeSUBLBytCxq8Wx44hNlC+MZC
	7h9aYT4qblC4ptppeAv0wTs7SMhCEUz/AHSwNCtl8RYKNyMc12dgpe3CCucbUKD+cHvCuHQ=
X-Gm-Gg: AY/fxX6RoIufKs8SILnyf/5QAx9FUKd3QmK2X/e/ys9ENpnFOBM0rchrJPfzBAWwikf
	q4KeK9SPrySNm9MR1bbf3nSh+Sn1MuM6QNiQTewPIRq4/EGWlKfdZxsXcLXe5phIL1HLKi9Bu/k
	oHtDX/OrCQRe6Dv7xysEasEYvcALj00I3EeXswAyvliFc9uRG07j9xs6ag2/0Rahi4Q7kEYERww
	yecyuj+qME6LnfhrpPEU6EqMJdRBag9F2saxcErrHLccvQLhg9j6ssiTmsguxiREoahxflj/Os+
	S811R3TJ40uP3fKO0c2HEq1s1nA2Q4uO+rYkIhBDJ5QaEDK7CvLMw6cFkTKzO8352wM+5mRjxWr
	x9fIJRP7zT+xMltLLa9vVsuU0RhrIDUZPs3O7np/sZNJcNmYbKrM+BOmcAH4b8UbsE8X1OSXedY
	FnKDrqS/hFGCJG
X-Google-Smtp-Source: AGHT+IHd5YcCCetHSctfh74PpWmzg4QSg+39QNfYt/NPwa+F02goSK3JnPPM4vZKfDIsXieE5D3WMQ==
X-Received: by 2002:a05:600c:699a:b0:47a:9560:ec28 with SMTP id 5b1f17b1804b1-47d84b1fcd5mr63816225e9.13.1767867763916;
        Thu, 08 Jan 2026 02:22:43 -0800 (PST)
Received: from DESKTOP-BKIPFGN ([45.43.86.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee870sm15460744f8f.36.2026.01.08.02.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:22:43 -0800 (PST)
From: Kery Qi <qikeyu2017@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	Kery Qi <qikeyu2017@gmail.com>
Subject: [PATCH] media: ttusb-budget: fix ttusb_cmd() buffer copy direction
Date: Thu,  8 Jan 2026 18:22:36 +0800
Message-ID: <20260108102236.1673-1-qikeyu2017@gmail.com>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ttusb_cmd() is supposed to send the caller-provided command buffer to
the device and optionally copy the device reply back to the caller.

The current code copies from ttusb->send_buf into the caller buffer,
then sends ttusb->send_buf unchanged, and finally copies the reply into
ttusb->send_buf. This corrupts the caller's command, can transmit stale
send_buf contents, and prevents callers from receiving the reply data.

Swap the memcpy() directions: copy the outgoing command into send_buf
before usb_bulk_msg(), and when len_result is requested, copy the reply
from last_result back into the caller buffer.

This matches how existing callers build stack buffers for requests and
expect those buffers to be filled with the response on return.

Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
---
 drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c b/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
index 946c763281cf..f4ce519114d6 100644
--- a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
+++ b/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
@@ -149,7 +149,7 @@ static int ttusb_cmd(struct ttusb *ttusb, u8 *data, int len, int len_result)
 	if (debug >= 3)
 		dprintk("> %*ph\n", len, data);
 
-	memcpy(data, ttusb->send_buf, len);
+	memcpy(ttusb->send_buf, data, len);
 
 	err = usb_bulk_msg(ttusb->dev, ttusb->bulk_out_pipe,
 			   ttusb->send_buf, len, &actual_len, 1000);
@@ -178,7 +178,7 @@ static int ttusb_cmd(struct ttusb *ttusb, u8 *data, int len, int len_result)
 	}
 
 	if (len_result)
-		memcpy(ttusb->send_buf, ttusb->last_result, len_result);
+		memcpy(data, ttusb->last_result, len_result);
 
 err:
 	mutex_unlock(&ttusb->semusb);
-- 
2.34.1


