Return-Path: <linux-media+bounces-56703-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EhcHJouwWmbRAQAu9opvQ
	(envelope-from <linux-media+bounces-56703-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 13:14:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D82CD2F1B9D
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 13:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CBCF5302C35A
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 12:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A203739A058;
	Mon, 23 Mar 2026 12:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="Djj1GnxU"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A0F371CF3
	for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774267789; cv=pass; b=kGTd8EahYG1KIjcYZ2hu8DOmZ9ojOg3W4WtjYlX1tlcr4fBStKr7FWfjoMyXvdqDxi0fhlftGkorR5ai4/0+mjOXjyoVeEyFu6sfXmSNJqsGdv8WDQr+w0t+vESSAXG83+ZqFUtRPzpqjPY+zdJEAiX5BIA/F4nGhMRekpWDBzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774267789; c=relaxed/simple;
	bh=mjf/MkqfcaTdwnKwZqth3fOVpUJqSFi7XwGhPBZEtyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HS4PACMBKvGA5gVt8eR8l2p7M8Rh52G8mMG7LXkJvB6oBrDfg9W8NVb6mwE9VSC9o35/8I0lLYCz9sBvxnfXPzpLjftf7RY2nBD9lYKlLnijC03gIP/iJP55JUwO8BLvrtRbR2QaiC5oDJkpd8n6NNv8tW6oJX2jZ/XCPDEzpzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=Djj1GnxU; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4ffX6K1ByKzyR6;
	Mon, 23 Mar 2026 14:09:45 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1774267785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GHeUTCNm/yyTp/Bc7bY2yqa7i8DK5A5niUZ9z/iy5cA=;
	b=Djj1GnxUx0lPAMdGikEXxUKF2I2kg/zLSnq8Ri462n2W9iCl/PAPLlMOar/pgoBQS6PW+f
	kB48Wj1uRGKd7iAg2+QZuAr+oMexKH3jL0M/aT3cFHEfQ4fUWCY/6cin2dzBniAbyXwvDx
	c7s2lX6Rtwbln07IOpe7KsebCRE/B38=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1774267785;
	b=SZZ23z1CHJ/pPuYbsnMnIo3nQzJCgKsl8Dp1Vy5AhIP107Sl6YS3sU07gjNB/qCC0HLSAc
	HFqCDxr4hTVEF9jOJ3mCZivzvV1jPQQrH7Gi83BXBcb1xcgKV9wehURMznhYT+OaPMNEQ/
	tIm1k6U75KVhB4Y8BnHDlj6BmS3Y140=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1774267785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GHeUTCNm/yyTp/Bc7bY2yqa7i8DK5A5niUZ9z/iy5cA=;
	b=HkcAECwdBwT6V54eHyZlw2Og+5LJX3dqVbqTMwa7uuYEc2U2fck6MDz8ouHdzmj1AkhJBu
	PAuOJ44VaGAQRHVifCnkX2Lnj8+mKSZVMQ9B8oyPVRhHXCM4/NActXskSf/rDX+umuhg/t
	KAjHhnW8iW84IuwJw4qadkWL/D7EZTY=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A0C9A634C4E;
	Mon, 23 Mar 2026 14:09:44 +0200 (EET)
Date: Mon, 23 Mar 2026 14:09:44 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR 7.1] MSI Prestige 14 camera support
Message-ID: <acEtiJ-MSd6qwrRz@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-56703-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[iki.fi];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,valkosipuli.retiisi.eu:mid]
X-Rspamd-Queue-Id: D82CD2F1B9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, Mauro,

Please pull.


The following changes since commit 0e2c4117c3512cf6b8f54c2c3d37564bfa3ccd67:

  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30 (2026-03-19 08:18:36 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-7.1-3-signed

for you to fetch changes up to 84e7c8cc504665fee00f964d3a676e0815982f70:

  platform: int3472: Drop redundant initialisation to 0 and NULL (2026-03-23 14:01:39 +0200)

----------------------------------------------------------------
MSI Prestige (LNL) camera support for v7.1
- tps68470 I²C daisy chain configuration support
- int3472 board data for MSI Prestige camera configuration
- ov5675 and int3472 cleanups

----------------------------------------------------------------
Antti Laakso (4):
      media: i2c: ov5675: Wait for endpoint
      platform: int3472: Add gpio software node
      gpio: tps68470: Add i2c daisy chain support
      platform: int3472: Add MSI prestige board data

Sakari Ailus (1):
      platform: int3472: Drop redundant initialisation to 0 and NULL

 drivers/gpio/gpio-tps68470.c                       |  21 +++-
 drivers/media/i2c/ov5675.c                         |  32 +++---
 drivers/platform/x86/intel/int3472/tps68470.c      |   1 +
 drivers/platform/x86/intel/int3472/tps68470.h      |   1 +
 .../x86/intel/int3472/tps68470_board_data.c        | 107 +++++++++++++++++++--
 5 files changed, 137 insertions(+), 25 deletions(-)

-- 
Sakari Ailus

