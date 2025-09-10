Return-Path: <linux-media+bounces-42159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F6BB510CE
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 10:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F925487F5F
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 08:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC2D30E825;
	Wed, 10 Sep 2025 08:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="GwWkDa/K"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C85830E857
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 08:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757491903; cv=pass; b=acXRDLgUPEFca84n6UQCRde+8T2FaNFAny/FDjvc/ALRnFTMBCxZQFDqOWQOqWL6PSZi4cRyEt1BHyRCAAiT4BGB6mCK0WrgAtI3TNbl22kojxSg/pFOKzDZRnTv02LEvod2bn4ShOs576m/MJs2uqDoPmHM5z2oL5zpY/aeFRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757491903; c=relaxed/simple;
	bh=oJR8R4cZLGmwJAf0tzeVV8Bi3/59YwDuTboLuegckZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=grdNffgvJ8DonGA3ujMDIMrIoquNrRxOUsR9cF+sNikbUfg6aa2xYkBAX+iQw5dLD+w4Jw0XClfj13auIvPUT/CMlaFikR8Xwp3HN2+H+vTAKYD5slMUXXx/C6EcmaB2nNxO2cbF7h0Ae9C6dFfZZZId/EAJggUQ533/7wDIXHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=GwWkDa/K; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4cMD0w5RcZz49Q47;
	Wed, 10 Sep 2025 11:11:28 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1757491889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=J85qdo5VJ6C7744pUrZJM5rYiGma8cv+Q6DQHRjzN9Q=;
	b=GwWkDa/KCCjdmYIydReyFW4YxsZvNrRmOYRgrEYbXHKJXtQgYTybq5cyAU00wTUN5juDr1
	D/8PNlMUVuMbds07XfIbrfJtCfdD+PpJLRhV3dhapfFxDUzVsY0xuTXHE1uueNjsRWQXPd
	xqfL09i1JM7aiqQ3yc2F+oGoIwH9FX2LE8iH6oPLLBAz3Zi6ew7C60oL/2PHKwxGghL612
	NhLqOqTJX6KyEwtJD8a3DkYabxqIMozNDDNFBBC+d1SjhdO8BwUu8SEhpJIq18jqeFUkDQ
	6Nr90IGEg7NOKnIgzBcHnM3F/KtKQI7bEML7JdhdMSI03Sa8abVv2IJFL8aCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1757491889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=J85qdo5VJ6C7744pUrZJM5rYiGma8cv+Q6DQHRjzN9Q=;
	b=tS4IVPh6isiHZtWp4Ebo+SmNB2awPwoFT+jFdE5Ctws8H+vAjxIlb/zjrXZznVyuPBYBO9
	nTEvjKvc28qMMiYcHkOs08KCMCNQLvdL58DRThqeYfaQHwpyXUm5gjjyM8qlIxkF1h+QsG
	8nMTuw3qZZaa6vxhJKgkjHSO7AJLiKsRymwXg+AnkJhYPi9bdI9k5gXAA7mq+82y4shGM/
	uxduPuUKbcaDgxeGZVjX4+1KPUTEfd05GYaWHI67QcE6y0+5zhVFmlqoxUe9dLxrMQ3J0Z
	XPNZGO+IcBovtXD4bqzOfgl9eDFhPLQkIE63CbQvgk6/iWuVOrA2JFC1SS9Y/Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1757491889; a=rsa-sha256;
	cv=none;
	b=BISnC0Smuv69GtZo4BmMo4R785jT9fxvfuk92eEmlQ86petJ5k79z69i7iCNBUmGCon9Nu
	SR6kAZ3s2fP9DCaQgYJzo0PAvD/P1Oxow7Ci5EKyl9xjgQPmktO9QUNt8oSSTdKWImzld5
	yUtyuOeI+ynpPdZkgfLi6WWJgo3cvpOWquokVcnwS/zwTOGF0UDYnpgz8w5yp0rbvlGrks
	DIFR9VTcxtsoUzIXP0YVPJInsnr/FZI7qgo4QFObjEuWNqKuNJ4eyYerezwBjw6U04t6e7
	nrmet9G/5KLY5LvJyD0mkq3H053qrSBUsBqo+tXrFQx2oM2j5/N/s6aS5Ww5cA==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 3D3A3634C93;
	Wed, 10 Sep 2025 11:11:28 +0300 (EEST)
Date: Wed, 10 Sep 2025 11:11:28 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR 6.18] V4L2 fixes
Message-ID: <aMEysPGvJDsLS9gZ@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

The following changes since commit 4bd8a6147645480d550242ff816b4c7ba160e5b7:

  media: vivid: fix disappearing <Vendor Command With ID> messages (2025-09-09 16:12:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.18-5-signed

for you to fetch changes up to 4a31416a3d53863f9c9052ecfdde7997ebf47076:

  media: mc: Clear minor number before put device (2025-09-10 10:04:07 +0300)

----------------------------------------------------------------
V4L2 fixes for 6.18
- IPU7 runtime PM usage_count fix
- Use after free fix for 9e14868dc952 ("media: mc: Clear minor number reservation at unregistration time")

----------------------------------------------------------------
Bingbu Cao (1):
      media: staging/ipu7: fix isys device runtime PM usage in firmware closing

Edward Adam Davis (1):
      media: mc: Clear minor number before put device

 drivers/media/mc/mc-devnode.c                | 5 +----
 drivers/staging/media/ipu7/ipu7-isys-video.c | 1 +
 2 files changed, 2 insertions(+), 4 deletions(-)

Please pull.

-- 
Kind regards,

Sakari Ailus

