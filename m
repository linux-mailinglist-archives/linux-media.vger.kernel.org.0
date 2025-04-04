Return-Path: <linux-media+bounces-29391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EDBA7BE70
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 15:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 465641792A7
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 13:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944A41F2360;
	Fri,  4 Apr 2025 13:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pjCiYuVa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25991F181F;
	Fri,  4 Apr 2025 13:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774838; cv=none; b=ts3ayOa7H68Atbm7rWjKcaz1ODfMn2iyrUzkIbPnDc+DX3u3MycYjUbDUnnQCfsN4jsMald8weGNv/bzZa+EOexXzrpviIxHV197g9Sv+rRpSHIkvkoKBjJS6nEokX12nkwpaklUc8Z8/lIe8BqZGWYWRYixIbt6riuIefMdDvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774838; c=relaxed/simple;
	bh=ZHcXVryXGa3l58EH+QP5ntOTTbVTbrHGqD+0D7zNWuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XGB/DDvC8LZYdlVy1MJ1+Li0X076wr2MKEviRe+3YEtF1FbWQd47pBUzInMueBVyWJFLwq68tJqk9/KoJGLT1tUMykQHUF5r3sCXmy0UF9OKXKoXA4GN8dHW2lxYRiqzZHZO9wgNgNWBlgRYNlZSZbhkIJ3SdDg5bbs7qOxsiYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pjCiYuVa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA85C4CEE8;
	Fri,  4 Apr 2025 13:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743774837;
	bh=ZHcXVryXGa3l58EH+QP5ntOTTbVTbrHGqD+0D7zNWuM=;
	h=From:To:Cc:Subject:Date:From;
	b=pjCiYuVaHH8EFMd0N3DDUaCKZPc45QenB+EcceKHtRel2vP7SuddsdBJsFtZ1+93u
	 4PfegeXMfJIBCjwbKz3JyhULr6MekUWWuQTu2oLAXkNi9IQBCar7D9KSZobwlfKEU+
	 wFNggwTScoYSLh9eimjfL8+qZb/G/WPZcurvwfa97pHMbZ2vvrmv4iPj72whhqLpA0
	 rpDeB8o3YrQE5AJxvLhbLr5oyN+1mtrUGo69H6sZZbaBNRDzfMpJDM9dbBYvQeSouY
	 Dd7VO4VoYqzJ3qTT4gpF9WuhK5QKA0F3SSofqf959a42QtwO9Gm4nlY39QpjosUOqB
	 vzuWEfu9FrnRQ==
From: Philipp Stanner <phasta@kernel.org>
To: Yong Zhi <yong.zhi@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Akihiro Tsukada <tskd08@gmail.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Ismael Luceno <ismael@iodev.co.uk>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 0/5] media: Replace deprecated PCI functions
Date: Fri,  4 Apr 2025 15:53:40 +0200
Message-ID: <20250404135344.93241-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replaces pcim_iomap_regions() and pcim_iomap_table(), which have been
deprecated.

The successor pcim_iomap_region() is already used in many places and
shouldn't cause trouble.

I test-built it, but have no hardware for testing.

P.

Philipp Stanner (5):
  media: ipu3-cio2: Replace deprecated PCI functions
  media: pt3: Replace deprecated PCI functions
  media: intel/ipu6: Replace deprecated PCI functions
  media: solo6x10: Replace deprecated PCI functions
  media: tw5864: Replace deprecated PCI functions

 drivers/media/pci/intel/ipu3/ipu3-cio2.c   |  5 ++---
 drivers/media/pci/intel/ipu6/ipu6.c        |  8 ++++----
 drivers/media/pci/pt3/pt3.c                | 17 +++++++++++------
 drivers/media/pci/solo6x10/solo6x10-core.c |  4 ++--
 drivers/media/pci/tw5864/tw5864-core.c     | 13 ++++++++-----
 5 files changed, 27 insertions(+), 20 deletions(-)

-- 
2.48.1


