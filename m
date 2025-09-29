Return-Path: <linux-media+bounces-43334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C61BA8EBD
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 12:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 194C416C099
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 10:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC682FDC20;
	Mon, 29 Sep 2025 10:50:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E125025A359;
	Mon, 29 Sep 2025 10:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759143010; cv=none; b=Y5+rdjt3A6Qzl8Vcg7dZT11c2G+S/sI9dC31pOgRcY1IqbNSaUqLjlvubnoqwYbFtu0y6S7KNZvx3nCPLkpr8wuIHO1ZpemB7VwmhjSzbs3wDA7UmlrRLGkbtQ3byX7XiFyEzuTQQyl4uBjtDFxozgz8/5msC9fvXsUaLHpGUvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759143010; c=relaxed/simple;
	bh=thpCi9eI6eA/zP+F4b1N8neepiWC4jNt2iKzAF4kgrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M70PxXTZJVCx5hJbsfVolEWFHyJOcePDBXZ9PPhwD0NPRXZ20QoSq+Gz12W9LSRL4Ysx8bme7aayJexq4SyPz9lIzJxkAOYv1HGDblc9rBTHP382QNiEFMndV6KknFvqgKZF6/69bsoxrSaYbU1v+B5kCQMQ988bHOn6zeCywT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowADHaxVYZNpomLm9CA--.25636S2;
	Mon, 29 Sep 2025 18:50:02 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: linux-media@vger.kernel.org,
	Jani Nikula <jani.nikula@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH v2] media: cec: Fix debugfs leak on bus_register() failure
Date: Mon, 29 Sep 2025 18:47:15 +0800
Message-ID: <20250929104715.1493-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20250929025938.2120-1-vulab@iscas.ac.cn>
References: <20250929025938.2120-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:zQCowADHaxVYZNpomLm9CA--.25636S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur18ZFW8XryUGry5ur4Durg_yoWDKFX_K3
	4rZF97ur4Iqay3WanIvF1fZFy0vrZ5WF4fGFWftFy7J3ySgF4DXrsYvry3Zw1FkrZ2vFWU
	A34jvF43Ww13GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4xFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUcBMtUUU
	UU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCREAA2jaLf-LTAAAs8

In cec_devnode_init(), the debugfs directory created with=0D
debugfs_create_dir() is not removed if bus_register() fails.=0D
This leaves a stale "cec" entry in debugfs and prevents=0D
proper module reloading.=0D
=0D
Fix this by removing the debugfs directory in the error path.=0D
=0D
Fixes: a56960e8b406 ("[media] cec: add HDMI CEC framework (core)")=0D
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>=0D
=0D
---=0D
Changes in v2:=0D
  - Remove inline #ifdefs=0D
  - (Suggested by Jani Nikula)=0D
---=0D
 drivers/media/cec/core/cec-core.c | 3 +++=0D
 1 file changed, 1 insertions(+)=0D
=0D
diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec=
-core.c=0D
index e10bd588a586..c843b0d6cc2a 100644=0D
--- a/drivers/media/cec/core/cec-core.c=0D
+++ b/drivers/media/cec/core/cec-core.c=0D
@@ -421,6 +421,9 @@ static int __init cec_devnode_init(void)=0D
 =0D
 	ret =3D bus_register(&cec_bus_type);=0D
 	if (ret < 0) {=0D
+		debugfs_remove_recursive(top_cec_dir);=0D
 		unregister_chrdev_region(cec_dev_t, CEC_NUM_DEVICES);=0D
 		pr_warn("cec: bus_register failed\n");=0D
 		return -EIO;=0D
-- =0D
2.50.1.windows.1=0D
=0D


