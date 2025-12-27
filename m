Return-Path: <linux-media+bounces-49584-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC935CDF545
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 09:41:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3CD0F3000FA1
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 08:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CC926E708;
	Sat, 27 Dec 2025 08:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A44aVtPX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B606F1EB9F2
	for <linux-media@vger.kernel.org>; Sat, 27 Dec 2025 08:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766824862; cv=none; b=H641qPBnazYVTAPSFX5DiLJBXDFPL2UmlCLOeOUesZSYe1E9achCGlN0GFROgQqhaXPkK5Fh0b9005V3waZPxWt6NwVHtoQ+jZ6QcOyZN72lcm91z9alshquLuMsEQj9v7oACxK/IhrTHEelQsh3dD25T3xa16dMsa2JWilWzO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766824862; c=relaxed/simple;
	bh=Nj68t+K0+EIx3131fR5DrdLX+H05YAGgkEp3NfJOl1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L1H/d08VUnV46TtDZ0VtOy0I/EIarp98HqEUKiVU7pyBX7H7nGT6CQegYE4+x+jiLyJkeoVan4r5Csu9KYF/4ouu+cGtjIIs+SeosKwzaznpM0SWSzNXxKsZdLD7hO3qoUXQm45lErzpqGZmGBF91am019J6lx7Ntl9dvDSgmbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A44aVtPX; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5942b58ac81so6498506e87.2
        for <linux-media@vger.kernel.org>; Sat, 27 Dec 2025 00:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766824859; x=1767429659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h1mzLS7EMQ7CMEUjGijkTRd2ui9VJENWahANf3YnZYY=;
        b=A44aVtPXm+ESJJrYrED3Uyap2BNM96Q361FcnJ9tKyS8i107kh+LikQOFEyc4BYiAz
         gBDyLlOHhgOEJFtwPh6K737l5WHID/ldlnFAnm2SMgu9pRUL6d7Minf0U+IgOb5PHVRt
         gB2jNbh1m5zQojxZ5RgdcL/w92auru8Y+vfTkk7EVqyfb9pdA9Pnv0EIkIwrFhA4GXlG
         YmiB+voU8krkhX/EY2K77EsfcGqTNya4mLUmRX4iJID9z4TTqySGqOSWlBNwQ+zzFRKI
         NaZtmZHVjyzpDetD4u0n3+M7hSqVuaIG0sjFdq8SK0kumRpcGtxpw76lg7PXC98CL0jX
         SfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766824859; x=1767429659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1mzLS7EMQ7CMEUjGijkTRd2ui9VJENWahANf3YnZYY=;
        b=XvHp6+3kDt8EKPhQ7j3OlcGiVpkwLa5x+h6nVjZh3k1YXN8PdgIVwi+m8ytNjz1RfB
         zfeO6AmHibnaPYoClGyBg0aOBNkKab8Tt7ybBuLuTxeqOyyEAD+4ajFUrIOaxirImlWF
         +/STP46RYC2Ax19tAiBERC1botbN/QHr+N9ZG1tVMJnlhcTcc+tQVWWP+YqFZsJAAIJj
         NhFjuPFlfHA8OrKDgEOr+STDHQE2TZ4Ggcvxe23LaaDumfZ+lVIvFjAx/fdhEC+3eA8t
         rLZ7BNPeZ5uB15efXst5FqDvV2lf+dGUy7izipu/zdAQUPFJBxW4BcqwBi/kSgnjoWYs
         9LIg==
X-Forwarded-Encrypted: i=1; AJvYcCW2KL9njD1XF2uJ9K6cIDscn1gKZQzlGlf7a7BFxGQuoz++BGW/apUPT04VYD09hKsuMtVmhIj0bLWfCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWEExwLdiTQykkb3OUgRNiRYJ7GI1g6+zNcaY9E/XEvV35T2kc
	hUY77PDs72Op4nQ068nD4TsCH8BHxYL7ALs6mWIQU2B/MBkMCeGqWItk
X-Gm-Gg: AY/fxX5GddHtcKcFzAvVRHWJXS7QBpxm9ABSKBn8n0qWZS74wEo0RVEG1e5ZNtF4dcd
	1Rr5LQhqLOsGVvnkUid7ni+Bn2P96bWphS2/wuT7FTtHmKadc/vg/ipqQtHAFLkBxF2MLz8NY+2
	za7+x/S6YpqBv+Ma/7gbFeHtMIzZ377UMijkOSRVGvLaYtBNPQFT7WyYSahZ/88leo3ORLgA4sV
	ZoGiBc7RXKlTUbYzWNKaaolKQoXjTC7iVGNvymNar/PNLlkktlcgAfZv2i4Hm4UXk+z3DB3sl3w
	7R9ddlbzLu+qvYAfuSZK7Vxm4S2D+Ql9YwWqyjsRuVEhdEvKpOpJD5qhW4UDC2UItq5cxfV1PV6
	/QVDlzzWM6jQBt4qpK65ECuYYELOS19NpAsRtp/TgSlKqasP+BES5NuH7rEXuDRXX9/TS8jlPYy
	Kld6iUS4PRM1zH/v8t9ZcLZqQCTJA=
X-Google-Smtp-Source: AGHT+IE1gCiVZ/51w+w16JK8HSkIEZBaavUo8dO1lP3TNd8GAXnf3MFYxs6ktYqH0uvy4VDHnjLsEQ==
X-Received: by 2002:a05:6512:3b9c:b0:594:34ae:1446 with SMTP id 2adb3069b0e04-59a17deb93amr8297083e87.41.1766824858531;
        Sat, 27 Dec 2025 00:40:58 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.121])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a1861ffffsm7171646e87.81.2025.12.27.00.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 00:40:56 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: Alper Ak <alperyasinak1@gmail.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Tretter <m.tretter@pengutronix.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rockchip: rga: Fix possible ERR_PTR dereference in rga_buf_init()
Date: Sat, 27 Dec 2025 11:40:37 +0300
Message-ID: <20251227084038.28679-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rga_get_frame() can return ERR_PTR(-EINVAL) when buffer type is
unsupported or invalid. rga_buf_init() does not check the return value
and unconditionally dereferences the pointer when accessing f->size.

Add proper ERR_PTR checking and return the error to prevent
dereferencing an invalid pointer.

Fixes: 6040702ade23 ("media: rockchip: rga: allocate DMA descriptors per buffer")
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 drivers/media/platform/rockchip/rga/rga-buf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
index 730bdf98565a..bb575873f2b2 100644
--- a/drivers/media/platform/rockchip/rga/rga-buf.c
+++ b/drivers/media/platform/rockchip/rga/rga-buf.c
@@ -80,6 +80,9 @@ static int rga_buf_init(struct vb2_buffer *vb)
 	struct rga_frame *f = rga_get_frame(ctx, vb->vb2_queue->type);
 	size_t n_desc = 0;
 
+	if (IS_ERR(f))
+		return PTR_ERR(f);
+
 	n_desc = DIV_ROUND_UP(f->size, PAGE_SIZE);
 
 	rbuf->n_desc = n_desc;
-- 
2.43.0


