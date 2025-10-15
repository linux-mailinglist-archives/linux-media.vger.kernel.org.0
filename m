Return-Path: <linux-media+bounces-44583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF787BDEA64
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 15:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDA7B19A6CB8
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 13:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6392DE1E6;
	Wed, 15 Oct 2025 13:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ksdC20rh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23E532A3D8
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 13:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760533707; cv=none; b=Vj6uFvBnCGJXjCzK67u6veP3586wemyFRv/hdBPpAFljL3nwwOi96D7GoOHY9HypszpwTJvFU6t/jNuN2WpNFyMk3UEcyjXkQQlM7Qm+SN61+uAe+1P3hCLqWQKXECU515YTH3u4/TgaeOua8crF0aj5gD/HWcUTK0Q//98fAXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760533707; c=relaxed/simple;
	bh=uJZCcSO4ZzIFTetml8qQBG5qetwn1iUwyc+ULXXLg4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IUhURAiSQZL2Jc5AmOz/gfku51uH9LIPhvSMLCa6UxHNkVmacWki3GqGIWyfOKKvTrVsSdCl7U33JoV+PoMSwEZPISC5Ia7VfHGMOyEXMpWTJxqyHvB5bsvyj62hRRPk+hYzGdaCTPaWQHQ5nA3LXParx5pwcCDY1cBhRUo11J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ksdC20rh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so3723046f8f.0
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 06:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760533704; x=1761138504; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3XFi3xy/0iOfTR/VXPqCk1gz0693H4eWmw+YtRPk9qE=;
        b=ksdC20rhN/C97CvHh8y8o4eNisWpwxfHlZnLhhictv42aM8KZsFszOyoSgLzioFO13
         1YTkhmLJmWZy2AgPZ/DHyJ57iH1nVhrmhtMRtwTarZaCUYHhP3xihXM01vY97AKznZCd
         2GS5KqO6Yst3uHM1Xm9hIg0waVMVCycOg523YaXnaY0G3PfcoCoJtU97GTSpDNcCluYW
         B0UekkxKhR5856Z+yGLXMvraIuljlRq7YEeGocSop7jjs7+9l0S5jtX/L3kROkG7Jn9Z
         j3PJg08LM9OTU/xBGVtc9pezNyoUxDsSyXY6iYY9FcNFCr38uEUYZAeexL1w79XjE01d
         T1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760533704; x=1761138504;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3XFi3xy/0iOfTR/VXPqCk1gz0693H4eWmw+YtRPk9qE=;
        b=J1mu0zVEFKiBFA22jnLeeK8UOPYx6q0uM7nkmu7KL9HzytfmLd7r95wWwAvFuogrm6
         7A1BitSNYLOAe63xkp+2BwzsWnVilQQMSQLXdhQhwFEJ0CmEyc98VSD6AuClz+4T1LEA
         WIcG/MW4CQMMz2o8iarpCw6dq210Ji2SW8/2O5idKvdO1raErWUki27baDzOY4xRv6AS
         FWN1TnNCgMBTMa/GRVaTNhEbycuJOgblUwzED9tueVDFhevzSGs8ocJdOnyeN1cOzRkW
         q/MGaPMEH8OAoAnq5w3QWuPIJQYV0zfa0y8wrMAFS33lDWSuXYk9iF86VPAc05VeBITG
         R1Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXHzEdv0465q6xPffW0ROLvrmJEuokMARVToL9vzgdUuRn3ZbySoG/ocqP1i+JDqqxUtcljZ4dpMPY3JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHwSNQVixVcHNhUr7qpnJZWaM23AcddPCHUWCLtLRoQq9BLxUo
	cMnlEr0uw1p3ELXAQ6uzPZCrCtBo3N3Cka36G7pueL112GxLvDiDnpl/CmbwBFIFy4A=
