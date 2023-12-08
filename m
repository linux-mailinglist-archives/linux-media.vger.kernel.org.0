Return-Path: <linux-media+bounces-1980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B12480A743
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 16:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF8D91F21421
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C800F30338;
	Fri,  8 Dec 2023 15:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TzKRwSaD"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 880D2FB
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 07:23:34 -0800 (PST)
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6323D66073BB;
	Fri,  8 Dec 2023 15:23:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702049012;
	bh=2hmEkOFlvxb1HmCJuOEyHJu+AzUF7YT2z5jtCxYzrYM=;
	h=From:To:Cc:Subject:Date:From;
	b=TzKRwSaDeJl6TT45JMzKlGF1T7VboMhAuOaVErbR+rFLhWV+riBNP3hTEyStmwgsr
	 zLAb5DEyDlgVaMNdPzXSwu7V/VY2Xqeg3PGENvB1heisARLvPx95FfmpoDJgCvAhXh
	 qpMhhzbKNxLJIc8QmNYopyRUBt8UwDWdx3Z54FAF50tCkD+v/4l9Lbd1vf9z32QX3M
	 SLptv73Dz9P1+ywlAOkH6QcqTMHbBUQVwzpUQ1NCLCMDD90m/lhDNsaP3ZAK1bMhLy
	 /PLPsHoR62KWkXGgkWtosC6ifiEhVYGi+cZ3uqKfDNRl7KEa8+qR0Lwzu0ruGrwXtb
	 Rd1yw34RfxrvQ==
From: Julien Massot <julien.massot@collabora.com>
To: linux-media@vger.kernel.org,
	j-luthra@ti.com
Cc: kernel@collabora.com,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 0/3] misc improvment for j721e csi2rx
Date: Fri,  8 Dec 2023 16:22:52 +0100
Message-ID: <20231208152255.472467-1-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series:
- Fix media link issue when the remote subdevice has multiple output ports
- add support for Grey format patch 2 and 3

Julien Massot (3):
  media: cadence: csi2rx: use match fwnode for media link
  media: cadence: csi2rx: add Y8_1X8 format
  media: ti: j721e-csi2rx: add GREY format

 drivers/media/platform/cadence/cdns-csi2rx.c          | 3 ++-
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.43.0


