Return-Path: <linux-media+bounces-32001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BDCAAE9D6
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 20:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11DA69C12A3
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 18:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6980528C5B0;
	Wed,  7 May 2025 18:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SHmCrsOc"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E8128BA9F
	for <linux-media@vger.kernel.org>; Wed,  7 May 2025 18:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746643690; cv=none; b=KpWUvTEAorA7NaJtLm/PYQYce+85PSMJtLwsR3DGLwuvRSdxN4S9AOW9HHVLNjo0WIjWLUyRU/+PePjH/MIauBxSsyzpJD3hGiVkDOT9t7Sg3gtsmi/RLSgjpRFlLR6P1X1NArRb8t6McVFlB9xh4QMyIq4WBwnei0Xes7MsY4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746643690; c=relaxed/simple;
	bh=ziL3TT8YRJtXG7ZSy1fXNsoKKeKDWyKnDw8LMEVK1mE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RoDfoK9OH2W3n2nIiJzFsHrflMd2ILu8ULGzlXOlx7QkbWNgWGL+47igbVOmMe/8bSCfuF+tuQpAF7XTLANyq/IHIQF+dvtrRIXwPHEBG2SDMhwY3Ga2iT6wIYfQ9oxonNb7ZQLQFEsivlhfhO0EpZUAW/p5g9cWwQX4d/W8D70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SHmCrsOc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746643688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PvHRwpd0pbaGahvXVBlWGYIGRmCzKFQommZdKuMmiJI=;
	b=SHmCrsOc3WXrAjIIEvb31ZINSvXDL7KmFUl3gSeLqz6EMMZ9YqLp2TxLUY/71kugs/ythB
	acUmXuvzCvYTmPIVLPYVt6WQ1ZF9w/w+CYjhnCpA17Wgs511ZkwlDDYDyJOEUbI04W6jYm
	IN2XySokrK2AzlzSMjx+OLsxULPjUI0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-217-Jt1zQ_cmN16szkLLB0AImw-1; Wed,
 07 May 2025 14:48:04 -0400
X-MC-Unique: Jt1zQ_cmN16szkLLB0AImw-1
X-Mimecast-MFC-AGG-ID: Jt1zQ_cmN16szkLLB0AImw_1746643683
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 029D8180034A;
	Wed,  7 May 2025 18:48:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.33.122])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5A02730001A1;
	Wed,  7 May 2025 18:48:00 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 4/6] platform/x86: int3472: Remove unused sensor_config struct member
Date: Wed,  7 May 2025 20:47:35 +0200
Message-ID: <20250507184737.154747-5-hdegoede@redhat.com>
In-Reply-To: <20250507184737.154747-1-hdegoede@redhat.com>
References: <20250507184737.154747-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

sensor_config is not used anywhere and its struct int3472_sensor_config
type also is not declared anywhere, drop it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 include/linux/platform_data/x86/int3472.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index 89410f0cb73a..78276a11c48d 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -110,8 +110,6 @@ struct int3472_discrete_device {
 	struct acpi_device *sensor;
 	const char *sensor_name;
 
-	const struct int3472_sensor_config *sensor_config;
-
 	struct int3472_gpio_regulator regulators[INT3472_MAX_REGULATORS];
 
 	struct int3472_clock {
-- 
2.49.0