X-Gm-Gg: ASbGncvwiztWGy0JPewZD2PBZqCSQzMTrfwV4RzUDzV+VFpDYV+nxvR6biBg6KrEdag
	t6XXxk01KMEx1epfR/eYRE4fDu/gkkQjp/0+QkEr8uSba8MkCS/RGZEMASabHjejgk+ESN+SAz7
	ZdGiOMyrzJNw2+KhuWJoLq812Y4V7UUgviHTWxIYQsCGuLhuGKrxHIC4H4HjXSs42tFOYK7lVrC
	xMxGgX1jGKePnldyNZAdiIcFeMeugsECU4/yYv6LFtP9erxa0VN5s19/Tbprz2wcqCaNkhuCVHf
	PyCPjbhOwhS2E7hb4YXw1hIaHiEX/O7L2NEMjmqS9iXz65y5D0lae+OjY5QbTYzwRPLb0dCpI1T
	d0da17M7dE3IH6KU329lzISlAF8TlZNYPgkWe5YMt45QIejp5ziYSMIwV/k3eFA==
X-Google-Smtp-Source: AGHT+IGzGDs128iRILNF7tjFOkKXU2kAw43z5Qu4RGqw2jof5rsqx+R5C8XPjobp3RGKj17HHMY9kw==
X-Received: by 2002:a05:6000:1445:b0:3f1:ee44:8c00 with SMTP id ffacd0b85a97d-42666ab9597mr19380548f8f.10.1760533697069;
        Wed, 15 Oct 2025 06:08:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-426ce589a21sm29787321f8f.23.2025.10.15.06.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:08:16 -0700 (PDT)
Date: Wed, 15 Oct 2025 16:08:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: linux-sparse@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>, Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH] builtin: implement __builtin_strlen() for constants
Message-ID: <aO-cvXncl7dbnP_J@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

People are adding compile time asserts to check whether strings are
the expected length.  In GCC and Clang strlen("foo") is expanded at
compile time so this works, but in Sparse it triggers a "bad constant
expression" warning.  Implement expand_strlen() to handle string
literals.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Link: https://lore.kernel.org/all/CANiDSCsBAq3Yx4ybarUb_1NkQ-bvfXvWqb-DfqXatkiYJFZWiQ@mail.gmail.com/
---
 builtin.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/builtin.c b/builtin.c
index 3a29c3aec8a6..9e8fa5964b37 100644
--- a/builtin.c
+++ b/builtin.c
@@ -596,6 +596,28 @@ static struct symbol_op object_size_op = {
 	.expand = expand_object_size,
 };
 
+static int expand_strlen(struct expression *expr, int cost)
+{
+	struct expression *arg = first_expression(expr->args);
+
+	if (!arg)
+		return UNSAFE;
+	if (arg->type == EXPR_SYMBOL)
+		arg = arg->symbol->initializer;
+	if (!arg || arg->type != EXPR_STRING || !arg->string->length)
+		return UNSAFE;
+
+	expr->flags |= CEF_SET_ICE;
+	expr->type = EXPR_VALUE;
+	expr->value = arg->string->length - 1;
+	expr->taint = 0;
+	return 0;
+}
+
+static struct symbol_op strlen_op = {
+	.expand = expand_strlen,
+};
+
 /*
  * Builtin functions
  */
@@ -775,7 +797,7 @@ static const struct builtin_fn builtins_common[] = {
 	{ "__builtin_strcpy", &string_ctype, 0, { &string_ctype, &const_string_ctype }},
 	{ "__builtin_strcspn", size_t_ctype, 0, { &const_string_ctype, &const_string_ctype }},
 	{ "__builtin_strdup", &string_ctype, 0, { &const_string_ctype }},
-	{ "__builtin_strlen", size_t_ctype, 0, { &const_string_ctype }},
+	{ "__builtin_strlen", size_t_ctype, 0, { &const_string_ctype }, .op = &strlen_op},
 	{ "__builtin_strncasecmp", &int_ctype, 0, { &const_string_ctype, &const_string_ctype, size_t_ctype }},
 	{ "__builtin_strncat", &string_ctype, 0, { &string_ctype, &const_string_ctype, size_t_ctype }},
 	{ "__builtin_strncmp", &int_ctype, 0, { &const_string_ctype, &const_string_ctype, size_t_ctype }},
-- 
2.51.0


