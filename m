Return-Path: <linux-media+bounces-31655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 650C9AA828F
	for <lists+linux-media@lfdr.de>; Sat,  3 May 2025 22:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EFD3164774
	for <lists+linux-media@lfdr.de>; Sat,  3 May 2025 20:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D8627F4CC;
	Sat,  3 May 2025 20:01:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC9327E7E4;
	Sat,  3 May 2025 20:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746302495; cv=pass; b=o4WyWDnCFWilbl9/NY9eSt1BwplycWA09l07PHZGs5yf8mv2FMX1iUNkoohf4wFjC1WnmlsZRxzhytSYzKW5sSOUZ25+nq+GoRG3hB0USeuqoj/r+gd8/XT98hc/zQKLFTEX/pVd5/g02RYB3FRQbkqcNx8pkswi0/qqFP8Prds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746302495; c=relaxed/simple;
	bh=yg3cKO+FNhzvb7iusX0rv9HVvAb2iqpoXLtlIZBc33Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MQV7dAL65ALgOMtwDJxDD9S9IhUHZHf7xGKo5Sg3MasS57Hk5jlZXC7eQECG4rOR6fm9J/hJoKzWbspRtFzg8GYEC3VFycQcILgCpw10orCfso29eOnKStd1tsy99qglnGrJCp5CvD8DGeMu5oikpZjvwlvyvnFtlbylC6EDd+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pablo.ct.ws; spf=pass smtp.mailfrom=pablo.ct.ws; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pablo.ct.ws
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pablo.ct.ws
ARC-Seal: i=1; a=rsa-sha256; t=1746302453; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BkS0QhaC+/H2iODRTl4XHkGQpj/UfEhhueUWKXZ0TknakQBCimmfehejBqeJjjCVfZ7SrwrwOjrAF0GGPAWzWRJ8inIkx5msrnUs2Rd0QFqt56Y2S2/hM5rKln6oTSFH8QX+ZfVIxQiEl91SGYOZxPS0NyCwxzr1yv7LlhGJEO4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746302453; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/ekhqu4U2vEuZl1TA3R6FVmJfh3zffTqbt5hhe2+IiI=; 
	b=iBYQFxbBvWKeJ7A7pAgVZT4lKeTXzZAzEL+gzXBdWZQ3eecXH4Ut6CJxqE5CN6HJqbl4qGZgDWcb5F2Zs48i1MTYIPo11KwbxgOuNfJD/G+RAFWIgzQ405b8p8ewwYaINMrENXhtg3VNfew7la9qHAqMGGWk7doppBVTiyvKNZM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	spf=pass  smtp.mailfrom=pablo@pablo.ct.ws;
	dmarc=pass header.from=<pablo@pablo.ct.ws>
Received: by mx.zohomail.com with SMTPS id 1746302449821514.9158028836918;
	Sat, 3 May 2025 13:00:49 -0700 (PDT)
From: Pablo <pablo@pablo.ct.ws>
To: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	pablolucas890@gmail.com,
	Pablo <pablo@pablo.ct.ws>
Subject: [PATCH] staging: media: atomisp: fix coding style
Date: Sat,  3 May 2025 17:00:30 -0300
Message-Id: <20250503200030.5982-1-pablo@pablo.ct.ws>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Fix a coding style:
"ERROR: that open brace { should be on the previous line"
issue reported in ia_css_vf.host.c:94.

Signed-off-by: Pablo <pablo@pablo.ct.ws>
---
 Hey, this is my first patch, I apreciate any feedback, thanks!
 .../media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index ece5e3da3..0ce75d9bd 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -91,8 +91,7 @@ configure_kernel(
 	unsigned int vf_log_ds = 0;
 
 	/* First compute value */
-	if (vf_info)
-	{
+	if (vf_info) {
 		err = sh_css_vf_downscale_log2(out_info, vf_info, &vf_log_ds);
 		if (err)
 			return err;
-- 
2.34.1


