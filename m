Return-Path: <linux-media+bounces-67273-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id onG8Fu7TUGpz5gIAu9opvQ
	(envelope-from <linux-media+bounces-67273-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:13:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BC473A045
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:13:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JjvEe2zl;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67273-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67273-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E6E330107E2
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 11:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366B2410D24;
	Fri, 10 Jul 2026 11:11:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26A03F0ABA
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 11:11:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681906; cv=none; b=I6ma8NmOgyj8kij/0KhTWU9MOXeYH1fZwy1/cmfr/3UKGWhnoK8KfCcOsyDzcJoPtCseqeOOTbmvd37y2WyPCp1mLmGKNICshBwmezK9IHHSX6FHCoytV4Nk1c+cimVa7rbLrvrGS2F2TpcHz8WtU1HZ01TmcrGXh37fCrSLR4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681906; c=relaxed/simple;
	bh=XRtbJZiwC5+dvOIlhFLQOncAV3aOyVN3Ev/NvvBYz8w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=rf7h/cUHZfN45UJnIK/Rh/L2vsT/wlypwd5KNtGH+/3Qh6XtRSTrLnidVY5SNG4OfGB3mqFa6B38rVt4ogQCgu9JGBRsOgAfThn0BE8bV5o7TRlwVsW4qG/aoxB8SmuIi/TOsIROO2K9Uj4cof0kYAukkdQ/6qm9Z48Efy4OgdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjvEe2zl; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81F31F000E9;
	Fri, 10 Jul 2026 11:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783681905;
	bh=FWsMMSo+PuYNJAxtmSkVQANGL2vkRG4i/767vV3G3MA=;
	h=From:To:Subject:Date;
	b=JjvEe2zlYokJyTozhnh22cQKpuWa/HdkASvt4C8XiawN7qu6DEIIFCF1CQnlx6012
	 jT9IskCaYojr6ac1U7RPhs4F7cRBLmyQ2oh1DiM04Qd4n1rCFHhCH4wfdnjMdwRpq2
	 DOD8shwAVi2EllBkxA2OEgzjfrKJtJZHD6p2Uwwpi5YozbXCR/QauTRxlg9IM/Hhi8
	 H8P0dg6JPlStd/KJxTwU+A+yGGdAesukis/7IWDDXbGXFQINJSQfsCISAcm9gHRipS
	 PbD6U/WGHr3ExoDp/6af/2KFo0Xkrw/tYRWDKRpp6w1e6jmxyxFCZO67KRoWQCoPNa
	 sYsiyhdr5PNRw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Subject: [PATCH 0/8] media: cec/core: fixes and improvements
Date: Fri, 10 Jul 2026 13:07:28 +0200
Message-ID: <cover.1783681656.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_FROM(0.00)[bounces-67273-lists,linux-media=lfdr.de,cisco];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4BC473A045

Various cec core fixes and improvements.

Most notably the concept of 'core events' was dropped to simplify
the code and allow for more STATE_CHANGE events.

Also the process to claim a logical address was improved: retry
polling if a poll timed out or aborted instead of bailing out, and
if it was not possible to claim a logical address, then expose that
to userspace through a new flag.

A new error injection debugfs entry was added as well to allow
testing timeouts. A separate patch for cec-compliance will be
posted that tests this with the vivid driver.

Regards,

	Hans

Hans Verkuil (8):
  media: cec/core: max_retries -> max_attempts
  media: cec/core: drop ABORTED/TIMEOUT check
  media: cec/core: handle core events like normal events
  media: cec/core: drop cec_post_state_event call
  media: cec/core: flush stale STATE_CHANGE events
  media: cec/core: add a new CEC_LOG_ADDRS_FL_CONFIG_FAILED flag
  media: cec/core: cec-pin: toggle rx_toggle when arb lost
  media: cec/core: add error-inj-tx-timeouts debugfs entry

 .../media/cec/cec-ioc-adap-g-log-addrs.rst    |  7 ++
 drivers/media/cec/core/cec-adap.c             | 85 ++++++++++++-------
 drivers/media/cec/core/cec-api.c              |  5 +-
 drivers/media/cec/core/cec-core.c             | 31 +++++++
 drivers/media/cec/core/cec-pin.c              | 10 ++-
 include/media/cec.h                           |  4 +-
 include/uapi/linux/cec.h                      |  2 +
 7 files changed, 107 insertions(+), 37 deletions(-)

-- 
2.53.0


