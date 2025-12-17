Return-Path: <linux-media+bounces-49023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10753CC99CD
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 22:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 678DA304F139
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 21:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE95B283C83;
	Wed, 17 Dec 2025 21:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b="VA5WImuj"
X-Original-To: linux-media@vger.kernel.org
Received: from forward102a.mail.yandex.net (forward102a.mail.yandex.net [178.154.239.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D571186E40;
	Wed, 17 Dec 2025 21:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766007398; cv=none; b=P4QYA1b2TGQpHn1U8le/cPHMwW3YSxmzcQ9hJWoqbVDyiMheoWyoU0+8YgDGwln1n7wyt10zvbiDnLgp6QJyfzeKi38qdiN8arRrV/7wqCl2c7Nkh5C/95jyQcHclYOsMyAQ6sETJgd0Jqw3Rzeld1+vyZ0JY7clKcEiCtbyrDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766007398; c=relaxed/simple;
	bh=WXrrknIN4NknqhHl92gbIzaQUoOcv0O+jGnNfk3av+E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N2BIAHI4QyNAb4tZ7L2PZDv/XfSAA6eJ/UPSmdr1BuHUl75fELT9/w8luprmEuxnf+CbLHVGFhYOulj4xe5/DTR2XlfUuryIJV8C929w9M1OUotaqJliecZdl9GdcJy1660MQ4kg64M64OXkMEEhLkNnWOY56yriCo4mXYRWKZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru; spf=pass smtp.mailfrom=rosa.ru; dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b=VA5WImuj; arc=none smtp.client-ip=178.154.239.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosa.ru
Received: from mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:152e:0:640:fcd0:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id 1C29EC0058;
	Thu, 18 Dec 2025 00:36:23 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id KadFMd1GGSw0-dePucb47;
	Thu, 18 Dec 2025 00:36:22 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosa.ru; s=mail;
	t=1766007382; bh=WXrrknIN4NknqhHl92gbIzaQUoOcv0O+jGnNfk3av+E=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=VA5WImujlEXxnofrjRXx0hX4Dzid4v5AxSLrUVn89Az846NlfKruW+So81MenDpZ+
	 N84zNF4iSQoiftIh0F6KGlLsGck+mXA6Ox+BJ4sZfmJC6lrYEAqP3SIK9EhXUo30HF
	 P+a4VrmDBVdWqclLWTlz5EXQ/bHbotcqNtn/0MKs=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net; dkim=pass header.i=@rosa.ru
From: Mikhail Lobanov <m.lobanov@rosa.ru>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mikhail Lobanov <m.lobanov@rosa.ru>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH v2 0/2] media: ipu6: isys: guard remote pad lookups
Date: Thu, 18 Dec 2025 00:35:21 +0300
Message-ID: <20251217213526.196533-1-m.lobanov@rosa.ru>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series fixes NULL pointer dereferences in the IPU6 ISYS driver when
media_pad_remote_pad_first() returns NULL (no enabled remote link).

Patch 1/2 guards remote pad lookups in CSI-2 stream enable/disable
callbacks. The external subdev -> CSI-2 sink link is created only after a
successful async bind, while CSI-2 subdevs are registered independently
and expose devnodes/STREAMS callbacks, so the stream ops can be reached
even when a given port has no enabled upstream link. The enable path
returns -ENOTCONN when the remote pad is missing. The disable path always
stops the local CSI-2 receiver and returns success when the remote link is
missing to keep teardown best-effort and consistent with the existing
behaviour (remote disable errors are not propagated today).

Patch 2/2 adds similar guards in the video node streaming helpers and the
firmware pin configuration helper, returning -ENOTCONN instead of
dereferencing a NULL remote pad.

Changes in v2:
Add detailed rationale to commit messages.


Thanks,
Mikhail Lobanov

