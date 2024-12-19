Return-Path: <linux-media+bounces-23795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 026879F7CB1
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 14:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F41EF1892547
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 13:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC1A2253E2;
	Thu, 19 Dec 2024 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i0clzlV/"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECB6224AE3
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 13:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734616208; cv=none; b=kZ9jGIxka8o4zKaMuQiPw0Mv2VJ9IlGMdP1t/HgkAndJHegOKjTu/9FQTBF0ub6i6IsmPdf2PqhED8MSvgO3Ma0Qq0Feh3LLXaX0bBdTJ0/jCFZY850Goy28XvjHxsN9TiJq+xbOh+nF4hJTiOSSjEPDnXvh5SYrL7x8RRrQQI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734616208; c=relaxed/simple;
	bh=cKbZYuxocWcfHJxtpHEF79TfP1nZS2tLT7BDedmiM0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQhoEVJiekDlpIzykqduqs0y+0NHktDsmIDmGz+C+6xERJV/3GxJXEq9v+XbHAO5lIvRLA/OXs8RUlfrhe9df6wL3Aey/zKjmbvZI/gbkv0TPhRF3yydZUasdYkg6DpYL2yVVZgZXhRQH3Hnia1HWjte05uru2aGt/GVB0ZZZQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i0clzlV/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734616205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NkNup+eK0ow0PsI+wZGs/PEPe8hoG2SrzQGcdg5Ge0Y=;
	b=i0clzlV/zGVmWMKS8DIZPA+Iq1MgoVBUWJxiEDjmxScyLXqbX8lvQg1JmA7ZqP2o+ZRURk
	dHZQCe0hFRBHdnkzBRDhr2hxOG/uES7Yjb5MpR0kX783xRTDBc2dDiTVFpsqZ0JP/h1g49
	WoKZPYd/d32O6sfQ9wwkwbV1qUIy/6w=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-245-APSlTSgyNWebqmuxnwC8yQ-1; Thu,
 19 Dec 2024 08:50:02 -0500
X-MC-Unique: APSlTSgyNWebqmuxnwC8yQ-1
X-Mimecast-MFC-AGG-ID: APSlTSgyNWebqmuxnwC8yQ
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5E7331956096;
	Thu, 19 Dec 2024 13:50:01 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.60])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 86EAF1955F57;
	Thu, 19 Dec 2024 13:49:59 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 8/8] media: ov08x40: Add missing ov08x40_identify_module() call on stream-start
Date: Thu, 19 Dec 2024 14:49:40 +0100
Message-ID: <20241219134940.15472-9-hdegoede@redhat.com>
In-Reply-To: <20241219134940.15472-1-hdegoede@redhat.com>
References: <20241219134940.15472-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The driver might skip the ov08x40_identify_module() on probe() based on
the acpi_dev_state_d0() check done in probe().

If the ov08x40_identify_module() call is skipped on probe() it should
be done on the first stream start. Add the missing call.

Note ov08x40_identify_module() will only do something on its first call,
subsequent calls are no-ops.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov08x40.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 7fde422039cb..b6e69e0c2ecf 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1973,6 +1973,10 @@ static int ov08x40_set_stream(struct v4l2_subdev *sd, int enable)
 		if (ret < 0)
 			goto err_unlock;
 
+		ret = ov08x40_identify_module(ov08x);
+		if (ret)
+			goto err_rpm_put;
+
 		/*
 		 * Apply default & customized values
 		 * and then start streaming.
-- 
2.47.1


