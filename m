Return-Path: <linux-media+bounces-32601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDE6AB8A08
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 16:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34E23176AFF
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 14:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EEEE20E306;
	Thu, 15 May 2025 14:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExprBEY4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BE653363;
	Thu, 15 May 2025 14:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320862; cv=none; b=fC4d/9x7dzhpxEUorTRB12iQVTV5v1fmuojjmVgsP1r4+rjJ47GczhvtNQ2JMXq+koAHKUQMxQa4fkXwrt/z6hIkQzdUI+O0GwFGskbflKG/iabOmdNSlLinVCNeNDIH4H9uZs7RtE2SaVHYuj394+IBRqPAO+WBuP6Tr7Xcg4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320862; c=relaxed/simple;
	bh=dt+vTGfHYFKWmSNzmatAnrVxES49h0xgerKxeszNoEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TWn4HDu5VTshy+eUvL225n061mrzw1wyobwmmsyQYLav5ALLzEajJGHyHGUIz/nKoUo/nZUgU4vLzaCU+A6NR2LDvuXDVuEnFu9MOy9L7qTOxCKslTc+3kIsYHyteKi/1Xwd5k/1A1u5ziyA3c46kGy3uktVOtqvYSHuSlPMNz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExprBEY4; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5fbdf6973e7so1332951a12.2;
        Thu, 15 May 2025 07:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747320859; x=1747925659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AnZP8zYyxLfJR8Q5g++toUplHuGONRuvc6eCNUa3kD8=;
        b=ExprBEY4G40GxJaLmHsNGbuerPxNKG4rrrN3ESl34xGATvj5izurs47/Csif8CTdLc
         TU52O56UmqjfYxEjdfrXpDl9aWJpOjZW8nzw19HZjHbjXh/mg4UuVoZ30coRG1L8rmFS
         MLVBIyVjsJOkg4ORt54k3re7uElf1ysSA10MlXF0fLaJ+pO7SoFgQHevbUKrfkBFgv5I
         0DSZcSjModa7CMTJrkigRtEzLKjD3SbC+u2HGlkbiHFfZcSecP68xy8UlZZkhemHIgU2
         OSFt6yQ06+UAqUHvyXJ4eRy4/Syd2b671t63aHt+4Dz9tmsboyLgeIcsqE8VyebhSQe/
         pmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747320859; x=1747925659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AnZP8zYyxLfJR8Q5g++toUplHuGONRuvc6eCNUa3kD8=;
        b=Q8G9+iQC0ioUYqWOZOsxndgnJbx30PJCVYSCxwZ+NyLWh9pbRbhS9W/gKitq09EAJ+
         x4nskKZGWRdO3qfsRozqkHGXATUHPANw7Zsu4CO+SlUM98c8ucJY+S4CwqABEOTDxpQs
         h2vybFiwhpTDnmBRtKJL9q3R4toShCpKzLcDIUpLioRYudfT5BF6BvmJx44KZCmouwe6
         gg8EPvbcNiIg08medqoiaiTo0EgzHYjO7Mue7RCjuhKXvnyhqOFgxV3BXxt6dXKAVLV8
         nJKPzmh2s5tIqIDzy0/0Qh0yA3/jk/Xlv5rYCLsZv7wVjKU+hxv9V1Ez+pGVYC/K5OrA
         /Cvg==
X-Forwarded-Encrypted: i=1; AJvYcCWclpwLj9ezA8L5hXa8Zx9u7LVEXZWn1HdJnKt3N6hT7fu+dvBdrs8+eRqU468DaW7CnfTxOmT1wMLXY2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi8Vp2UNo5hq1x5Whyf0DuvIHeaTC9+pcB2llM2ow/GHg+WoRN
	zZnQaZCw4NY7cNXp78jq3CWkeolPPwDxapSo65S3Lc0pQFHUWSvBI69lHB8Y7ZHdeQ==
X-Gm-Gg: ASbGncuIzjGxdxwXt/B9L5BxwyS8B/EjeczK4c8UKRreDRKgveOsBWvGcQqQpjNB0Tb
	CLj/gmrTY+5P7VgwHwKCoGmvVo3AwEl7OJT1k35lqk67Ib2zcaNRu9JaiS6kwwprbTWWwftkavE
	ANq6kaQgcK/bHIMXk4L4MGfK30Rk2W8asbGJKt5ETGUjF0LhJ4mZXkoxHE6qyi8G9aby1jM4OmU
	KkRxZDq895bYMJr1YDPFr/+oo4MYz0+e0leiPs5L/KWUVhleegJaHPfqnA+TLlIY5bU1gdrISzr
	nahr3hHSVoxyrjcP0zOSB5n9VIt1HbCvaEoPFN+HGLrPW3W1gDRM0vZSwoqcDw==
X-Google-Smtp-Source: AGHT+IHyHUvPaBRGkNVp8odY45xlwAbsmexgkeI6ikJkzUPH8XilLTMjzxiK002IG5equ6vL2TEwzQ==
X-Received: by 2002:a05:6402:1ecc:b0:5fb:1fbd:e3ad with SMTP id 4fb4d7f45d1cf-5ff988a5ecfmr6853430a12.13.1747320858961;
        Thu, 15 May 2025 07:54:18 -0700 (PDT)
Received: from avt74j0.fritz.box ([2a02:8109:8617:d700:2d36:8b46:22ae:7bde])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d710549sm10332681a12.76.2025.05.15.07.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:54:18 -0700 (PDT)
From: Martin Hecht <mhecht73@gmail.com>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mchehab@kernel.org,
	hverkuil@xs4all.nl,
	sakari.ailus@linux.intel.com
Cc: laurent.pinchart@ideasonboard.com,
	tomm.merciai@gmail.com,
	martin.hecht@avnet.eu,
	michael.roeder@avnet.eu,
	Martin Hecht <mhecht73@gmail.com>
Subject: [PATCH v3] MAINTAINERS: Update my email address to gmail.com
Date: Thu, 15 May 2025 16:51:50 +0200
Message-ID: <20250515145150.1419247-2-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace my corporate email address by @gmail.com.

Signed-off-by: Martin Hecht <mhecht73@gmail.com>
---
 Changes since v2:
        Updated body and message format.

 Changes since v1:
        Remove whithespace in front of Signed-off-by.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5dee8459a614..e4a4f247d826 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -811,7 +811,7 @@ F:	drivers/media/platform/allegro-dvt/
 
 ALLIED VISION ALVIUM CAMERA DRIVER
 M:	Tommaso Merciai <tomm.merciai@gmail.com>
-M:	Martin Hecht <martin.hecht@avnet.eu>
+M:	Martin Hecht <mhecht73@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml
-- 
2.43.0


