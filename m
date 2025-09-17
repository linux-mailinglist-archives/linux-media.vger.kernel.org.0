Return-Path: <linux-media+bounces-42640-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0DBB7D77B
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 14:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FE3C7B17D1
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 00:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4E320B21E;
	Wed, 17 Sep 2025 00:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b="bRQrpbyn"
X-Original-To: linux-media@vger.kernel.org
Received: from ksmg01.maxima.ru (ksmg01.maxima.ru [81.200.124.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B9C13B2A4;
	Wed, 17 Sep 2025 00:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.200.124.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758069784; cv=none; b=k3vYo0Wa0OjRlVF9urmjH4IdKj2u9crQDnnJ99X/odI/RrlGy3wr3q1OmgKCIscT6I/OMoDzH79PJftk7zySiZMEb+pNZ0VTtVCW33w4JDeHwCUGD0H+Go0FfI0I2lL2D6sfs2oOTrHEuAbgWFLLxcb0YYvCgMXy/gAxbLr0yg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758069784; c=relaxed/simple;
	bh=SXkL13a8iG6GEI5p2NO+RC35HdW6nueOrqs/a8naP5k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B+tNpx31giw9p9iku/NKrgiRakTI9nQy7I2ifM2d4CSlfRzcVOiuHBM0gRgLwsTAfhMgim2g+wGXUpU7EYKeK5d4YG0jTe2F8oxaBTMI//M6rgV5YDmqC7lqTf3uxcqHlmRdkh8iNVb39wt4wHkqr+otdz5ASBdPPXJ+7AQYN78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru; spf=pass smtp.mailfrom=mt-integration.ru; dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b=bRQrpbyn; arc=none smtp.client-ip=81.200.124.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt-integration.ru
Received: from ksmg01.maxima.ru (localhost [127.0.0.1])
	by ksmg01.maxima.ru (Postfix) with ESMTP id D77C1C007A;
	Wed, 17 Sep 2025 03:43:00 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg01.maxima.ru D77C1C007A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt-integration.ru;
	s=sl; t=1758069780; bh=mMy7o1VKxSYYmV008tZxBY5ChzQiqbztmhJuX5eQfvU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=bRQrpbynxPG53Z7IHFd5LNs7TU7qMhRnu2bxAIP/K8dyD6u8p+WPKvXqLAg99wYsj
	 yYR3pbeAoR49CTzfglEVL69Ig6NCos/6CRFlvTfoqnLMunWzZDphmXkirUSEAJ/i1V
	 fuCiZvyqK6rSfJmPxmKzJ22Wd2/R878MmJV+mmkfMJOsk9uWxf9MUFxaUm8LASsQPR
	 FFlaVhvOHZr9VtCK+/0thCCBiMu5CwR1enkpJEKYQ9fL8fGKyc+I+2I+UgbDrAhpAk
	 GQlii6JK/Hkk3Gg72wWnJPQ3bHjrz/icY0BslHUShqOYZy7sdKfLgqNClee3Avq5Br
	 qlM4cEqC360Mw==
Received: from ksmg01.maxima.ru (autodiscover.maxima.ru [81.200.124.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by ksmg01.maxima.ru (Postfix) with ESMTPS;
	Wed, 17 Sep 2025 03:43:00 +0300 (MSK)
Received: from db126-1-abramov-14-d-mosos.mti-lab.com (172.25.20.118) by
 mmail-p-exch01.mt.ru (81.200.124.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 17 Sep 2025 03:42:59 +0300
From: Ivan Abramov <i.abramov@mt-integration.ru>
To: Andy Shevchenko <andy@kernel.org>
CC: Ivan Abramov <i.abramov@mt-integration.ru>, Hans de Goede
	<hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Colin Ian King <colin.i.king@gmail.com>, Alan
 Cox <alan@linux.intel.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH v2 1/1] media: atomisp: Avoid memory leaks in ia_css_pipe_create_cas_scaler_desc_single_output()
Date: Wed, 17 Sep 2025 03:42:36 +0300
Message-ID: <20250917004240.506794-1-i.abramov@mt-integration.ru>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mmail-p-exch02.mt.ru (81.200.124.62) To
 mmail-p-exch01.mt.ru (81.200.124.61)
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dmarc=none header.from=mt-integration.ru;spf=none smtp.mailfrom=mt-integration.ru;dkim=none
X-KSMG-AntiSpam-Envelope-From: i.abramov@mt-integration.ru
X-KSMG-AntiSpam-Info: LuaCore: 66 0.3.66 fc5dda3b6b70d34b3701db39319eece2aeb510fb, {rep_avail}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, mt-integration.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;81.200.124.61:7.1.2;ksmg01.maxima.ru:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 81.200.124.61
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 196326 [Sep 16 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.11
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/09/16 21:49:00 #27824829
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 7

If any of the memory allocations for descr struct members fail, goto ERR is
executed, and none of the previously allocated memory is freed, which leads
to leaking memory.

Fix this by freeing memory at the end of the function in case of an
non-NULL err.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Ivan Abramov <i.abramov@mt-integration.ru>
---
v2: Fix code formatting.
 drivers/staging/media/atomisp/pci/sh_css.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 73bd87f43a8c..d50bc81a59dc 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5907,6 +5907,10 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 			    "ia_css_pipe_create_cas_scaler_desc() leave, err=%d\n",
 			    err);
+
+	if (err)
+		ia_css_pipe_destroy_cas_scaler_desc(descr);
+
 	return err;
 }
 
-- 
2.39.5


