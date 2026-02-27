Return-Path: <linux-media+bounces-53679-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHl0CH9ioWnIsQQAu9opvQ
	(envelope-from <linux-media+bounces-53679-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 10:23:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E88FB1B53C9
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 10:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 492733012AB1
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 09:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7802238B7D1;
	Fri, 27 Feb 2026 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hmQOui8W"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A9531618B
	for <linux-media@vger.kernel.org>; Fri, 27 Feb 2026 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184183; cv=none; b=jlMgZJsnomJK251TmrcZwRUPUtDeRKzkd/dXJq4mZzM9sbFlmm4vffN2BlCCZE5+10fH7ZIFF4/ksDE3xC/JWb+Uo1zI0YgLQDrXVQ2r/3yFzNtK0fRRi6JDJLLvPpHq4ujKXLJgjI3nmUUmfdbalzI27P6Rfv6RUQD3AiQpl2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184183; c=relaxed/simple;
	bh=4YrjaVoyB0tr8XZsLCnIa7KSU/Jpi9Wdr4+cAAjTtDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ha6VOXmJOpj1xUA6px9aQdXtxCSMA6UsxgptDdXwj9CWKC2zC7peJbnf/k0mLA/67+YFJ0k7ErAwKNJFAgJI0jvpcZAG9DObZvtroOC6NwBoUY4lLbb35b/cFm2udb4nXg4nqGRxRKLJUkMiori/tLeFNKzuUbywV6DRzd9ltgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hmQOui8W; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772184181; x=1803720181;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4YrjaVoyB0tr8XZsLCnIa7KSU/Jpi9Wdr4+cAAjTtDA=;
  b=hmQOui8WUGlYSP9+klnKkGiuaO8eH502FZ6bmvxhLKNlUNY+GeEqhLh/
   HD9CY8vC1r+T14GsB2i2MEeUh7F8Aq2u9mEDatGK83RWSoWZj5L8/3iKj
   yjzItcUyDFG/biYSE9iCWXUlUn0GMoGEYYZdcUQvy6agGtnPHLLct6yzR
   VN7yhQbT4T5YPgG8fps73PZcnbj68ViWh8erdEhYpQErL7tBfhvefq819
   17AvvVNIgJ6cQ4+RRBDid9Y69nezFJSEgnr76ScfejqmvOM6udLBdgvnU
   4JKr3JYBJ2PMz1LoFXrNPfhm0m6VlfW4eu/UC/vYwO73wKu7dH7XlDLd5
   w==;
X-CSE-ConnectionGUID: trWNohBPRxaiJGKJlQIGmg==
X-CSE-MsgGUID: +PsrgES3TeGiKoNxHHVpDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73135978"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="73135978"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 01:23:01 -0800
X-CSE-ConnectionGUID: i6kaykONQTSWbnlf4agzZA==
X-CSE-MsgGUID: gYJlGCf2Qiu5TiVrND9bgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="213734322"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.120])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 01:22:59 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 73474121D1E;
	Fri, 27 Feb 2026 11:23:27 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vvu4F-0000000FKjP-0ec0;
	Fri, 27 Feb 2026 11:23:27 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	Soufiane Dani <soufianeda@tutanota.com>
Subject: [PATCH 1/1] staging: media: atomisp: Disallow all private IOCTLSs but S_PARAMETERS
Date: Fri, 27 Feb 2026 11:23:27 +0200
Message-ID: <20260227092327.3654603-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53679-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,intel.com:dkim];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E88FB1B53C9
X-Rspamd-Action: no action

Disallow all private IOCTLs except ATOMISP_IOC_S_PARAMETERS. These aren't
quite as safe as one could assume of IOCTL handlers; disable them for now.
Instead of removing the code, simply check the IOCTL matches with
S_PARAMETERS and bail out otherwise, in order to ease backporting.

In particular, ATOMISP_IOC_S_ISP_FPN_TABLE is disabled by this patch.

Reported-by: Soufiane Dani <soufianeda@tutanota.com>
Closes: https://lore.kernel.org/linux-staging/20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com/
Cc: stable@vger.kernel.org
Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index a7f22de1c889..78e14c9aeed8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1356,6 +1356,10 @@ static int atomisp_s_parm(struct file *file, void *fh,
 static long atomisp_vidioc_default(struct file *file, void *fh,
 				   bool valid_prio, unsigned int cmd, void *arg)
 {
+	/* Only allow ATOMISP_IOC_S_PARAMETERS for now! */
+	if (cmd != ATOMISP_IOC_S_PARAMETERS)
+		return -EINVAL;
+
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
 	int err;
-- 
2.47.3


