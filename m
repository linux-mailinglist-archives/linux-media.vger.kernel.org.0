Return-Path: <linux-media+bounces-46014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD370C20568
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 14:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 311D7188A5AC
	for <lists+linux-media@lfdr.de>; Thu, 30 Oct 2025 13:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8DA2222D1;
	Thu, 30 Oct 2025 13:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LG69tbqm"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B036D1EB9E1
	for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 13:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761832007; cv=none; b=IfvDiAZkqcRkZcjA39d0b1IatgcwaHe6nhMk6fO7PIleKNhWIWYMaj67786fwkhHnef913ZjAUBiPgSAR1mWQQ0WZuMFV6IcOhsT9Ys/ROo4ky4uxE96hEbybpzH8djLJADs5HJSum87P7MgjpxzLYc3BGhWT02OsWpzMb94Cz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761832007; c=relaxed/simple;
	bh=m/qQ+Ye47boxFRojPi93NDRLf547F5zOAg1Vvu5tBSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MGkSwzvgyuv/i0LJ7L+L2Y6bUohuFkoAS9/fNJ75U9IcpWQk6LyU7LaY+4JOQ81FfczBGx2YOXJDGumSYZsIV1+vFr0RP8yO6Sk9VDlentLmYQ7CjD32qdvSQG2RDooD1Xq7PKeO1IjA09HKZNF0GVlYCAVQP4kVAYJZFnAA07I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LG69tbqm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761832004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qXVeC5x4UjvdpdxBQtQYDv2PCBr6tJQZhEasSYJVqpM=;
	b=LG69tbqmsarS0cLiVVpoSmkrdr4Mfij6gcKGsrrRmkDxqBmMvnl55TSvDTTp2U6GzI3OHv
	r39v27r/kM6nWlhQFPlmwhnnalkiVojDql6jnXiNRTuY4H/dsTBUKBmgd0MUFBhipRjJdH
	rrrHaEH4YykmbcOyWibFPf7Sviw3RpQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-mNgKknSlNxeZ23CUdEyyhQ-1; Thu, 30 Oct 2025 09:46:43 -0400
X-MC-Unique: mNgKknSlNxeZ23CUdEyyhQ-1
X-Mimecast-MFC-AGG-ID: mNgKknSlNxeZ23CUdEyyhQ_1761832001
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-428566218c6so534785f8f.0
        for <linux-media@vger.kernel.org>; Thu, 30 Oct 2025 06:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761832001; x=1762436801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXVeC5x4UjvdpdxBQtQYDv2PCBr6tJQZhEasSYJVqpM=;
        b=R5hmyCAZAdHLrP3FZ5M5b0iGEiSOAdPL+MfMn6uxhqFpuX+JmOSEKgrvhmQFzvMEgb
         dk8sjS4q/1yUV5s6568kxjJ75R3RzoeRz60wkp1DMBcoT5UsJl0tkWzmeI43ZWHXiSHu
         B+vG9XLNyzD82+iF6AX/jS4LUV2rvZabxreTAVsgPuc9PnpmNbb2ZrH9iL31jBjjxwT7
         crpZlAoO6ICGcH5JXDK8OFxTLiRVdnACYNSne//Ab/9G1J5Y1StAzxncoubFrz0bl1Yz
         31ht8S+BOioc1JmgP/xTla+RWsxVZ+lH+ZbiXFzR2QUCqztpxOY+oafuYBZqsnIDvy/L
         RSTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW9cnsVWPlbQathAcAXLXfY5rE+y3nWzdfO0kwbum88YSr6SsWoTNwxO0DGUPwKWBodXUqlmtHABlg/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmZfh4W9ZMdqJvhn4BVgpFHPhwt8qYMf4jLqZzieB6J2EBmbiR
	muLXmk0gWQqz4MeDfdnvzTM+jx29WyDq2LBNyf4oDgFkW+IM6nfsHeCL4zbHozmQWi2FWsFWPsC
	qD7HgOMa7PAs3zd2OV/+g6GyoUjs3lWMsjeP4Sj67hMhqwxx/4LC+l12rdUXW4Bd0
X-Gm-Gg: ASbGncvJMhA9ymT0xNIOzvG+6DJSuazx57Y/5+zU2Vpueg5Ohd16461RpKI6Z0mD7YW
	W39+rlu6nUdoJfFKeZISVuM48pw0qKbYCF+x5zqsh2qkObYQdMwkU1APSe80Zsi9GbwR72o9au+
	40I6qeu1fG39YyjHZkqy8n4ySMBJqSDRVXMbUfZUITGOHaJVBg1FFoWxDu4xfhYEzTa2MMwhbIT
	Id4VamqJkhAXT7eeKkcYF/YgCxCQwE16t74IMzAbKOgU9+ejFVaB9XxvMGfvnpEdYa5MmvP/Kp0
	dtLKISPieNPsY5fptCcGFVI32ITmL5NbJF9n9IIfZL6OAYYwG8qU2HNVn4zuT8uzaHb4Cum2QXn
	879ZYfPCdYR4IYbRkZhEedtiFPrKr0VbPuRGsbJqGFf47OtbN
X-Received: by 2002:a05:6000:1786:b0:427:6c7:66f8 with SMTP id ffacd0b85a97d-429aefbdf05mr6876980f8f.52.1761832001301;
        Thu, 30 Oct 2025 06:46:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/4DJxIB6GKcBndXz26LErjJv4VyAkibid3kK/z0tZJxHwuSAecj/C6Y3Ult2UaXNcOJzYMg==
X-Received: by 2002:a05:6000:1786:b0:427:6c7:66f8 with SMTP id ffacd0b85a97d-429aefbdf05mr6876945f8f.52.1761832000863;
        Thu, 30 Oct 2025 06:46:40 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7a7csm32483487f8f.8.2025.10.30.06.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 06:46:40 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Tim Harvey <tharvey@gateworks.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in TDA1997x MEDIA DRIVER
Date: Thu, 30 Oct 2025 14:46:37 +0100
Message-ID: <20251030134637.134024-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit c423487bf667 ("dt-bindings: media: convert nxp,tda1997x.txt to yaml
format") renames nxp,tda1997x.txt to nxp,tda19971.yaml as part of this
dt-binding conversion, but misses to adjust the file entry in TDA1997x
MEDIA DRIVER.

Adjust the file entry after the conversion.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f7aa6a8a9a1..4d739e18aab6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25233,7 +25233,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
-F:	Documentation/devicetree/bindings/media/i2c/nxp,tda1997x.txt
+F:	Documentation/devicetree/bindings/media/i2c/nxp,tda19971.yaml
 F:	drivers/media/i2c/tda1997x.*
 
 TDA827x MEDIA DRIVER
-- 
2.51.0


