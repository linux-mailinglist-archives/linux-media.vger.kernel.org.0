Return-Path: <linux-media+bounces-44756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC07BE4863
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 18:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5D109544CE6
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 16:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB7E2E54D6;
	Thu, 16 Oct 2025 16:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h84XWMLm"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C4320B80B
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 16:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631408; cv=none; b=uV+c+XhZgFJEJvQwp/I3i12NS5gfsaJ04rb9K89Hf6mV1RhfbvWvdf3K3NAAfLjMU4ZPAH4eViyclt01fCjbRrYq9DjUIq1Ezb381x69n7I6kABhqEoQAYhS2b3WwrtedRUtccY/FDrAovuHfKT4Pl0v0tYLB2vdrwN8nKCqgng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631408; c=relaxed/simple;
	bh=NaYMalA7cUh+j+ezOgQM39ElTueU/EbEBbHQwWpzShs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VixXvlc9mPEi8Rw6oA3rhuXsz/1sSDEtYVjTe7IB3J30kREY9bj6wdkcl1g7O/QqTcjn3D9FjNrmg13P1eJ+9t3saC7w6B8cVuVeIjT0WZNyX1JhHMshBmK7ZKZ3xDJQETtoccQjS3W3x4A5lQ1yL31aDyeteHQDaJaU4ZlJSj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h84XWMLm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760631405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WRqMAj85dTpiKl7/YxPGvelJtzJh6HEeQe0XuylDUXA=;
	b=h84XWMLmQWJmKd54oQ8d9/BLX+BDtr37qrc1ZYCxX5Vr78TgUIlQHo1PAy8QglO/prOlr0
	R90a7Cifj6GTS0oOxf+qOhAIMCzxO9RwTYh7eKS7GuC0sVYHiydZD3kCg5MVThPLmO9K1S
	XBgsy5903AWzBsNwDxbUWXDa7nWcmbI=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-y9ua4W6GN1SwmXdfgPyJvA-1; Thu, 16 Oct 2025 12:16:44 -0400
X-MC-Unique: y9ua4W6GN1SwmXdfgPyJvA-1
X-Mimecast-MFC-AGG-ID: y9ua4W6GN1SwmXdfgPyJvA_1760631404
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-930e3696d49so640219241.1
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 09:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760631404; x=1761236204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRqMAj85dTpiKl7/YxPGvelJtzJh6HEeQe0XuylDUXA=;
        b=U+zbFSM816kE+IFBjw2YoeOc+E1kgLTEZ8gnjpUuz/bGA5bQi1vp+bIjZXnsN92BCC
         EAik5knJNvGZd69pxVtByhtRo5w1sAo9YP/JPsGfvJfnEAxjF4LuD0F0hYEH4vqZF54y
         mGZc/1A6PC7pFfk6r78WsC1fU06E0yp/CfpzC0GGlR+cuD5nHJfp2LXes41hchuJ08wI
         rHXv81XeXvgO+lDqjuW1JK+BI49OEOPVN7tEkwAWWX3JSvWTvSlPit2YaqBuphdOdeMC
         UR9JJJVwpml5f3W2qNO6RLf82DY74m7AzXBCdwZVIqqwnYAaBdc5adrnc9jqfSeMg24M
         Cjaw==
X-Forwarded-Encrypted: i=1; AJvYcCWbKlVV3Az2LAZg1c9kb74ZEroi/YX7+elbpKPBxpc8uRMVsMruHUlVEQSoc1q9rXjBzzp5ovtkWlAe8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbSPzBi2FU5Kw+RpReZ7Kdz0AXtmhSpA25S8cVr3ipPeOE1rDP
	B4iN3trGYzbjqAhU23rYyvcaddmvEkhGYe5ekKTq0kYTfpeN3jw/mx89CIkXeT+KXa501iGfopt
	GRmm12ofOT3vCyUit8dElJAGxfRkQjw24OVlFNiKMdrXSPWrEnXtMqSiNBT2toqq8
