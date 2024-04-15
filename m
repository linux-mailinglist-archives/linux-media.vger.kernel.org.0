Return-Path: <linux-media+bounces-9360-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE748A4E5E
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 516911C20EDF
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CB46CDBD;
	Mon, 15 Apr 2024 12:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eFEQ6zad"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C67B6996E
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182575; cv=none; b=A04wSsAQTN1Qg5ltqdFwN63j4nYu1AtOYAXek6uOgD6U3Wz+prJg4boRVw+sdZKgE8VG1RLZdgcedpeYCqBRdJYtvEjaqNmngmLdgIzDW8zTypX8B8zidlAfJgXcCuYXmH1zvglebvlnX3l1s9FfHb/1Ty16jXqIIjZXwcClMkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182575; c=relaxed/simple;
	bh=Ylz6rzQsgY/smEeOjGzzC4QgItrBXNo3xi5lbtRO3wE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G/s5CUnfXmVgkljsgVR+lZGyUXpKfMD3G0QuCNtu90sxqBQa0pwRevlw40kr9bgXUr7X9gJW459/LyrI7hjKb3vxNS0jyCv3WEPFGYS+eE/nmh/l3hC7mmBQrR7K+1Mq+PAMKIGkR9wxJ7wN2HaJ11dCOJUZLorll3oN7klsATk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eFEQ6zad; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ynX0DGXz84eH72mur6sdT5zYy1ByXKBp3wkUemoSC/8=;
	b=eFEQ6zad6K6ZA21AoOm4zXTmu1d+sMqnCDvKnAdxcYBjcoBKcyR9NfBGAGoPZyzglklXxb
	LwexY/wxJWI7wHZddXeh7FalW5aI19JnpT6yA71s9h5V6wz6hhr/J2gARegQMCQXHeb2o0
	aMt5QjEGLEdw9cO8NRzC0HILH01PjJg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-168-pw2uRze3Pee3v1fMGDJvrA-1; Mon,
 15 Apr 2024 08:02:52 -0400
X-MC-Unique: pw2uRze3Pee3v1fMGDJvrA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 950F33C0252A;
	Mon, 15 Apr 2024 12:02:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5AA5CC15771;
	Mon, 15 Apr 2024 12:02:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 12/23] media: atomisp: Remove input_port_ID_t
Date: Mon, 15 Apr 2024 14:02:09 +0200
Message-ID: <20240415120220.219480-13-hdegoede@redhat.com>
In-Reply-To: <20240415120220.219480-1-hdegoede@redhat.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Change the single, unexpected user of CSI_PORT0_ID

	for (port = CSI_PORT0_ID; port < N_CSI_PORTS; port++)

to

	for (port = 0; port < N_CSI_PORTS; port++) {

matching all the other for-loops iterating over the ports in
the same file.

And remove the now fully unused input_port_ID_t enum type.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c   |  2 +-
 drivers/staging/media/atomisp/pci/system_global.h | 12 ------------
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 6e11fd771938..80f0395cc560 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -489,7 +489,7 @@ free_mipi_frames(struct ia_css_pipe *pipe)
 		}
 	} else { /* pipe ==NULL */
 		/* AM TEMP: free-ing all mipi buffers just like a legacy code. */
-		for (port = CSI_PORT0_ID; port < N_CSI_PORTS; port++) {
+		for (port = 0; port < N_CSI_PORTS; port++) {
 			unsigned int i;
 
 			for (i = 0; i < my_css.num_mipi_frames[port]; i++) {
diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index 060b924023ec..e8a29f73d67a 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -201,18 +201,6 @@ enum mipi_port_id {
 
 #define	N_RX_CHANNEL_ID		4
 
-/* Generic port enumeration with an internal port type ID */
-typedef enum {
-	CSI_PORT0_ID = 0,
-	CSI_PORT1_ID,
-	CSI_PORT2_ID,
-	TPG_PORT0_ID,
-	PRBS_PORT0_ID,
-	FIFO_PORT0_ID,
-	MEMORY_PORT0_ID,
-	N_INPUT_PORT_ID
-} input_port_ID_t;
-
 typedef enum {
 	CAPTURE_UNIT0_ID = 0,
 	CAPTURE_UNIT1_ID,
-- 
2.44.0


