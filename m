Return-Path: <linux-media+bounces-59541-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBfeHJak62nIPgAAu9opvQ
	(envelope-from <linux-media+bounces-59541-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 19:12:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D98461AE3
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 19:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F50A3143696
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 16:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7823C3EF646;
	Fri, 24 Apr 2026 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HcKRubrl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE6D3E639E
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 16:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777049564; cv=none; b=DDT0Mzi/WSFkxkHi1Yjx8NR5tjZAnYjLLMLTJtE9wRL8swcor95ybDPoLJoBWoRxqZpyWPvlx8YT1uJjlATj81fffRAUoRPEZ7QJOm4SYVb5FFNwVsUORL1RawHhctceI2OfCvz6BrkFrm3Gh0egcR0uImx5EtGJ8jtSy7dswLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777049564; c=relaxed/simple;
	bh=gOq1TfW+S0UWD7Z2KXCott8iD54/eMJygLK8vcCtgp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V0+UHZO6G3sm6jU/YGsuZyL/KQ6uP8rcpfq39SlAyrCNYq+Hj5w769ou57YdILIRiOxBHy5tNjfkJEdSGCIZcxRV1JxQjoGNIOAvmSRjgO0ia+A5B7lLTGoUUxgbw54FhDVP8sP7x9vl4H52qdpRhwZrdczdHf9P4lYRrnm+2iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HcKRubrl; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b788a98557so33245155ad.2
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 09:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777049563; x=1777654363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N8m0d9jgffml56tOWD/yiI/9bSBwutf977iNuQiC6e8=;
        b=HcKRubrlSQ7PC7nzavVHXfghnZn1C/YbRWO8DaN/buFU0/PAZlWqoCPt4bwMxyGUO2
         9iD/RZRQxp3RJHoOANXZwI59iWzuEiw+/BFnIszwjpIEMqyTdGk6OevIcJz89/4JfH2Q
         9DBRXDbzlC9tJtYVlHy0bXsIRIn57vAwXy3OoJQZrdU8jtinjThtTbk5rFg22hNBE/3P
         SPJMWM5lcMxRn1TvFcxlLjlJksKlwVIi7gaQCeBrGqjoqtMzQICr/pH6EIFL6+MJ1zBh
         GM/jYOsjoYR2WxhOHZ3dJywHrupQAoW3GPCXlpSUg5xoJGt/LewTx5Dhh6uLAAkwkVQQ
         Sapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777049563; x=1777654363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8m0d9jgffml56tOWD/yiI/9bSBwutf977iNuQiC6e8=;
        b=n4PeVeCyiPudiNyQapLCbTNdy/RKDpLl5vhb5JWgBBmU4AKoWnk1KBxwMt/OJfH5Em
         ucVrUUJKx6b9Muw1ToXTvKpVZkULN1ZaLK/JyWtWY1fweHbJIYoDFh/71maHlV+d9hlj
         DZ7GYy4ZIS0ih3mhpwviQfFhvJmaDVV51CaHD+V8ghykrE0MtB2JuvGAluoneIJZZIJO
         4fuoFABhPlehvM3miEZAKjCsNuyX+tQ+qR8xM5kZy+tbmNFWqpLm5lN2BPt4kjyHilk5
         E/9D7hYsIWQwH2qBqTR8+PGQq/WjblDycjyyF0KBMHZVmOK+HKgnjgtGE8OlCfphavV2
         flSA==
X-Forwarded-Encrypted: i=1; AFNElJ9gkxD1vChGFjW3EaLIBKzUaZ7UC2LkZ2tPGZh/YkEM+x9cpuZAKatf0hoOO6sZ6byWOjxA0PtcqS3Cdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/42R4qo5HNLF469vxibL2XzbFQyDy5rHBDJvRtFffnPgYH70p
	kkUFnXLyYoAzUuqk2g5PFFgXI6e2vAuDHnbh5nlwF1FUYULoch4pYFA=
X-Gm-Gg: AeBDietS8ebPHW/yqzbMRAINiVWw91Z2J4pPvIsIFcCGruVtAIObxvTtC2308BGWgGK
	guEH0q3EYpH4bhlgppj+tKbYMW8LP73/0TBxPCAfQgq0xnjT0TGwCouz6l5Q6TGuUGZlcPxzgIg
	gI0Zv8r0MVqWe46Tk3/7XSwZRyD5JxTqedOpwFNf0MSjfGeBzR0H+lbR7l6zXnJM8Hka116Pv2z
	8ZqmJjIuXlEiik9ZhkLvEpqm8/hqS3KdUnGqMgfHBrwSzTEk73qrPSsGEtXEN4ZB/xDJJ3qcEDC
	AcpOep+Dq+ZgHGGudI9Q5bW+CVCt1KRLpPmI/44v5ArljzSx9nMG3yXRMOyqQ/e8L7bSu5v+Y2J
	PEjmJaLOCCtf9Huw22GkuIgzyCYTCxmY8ejIiwdiouhhCev9WG5kGBlPFHahvF8/nygQdJqRbgP
	7bwb5M76o3PX2UFNNoO1Q4g7ErGkoSkAQnGG0nFTN2WaU6AMNFnCEH5F8XgVTao6PVTNDbI08Do
	mWUV3JQ1g==
X-Received: by 2002:a17:902:f98e:b0:2b2:481b:de5f with SMTP id d9443c01a7336-2b5f9e86057mr239985835ad.5.1777049562978;
        Fri, 24 Apr 2026 09:52:42 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab30f29sm229362825ad.68.2026.04.24.09.52.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 24 Apr 2026 09:52:42 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] media: i2c: vd56g3: clean up subdev state on probe failure
Date: Sat, 25 Apr 2026 01:52:10 +0900
Message-ID: <20260424165238.31333-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D3D98461AE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59541-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhun512@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]

vd56g3_subdev_init() calls v4l2_subdev_init_finalize(), which allocates
the subdev active state and requires v4l2_subdev_cleanup() to release it.

If vd56g3_update_controls() fails after finalize succeeds, the probe error
path currently skips v4l2_subdev_cleanup() and returns an error. The driver
.remove() callback is not called after a failed probe, so the active state
is leaked.

Route this error through a subdev cleanup label before freeing the control
handler and media entity.

Fixes: 87aa97fc3157 ("media: i2c: Add driver for ST VD56G3 camera sensor")
Cc: stable@vger.kernel.org
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Use a lowercase subject summary.

 drivers/media/i2c/vd56g3.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/vd56g3.c b/drivers/media/i2c/vd56g3.c
index 157acea9e2..43f792288a 100644
--- a/drivers/media/i2c/vd56g3.c
+++ b/drivers/media/i2c/vd56g3.c
@@ -1427,11 +1427,14 @@ static int vd56g3_subdev_init(struct vd56g3 *sensor)
 	v4l2_subdev_unlock_state(state);
 	if (ret) {
 		dev_err(sensor->dev, "Controls update failed: %d\n", ret);
-		goto err_ctrls;
+		goto err_subdev;
 	}
 
 	return 0;
 
+err_subdev:
+	v4l2_subdev_cleanup(&sensor->sd);
+
 err_ctrls:
 	v4l2_ctrl_handler_free(sensor->sd.ctrl_handler);
 
-- 
2.50.1

