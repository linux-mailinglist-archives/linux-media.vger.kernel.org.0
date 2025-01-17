Return-Path: <linux-media+bounces-24884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B67FA1593C
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 22:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC294188C98B
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2025 21:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FF31ACEB5;
	Fri, 17 Jan 2025 21:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vodafonemail.de header.i=@vodafonemail.de header.b="OY51NRjE"
X-Original-To: linux-media@vger.kernel.org
Received: from mr5.vodafonemail.de (mr5.vodafonemail.de [145.253.228.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CF01AA1D0;
	Fri, 17 Jan 2025 21:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.253.228.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737150907; cv=none; b=ZD0uRRX1czunXAWwVanzkkoqlZz1fOagZghhS6+YqKIiDSbzO7rEJx2wqrK9ImazxG/AnW3/pLvU6IRz/1pUAsoJgEQaXXsKcKmeIp+QW/nW5fPOtEEXQc1kEyH1x0rViCwsfF4//6KtpfjrXLI51/4fp74huz7krScGceBJ9wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737150907; c=relaxed/simple;
	bh=EgUvX/yubHLFXVGDlOx5BcpIID1kRUY/frGe5pWJVwU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=cyNOJ6ZmAKbLL3W2rr13CyejqaCRP6M/PK9moOOC5ffTy88JS3bBdFiZlTyAkTykseV3+R480Wwq1UxVgAciNtfw5OAhWnliATHLQTQHyfeiU+f90OC7AJTpKSTeTfqrnCirCAxE6S86npWIYdjnIXUDSB+DtyNBPB8vEMu1Ng0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vodafonemail.de; spf=pass smtp.mailfrom=vodafonemail.de; dkim=pass (1024-bit key) header.d=vodafonemail.de header.i=@vodafonemail.de header.b=OY51NRjE; arc=none smtp.client-ip=145.253.228.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vodafonemail.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vodafonemail.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vodafonemail.de;
	s=vfde-mb-mr2-23sep; t=1737150382;
	bh=9AwIqC5aMeeG2nanENIKbL/veGn0lLTvGb6kKGXu6P0=;
	h=Message-ID:Date:User-Agent:From:Subject:To:Content-Language:
	 Content-Type:From;
	b=OY51NRjE9ism995iRHLichPOMm8MsBg55+YTqpksSnM/1tzS7k70ybZbAcwUL3yT9
	 cWK17mN8pDGz77/vz1Dkl96nl93Ty00wBNT+4AXZqxcedJduRZYuU2t5cM3RFyoYE1
	 lFFuQ9HMJwX4FG7S2via3RvD8rIP0/KUGbKWJeb0=
Received: from smtp.vodafone.de (unknown [10.0.0.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mr5.vodafonemail.de (Postfix) with ESMTPS id 4YZYG55t6kz1y9x;
	Fri, 17 Jan 2025 21:46:21 +0000 (UTC)
Received: from [192.168.178.41] (port-92-196-123-118.dynamic.as20676.net [92.196.123.118])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.vodafone.de (Postfix) with ESMTPSA id 4YZYFr2Fjjz8sZc;
	Fri, 17 Jan 2025 21:46:05 +0000 (UTC)
Message-ID: <6555309b-830d-449b-800c-55306c19c659@vodafonemail.de>
Date: Fri, 17 Jan 2025 22:45:59 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Farblos <farblos@vodafonemail.de>
Subject: Frequent kernel messages related to IR keymap rc-cec with kernel
 6.12.10 and HDMI monitor
To: stable@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-media@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Language: de-DE-frami, en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 1677
X-purgate-ID: 155817::1737150377-F97F9465-8A32A04D/0/0

This is on Debian testing with the following kernel, built from
the tarball on kernel.org:

  Linux sappc1 6.12.10 #4 SMP PREEMPT_DYNAMIC Fri Jan 17 22:17:45 CET 2025 x86_64 GNU/Linux

It is running on an 12th gen Intel Framework laptop, with monitor
connected through Framework's USB-C-to-HDMI adapter (the 3rd gen
one):

  https://knowledgebase.frame.work/hdmi-expansion-card-generations-Sk7AQKUv2

Since my kernel got upgraded to version 6.12.*, I get frequently
journal messages like these:

  Jan 15 15:24:51 host01 kernel: Registered IR keymap rc-cec
  Jan 15 15:24:51 host01 kernel: rc rc0: DP-3 as /devices/pci0000:00/0000:00:02.0/rc/rc0
  Jan 15 15:24:51 host01 kernel: input: DP-3 as /devices/pci0000:00/0000:00:02.0/rc/rc0/input146
  Jan 15 15:24:51 host01 systemd-logind[1456]: Watching system buttons on /dev/input/event11 (DP-3)
  Jan 15 15:24:51 host01 Xorg[1663]: (II) config/udev: Adding input device DP-3 (/dev/input/event11)

I tried to ignore these as long as they have been showing up during boot
only or when screen resolution got changed using xrandr, but today I
noticed that these repeat every 30 secs or so when my screen saver is
active.  Which then kind of floods the journal.

With the previous 6.11.* kernel series I would see these messages
only once, during startup.  When using a DisplayPort adapter instead
of the HDMI adapter, these messages do not show up either.

I guess that it is not the CEC subsystem being responsible here, but
rather some other component which triggers it more frequently than
earlier.  Any help on how to find more about this issue appreciated.

Please CC me in replies.

Thanks!

