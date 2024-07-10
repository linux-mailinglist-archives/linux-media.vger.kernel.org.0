Return-Path: <linux-media+bounces-14816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7036692CBB4
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 09:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A14A51C22668
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 07:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A82B81ACA;
	Wed, 10 Jul 2024 07:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="S65osOr9"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BA080BF8
	for <linux-media@vger.kernel.org>; Wed, 10 Jul 2024 07:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720595590; cv=pass; b=U0cV3UadUc+23CJYjzHhd8zPzOEHsGV7MCTvZSXfsjNf8Afo4Je3DbbIyQndHRNcKrHBqiLgbCWgPYXmNiyx7FZiDRIRyvXzQCBKuorlrB8QEir7AG81WJy7NUWKVuPGbTL86y9/cFfQYfh358eCdWExB+QKwwmPnudSX/SBxcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720595590; c=relaxed/simple;
	bh=IefreQzQbzRJW4mW6AHo5/ty5/Hp5WL+niyqACex1xU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MRd6cqXKeBpz6X1Sorfcl/fHXWgKCP8LMCuthGVGWXFuK4s5onEI1jgJMB3T4+IgxP+Y4JfUrYXRTD0ROhS1ui5ldVGFD8RowZzF/THQt46F3aLN3s0TFP81LWmuh9UJbvD6ACD5SeyTu95dFlhwYkH9x5x8c7dthQebR2c2hfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=S65osOr9; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WJpwW2sSBz49Q18;
	Wed, 10 Jul 2024 10:12:59 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1720595584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=fOjs1FISBYWq4Al4uPnfegHl02afWIEhluAF8Caqo3U=;
	b=S65osOr9yKwQOrmsnVjOy026fXsLwPX0x6NNyqQUU+J57i9Iyflt1EixfIWHX4PKhqvfcO
	LYqTBr2AZ+xqsLxfJKkFBZmeVxHCLaMUfVbv/4tsPABRBf7ug5D0/TrB3qg4nKFxcFHsOd
	89eU1oXbiKFovTcUXUfit2RhN0lbOgQaJOohDXvr2JsDAtgi52l013qp48C97koZNaOwol
	1SmEpIfKGmH1SPvBZ21JfdcXohEU3NSJ4eAoZhv2TVdbdznEHlfnKUJjsYJ+uuA6k+GWmE
	8AIeWo0D5jdPofsY4emV1fsOeJFMP/pMaXeRHRgLLx7DwtMKYwmvYIieYVGZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1720595584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=fOjs1FISBYWq4Al4uPnfegHl02afWIEhluAF8Caqo3U=;
	b=jjTfH1WeLcZP2S660jWtArEkand4tRQKTT7mK4SHeKe4/mwPKZeEiuxrgAgm+sYZU1POQR
	xfuSTpuaseJw2RHNpb05Tcrtjt8KmoMOgvyhod8h+cK7rhJWmLuCehokA9wp952rWc/XcX
	E4peMOwzL09ZTQMB+ZxO7yRXhVxwlCIGMtSOIVKA73RZGS+7JWzG/VjbyTW67RHrQnKktY
	czLz+OYfpf5H3iVC7VQrxAX5wxtSefCFYkOIz3Sl/LyfEBlc71mUpLf7l5TkR9Dyc2qbog
	A9UIGFYPwsRlobK1qsuwM1hD6P80Gn+8A3S4XfihlRAll8Mopp6vDzMGBx0UzQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1720595584; a=rsa-sha256;
	cv=none;
	b=k7FalmyFHNX/mSjvYeDDfNgx/DhKKgKlXOrcOxmeB1459tOiruqaEgg0g+C3/SDBgjrILu
	TMq76xYcTlgjG2oIzYYc6KQSFHRWAKdbhf1nNwtEELPQP+gkdbtgCPckPA8YTgHMX1lJEF
	H4K0ap9y9datl/HO1wDuAvXiZTDoaPi5Q7kO2/IpDuA7AGkAZsC83CkCe3/Y0dwPJuk0D0
	xxk7F4cJVmWOOCJ0AQsq2HglzEOxgST+RzxvOPrKHd07bxOFMPTj3+r0byGGNltIhmAL7G
	1FagA5iv/orScXAqUafrFHT+FSgRaiCXZ81NiUcnpVwTnLojIDp9bXYbY1lHaw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 4C69B634C93;
	Wed, 10 Jul 2024 10:12:58 +0300 (EEST)
Date: Wed, 10 Jul 2024 07:12:58 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR 6.11] PiSP fixes
Message-ID: <Zo40ekzqEjkpxFVw@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here are a few PiSP driver fixes for 6.11. They should go to rc1.

Please pull.


The following changes since commit a7351f0d3668b449fdc2cfd90403b1cb1f03ed6d:

  media: stm32: dcmipp: correct error handling in dcmipp_create_subdevs (2024-07-03 15:52:24 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.11-5.1-signed

for you to fetch changes up to 93d27da27c2d1449d1c3cd2dee3ae840937836df:

  media: raspberrypi: Switch to remove_new (2024-07-10 10:08:57 +0300)

----------------------------------------------------------------
V4L2 fixes for 6.11

----------------------------------------------------------------
Jacopo Mondi (5):
      media: uapi: pisp_be_config: Drop BIT() from uAPI
      media: uapi: pisp_common: Add 32 bpp format test
      media: uapi: pisp_common: Capitalize all macros
      media: uapi: pisp_be_config: Re-sort pisp_be_tiles_config
      media: uapi: pisp_be_config: Add extra config fields

Stephen Rothwell (1):
      media: raspberrypi: Switch to remove_new

 .../media/platform/raspberrypi/pisp_be/pisp_be.c   |  6 +--
 .../uapi/linux/media/raspberrypi/pisp_be_config.h  | 45 +++++++++++++++++++++-
 include/uapi/linux/media/raspberrypi/pisp_common.h | 39 ++++++++++---------
 3 files changed, 66 insertions(+), 24 deletions(-)

-- 
Sakari Ailus

