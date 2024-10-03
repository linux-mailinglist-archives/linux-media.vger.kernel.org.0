Return-Path: <linux-media+bounces-19033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DE198ED59
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 12:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F009B216EB
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2024 10:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417841527B4;
	Thu,  3 Oct 2024 10:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAZMw5YS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD4714F9CC;
	Thu,  3 Oct 2024 10:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727952741; cv=none; b=RNeaCIT44jHIFkyvZuU9T4YWczH7aqYQSw1EUnBQrb1DHmwv3iHdVy1GrTGlSaZnXGyZodDBhilT85/B4OnewiMx33is6r9Zl+UNazM1DUhs3tsVwZXyHOFq7p0fsFPyLtZZTJqByPMJkHQ3B0P2E0PanQP6UDrNnR+QsKjcH44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727952741; c=relaxed/simple;
	bh=PPz6Yp7/gcSGabC1bUDjTer0AK+oYuxohUY+za7ojfc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BIAAgjfDDD/OLdo8Dl87sGDI6vbDpM60R5VSSbQO+h9ubWbVywrtdFv/UUsvSYC6St5evmPSW7L9sY/tPqXP9wvR3I2sjsQhDDMBimuAQB8veBEppVoOFPipiMTMdGqWmaPAp+wuDL67OAVYtG0Jz+U2BwjdID5lHChrn7/L0Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAZMw5YS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37cc4e718ecso642633f8f.0;
        Thu, 03 Oct 2024 03:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727952738; x=1728557538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7AHWo3WrBSZCPmsjtNGt0DAonmgA8779IEvsDXyJrnQ=;
        b=FAZMw5YSiSKhUwfrMLdzs3v+7+K1ul5DwaIBTle1MuLcVh5TFkUAR3c2zxtgTTl85x
         xEeCwC9ntxUCsGk1A5APfWKf01XIoJFnjThYxwchvSV/JRmeJPpx+xzJUdioECLr0r9X
         a6ngWEnmzy8q+JYW9CiCjmGPNiZ2n8PUyip3yem+yJn2tP57x+IuFjzP7aJ6tosrZ8iY
         sGcspYG9+5cH5jGuHwXwoobBVvwgxIlEJO9URr2ET4rRjZ4SlYM7Ij14pdBb+TbXMjHl
         AFYBXJgFhj+H75HfFEEPnPe+JKOt3FurVigvudV5+DeHZNje8HxSWF4dMH35D9V9Rv8t
         Jjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727952738; x=1728557538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AHWo3WrBSZCPmsjtNGt0DAonmgA8779IEvsDXyJrnQ=;
        b=u4zJH18TB6bgYGTm2L5CpK37+wPzF5YPwMxKB6Vr2Jsq4vPvmHK5AAjOFtiAl2b10a
         Ykf1/ZKN8cqU3urYxJAG48YIdWa01iRzXE5AjP49rX8JmvfuRnDaAIzar3saiB5V1j0M
         KjULUtVYWVj0yC/v7pmwWZpa/0aTtFYHWJghWUltFApvVmQnlIqV1zPYhhHaYM8JD+nX
         ZydNZlSGWkyMjZJ7fORfc71gTXhsa6p2PvoNPQGPijUbbT+gRN0mZaAHhCLUQgZTeToQ
         9TKi/43QXybNqbf0R1Ey247l5AKZ6ZHOO5dbmaIR2H34QWmlMKYo8Osj0sq5vkm50P4K
         9yQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDUhy+hxY0nJykqiw4ph8GBYdgQaiCIDIuQ1ljJRbKWzdxexxera/ls2FW40gR3+Q0cEAXhzbbvZVkdHbs@vger.kernel.org, AJvYcCXXBdfJsDEeySONXGruGgl/ht9oDN+8G5weMts9SEIZmGuGy+nS+8s9lmFCKbCdBWa1W9TVryrUWzFGz+dcTQY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6MJCg4D45Pc2kKcXHCjHhl5RRHEtGzKRQSiEgnof/XMHsCWfb
	UU/i+u3K0C9K3D3IYTl2v2Aazs0TFVIJyjdrse4mlC3rSXnWlpYI
X-Google-Smtp-Source: AGHT+IEfSdg51/6DORdxumaSZh6qECUM1t1ux7WyqQDO03p20jGicqGTRCnh2FIA+PD95bP9KSDg5A==
X-Received: by 2002:adf:e8d2:0:b0:37c:cd0d:208f with SMTP id ffacd0b85a97d-37cfba197ecmr3763281f8f.49.1727952738211;
        Thu, 03 Oct 2024 03:52:18 -0700 (PDT)
Received: from void.void ([31.210.180.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d0823ed00sm1003908f8f.49.2024.10.03.03.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 03:52:17 -0700 (PDT)
From: Andrew Kreimer <algonell@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Andrew Kreimer <algonell@gmail.com>
Subject: [PATCH v2] media: platform: ti: omap: fix a typo
Date: Thu,  3 Oct 2024 13:51:58 +0300
Message-Id: <20241003105158.15702-1-algonell@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in comments "tobe -> to be".

Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
v2:
  - Add driver name to subject.
  - Elaborate on the change.
v1:
  - https://lore.kernel.org/all/20241002212602.11601-1-algonell@gmail.com/

 drivers/media/platform/ti/omap/omap_voutdef.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/omap/omap_voutdef.h b/drivers/media/platform/ti/omap/omap_voutdef.h
index b586193341d2..159e5e670d91 100644
--- a/drivers/media/platform/ti/omap/omap_voutdef.h
+++ b/drivers/media/platform/ti/omap/omap_voutdef.h
@@ -48,7 +48,7 @@
 #define VRFB_TX_TIMEOUT         1000
 #define VRFB_NUM_BUFS		4
 
-/* Max buffer size tobe allocated during init */
+/* Max buffer size to be allocated during init */
 #define OMAP_VOUT_MAX_BUF_SIZE (VID_MAX_WIDTH*VID_MAX_HEIGHT*4)
 
 enum dma_channel_state {
-- 
2.39.5


