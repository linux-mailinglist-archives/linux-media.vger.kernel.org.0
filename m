Return-Path: <linux-media+bounces-12232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAD78D4B3E
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 14:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC0CB1C20DDF
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 12:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D093317D365;
	Thu, 30 May 2024 12:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="Hdr53ojK"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AE76F2F0
	for <linux-media@vger.kernel.org>; Thu, 30 May 2024 12:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717070603; cv=pass; b=IuyUUL8UWNencnGKicPDtfe0/A+WZ5N2z5WiUoCYGs+6pp2k44Ly+Xp712TBwrFV3uZmhPNnp6fPd00dMqRsIt/uyVgddjvYYz14WbOqLuBq3JgZsiK7x8mY6K/QtVgL7fkOZuQP3iUDVhgNK8g0TU0oHmhJmti/PB4Hy5Lr1nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717070603; c=relaxed/simple;
	bh=eNQic8N4SNv5mKdJBBPmCiVorAVyTP9GOA7bcNeW9+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=clqDym05aaum83/jGI1e+/djiLcH7klvs25kpo5QGBCcV7XjV+BFBG676xa8cjRplaaQ5uyGez40O+1DUUEl4VarfuHu2/i1QPIo/2pDTthPObZMmfOlBckuFmzaenT4poYTopP/7tXd5C21qr97IPZLhc/gO2Y+kV3IgrrMnW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=Hdr53ojK; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4VqlJN4x5gzySK;
	Thu, 30 May 2024 15:03:16 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1717070597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=fdl4pm0gIpd891zLdQ9LqSqEkraRG8aVjWPLT+qfTec=;
	b=Hdr53ojKyAtVJEvbOB2hGaTfZ9QEb15f+P4DrknAV9LGILYUaH6ByfZmaP14ayk8RqK0/p
	zZpbeTAZtKeNtvrFW4nD6klWYdXRXgXHZO0sRYJh4XaecnZSWn2efT9KHN1a+g+4vmo8Jq
	JsrA5lnFQhjtgK5WULtrgO2knG6pR4M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1717070597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=fdl4pm0gIpd891zLdQ9LqSqEkraRG8aVjWPLT+qfTec=;
	b=PwPOT1XH+1ogq6JD6z6y5ZF9hbSUZ+Iiw+2wZsheEw7Cc+Zcvl1RqlEQXNEP2zU6FaRui+
	VvHrB+0p8uXbGq8AeRVG7w5c1AvSnvbAvfSTR+gqCCC8FeIneg4Git8XcMqJG4+imiJQEs
	uMzN9tqyCX6yu/WVDLuVTVeU9BJ/T0Q=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1717070597; a=rsa-sha256; cv=none;
	b=XHbMVBs0oG/kdOzxE0/UIndsVm8ompUFAaST/Uk74PavbDM8Yfn2cCz7B1P2FCUmuev2C4
	yUdC5gd1USEZVnNWj4hRtG6hP8D5TyB/Den0YPq1iHhoHL3TT9FJhMhAs1JXQ1svzrIyEm
	cdREtlcRoxHwsQ2nLu7N/0HTcTgltlM=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id EB88E634C93;
	Thu, 30 May 2024 15:00:03 +0300 (EEST)
Date: Thu, 30 May 2024 12:00:03 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES v2 FOR 6.10] MEI and IPU6 fixes
Message-ID: <ZlhqQ73lyeKzGDlS@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here are two fixes for both IPU6 and MEI CSI drivers.

since v1:

- Fix spelling of a struct field in "media: intel/ipu6: add csi2 port
  sanity check in notifier bound".

Please pull.


The following changes since commit c19fa08c1414644b0d9275d336bdaff90af57d0b:

  media: intel/ipu6: fix the buffer flags caused by wrong parentheses (2024-05-28 08:00:14 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.10-4.1-signed

for you to fetch changes up to a57d007327cc8aad5c759131fb291563977957a9:

  media: intel/ipu6: add csi2 port sanity check in notifier bound (2024-05-30 15:00:07 +0300)

----------------------------------------------------------------
MEI and IPU6 fixes for 6.10

----------------------------------------------------------------
Bingbu Cao (2):
      media: intel/ipu6: update the maximum supported csi2 port number to 6
      media: intel/ipu6: add csi2 port sanity check in notifier bound

Sakari Ailus (2):
      media: mei: csi: Put the IPU device reference
      media: mei: csi: Warn less verbosely of a missing device fwnode

 drivers/media/pci/intel/ipu6/ipu6-isys.c | 6 ++++++
 drivers/media/pci/intel/ipu6/ipu6.c      | 2 +-
 drivers/media/pci/intel/ivsc/mei_csi.c   | 5 ++++-
 3 files changed, 11 insertions(+), 2 deletions(-)

-- 
Kind regards,

Sakari Ailus

