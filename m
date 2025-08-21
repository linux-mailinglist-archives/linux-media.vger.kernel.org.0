Return-Path: <linux-media+bounces-40525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AE9B2EEFC
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 09:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEC4C3A5091
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 07:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343E12E8B66;
	Thu, 21 Aug 2025 07:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pMjMZB7J"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1075227A456
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 07:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755759701; cv=none; b=r7teficP9uSUedj0I1bG81UPIDXmGGg/Gi+znjJTtvW31Z1vK/4s85accnRM7bccubtexD8/zOihee/EFkw1ZMJq06UWJlAiUDAt1tZwaunA1JHz/H6FW8zb7YHircQnggGtQ00vAkldm+biwjY2dIm436MnQeM1A3Kt2erU8jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755759701; c=relaxed/simple;
	bh=M7Bib/JdBebS40o0jrtpXS8iLuYAPBh94mqbSc28ZVA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h6W8YDgFFwCQ9Vt1uTC1o8UhK3674GvE2OE+lYI2+2DxLScS4WHgpthC/xM2/0qktLqvnP9ooJKucJSB6+ZFKhvk5LDO98rIGZ5EgPlMXeyWzME7MWzQK1P84QQ2DhiL+oFkU/iD12Hror4GLQxBcT8kLQaYB2PWgmhvNZDKiko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pMjMZB7J; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45a1b0b14daso2693595e9.2
        for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 00:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755759698; x=1756364498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PcGKTRnVn7a8V2x6X2YOKx93dEJmZrO+ztyFPSTimuc=;
        b=pMjMZB7J+j7zrtwYHzBHDlhmMsNZKb5GVkBayg1NrAARr5klG/OBWGk7ZIVpGDwAQT
         7qscrSS+xkvJZtu9IaDs9T6JnqTb+KMe0fQ9i7RfColiV2xzwa1rTDdRzfld/0RuXy4P
         NXNGXIhTVbm9b+ai7tNM3IZPgG5BZem6aRn2Ed8eJZFibYJzRUWPLBtCt7zZVBe1K8yN
         12CIl967MVHsBo4tvyRoDoAw1/ZiHoqnmvj5beG982guAJOXfgi87IvtbmoeU1viPoyi
         +Zt/zlAjldXKD7nDJjCZ+k5ypHNWochrrnLRXSWmvDFXMe93wDHjeI1oQ2Y1oRW/zuRV
         ZJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755759698; x=1756364498;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PcGKTRnVn7a8V2x6X2YOKx93dEJmZrO+ztyFPSTimuc=;
        b=Ope4UQKwVQXkgf3Gpl0zOIO4/WUiKFSVrsedajEYNh4YcUEOURn71VfyDYxKQszxOw
         prexSy0AcMBPJokzHnZkUt3CHHsU+A6PfF9EXC6of+8J//n4e1ivziwM5pgbupyLKEpi
         do2NjydQI26Dom97QewCiMUnfKkUbo2YHfGaQNNe8iHnxcLSJO9fgHGo9phW0VCXqecc
         arPenYZCLjplE4blGxOKYPMWf9wN8YelP5e0zUwD5tyRqPthi05Vr4DeClgvGLWjXVVW
         Ho7G10gmZswr6GxUJIQBA/Cnj4L/2ET1v51xLXVkYg7cDQJo0tcCBNU3KAPcsvUQbM/C
         KvCw==
X-Forwarded-Encrypted: i=1; AJvYcCUeSIEg1Tf2kxV3ltTj0j4slZA5aFXcp/9uDN9OPxZnchIrrRcAl539bRuG4+isoC0oSg4jQ6UmIJGbRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw25j09Kt3QcWDYJw0EJKndl6j9qi4vw5O18u5w5mv6SW/hfbqM
	A0H7MJp+Nn2xIN9YWORUc/7ZiMGEdaWkjOq62VUsoA5nMjorgQ+v7G2Ay5Im9HskcLcDrWK/fkb
	KBF7QKw6mDQ==
X-Google-Smtp-Source: AGHT+IEvKA1t2VWCcec4SBBub/I6NGaabcJJj+3ewD0kETAjlRi67Ua4kezlEOhJEmMUX/fPtb3Na0Ihfzre
X-Received: from wmbdw4.prod.google.com ([2002:a05:600c:6384:b0:459:dcf5:1b54])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3ba7:b0:456:1b93:76b
 with SMTP id 5b1f17b1804b1-45b4e4f5815mr5734895e9.4.1755759698355; Thu, 21
 Aug 2025 00:01:38 -0700 (PDT)
Date: Thu, 21 Aug 2025 07:01:30 +0000
In-Reply-To: <20250821070130.2581766-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250821070130.2581766-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821070130.2581766-3-abarnas@google.com>
Subject: [PATCH v2 3/3] staging: media: atomisp: Remove return from end of
 void function in gdc.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fix checkpatch.pl warning on useless return on the end of the void function

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc=
.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
index bd44410729bb4..0906f1d1051b7 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gdc.c
@@ -43,7 +43,6 @@ void gdc_lut_store(const gdc_ID_t ID, const int data[4][H=
RT_GDC_N])
 		gdc_reg_store(ID, lut_offset++, word_0);
 		gdc_reg_store(ID, lut_offset++, word_1);
 	}
-	return;
 }
=20
 /*
--=20
2.51.0.rc2.233.g662b1ed5c5-goog


