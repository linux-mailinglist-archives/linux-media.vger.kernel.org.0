Return-Path: <linux-media+bounces-54895-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAgfNHNtrWme2wEAu9opvQ
	(envelope-from <linux-media+bounces-54895-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 13:37:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8B223034B
	for <lists+linux-media@lfdr.de>; Sun, 08 Mar 2026 13:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C1F603011060
	for <lists+linux-media@lfdr.de>; Sun,  8 Mar 2026 12:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D9836E470;
	Sun,  8 Mar 2026 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="c5mZYHvv"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A852C15A9
	for <linux-media@vger.kernel.org>; Sun,  8 Mar 2026 12:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772973421; cv=pass; b=BlFQhPvOUxRs/r9FO1se9K0YqNRoHfoQv/sUZ5gXZDSus9i8EXrkXMsZr9uTpQrafEWgOz+kALviT5GzlYGzm/SAJGo04PVdtdvqkch9cD6vW8P6QBNWvKTW9ewquAgOT8nXKoYoKeqrkLqfaNoauulxjyN8fp9FEWoI3uxQ1+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772973421; c=relaxed/simple;
	bh=Z+JAHk+cD+mNrivN1HRHip1qn/MXI1IoPxq/R4/5mIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ASBJ3Hf7SsY5rsuDwhiCOpjHkAxjRJ6CtQvvTXV0Q3ENVpjo1vFHOoEJuVnBE+CtUFDB+Q1IoogUvK3UjSDnjL64rXY3xV4a3b6UTje3iA9dZX1itsE2ZPGSBwt+7fWqyM49a+wHCrN+iQ6MU3LR/5ziFcay32mKP1prMF75wXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=c5mZYHvv; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotp5c1dsf-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:1157:8c0f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fTKQX1JyHzyVM;
	Sun, 08 Mar 2026 14:36:51 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1772973412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=8WxwFpwM2UOaqlJItmWh9mviF4Mj7IIF/ABx3Y6qfTg=;
	b=c5mZYHvvLDfqnqiZU18puZV+1FtmuTED2BL99KqaKwI7a6e91LGsgNYSqheoBxiGdJyG5i
	YyrsB2ZvbNIbAXOqBTzO3NRCv6H3O9yIhSjOVWaZ6/AxV+6+R/MsfKZ4lDyhG7n6NXOjZV
	hj/D6tkjyWuWSoFARqpxTxst0ingRh4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1772973412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=8WxwFpwM2UOaqlJItmWh9mviF4Mj7IIF/ABx3Y6qfTg=;
	b=X75ayT5+NS95FhI+Aec0jZxCn5nHiiRvnZxH8xyHipPPCi/OXYQ7T9Pzz/Y4i/L2uX7spR
	d4a3Zlv88azYKYF0uTHmZfZSFGRfzBtLxK8UTNMG2ytoqHVTYaNm3cVm/0NoifTQDbW4oU
	4uFM8sW2cg5bahJ3jUejlCC8qB3U2yo=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1772973412;
	b=qlbwx2whpwWb1prTgI/dAsi7BaG4/st1L10L9KwUZRWFa9pc3unHMYXKskHGUsr1JbyIC6
	3XwpLZ4RGSU9ma0AxJF+bmmvO5D4W9OXwxCyWEhhXg/uzR5tkEHHOFXAeP7Rze0Hm4585g
	VuSRLkQmAPfAoMlp/MqrOjAdY5+D0hE=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 9B211634C50;
	Sun, 08 Mar 2026 14:36:51 +0200 (EET)
Date: Sun, 8 Mar 2026 14:36:51 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT FIXES v2 FOR 7.0] V4L2 driver and MC fixes
Message-ID: <aa1tY8-OHfw0qu9u@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: 3E8B223034B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54895-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.959];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Action: no action

Hi Hans, Mauro,

Please pull.

since v1:

- Omit rkcif driver patches from this one.


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-7.0-1.3-signed

for you to fetch changes up to cac4bba4b17e7142f40557034b546614ef064928:

  media: mc, v4l2: serialize REINIT and REQBUFS with req_queue_mutex (2026-03-08 14:35:42 +0200)

----------------------------------------------------------------
V4L2 fixes for v7.0
- Synopsys csi2rx driver fixes
- MC request API fix

----------------------------------------------------------------
Michael Riesch (2):
      media: synopsys: csi2rx: fix out-of-bounds check for formats array
      media: synopsys: csi2rx: add missing kconfig dependency

Yuchan Nam (1):
      media: mc, v4l2: serialize REINIT and REQBUFS with req_queue_mutex

 drivers/media/mc/mc-request.c                    | 5 +++++
 drivers/media/platform/synopsys/Kconfig          | 1 +
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c             | 5 +++--
 4 files changed, 10 insertions(+), 3 deletions(-)

-- 
Kind regards,

Sakari Ailus

