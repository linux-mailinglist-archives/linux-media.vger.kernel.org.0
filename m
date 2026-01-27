Return-Path: <linux-media+bounces-51658-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLoFGv+yeGkksQEAu9opvQ
	(envelope-from <linux-media+bounces-51658-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:43:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9F3946F0
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 13:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D0EDA3005337
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC75355054;
	Tue, 27 Jan 2026 12:43:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F41354AF2;
	Tue, 27 Jan 2026 12:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769517811; cv=none; b=cZiONXMo98MTdHYvsXy/LeTGcepyMcR5buALn+Dyzc6uWJNmgrtqkA1EdVGd5uPmAEEaVreZYhROeGwxeZg9YPpno2n82/w1TwAg2txV8EbhnEiIYjy4FMrChHdtY1HEdavtiZpEjsIkJPCr8KVAVVbHsk4KfW0cGjIokESJ3XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769517811; c=relaxed/simple;
	bh=lOdKCHEDzphPiNP1atzxxggJiPvn2NtykgaGwTIRVGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M/ETPtOvrEVBZjCFOvwDzKtPChThWCm54pc/lq5L5dnjs1c7nCvUf6qQ4wVx2WtM7JMHahOVHico4iMBVBgbl9wASkF0ZyF7dhFYTFyfzQ918Mlwk22Zb3BBZtKHU+o0eno8jAUOtvGPkLS4hMM/EdC1ab3uGsvQLYbeQ/7i+dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from localhost (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 1C64786FD1;
	Tue, 27 Jan 2026 13:43:24 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v2 0/2] media:pci:mgb4: Add zDML color mapping support
Date: Tue, 27 Jan 2026 13:43:06 +0100
Message-ID: <20260127124308.344380-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tumic@gpxsee.org,linux-media@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[gpxsee.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51658-lists,linux-media=lfdr.de];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[digiteqautomotive.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,gpxsee.org:mid]
X-Rspamd-Queue-Id: CD9F3946F0
X-Rspamd-Action: no action

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Add zDML (a special signal mapping as used in Audi Digital Matrix Lights)
color mapping support.

Changes in v2:
- Do not break the previous property show/store tuple when adding the new
  one.

Martin Tůma (2):
  media:pci:mgb4: Add zDML color mapping support
  media:admin-guide:mgb4: Add zDML color mapping info

 Documentation/admin-guide/media/mgb4.rst |  8 +++
 drivers/media/pci/mgb4/mgb4_sysfs_in.c   | 18 +++++--
 drivers/media/pci/mgb4/mgb4_sysfs_out.c  | 62 ++++++++++++++++++++++++
 3 files changed, 85 insertions(+), 3 deletions(-)


base-commit: eb4ee870747c3a77a9c3c84d84efb64bd481013a
-- 
2.52.0


