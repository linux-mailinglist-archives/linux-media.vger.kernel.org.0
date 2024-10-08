Return-Path: <linux-media+bounces-19206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 038D39941D5
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 10:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 386A7B24F2E
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 08:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1163120ADFD;
	Tue,  8 Oct 2024 07:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPtCcfUV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725B820ADED
	for <linux-media@vger.kernel.org>; Tue,  8 Oct 2024 07:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728374119; cv=none; b=JnzHfpaw4l/NwxLDU0zNJlN3ttVM7rX7fxe5brN+ld41bkS+qBAsJ+6fYhWk/O5hrW5Qa+xE62lHhfxKZiCoKYhZQ8tl6b3ewwCXSu9e7E9rmDtTTRKPUkoA3uIkk1hmXgT/wGKun15NGf7CIL7RF062UHvY4rGxU9n8xqQ2IHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728374119; c=relaxed/simple;
	bh=rscZMgz/Mijcjy/sEyqugMew5TKHnYLU8Tt2nkTIfMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p6tTa3nc4DVjYaCkoYptvn2DyhYe7PgXdre5SoJYDSv85JdEOOPLDqtn1EIOFm9m3FX0H1zD45dulAh5lJg13FjrdtwVbSHj9sYdk9OEmbp53x+KlAA5AcBmwwCtd5AkXsfU821e6UULdTiVj/uoHhuaL7xdnZa0qOrYCq+aU5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPtCcfUV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE39C4CED2;
	Tue,  8 Oct 2024 07:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728374118;
	bh=rscZMgz/Mijcjy/sEyqugMew5TKHnYLU8Tt2nkTIfMQ=;
	h=From:To:Cc:Subject:Date:From;
	b=VPtCcfUVO/9VXBdQ2Z8LQ0eYs/nJIyijVhY8TypcoKKJ0X8KsQ7l9gz7K8Nv05lxX
	 9cX1V98uOkvWsdClC/YpBFfs8dQhzYwqe2PnBzOYaobGCK4gwlNrSmTRD4qKR84uVU
	 ogtaej75WvR7oZr3poCjpCWqU2o+HAdSQSfNY1eTIgoJDvD5s03xkOIpaT8ZNP4NFz
	 SPAXHaFi63/D5HCSxycmojE3CBoDZjm+JvPMVz5Qw3Nl36mFwg7Yj5PAm4FlON12kV
	 qMetkyNGDWELjpe0amTWSp5N4z3CYkLMb78xPwFyxzF7ZEXsQlDOU7Jqn/Eym1E6L7
	 H+0ImkVwua3Mw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1sy53s-0000000Dqc7-00LT;
	Tue, 08 Oct 2024 09:55:16 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH BROKEN] BAD PATCH
Date: Tue,  8 Oct 2024 09:53:24 +0200
Message-ID: <20241008075511.3295642-1-mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

This patch is meant to crash compilation. Its only goal is to test media-ci
reply e-mail. Never apply this one!!!

Expected errors:
- missing SoB;
- Compilation failures
- C99 comments

---

 drivers/media/usb/em28xx/em28xx-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-core.c b/drivers/media/usb/em28xx/em28xx-core.c
index 29a7f3f19b56..d4cd1a7037c4 100644
--- a/drivers/media/usb/em28xx/em28xx-core.c
+++ b/drivers/media/usb/em28xx/em28xx-core.c
@@ -1159,6 +1159,9 @@ int em28xx_resume_extension(struct em28xx *dev)
 {
 	const struct em28xx_ops *ops = NULL;
 
+	// HACK just to check the media-ci reports
+	foo()
+
 	dev_info(&dev->intf->dev, "Resuming extensions\n");
 	mutex_lock(&em28xx_devlist_mutex);
 	list_for_each_entry(ops, &em28xx_extension_devlist, next) {
-- 
2.46.2


