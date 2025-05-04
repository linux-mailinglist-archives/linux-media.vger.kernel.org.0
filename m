Return-Path: <linux-media+bounces-31661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E1CAA85D2
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 12:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D56823BCA14
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 10:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306B01A0BF3;
	Sun,  4 May 2025 10:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WAwupPQ1"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CECCC13D
	for <linux-media@vger.kernel.org>; Sun,  4 May 2025 10:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746353631; cv=none; b=HDni8RdGZ7C4Fxe1ufA3nJ2fA7NGpvtRuLQGWU2gyP5YcXx0KsWXgUsnUhzGNur1l3ZmRhGkSzbVw1SsP62xazzncTOp4ds4hUkmILcz+7XqGzw0qg6VvAl8krlorr76LtU9Pcdvi63D0Q0fUTpFmNdqowioRZN13Lx2JVLHIi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746353631; c=relaxed/simple;
	bh=jv17ZYz7IrK/fApVvjgBpU0JPsMzu+0pNo8M/UzL7Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9PLkEvvQA8HpNVhZ/Q9c3Kvx3r2n88UMOCi1fEMgg1oSQ85AxS8n4xCeLsoQt8ukTJLwVbbDktzufzCZqd5XIdNy0hxQ7tmPBv6ByhKssrGgOMr2O0nLXqPQe1MzdE8PiHVRLJZ/po9sXbQz+UPO+dnQhnGb4kOgZKWsC5A2ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WAwupPQ1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746353628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VcpHUyQe9AINFaN6dME+1GRwrxNJVEymJ7cGNL3kCrE=;
	b=WAwupPQ1xP1WY9KatKVjZGIxDgQbOAGRLggjjwHRLyjmlcf/5916BuRgk8XoYYV8o/aYlc
	eUsX+PWhw3DVXpB17QtA8VXx83BHZ3xCB/HE+FSPSh5esk3t2WBqnmMFFOIVxT1KR8P3h3
	soLJxdgK8zpeV5f78vkIjaI889/4GnA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-205-c9HaIJrcMBCLKiiPjQStvg-1; Sun,
 04 May 2025 06:13:44 -0400
X-MC-Unique: c9HaIJrcMBCLKiiPjQStvg-1
X-Mimecast-MFC-AGG-ID: c9HaIJrcMBCLKiiPjQStvg_1746353623
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2E6D01800370;
	Sun,  4 May 2025 10:13:43 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.28])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DC0C418001D5;
	Sun,  4 May 2025 10:13:40 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 01/13] media: aptina-pll: Debug log p1 min and max values
Date: Sun,  4 May 2025 12:13:22 +0200
Message-ID: <20250504101336.18748-2-hdegoede@redhat.com>
In-Reply-To: <20250504101336.18748-1-hdegoede@redhat.com>
References: <20250504101336.18748-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Make aptina_pll_calculate() debug log the calculated p1 min and max values,
this makes it easier to see how the m, n and p1 values were chosen.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/aptina-pll.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/aptina-pll.c b/drivers/media/i2c/aptina-pll.c
index b1f89bbf9d47..cd2ed4583c97 100644
--- a/drivers/media/i2c/aptina-pll.c
+++ b/drivers/media/i2c/aptina-pll.c
@@ -129,6 +129,8 @@ int aptina_pll_calculate(struct device *dev,
 	p1_max = min(limits->p1_max, limits->out_clock_max * div /
 		     (pll->ext_clock * pll->m));
 
+	dev_dbg(dev, "pll: p1 min %u max %u\n", p1_min, p1_max);
+
 	for (p1 = p1_max & ~1; p1 >= p1_min; p1 -= 2) {
 		unsigned int mf_inc = p1 / gcd(div, p1);
 		unsigned int mf_high;
-- 
2.49.0


