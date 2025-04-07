Return-Path: <linux-media+bounces-29501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96852A7DDC7
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 14:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1C063A6AD2
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 12:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D61248861;
	Mon,  7 Apr 2025 12:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9oVDJbk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EBB227BB5;
	Mon,  7 Apr 2025 12:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029373; cv=none; b=PFyk7MbMZHxNs3f5k1kqriLyaqwlRu2BPTP6uI5TLyUzm7sSqbxQuBcOApw07FIUnAoRGxIbRCKA9VKO3o3YdirY6gx+xHTVi7p7SIqQNZHmfrc3xdD5pBOGqHkp6/MIOqX2gkZthghoy3xpUyb9lQ4BiCav4uPLAHfxcJIOEVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029373; c=relaxed/simple;
	bh=dcJyfRfsMmgxmRuoZ6uKnKv89TRcKrAVyw0Xtxreftk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4T71wJZ4kQ/usrWV8I0dxRffSLCpH6w57R2JDlozaGmLR8Qhn1nGdQrq3wEVilwJIWEZmr/EsJBvlLLzvnjnvmm1S8rvzzuHK1BZakUpTkZCQtxpp4jpik9fr1bEF156zKspPaHE6MM6EyeFCb1koo4jzriRsyMncjauXWcIR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9oVDJbk; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c592764e24so469008985a.0;
        Mon, 07 Apr 2025 05:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744029370; x=1744634170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TcKaW1iKbZzoagO8ECUBHNyiWF3ioNPUUj4VMULq6c=;
        b=J9oVDJbkDrrqL6fXpRmLfYyjwF690w7uJ7M7zvA1hOttA6X2WntTw2BFm1iLxmkSTL
         M4VXcYY4ChDWfRpPoFSH5NVepJM5uiFDDJKlbMPjs5XSm5S66e39kvVK5bl/gYOCuNvH
         IrCK/GYxUIuhpONlMvoAYG5xMAYpkIRdMEhcM6tqltEDhXzg/VTwWTVyhFmRDs+kkcTY
         j+hiRTB263dA9vjWduwW25heJsps5Nsf4AW3ujuncxEZbkR7k8NpgCo9j0rJRfkMXBnS
         q5rPUUv/wgGlGwlr7aRShIssgfOVmqJ3rE0ZiH2ApHqyEYsSxiB+6gATTQKq4tZ1quFE
         JSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744029370; x=1744634170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TcKaW1iKbZzoagO8ECUBHNyiWF3ioNPUUj4VMULq6c=;
        b=awuqIGy9mjO+6UmopH5yC6MB8qmJqflht3Xt5q+tmfxlvjF74LcdTJwnwbcxMmDR3Q
         nMW0bvcSNQ8P+D4QbOqxZ7dIC3V9CUnyImRPxbGvl4ikO11E9Uyl01dPC7wuuXDIJpc5
         ZcniqUhrKc7Uoi00zVaf8GiFrMJUUrK4HPKmjWQ7X0wCZ46bxXRwwALrt0TYFywswpg4
         n2iwd0J5KRgVDjgh6YKM9BxjgxLhvi8Wa1AAjb3C7A+u5t/Af3Cc5aLScMG3PAMKNp7W
         3hBs0lwOoUR6KgBQEBCZEhfK5dOdXSkF8rfx9Hy3CNnawOFOMnkaE+ld8qekSpgZB6A6
         2zoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIDUilZS0G7spvyA+lUVdDoS/e9xe4exxFJtKQrKn6uQlRSxKflgcY0Ov3iZtkhetNGUeCKUTpUisZb3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj0Wo3XTaFhHu2tRS1pdUwA2a6bL5t7uA3IVBhRvgdYvcforgQ
	jCN3PDckHDzdW+iwAN3F8EZqL4sGH3rnYbH20NjnCC0/VQfrWcnjVx+gpZ6dSAA=
X-Gm-Gg: ASbGncvFEbdwYqQ42WnOKkUlS4+H5dwuDA6XyY7sFEMTC5E7RgqQ+PF4fZutw1xdBNN
	QF1HC050OyhZkpQpxE2tHD4PomQDDVLu5sGdH8hjOYnjXXowzDPHJBAx2Q2K+4BQNxE46E4edEx
	h1ROWteq7SMqfGcCqMioecpR59XV6YqZ/KoJ8NEHs6/TTbLhwyU00bO7EiLYOg+1qG6R/GUn/bV
	EUNbx9aXQxJEME5cMo862wiTzX7HuG7X7At6B3ve6qzoMtrls0ely/cPiPxQQLLBcriUmLu8ArG
	FK4VLz/uEOntP5Hg1fUwNQ0RxZ3Y0KR9oo6tsH5V6lC7Ts45xD2oQD5evt4=
X-Google-Smtp-Source: AGHT+IFYSVKw5VCmG3zldSTuQDk/3t0DK/gVNVF8RsJQdy0hmP+obfuJJuPgy2KdD4uTEL82O7eV4A==
X-Received: by 2002:a05:620a:40cc:b0:7c5:9566:83dc with SMTP id af79cd13be357-7c774a57ad1mr1674861285a.25.1744029370535;
        Mon, 07 Apr 2025 05:36:10 -0700 (PDT)
Received: from theriatric.mshome.net ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76ea59e42sm590373885a.77.2025.04.07.05.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:36:10 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: linux-media@vger.kernel.org
Cc: andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	gshahrouzi@gmail.com
Subject: [PATCH v3] media: Fix indentation to use TAB instead of spaces
Date: Mon,  7 Apr 2025 08:36:08 -0400
Message-ID: <20250407123608.366190-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <MESSAGE_ID_OF_V2_EMAIL_OR_REVIEW>
References: <MESSAGE_ID_OF_V2_EMAIL_OR_REVIEW>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace spaces with TAB to comply with kernel coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
Changes in v2:
	- Resend using git send-email to fix formatting issues in email body.
Changes in v3:
	- Use media prefix.
	- Capitalize tab to TAB.
---
 .../media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index ece5e3da34ee..127f12ba2214 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -114,7 +114,7 @@ configure_dma(
 }
 
 int ia_css_vf_configure(const struct ia_css_binary *binary,
-		        const struct ia_css_frame_info *out_info,
+			const struct ia_css_frame_info *out_info,
 			struct ia_css_frame_info *vf_info,
 			unsigned int *downscale_log2)
 {
-- 
2.43.0


