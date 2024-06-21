Return-Path: <linux-media+bounces-13878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 997D4911820
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 03:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A5501C2152C
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 01:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4AC8287E;
	Fri, 21 Jun 2024 01:42:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9502F2F;
	Fri, 21 Jun 2024 01:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718934164; cv=none; b=HulN/HZrdI/TGsP3SzEC5SY9jDmyjHntBO2hXpQcBx87FTsR/qUKHi6yGuFx0i20DRKcsuvOmp1YZjgdDgxhaaGFE1KYpNnURuUwT+yTPqiX6pXSjoWQ/c8nCMpagTFsYJIczojn7tXzilryaNdi7gSE1FaO7xkqziRIM8h/ww0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718934164; c=relaxed/simple;
	bh=DZEVQTJMhVQBoUZ4+jSBDdNj0mLZGNkY2CZLSefgrho=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ENmxv/2GtP3IF9mWAUg9gWNPFiqqlFKJvWy1v3KLcMG0tJbDZT1ye2gywoYwxmUxCXL+4Jilpi4o7EQPnKIdXp2VxH4l92T+LwCEq4imvYhF10sopnyX6qWSjkZ7N9W4EHBJXBlvKJRsHmZlpjLFyPYNvSeSrZDqI+/rn3G45ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowAD355g72XRmjgneCw--.1501S2;
	Fri, 21 Jun 2024 09:37:00 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: rfoss@kernel.org,
	todor.too@gmail.com,
	bryan.odonoghue@linaro.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] media: qcom: camss: Add check for v4l2_fwnode_endpoint_parse
Date: Fri, 21 Jun 2024 09:35:22 +0800
Message-Id: <20240621013522.1704762-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAD355g72XRmjgneCw--.1501S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFy3KrWfZw4UurW3uryfJFb_yoWDGFX_GF
	W8ZFZ3WFy8Gr1kGr4jy34SkryUt3ykuF109F4aqFy3ta1DCas7JrWvvr1DXryxuFyqvF1D
	G34qvr9xC3srCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbc8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVWk
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUOMKZDUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Add check for the return value of v4l2_fwnode_endpoint_parse() and
return the error if it fails in order to catch the error.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/media/platform/qcom/camss/camss.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1923615f0eea..c90a28fa8891 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1406,8 +1406,11 @@ static int camss_of_parse_endpoint_node(struct device *dev,
 	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
 	struct v4l2_fwnode_endpoint vep = { { 0 } };
 	unsigned int i;
+	int ret;
 
-	v4l2_fwnode_endpoint_parse(of_fwnode_handle(node), &vep);
+	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(node), &vep);
+	if (ret)
+		return ret;
 
 	csd->interface.csiphy_id = vep.base.port;
 
-- 
2.25.1


