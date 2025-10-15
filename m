Return-Path: <linux-media+bounces-44618-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE04BE0342
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 20:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55E6E3A8DC9
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 18:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B59B24DD0E;
	Wed, 15 Oct 2025 18:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5JpU+IM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17172325480
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 18:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760553368; cv=none; b=L56O5kr+il0/GYm08188qvfI5ThwbK1pxYgHQxmyCPlsK3WM2mRgDlyFTDWj38XzLElTq+Bg2w1i81iVvzS/369A0/BRt8/i0gtPEEpt5GOtmlT54doQj0Z5OVwb5/BkcqDbMSn+sOPtM+0Pr3NIreaiiA/rHt81xdDeJpIy3nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760553368; c=relaxed/simple;
	bh=SmF3D/xPAHHTJEmyJroTr7AuP1k7/7uiMAUqeODvgg0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kDHKcsxVqoTCmD1Fvi6oqVOxPP6K+NbPX45jpP8EFR9N2490DvKlC/OuBufSbEWXUrA25nhYVmXqa54Q+7ylndyDBudShNdcPTBWovJnBFnmZ9fiEGdyY5BlBQuHEtjCqGHElk0rTTatn4eiMX9DNU+JIOxzD9NN/E+acKEzaFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5JpU+IM; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7833765433cso9134165b3a.0
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 11:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760553365; x=1761158165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JJWMwls+LAtfP4tAZlyMoRyCGxEoib6nFV8vy2YJhYU=;
        b=b5JpU+IMY9B/n7gtdw3r7x5vUBvXC0xjcsa5uPTgYIrKJq97DhKAI/o/o2/IEfGWaK
         LYXFm3IYj0Y2j3JV5Pxt12UgQmzISgia8Ox5OCr1Kpn+DAB3qh4gBn0z4dnWQloi5T6e
         fqIITLYS1BKUJlwA2cRvvfWqW3KJxRpOKbSeksHYNbHIJt++++4fAElqF5LANKqAGTkN
         JwBxHPqRu0S6XRBx0RnC22rfco/HFu0knztdy+Z7khD+42D+SSdl8QeWpnoFI5e7RciE
         QYteANWCZ/i/FRIAClAy/jNBzBZS060uEnI9zUSUY2x3yTQa9n53J2ftLSE0SovW3E+C
         yp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760553365; x=1761158165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJWMwls+LAtfP4tAZlyMoRyCGxEoib6nFV8vy2YJhYU=;
        b=UvTPbG+6uIAuEpfI8RsjmDzwNFSaZ8WEMU3oLTKkZ17b6EEDfcimHNgNZnKGLZmA+R
         CqXkPwSkMZ6Igngu44Cxlhf+ZZ7ZExnacgL9SggUUhDbLG0yw3UdMvX3NBksR39LVtK0
         I7NF+BRWUDgBqGQpx5752yPky8vfyaynqEVNHCgvZfWpTMLhj2rBD2vqgkkt5+NR43Al
         k9GhawtNYI4vDjl9X65i2mmZrvDmb97U0zwLAyO/XlXI9QLUXgS5Xi4h0lQNe+OkMYDT
         f60k0ulSnTpmFDBPeXP5Ycu/3+P1Wn6WNT8Je263XI4s/zBp+urtgRyRlc4OODTfERw1
         509A==
X-Gm-Message-State: AOJu0YzPOAaRwcGFtOViAQOkwmSxObn1TZtXhV8tlRlI4jj7e9ucHxkF
	wKXJ6bMOunynIPrTeIingNtHhmkt1U/+wiOx4uQG/2c0rQyP5Yh1Rt2I
X-Gm-Gg: ASbGncsVtzmZB7+4zY5VO+4jTNbiFdmV0tUWaU3JeVKzWKIjAEcKhFQW95wY0RHxd70
	PKWCdMACa2FVWehvZeqMeu9FFoAJUGDajw3ouAqjvgAVKpdqzfhk3H1Jmi5qTA136sIwN1fUe2Z
	YWFCH6K2ral1YFeQTrhHHPCjkR55hZ3jCsT24avNAcdNWW87NYTn+Qut+d2TJrE4D8I5d4YdVw8
	Xy9rnSnggnE2ABDwRKkRr4Dn9gKlF0GIfx4EyQYKKzZjpdl8QMcM9yAFyE/jQgjAmad3PecGmzG
	cd9G2DrF4CS29/Ns6mEAZcM+/C6EPklMLOIHGBDhgFIZxDAIndfzfBWH6Rtnf+BJ7oEMD5yVd24
	20NL4NPuA7CWKc+offVuYIKByC3Zi4W598HViDJWyqsM50hpV1Phz88eZxAke8dGQrm06pw==
X-Google-Smtp-Source: AGHT+IFlyCa56i9R5oJazvL2hNHkiDW7KJ+UW8SY3pz99LslbXWkSaiSVgZEMdYa4bSHd+QjdapDNg==
X-Received: by 2002:a05:6a20:3d82:b0:334:97a6:17f2 with SMTP id adf61e73a8af0-33497a6182bmr1030221637.14.1760553365032;
        Wed, 15 Oct 2025 11:36:05 -0700 (PDT)
Received: from crl-3.node2.local ([125.63.65.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a22b9c315sm298122a12.29.2025.10.15.11.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:36:04 -0700 (PDT)
From: Kriish Sharma <kriish.sharma2006@gmail.com>
To: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	corbet@lwn.net
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kriish Sharma <kriish.sharma2006@gmail.com>
Subject: [PATCH] htmldocs: userspace-api/dma-buf-heaps.rst: fix block quote warning
Date: Wed, 15 Oct 2025 18:34:02 +0000
Message-Id: <20251015183402.1649988-1-kriish.sharma2006@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following warning encountered when running `make htmldocs`:

  Documentation/userspace-api/dma-buf-heaps.rst:29: WARNING: Block quote ends without a blank line; unexpected unindent

Added a blank line before the "Naming Convention" heading to comply with reST

Fixes: 1fdbb3ff1233 ("Add linux-next specific files for 20251015")
Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index a0979440d2a4..c0035dc257e0 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -26,6 +26,7 @@ following heaps:
    ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
    created following legacy naming conventions; the legacy name might be
    ``reserved``, ``linux,cma``, or ``default-pool``.
+
 Naming Convention
 =================
 
-- 
2.34.1


