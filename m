Return-Path: <linux-media+bounces-11294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AA28C1FD2
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 10:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1EE3280E73
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 08:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446AB7D08F;
	Fri, 10 May 2024 08:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="IFCduo+H"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D4554663
	for <linux-media@vger.kernel.org>; Fri, 10 May 2024 08:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715330126; cv=pass; b=b6wrhJQAJlBsDCrNUWpmqwehc0jY5V+Cw6hjvAstk4Hhcag6M8V56XJvmrLeCLwwCkhO8fTSjCRxqSOqGUGnpax8iXJbcGmOszx9YHqtYh0rXqQL4O6lvHAd9aUJVTb4lCGi/1Wk0E9QrLK01V6pB9Fz6X0n5U2ReSAy3Pdji3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715330126; c=relaxed/simple;
	bh=6LG8KYre/NmDU1mSS3PfRS496tqIbAXsKTlwMt07sJI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p+G/jGQJBNhiaCzjGbQJrpEHG5drhPNAQU083Zy6Rr5rFr3SxgRETjJ2sSsUNQiwEWY71C4HAeNn0yGBxHWAyjkigqOR0nqrycOJKNyPXJSNa5yNb+knctIPzdMVfUeiBCyt2WOaBAHNY9MB1sxm4GciWVyO0Uvy2HGGQGIDnmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=IFCduo+H; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (80-248-247-191.cust.suomicom.net [80.248.247.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VbMdb3HX3z49Ptk;
	Fri, 10 May 2024 11:35:15 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1715330115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=oEyrBS9rytOwUqMo4gRNEUNb5KsGvR2B7AKA3+kwQlk=;
	b=IFCduo+Hb4QRUNe5xNk5Vmwx731VBrZreBgYdirqkvkAQyU8awduE7w/ToeKsjWjK7OSUy
	orAW9hm9OGkl5RaK0VpOr5J3eHQ+wk8QGoy+/oJDZMpX6WJAKaEDUblEJHXRp8fLhTEVjm
	7uD37mLam4RU2fp2D++Dd67Pq58LIDNgQWVSx28WFE1dLQ68V6/FNmMISo4YbXiYnAJgPJ
	az6SfTSlG9HDp8kYDqOw8xw2ztHjBGk0B2dA7FaGMp/+1oBuib/rZJ+HV9TBaTiv1ZwP3M
	4ZGLac0vkDYzn6ZNg+PdAMoYjRAjDd5K1NIG2pGsmAkq3bXhzYzX/0TKTzS/Gg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1715330115; a=rsa-sha256;
	cv=none;
	b=EP+ZOMeI2VN8zmow015EdHz3qtw+a7YLml5MmeT1/2n6xxlr4hyXXPeSpY4M6XFu0cjAOl
	OtsuQ7QvfT+5rONetbd7NLzJD6F7OWJ8fEjDTuKU0Jez0mdKmoSxRinTof3Pb1IJ/IG61W
	f/pizmfnBB6f/ELdId1Jyi1olu+YN+fGkjSCr4RktMYi/zurH7hJURzbtf7TQSHjUbmvD7
	q7G/LKRqnAAjrT7F1cmtvniNNzdmggjwQK/4bNNa+VYqbEnRBs1GwEjm6vwnk1NDwpxVvZ
	wy0Dwty3FV1vxUHlfpBl0awv16n8nmrTV1nYlIcnUKQHBbI8yua1SttYgtrBGA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1715330115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=oEyrBS9rytOwUqMo4gRNEUNb5KsGvR2B7AKA3+kwQlk=;
	b=agy0wwixKBErYX+PEgAUgwvN9/YqDUr7MnkOpcQN1BT+0wCzllXPZZUU2fXtdjUtTT9Qif
	cE1sMPqBjsBQhUEyffKHlncSUnrGvbA9k+f5ObPQpBc5Gpi8a7f8/Y7YcdrSLnOnf7AgM5
	O54jq11yOcyIcW/ujtFrKx0pGxADw84XUo48UxTC61mZGbcXer6Mve5tqitWHUNKzl7fID
	09NFXZtqZmOWTFGk+Bye1AgaupZRy/+nKFfVp9Y7FVQog/0a7XlLtwQZCKJvrAx2L01bAU
	aytYDlRWVgWmS5g9YL6xB3KmCQKBQpZrdxc66U5RBkZI1lVCxAnC7iBszvxMww==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E52E6634C93;
	Fri, 10 May 2024 11:35:14 +0300 (EEST)
Date: Fri, 10 May 2024 08:35:14 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR 6.10] IPU6 and fixes
Message-ID: <Zj3cQqFTq7PaCBaj@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans, Mauro,

Here are fixes for the IPU6 and ov2740 drivers. The ov2740 fix is required
to make the driver work on some of the systems with IPU6.

Please pull.


The following changes since commit 48259b90973718d2277db27b5e510f0fe957eaa0:

  media: media: intel/ipu6: Fix spelling mistake "remappinp" -> "remapping" (2024-05-08 19:23:30 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-6.10-2.1-signed

for you to fetch changes up to fc5c12c8b75848519cde3da3e599ea0bfe3136aa:

  media: ov2740: Ensure proper reset sequence on probe() (2024-05-10 11:33:09 +0300)

----------------------------------------------------------------
V4L2 fixes for 6.10

----------------------------------------------------------------
Hans de Goede (1):
      media: ov2740: Ensure proper reset sequence on probe()

Sakari Ailus (1):
      media: intel/ipu6: Don't print user-triggerable errors to kernel log

 drivers/media/i2c/ov2740.c                     |  9 ++++++++-
 drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 10 +++++-----
 2 files changed, 13 insertions(+), 6 deletions(-)

-- 
Kind regards,

Sakari Ailus

