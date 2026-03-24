Return-Path: <linux-media+bounces-56866-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yI/tCmx9wmnqdAQAu9opvQ
	(envelope-from <linux-media+bounces-56866-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:02:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C57307D38
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 527563010B52
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B193ED5C6;
	Tue, 24 Mar 2026 11:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="Q3CmIb99"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1263E9F7C
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 11:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774353386; cv=pass; b=mm34Jb/djzH54ufj8fq56CPsSfHbSWqhXKty/nsNG/eBAs+eeNiejaGHlZnmMmXaOvi8RxnF/bg+xyIEMm8TcxG8y4c3KPYnyr8bb9LJxf/cqBpwj9XCGwtjxjuX0QuRHqOoicS/pjWGhwkGINYEgqr3UEwYqVhmsCz6A5t5VHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774353386; c=relaxed/simple;
	bh=iVvZa2UheqThod8hvV1NWglztoLPP+/XFahOrIAdJwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vAIl5LbN1KiKKMFEvFBj9d7rgW3pb8DxKWaeqHLjPK5oVgsBxrjQI1JOSzcN3yv1Kdbx4t7Y1+GYdsyXr3c5SJ6WyQf+Lz0jdyENF9o2Tq5Iath0TdlXHGP+e96knGq20weW3JaaJo4BybkY600pKzXo9pkPR5brvrGVp9wcnSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=Q3CmIb99; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fg7mM4KCtzyVM;
	Tue, 24 Mar 2026 13:56:19 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1774353379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=xmfRrlL2keMbzWSlWElSwxIUrbay5nr7LSTsdfWux1w=;
	b=Q3CmIb990bjQopsx/TicCR4nCbWhVCy01tH9tTuq4ppufWiI3GT1g3j3lOsneFGDgdIA7g
	Hub/ZU0R3EdjkgUj6TwoHu0ETf8iGEbFhP5sT/fofkBeOS2A+Kw49jKa2KdoS4kXWltNAK
	Nwz0AkIpkq3shFPBlXtW/kXY9t8py10=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1774353379;
	b=EnJEfvj23qXW6x0nu/x1u//8p4x/rj6qT2ljRQkCEHlFoC3NjncFUY533ge1YOlDcu+x/W
	sAnbNNkzuoHw9cy7LU8geZ1wIO146XCrhponKVHGhoUX9KeBuBi50shppTs3Y6ivRNgYl/
	KH0u9j3A5FQEdyiON8RaYPOASVacYt4=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1774353379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=xmfRrlL2keMbzWSlWElSwxIUrbay5nr7LSTsdfWux1w=;
	b=b6InNu2jN0yEV2gZJ3HygrKXGObYyK9Gttd8wxv9oFYVFaW0cx+Gwck3V4BX0GKNUz5H9U
	Pzw+8SRQspDfDCf80TnTV+mfdJiHPfVn5/E3oYaeqpHoAN83tAgd+ff52tRvZ71/hwgk6M
	MnSHr+M4vU7sGWmJwpts4QNInxSwhXs=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4AE66634C4E;
	Tue, 24 Mar 2026 13:56:18 +0200 (EET)
Date: Tue, 24 Mar 2026 13:56:18 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR 7.1] T4ka3 and ov2732 camera sensor drivers
Message-ID: <acJ74lFu3QBu4SrU@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56866-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@iki.fi,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: C1C57307D38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans, Mauro,

Please pull.


The following changes since commit 0e2c4117c3512cf6b8f54c2c3d37564bfa3ccd67:

  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30 (2026-03-19 08:18:36 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-7.1-4-signed

for you to fetch changes up to 161a66452cc5e5bfbbb909f7c7ffe4da8ba1a2d9:

  media: Add t4ka3 camera sensor driver (2026-03-24 11:33:29 +0200)

----------------------------------------------------------------
New camera sensor drivers for 7.1:
- Omnivision ov2732
- Toshiba t4ka3

----------------------------------------------------------------
Kate Hsuan (1):
      media: Add t4ka3 camera sensor driver

Walter Werner Schneider (2):
      dt-bindings: media: i2c: Add ov2732 image sensor
      media: i2c: Add ov2732 image sensor driver

 .../devicetree/bindings/media/i2c/ovti,ov2732.yaml |  103 ++
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   25 +
 drivers/media/i2c/Makefile                         |    2 +
 drivers/media/i2c/ov2732.c                         |  790 ++++++++++++++
 drivers/media/i2c/t4ka3.c                          | 1079 ++++++++++++++++++++
 6 files changed, 2006 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2732.yaml
 create mode 100644 drivers/media/i2c/ov2732.c
 create mode 100644 drivers/media/i2c/t4ka3.c

-- 
Kind regards,

Sakari Ailus

