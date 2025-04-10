Return-Path: <linux-media+bounces-29831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01403A836FF
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 05:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A2D68C0E95
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 03:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFF11EA7F1;
	Thu, 10 Apr 2025 03:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="sCxS1NZb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849CC1E1C36
	for <linux-media@vger.kernel.org>; Thu, 10 Apr 2025 03:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744254274; cv=none; b=rL+G79XjADONyDN2kswxxz5YaL/zzBxfhyS4d3sCiJYVXv8/crbQKGF3RxE5WywWK/2ChXV9pwtmCpjMjNWNdssXYNMogdzp2pICABLjWlo3cisNX30ZuTr86zqtjJHpKyFFtHumglonzlUed0/bsAdH/cTf3CekofqtYNIic24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744254274; c=relaxed/simple;
	bh=n9QosFtSbeNeSbP34lrbIPOZ8CcsdXMCj9ufOqlVKmg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tfKCCsO2bTAwctseJtbieA9geWWN/Zc6ak1aix54J/nqVervx6sHzYp0zbH5VyFsgwzemGgKB76yoO5nKlRtRET8hwlTO/b9owZNtEG5+ujwfc+F1GW4/hWwx8RVm7IK80Oksn28N+5ucOPNDOHyMPezttOtZm6gECzMUYSdPT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=sCxS1NZb; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736aaeed234so202141b3a.0
        for <linux-media@vger.kernel.org>; Wed, 09 Apr 2025 20:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1744254272; x=1744859072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9GbPHC4XyIZwMLfb2UD9p5RCkxg4ygXrRY6FVcmk18c=;
        b=sCxS1NZbqkZyKrXVuSbuNd/EjIrNUoJkbUL7XO4ImGLg608WsBrhAD+ln4Si3VoLyb
         oUyquyYZf0heZFpG/ATDEFOAiKqvnSvpRAUeuKysMrxLSiAjAK2/1jL8DkJDUy0xakHy
         RF/eUj3iSDULO9gkFN9hEI5zKCrqvAfvfS+OQOMzpuUNZoepNqNuz2zt7vfXw8UVHs3F
         c/MEhA7qUOFVxUHquSMtMsz3YqVDQSd/w4UgvRrpWNpk+NKh4sChM23SHvPi3YAaNYPm
         gpRoYfNZGrnAlUf3dkHYy09IrTceizDrSaTXYQU+1toAiRG2a2pluFijgZsdwcCR+Ejb
         CubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744254272; x=1744859072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GbPHC4XyIZwMLfb2UD9p5RCkxg4ygXrRY6FVcmk18c=;
        b=fwCbM2W17hxCjABwQLA3JJe+zD7BmVxyXqlk0vo/O499BDrtE3b0QgvCp3lEHt5Xc/
         b/JYHl/CRsgG9EVe/CEUattl+KysU3YZLd+3f9lZXiadZwtwn5KJaQZuuX4fjYMhskvT
         Ye5DXmitT9RI0MsUYqBqFECZ0FGKnYtChF8VXVe5HqQO3KMOpjc3hFhdh1JY/orw7XOr
         xL9kwutC+6Yk3JrYvJbebhPUey62jQXMeUokg217RsUPB9DvzQhGIPAtR6UPviCaaJVF
         RQ/xxNF18j7/G5o7U33bbp5BSXb/ywMKOoTalNk7twfO3YvNi8G+OyORPU1g3TPAwA1B
         fk9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCsxeI2E2yd8AHGwZvfnYIJLzVoA4fS4mjGDTK709VOeVISkRxqzLO5c4uNjE2gs8LL7pW0INm5UzjFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlklOAak8fE2Kryrq9WaQUzckYLltBiPEKaz4ggCCOwpiXd3UE
	d6xdq1kA2a+nPXX42Y6EaEbzgfhWGO4cSgFlIZ1wC4biUfEB4GHQnqO/PwyEu9s=
X-Gm-Gg: ASbGncv2q2BT/MYKHGH+KhQwisaQbBvJEw6Iucw0lrb/ujSTFHF/E4Phg1RRwP3d1hS
	xaRCpQmiPuG9ti4NP/wKdvv7zIjmvvktf77xgA6RddcQfA1efcNwqeESES5kq8Au2ROayMMhhNc
	2uzsN6WNUjb41EO/9WHBor0t7dNQtwb178ecorPubr5sdpXd1HkURkQM8x8QZdoKFVwMqouWrHc
	2BYeG//lAR6/srLWsBEQ4HR07EU+GDWPAF/pVbRUzgqAWv2fW8zJDDhIWQJEqQ2tfoZyHa9eEFO
	cAhf0ShpSBSEjrV3+FhGH92CgP0YEhqD1/eYa0AIacsFGlECZo/eDybEx/zVgCHOSs+ForQw5k3
	9BoD7Sd0mL6VSgIwqFL7wk/61H5vBtreCi+nIsTaRKWv5W5R05okjwwKOcku8X1fMXOQYZ4RZhy
	/m
X-Google-Smtp-Source: AGHT+IFxuMTEWXNHvY+DER3MAoYU6tYLKazUmZTcSJ+oZr5QmtLIkDa2HAYg6JAlPj0IBAYGmH0A5A==
X-Received: by 2002:a05:6a00:4642:b0:736:d297:164 with SMTP id d2e1a72fcca58-73bc0a14eb2mr1091377b3a.1.1744254271685;
        Wed, 09 Apr 2025 20:04:31 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e356-f6aa-66f7-bbbc-393e-d9a6.emome-ip6.hinet.net. [2001:b400:e356:f6aa:66f7:bbbc:393e:d9a6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e69700sm2233644b3a.172.2025.04.09.20.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:04:31 -0700 (PDT)
From: Ken Lin <kenlin5@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Benson Leung <bleung@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH] media: platform: cros-ec: Add Moxie to the match table
Date: Thu, 10 Apr 2025 11:03:59 +0800
Message-Id: <20250410110352.1.I78118a7168f9021bb12e150111da31de39455c27@changeid>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Moxie device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Ken Lin <kenlin5@quanta.corp-partner.google.com>
---

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 12b73ea0f31d4..1de5799a05799 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -329,6 +329,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dexi", "0000:00:02.0", port_db_conns },
 	/* Google Dita */
 	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
+	/* Google Moxie */
+	{ "Google", "Moxie", "0000:00:02.0", port_b_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.25.1


