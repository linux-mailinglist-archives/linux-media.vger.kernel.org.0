Return-Path: <linux-media+bounces-19127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF259916B2
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 14:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B60DB22C5D
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 12:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9988313D276;
	Sat,  5 Oct 2024 12:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gdNMJzV8"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A064F9FE
	for <linux-media@vger.kernel.org>; Sat,  5 Oct 2024 12:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728130549; cv=none; b=O0h9nkhBYGuzO0ViPhtZI0HlUnl6EOD9x0sLlWgQRaUf2TCdIMYdrLS3DLZNyfTxJg2ErKGW/b0GlbtWYtP7EQcpjcWhCEa572YcJcO2VM+S9toZEoG2c5ldMpKRki4c9Jd9j3S+s8yLzn64bj7p+Z6u3SqrtktUyn88iLr9BO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728130549; c=relaxed/simple;
	bh=55xKlebQmAQD9O5DwwakVls8b6FB0PCpWVNge4qv2QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M5hb8L+mtbWPSENLrgJpWYN5Tt0vekCrjaBfauNkgCZjA/VtBr3NTby0bW44zC2R/gL0w3o3IIqSrmlMhi//btm6Qc8qAFQT1efm1IvmV+jK6ZlNYXJD6xyi9jLzOsbkCBZWRXfXQboeLgZkxN3gboymcskjtbvg9t978I6rOe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gdNMJzV8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728130546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GuSgnSZKSa9itvSE8UBeDCFnA0Ej89e3fgSNkR5Nw20=;
	b=gdNMJzV8jvYbGDgZTJU+31Xioqt/pbyDEnjxXLcxt7qJXrwa3hCwcId5nuIpor95qqp+da
	bwDIqcL6v2oEAKFDvxx9qaqMSbDg6zGF20WTtNhAwHimezRPtQolnrC6bRgrggtGheVQJZ
	RDNnU1kPWE2HWysJHEdRBAnrGD8ySj4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-594-It8sPO5fMk20X3XQE-AnNw-1; Sat,
 05 Oct 2024 08:15:41 -0400
X-MC-Unique: It8sPO5fMk20X3XQE-AnNw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 39DEB1954B07;
	Sat,  5 Oct 2024 12:15:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.19])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6E4F819560A3;
	Sat,  5 Oct 2024 12:15:38 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 4/4] media: ipu-bridge: Improve error logging when waiting for IVSC to become ready
Date: Sat,  5 Oct 2024 14:15:25 +0200
Message-ID: <20241005121525.32172-4-hdegoede@redhat.com>
In-Reply-To: <20241005121525.32172-1-hdegoede@redhat.com>
References: <20241005121525.32172-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The ipu-bridge code waits for the IVSC to become ready (on platforms with
an IVSC chip).

It does this by returning -EPROBE_DEFER, but it does not use
dev_err_probe() so no reason for deferring gets registered.

After 30 seconds the kernel logs a warning that the probe is still
deferred, which looks like this:

[   33.951709] pci 0000:00:14.3: deferred probe pending: (reason unknown)

Use dev_err_probe() when returning -EPROBE_DEFER to register the probe
deferral reason changing the error to:

deferred probe pending: waiting for IVSC to become ready

to help with debugging why drivers are not binding if the iVSC does
not become ready for some reason.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index e407c69bfcdc..35088601ed20 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -830,7 +830,8 @@ int ipu_bridge_init(struct device *dev,
 		return 0;
 
 	if (!ipu_bridge_ivsc_is_ready())
-		return -EPROBE_DEFER;
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for IVSC to become ready\n");
 
 	bridge = kzalloc(sizeof(*bridge), GFP_KERNEL);
 	if (!bridge)
-- 
2.46.2


