Return-Path: <linux-media+bounces-21168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6105E9C1FD7
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 15:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AEB31C20ED7
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 14:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6DF1F6673;
	Fri,  8 Nov 2024 14:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="oae8cXL3"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EB91F4FA4
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 14:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731077921; cv=none; b=CADu8NEiIgY2qnO6E6EL2eu/PIJTz7DneCkVffW2UdcbZmvaXxgBeGwc90o40/WT0cK0pXq1xF19iLcDK0M+vunsPjD8Ych/74zGWvKnAkn0SK9+H1kQapFERSk0nFDQh+9SBrSZRoJQ6ERq7g1LXLykev2Glgcv3usKR9XZTRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731077921; c=relaxed/simple;
	bh=d7BQd38rCBxd0OAx37g9tzt6AnxsfR6A7jLyNOMylIs=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=tAcLQHLwoj/Paq5DWsBgWGROvzwnh59cib1ZxFfIg/rrOnVXPvg9sKGRk7GtikpSlo8o+QlAjQpOzhQSPtUli1mAcS3LwS0f23opwthBHq6zhnVHlE4jlSqrdfatM4hpHksjhQUytBJjVbQies5iP8ji6/bqnsvD6c0aFHJ9My4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=oae8cXL3; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Content-Transfer-Encoding:Content-Type:Subject:From:Cc:To:
	MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=xl54Wk64IqAkiljVOuzA7jNq3PkjZV4lHKt8zzyHDHY=; b=oae8cXL30z9q89F9U0Ybk9JBFi
	QbNFRHprEkgtgGryZ+yqLQ8N7W2KgzO10tQpJRdow133XlO3jnOS4v8PhL+V0A/qw73Z5f5s0tC3Q
	KF1VlkhLAm8FjWw93HaYrgFJzGHhnOy/hbWT9mntVtUS6inLesGWc8FEbbEwTnUmBlyI=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:54169 helo=[192.168.0.218])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1t9Pq7-008jj7-Ii; Fri, 08 Nov 2024 15:19:55 +0100
Message-ID: <f10b9df7-62c6-4716-a3b9-e4dff1ee68b9@emfend.at>
Date: Fri, 8 Nov 2024 15:19:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: linux-media@vger.kernel.org
Cc: Marco Felsch <m.felsch@pengutronix.de>
From: Matthias Fend <matthias.fend@emfend.at>
Subject: Toshiba TC358746 deadlock
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

Hello,

I discovered a deadlock while using the Toshiba TC358746 MIPI bridge.

In tc358746_link_validate() an attempt is made to get the state lock of 
the subdev [1] - but since this lock is already held by the calling 
function v4l2_subdev_link_validate() [2], this leads to a deadlock.
Another problem is that an attempt is made to query the link frequency 
of the source [3]. Since some image sensors use the lock of the v4l2 
control handler as state lock (e.g. [4]), which is already held at this 
point, a deadlock can also occur here.

I noticed that very few drivers implement (v4l2_subdev_pad_ops) 
link_validate and if they do, the state is not needed there.
This driver therefore seems to be an exception here.
Some MIPI receivers that also have to query the link frequency of the 
source usually do this in s_stream.

Therefore, the most obvious workaround seems to move the problematic 
parts from tc358746_link_validate() to s_stream.
Although this works, the question is whether this is the right solution 
or whether it should work differently.

I would be interested in your input on this.

Thanks
  ~Matthias

[1] 
https://elixir.bootlin.com/linux/v6.12-rc6/source/drivers/media/i2c/tc358746.c#L906
[2] 
https://elixir.bootlin.com/linux/v6.12-rc6/source/drivers/media/v4l2-core/v4l2-subdev.c#L1502
[3] 
https://elixir.bootlin.com/linux/v6.12-rc6/source/drivers/media/i2c/tc358746.c#L913
[4] 
https://elixir.bootlin.com/linux/v6.12-rc6/source/drivers/media/i2c/imx283.c#L1565

