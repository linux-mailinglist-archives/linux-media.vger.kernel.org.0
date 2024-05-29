Return-Path: <linux-media+bounces-12185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4468D3C29
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 18:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8322BB25290
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 16:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8894018411F;
	Wed, 29 May 2024 16:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gUU7E2rN"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECBD181B8B;
	Wed, 29 May 2024 16:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716999788; cv=none; b=ArukjwI8FV07E2RBew2iBam4CtOYZ2OzT/32tW62+XNV5jG2t+H3UbX/U9KoEUk1bl+TdJ1PqLwtuTf1oMw+qAbZ4nAc1kB2ueVodaCF5A5Th29RVbyDcfA7pDD1rTgagPgVkd54mzwA09YCLc3JZO4O+a92K1bJ3DQQaFPCEpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716999788; c=relaxed/simple;
	bh=g5pHQd73mBrP9X400nvFyG13JPUFcrrvEIFvGsi6JJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LgVrBFJlyveOmEz8qUYGLn+st2YzvuU44epPWa0Lirb0DFP2zGitms5Iy69XcvGK1ek6eedl5zP6cppITtqOiC36kvp/Zu2wNl8qOQocYN6OElytNitjC48kGq25WREa6z5D05keel0e7A/v+FjeR6/4CXutHYZQH5QBxkkbScE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gUU7E2rN; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716999784;
	bh=g5pHQd73mBrP9X400nvFyG13JPUFcrrvEIFvGsi6JJg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gUU7E2rNyrmIiJbOzVcdyExhr6tCisnPx49KpV6y231HX0g9xmPEFi/bBRH3Q6e/J
	 +/HPD2yTXjYilZJJi9ZFsZtNh2g7i7V4Kq6xBu3J+woJLb9XVqa1mr6WB2m9rGVt3b
	 osX6HLSb7MDGcSZR1ExJWI4flLVe3DAeGTN8Xo0tA8PcGjTovcgwnpy6cC0PFCZ7kc
	 0jT/mQDxypj7rjkqlUKzRoDQ/FZPuRc8cX/9RdiZhiwZCMmVsWn8KQ14FWMfK0K0UT
	 LmGx4pHuL63rQ1xAaYVgMpVrO1A2oV9YBzNFAI8E4DwjuMroOS4KQ1ZfkM8AAOCBX0
	 HWoMtNwdE/zDg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 956163782192;
	Wed, 29 May 2024 16:23:04 +0000 (UTC)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Date: Wed, 29 May 2024 18:22:56 +0200
Subject:
 [PATCH RFC 1/2] docs: media: Create separate documentation folder for media
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-b4-media_docs_improve-v1-1-9ddb111c4433@collabora.com>
References: <20240529-b4-media_docs_improve-v1-0-9ddb111c4433@collabora.com>
In-Reply-To: <20240529-b4-media_docs_improve-v1-0-9ddb111c4433@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, mauro.chehab@linux.intel.com, kernel@collabora.com,
 Sebastian Fricke <sebastian.fricke@collabora.com>
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716999782; l=1395;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=g5pHQd73mBrP9X400nvFyG13JPUFcrrvEIFvGsi6JJg=;
 b=o75jPj20EaePaRSJ+J20i20PUyuNl60NtA9hXX/axl6/MA0ymHy9IlLpk2it++ToZcCAc/l1Ps29
 RFm7rD+KB2ZlY3knlxkwBKZpvG/hdl4JP9bdvuRZ2l2nMjS7YmYb
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=

The media subsystem currently only maintains a set of Kernel API
documentations, with the intent of adding guides for the subsystem a
separate location is required. Create an empty folder with an index and
embed it into the subsystem listing.

Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
---
 Documentation/media/index.rst    | 19 +++++++++++++++++++
 Documentation/subsystem-apis.rst |  1 +
 2 files changed, 20 insertions(+)

diff --git a/Documentation/media/index.rst b/Documentation/media/index.rst
new file mode 100644
index 000000000000..d056a9e99dca
--- /dev/null
+++ b/Documentation/media/index.rst
@@ -0,0 +1,19 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============================
+Media Subsystem Documentation
+=============================
+
+.. toctree::
+   :maxdepth: 2
+
+   ../userspace-api/media/index
+   ../driver-api/media/index.rst
+   ../admin-guide/media/index
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/subsystem-apis.rst b/Documentation/subsystem-apis.rst
index 74af50d2ef7f..5a1d90fd1af6 100644
--- a/Documentation/subsystem-apis.rst
+++ b/Documentation/subsystem-apis.rst
@@ -33,6 +33,7 @@ Human interfaces
    input/index
    hid/index
    sound/index
+   media/index
    gpu/index
    fb/index
    leds/index

-- 
2.25.1

