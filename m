Return-Path: <linux-media+bounces-33517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E013AAC6866
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 13:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A3F816D43A
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 11:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E172D2836AF;
	Wed, 28 May 2025 11:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXZNXs96"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8D96A33B;
	Wed, 28 May 2025 11:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748431935; cv=none; b=qtr6Bc/TOvijMghSm+sPCKHxvFLAUE75XukLtYCtIMXUMmG30ORjijIeZ8tX0KeG8k+vWAu6NSy6kyQgIMGBT29MChNZ8Cj8jyp4MiVt1jVe0Aw7TuYgn3TnpuVxWiRVZFFPto1cW+SMpiWIzqYSXVxIkiAYNFUDHqUR1233tlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748431935; c=relaxed/simple;
	bh=iv4qvN2l1NEUV02CdKzcBJCMlMmP0+cKrnFzewtczAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PKm5t8vxYHzj3kPBmtX9Qx2+GmhRRB/ymNqV7bC5mcdEcHm9kiVnm1YUmwCnGdaHhnxSbGtnU5GhomikesioC/MsYKW/IZOsJHEeizCyNneyymBnJmRljEUitglCmtUunTBuUSuEMjjdimstvTKYzn7wcJewtNMljv3D1GsQeYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mXZNXs96; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748431933; x=1779967933;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iv4qvN2l1NEUV02CdKzcBJCMlMmP0+cKrnFzewtczAw=;
  b=mXZNXs968t/bhEbLGrEPtx1Cctcqs4wPg6nSkFPeU2wR/bzc4Ynom2pg
   p2TFOBW7WiXLuKt3YosTLUGQG5DQRdjvQc2rpItkFItuqjifI6nUSQ2yX
   ygr5b8hpJjwo9eItDOfoGiwQ5rJmy/T26jK1AZcAycFfyiFWtZjc4IQ9a
   ZC8ZXgZyJxSQJbr60EfOA7m5YWdGvOqbVnv9ywe5kF8Hk09TibaFkYYML
   Gv1ofXfaEkXTa+IeUaWkfFhfu7SmHy59l+v8YIZqvg7w1S4CGCK9aBDp6
   k/HSmJyMjaYVkCypc491S2130IkHpF+CbtME7cTE1+VLmpyCqx+5hzUay
   A==;
X-CSE-ConnectionGUID: /NHq0J9uTF+vUJ2IQ+cpSQ==
X-CSE-MsgGUID: Qb3rCX7tS9ebxusYl3fXdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="49567371"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="49567371"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 04:32:13 -0700
X-CSE-ConnectionGUID: WjIP6fTUQraUPHaLMfMzbQ==
X-CSE-MsgGUID: WOX10nMwRAaLnfbp/fXXZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="166386899"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 28 May 2025 04:32:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4F862193; Wed, 28 May 2025 14:32:10 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Walls <awalls@md.metrocast.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v1 1/1] media: cx18: Replace custom implementation of list_entry_is_head()
Date: Wed, 28 May 2025 14:32:04 +0300
Message-ID: <20250528113204.2742626-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Besides list_entry_is_past_end() is the same as list_entry_is_head(),
it's implemented in the list namespace. Fix both of the issue by replacing
the custom version with list_entry_is_head() calls.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/media/pci/cx18/cx18-driver.h  | 12 ------------
 drivers/media/pci/cx18/cx18-fileops.c |  2 +-
 drivers/media/pci/cx18/cx18-ioctl.c   |  2 +-
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-driver.h b/drivers/media/pci/cx18/cx18-driver.h
index af05bde75816..485ca9747c4c 100644
--- a/drivers/media/pci/cx18/cx18-driver.h
+++ b/drivers/media/pci/cx18/cx18-driver.h
@@ -271,18 +271,6 @@ struct cx18_options {
 #define CX18_SLICED_TYPE_WSS_625        (5)
 #define CX18_SLICED_TYPE_VPS            (7)
 
-/**
- * list_entry_is_past_end - check if a previous loop cursor is off list end
- * @pos:	the type * previously used as a loop cursor.
- * @head:	the head for your list.
- * @member:	the name of the list_head within the struct.
- *
- * Check if the entry's list_head is the head of the list, thus it's not a
- * real entry but was the loop cursor that walked past the end
- */
-#define list_entry_is_past_end(pos, head, member) \
-	(&pos->member == (head))
-
 struct cx18_vb2_buffer {
 	/* Common video buffer sub-system struct */
 	struct vb2_v4l2_buffer vb;
diff --git a/drivers/media/pci/cx18/cx18-fileops.c b/drivers/media/pci/cx18/cx18-fileops.c
index 7e742733391b..25aa38a55674 100644
--- a/drivers/media/pci/cx18/cx18-fileops.c
+++ b/drivers/media/pci/cx18/cx18-fileops.c
@@ -371,7 +371,7 @@ static size_t cx18_copy_mdl_to_user(struct cx18_stream *s,
 		mdl->curr_buf = list_first_entry(&mdl->buf_list,
 						 struct cx18_buffer, list);
 
-	if (list_entry_is_past_end(mdl->curr_buf, &mdl->buf_list, list)) {
+	if (list_entry_is_head(mdl->curr_buf, &mdl->buf_list, list)) {
 		/*
 		 * For some reason we've exhausted the buffers, but the MDL
 		 * object still said some data was unread.
diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index 1817b9ed042c..9a1512b1ccaa 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.c
+++ b/drivers/media/pci/cx18/cx18-ioctl.c
@@ -764,7 +764,7 @@ static int cx18_process_idx_data(struct cx18_stream *s, struct cx18_mdl *mdl,
 		mdl->curr_buf = list_first_entry(&mdl->buf_list,
 						 struct cx18_buffer, list);
 
-	if (list_entry_is_past_end(mdl->curr_buf, &mdl->buf_list, list)) {
+	if (list_entry_is_head(mdl->curr_buf, &mdl->buf_list, list)) {
 		/*
 		 * For some reason we've exhausted the buffers, but the MDL
 		 * object still said some data was unread.
-- 
2.47.2


