Return-Path: <linux-media+bounces-26943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A14A43F9A
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 13:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B49FE18837C0
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 12:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1602686A8;
	Tue, 25 Feb 2025 12:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="ZGwN9TGX"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C057E3A1DB;
	Tue, 25 Feb 2025 12:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740487271; cv=pass; b=CSU0ZC1+hjJjflVHhHEuSYhpLVbchaPVmRmvIapgfAszbgI4fLgic6m+WbtXD1YgGQMumaXJ6T24REBQDmfu3tUtG3Hv+mA93Gl+vEprvgknBKH3fKIXO5PfNwYgYMYoh2f5rZLDRXkgXJnKJhrFCoDZ1psgfkJlzAvU0iTxzcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740487271; c=relaxed/simple;
	bh=AUEz4a3RiSL5/cLF/pQMmxgREDX4arxTDXKFwwi9EuA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PHnNxdXtTwAm3nnGvqN832Ij3H7ATQAQ6bi6kALLTsVB+uogAXGxlg+FD8r+eoAlhIiF8wy5QmuGvnTHAM1bHU042lm0TYZQgXfChlfdEsjlpCekuzHLLzGO8X1AQpI/Cosmv+xAHsYDVv2mD57DlSn9jQZjA0mircfK6Sx9ahY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=ZGwN9TGX; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740487242; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aL/yndbaWtbjDj26LcXfza+N/18ktplU4cYjzN8NJ6uso/gKOkg7hpxUkXtm6+TW9MNu5kPYtZS3bbCXt3JL4CNeyoFLWQ3JpwROIijZPuKQTJhjmoFqtgAiNv2codaijnCBQmPq50D771VEUONIigk/j9mq+D6pn+U2+eprEek=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740487242; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kDN54TSKQCXwGr0WnQvfL3hvKdHgbSFGpuQMUeaewhA=; 
	b=TpklSVtemRmlUXiIKkZorzpWgRCMGq+RAMxdZZAA0QYZZEhi5vRtiGs8qQaeyxjddrjUY2xxrv93BX/P2LhHpBypv+kwYaentedbx2oCq5D05O3pk8eXwian+77VYaGAILNuKfOl8VAF4e2ozi+gIa02jTJM/X8vDbiKp9yGBkM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740487242;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=kDN54TSKQCXwGr0WnQvfL3hvKdHgbSFGpuQMUeaewhA=;
	b=ZGwN9TGX/W+xjOAr4VQfD1lO+OtDQobGeGI+OUKCkythx6wVHbHLodDOuWutdUX0
	FCVJ6LFC/mFCXpvN5rQKvXcuzUSCPLuoq1nQr5/YcTCcVzPgArTYEHZZdRvdjPkV5k1
	iwjD1stQtv9UvpWqyTLObc3oA6pAT9iDUYj43eFU=
Received: by mx.zohomail.com with SMTPS id 1740487240110120.34947032551383;
	Tue, 25 Feb 2025 04:40:40 -0800 (PST)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: [PATCH] fixup! media: v4l2-common: Add helpers to calculate bytesperline and sizeimage
Date: Tue, 25 Feb 2025 13:40:08 +0100
Message-Id: <20250225124008.195405-1-sebastian.fricke@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
References: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

---
 drivers/media/v4l2-core/v4l2-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 07a999f75755..aa86b8c6aa75 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -360,7 +360,7 @@ static inline unsigned int v4l2_format_block_height(const struct v4l2_format_inf
 }
 
 static inline unsigned int v4l2_format_plane_stride(const struct v4l2_format_info *info, int plane,
-						   unsigned int width)
+						    unsigned int width)
 {
 	unsigned int hdiv = plane ? info->hdiv : 1;
 	unsigned int aligned_width =
-- 
2.25.1


