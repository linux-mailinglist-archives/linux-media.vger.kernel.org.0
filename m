Return-Path: <linux-media+bounces-62234-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAfYItOHDWquygUAu9opvQ
	(envelope-from <linux-media+bounces-62234-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:07:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BB858B57C
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D93E730438B9
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE813D5241;
	Wed, 20 May 2026 10:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zze0eGit"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539763BAD91
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 10:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271577; cv=none; b=D61HCDAptV6rcGixOprd39L5+82FG86MzWdH/B6OOUBQst78NSX+eGBm5l2TI8d2u1mhVfvKB234MwQW1fnGqaevMlyquAwbdTk0wWfFPz6LhJgjkKgYU951nuVqU2xVSH7U9fioDdmKwCO0QH+6bLKi4Sf2YUVRUDaC6/sDlqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271577; c=relaxed/simple;
	bh=v3oM0twAdKWn7xXkH9HDOSWpHQIYPMBHXMt+qxwQrOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GKLJo8uiYK60FZQtTpjknNc/Ziku1f0oC2hVN9g5FBkX6TldYSrA5D6fu+eqAGTRRuLAC1tg29RRqFemFp7BcjQ7zjDkAGEOriFkrWUmZpY20VC6tk241M3Qt3fcxmtHCxLkKTlm1P9dCUlrj8lA5L1/s0H7Wlhc5+sJFH/EI2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zze0eGit; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04FEC1F000E9;
	Wed, 20 May 2026 10:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271574;
	bh=AJfag3m3S8UqPGbPf41cHNoFs8uMNaQOdsJ7PwzcZrs=;
	h=From:To:Cc:Subject:Date;
	b=Zze0eGitm4yQ8MlzwnI7QsYoWY2e40PApkwKGF1bN9tYWkiwblDFH2wMwPcG+qVCR
	 6az9kBGoEJsXjcyU45hoqYj7Wz2pXaNOCJRJ3bESRWYw9tDEYk9MJShJTnED/bm7Z/
	 Nkq1U/qaLpDrSQHhCdApXCrGeqtzDeNV1zZrcLnmvB67Ume3Vl2n3XyA0FBpMRkQHd
	 rEzuH1+/3OHflJRoXqf2cSO2xRfOhDy6kP8dR0zozPXdZeLQG2sqaLQJdUWgKyEEkG
	 x22bnfrTPLjHW0NJF7KhveMpMVnw8hnGY9tOjOdHVXp7WpeWIH2/Zy/RJwc2fthpq1
	 GoU6j9TlQ0ZvA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCHv2 0/2] media: vivid: add vb2_is_busy() checks
Date: Wed, 20 May 2026 10:36:20 +0200
Message-ID: <cover.1779266182.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62234-lists,linux-media=lfdr.de,cisco];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 31BB858B57C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There are a number of controls that change the behavior of
cropping/composing/scaling, and they all call vivid_update_format_cap/out.

But that function resets the format, so this needs a vb2_is_busy()
check.

The REDUCED_FPS control also calls vivid_update_format_cap(), but it
doesn't really need that, it can just update the frame period on
the fly.

The first patch deals with the REDUCED_FPS control, and the second
adds the vb2_is_busy() check for the crop/compose/scale capability
controls.

I could reproduce the syzbot crash by manipulating these controls,
and with these patches it no longer crashes.

Regards,

	Hans

Hans Verkuil (2):
  media: vivid: add vivid_update_reduced_fps()
  media: vivid: check for vb2_is_busy() when toggling caps

 .../media/test-drivers/vivid/vivid-ctrls.c    | 15 +++++++-
 .../media/test-drivers/vivid/vivid-vid-cap.c  | 38 ++++++++++++-------
 .../media/test-drivers/vivid/vivid-vid-cap.h  |  1 +
 .../media/test-drivers/vivid/vivid-vid-out.c  |  6 +++
 4 files changed, 46 insertions(+), 14 deletions(-)

-- 
2.53.0