X-Gm-Gg: ASbGncv6j2+68bSTvVJSUpWPXRO4Q4aMwHXObfBMLLyOCb6ValvF2gdJUUbEmVO2YQf
	ouSkWLb+pgzxcp3t2YXgOkw5hIxeyRrIQgiRGfwv1YyLy7qCJaOFbg4dOXuuuA2oUl6iLUEGdqS
	E6MDk9Km1fjRHaOCSefstGao3gUDXwIVPNO8lXJcrpETN2DStqZxNAsPHgxXu85hNOfF3FN3GcE
	rrTyZzIQEEbgnT9ALTJ00b80ybOob3dNZIWDvdgMMyY432Qih2fUR/HHzTPVm9aiAJwag6ut/uq
	eLu4Bhobd1cOJdMjBn6hkKdtM570WUpVZnX4yzkZ809OjvPyUQXQBVGfGfEjmbqQVskA7v7ZRMt
	k6Yjy/pY5uzwM7sFTreyrd0hC72AHAYXlnufMn/2WYjVdTJfmvfUtV2m8GdBm+ldQ8sQyog==
X-Received: by 2002:a05:6122:179f:b0:556:4136:40fb with SMTP id 71dfb90a1353d-5564ef3affcmr429100e0c.10.1760631403817;
        Thu, 16 Oct 2025 09:16:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsIRdZLdMNOCl1TcdWq4s7o7k8sorUtwIuHg8SAUHkAauIbmUwlYlU31GsE+KTdy4DOESJ5g==
X-Received: by 2002:a05:6122:179f:b0:556:4136:40fb with SMTP id 71dfb90a1353d-5564ef3affcmr429070e0c.10.1760631403462;
        Thu, 16 Oct 2025 09:16:43 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0128c9d8sm44068466d6.33.2025.10.16.09.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:16:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 16 Oct 2025 12:16:26 -0400
Subject: [PATCH RESEND 1/4] media: i2c: ds90ub953: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-media-clk-round-rate-resend-v1-1-446c522fdaaf@redhat.com>
References: <20251016-media-clk-round-rate-resend-v1-0-446c522fdaaf@redhat.com>
In-Reply-To: <20251016-media-clk-round-rate-resend-v1-0-446c522fdaaf@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Julien Massot <julien.massot@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=NaYMalA7cUh+j+ezOgQM39ElTueU/EbEBbHQwWpzShs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDI+SqU9vqTG0B+3556SLZfMHK/oiGlLViybIOIzyfPIN
 M9XvDZ3OkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjI968MfyU2rZtkaq4Xc7Si
 M8Lq8r0XK67zcVcybuCz+njg8rR09yyGf9bSF0x7ph4y3rJdqWlm3bNLDgv/d8xSMb/Aw3p6wTO
 XAF4A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/media/i2c/ds90ub953.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index e3fc9d66970a762d284955f14db48d7105b4b8c4..c18e88c1770b4efc17cb16f540177d0f56748e36 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -1023,15 +1023,17 @@ static unsigned long ub953_clkout_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long ub953_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int ub953_clkout_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct ub953_data *priv = container_of(hw, struct ub953_data, clkout_clk_hw);
 	struct ub953_clkout_data clkout_data;
 
-	ub953_calc_clkout_params(priv, rate, &clkout_data);
+	ub953_calc_clkout_params(priv, req->rate, &clkout_data);
+
+	req->rate = clkout_data.rate;
 
-	return clkout_data.rate;
+	return 0;
 }
 
 static int ub953_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1050,7 +1052,7 @@ static int ub953_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops ub953_clkout_ops = {
 	.recalc_rate	= ub953_clkout_recalc_rate,
-	.round_rate	= ub953_clkout_round_rate,
+	.determine_rate = ub953_clkout_determine_rate,
 	.set_rate	= ub953_clkout_set_rate,
 };
 

-- 
2.51.0


