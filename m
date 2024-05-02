Return-Path: <linux-media+bounces-10583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 844F68B969B
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 10:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 303301F21FB9
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 08:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F81846544;
	Thu,  2 May 2024 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="s7riFSYF"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3208D1B299
	for <linux-media@vger.kernel.org>; Thu,  2 May 2024 08:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714639335; cv=pass; b=L/+s0h4vh2odiX0sV+0wT90veexowoHrjxaEPvPh4BAyEP1DhADrbziqrI/vReDvA1DtkV69dphaIak1e+Sk9k8MNkw0pQXRHbecCZ1s9DAjf1BEkMnCYfQK9CQqRLjNvJ0Z/N74F2C7hErKL2x855sFS2xHubBCMicMjP3TNCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714639335; c=relaxed/simple;
	bh=VaPtE38zOZqbq2GhIJKjEPsAFGrE4P0l+gZ+m9j8meI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kLcSLgjCuItJOecEVABRFyqtYyRH26aZekicPZbUBmdfBWIKCcA25WEYw5I3idq6gLO2cA2wwodjIT3dB111XWEJnGeUf45tfBiR76fYJgWnC92gsVKS8GXufYVe9VZGIznOoWpqCa+tibD7skiEkcqNkU2mrlTdaOxdT+ERBhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=s7riFSYF; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VVS255S8Yz49PvR;
	Thu,  2 May 2024 11:35:57 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1714638958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=7/r9nRCQgpi3UIxTprtpVvSn42q8ihtAxNm/98plbeg=;
	b=s7riFSYFV4M8WaBiCqalTRXenCaJYnYR3vtrtwX/QJ0CtBYJirLvdHTrGGek7i13vpbI/5
	5n++yxVhRkvNHhQrMlxWBljWyvmSK0PhfQdBXfc++DIVwf9YurEKEAz/H3gvaAVaEu4l2t
	o6mnpuzu/vedBIcGhZtEHkMpuKeBwm+Kgf9AxiTz+hO4sz1rwfbQchMvhyNx2pCYNIkJ1J
	QrJhTGEv52cxwJyfaZDoyCdZQr+8EtOMGelVW2QNS3g9ZyvWPt+sjO8C7tLdLfsoFK3y4z
	kbMzuKl804U0SieE0qnipLDwM5aR1hsgqMR1O2x5kauFZpIw1gTWpJ/B/ScXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1714638958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=7/r9nRCQgpi3UIxTprtpVvSn42q8ihtAxNm/98plbeg=;
	b=q1hg7YcVbsLJXb/2ZeqNGxgUxYmA9iteO/IwYUQXkz50AKjpammqgHoJGlk1UzRbIoZKKv
	z+hzyItZRQAsyHe11XbZWH1WuRMkVBgktBxImGzyfbZxqB8vDi722KkpDoNileX1AM+IZt
	CTJMfUArEm3enduTpu18NhEFpIN9q0Cn+gDXpWonfKEi6c2GNPKbDWKlqCegWvdjPctrO/
	rnvfSN9nYqLoTdMvMB6V0bE9T3PK3TRNIIKdteSQmscCzUWcXCr5uiKJ3VaC/EtiN5VrqQ
	ikfUfVDrNsOHyM4WYqxpz6Htb1XdLOienqcA5f7got5hu2Hu2rqpURae83RdMg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1714638958; a=rsa-sha256;
	cv=none;
	b=BkrIZZuQIEpOsRQxdyCKBzahf5zSpbOIbUG5L+XaPqt+BbvF7l/9wob2xf0SLAYZDeEEak
	UngSWUnBMje5Uu+hyZg6tVhjfy14PmpP5XZcl5/z4KOdigxIcd0BbyC3tS2XXYQR+OYPJA
	507AcxA520tvl5haNBLFswS4itIInKkAkEzkayfH21bUXzAghdakx8EJW4ygCPt/wO6G5z
	2Z/4b+p/SpCErQ815UWDOAiJgOuQi4/G5VGiQNGe4LRdDn0OAJY2z8BVa7KJQkk3ZbNJaU
	58hW5RuMDCNXxuUkJTi7f7wG7V8M2MPIsP2ipureWL8FPooTJkTyMoxyt+GLQQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 5FFF1634CA5;
	Thu,  2 May 2024 11:35:57 +0300 (EEST)
Date: Thu, 2 May 2024 08:35:57 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [GIT FIXES FOR 6.10] IPU6 and Unicam fixes
Message-ID: <ZjNQbS9CF1U6lGWx@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here are a few fixes for the IPU6 and Unicam drivers, for issues found
since merging them. Most are are due to Kconfig options.

Please pull.


The following changes since commit a1c6d22421501fc1016b99ac8570a1030714c70f:

  media: staging: max96712: fix copy-paste error (2024-04-30 14:33:08 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.10-1.1-signed

for you to fetch changes up to f28348ebadf7c7127646672f363e055cb19f3b66:

  media: intel/ipu6: Fix build with !ACPI (2024-05-02 11:34:26 +0300)

----------------------------------------------------------------
IPU6 and Unicam fixes

----------------------------------------------------------------
Laurent Pinchart (1):
      media: bcm2835-unicam: Include v4l2-subdev.h

Ricardo Ribalda (4):
      media: bcm2835-unicam: Fix build with !PM
      media: intel/ipu6: Switch to RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS
      media: intel/ipu6: Fix direct dependency Kconfig error
      media: intel/ipu6: Fix build with !ACPI

Sakari Ailus (1):
      media: intel/ipu6: Fix vmalloc memory allocation

 drivers/media/pci/intel/Kconfig                  |  3 +-
 drivers/media/pci/intel/ipu-bridge.c             | 66 +++++++++++++++++-------
 drivers/media/pci/intel/ipu6/ipu6.c              |  6 +--
 drivers/media/platform/broadcom/bcm2835-unicam.c |  3 +-
 4 files changed, 54 insertions(+), 24 deletions(-)

-- 
Kind regards,

Sakari Ailus

