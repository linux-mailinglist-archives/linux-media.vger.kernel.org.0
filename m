Return-Path: <linux-media+bounces-58385-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPfrGkAJ2GlOWggAu9opvQ
	(envelope-from <linux-media+bounces-58385-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C263CF4B9
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 22:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2625303CA7E
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 20:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4081F2FF144;
	Thu,  9 Apr 2026 20:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+q2NBoa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8018D31AA8F
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 20:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765710; cv=none; b=JwQYWve2js21HbFQgabCmGzk9GsEDpmsewTrGI6rhlR37364zCMDfaZ+ShmdSlx66JvWAMVlhe9TynbOINfwtO9K8G4C1D63FmoK9Qg+DlBSNt45s5EkLyYLiwzwow722C9EGnD00i4JreJCHPNHiKl5IP7V7sC+cRcMzjw3I0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765710; c=relaxed/simple;
	bh=8fIUaHx1Un6+g47msrH+RVw4pgiKVcXpMw9YMPZnUuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ofuklAXzzd/W0oT7GfF16DdQ7GkLyRit8RZCvmDxE8OwB4XcNvLe5LulJKJRtRzDkZ/6v1SCLE1IQXIwh7E6hwXoj3DVhmLRwqI4AW9JpqVRM4zfkSa8RAGOUJudF7lHRzhxPXIUc+1JrDgsVngwku4sppkOV85snHRWzCZEUlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+q2NBoa; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775765709; x=1807301709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8fIUaHx1Un6+g47msrH+RVw4pgiKVcXpMw9YMPZnUuE=;
  b=B+q2NBoalMGAIkTygDbK2xQKdMFXqELXkTTApzffsHk9gQRLTlE8nPIZ
   3Dg8M6eoniPMWhbq0J5mkVZLdamGXh3xEBRfr6hbMaD37nWYC7ZTwENq+
   kY7yZnE16xcPn/BycCgkIg4Yi7JvafrLmxOS5PT7t01JAewiyGB2Vbuw6
   toA5eaHTbfLXMCQgup57HT9RL7K9fckHI2D57xML39VvZrMCIeWmNI1Sl
   1ScAjqHjEk293SEqDMkXygJEstzyHZuIXVLqce0qeANz+mu3XZtoW9rOq
   s+pWzl6JufaDwXdhXWi8ClRviO6lHk0JQNaAZLlTx21LOj2NoHikwENME
   w==;
X-CSE-ConnectionGUID: a/O0NKOaSQuKAoGddQJ6OQ==
X-CSE-MsgGUID: ar9D9wpJTluqXpbqOmtNSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87408641"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="87408641"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:09 -0700
X-CSE-ConnectionGUID: Oc4aApUGTOKxTrAzxESWHQ==
X-CSE-MsgGUID: wm0zRcuKQjmp963p3j5icQ==
X-ExtLoop1: 1
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.29])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 13:15:03 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3FD91121E84;
	Thu, 09 Apr 2026 23:15:03 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wAvmI-000000045pT-31Km;
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
Subject: [PATCH v12 70/86] media: ipu6: Always request a capture ack
Date: Thu,  9 Apr 2026 23:14:45 +0300
Message-ID: <20260409201501.975242-71-sakari.ailus@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-58385-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C5C263CF4B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Always request a capture ack from a queued buffer. If streaming is
disabled, no buffers would have been queued in the first place. Remove the
streaming field from struct ipu6_isys_stream as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 10 ++--------
 drivers/media/pci/intel/ipu6/ipu6-isys-video.h |  1 -
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index 7f24b113338c..13d759b27ca0 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -266,10 +266,7 @@ ipu6_isys_buf_to_fw_frame_buf(struct ipu6_fw_isys_frame_buff_set_abi *set,
 	set->send_irq_eof = 0;
 	set->send_resp_eof = 0;
 
-	if (stream->streaming)
-		set->send_irq_capture_ack = 0;
-	else
-		set->send_irq_capture_ack = 1;
+	set->send_irq_capture_ack = 1;
 	set->send_irq_capture_done = 0;
 
 	set->send_resp_capture_ack = 1;
@@ -299,8 +296,6 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av)
 	if (ret)
 		return ret;
 
-	stream->streaming = 1;
-
 	do {
 		struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
 		struct isys_fw_msgs *msg;
@@ -631,13 +626,12 @@ static void stop_streaming(struct vb2_queue *q)
 	ipu6_isys_update_stream_watermark(av, false);
 
 	mutex_lock(&av->isys->stream_mutex);
-	if (stream->nr_streaming == stream->nr_queues && stream->streaming)
+	if (stream->nr_streaming == stream->nr_queues)
 		ipu6_isys_video_set_streaming(av, 0);
 	list_del(&aq->node);
 	mutex_unlock(&av->isys->stream_mutex);
 
 	stream->nr_streaming--;
-	stream->streaming = 0;
 	mutex_unlock(&stream->mutex);
 
 	ipu6_isys_stream_cleanup(av);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index 72d413026d3e..d07c16e79877 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -53,7 +53,6 @@ struct ipu6_isys_stream {
 
 	int nr_queues;	/* Number of capture queues */
 	int nr_streaming;
-	int streaming;	/* Has streaming been really started? */
 	struct list_head queues;
 	struct completion stream_open_completion;
 	struct completion stream_close_completion;
-- 
2.47.3


