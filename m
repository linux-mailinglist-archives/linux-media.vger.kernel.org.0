Return-Path: <linux-media+bounces-37342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D39B009F4
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 19:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71730560674
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 17:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A97F2F1FF0;
	Thu, 10 Jul 2025 17:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W8Y1Sgvr"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034942F1FDF
	for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 17:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752168579; cv=none; b=PX20SJItXe8U9F3+wnHks1S258oS9pb/pDnBbhM5DDTnKrY3825ZL63KWW/0fmiK7cyhwa55h9gM6DBcN+3QYTXrEePg4rnNgUPe8myn3aUfs+tYPAP/ruKFoy3HQbP6qEeSbePngDdmW31z5uvDaBMYpQl5DbCDrvgThA8yML0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752168579; c=relaxed/simple;
	bh=JZJ1+WJ/h3efuGneP0YgJygZeG2phhVYgmqVgPTnIt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uZ6ItFZnoLVIufCNbWQIQTWoH2/FBCbMGbwCUImmod+edJr6vMOPw2L8Qgvk8bRkVJNo84Lqk9sV8zlCX3hvOl3LH4Cp5b1VXYkrwlFI0eYex0RxRZUB4OLMhXME0kyW0/qttv9n90FoMt1vsZ9RGnvKgsyPncqgnZbuP6nQUYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W8Y1Sgvr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752168574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qe7AYsdrV/kF5/kI8EQ2lMYSEAkXKU5aMhqdhL269CA=;
	b=W8Y1Sgvr6Y2cuqtZ1IBKW2hJ+AEeeAfbZ+jYlPQgkZOE4DlQ6MTTK9GWI9MNRsv/Lop4mp
	t+s3jqUChLR5UjoOpPp/CbmuZO0A99txeDmZMuUJ27iWflXa/noTkxNfZhi8lxJKr9K+cL
	Zs1VDPxD/V0qIj0IfYNRnVqSFi96atY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-QiPswneUMJOVJRNjtoCpBw-1; Thu, 10 Jul 2025 13:29:33 -0400
X-MC-Unique: QiPswneUMJOVJRNjtoCpBw-1
X-Mimecast-MFC-AGG-ID: QiPswneUMJOVJRNjtoCpBw_1752168573
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d40f335529so407947685a.0
        for <linux-media@vger.kernel.org>; Thu, 10 Jul 2025 10:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752168573; x=1752773373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qe7AYsdrV/kF5/kI8EQ2lMYSEAkXKU5aMhqdhL269CA=;
        b=KUaOgK36XPoPB874HFZaZ/HkooiN80bqh/jccdx2ctUO3PvDn4k6G9r+jgtasCuj3A
         ccu+Ia/EDAI++yMBgW9E5U/nt3khWDaOtHegsIkYvluDnlRBJg5jLydw/+gDfY0YgOK9
         vUBZgdD/GaoS43fqadWPwgNr0TfQMTph47UmlDaSagD2fPL3t34l71EnlF1OlDjoXIML
         1hNNb+4h9YuFEVpXfoe3bzI1+I4bMmxWBvyHuQ9axBT1fYDjoAMIUZpCvsLabC2B/Nj3
         Ud+s1aMDyEDojf1A7mbJT8R6LnWfVrDNWCj71BRpEaIsfqQXXd0Q2VGtT+S5F8JiIi/3
         r3Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVB+njldtm+rnVFaJe+REmUxcUJB1q0E8XDSnmps0s9D8E2eujmkaJoQ3dB8wcf+s6QC94V2/e05s/rhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAdbVrJV1k1llOOPOadcejrJip79mBy5NTpmWli5ScokTnxfzf
	/ebH/GQMd2ViVVQS9oUfep9X9+yHatMVxy64QuqabdwhB45RihXFwOInAdEQ3HhU0imbYnoU+tK
	F3LyfrfLCol1B7ylXpqTaNy6mWHgwC1bkNL0e3azL8g4fc8I7MlY7EYjMMT8GIy7m
X-Gm-Gg: ASbGncsx8Ov6LIfujUZxn5IhBZDHbl945nZfiN6FvHHVgSYrFKbflpdnBeByRohTxKu
	UNLO4vFUVP/R9FTMWYYlJ4B/7giehQRlT0JZwMMKd5lkrOFY8Nygy+Z4UFNBauJI3GRsOoKyeCw
	/ZgY01sn7BWpUKSFWpIfRrgdRSCErIpWjCb98hDn4xstQrmML3IITAnp7ZohTT8aKqMfU+4HyuO
	Wnu/0fGbTynSHuwP/vj/p95X11jhpzQeGXRDaf4IXrfp9mq7Ga5mTmn8WLATvJueds22Wcect0o
	DoOJFw7piuw36PpsDig+3r1jpdthzCYpr6vBAYUnPO78w9OyCIwcvlMejIzT
X-Received: by 2002:a05:620a:d86:b0:7d3:a7d9:1120 with SMTP id af79cd13be357-7dc99b9fb23mr599761285a.24.1752168572944;
        Thu, 10 Jul 2025 10:29:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhRh9pfM/NitNwmW4n5qnDy+EKx3DFE0OvpWeLo2yStURg5EFVw7RwMJth9qEJz3UaelbN5g==
X-Received: by 2002:a05:620a:d86:b0:7d3:a7d9:1120 with SMTP id af79cd13be357-7dc99b9fb23mr599756485a.24.1752168572453;
        Thu, 10 Jul 2025 10:29:32 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde806297sm117728785a.82.2025.07.10.10.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:29:30 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:29:09 -0400
Subject: [PATCH 4/4] media: platform: ti: omap3isp: isp: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-media-clk-round-rate-v1-4-a9617b061741@redhat.com>
References: <20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com>
In-Reply-To: <20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Julien Massot <julien.massot@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752168561; l=1494;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=JZJ1+WJ/h3efuGneP0YgJygZeG2phhVYgmqVgPTnIt8=;
 b=IyVbdUFtcuct3Se/7hbBiD4hUtLpQsL7G6BJmAUM3J6DE+u8YyGb5VRphLQ8BCsaYSemq5qGd
 lLPMEca2SwAD8r0Y8bX6CpLtJ7cKtgGRRz1mRHT2x9a4Z7brFi7V1+5
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

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
2.50.0


