Return-Path: <linux-media+bounces-44759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C412BE484B
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 18:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E5761A66EA7
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 16:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2709632AADD;
	Thu, 16 Oct 2025 16:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RuvOvNYd"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35E832AABA
	for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 16:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631415; cv=none; b=m0sLpN6g7TIBInWhU7TQkDWlsiLgy/wwK7mjMXyDnLt/gf/hCEPAa6QE3hZOUD7T1Qec28t9P4nwUzwiKXx58NcfgOvtvpysaJbAWnx3L+2bNhF37VJC9dRgC956mbGCiNVLi6WcknouZakAf19lGZBLPZpDvsakaeNOf8w0IqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631415; c=relaxed/simple;
	bh=I1J3S6x5LiLW/zyWZ87aQm6praqo1qBzZH7S+vE3aU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hqYDLpcc7k3gYSSXgdwvHqWSait3E2L/YaItBy7m01DYHcilZKovxxpI7HPLIJ/5UIDB9meWEEBddcDaHiwo9OkUyeId7e6H9yxTAay/SW5SUeit/+YjMszpudwVZQ6BB+OzOtRXf5sgiZ6rIVNqlTvQKb77mxbTLjBSWL6YO00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RuvOvNYd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760631413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=36wLOxtnUtAVE2o+a4sL0tiiKKSB5B5mwGz4ZRb7cv4=;
	b=RuvOvNYdTLnqYqmoyGKNVVavvbI7TktPkLgKK4s6viBjFXRFGANi58X/Cxd35agsvOX1Lk
	rLTYWO1mJyqym5V2Y1TJf16MXfyrvkrua18PXLoLIACK88wLWuWDsOaufXqBqEEJ+3qiEF
	4eFYy0CkG0WEqRDT1LFYGAXNJEVc4PA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-Y_jRLAKvPyipciS0cN6Udw-1; Thu, 16 Oct 2025 12:16:51 -0400
X-MC-Unique: Y_jRLAKvPyipciS0cN6Udw-1
X-Mimecast-MFC-AGG-ID: Y_jRLAKvPyipciS0cN6Udw_1760631411
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c1f18cbc6so17940226d6.1
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 09:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760631411; x=1761236211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36wLOxtnUtAVE2o+a4sL0tiiKKSB5B5mwGz4ZRb7cv4=;
        b=uQUSBZjAdqXulGvsiuCny+yOObYrtb142vFJARoE3x/XQkWoPCv+JP138A3ktABEOK
         ZU28Wrdkz28+8lfSujIQNl+kypTouqN7cFqbNbHDYE4pkEZWMfrYKTheMQ3lFQivWaNN
         o/H2rH4bC85uszJ2W4ZNThn5J/ypXOUyK6vO/oXqEEKMzlDmuViFzLqnwtDYQY1BpyCN
         bHPbcZVi5+K6oStQFfk6gpdPGZEDkNvRFSSFBIe0Yasi6OwNaqU1TvF53QNNqfohWa/H
         OU8EN9Suz75zDk29fLsITMXORi3AYlH1JCYGCdP5PgAJ3Aa6AWdooyaVfeCIA5zz+pq1
         Dr0w==
X-Forwarded-Encrypted: i=1; AJvYcCUW6gX1vUzOLZ1H4LX/NIP0m4XDga+ebGuuJW9xQYTpz8Mjc5sNVjc8lf1Ny8Pc4I/Hk+stAHHpN/jefA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2iWHmlR5l4r2i4XLs8r8HHgXbwFpF5MBxFw5YwKzMeQsn4APw
	c4iEW35RFJsY1+9xQ+vr1YOA+omvRwKjAfAK2vz+gbAbDIFZ5ox6nxAHLUkaCN1fDKcel8riDcP
	wtQAHVOz12ZmyEsZbIVkUGjPTdzto0GiIvpUzyyM5usMx74g7jqOtEQJwXVEd9l3f
