Return-Path: <linux-media+bounces-41074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDC9B35A3A
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 12:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF4202A0609
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 10:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2288930BF55;
	Tue, 26 Aug 2025 10:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E0P4yIrV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88A82BDC23
	for <linux-media@vger.kernel.org>; Tue, 26 Aug 2025 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756205060; cv=none; b=UWk9Y89ZvoiDL1P1j87EdiCYsdZRfzeI/MHQq0OdB5ZvpBF5+vEaXuKMYkVzsqv42X11a9jlDrVmwJiSQZwGdtENSFEqs7BozasgpA+Y+xwImd9d90+Dy/0cQz34TBV6Ssn6Iqsal0pdictcO7W+cuJTK/8E/63Gt3xDP1KXhlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756205060; c=relaxed/simple;
	bh=Qv97zhwU2pw0hz1dJh4Hg/76/dsJkZV2PExCzS2Vuug=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rH9sgq/PkcpCAhcBBfA+QHt4tV3dpGPJOSyn9MMf7UElVrodGpSYtyhycu0gaztc+MUp2NQVimlE5TTq0XrjGVkOB0xJJ5xmzdD+vnXiCLl2zJUTCggwWuYMssNDmbZUfqdRzu4vNkq788/l0nrK+cJPvtPn2GmbhC9pWygiJ5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E0P4yIrV; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45a1b0c5377so28343245e9.3
        for <linux-media@vger.kernel.org>; Tue, 26 Aug 2025 03:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756205057; x=1756809857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pXOFzMvqwxJwWOUNietR8Iur6GTKdJ2P4bWvUnRoWzM=;
        b=E0P4yIrV/i4E5dO7aO7ohqtMUbTqd56r9FjDQkC2/3XKdKuh6YdUDY0qVEKXB590OC
         Mw1iz7SSPuns2fJro1+B4GXEydD0QYK4rExg2+eRZ/bXEFl9S5FbbRADoDFJEA1f3v7W
         nygNSS0sY2VaGkmYrRnGnJqJoHTdkj7j40ZLgR3ypNDEDsyXKjnTPrB2r3OSwucTbyAt
         8c/ArSQeVi8EwfSObPe38DRRNkgTj8MIT7ORSSVfFNAl8/qcfqsQ6hbppdXuYQBXuxLb
         6Z87jOxUDGFU4Dt8Qm11esLPOFw7lNNho3pp1ZiFGxTfHwgp8s0F52vmRtmzJ3fkaMyP
         MyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756205057; x=1756809857;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXOFzMvqwxJwWOUNietR8Iur6GTKdJ2P4bWvUnRoWzM=;
        b=NsYLzrbMfel7G618hmpkwD/Sco4lbD2XM3+wWwTQnZ3Mb661lWV0h1KgEskfRL8BpM
         tJoCrUQaoc05RuWe0ctIcbzsYucB0EM0QYDTBHXhLGbo/eOrSHlCuO2GqNQNiSTBAKSF
         P/b/64iIrmpjhc7/yiYnHASbwo5p1cocFVYSVQ801ic98RtVen36Wp67ZqUClOgQQIC1
         ho20DwioKMwceCH4byhTjEm1Ro3EVXAvn8mn9k8DYttUkTx90W7g8+umcY6fSV/LpmpP
         PYMQGQSB1W0bq0DdoaC92YJV2nLMRlCa8MefWLpvVE2kTH/MYJyUTvfSgh/Ei8gCWfed
         p9RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUesTu7AbiVWT7fWvK2f0rhoQsX1s9laaUpQCqG9MQe25iqLjWbCKmlNQzQnri8OeTviw2QPXpTQ6O4rA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx55/OkZd7jtkaFXXsbSRHoFsfviea14T4z4AI6hXs9k+6vx3bO
	axUgyOoUBYynoUsJBfo+SSg6Zf18KvRGj4DhQZcwnzuPcx9Wo+xTwd31yJ4PDspCseFt71nxptv
	f6Nq/6m5TzQ==
X-Google-Smtp-Source: AGHT+IGgdWlyYKnRmm81Z3uoAruDXmZxLHozp40Vp5xHDoqvmExAZ8rGkE7VjTNkwaFrSkcz3uIErxD/64kI
X-Received: from wmbfa15.prod.google.com ([2002:a05:600c:518f:b0:458:bd57:d118])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:b95:b0:459:d645:bff7
 with SMTP id 5b1f17b1804b1-45b5179cf7dmr132133955e9.12.1756205057180; Tue, 26
 Aug 2025 03:44:17 -0700 (PDT)
Date: Tue, 26 Aug 2025 10:44:11 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250826104414.2817514-1-abarnas@google.com>
Subject: [PATCH 1/4] staging: media: atomisp: Remove unnecessary forward declarations
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Get rid of fifo_monitor_status_valid() and fifo_monitor_status_accept()
forward declaration because it brings no value.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../hive_isp_css_common/host/fifo_monitor.c   | 44 +++++++------------
 1 file changed, 16 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fif=
o_monitor.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fi=
fo_monitor.c
index f0de788154560..c5f78c5cf04c6 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monit=
or.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monit=
or.c
@@ -31,15 +31,23 @@ STORAGE_CLASS_FIFO_MONITOR_DATA unsigned int FIFO_SWITC=
H_ADDR[N_FIFO_SWITCH] =3D {
 #include "fifo_monitor_private.h"
 #endif /* __INLINE_FIFO_MONITOR__ */
=20
-static inline bool fifo_monitor_status_valid(
-    const fifo_monitor_ID_t		ID,
-    const unsigned int			reg,
-    const unsigned int			port_id);
+static inline bool fifo_monitor_status_valid(const fifo_monitor_ID_t ID,
+					     const unsigned int reg,
+					     const unsigned int port_id)
+{
+	hrt_data data =3D fifo_monitor_reg_load(ID, reg);
=20
-static inline bool fifo_monitor_status_accept(
-    const fifo_monitor_ID_t		ID,
-    const unsigned int			reg,
-    const unsigned int			port_id);
+	return (data >> (((port_id * 2) + _hive_str_mon_valid_offset))) & 0x1;
+}
+
+static inline bool fifo_monitor_status_accept(const fifo_monitor_ID_t ID,
+					      const unsigned int reg,
+					      const unsigned int port_id)
+{
+	hrt_data data =3D fifo_monitor_reg_load(ID, reg);
+
+	return (data >> (((port_id * 2) + _hive_str_mon_accept_offset))) & 0x1;
+}
=20
 void fifo_channel_get_state(
     const fifo_monitor_ID_t		ID,
@@ -539,23 +547,3 @@ void fifo_monitor_get_state(
 	}
 	return;
 }
-
-static inline bool fifo_monitor_status_valid(
-    const fifo_monitor_ID_t		ID,
-    const unsigned int			reg,
-    const unsigned int			port_id)
-{
-	hrt_data	data =3D fifo_monitor_reg_load(ID, reg);
-
-	return (data >> (((port_id * 2) + _hive_str_mon_valid_offset))) & 0x1;
-}
-
-static inline bool fifo_monitor_status_accept(
-    const fifo_monitor_ID_t		ID,
-    const unsigned int			reg,
-    const unsigned int			port_id)
-{
-	hrt_data	data =3D fifo_monitor_reg_load(ID, reg);
-
-	return (data >> (((port_id * 2) + _hive_str_mon_accept_offset))) & 0x1;
-}
--=20
2.51.0.261.g7ce5a0a67e-goog


