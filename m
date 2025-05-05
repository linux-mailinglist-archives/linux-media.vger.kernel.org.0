Return-Path: <linux-media+bounces-31734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB05AA9DAF
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86214189DF96
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 21:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2D5270ED5;
	Mon,  5 May 2025 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QrhlhR1T"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF5B1E1DE9
	for <linux-media@vger.kernel.org>; Mon,  5 May 2025 21:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746478832; cv=none; b=FBKzxRrR78qypZST+91NKsMHoD361+VmjeyszAVUkM2awADjVUbamwZ2oA0LOawj0epr2F/OjQIlb08/r2Jpbqj+LAjk/1MWq3QnnRPmrgtnfNB8bCEjaygMA5q3NA4CeQ2nANWCASyP2jfqG6mKlUeQBP1EJHTjDuU/K9vAa/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746478832; c=relaxed/simple;
	bh=aEuhy3v6oZ0MceYC8GV0JEqcyC7G1DVc/5x00mxXsFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pAILwdwXLGYcFhiAWLIibJnmK84LCKfwJwvlpvOPfpCjm0+2SZp+Vpefz4+0Wtz+TKJLc5gI6YGuMDsc2IwTELRsy0cs6GphJTNL07qJuCE/jthTCpeOn8wZXaOOHJtDByuEGH2ZoUejW14exWueQx1/WuWQXMSGx1yDpQ8XdU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QrhlhR1T; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746478829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oURZoWuWwxiZg4jzVr8Dn/WOvd4L+qeeu3HdbNZH4ro=;
	b=QrhlhR1T3M48rOM2NjPeh283uUmGg5WB3R7M0w8+diPtD+uc79EdGBELg2edOmc8HX6nD8
	1MadoYCJHsjTTnggwcrZU50UuTehYvM1hPAGGvMAOC9o5tAfHmdjERcxPTf2uTqymP5fQr
	xpfOEpCeHggDxhx9ClZkrbFO0VMFyvU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-446-TT-wZ3HWPEqqGfGnXztzzg-1; Mon,
 05 May 2025 17:00:26 -0400
X-MC-Unique: TT-wZ3HWPEqqGfGnXztzzg-1
X-Mimecast-MFC-AGG-ID: TT-wZ3HWPEqqGfGnXztzzg_1746478825
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F0ADC1800873;
	Mon,  5 May 2025 21:00:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.45.224.24])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B6577195608D;
	Mon,  5 May 2025 21:00:22 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 3/5] media: atomisp: Stop pipeline on atomisp_css_start() failure
Date: Mon,  5 May 2025 23:00:06 +0200
Message-ID: <20250505210008.152659-4-hdegoede@redhat.com>
In-Reply-To: <20250505210008.152659-1-hdegoede@redhat.com>
References: <20250505210008.152659-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

atomisp_start_streaming() starts the media pipeline before calling
atomisp_css_start(). On atomisp_css_start() failures stop the pipeline
before returning the error.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 491af67cc7a8..fecba2588e38 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -982,6 +982,7 @@ int atomisp_start_streaming(struct vb2_queue *vq, unsigned int count)
 	ret = atomisp_css_start(asd);
 	if (ret) {
 		atomisp_flush_video_pipe(pipe, VB2_BUF_STATE_QUEUED, true);
+		media_pipeline_stop(&asd->video_out.vdev.entity.pads[0]);
 		goto out_unlock;
 	}
 
-- 
2.49.0


