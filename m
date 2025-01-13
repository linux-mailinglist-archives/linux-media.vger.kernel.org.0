Return-Path: <linux-media+bounces-24694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FA5A0B4F8
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 12:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CACE2167F23
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 11:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E4821ADD2;
	Mon, 13 Jan 2025 11:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b="eP4doOYq"
X-Original-To: linux-media@vger.kernel.org
Received: from ksmg02.maxima.ru (ksmg02.maxima.ru [81.200.124.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A275F19259F;
	Mon, 13 Jan 2025 11:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.200.124.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736766087; cv=none; b=Fg3rQ7T4Hj15T+nki8mRG2+LXbrjaoz5LGd1tC/JXZCNafKcKDEmgoKcjS302uYHMi6M4bl+CrahXt3yryUeoxrJzm4zLjyNbCv3XLbCliFjk5f9lATt1ayTERFNTGa5TZP4Jeix7yrnRsA7L7KsGdIi1UIlVePvwplwuHeISgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736766087; c=relaxed/simple;
	bh=7VilPrFIs+zsQsKmu0rs5IxSt3NXBqK7+XsG+bArfH0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hbq572p8QijBEc7V0N/fFZ1HbiazrMd5V9nh0EkX7/9oKgEE6T/X2vvW551aZ/s58Tr2dGuoSw/88zKCvmKrgzEb4WWMVmiEN49YQfWuX3UWoBpy5QNrkJunUx0j5vfvnczs7DcNDFVG0XaiTkeRAjNHk0P+QzM5OHkdMkR6JE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru; spf=pass smtp.mailfrom=mt-integration.ru; dkim=pass (2048-bit key) header.d=mt-integration.ru header.i=@mt-integration.ru header.b=eP4doOYq; arc=none smtp.client-ip=81.200.124.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mt-integration.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt-integration.ru
Received: from ksmg02.maxima.ru (localhost [127.0.0.1])
	by ksmg02.maxima.ru (Postfix) with ESMTP id 111D41E0002;
	Mon, 13 Jan 2025 13:52:45 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg02.maxima.ru 111D41E0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt-integration.ru;
	s=sl; t=1736765565; bh=CPd0Ww837jUihZOfd5yLQYFh6UEdksQta0sVWcBKU54=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=eP4doOYq5dD00K/EWPLf7RLZsviLWg2l+T0yDA6+bzdjohQy9XXWgRPvweh19+N0p
	 p0vIf/xlSeVukAykUQm6syHboMoZ4gz7fDweLphjGOr2rJR91dDnyfJSNDtODzmNTm
	 I111oI9gI9F8oTGPzWmDDiyvADsE2cLlNsxhtgyx7H7z3rje7gQYRckUVqFkNy4EXz
	 dg2I0gLiM5iQnU9blpDRj7Oa3Jq9tTLZSfnNv9zum71GgKqGb81gu6qWVcwVtinar/
	 p2EWK7BiXJErvrYkE/553Y3ugDP2zhagWY89RRysPkvNxxLV8/9oURNFsqdy2WI5IR
	 jgZuvZt+sLiGA==
Received: from ksmg02.maxima.ru (autodiscover.maxima.ru [81.200.124.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.maxima.ru", Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
	by ksmg02.maxima.ru (Postfix) with ESMTPS;
	Mon, 13 Jan 2025 13:52:44 +0300 (MSK)
Received: from GS-NOTE-190.mt.ru (10.0.246.105) by mmail-p-exch02.mt.ru
 (81.200.124.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.4; Mon, 13 Jan
 2025 13:52:43 +0300
From: Murad Masimov <m.masimov@mt-integration.ru>
To: Sean Young <sean@mess.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Jarod Wilson
	<jarod@redhat.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Murad Masimov <m.masimov@mt-integration.ru>
Subject: [PATCH 0/2] media: streamzap: fix issues with the implementation of usb driver callbacks
Date: Mon, 13 Jan 2025 13:51:29 +0300
Message-ID: <20250113105132.275-1-m.masimov@mt-integration.ru>
X-Mailer: git-send-email 2.46.0.windows.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mt-exch-01.mt.ru (91.220.120.210) To mmail-p-exch02.mt.ru
 (81.200.124.62)
X-KSMG-AntiPhishing: NotDetected, bases: 2025/01/13 09:45:00
X-KSMG-AntiSpam-Auth: dmarc=none header.from=mt-integration.ru;spf=none smtp.mailfrom=mt-integration.ru;dkim=none
X-KSMG-AntiSpam-Envelope-From: m.masimov@mt-integration.ru
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49 28b3b64a43732373258a371bd1554adb2caa23cb, {rep_avail}, {Tracking_one_url, url3}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, syzkaller.appspot.com:5.0.1,7.1.1;mt-integration.ru:7.1.1;ksmg02.maxima.ru:7.1.1;81.200.124.62:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 81.200.124.62
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 190293 [Jan 13 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/01/13 07:04:00 #26996016
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected, bases: 2025/01/13 09:45:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 7

These patches fix two URB-handling related problems in streamzap driver.
The first one fixes a race condition that leads to a kernel panic as
reported by Syzkaller [1]. The second patch prevents bugs by ensuring
that data received by the driver is processed only if URB status is 0.
It also complies with how other similar usb drivers are written.

[1]: https://syzkaller.appspot.com/bug?extid=34008406ee9a31b13c73

Murad Masimov (2):
  media: streamzap: fix race between device disconnection and urb callback
  media: streamzap: prevent processing IR data on URB failure

 drivers/media/rc/streamzap.c | 70 ++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 31 deletions(-)

--
2.39.2


