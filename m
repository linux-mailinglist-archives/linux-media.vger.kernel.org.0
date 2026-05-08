Return-Path: <linux-media+bounces-60895-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJt6CBKY/Wn7gAAAu9opvQ
	(envelope-from <linux-media+bounces-60895-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 10:00:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 957E84F36E5
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 10:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B47793010DAC
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 07:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B573806A6;
	Fri,  8 May 2026 07:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qhMqI+DB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAB936C9EE;
	Fri,  8 May 2026 07:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778227174; cv=none; b=aOftSLv7IXS6T+/eG58SEc8L4ChWjFDOrtommY6DHzqSjFaLOYQPJTqNyEnAxuh+6J3go3eLQfGlHHZZ3VXkYHtoijEqfU6HRi1dE0/mRnmV78tsi4EkS7jnjFoIL/sleSEH+OePVpy0UJsuZenUDYywzAp39GIf3ysceshoC24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778227174; c=relaxed/simple;
	bh=DcrjWsxQ0WiBsyS8ZdAC32qF/nPwildouVjiOEQY+vM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dciujeq/5TOL9VzHzb1g+7bJjHg4uP78G1lHVu4Lz2d0oGMGjGajY16pLkaS0Jql/35+/Oa4eQqA+JssfXGDAL53cg5f70TJm7kb/b0CR0p2DP3BDspPzpCsc94WBt7jodLj7Kac+7KTUg4/G4leW5hDZMe1jDhB4DIyrLsfjcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qhMqI+DB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F255EC2BCB0;
	Fri,  8 May 2026 07:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778227172;
	bh=DcrjWsxQ0WiBsyS8ZdAC32qF/nPwildouVjiOEQY+vM=;
	h=From:To:Cc:Subject:Date:From;
	b=qhMqI+DBF/D7AvVsa46UsD8jFa2n0Kh3MX/7QIHsTBQLD9bLl50wIkkEbZ18wO0pH
	 elkGO2agVOEkyEpRCxzyvqM5QmhkP8BPDCQwU40Ivp8FYeKePrOSl4EDt94lRG5j5h
	 JqB91OampUxFAT/spKF6aMe/yegY/R+NZLsrevmSU/SwH3KDJRey/GJ1p8/Gu26nSi
	 MCuFw9nbOmgx0awzSEb44M3WfvZSjcZIbs9VWxk1MwS37xum5S7b05Ni5u6lIHi0Qe
	 fOEzrRIkr1VmQIr1rhxgC4S8Z5cey5u8uxeHfyccyhzl+xzXsrPeYCv3rtga/8E3Fv
	 AL0v6YBpg2/+w==
From: Arnd Bergmann <arnd@kernel.org>
To: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sultan Alsawaf <sultan@kerneltoast.com>,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: platform: amd: avoid -Wformat-security warning
Date: Fri,  8 May 2026 09:52:52 +0200
Message-Id: <20260508075926.3698178-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 957E84F36E5
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
	TAGGED_FROM(0.00)[bounces-60895-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:email]
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
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/amd/isp4/isp4_subdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
index 48deea79ce6c..86680ec8730d 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.c
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -595,7 +595,7 @@ static int isp4sd_start_resp_proc_threads(struct isp4_subdev *isp_subdev)
 
 		thread_ctx->thread = kthread_run(isp4sd_fw_resp_thread,
 						 &isp_subdev->isp_resp_para[i],
-						 isp4sd_thread_name[i]);
+						 "%s", isp4sd_thread_name[i]);
 		if (IS_ERR(thread_ctx->thread)) {
 			dev_err(dev, "create thread [%d] fail\n", i);
 			thread_ctx->thread = NULL;
-- 
2.39.5


