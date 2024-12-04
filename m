Return-Path: <linux-media+bounces-22630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B13D9E3E04
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 16:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8195F16597F
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 15:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C6120C02C;
	Wed,  4 Dec 2024 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="QJ6BKxRa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092BB1F7079;
	Wed,  4 Dec 2024 15:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733325468; cv=none; b=oTlanJm9RL4st80f6KyqpeyywjvzUzwZFl6+UMs2vXPqI7l8JDNbUFQM/SY0G2yxhy4R2/1waq9zngi8ycHQ0v93yMLZswya3v2x9PldvAYJKswxN7PI1CAWyD98CwZo61j04F1TrCz3v6f5jZNhyzVutViNg6fVjrWqF2rO6J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733325468; c=relaxed/simple;
	bh=WH4XuXNq2STparL6NqCwJvPNFKmOT/FSbIevuC9JQVI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E8wUQA82K53GPExtx+g5QWkjavvgoWP5uBVAf/8OITWEGSojctsJnPTaaA1cxiBuQUZoMj0iIRhI+ndJP6W5r6/vQfW8HEApV23KWVn+/uzIlujpq1th5uky5j+pMdIoOHmyLsrgd7ZFCnTnZkJHmPHChRTAlk3x8Qs6CmK30+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=QJ6BKxRa; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
From: Andrey Kalachev <kalachev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1733325456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TtKj3Zp/JRYeGnDcyJF4pdofxZNsir6y77bk5hjmV4E=;
	b=QJ6BKxRavX3ragvkfORBkL1vZ3HDaumpwVWxZQMYhGXejXXpI9J7CqBoq1j65KanzqUiQg
	AQoqgIX+Fyw1DEVnye8k0HhHcXjI+b6EjQ5UUsmhwGtSTCIivw28hv5cM6AOT+5Tmx9zQl
	JXhpVWP+bYv8hrnHKEmI2WNAVr7zeXY=
To: stable@vger.kernel.org
Cc: vivek.kasireddy@intel.com,
	kraxel@redhat.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	kalachev@swemel.ru,
	lvc-project@linuxtesting.org
Subject: Please, fix syzbot crash: kernel BUG in filemap_unaccount_folio
Date: Wed,  4 Dec 2024 18:17:33 +0300
Message-Id: <20241204151735.141277-1-kalachev@swemel.ru>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all.

The upstream kernels late than v6.10-rc6 has the patch:

   7d79cd784470 udmabuf: use vmf_insert_pfn and VM_PFNMAP for handling mmap

That patch stop reproducing syzbot crashes [1], [2].
The reproducer code [3] still crash longterm & stable kernel versions v5.4-v6.6.
Here the 7d79cd784470 backports below.
Patch v6.6 just cherry-picked, patch for v5.4-v6.1 has minor change described
in the patch note.

Regards,
AK

[1] https://syzkaller.appspot.com/bug?extid=3d218f7b6c5511a83a79
[2] https://syzkaller.appspot.com/bug?extid=17a207d226b8a5fb0fd9
[3] https://syzkaller.appspot.com/text?tag=ReproC&x=10c0b8c0580000

Reported-by: syzbot+3d218f7b6c5511a83a79@syzkaller.appspotmail.com
Reported-by: syzbot+17a207d226b8a5fb0fd9@syzkaller.appspotmail.com

