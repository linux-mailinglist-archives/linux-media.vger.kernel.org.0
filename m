Return-Path: <linux-media+bounces-9370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 183028A4E68
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4976F1C2114B
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533AD6E615;
	Mon, 15 Apr 2024 12:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f1ID+OrC"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777196D1A7
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182591; cv=none; b=CIJI4ZZy3WOvbCi1O5XVdBEKXQEGubpEMRo91VrRFp7BLrbvLK4a3wlQ62Bp+JjAYSWPHxtypGkHX0yYHx895aeUifof/7T3YsvLby8RdJTxhXoqTkItZSji9RGyMEftUxsPo4OuszztnpPQHtSgMbOTYaZNCpSjtL3sjuzwm68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182591; c=relaxed/simple;
	bh=YKSNmJ9meTEoy9zIufeabQgPHINDjfXPuWfRNlPUiaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hgvFlQhOdg1lPjx7As7APoHM2ILXDEGXLl/uTuDLsH+9/IDC64WNrnhUr3DSiO41vGQpsoEjsy9az0ta8eNXla0yYLADDTDnE4iSBVq3VrfACL2GJ5sgq2Ssmmup0075Vml7KUfVFOAzBSyofQLeCcXWvxSUmsnyzovGzqCBA/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f1ID+OrC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A119hcBTOajWEhL+s5a5KfbuwpEfz7ZsTsceD7xkrwg=;
	b=f1ID+OrCBZqKPWzNSnTEHx2S9An21w1h14icu+8DnkwaWWxBgZZrhOQKavna8+KM3rPO4p
	lBXvaCPV0i9kPti0ZJtLqQkEahxbzRctX2RPhVclpR8vmzKVbDB6KCz8OwyxKqE72vieSa
	oGT1q1k0qltwIRWQgMbwlt9F57a//5U=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-574-FQNiPVqGOfG3HSbri9w91w-1; Mon,
 15 Apr 2024 08:03:07 -0400
X-MC-Unique: FQNiPVqGOfG3HSbri9w91w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64BA138143A2;
	Mon, 15 Apr 2024 12:03:07 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B94AC13FA2;
	Mon, 15 Apr 2024 12:03:06 +0000 (UTC)
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
Subject: [PATCH 23/23] media: atomisp: Remove setting of f->fmt.pix.priv from atomisp_set_fmt()
Date: Mon, 15 Apr 2024 14:02:20 +0200
Message-ID: <20240415120220.219480-24-hdegoede@redhat.com>
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

This value is not used by the driver, only returned to userspace and
userspace should not rely on / use the priv fields. Drop setting this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 2c95fd6505e0..4ecaded57b9a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4412,8 +4412,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	atomisp_fill_pix_format(&pipe->pix, f->fmt.pix.width, f->fmt.pix.height, format_bridge);
 
 	f->fmt.pix = pipe->pix;
-	f->fmt.pix.priv = PAGE_ALIGN(pipe->pix.width *
-				     pipe->pix.height * 2);
 
 	dev_dbg(isp->dev, "%s: %dx%d, image size: %d, %d bytes per line\n",
 		__func__,
-- 
2.44.0