X-Gm-Gg: ASbGnctVWXBOSeU0hEp3o3X4em6Q5DAFF8wKa1ZeA9WyOA+b3xbzHndw5F+wsnYF/1j
	bV4ykJRbwOpqFErKceO0+T7BKDY+IWMgJZMrudJT3c1Hnb7jYQjITTwCvEP9lyvp9if+GyHXkOl
	FUawMpLj3I1CTYm5s/L4p4PcgrDEmMs0UOBFPjhgxgPtVUesYnBe1gJtvV/QqB+RnAAB1PThGd3
	9y0ZtkT6RhmWSGQiyI2WuFII1ogz1MDjEE6RgVqFwpYiZSssS2CS/eAaGUZuTO34owpPEkkMQv8
	c4dGMkrVljqoclh3RjBiogNSXPAZOCjB2EUMk6bGBc8e+gPcFGXV8JXmffQAXr+S63OEjtRTNR6
	lH5nIVlcTwl0iUBjJFpdpPnkvr2+WAryNpQc/uEmA0Ej7GNCL4AbnlIsFCOkjc9z4ajmh1w==
X-Received: by 2002:ad4:576e:0:b0:812:dc64:e8fb with SMTP id 6a1803df08f44-87c2055e0f1mr11220726d6.3.1760631411260;
        Thu, 16 Oct 2025 09:16:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2H4hqxbPAz78vUyuVxepWRoN/7lFlbe1nAViv5z5DCNPAXcja8zNCahwq2KBdmRw44i1b6w==
X-Received: by 2002:ad4:576e:0:b0:812:dc64:e8fb with SMTP id 6a1803df08f44-87c2055e0f1mr11220206d6.3.1760631410751;
        Thu, 16 Oct 2025 09:16:50 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0128c9d8sm44068466d6.33.2025.10.16.09.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:16:48 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 16 Oct 2025 12:16:29 -0400
Subject: [PATCH RESEND 4/4] media: platform: ti: omap3isp: isp: convert
 from round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-media-clk-round-rate-resend-v1-4-446c522fdaaf@redhat.com>
References: <20251016-media-clk-round-rate-resend-v1-0-446c522fdaaf@redhat.com>
In-Reply-To: <20251016-media-clk-round-rate-resend-v1-0-446c522fdaaf@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Julien Massot <julien.massot@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=I1J3S6x5LiLW/zyWZ87aQm6praqo1qBzZH7S+vE3aU8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDI+SqWZf/X6Vm73eU9DzfVsPYnraWE1XSySZzb8F5xoY
 rktkXlnRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABMxs2Zk6I1g+qq60NS5suG8
 wfeKlfo1s4O9T//Tc5+zKK/wF/9+S0aGTQqnuNcodYtsesUwpWW2WUbR1Kc/bltnPZ093TDF/XU
 6FwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/media/platform/ti/omap3isp/isp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index f51cf6119e978a3a33939bd83c2e676a43ca2c6d..8ac2bdcdf87b1fa0ad1b064cbeb7f1e7519973fd 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -240,11 +240,11 @@ static u32 isp_xclk_calc_divider(unsigned long *rate, unsigned long parent_rate)
 	return divider;
 }
 
-static long isp_xclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int isp_xclk_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
-	isp_xclk_calc_divider(&rate, *parent_rate);
-	return rate;
+	isp_xclk_calc_divider(&req->rate, req->best_parent_rate);
+	return 0;
 }
 
 static int isp_xclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -275,7 +275,7 @@ static const struct clk_ops isp_xclk_ops = {
 	.enable = isp_xclk_enable,
 	.disable = isp_xclk_disable,
 	.recalc_rate = isp_xclk_recalc_rate,
-	.round_rate = isp_xclk_round_rate,
+	.determine_rate = isp_xclk_determine_rate,
 	.set_rate = isp_xclk_set_rate,
 };
 

-- 
2.51.0


