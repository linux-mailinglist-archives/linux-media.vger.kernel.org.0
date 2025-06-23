Return-Path: <linux-media+bounces-35614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 303CEAE3D94
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C191C7A5CA5
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 10:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233D323C8AA;
	Mon, 23 Jun 2025 11:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJSnH/z1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D3910E9
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 11:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676447; cv=none; b=Zlanc0AUnxmz2kaJN18VLrj+4COsRm8SKQL/4Iir02Z4WWN7gor8IAzCFhv3Ey4NlocRDIzGa2Xo43Pe6n75J7qcOPbwB4Mv23Pz3ZaKMtj0q69nNzMc5sySNKf37Dx8smY7zEajZomqrY0evgcE/KPomWXTbmcGQuJJ+iMiDQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676447; c=relaxed/simple;
	bh=xy+1oQyN84X3xBza0Ztp+JeeD9Ma+fzF8gpjcazc+N8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CVfXqwWed0uKstvPo8gf2tnh+bQkelK7neIbaaC42lCKEPfUBu5LV7pSV+MuKAfag6ffW5Jm17eZhCnx3ynnvg23oSEycQBmX56k8gRgziVDVMVZEt4NplqAYxnWb7Xkp/kQIA55DAIoJFUrWv9wzVgT1lAQ7jBZhv2avbSGWLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJSnH/z1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC2BC4CEF4;
	Mon, 23 Jun 2025 11:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750676447;
	bh=xy+1oQyN84X3xBza0Ztp+JeeD9Ma+fzF8gpjcazc+N8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JJSnH/z1sA72a3ejd2aTDg4U6fFmImnOymv7VD4R0/DYJSaEWaQWORiZrwk5iibji
	 9N4mF8f313O1F9NveK0HkFLzdgUyuqR6oChvHs+7rx9BCblI7aF7TCIXXaJ4XJwiMu
	 YV5DUcQpu0Wdz0znlaO/v1jSkUhZgne8wc577+c80ozTo0oOK8ozbLre4bBoBe7i8x
	 3K0wtrtCTgs9X/AKaIi1scvf1QKqSGJzf9aDRRt+HZgrqVqoqfrlddd+b45GoDeW93
	 pzIMN5nHz+n0KBu5tApoaBuIf9GpgGC96bfUxkC3+Xm4fs3zSOGuPoBCLDO9xkqKB+
	 Yv4yr41Gxp9Ng==
From: Hans de Goede <hansg@kernel.org>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 4/4] media: ipu-bridge: Improve error logging when waiting for IVSC to become ready
Date: Mon, 23 Jun 2025 13:00:35 +0200
Message-ID: <20250623110035.18340-5-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623110035.18340-1-hansg@kernel.org>
References: <20250623110035.18340-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

The ipu-bridge code waits for the IVSC to become ready (on platforms with
an IVSC chip).

It does this by returning -EPROBE_DEFER, but it does not use
dev_err_probe() so no reason for deferring gets registered.

After 30 seconds the kernel logs a warning that the probe is still
deferred, which looks like this:

[   33.951709] pci 0000:00:14.3: deferred probe pending: (reason unknown)

Use dev_err_probe() when returning -EPROBE_DEFER to register the probe
deferral reason changing the error to:

deferred probe pending: waiting for IVSC to become ready

to help with debugging why drivers are not binding if the iVSC does
not become ready for some reason.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index c80af394ce18..dbb847a104e0 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -811,7 +811,8 @@ int ipu_bridge_init(struct device *dev,
 		return 0;
 
 	if (!ipu_bridge_ivsc_is_ready())
-		return -EPROBE_DEFER;
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for IVSC to become ready\n");
 
 	bridge = kzalloc(sizeof(*bridge), GFP_KERNEL);
 	if (!bridge)
-- 
2.49.0


