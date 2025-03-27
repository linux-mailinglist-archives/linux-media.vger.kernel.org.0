Return-Path: <linux-media+bounces-28812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D65A72A53
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 08:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 523AB3B86C9
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 06:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE651C8625;
	Thu, 27 Mar 2025 06:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="VnXUtEUl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A881C6FF7
	for <linux-media@vger.kernel.org>; Thu, 27 Mar 2025 06:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743058796; cv=none; b=jbqWF+HJzgghdLVYURVcqoeTWiX6S64MerPohh2+INr7haOSpngMFAHhdHr+HO5Rq7j/y421Y71KzRZ9RG8TG7uwtjahXraSLIWTRMG3j5FgD7Es4KKICsL+BbENMReIZgV6tPkufE89TS27plTps3ykWiOPRGAYw6vUwQbfhlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743058796; c=relaxed/simple;
	bh=mZk1/g6K9/xfZWWHQNM53p/aOxDqD8e73imdnMmnNKA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mYTur1qRIwKs/loSLx6sbd9aUIHIduL1PTNV3pciK7wprBlpaHMKhRc92yDarM6FvWG/vRgM35hNK9N4TfOF+9PmZ5nWX4EO9GZjURpWkSnJgF7NKQfSmq3+3IISlnmcorfsP852tiA8slGNcaHutS8SwKH2QFGWa5qjJnEZTkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=VnXUtEUl; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso2753680a91.0
        for <linux-media@vger.kernel.org>; Wed, 26 Mar 2025 23:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1743058793; x=1743663593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4to77tfN2Uh/XXo3c+lIPR6s2qFb1tp5+3tSOChySQ=;
        b=VnXUtEUlnYuZngItHJzLd29wQYqVA++VmxZQ9jp6kUwqM4aH5hOOuEUfBVpVgZLBXv
         Vu9Coi2+QDT14EXvOJON6YozB6X+CX3/OQSiAQINcQP9FA/kuMmb6WbKTtDiwwWnKc5x
         tL6YrVe6Zj9SPcDwDsxw6qPczRaOpHJrpjl9rrc5uYOSKDA5tedZDM3k3FErjvEJHrJ2
         xVTlsfPJpAUuCrKH0+phS5oS0CLGJRnquUFB0bh472/VOhmCSQ6EGvEXvkrcSwXHwBty
         gp8ECYpP7J/+5i16BRI4d5Dy5mo9Bato5TfVDp65nU4nXvRQNqN3jhZ8oLZvRsuRsZ5Y
         ZllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743058793; x=1743663593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4to77tfN2Uh/XXo3c+lIPR6s2qFb1tp5+3tSOChySQ=;
        b=QkZwDvcEN+bK8AWl6RAsE4xArpyA//4qCr5NqfBt/unr4/qvfZxWkw9j20aEKeMdwc
         rmmfBIyR+HLnzEeRfJKTrRDXq1VgGfjJNBpr+8Pyab5Nxaoj9etQiVjmie8ti7PhxmjR
         BoCnd+F3oYVoHKEXR0XIBokiZNhzyM9cteH6J90SbvDbMIvgy2UCSaoQDK1eaOqiYXAI
         QuSkJ+y3q5UB/DyuoJSFklPelKKi68D+rW2DMsUHqR5Vfg9Xv7yUENhpmIO9XehMaK4p
         xwhr59fVgAto+vy0I+m9uTt3LyR/06gnUY4cpAp48NSUL9BK884pXLwurtLc169N5RNx
         1ESA==
X-Forwarded-Encrypted: i=1; AJvYcCVJB3JFBAn8zV9KALTncFfykIDWve0V2OGCGXcLb2ZoTqb8BrFvipMSdxqT9CvIE8Cmc4fsaZcOZV8BmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Dhiql5TIqmuh/iUIt3GYi+F+0P0PL0R3J8BTOj239T7EAnAI
	xjmNZbkfCxhM/siZyzXgaUWDGVSFy76owep9eOij+wypp/uYg8uFZjxOaU8de6w=
X-Gm-Gg: ASbGncv9sHJTecWw3FDFO6UR5p4WKVs3N9e1aEHxciM7hq7JFJg2Wqp7CxmX6j0S3bN
	azwl8nJUsdj8F5EV+AiM6q5H/IwHk6/mowQmrFiQMGeA5KlSy+ZfY7fvYvuQ+hnZfRLG/SvBC/D
	2yKHm0zqG4pK2jDMjreJWavT7dCR7IEK5Ms+ECegfRBsy9LvFK+RcigScuv5cALf44I6827BFvu
	DPpBX56mZC7wL7SI2lwGPd2jQlMKFdJ+GRrBWnZ4fxbp5QE8rkURWszFDQUTSP3v35BEdsb7T6S
	JkRyqgdgI2t7xJ3r6HJ1gKqlhR65HdL1F9htbOLPrA+ws0i+sWZ3puXWsOhFYbFimEx7lt8Q20R
	hYTVxq828XZyXiRJXgJKI4Ia3/8Ry91HrMrNxMSM4m0Deu04tPE0oMWOPmdo4rpmVTYp64rbcpj
	L0VpA8BCJ9kGU/kQ==
X-Google-Smtp-Source: AGHT+IHnETWyyanBiU2twDZ1VaieT35/Fur+NGUXFQac0h6cHFF/+Ft9G2H9gQIlqjGEPWZaiJQG1A==
X-Received: by 2002:a05:6a00:35c3:b0:736:aea8:c9b7 with SMTP id d2e1a72fcca58-739514c4fc8mr11981390b3a.2.1743058793466;
        Wed, 26 Mar 2025 23:59:53 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e33a-bfe3-6468-2896-023a-3689.emome-ip6.hinet.net. [2001:b400:e33a:bfe3:6468:2896:23a:3689])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fe33d0sm13513053b3a.70.2025.03.26.23.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 23:59:53 -0700 (PDT)
From: Ken Lin <kenlin5@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Benson Leung <bleung@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH] [v2] media: platform: cros-ec: Add Moxie to the match table
Date: Thu, 27 Mar 2025 14:59:00 +0800
Message-Id: <20250327145729.1.I04b964661552ce532dbefd1ee5999fb0a0641a07@changeid>
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

           Hans Verkuil <hverkuil-cisco@xs4all.nl>,
           Mauro Carvalho Chehab <mchehab@kernel.org>,
           Reka Norman <rekanorman@chromium.org>,
           Stefan Adolfsson <sadolfsson@chromium.org>,

Signed-off-by: Ken Lin <kenlin5@quanta.corp-partner.google.com>
---

Change in v2:
 - modify commit messages
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 12b73ea0f31d..1de5799a0579 100644
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


