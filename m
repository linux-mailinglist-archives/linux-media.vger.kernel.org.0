Return-Path: <linux-media+bounces-58404-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEf4N8QJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58404-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:19:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEC83CF5F7
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDB8B306DA4B
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE4C33B970;
	Thu,  9 Apr 2026 20:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DEIGOkz3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE54033AD99
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765722; cv=none; b=TxcVCBoR4gDsLlsWonJlxSCC2+C13OQKs+mXJLkhNuBBsR3bNbdoq83vMCvXichOFl49DvqhCabiE4Y90isgpkwj4BHFJ4nLbeLG6+9XRwTQE0OaaLqqSB3sieBWL+fHxiCxCMw21NL9O6MOZMFLxuTOz2Pz3flJw6sn+ZsTii0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765722; c=relaxed/simple;
	bh=SGi2mu5LcVpNRCu28wYVqzssp7sKrXYsoGMyldc5zHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kb46oK9vemZt5QYkTxY+R7WENppyApv3rd+kdOlMb9BgHAPw7qqA1ORKpnpSDN7W7M2Y67MuUjGHBcs0092SyhKmaB0Q6mkZLT60XA6mlZGKXhILy0sc0HvmFTV72zy1Ha1pjOh/UdQ7FDVuj8O7FBzH4gcLeiCtkrL+95S4KcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DEIGOkz3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765720; x=1807301720;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SGi2mu5LcVpNRCu28wYVqzssp7sKrXYsoGMyldc5zHE=;
  b=DEIGOkz34y9kedU9RChshVFw5T0YGHjnEKJaUyb97si4TzVcHGU8RfN2
   n6JOpfAh96ee/SNZgCnW53ah6Kpnp9Dd9HsUCxc3uJ8gItiB1hi7KbKtj
   oOFBPK4YfHkmK7dqkTz50R+Pcamq12Qb8BuRDTBufQR0HudeFNxpRn8Cg
   PFfj/vVAPf8o/tjVLJy1yXS2Az7OFKKc04ArZlLO66ytKHpqQg9u9dWwI
   KWPkRN1DH283KsLFoqZidGgPE+mnWeuAuCjFKD0BrMan/wbbsVhKNWTqy
   6P2zpnBAcuPPwH9qt0VwIUn8vvoYcuh9rvZHKTFRnKF5eUnyZJTni1tPO
   A==;
X-CSE-ConnectionGUID: 4jQ3BZD5R/u9cJ0MO11xxA==
X-CSE-MsgGUID: w7i9c6w5SNedKNmkHD2XAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408869"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408869"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:11 -0700
X-CSE-ConnectionGUID: q9qTpnx1QECHNNpBYCCYeQ==
X-CSE-MsgGUID: U4ZgCNOkTuCgAuH9Qb0JcQ==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:04 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6F5CD12211A;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045qR-3pjj;
	Thu, 09 Apr 2026 23:15:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: [PATCH v12 82/86] media: ipu6: Drop {get,put}_streams_opened()
Date: Thu,  9 Apr 2026 23:14:57 +0300
Message-ID: <20260409201501.975242-83-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
References: <20260409201501.975242-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,intel.com,ti.com];
	TAGGED_FROM(0.00)[bounces-58404-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4BEC83CF5F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

{get,put}_streams_opened() aren't needed anymore. Drop them. This also
requires acquiring isys->stream_mutex for system suspend.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 39 +++----------------
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |  4 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.h      |  1 -
 3 files changed, 8 insertions(+), 36 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 2344e4a880d6..9eb22e456834 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -440,24 +440,6 @@ static int link_validate(struct media_link *link)
 	return ret;
 }
 
-static void get_stream_opened(struct ipu6_isys *isys)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&isys->streams_lock, flags);
-	isys->stream_opened++;
-	spin_unlock_irqrestore(&isys->streams_lock, flags);
-}
-
-static void put_stream_opened(struct ipu6_isys *isys)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&isys->streams_lock, flags);
-	isys->stream_opened--;
-	spin_unlock_irqrestore(&isys->streams_lock, flags);
-}
-
 static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 				struct ipu6_fw_isys_stream_cfg_data_abi *cfg,
 				struct ipu6_isys_stream *stream,
