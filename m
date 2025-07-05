Return-Path: <linux-media+bounces-36886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E9DAFA02F
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 15:08:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EB683BB222
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 13:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA89257AFB;
	Sat,  5 Jul 2025 13:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vkh34VYO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB117256C9B;
	Sat,  5 Jul 2025 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751720915; cv=none; b=qyttiQPmOUMgeTydVNAL9ELH/A7q/TKFbvUe7h3DPdLXqj/9zk+3zGpIWzT0XoJ7s8QrKFLQGH806xGq8x0tTrAKX+tbwv8UWfjKjZAJ191dE1UA7z6yRC+vJG1xWCnYYHYH/Ed4KK9vRt95hn4XnFZ6zccLKYBYzy0k7Sr8LO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751720915; c=relaxed/simple;
	bh=7nrB0pm6XeKOKTWQ/7ZSFuf1c7zycO+2BLXYYJ6dKfg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UjDK6QdtgtsjlYkYuCG4l3rdzw3wkktn92mapzsfxSJUxI9cGdeoupdOfO+/AZ8pX9+Hwy/vCTU9N8CrLFQZt6t33g1saCXkAti+bdRuhcH8IdnlD7U5nosJ1/VNy3uRCLdWtqZuzn2DA+Gty576W+LhUfdY7FvadsspZkVC0hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vkh34VYO; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7481600130eso2388750b3a.3;
        Sat, 05 Jul 2025 06:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751720913; x=1752325713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKb/RjujJ09Wos/zTMgKzH0CuSzFR52/Xqq9tPXCgm4=;
        b=Vkh34VYOE2A21w/+z6/yeXH7bI8ljQLvHJqh0B+NTVzpKxb+M8IhDzWUic+gZ9vneF
         jnkyfG89K9meFBMAtgDXFxLGL647SEjqprGcWSYNKzUbAc7q6jfk7b53vVtqTZiD4cGb
         /HoGRbz1gLS7Skv+8fjLtHrCAas4MtqA6soft0i4QFQ1kB4vHKgk6Lw7rdjcKwE53oW1
         HbwdCkNCPsDeOD7xC6U4nX9gsomNjhJotTQ32DafiWFh6ewor0NMND6jMttZeKnb+I5B
         dYsH3ByKYm629fDkIsnu3pBA5AKy3nmFEptBWXnM0A4vGtG8UcFOEFIblMWZ8FY6+j/5
         j5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751720913; x=1752325713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKb/RjujJ09Wos/zTMgKzH0CuSzFR52/Xqq9tPXCgm4=;
        b=rSlOuuxCIoBY5OSMcS7l3dL+7F4zWJ/medxkonkLapBXeYINxjNWjvLeMMjEEZoPLQ
         qQJdQdSRON3tL3cUY0zPFurMkIJjM3mDObtg9kX+YnlufspzO5MbQMXAlh1d3DXhfMdG
         qCDEGClBVYTV/weQnyUfcgDZo+bUufv+1PhIhZliAlnEZe3QySae9yhE+WwF13EaDeZl
         T5ebiX58Zav++OtQtWKXxKaBdZ3hIK9zBnOe6EA4YY/3eZ26kYA1KrI+CN4OV4yksG9v
         LBBWyJPHPFpSCvGm3a0DnAPRArftxLMF3bPveXXnHEhbAajaNsKXdC3nrjqLS2TdmVUd
         VOeA==
X-Forwarded-Encrypted: i=1; AJvYcCWIyr6l0fhmU5L1Q3P2G+ERy83TCE1mTq+r1MYwSONS8MzOkHb85UX56DmW7YiMVvo3EvWF7NJi1z81ve0=@vger.kernel.org, AJvYcCXyb9DUHN5cZO7pgt3UYSD3wpa5ew1oYACvTWbJESOSwKVzl/jMYCS12r4N2bdysDm9TQ2CUPbZW1js8bQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+VtAOp64fhtvg9vNgxeRDggxlBH/glFN2J2SczSXvUfZsb2H1
	AIu860anvCCokQ8tllrUPE70ZCqZ1BBXVA7SDCC8feXdMLWwGr4IWDkR
X-Gm-Gg: ASbGncsxRoV0CrWSWqLHsT7aSQpMEJcEHsPiBF2Dmq2CST9jJqWEn9aAEKxOwK2b++d
	8E/t2gM476RYdI/Y4nYM41XXFEIfQnnvVYbuWPzZvj/Og1TxXHVQPZLs4Bj50uRzxCDig9owEMG
	Y0ppr3Kd/s9nRbKudSpI+oDAaR7c73ROal8oxwNlXhQo2oK0Uhhh/GZNRHcnngrqOQV869f+of+
	7Z9+C1fyMTmaTprjSxqeZYiLMWfPv150vM7B4aFUOtqLevVdoxinPvuePMAxjYn9OxLj6LtA4aD
	+YMP23UTDsWo6ncpZkdOsBY7aEqrEKPPY8wBPsIO7tUrRwwjTEUW8osLhXyIYQWByQFPNk8IGjh
	Jfvj9Qhw=
X-Google-Smtp-Source: AGHT+IEbnbCplS+ls4OmO37F1YpTS9oMfGDhC7hyfHqjUgsi31bgHLZhxmdpwrzRjZU1gPcpGBZF6g==
X-Received: by 2002:a05:6a21:339b:b0:215:cf53:c35 with SMTP id adf61e73a8af0-225ba537030mr9953332637.31.1751720913040;
        Sat, 05 Jul 2025 06:08:33 -0700 (PDT)
Received: from localhost.localdomain ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a4146sm4434618b3a.141.2025.07.05.06.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 06:08:32 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jesung Yang <y.j3ms.n@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: dvb_frontend.h: fix ktime_t type description in kernel-doc
Date: Sat,  5 Jul 2025 13:06:56 +0000
Message-Id: <d0c3bb1478c7d8e75eda892f990c5782ea769e2f.1751719712.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1751719712.git.y.j3ms.n@gmail.com>
References: <cover.1751719712.git.y.j3ms.n@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the kernel-doc comment for dvb_frontend_sleep_until() that incorrectly
described ktime_t as a struct.

ktime_t is a typedef for s64, not a struct or union. It was formerly
implemented as a union, which was removed in the commit 2456e8553544
("ktime: Get rid of the union").

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 include/media/dvb_frontend.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/dvb_frontend.h b/include/media/dvb_frontend.h
index e7c44870f20d..607f7645468e 100644
--- a/include/media/dvb_frontend.h
+++ b/include/media/dvb_frontend.h
@@ -810,7 +810,7 @@ void dvb_frontend_reinitialise(struct dvb_frontend *fe);
  * dvb_frontend_sleep_until() - Sleep for the amount of time given by
  *                      add_usec parameter
  *
- * @waketime: pointer to &struct ktime_t
+ * @waketime: pointer to &ktime_t
  * @add_usec: time to sleep, in microseconds
  *
  * This function is used to measure the time required for the
-- 
2.39.5


