Return-Path: <linux-media+bounces-18983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C1298D064
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 11:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF86A28325D
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 09:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B4B1E1A36;
	Wed,  2 Oct 2024 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="gWh1EN9i"
X-Original-To: linux-media@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F70012C49C
	for <linux-media@vger.kernel.org>; Wed,  2 Oct 2024 09:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727862377; cv=none; b=oCmg0D+e8opXYG9D1XV0nBrPXkcIqvESwbJeCkWrXxRu87D5U/Ml0RIT0SFttrG8+pMFzV6WXtg21MLOIKQybc07/YL8pKbG5W4bQtptcuuvYnpenB8wmuFFlke/QS01SkXLztopWcwiAgJAuZHggPnsP5e3lac1/TlrNrhX3Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727862377; c=relaxed/simple;
	bh=FMKD6TAIrduufHtyUXrANtbgIEWTy5mEtfsTnegbdtw=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=B1kmCDEcE1xSHja4Vk8nWtSLId65O5dNWrapLiSTDS1eiiLH+OEdRJsuxxkfwVgLeYeEUCAMFZeDCaoED2GEfB+UHdwBryOOrs0fOBtANAgDmkK2EIy/Dwo0tkNdrNAfBfYqFxWMQbF6LAu+vcZ3uyGbmQ+1/c45YUAJ2Crtt1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=gWh1EN9i; arc=none smtp.client-ip=195.121.94.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: 27eb2c85-80a3-11ef-87be-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.37])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 27eb2c85-80a3-11ef-87be-005056abbe64;
	Wed, 02 Oct 2024 11:46:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:subject:from:to:mime-version:date:message-id;
	bh=OZpXNqL5NTa+z1y8Sp2LRFlFCKiuuHcwwDQfQIarZLo=;
	b=gWh1EN9iG9P/MsoqjgiuVklxp9GWSDV1+Igr9xm0KzC8xW+tj14/gyp/YGLXCHTjPUTGdehMsFeAT
	 1SohWAE+FrEa6DqdHpbYoc/GHGUB2eeIoGy91u5zNc8umreBsRHc8+T5fjaQd3kc9cM+IKzTqEOVQr
	 4lwPj2E8aCswxXDiCJUBF9ygbK6smtKAVJ2l0UJ8afjR3DjNy/ZKfKDqUvlfYMg5mTFIXud0AX9Dj/
	 BdpNXu9jI7kPRvJVLMwpEQzHG4ySFlisHcVuw1zY0uxD0ycmIFQV96UFIOitDK/k03XsRatJdqsfzT
	 YNARKC3/fVvjGKX+VS2I+FfJtf54yIw==
X-KPN-MID: 33|9diL3lxycrSdm3J10XgH4nXOWdfvZvzDYFrqQdPG2Vk44K0TTJju20V26OjsK6E
 0LH3+ld1TpI59NKs8XyRydEf1X/s9x1YNzGDael6R64E=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|AFaEc2bTTqfkdeCVjSzW4xr7lbFF9DEAF0VA5wlMiT/8c1MPR8O2OoLdcZcKM1/
 xy/kq46Lpcv6fhuP7pYBkPg==
Received: from [10.47.75.249] (unknown [173.38.220.33])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 27f0414f-80a3-11ef-98f1-005056ab1411;
	Wed, 02 Oct 2024 11:46:11 +0200 (CEST)
Message-ID: <215237b3-0e88-4bb2-8a7d-84a2d0c2093f@xs4all.nl>
Date: Wed, 2 Oct 2024 11:46:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT FIXES FOR v6.12] media: dvb-core: add missing buffer index check
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If there are no objections, then I'll push this to the fixes branch on
Friday.

Regards,

	Hans

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/fix-v6.12a

for you to fetch changes up to fbd5c1630f464fb4b7135d9bb07776dd969f750c:

  media: dvb-core: add missing buffer index check (2024-10-02 11:42:25 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
      media: dvb-core: add missing buffer index check

 drivers/media/dvb-core/dvb_vb2.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

