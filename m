Return-Path: <linux-media+bounces-15423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C70FE93EFED
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 10:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85AAE283023
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 08:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF0213B299;
	Mon, 29 Jul 2024 08:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="n0ckzbqC"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DDF12E1C4
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 08:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722241922; cv=pass; b=U9fOlraemkuUSVIf8plnBNSyN/+N1BN7hkPahAKZAcFiqpww/y9eLMLQyfAdGYm+/VqLNT2IxiFpvJDmRzA15qNwHJg0ee2C5vejHoDRMSOpcK0pgKxWMcbw/BgEurmpUvWBtBxeDB9hONT5WHnS83ywFnHar7MCxeDtqHjqk1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722241922; c=relaxed/simple;
	bh=dBxNZ8IXs3Q+F1KTUPojN3XBV6D8pvXEM1vjH8KKE1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hLHD/yWSSM/BrIHWUnPD0Nyxj+K5w1vfrdL8a+pTfsT0R4Lx36xsVr3U+EMOt4WC1ZQJHh1zjMQRlcIRO7KaLVhzDQGvXCzFiK/Ri1+E0L62K+iwql9a5lHWwDOcLwL/Hlbca6tZ+hIx9kj31Q5J24uzQB3PwvOPoFawaY9EH04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=n0ckzbqC; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WXWmk4GtDz49Pxq;
	Mon, 29 Jul 2024 11:31:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1722241910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=uP/GBdJUUmhV0FVpsGA5+6glu223VrsVsIuY5bj6KJQ=;
	b=n0ckzbqCh8aIo1jEtN4zv4yS8yXQqBs01JZyciY+vjTqd9Y/e5F17UMlNHTJprbE89iwxZ
	8lsWdOkTRLUk+OvnBfZQSDkqYWVKLM7vGGLQNLVUK1QASzxnowx4H6t6sAF6fIJBFuknWU
	rJtec+oFZWm5QzzetZLWaq7i+W44yBlsK/cSRzbJquHesGaZDCDbFG60GpkdrBy32tmjdE
	iryOO8+OU+tV5fLuXwfuo4WPEB4VQfnn0HhO9tdDSx1tOzIfL7pR6MZeFKCw+Y/r0ckFmJ
	WP6xV6Lb2L82/qvs+GfZG86PWzuzNzF+1KJdUYoN3mTz41+bhezqa6fswseVuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1722241910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=uP/GBdJUUmhV0FVpsGA5+6glu223VrsVsIuY5bj6KJQ=;
	b=RAxgUEgncrTSlklGm1SU4Db3sDi1gQvGwoHMmI/tubhHc8FMMr7UD7EReHb27Z+BLSadZ9
	ca/MZt9PrIF2Oagvj1A5sTsNCaUFceqdG7VaGDzvatxdVnHJRGxhFGf/K3FycLJIJRC9nI
	wDIfI5mrFly6jJGZ+BLbL7owMEIpHuWKHICZxm/5Wq/BdfqPJDlerVh5eUcKCwpMX0Rhvh
	ctryrWPNpVk8Fum4UHvNLTs0kOwyOLRYIZYvKrBqdMunzytbf7ZD3KdHREDuUmnr3HJDE4
	/1rkiou3VIxG/17vrxpwmaDHCRkG1KPqAWVvGqNHOvYv2nVZO/2OYf6HX/YcEg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1722241910; a=rsa-sha256;
	cv=none;
	b=tL4w4gIjcoasIgXvRMBL/KdrtlFp/SjcvYgsZuGov8zB0jkZMCbNSgDBQ9eDRY6PpA51ho
	rvZduEePhPx14120H/3owUh/dlw8Hz9EUoargoAWQ1ET+yDzuQz/6trpRlz1dlokEKEZl2
	bsR4278LVuBKjVgpVPyGbbFlJn0j1pSsx6/i+yo3jLipVqn3PqDiilGpRV5iBN5gorWp1f
	i55zoq2G9X0VO3OfATrqWxD+XzJ5Qvv9ebXPOVv1vKiSV/yMC2+S5Efv1dDiZFw+0UPdjT
	sGj/Udsd6091P9v1jefo4M65oIy1HEty8C+hqWKUsK0PhHlEPg2ez72cXbJGBQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id AB0C5634C93;
	Mon, 29 Jul 2024 11:31:48 +0300 (EEST)
Date: Mon, 29 Jul 2024 08:31:48 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR 6.11] Ipu6 Kconfig compile fixes
Message-ID: <ZqdTdOzIhfeb8bvi@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here are a few fixes for ipu6 Kconfig problems that lead to compile
failures. I've added Cc: stable for v6.10 for both.

Please pull.


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.11-1-signed

for you to fetch changes up to 4ec859e2bd779bf3c12f40691f6fff59c8de6378:

  media: intel/ipu6: select AUXILIARY_BUS in Kconfig (2024-07-29 11:24:23 +0300)

----------------------------------------------------------------
V4L2 fixes for 6.11

----------------------------------------------------------------
Arnd Bergmann (1):
      media: ipu-bridge: fix ipu6 Kconfig dependencies

Bingbu Cao (1):
      media: intel/ipu6: select AUXILIARY_BUS in Kconfig

 drivers/media/pci/intel/ipu6/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
Kind regards,

Sakari Ailus

