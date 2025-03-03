Return-Path: <linux-media+bounces-27424-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0B7A4CDE6
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 23:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B82E91896083
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 22:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A9322ACD2;
	Mon,  3 Mar 2025 22:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="aSzHfkiF"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591F01EE00D
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 22:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741039864; cv=none; b=Gaq2MJt/gXGrSuu5m2ymAu6MTw9RpOVUCk8xbAPwA6ykg8E3lFKc6LYcSZmEqw7dTF8WGuNnoKGgBaBoSzez3bNIsUMQe+WhwxZkbxW3AcmvCLHFGBFwjYP+G9+YphLN4GmecoNLae4LtfQJycAnHUuBFVLDtvWHIPwTBFgeagM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741039864; c=relaxed/simple;
	bh=5pS6tnByjOEnN16dS/gVQkUcUEPqG95XbwhzEUksmRw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gt0C2sf+R4/vtxbnDiw5DIRaaZitpbdbk3psB3TxTEukCtCogWZc2uJEbOCXeyZtgzBaC6G1RVPRb9d0Jc/36ciIiiEzaUwNbV3wJm10jaAqyhxSI9/qOhk/ySwvaxJkKxE+WRPSHnYZEWh69yj1UF22Ctx0AUhcB4R2JG00YSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=aSzHfkiF; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1741039851; bh=5pS6tnByjOEnN16dS/gVQkUcUEPqG95XbwhzEUksmRw=;
	h=Date:From:To:Subject:From;
	b=aSzHfkiFiYOcwbW1+zKqyYGr+fTzynqIARYj2/TGAiYLOmzj0pyCv/Qfy09oKQ8Eb
	 PkOv31s3uT/PNijw+WuGF+QYJmEBqmduL/4LmOkAFIvVw2cnY7QcpbjgJIwKajUh2s
	 dVSgJ4FNXw+Ck9Y6PSTNMNYIGUTXpNFLwhfJit51rzvjg2KnCtJ2/2Nack1f0lSZ+7
	 Tspo5fi6OJZr8uGmJDvRV0p4VNDPPrfr5GKGMhlMLX4EmEHES13Y3zukYxuhsn4TV5
	 TbiMHJpqmQMlVYELfY9MaZ0LzEfBnMPkXM3jchdWHyyHde7jPGbWMXLfnBGZP+O50p
	 99w2CjtcmTvog==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 49E381000D6; Mon,  3 Mar 2025 22:10:51 +0000 (GMT)
Date: Mon, 3 Mar 2025 22:10:51 +0000
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR v6.15] AVerMedia H789-C PCIe support and rc-core
 structs padding
Message-ID: <Z8Yo66dqF4VzBiD9@gofer.mess.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

CI passed here:

https://gitlab.freedesktop.org/linux-media/users/seanyoung/-/pipelines/1376882

Thanks,

Sean


The following changes since commit f4b211714bcc70effa60c34d9fa613d182e3ef1e:

  media: venus: hfi: add a check to handle OOB in sfr region (2025-03-03 18:21:55 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/seanyoung tags/v6.15b

for you to fetch changes up to 2b75dea32b94c3f1f6d38f37e0d67f56c32714ac:

  media: cx23885: Add analog support for AVerMedia H789-C PCIe card (2025-03-03 20:43:38 +0000)

----------------------------------------------------------------
v6.15b

----------------------------------------------------------------
Plamen Atanasov (1):
      media: cx23885: Add analog support for AVerMedia H789-C PCIe card

Sean Young (1):
      media: rc: reduce useless padding in struct rc_dev etc

 drivers/media/pci/cx23885/cx23885-cards.c | 30 ++++++++++++++++++++
 drivers/media/pci/cx23885/cx23885-video.c |  3 +-
 drivers/media/pci/cx23885/cx23885.h       |  1 +
 drivers/media/rc/rc-core-priv.h           |  4 +--
 include/media/rc-core.h                   | 46 +++++++++++++++----------------
 5 files changed, 58 insertions(+), 26 deletions(-)

