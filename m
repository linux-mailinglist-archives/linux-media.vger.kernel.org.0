Return-Path: <linux-media+bounces-21478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E34D9CFEA3
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 12:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFD84287579
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 11:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B401828FF;
	Sat, 16 Nov 2024 11:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VE+20moc"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2804D824BD
	for <linux-media@vger.kernel.org>; Sat, 16 Nov 2024 11:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731757149; cv=none; b=r1LL6Z0gRXa3xx1lkU5kjJufiY40nT2895Rfs0u+zvQL/AxvBNEG6hqdCXq4IuFISdYzsOZ6UanCPakixLzCZQ1k/l7q2j3kTOe06xuH/GqsvCb8K+Vxdnghcvb5sVHWYi3uXT606oNmIbZHEjtlOaypw4SjLV4F5AJabMu6pCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731757149; c=relaxed/simple;
	bh=yBHslrnEfRP2s2P0mPneLaO/5MFhk+dhk9lC4YfkF+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ddyidwhXac7j3pWxNp9Jp2XOFOqElajPIFZHiROhpp57pp5JDPO47hyLrfxex7GEPPvcyfQ6xrGbCF+cbvrtBqYdc541pszL/uh7mQdOHB1kmNIz3PG9kjXsi7L/NAxqRC50qjeI038uao5iPz6cj43mVeRh9gFYp201dysFtaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VE+20moc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731757146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tnwDhC+ZHVarlXuaoTggByu3Nlayj3PtEbiIfrXN8g0=;
	b=VE+20mocLERIMxiBt6tXHJ8DWhDuEfWAanhUKI/eARfA/BiFisZPFQM0IFBbLxNHUyZk96
	IK35XQobJzy4eQ8eiQumO1ZvXX6EhgUuCkMxpvjy7Hix6PD0ulHHN4K2+dOX3M4GdcS0UM
	eNLrtXeHANXZBW8j7bxpdT2+va39TvM=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-444-6TyJsSRDMGO6z5fYLdtcWw-1; Sat,
 16 Nov 2024 06:39:00 -0500
X-MC-Unique: 6TyJsSRDMGO6z5fYLdtcWw-1
X-Mimecast-MFC-AGG-ID: 6TyJsSRDMGO6z5fYLdtcWw
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B5DB619541A0;
	Sat, 16 Nov 2024 11:38:58 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.52])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C41671956089;
	Sat, 16 Nov 2024 11:38:56 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-media@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add Hans de Goede as USB VIDEO CLASS co-maintainer
Date: Sat, 16 Nov 2024 12:38:55 +0100
Message-ID: <20241116113855.50976-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Add myself as co-maintainer for the UVC driver.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 91d0609db61b..1da403e89159 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24063,6 +24063,7 @@ F:	drivers/usb/host/uhci*
 
 USB VIDEO CLASS
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+M:	Hans de Goede <hdegoede@redhat.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	http://www.ideasonboard.org/uvc/
-- 
2.47.0


