Return-Path: <linux-media+bounces-41075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 367BCB35A3C
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 12:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4E031B674D4
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 10:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F77232143D;
	Tue, 26 Aug 2025 10:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FJxR4/n3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE60301486
	for <linux-media@vger.kernel.org>; Tue, 26 Aug 2025 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756205062; cv=none; b=h4ENLmEYglEvESAe3fEx0tdMthPGkW/GO6EDMhCVCW93Xjf3JQU7+yC1Dzg9/IhRIIK79OCBvZcbIL62cX2OgF9gnmnnmeQKQ+I/q72x/85L2olXag+7NAjQ7bq7v5qufQSpK4jOaclbRNxujYYALpz264Vj4quybZlRy/3wyXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756205062; c=relaxed/simple;
	bh=+zgQX5n/d2mC/6kdAop8Z5+A1NphGNuGv2qbP0kj7Zk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cKWCAxDjmB8YZRRo8eCHuidS7osef6KV6ofxvrHNV6/3peFnsOqHc6d1eZPjDcfDOEuO7YSiffUB6+XdQc3gDCvheWsh4nQjX3pw38NP3S6VkPRO2KSplDYuU23SLCO5n/5+h8gRBWZRYpKAjg3FgJUhcfp0/Xx3ogTNUn/p82U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FJxR4/n3; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-61c6d735e9bso1555112a12.0
        for <linux-media@vger.kernel.org>; Tue, 26 Aug 2025 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756205058; x=1756809858; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1d+AuaGuysupl4KsAvy+4lVzdrzPQOBrGdufkysul1k=;
        b=FJxR4/n3VC0TG/MdI2yKw6aLoKCm4KKcfSKBvrFWmxFT2HsF7YSTy5zTFMUdKkcif1
         IfddwVKW8365FbDqnSSVvTs1XMceQ+QGs8ApA3jw7O20B+su2zWj70atZe8JPxdiL7GR
         bMRX2vqYQXLqzXenDb280aNTlvYVwJdrzIhO9aJ+S1sn6Xk/+PPM8lZcJDkEnvKUUQIv
         tabhehrWvEu+V7VOhND/WgGaDEcsLUiLPr+cRa3sTtvfpToqGpgbg0badYAQMCUDyeJK
         CIYFveTnqeRnMEKWpPhTtEqy5KPm2wowut1BHZRaME5JXuIK+M5Fp4VTqrMkp2Vw9xZa
         gIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756205058; x=1756809858;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1d+AuaGuysupl4KsAvy+4lVzdrzPQOBrGdufkysul1k=;
        b=RyE/1/+FQA/lUF4FKqMw16XNEr5P8fk0VfLKEKeXDm7PToHGiJ76uzzbSo0h5hnLd3
         rLR0WD7U5FJQMyvQmhcX3se1cCqZGdqBzL0T5WsZhERApRiHYFG23ZtBEPDt++DvaUP1
         hz6UJKYYFSleOKxv0Yj4kOJsb+fdaBFiJjw5d3yUNNLaKF4v1XFTkX7yXVOiiAMOGpaX
         ZpL9Jr+nZAIylzqYEvhTExOOZj4Z1u4kGivx9wx/dVZimSVoA5lOjfpghElT+MoLEnDJ
         zYJSbbMIuac7lFlnF7Nx6jNGSqh1D99zPsfswKxmfwsESC/7rzW6BwUhuVurK1SY7bDV
         QW3w==
X-Forwarded-Encrypted: i=1; AJvYcCWFmdewnKtfINpR3sj5swwzgcSf7CaavpWfW7So/7dPEeGZd7KWgiN+3vw5I4buSuk8dVpb9Ny1fV1d1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTL27nkXn3tCIkzrwSzH/GTAxU/e8AYsRwkUFF5qZE7TrUGxy1
	omuAem0R9Rfpws9S7V7tVTjQHxsKgBvb+EjuS8vpMUI9LrVEhy655uvLECX2+iVmH7KsZ/YCiQS
	+FdvMXRkiyg==
X-Google-Smtp-Source: AGHT+IGW2d5HOG1vvQXD7LSZIWdEs/a8jnStvfjxZvWkliuplh9wjO/ErDhVGp/Da4SncqAtNWjCZrsUKWc4
X-Received: from edben18.prod.google.com ([2002:a05:6402:5292:b0:615:6fff:ecc4])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:270f:b0:61c:6968:d1a5
 with SMTP id 4fb4d7f45d1cf-61c6968e6b3mr5267129a12.25.1756205058336; Tue, 26
 Aug 2025 03:44:18 -0700 (PDT)
Date: Tue, 26 Aug 2025 10:44:12 +0000
In-Reply-To: <20250826104414.2817514-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250826104414.2817514-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250826104414.2817514-2-abarnas@google.com>
Subject: [PATCH 2/4] staging: media: atomisp: Whitespaces style cleanup in fifo_monitor.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Clean up coding style whitespaces issues in
media/atomisp/pci/hive_isp_css_common/host/fifo_monitor.c.

Fixes include:
 - remove unnecessary line breaks
 - correcting spaces between types and names

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../hive_isp_css_common/host/fifo_monitor.c   | 23 ++++++++-----------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fif=
o_monitor.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fi=
fo_monitor.c
index c5f78c5cf04c6..76762fc0929cc 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monit=
or.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monit=
or.c
@@ -49,10 +49,9 @@ static inline bool fifo_monitor_status_accept(const fifo=
_monitor_ID_t ID,
 	return (data >> (((port_id * 2) + _hive_str_mon_accept_offset))) & 0x1;
 }
=20
-void fifo_channel_get_state(
-    const fifo_monitor_ID_t		ID,
-    const fifo_channel_t		channel_id,
-    fifo_channel_state_t		*state)
+void fifo_channel_get_state(const fifo_monitor_ID_t ID,
+			    const fifo_channel_t channel_id,
+			    fifo_channel_state_t *state)
 {
 	assert(channel_id < N_FIFO_CHANNEL);
 	assert(state);
@@ -504,12 +503,10 @@ void fifo_channel_get_state(
 	return;
 }
=20
-void fifo_switch_get_state(
-    const fifo_monitor_ID_t		ID,
-    const fifo_switch_t			switch_id,
-    fifo_switch_state_t			*state)
+void fifo_switch_get_state(const fifo_monitor_ID_t ID, const fifo_switch_t=
 switch_id,
+			   fifo_switch_state_t *state)
 {
-	hrt_data		data =3D (hrt_data)-1;
+	hrt_data data =3D (hrt_data)-1;
=20
 	assert(ID =3D=3D FIFO_MONITOR0_ID);
 	assert(switch_id < N_FIFO_SWITCH);
@@ -526,12 +523,10 @@ void fifo_switch_get_state(
 	return;
 }
=20
-void fifo_monitor_get_state(
-    const fifo_monitor_ID_t		ID,
-    fifo_monitor_state_t		*state)
+void fifo_monitor_get_state(const fifo_monitor_ID_t ID, fifo_monitor_state=
_t *state)
 {
-	fifo_channel_t	ch_id;
-	fifo_switch_t	sw_id;
+	fifo_channel_t ch_id;
+	fifo_switch_t sw_id;
=20
 	assert(ID < N_FIFO_MONITOR_ID);
 	assert(state);
--=20
2.51.0.261.g7ce5a0a67e-goog


