Return-Path: <linux-media+bounces-41076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 159E3B35A3E
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 12:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C09713ADC01
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 10:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB217326D48;
	Tue, 26 Aug 2025 10:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dYg7xJl/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80863090E8
	for <linux-media@vger.kernel.org>; Tue, 26 Aug 2025 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756205063; cv=none; b=A40Jl3BQ6wrlXxnH8ZPsUTiG2BYGr4V9sBDkpazSR4KgNmcyBTYWuLrN+gpFQSWukKm47L4I+10Fy244cqgyhBvw+nF8oMy5gjfAZjgubijORMotHEhLwaaC2ceZLWqAolNaqXXENw0p6+JjxpcCfygYLcAqwnVhHwJWspM7Or4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756205063; c=relaxed/simple;
	bh=liM9eRKLATT3ZL6VnM5QKUJlcWgIUIaeqGhZKRX+jhM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qu9OjuUM5G+N7C7yeGLrPGCSO+v4VdAWjOoU9y1n0aVgn9GHYy4dgZDNo5EN1qgmTv9wtyuc8gSJD97ipO7xG8wm7fejse5oV4UkbQLXreOXBX/+MujrmNQkImi7HvpCRIZIkikIlXFdQrnWmqojYdrjK4DefsYlLLX51uLZllo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dYg7xJl/; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3c79f0a5ff1so986456f8f.1
        for <linux-media@vger.kernel.org>; Tue, 26 Aug 2025 03:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756205059; x=1756809859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvqjc2Uq6UYs7NC0gnmnCXS5SKb+rIIaJ71OyXlnaBw=;
        b=dYg7xJl/w6EphD5IBCU41IGuin0uvFH5B2yHxZbFGeJCG9Y2UZPTKFjncNqeAFux09
         xBR0Smcohq4gLYLky64s1lVv+w33SU9vAA9SRHnAn+6z1ndx/KwyKMMKMqz8n4cDJOEt
         R/zmnWr1pQJhtMQGGeHmJDhMDxmW4z8K6DsGoN1xsaTCAEMFTO6x9RA73kDo7uaNwuDK
         MzD2C5+vDWpf/aP5RucluOIiyBnVnVGyenfkafy5II/xPsXuLJHRXZP49SjaCk8Jzdip
         XwB6ufMgPwPw8XL2MQDG2PBl3lTJFD9P7QP3CGj/woUOLGqvtTiVmGtY43RcD7e7VsNN
         vSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756205059; x=1756809859;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nvqjc2Uq6UYs7NC0gnmnCXS5SKb+rIIaJ71OyXlnaBw=;
        b=plmAXuZrhh9lumXRl10WPK01IPlpjAKMHZTV63IdZOGrPm7RJRQ22XRYU/lPV68eu1
         pqE8T36F7WBT6FjciWVhYwl7ilLCscg079csx1rFULZxX1QKgTn1+LDxQk+HDtu6qvr+
         F05XfIKWHj/14b2g8c8n2IVCA466kzNbQWFi1uQv2XzkqWoUaRf4d09c6jEC/obdwuaP
         Kza5BZxbmBAzUstGxf2RKjfMQqXIrvDGMKn2FDDPYo4F4ARkJFxt8Ayz29a3aCu0qJqZ
         o2sbvk1+hRNHslgekZZE4N0Gj4mvxxV4LoWCzgoSZ9pHHDnprLpW/ap+PO40fjEy6mtt
         vRvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDgcr7oqc6dgYWKW/NwUbgG0/baMKRk64Np0sm2XtR9Bmhwer6KmrrQzckXgUyGaZZdM1wMOB8Y1qxgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/1Je6b3OZGzySEHk2xU1QyjSBW7eU6BDkgnHiGytUIcMCy0Jb
	h2p1CfVRnDRXgcgHuVFM76BPufRW3GN/OOogmcKJEn6Qv+vIhMjGJqvrLzd2x8GBF89lz3yzyxA
	hoNG4/OaQRw==
X-Google-Smtp-Source: AGHT+IEhZCUA8cK1zdDsXe3cxZ2YP7l606fJk1sqWUVX0WU+Z/FGkAc6dryPpWOYOCYdSBOdJF7CAF7nuruD
X-Received: from wmti4.prod.google.com ([2002:a05:600c:8b84:b0:459:8c48:6c34])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1446:b0:3c7:f0fb:838
 with SMTP id ffacd0b85a97d-3c7f0fb0c8cmr6695304f8f.17.1756205059144; Tue, 26
 Aug 2025 03:44:19 -0700 (PDT)
Date: Tue, 26 Aug 2025 10:44:13 +0000
In-Reply-To: <20250826104414.2817514-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250826104414.2817514-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250826104414.2817514-3-abarnas@google.com>
Subject: [PATCH 3/4] staging: media: atomisp: Remove returns from end of void functions
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fix checkpatch.pl warning on useless returns on the end of void functions.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../atomisp/pci/hive_isp_css_common/host/fifo_monitor.c      | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fif=
o_monitor.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fi=
fo_monitor.c
index 76762fc0929cc..3caef0f4eb217 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monit=
or.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monit=
or.c
@@ -499,8 +499,6 @@ void fifo_channel_get_state(const fifo_monitor_ID_t ID,
 		assert(0);
 		break;
 	}
-
-	return;
 }
=20
 void fifo_switch_get_state(const fifo_monitor_ID_t ID, const fifo_switch_t=
 switch_id,
@@ -519,8 +517,6 @@ void fifo_switch_get_state(const fifo_monitor_ID_t ID, =
const fifo_switch_t switc
 	state->is_none =3D (data =3D=3D HIVE_ISP_CSS_STREAM_SWITCH_NONE);
 	state->is_sp =3D (data =3D=3D HIVE_ISP_CSS_STREAM_SWITCH_SP);
 	state->is_isp =3D (data =3D=3D HIVE_ISP_CSS_STREAM_SWITCH_ISP);
-
-	return;
 }
=20
 void fifo_monitor_get_state(const fifo_monitor_ID_t ID, fifo_monitor_state=
_t *state)
@@ -540,5 +536,4 @@ void fifo_monitor_get_state(const fifo_monitor_ID_t ID,=
 fifo_monitor_state_t *st
 		fifo_switch_get_state(ID, sw_id,
 				      &state->fifo_switches[sw_id]);
 	}
-	return;
 }
--=20
2.51.0.261.g7ce5a0a67e-goog


