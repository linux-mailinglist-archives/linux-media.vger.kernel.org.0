Return-Path: <linux-media+bounces-14494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6221A91ED2A
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 04:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 239BF2845A3
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 02:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74F417741;
	Tue,  2 Jul 2024 02:57:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3E4A23;
	Tue,  2 Jul 2024 02:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719889078; cv=none; b=RzKtZghR/5Ty7vGImG/KY0+8PbO39crY35NYyeLwCv5Atv1yVOvw0IodJaEtvEREHXqFors5XYaJ8ezy7azhPQaEj3HwnH+zdtQm28OZs7BjtFNxWPK5ngddwdAFooZ1v7qkBsfi8A2TE8N6fzHBevFucRubGwoB8IhP1KoUazI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719889078; c=relaxed/simple;
	bh=Lq2JPw5gQzhsl5eNueEUR6Xw5v9KGxCiQOxnv7s0TAg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FNuKqVbJZED7NwF+vlEircGSXIkhPisuIcS+dRzenCb+NLdVlmfmOT7ZP5n9apdwFVRsHxGGF35wHEsodNcMDfbnK8KAeMkpZTdljX8J7I0TQ1kQkq7zO4JrX3lTBVSn6SLu925zPcz/FBq3jagvZkVnYmvP4v2gjeL+cOLkpvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowABXX3esbINm7liXEw--.36260S2;
	Tue, 02 Jul 2024 10:57:49 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: laurent.pinchart@ideasonboard.com,
	paul.elder@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] media: i2c: thp7312: Convert comma to semicolon
Date: Tue,  2 Jul 2024 10:57:11 +0800
Message-Id: <20240702025711.1411715-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABXX3esbINm7liXEw--.36260S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw4UZF15Zr47Gryktr15XFb_yoW3GrXEkr
	13XrW2gr1DtF1ak3W5J3WrCr9FkFWkuwn3uF1FyrZ5Gay3X3WUZr1DuwnrZayDXF15K3W5
	Jr98WF1UCwnrKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbckFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
	JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUatC7UUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Replace a comma between expression statements by a semicolon.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/media/i2c/thp7312.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
index 19bd923a7315..75225ff5eff6 100644
--- a/drivers/media/i2c/thp7312.c
+++ b/drivers/media/i2c/thp7312.c
@@ -1503,7 +1503,7 @@ static int __thp7312_flash_reg_read(struct thp7312_device *thp7312,
 
 	msgs[0].addr = client->addr;
 	msgs[0].flags = 0;
-	msgs[0].len = sizeof(thp7312_cmd_read_reg),
+	msgs[0].len = sizeof(thp7312_cmd_read_reg);
 	msgs[0].buf = (u8 *)thp7312_cmd_read_reg;
 
 	msgs[1].addr = client->addr;
-- 
2.25.1


