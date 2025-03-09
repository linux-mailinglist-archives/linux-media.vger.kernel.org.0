Return-Path: <linux-media+bounces-27896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F29A57FF8
	for <lists+linux-media@lfdr.de>; Sun,  9 Mar 2025 01:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 947BD16ABE3
	for <lists+linux-media@lfdr.de>; Sun,  9 Mar 2025 00:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB09186A;
	Sun,  9 Mar 2025 00:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Itiz5jKJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D431036C;
	Sun,  9 Mar 2025 00:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741479278; cv=none; b=tvy2wnFwORPgAuWAuGaemD1kjsE/DnK9/RzqjoZwipW7VNxyNAVVKT7OCzgtvv0kPyyHZ1qcWJC2DWkZry9ACJ3pv+121zEKqDNE3UWCkjyKRXKyPpvilLN7PpSBZJjnlZWDbXuWHDSH0GiOMBU+xUmU15xBISM54BIti6Yp7EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741479278; c=relaxed/simple;
	bh=7e6eKxmRQ+Br0gKpgH4VgGDaoif0AE8vbkrrsG0rv+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lGc2hYVPufy8EfcZA+Yryw2GCOcV3++/JQ/UywPzzhZNONsKqHvPFsR+H1UzZp2WX3P0mO6k7Bc/w9UGvdH5oHYs9ckzw2Hi4CxN1B122RQLSn420h+uMu8zj9kGD7ISo4QMyEEtG+NAcn4xQhJhtJIzqs9xbesCmhVCHuWwdEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Itiz5jKJ; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=KwUUZ+KPJTmyLfJTwCs4KiNUfyZmVdVVhPGradVNjU8=; b=Itiz5jKJlch+/7Gd
	5BRWKa573vYnoIKEJBSYYnw04uKUN4oowQLUcR4+qwrn5VFDWJK2ZrjydPHDmxUmUTRYBNq9CnyRC
	MnQWa3qXcKEMUGuo4EYz3gDEwCCB+rtF9J1SHgcuKrmxxv8V9c7Rp/0DolrOCT8O3nLdCHynaPm1P
	xH602utCQ2jn4P+h/VBKtKeAWo8px+AJvd8c10tXgDkmWRRLY7ibcv792cpTa4rOXdXIY789aJlzS
	h3ZsR72PqxD1R/DXJvQT+8sYBt8jO+z9Gmh638yKs5MlaHYG4vOnZ3kCHLajfwiq31HbU68v2CqsT
	8/KMyZecFmIB3jZ+5Q==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tr4JL-003f6z-2z;
	Sun, 09 Mar 2025 00:14:31 +0000
From: linux@treblig.org
To: isely@pobox.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: pvrusb2: Remove unused pvr2_std_create_enum
Date: Sun,  9 Mar 2025 00:14:31 +0000
Message-ID: <20250309001431.260682-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

