Return-Path: <linux-media+bounces-45718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 479BEC114C5
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 21:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA724465689
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 19:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE9C31B836;
	Mon, 27 Oct 2025 19:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYXtKJHs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4F63195F4
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 19:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761595130; cv=none; b=S+6OX++XSbTEzhDJGYwtsTHwoZcxxfzCDUHORB6AZYf0MXKDjAQ7ET6qGlI77Fz4O+3fJfrdtP+86dx6sHXQITG5E//YXAsSysoU4CYdQK+1K089Azo2fumkgGe7bQSGpoy3/DggG/6q39DeRYesZDyOrGK5e1nVfYgnUmD6DbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761595130; c=relaxed/simple;
	bh=BZAMu1oHu0FAo/JjzkXlFAe2wQUjaV1a3CnBnCROdY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAaBErJbrIpPox2prQvf6Sy8BWGdVNB58dwnlUs6YNtzvSP9xfCHdEkbLw13A2OH5DZAxjiKWTa/6Wtyd1t0PVwdFW85efPQ790Nhlu0H7TIeYsP8guuptIXN5lx4deZMc2CYMTe2HiE0G84rNaGWZ/WkAjyWVcXxpjUV8cVDBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYXtKJHs; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-430d7638d27so52307805ab.3
        for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 12:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761595128; x=1762199928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYatPSd64HPpUGouUUXNhRGsgX4uRfvZpmNrkJocNvw=;
        b=cYXtKJHs6ldQtGoW8EYO1JAH0UjOaoObpgxymdkIvjN3szuqkYD6+7hM2LGrrEBce4
         poGaoEAeafC9gphJTT7zwe0YVoeRojLaSvCpKiZJsra/4Era62j/uuBQh8DTLkt6BrOM
         ray4e3vRa92jYbGazlQbarQDVefXHicCeCxrJKixg7lkjmxrG0ABui1gifjxeUgTrr3L
         U9L8oqpy7CdfOXFu2CBh9htZtKCs7vromQXJkXDxBTutRb4FNxzgGt0tRxfe08ZZ0ac/
         6LAv08K7DED2gxX6PZ7GQLxMfoHD0IK28/94sINQ712KbwFd9XbbRM5dqLU1v2C/Bpra
         hgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761595128; x=1762199928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYatPSd64HPpUGouUUXNhRGsgX4uRfvZpmNrkJocNvw=;
        b=AWwhPxqoArTNqP8lJCyYlG+D7MrZbcPO54vn0NOBkrR9AzOIbWRngS+CmkwmENOjzl
         nFuE1nJOPlWg/cqjtHU2y96MZ5GtwoRj/RtUiqy6RnanfXm36NzWvA6waGIKC/797AOT
         gZxnp3j9bkRchxYe8NquPprP1j8dCwxMEuVIEYsOSMc9aM9kKoblnBoC7A5tb1unBHoP
         0H+9bQo8Yr54FWrhNftV8KwtldK8C7uSk5YKGTaBJvNwRxCQULht2q3qlMu17gnQtp3Q
         iXa9W0Xv2UhFyrXlx/aEFzGex9YfZQa9IkzF3/oeEjvgYVmoxONnoxDFecqM8nooccMD
         /q6w==
X-Gm-Message-State: AOJu0YzBqdS3vCavEfev0JsVm3JCbkYRDEwJh4EBNiA9N0Re1m6GPBn2
	xxIyAoVnzXabGaTu16y4WENEWTCip7B7cHIV4HCKPmQIAkhnoFyBu0waw+MtSG0QFRg=
X-Gm-Gg: ASbGncu3ckp2NE1vp3Gh9V9kJR3VexFY79TRF7Yna+YLSq3ZMBO0zkwDnrFkJF7CNCT
	PNvzizxfDt+BVwwkOP3NYUk3n+dFWbAmT2akTJd/OW3lVPx5Wa25YmB0sKuLjGgBIch6tkp4S5Y
	e1z3AaWWXhHvzJk601oBRCN17i/yf0qopMIe5vjbY4HcrzOyhlQs7eegIyirWxiWIAaDrd3vrds
	qd7fP6XgUsfZ3K+W/u0iCBa+3kntsuzZy3P8Wrr7EeHNLnwiaqi67FFbL4AwLhOimiTxx45BuQT
	SHNxYBCgT68vnHlVELw3hrZ+aJLvJl2CiWfQ+KKGxPKphq4I3LGMWMN3+bUxuPFK2gbXPzpxDCU
	ivumPEzAlVmHnkBPNTE9jv54w6unLDSLD/W1MVhdAXABFz749ft6iNuX3nWojCZz1nj49H+kFEY
	sutIG7GScUYp6MOSfGgJy+Ry6WcJvhU0x4xH57YU0Xjt0gM+zT6wEt1FBjgeDWu3Q=
X-Google-Smtp-Source: AGHT+IEkTfSZCn7CNOjQuB1y9+Tg4K2UtnkiV7xpyYLiudbMJCZ6ETdnYK6ETtCF4JjQpHvmSwYWPQ==
X-Received: by 2002:a92:ca0c:0:b0:430:afe4:6a4b with SMTP id e9e14a558f8ab-4320f77080cmr18452315ab.19.1761595127885;
        Mon, 27 Oct 2025 12:58:47 -0700 (PDT)
Received: from princess (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea9e37cd4sm3482853173.60.2025.10.27.12.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 12:58:46 -0700 (PDT)
From: Ben Hoff <hoff.benjamin.k@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	lukas.bulwahn@redhat.com,
	hoff.benjamin.k@gmail.com
Subject: [RFC PATCH v1 2/2] MAINTAINERS: add entry for AVMatrix HWS driver
Date: Mon, 27 Oct 2025 15:56:37 -0400
Message-ID: <20251027195638.481129-4-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027195638.481129-1-hoff.benjamin.k@gmail.com>
References: <20251027195638.481129-1-hoff.benjamin.k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3da2c26a796b..313ac53f647d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4128,6 +4128,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
 F:	drivers/iio/adc/hx711.c
 
+AVMATRIX HWS CAPTURE DRIVER
+M:	Ben Hoff <hoff.benjamin.k@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	drivers/media/pci/hws/
+
 AX.25 NETWORK LAYER
 L:	linux-hams@vger.kernel.org
 S:	Orphan
-- 
2.51.0


