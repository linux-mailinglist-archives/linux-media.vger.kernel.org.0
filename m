Return-Path: <linux-media+bounces-4597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBD0846BE7
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 10:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24C9AB2D4B8
	for <lists+linux-media@lfdr.de>; Fri,  2 Feb 2024 09:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1736B63128;
	Fri,  2 Feb 2024 09:21:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B720277655
	for <linux-media@vger.kernel.org>; Fri,  2 Feb 2024 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706865713; cv=none; b=rhQqdVTN1Z+cskEzf7ZMGcQVMKQZALCfIYsNWiTaTZMaoyDefmAcstyB49CfnK+7bwOVIIoE0x+ev7hLulAIaJZEzLheexV3aUuJvlXNvdr+BiTi6YKQGg57IR6WS2NQ3c7jUaqxon3kbKrkWLtymXQXjDLFzDdKuV+Dmia0Hk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706865713; c=relaxed/simple;
	bh=C3svhF4Zo5yxgMaRoGRJn5SpzZwUsXnEaEGnpkz4vPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cnHySWYH4Y8gNcMDjmY4ZbVI0hz14ebBekrawRnhgNocnSzSeVRqUqUSquTuUfnBHrN62d9EdWe6moUcT5X85zYrDIuZhX4O5NBzJy5yA6hyb9cIRK6AtKbYchgCCLX7G2UfG+l2RLRAOr+s1KXvETddTLheWhuOOo018jpoesQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78FB5C43390;
	Fri,  2 Feb 2024 09:21:52 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 0/2] media: atomisp: two sparse/smatch fixes
Date: Fri,  2 Feb 2024 10:21:19 +0100
Message-ID: <cover.1706865681.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two small fixes to shut up sparse/smatch.

	Hans

Hans Verkuil (2):
  media: atomisp: make dbgopt static
  media: atomisp: don't use sizeof(NULL)

 drivers/staging/media/atomisp/pci/atomisp_drvfs.c | 2 +-
 drivers/staging/media/atomisp/pci/sh_css.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0


