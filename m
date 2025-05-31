Return-Path: <linux-media+bounces-33733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E86B8AC9C68
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 21:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC3C57A8AB9
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 19:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311C218858C;
	Sat, 31 May 2025 19:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M8vJuXn+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922DB12F5A5
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 19:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748718346; cv=none; b=YA6Gy8t7LCto1d2a6feici8qiNRNlJo464h/xtULg7WUTsGyuZOEaSTwuuyF03WRW+mze56k+s3CZiNEQ1dXA7iQhg9Du/wex4+OHCWUdPbWhit8SCxHQexQZeXD1T6peDt47HcOiupTdrESFRWzDY127NNbOPKtygWH1t4X/XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748718346; c=relaxed/simple;
	bh=hfqT1K1YNBQ0jG6Gw32ksAY2H/ONxB3WnTwm0fqtCq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z9n83vcb+Vz8Kn9VHLY5CwGLPnitC/k0Ez23wDySc0QiUIuWi8JBEEP1YZt6jE8/HrfUgIwSonQztrXWhyzvSGpelSd1MBPVsOAh9FPeA1okTBTNjbOz0iNhZ/VcAQ6Ob0ouzFuADI7pi1md+fbAzIBbhuuXJQtYcNgSXbPYiBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M8vJuXn+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CFEC4CEEA;
	Sat, 31 May 2025 19:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748718346;
	bh=hfqT1K1YNBQ0jG6Gw32ksAY2H/ONxB3WnTwm0fqtCq4=;
	h=From:To:Cc:Subject:Date:From;
	b=M8vJuXn+mX3+Bdg12mormhGZbpuLALbhVrqKK3UbIdIqYlrJM5wUWL8evte4ImUzd
	 DgfcGQ8mQtWJVBgEf24kXHC1KvwSS/nmOhNQpnw7DIwQ0AYTnuNL84gRcGFvRD6axe
	 RVeWgp1ou+BI8rGHIQ9uFXOpEOD1hUm+jj5w4UhnY/8nRmUGACO5MTvdayBjIVjydc
	 dLDWxFegTPtISAsAIatybdY8io5ODx+dFlEjALq1jZVygbQs9/ayYbuti4Lbf1iqKJ
	 FeRucJunGtKhzeEZG2Cg2WfAbR8AewsGcRJi3KMUMdVK93R24qZWI3HSJAvhixodaf
	 0l+P3VQ+2JJzA==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH 0/2] media: hi556: Fixes for x86 support
Date: Sat, 31 May 2025 21:05:32 +0200
Message-ID: <20250531190534.94684-1-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

Here are 2 hi556 fixes which together fix hi556 camera sensors not working
on various x86 laptop models. This has been tested and confirmed to fix
the camera not working on a Dell Latitude 7450:
https://bugzilla.redhat.com/show_bug.cgi?id=2368506

It would be nice if these can be queued up as fixes for 6.16-rc#.

Regards,

Hans


Hans de Goede (2):
  media: hi556: Fix reset GPIO timings
  media: hi556: Support full range of power rails

 drivers/media/i2c/hi556.c | 47 +++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 19 deletions(-)


base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
-- 
2.49.0


