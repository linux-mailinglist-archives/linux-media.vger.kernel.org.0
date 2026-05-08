Return-Path: <linux-media+bounces-60926-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCndEkzb/Wn0jwAAu9opvQ
	(envelope-from <linux-media+bounces-60926-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 14:47:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A78884F68AE
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 14:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85D4D3069D1C
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 12:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A963DEAC7;
	Fri,  8 May 2026 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ce5jX6wU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399F13DBD76;
	Fri,  8 May 2026 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778244250; cv=none; b=TY9JUxF7eWl/vOiCyw+lDQ838Iaq/EQfHx88J4rwGRdaTPvmfqrUNanimuBVKcaQj1my770nCt7GAq3lsryKIilotfhL/KjYv1k/MhH8VrBPcPvZ/KlnOAeLScDp0zxi9U1liLq1ynVLlPvh7U9DzBg0U4LOo3hm7QjMeTMrayg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778244250; c=relaxed/simple;
	bh=CKBd/NSWaegSrgWu/p2Tb4ewlIZvc9gvEqqf/e1+h9M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nN6VU57AnAvSmj73hbzW+swwBBnIYdmEl4vrbElv8fI2YzCYwb/Hu/Zjkh120VJcdknfb2Po16GgtMa422m4pheAQyq/zPZEKTaBcTiu+hubdyZ6XLT+KSB5bqWCHvEQnHKaAhkZ2/dTjQ4ypFqVo7JjsZGvj2TYSw3CAzZpN6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ce5jX6wU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8356C2BCB0;
	Fri,  8 May 2026 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778244249;
	bh=CKBd/NSWaegSrgWu/p2Tb4ewlIZvc9gvEqqf/e1+h9M=;
	h=From:To:Cc:Subject:Date:From;
	b=ce5jX6wUy2iov9HblRXdSBhws0z/zjyqh/3iGZ5wTq5Qp+qI3Q2Huf8enrZ/dc8ou
	 GML9JTzUTrLnNgIcuHGbHjSVlsSv4QCzBIcJTtvD1FxWSUQt0eBhZfRiO9TmX/8y/S
	 4DnxohSMF/IZhwjG7noK9pZkjgPnbWyOQjBF6AKTYrSan+Ymu4YChPrkdWNZGdTkaY
	 NfIPXmV84dszmnfu85Ga+B+0xCnCpimtDjMMP3BgUsDprm1k+AzrPY8cniBqwtc5f1
	 4ALFhjra39OVKug3BbagGVtrb+DxV/s5SwoHqIN18LIzXaGJOCMfwhT9OwPYX+NnpD
	 kY8EGdasg+irQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sultan Alsawaf <sultan@kerneltoast.com>,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bin Du <Bin.Du@amd.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] media: platform: amd: avoid -Wformat-security warning
Date: Fri,  8 May 2026 14:43:49 +0200
Message-Id: <20260508124402.3082615-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A78884F68AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60926-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email,arndb.de:email]
X-Rspamd-Action: no action

From: Arnd Bergmann <arnd@arndb.de>

The newly added kthread_run() call passes a string variable as an sprintf()
style format, which gcc warns about when -Wformat-security is enabled:

drivers/media/platform/amd/isp4/isp4_subdev.c: In function 'isp4sd_start_resp_proc_threads':
include/linux/kthread.h:71:16: error: format not a string literal and no format arguments [-Werror=format-security]
   71 |         struct task_struct *__k                                            \
      |                ^~~~~~~~~~~
drivers/media/platform/amd/isp4/isp4_subdev.c:596:38: note: in expansion of macro 'kthread_run'
  596 |                 thread_ctx->thread = kthread_run(isp4sd_fw_resp_thread,
      |                                      ^~~~~~~~~~~

Use an indirect "%s" format to do this safely, avoiding the warning.

Fixes: 4e5e7a7ddb4a ("media: platform: amd: isp4 subdev and firmware loading handling added")
Tested-by: Bin Du <Bin.Du@amd.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: avoid overly long line
---
 drivers/media/platform/amd/isp4/isp4_subdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
index 48deea79ce6c..427e9ba910bb 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.c
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -595,6 +595,7 @@ static int isp4sd_start_resp_proc_threads(struct isp4_subdev *isp_subdev)
 
 		thread_ctx->thread = kthread_run(isp4sd_fw_resp_thread,
 						 &isp_subdev->isp_resp_para[i],
+						 "%s",
 						 isp4sd_thread_name[i]);
 		if (IS_ERR(thread_ctx->thread)) {
 			dev_err(dev, "create thread [%d] fail\n", i);
-- 
2.39.5