@@ -607,8 +589,6 @@ static int ipu6_isys_start_stream_firmware(struct ipu6_isys_stream *stream,
 		return ret;
 	}
 
-	get_stream_opened(stream->isys);
-
 	tout = wait_for_completion_timeout(&stream->stream_open_completion,
 					   IPU6_FW_CALL_TIMEOUT_JIFFIES);
 
@@ -616,21 +596,17 @@ static int ipu6_isys_start_stream_firmware(struct ipu6_isys_stream *stream,
 
 	if (!tout) {
 		dev_err(dev, "stream open time out\n");
-		ret = -ETIMEDOUT;
-		goto out_put_stream_opened;
+		return -ETIMEDOUT;
 	}
 	if (stream->error) {
 		dev_err(dev, "stream open error: %d\n", stream->error);
-		ret = -EIO;
-		goto out_put_stream_opened;
+		return -EIO;
 	}
 	dev_dbg(dev, "start stream: open complete\n");
 
 	msg = ipu6_get_fw_msg_buf(stream);
-	if (!msg) {
-		ret = -ENOMEM;
-		goto out_put_stream_opened;
-	}
+	if (!msg)
+		return -ENOMEM;
 	buf = &msg->fw_msg.frame;
 	ipu6_isys_buf_to_fw_frame_buf(buf, stream, &bl);
 	ipu6_isys_buffer_list_queue(&bl, IPU6_ISYS_BUFFER_LIST_FL_ACTIVE, 0);
@@ -670,7 +646,7 @@ static int ipu6_isys_start_stream_firmware(struct ipu6_isys_stream *stream,
 					 IPU6_FW_ISYS_SEND_TYPE_STREAM_CLOSE);
 	if (retout < 0) {
 		dev_dbg(dev, "can't close stream (%d)\n", retout);
-		goto out_put_stream_opened;
+		return retout;
 	}
 
 	tout = wait_for_completion_timeout(&stream->stream_close_completion,
@@ -682,9 +658,6 @@ static int ipu6_isys_start_stream_firmware(struct ipu6_isys_stream *stream,
 	else
 		dev_dbg(dev, "stream close complete\n");
 
-out_put_stream_opened:
-	put_stream_opened(stream->isys);
-
 	return ret;
 }
 
@@ -741,8 +714,6 @@ static int ipu6_isys_close_streaming_firmware(struct ipu6_isys_stream *stream,
 	else
 		dev_dbg(dev, "close stream: complete\n");
 
-	put_stream_opened(stream->isys);
-
 	scoped_guard(spinlock_irqsave, &stream->isys->power_lock) {
 		stream->isys->streams_by_handle[stream->stream_handle] = NULL;
 		csi2->streams_by_vc[stream->vc] = NULL;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index d7e69195c84d..fb46ded122fa 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -853,8 +853,10 @@ static int isys_suspend(struct device *dev)
 {
 	struct ipu6_isys *isys = dev_get_drvdata(dev);
 
+	guard(mutex)(&isys->stream_mutex);
+
 	/* If stream is open, refuse to suspend */
-	if (isys->stream_opened)
+	if (!ida_is_empty(&isys->streams))
 		return -EBUSY;
 
 	return 0;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.h b/drivers/media/pci/intel/ipu6/ipu6-isys.h
index 8a5086439f21..157b27a8eb6d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.h
@@ -112,7 +112,6 @@ struct ipu6_isys {
 	bool csi2_cse_ipc_not_supported;
 	bool iwake_watermark_enabled;
 	unsigned int ref_count;
-	unsigned int stream_opened;
 	unsigned int sensor_type;
 
 	struct mutex mutex;
-- 
2.47.3


