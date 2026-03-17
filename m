Return-Path: <linux-media+bounces-56035-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGvgJ7squWmVtQEAu9opvQ
	(envelope-from <linux-media+bounces-56035-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:19:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7C22A7BAF
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 11:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A46F3026C04
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE90F39F184;
	Tue, 17 Mar 2026 10:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="jkQSDJIL"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02DB391514
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 10:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742534; cv=none; b=p4vzH//w2+kwUro0062IovEgTwzsfapsk6WXj+KLkKkhNp3suBhjLlXPG6fVLU2o65VYOUGJ9WMyhOS3oIFUpBxNtI/vR9cGWsHX8rAmS2U/BnNH20jD36FpYOQwJ/cc56dbotPH7GN/UbxtsH1d/X13TgFopAdq3ilixSf65Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742534; c=relaxed/simple;
	bh=5s6/MVPBa/PDFG3w2KZmBi+NTbvARtRKFqHlcyblwfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aC28fGLVyfxN4uDFv8RnXIp3DqwRhkSe5HTRmy3j4aXKDBMwGM1dOv/hvray2HAX6nhS64bAqY6kc+OnGu7C5vF3s7Me4m4ODEX5Wa/Q/XWX5AxnrX5BoABt/3g/nKEq/qD4VAnWTXOqBp64TuF9didFX7sf3V+qog59MPV6Ksg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=jkQSDJIL; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1773742072; bh=5s6/MVPBa/PDFG3w2KZmBi+NTbvARtRKFqHlcyblwfE=;
	h=Date:From:To:Cc:Subject:From;
	b=jkQSDJILb6PcjvhEnKm7iqLieWUGGEq0TV7P+WbQVYY0ZsN3YH+Id+TajBZIiIfNj
	 d7MCFTkEZCep8hlDNHmGLv+Txy59S8c8UohwQJl3/9pU2uENqMsJTyvU1qLQNSna+5
	 C9/NUzLHtVy8njmJRazUa+FvhMJPgYGzez7tirwXrxiHeavkCijQswCJilEaa4yICA
	 wF4Sntsoom/7jC4v5K9C4o4oLxFk80lz0CnQhVz5+bvH5qqtKHYZAyGgI7Kuw7j2YS
	 uO+CyiaZ8/+hQlqY3zo6az2dcGc75Skt/Detz0gW2aCnEQV+iag/5NJtJQOJxIDQLp
	 23wZgEJE63t6g==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 9CEB81011A5; Tue, 17 Mar 2026 10:07:52 +0000 (GMT)
Date: Tue, 17 Mar 2026 10:07:52 +0000
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Cc: Johan Hovold <johan@kernel.org>, LiPeng Huang <huanglipeng@vivo.com>,
	Oliver Neukum <oneukum@suse.com>
Subject: [GIT PULL FOR v7.1] rc updates
Message-ID: <abkn-HMemFZe9C4p@gofer.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-56035-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mess.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ED7C22A7BAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, Mauro,

Please pull for v7.1.

Many thanks,
Sean

The following changes since commit f6390408a846aacc2171c17d88b062e202d84e86:

  staging: media: ipu3: fix function argument alignment (2026-03-11 01:05:38 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/seanyoung tags/v7.1a

for you to fetch changes up to 57128505048b75fda7e69928c9c96ec7304e170e:

  media: lirc: increase IR_MAX_DURATION to send extended code sequences (2026-03-13 16:26:25 +0000)

----------------------------------------------------------------
v7.1a

----------------------------------------------------------------
Johan Hovold (2):
      media: imon: drop redundant device references
      media: mceusb: drop redundant device reference

LiPeng Huang (1):
      media: lirc: increase IR_MAX_DURATION to send extended code sequences

Oliver Neukum (4):
      media: rc: streamzap: Error handling in probe
      media: rc: xbox_remote: heed DMA restrictions
      media: rc: igorplugusb: heed coherency rules
      media: rc: ttusbir: respect DMA coherency rules

Sean Young (1):
      media: rc: fix race between unregister and urb/irq callbacks

 drivers/gpu/drm/bridge/sil-sii8620.c        |  1 +
 drivers/hid/hid-picolcd_cir.c               |  1 +
 drivers/media/cec/core/cec-core.c           |  2 +-
 drivers/media/common/siano/smsir.c          |  1 +
 drivers/media/i2c/ir-kbd-i2c.c              |  2 ++
 drivers/media/pci/bt8xx/bttv-input.c        |  3 ++-
 drivers/media/pci/cx23885/cx23885-input.c   |  1 +
 drivers/media/pci/cx88/cx88-input.c         |  3 ++-
 drivers/media/pci/dm1105/dm1105.c           |  1 +
 drivers/media/pci/mantis/mantis_input.c     |  1 +
 drivers/media/pci/saa7134/saa7134-input.c   |  1 +
 drivers/media/pci/smipcie/smipcie-ir.c      |  1 +
 drivers/media/pci/ttpci/budget-ci.c         |  1 +
 drivers/media/rc/ati_remote.c               |  6 +++---
 drivers/media/rc/ene_ir.c                   |  2 +-
 drivers/media/rc/fintek-cir.c               |  3 ++-
 drivers/media/rc/gpio-ir-tx.c               |  4 ++--
 drivers/media/rc/igorplugusb.c              | 17 ++++++++++++-----
 drivers/media/rc/iguanair.c                 |  1 +
 drivers/media/rc/img-ir/img-ir-hw.c         |  3 ++-
 drivers/media/rc/img-ir/img-ir-raw.c        |  3 ++-
 drivers/media/rc/imon.c                     | 16 +++++-----------
 drivers/media/rc/ir-hix5hd2.c               |  2 +-
 drivers/media/rc/ir_toy.c                   |  1 +
 drivers/media/rc/ite-cir.c                  |  2 +-
 drivers/media/rc/mceusb.c                   |  5 ++---
 drivers/media/rc/rc-ir-raw.c                |  5 -----
 drivers/media/rc/rc-loopback.c              |  1 +
 drivers/media/rc/rc-main.c                  |  6 +-----
 drivers/media/rc/redrat3.c                  |  4 +++-
 drivers/media/rc/st_rc.c                    |  2 +-
 drivers/media/rc/streamzap.c                | 19 ++++++++++++-------
 drivers/media/rc/sunxi-cir.c                |  1 +
 drivers/media/rc/ttusbir.c                  | 15 ++++++++++-----
 drivers/media/rc/winbond-cir.c              |  2 +-
 drivers/media/rc/xbox_remote.c              | 14 +++++++++++---
 drivers/media/usb/au0828/au0828-input.c     |  1 +
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c |  1 +
 drivers/media/usb/dvb-usb/dvb-usb-remote.c  |  6 ++++--
 drivers/media/usb/em28xx/em28xx-input.c     |  1 +
 drivers/staging/media/av7110/av7110_ir.c    |  1 +
 include/media/rc-core.h                     |  4 +---
 42 files changed, 101 insertions(+), 66 deletions(-)