pvr2_std_create_enum() has been unused since 2012's
commit c0bb609fdc0b ("[media] pvrusb2: Get rid of obsolete code for video
standard enumeration")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/usb/pvrusb2/pvrusb2-std.c | 167 ------------------------
 drivers/media/usb/pvrusb2/pvrusb2-std.h |   6 -
 2 files changed, 173 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-std.c b/drivers/media/usb/pvrusb2/pvrusb2-std.c
index e7ab41401577..81c994e62241 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-std.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-std.c
@@ -212,173 +212,6 @@ unsigned int pvr2_std_id_to_str(char *bufPtr, unsigned int bufSize,
 }
 
 
-// Template data for possible enumerated video standards.  Here we group
-// standards which share common frame rates and resolution.
-static struct v4l2_standard generic_standards[] = {
-	{
-		.id             = (TSTD_B|TSTD_B1|
-				   TSTD_D|TSTD_D1|
-				   TSTD_G|
-				   TSTD_H|
-				   TSTD_I|
-				   TSTD_K|TSTD_K1|
-				   TSTD_L|
-				   V4L2_STD_SECAM_LC |
-				   TSTD_N|TSTD_Nc),
-		.frameperiod    =
-		{
-			.numerator  = 1,
-			.denominator= 25
-		},
-		.framelines     = 625,
-		.reserved       = {0,0,0,0}
-	}, {
-		.id             = (TSTD_M|
-				   V4L2_STD_NTSC_M_JP|
-				   V4L2_STD_NTSC_M_KR),
-		.frameperiod    =
-		{
-			.numerator  = 1001,
-			.denominator= 30000
-		},
-		.framelines     = 525,
-		.reserved       = {0,0,0,0}
-	}, { // This is a total wild guess
-		.id             = (TSTD_60),
-		.frameperiod    =
-		{
-			.numerator  = 1001,
-			.denominator= 30000
-		},
-		.framelines     = 525,
-		.reserved       = {0,0,0,0}
-	}, { // This is total wild guess
-		.id             = V4L2_STD_NTSC_443,
-		.frameperiod    =
-		{
-			.numerator  = 1001,
-			.denominator= 30000
-		},
-		.framelines     = 525,
-		.reserved       = {0,0,0,0}
-	}
-};
-
-static struct v4l2_standard *match_std(v4l2_std_id id)
-{
-	unsigned int idx;
-	for (idx = 0; idx < ARRAY_SIZE(generic_standards); idx++) {
-		if (generic_standards[idx].id & id) {
-			return generic_standards + idx;
-		}
-	}
-	return NULL;
-}
-
-static int pvr2_std_fill(struct v4l2_standard *std,v4l2_std_id id)
-{
-	struct v4l2_standard *template;
-	int idx;
-	unsigned int bcnt;
-	template = match_std(id);
-	if (!template) return 0;
-	idx = std->index;
-	memcpy(std,template,sizeof(*template));
-	std->index = idx;
-	std->id = id;
-	bcnt = pvr2_std_id_to_str(std->name,sizeof(std->name)-1,id);
-	std->name[bcnt] = 0;
-	pvr2_trace(PVR2_TRACE_STD,"Set up standard idx=%u name=%s",
-		   std->index,std->name);
-	return !0;
-}
-
-/* These are special cases of combined standards that we should enumerate
-   separately if the component pieces are present. */
-static v4l2_std_id std_mixes[] = {
-	V4L2_STD_PAL_B | V4L2_STD_PAL_G,
-	V4L2_STD_PAL_D | V4L2_STD_PAL_K,
-	V4L2_STD_SECAM_B | V4L2_STD_SECAM_G,
-	V4L2_STD_SECAM_D | V4L2_STD_SECAM_K,
-};
-
-struct v4l2_standard *pvr2_std_create_enum(unsigned int *countptr,
-					   v4l2_std_id id)
-{
-	unsigned int std_cnt = 0;
-	unsigned int idx,bcnt,idx2;
-	v4l2_std_id idmsk,cmsk,fmsk;
-	struct v4l2_standard *stddefs;
-
-	if (pvrusb2_debug & PVR2_TRACE_STD) {
-		char buf[100];
-		bcnt = pvr2_std_id_to_str(buf,sizeof(buf),id);
-		pvr2_trace(
-			PVR2_TRACE_STD,"Mapping standards mask=0x%x (%.*s)",
-			(int)id,bcnt,buf);
-	}
-
-	*countptr = 0;
-	std_cnt = 0;
-	fmsk = 0;
-	for (idmsk = 1, cmsk = id; cmsk; idmsk <<= 1) {
-		if (!(idmsk & cmsk)) continue;
-		cmsk &= ~idmsk;
-		if (match_std(idmsk)) {
-			std_cnt++;
-			continue;
-		}
-		fmsk |= idmsk;
-	}
-
-	for (idx2 = 0; idx2 < ARRAY_SIZE(std_mixes); idx2++) {
-		if ((id & std_mixes[idx2]) == std_mixes[idx2]) std_cnt++;
-	}
-
-	/* Don't complain about ATSC standard values */
-	fmsk &= ~CSTD_ATSC;
-
-	if (fmsk) {
-		char buf[100];
-		bcnt = pvr2_std_id_to_str(buf,sizeof(buf),fmsk);
-		pvr2_trace(
-			PVR2_TRACE_ERROR_LEGS,
-			"***WARNING*** Failed to classify the following standard(s): %.*s",
-			bcnt,buf);
-	}
-
-	pvr2_trace(PVR2_TRACE_STD,"Setting up %u unique standard(s)",
-		   std_cnt);
-	if (!std_cnt) return NULL; // paranoia
-
-	stddefs = kcalloc(std_cnt, sizeof(struct v4l2_standard),
-			  GFP_KERNEL);
-	if (!stddefs)
-		return NULL;
-
-	for (idx = 0; idx < std_cnt; idx++)
-		stddefs[idx].index = idx;
-
-	idx = 0;
-
-	/* Enumerate potential special cases */
-	for (idx2 = 0; (idx2 < ARRAY_SIZE(std_mixes)) && (idx < std_cnt);
-	     idx2++) {
-		if (!(id & std_mixes[idx2])) continue;
-		if (pvr2_std_fill(stddefs+idx,std_mixes[idx2])) idx++;
-	}
-	/* Now enumerate individual pieces */
-	for (idmsk = 1, cmsk = id; cmsk && (idx < std_cnt); idmsk <<= 1) {
-		if (!(idmsk & cmsk)) continue;
-		cmsk &= ~idmsk;
-		if (!pvr2_std_fill(stddefs+idx,idmsk)) continue;
-		idx++;
-	}
-
-	*countptr = std_cnt;
-	return stddefs;
-}
-
 v4l2_std_id pvr2_std_get_usable(void)
 {
 	return CSTD_ALL;
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-std.h b/drivers/media/usb/pvrusb2/pvrusb2-std.h
index d8b4c6dc72fe..74b05ecb9708 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-std.h
+++ b/drivers/media/usb/pvrusb2/pvrusb2-std.h
@@ -23,12 +23,6 @@ int pvr2_std_str_to_id(v4l2_std_id *idPtr,const char *bufPtr,
 unsigned int pvr2_std_id_to_str(char *bufPtr, unsigned int bufSize,
 				v4l2_std_id id);
 
-// Create an array of suitable v4l2_standard structures given a bit mask of
-// video standards to support.  The array is allocated from the heap, and
-// the number of elements is returned in the first argument.
-struct v4l2_standard *pvr2_std_create_enum(unsigned int *countptr,
-					   v4l2_std_id id);
-
 // Return mask of which video standard bits are valid
 v4l2_std_id pvr2_std_get_usable(void);
 
-- 
2.48.1


