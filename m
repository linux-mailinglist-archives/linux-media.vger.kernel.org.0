Return-Path: <linux-media+bounces-42863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DC8B8EE1A
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 05:49:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13606189D209
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 03:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136791991CA;
	Mon, 22 Sep 2025 03:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYuDhWzd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2831C69D
	for <linux-media@vger.kernel.org>; Mon, 22 Sep 2025 03:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758512967; cv=none; b=f7CmcTlKfnChDybLwTYip87w7ubKR5iIcVZ+8iZ9sl6AbAKobnueNfl9yKHtQgrl83K3TJzjRWqh2jBSpw+anWZ/BH8IDOKmTaAHcyxEyjqGYXsb05mF8dHbhAeES8HHe9zSKNC5yYMgCkEvK+az9P7p/812SRHz6Q+g/qlhz3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758512967; c=relaxed/simple;
	bh=R4BpydptfYN3o2mCLvyEh4whce1vNzMChCA1I6SaaVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PdG1j/A9D9h7jyclxAtPrk0FnIpEqiJEn/kIdj3Hnet9CVfObbRIVefoiO5dWL2bfOSWZf17et0P4R8H6BfutAId3OH9jKFpoYWGa9A/48zepHa+UiFeH+exQd4I/7U5BjdRnTpzDSkHdJYVbQjhfrh06yKyAbiNmAJlNsQSNec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYuDhWzd; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-723ad237d1eso35778527b3.1
        for <linux-media@vger.kernel.org>; Sun, 21 Sep 2025 20:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758512965; x=1759117765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cajskub3yInyko2vwCPecgvg5vw2BSZfivHDY0rM55c=;
        b=QYuDhWzd03k1zktMhZwd0zJ0thtGbv48C3gFIAKc7JwzRfl4F9m14md+1XQZS6P8pk
         /8PTyuQe+sV4mAMqLoHQxqBbNL8iRg5j1Gr2DXbkjGLr3hnHZtFGgG6K2dCdI6KTvThu
         2iBP+lK8lMzeDEPtGCmdLZkuJCJ6jcBayzLiYukEiGX/LL/KOnSgHiDHh9FyYgLDsGef
         6+BU1jM1q7cPcnLK4s6+0OAj5rMNrx6tGPEIEcHBYNQaCyNtLi+tKHGB2/0QRXRhrqJz
         TkREAEKAXOfMYBnOzj2h8MGpd9BXPYDfLUsqTgo0RN9ikfpr/4OTEb61ZBc/O+xWg2YK
         6yBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758512965; x=1759117765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cajskub3yInyko2vwCPecgvg5vw2BSZfivHDY0rM55c=;
        b=HjT1hkSpyFGh6YJG/2mlfh29aT5vjrTANjiTB8sR5zOpgsf7L2wesCT5EFUVf41T1c
         Vk+HbgdycAisjRAG6xFDu1aNXu/Y3C6G8NOENMKZ9LcZ0g3GcfKd2P993zRkyGlWipgb
         VNki6hXW6u4eCyG3URMd9nEsUjV0t06IOJXJ1iP4ZYwC6LXT9K7drkOylsQa3smhO10t
         x4+BjC4zOTe/ZOBT0k3vNXGacWymBs0Bu674g59rfNOwYAecH1yEM+WyTsAp1gvRG6RL
         zL3nCc8s7jXovDMt/ielb6fgfnz+fWU+nrs+xG0vPTfra+DWfuC1CW9H/eQzVzOQzwcr
         WFsw==
X-Forwarded-Encrypted: i=1; AJvYcCXRCnSsmvyvU3WRp3e5h7YX+4Kz1h/FYVYxGzZCjUaIwHWMtKGVnzdCE3iIgqk78uBVypVAWpUkH2+WFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO7qQG4JK5K+W7wTYNZHHgI33akQEsvAon0Z02PsHSVZK2F/Qj
	DhFo+kAshSxOkxqppEF94XLbEaA7d/j558C8Z/PC2Mr9z2503XSZmInG
X-Gm-Gg: ASbGncum3pPcqN420IcpC0VvDTBbOc5Vp6zRe2BdhawmOViUFREJyDS6rDlp9VAql4h
	euEPzy7PC0Q04eHAKsQTm8SwzU0KOTezZCeatc5b05F3BnOBW7SCjn7j7RMwlb1eXcglP9woU/M
	Q5KGpOFXaVq2jelRpV+/DhJieKjyYY4CFtnGrbkH4yzlOO5w/UQTnATR067crV48OU8i/uN92XP
	kdEaO3I6SAZ1ssdwu9WN8PN9ZyZ2A4omwbbRrQtI/PD/DpPRgljoZ9rx2/iSupp0dPuubBa0ZJW
	6E2PN11ILydGaUUcXDDcqCNXxJiXlgmPR+p+gtqIw/aMwCorcfItEAcHEMSuTTeSUj9GXQT7DQ4
	8CfN2Vb3FjbHNzv5Z6qUT3u+dFXsIcuGEndhnli/UFogu4TuNFrZ8FhTKnkgiaznpaWyQYtcLFo
	5SGJwfrMV2bzgc/TPRUKhvow3FgPjQcA==
X-Google-Smtp-Source: AGHT+IFvwkZzRYDO7G+CXHfhWGsoGmYJo6wv7xcxwSLMHGrtECzDTRnVvaHYE3sdgSu0oNVFnmnaIA==
X-Received: by 2002:a05:690c:e07:b0:739:7377:fda6 with SMTP id 00721157ae682-73d3ef2d908mr99924287b3.42.1758512964928;
        Sun, 21 Sep 2025 20:49:24 -0700 (PDT)
Received: from ubuntu (host-101-28.flgauca.gainesville.fl.us.clients.pavlovmedia.net. [153.33.101.28])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-74da0e03500sm6675897b3.15.2025.09.21.20.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 20:49:24 -0700 (PDT)
From: Jaiden Magnan <jaiden.linux@gmail.com>
To: hansg@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Jaiden Magnan <jaiden.linux@gmail.com>
Subject: [PATCH] Staging: media: binary: fixed a brace coding style issue
Date: Mon, 22 Sep 2025 03:49:08 +0000
Message-ID: <20250922034908.17918-1-jaiden.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a coding style issue.

Signed-off-by: Jaiden Magnan <jaiden.linux@gmail.com>
---
 drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index af93ca96747c..2264db62c818 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -498,7 +498,8 @@ ia_css_binary_init_infos(void) {
 }
 
 int
-ia_css_binary_uninit(void) {
+ia_css_binary_uninit(void)
+{
 	unsigned int i;
 	struct ia_css_binary_xinfo *b;
 
-- 
2.43.0


