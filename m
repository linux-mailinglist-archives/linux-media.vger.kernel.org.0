Return-Path: <linux-media+bounces-58854-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ArvOEOT4GmsjwAAu9opvQ
	(envelope-from <linux-media+bounces-58854-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 09:44:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B501C40B263
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 09:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 069B0308CD92
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 07:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89276389DE0;
	Thu, 16 Apr 2026 07:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pmhahn.de header.i=@pmhahn.de header.b="Nk2RqOeg"
X-Original-To: linux-media@vger.kernel.org
Received: from birdy.pmhahn.de (birdy.pmhahn.de [88.198.22.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2EC3806AC;
	Thu, 16 Apr 2026 07:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.198.22.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776325432; cv=none; b=OVLjwS5pGtd+tIYPpHpfjounxZlqOVbk+HgQ9eFeiypNnxsV33lXjFYdlr5yvgEPqVamUDafADlBFMzcGVKOLV3KgjdbrNAu4+AKghfZnk83wAOTwltVdW5MuBqYR1q3ZTiCEjefFaTly9wwMb0rMFMK+tmYkcbNvJtkiOsdTAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776325432; c=relaxed/simple;
	bh=BAj8UtQxlzksUDP+eVS/Cma3d9LyAmtlx1KeaBCeWbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=baiQzJTI6DqzlFTBLD4I3PVGU//Tef6oV3QEigBWwYce/8JY0xBCJ2QTLscrT/xgWinmVATToL6/o36Bqqoqq+l5QpbeKKtGiihGSHz7sUva/m1KfsmgCJmaZ+SgpalFEU47KQED16SbHR0tElIjkgD8cLlGKhcscCPIK5NggEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pmhahn.de; spf=pass smtp.mailfrom=pmhahn.de; dkim=fail (2048-bit key) header.d=pmhahn.de header.i=@pmhahn.de header.b=Nk2RqOeg reason="signature verification failed"; arc=none smtp.client-ip=88.198.22.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pmhahn.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pmhahn.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pmhahn.de; s=202501;
	t=1776324880; bh=BAj8UtQxlzksUDP+eVS/Cma3d9LyAmtlx1KeaBCeWbI=;
	h=From:To:Cc:Subject:Date:From;
	b=Nk2RqOegK5LTBmOHw8LFx3kOKxjdo1Z9K4SiB0a2HpRXtopX3GptL/L90Qs8d7Nxk
	 wTEGlDp4OfVv0PFOeGFlL6o6N90tGdjJe7i2JjZVEQh5zebNfZa3FPHWElIbmjB5wd
	 Fh7geGxamAUP95lrUmTQHZm41z6c9xgkByqtA8uAm2empe/PGf1FSq/ETwvYI5w6yw
	 31jTZ9BgoBGEnAAGgPi86aATG/9KjYnvAS/AbMHbF1iStjEVWpybBe2sYwnI/Bavh+
	 5khK8zPjeRUsYkNIuh1Ll14xkMl8q+sJ6+bMddr7XfaFqUdVF2Ro3+f2QJbrrAzWBn
	 eim8/YnbZfmCg==
Received: from jovis.fritz.box (p200300e2773852006edef9635d8adeb3.dip0.t-ipconnect.de [IPv6:2003:e2:7738:5200:6ede:f963:5d8a:deb3])
	by birdy.pmhahn.de (Postfix) with ESMTPSA id 3A3A02201E2B;
	Thu, 16 Apr 2026 09:34:40 +0200 (CEST)
Received: by jovis.fritz.box (Postfix, from userid 1000)
	id DEC867E; Thu, 16 Apr 2026 09:34:39 +0200 (CEST)
From: Philipp Matthias Hahn <pmhahn@pmhahn.de>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Philipp Matthias Hahn <pmhahn@pmhahn.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: gspca: Handle SENSOR_HV7131R
Date: Thu, 16 Apr 2026 09:34:31 +0200
Message-ID: <cover.1776323993.git.pmhahn@pmhahn.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [2.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[pmhahn.de : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[pmhahn.de:s=202501];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58854-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[114.105.105.172.asn.rspamd.com:server fail];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmhahn@pmhahn.de,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[pmhahn.de:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_SPAM(0.00)[0.020];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pmhahn.de:mid]
X-Rspamd-Queue-Id: B501C40B263
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I found an old USB webcam 0c45:602d Microdia VideoCAM ExpressII.
`vlc` triggeres two OOPS as soon as I open the device.

The first patch prevents those OOPSes, while the 2nd fixes a minor spelling
mistake.

The camera still does not work and I get the following error:
> sonixb 1-3:1.0: i2c error writing c0 11 31 38 2a 2e 00 10

I'm still investigating the old driver sn9c102_hv7131r.c from [1], but so far
was unable to make progress. So feel free to apply this now. Thank you.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c0e11a2a24db782341f456877d19b9390c5998a9

Philipp Matthias Hahn (2):
  media: gspca: Handle SENSOR_HV7131R
  media: gspca: Fix comment in sd_init()

 drivers/media/usb/gspca/sonixb.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

-- 
2.47.3


