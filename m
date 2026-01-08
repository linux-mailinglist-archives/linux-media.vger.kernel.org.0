Return-Path: <linux-media+bounces-50233-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 671EFD032CC
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 14:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83A6B3018319
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 13:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2322247CC8A;
	Thu,  8 Jan 2026 13:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Hjy6bS9q"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14FE4792DB
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 13:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767878235; cv=pass; b=am8FSoaiZQp/ui8us8HPaMRp2UOZ+uJHmc9CUHDGU0Q5kN37eOAI9rUEf0B618FGud9AheQ/c77cLu7i9FRzxmktbr042apfT3Hlu8Z2hUhSqeS6x2iypwe04OUKcuAdI6RQPfmMAqlGTHkFqe/UJzVhpDgErHNx7YOvQDbIxv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767878235; c=relaxed/simple;
	bh=QYZf31+2OJfCYO+xlk0D123PkhlkMVmuiInd68bVFEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NuOH0arbgZedFpg+XaORp33nVxuY/1lXF7UHmrJ3FdIo+MNpESfGWOIcRNG5XsKmDQe9I2NzLq6tgFGL8DQshOYWkNNfByOMjMAgJUJc/3VV1puQXD2x8Tw7s8RtZWXs1BBw7PUbHAzpnkJjmwFwze4biGfXHnBDtGKnkwW1Zpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Hjy6bS9q; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4dn56843Rfz49PyQ;
	Thu, 08 Jan 2026 15:17:04 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1767878224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=GIHolgMtg1f11poZTchuQgefE6BoOYoJpBVtUHWcdAQ=;
	b=Hjy6bS9qcxVeaNZoVy3zlP/qK2hCOfc5J5r3l6tKUMBVu511SCY/EXx9pRS1rgQZmCPc/P
	9NU2ANjDZDQcz5IyLhbFuYOX9oTLTK4d/W19Dilk9wvUstlPR/tgPPdbHmh3mpzBUHwZw8
	c9MQfyArL6mpfzwhs9SIYwKAVOdIvpTZjODOV0uDQ2aX6vfmDU8gImkcIIopJwvr3gKgF3
	JmN0eTo7aggZsTQYh0YXH//LhQo4xVaYfsyJho2cy4UOqIkZdHe1mNbscil4EN914YmVFh
	66Vx6r5I0u7TRXeYNHMou4rOMDUlWw44l91dYoRKTt7tBPKJ4nJ+xavfyHMJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1767878224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=GIHolgMtg1f11poZTchuQgefE6BoOYoJpBVtUHWcdAQ=;
	b=UvPExqP5bs/mRvbQfixUdr3lxMnKrxo5htndh68bbJTGfDJWNosAliv1q73wa5Gk4co+/Z
	MlMHDGy10igLJT2pEZ3MTwz66J07VDhVtQWjNGdXUUe+j31Wwi2Z7+38rJJwYMPmAwkmlY
	wBSxYU8lejqhPhuq6/qpx08tnHutTg95wWltU6fDmzorFm8G1QzaQ/jM4SmLVwWhLst0rw
	NgOiw7P0ItVhqP9ork1/qfX7B2K5X4L7QN65HtbFcNzOEx02lCEnSjtzgGszuocsO90NGl
	kY/Gi+tzkG6lZThJpWaHQbKhJsaO6Wm35M/qu+tAZaViPx3tkdexEtDmsD1r6Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1767878224;
	b=b53pfuZpnJbK0JydrwL8+VoSFFmp+dvOf/Brytl6N12WGfXoCWt2F1jAUDeFPCUqE0B00Y
	IKroQoNMvAJFecfES+r1cjhOO24ukyu18vwbBe6Rv51txWmJjnufwDmk5sZUBpsh3ef5mv
	ScqrMEwB5BKGECfeUM8qQPLjnlZZBpGL/hI3oXUdmQSv90SUfP/RRNm2vB0WFzZp81TfkI
	lTotjfTPJhVVf+/R/yU+ZxDohlZ2vavkBlP4BGRnvgViMH8gDSn7JYRqjImsSJj/zNlMTn
	8+gGz6ljNmjxa/hKLUFDa/ZUeLilfQmT3Yj1817z52BRWH4gKXLSqbzT4VAKcg==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1549A634C50;
	Thu, 08 Jan 2026 15:17:04 +0200 (EET)
Date: Thu, 8 Jan 2026 15:17:03 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl
Subject: [GIT PULL FOR 6.20] IPU6 (and 7) fixes and preparation for metadata
Message-ID: <aV-uT6d8iSyiHkeI@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Please pull.


The following changes since commit 336367fab9b96db7b0ee174443c426fc6c53b912:

  media: chips-media: wave5: Fix Potential Probe Resource Leak (2026-01-05 15:56:32 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.20-3-signed

for you to fetch changes up to 8fc07882ef41192cede75a8e1444269188394157:

  media: ipu6: Always call video_device_pipeline_alloc_start() (2026-01-08 15:13:13 +0200)

----------------------------------------------------------------
IPU6 cleanups and preparation for metadata for 6.20

----------------------------------------------------------------
Bingbu Cao (6):
      media: ipu6: Fix typo and wrong constant in ipu6-mmu.c
      media: ipu6: Fix RPM reference leak in probe error paths
      media: staging/ipu7: Ignore interrupts when device is suspended
      media: staging/ipu7: Call synchronous RPM suspend in probe failure
      media: staging/ipu7: Update CDPHY register settings
      media: staging/ipu7: Fix the loop bound in l2 table alloc

Sakari Ailus (14):
      media: ipu6: Ensure stream_mutex is acquired when dealing with node list
      media: ipu6: Drop MMU hardware initialisation in probe()
      media: ipu6: Remove redundant driver data checks
      media: ipu6: Make symbols static
      media: ipu6: Remove redundant streaming start via buffer queueing
      media: ipu6: Don't check pipeline in stream_start
      media: ipu6: Close firmware streams on streaming enable failure
      media: ipu6: Always close firmware stream
      media: ipu6: Drop error argument from ipu6_isys_stream_start()
      media: ipu6: Obtain remote pad using media_pad_remote_pad_unique()
      media: ipu6: Obtain unique source pad from remote sub-device
      media: ipu6: Remove source_entity from struct ipu6_isys_stream
      media: ipu6: Drop custom functions to obtain sd state information
      media: ipu6: Always call video_device_pipeline_alloc_start()

 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c   |  2 +-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c  | 73 ++++++++++----------
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.h  |  1 -
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c | 36 ----------
 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.h |  4 --
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c  | 88 ++++++++-----------------
 drivers/media/pci/intel/ipu6/ipu6-isys-video.h  |  6 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c        | 21 +-----
 drivers/media/pci/intel/ipu6/ipu6-isys.h        |  2 -
 drivers/media/pci/intel/ipu6/ipu6-mmu.c         |  4 +-
 drivers/media/pci/intel/ipu6/ipu6.c             | 10 +--
 drivers/staging/media/ipu7/ipu7-buttress.c      | 17 ++++-
 drivers/staging/media/ipu7/ipu7-isys-csi-phy.c  | 13 +++-
 drivers/staging/media/ipu7/ipu7-mmu.c           |  2 +-
 drivers/staging/media/ipu7/ipu7.c               |  6 +-
 15 files changed, 113 insertions(+), 172 deletions(-)

-- 
Sakari Ailus

