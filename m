Return-Path: <linux-media+bounces-21491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F8D9D0958
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 07:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF1A2B22795
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 06:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E89146A73;
	Mon, 18 Nov 2024 06:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r1fcLvd2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C287F460;
	Mon, 18 Nov 2024 06:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731910169; cv=none; b=pVg6X5buGj3Te5ZHGUZokBQ3q+5GcBfTqJznD7JldaJsd2zznL8a9+fSo0G0sF3p8XV3yLDUsW02vUHJqxWF4jwM2kT7HL1hEG8ydCgK7TlW8sTLC6K8F/7xAsVOzpzz7eeow74j6IutTagJVIvau4tPED5XiRVQToLRk49eEpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731910169; c=relaxed/simple;
	bh=4C7Swz1qKPs9kGTA4qQCbhjD9yZVeVNp8/5aRRkyZI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bFegw+0PGaNkDKngh8ETcgUV6OTx0c9w62VKBSQQan2IW8QBfjUjjqlRiqNDQZ6baD9N6IBpd4uMaprktWOTfRl3FFsjkfmB+3ULzYC3jldGA3wKubINtAnV8GUgCQ2NTAoDaJe/4i00xqLE9+4ld/6zt8MX33o9P7LCDlnW3IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r1fcLvd2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A46AC4CECF;
	Mon, 18 Nov 2024 06:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731910169;
	bh=4C7Swz1qKPs9kGTA4qQCbhjD9yZVeVNp8/5aRRkyZI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r1fcLvd2EZqoyhjS9Y4hDiWzTSNSLnMxR1SkUhs+KYVqmA4Jh3IOQQ8wQplKLq+GL
	 S6rEsg14XqQQuXkaM3ThgjDe4XHq+tL5zpo7ZWVZmhNEZCxk9AO4GzpM46H1WXEA5i
	 XFUgHOGoLkxPlLESzXhXJuHoygzmlE+vbi2rgxfVnpMl/pOvJQZ5a6Wz9UZrFBb4ML
	 04VGJ1f6UxGN4Q3APFnmNrmjknlP3b3GBZS4kIvfQqTndE3ERYMihNU7n5aWBvknn1
	 ehuUHqLJOSFV7VhkawqF6vwb0aWOmVdyZP2Tf/efH9sSRzgO1R3afFbb6mWCQtmpD8
	 bIyHHZwp0mfmg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tCuww-000000042if-36yW;
	Mon, 18 Nov 2024 07:09:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] docs: media: update location of the media patches
Date: Mon, 18 Nov 2024 07:09:19 +0100
Message-ID: <544c6883e49e4b85bf5338d794f754ac0cfe3436.1731910082.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731910082.git.mchehab+huawei@kernel.org>
References: <cover.1731910082.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Due to recent changes on the way we're maintaining media, the
location of the main tree was updated.

Change docs accordingly.

Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/building.rst | 2 +-
 Documentation/admin-guide/media/saa7134.rst  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/media/building.rst b/Documentation/admin-guide/media/building.rst
index a06473429916..7a413ba07f93 100644
--- a/Documentation/admin-guide/media/building.rst
+++ b/Documentation/admin-guide/media/building.rst
@@ -15,7 +15,7 @@ Please notice, however, that, if:
 
 you should use the main media development tree ``master`` branch:
 
-    https://git.linuxtv.org/media_tree.git/
+    https://git.linuxtv.org/media.git/
 
 In this case, you may find some useful information at the
 `LinuxTv wiki pages <https://linuxtv.org/wiki>`_:
diff --git a/Documentation/admin-guide/media/saa7134.rst b/Documentation/admin-guide/media/saa7134.rst
index 51eae7eb5ab7..18d7cbc897db 100644
--- a/Documentation/admin-guide/media/saa7134.rst
+++ b/Documentation/admin-guide/media/saa7134.rst
@@ -67,7 +67,7 @@ Changes / Fixes
 Please mail to linux-media AT vger.kernel.org unified diffs against
 the linux media git tree:
 
-    https://git.linuxtv.org/media_tree.git/
+    https://git.linuxtv.org/media.git/
 
 This is done by committing a patch at a clone of the git tree and
 submitting the patch using ``git send-email``. Don't forget to
-- 
2.47.0


