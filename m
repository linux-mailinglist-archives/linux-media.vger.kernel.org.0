Return-Path: <linux-media+bounces-32663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F45ABA9CA
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 162903AF7A7
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E8E1F4629;
	Sat, 17 May 2025 11:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="THBH3mGa"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F9A1F8755
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482106; cv=none; b=rfjBUPygbeoXkkqEh4re2MPgaAbJTHf0SJttA2+jU6soCKdX4wdbUvkW3X+l4ECGB/1VQWVtdJvS61Kir4SHa59rF9Im3R8BV5gG1kQ1BiZ2G2Hh3UTFDbdOElGLphA8EKQRvvMT2IdF4DiJ535UlBXeOgyZCHYTpFf5/ZSD1Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482106; c=relaxed/simple;
	bh=kPgg7eaRlADTXBeEj4UG/eDKO+eMbJrVB1gnP0RMt18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KsWRXhjlov9c6c+wWTBHOLWNf+ihYTFrl9TtgJcWQlB9oAhpEnPlZf6oFFCkRU86gOoRcPyQ8Rhi6EosWB8+MkdsrVN8YVpunvJ5XuIY58ne0T3v4GO3Y6DBFntrg79NONqlz9O/OHF+qDQHE2jjGiTDw9O3zeNFY/Dw4kax7XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=THBH3mGa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LcE1b5mbpZvFvraLqanoAPLCCe37suWF8oFa4XfGpcc=;
	b=THBH3mGatfrAfy5NKBwLRcvU7tqkSrODNBv/H12/d1GqBEi1C0hpp8UqgMyqU7F+932B0g
	TQ/8BtYd6hdVINw6Z5nCGNuN+1Q+RP/kuR0JZz3qQZCfgTXKjzs3T+LlZJ8X20OWoc5rnN
	8FNO6Lhhe73eM0VMV/UTSkEt2ZaL9yE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-385-f103rmV5N6Sht63Z7KtdfQ-1; Sat,
 17 May 2025 07:41:42 -0400
X-MC-Unique: f103rmV5N6Sht63Z7KtdfQ-1
X-Mimecast-MFC-AGG-ID: f103rmV5N6Sht63Z7KtdfQ_1747482101
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BAB2E1956086;
	Sat, 17 May 2025 11:41:41 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0EEB4180045B;
	Sat, 17 May 2025 11:41:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 05/23] media: atomisp: gc0310: Use V4L2_CID_ANALOGUE_GAIN for gain control
Date: Sat, 17 May 2025 13:40:48 +0200
Message-ID: <20250517114106.43494-6-hdegoede@redhat.com>
In-Reply-To: <20250517114106.43494-1-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Use V4L2_CID_ANALOGUE_GAIN for gain control, as expected by userspace.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index ee039f3be4da..756e56f639b7 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -289,7 +289,7 @@ static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(sensor->regmap, GC0310_AEC_PK_EXPO_REG,
 				ctrl->val, NULL);
 		break;
-	case V4L2_CID_GAIN:
+	case V4L2_CID_ANALOGUE_GAIN:
 		ret = gc0310_gain_set(sensor, ctrl->val);
 		break;
 	default:
@@ -533,7 +533,7 @@ static int gc0310_init_controls(struct gc0310_device *sensor)
 
 	/* 32 steps at base gain 1 + 64 half steps at base gain 2 */
 	sensor->ctrls.gain =
-		v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_GAIN, 0, 95, 1, 31);
+		v4l2_ctrl_new_std(hdl, &ctrl_ops, V4L2_CID_ANALOGUE_GAIN, 0, 95, 1, 31);
 
 	return hdl->error;
 }
-- 
2.49.0


