Return-Path: <linux-media+bounces-22621-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AB59E3B8F
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 14:45:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21D8EB25B45
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 13:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F9991EF096;
	Wed,  4 Dec 2024 13:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qrQteQqK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB1F1E3DFE;
	Wed,  4 Dec 2024 13:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733319812; cv=none; b=cWWpGhfZ9WSa5ezdo26xVhcXxcaNgpoeQbSPytSB7tS8l4PbV/Kdo0RWY17QtlINDOWUBgqBIcs/XoZFcK/Gn/jZsBBtLd6dcF1+NOjipgKcJ2BFawwrphXSvG71nJVlGz1AkpvAg7pd3v4vPlc0durfbtaLcaUNPrUKwKLCL9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733319812; c=relaxed/simple;
	bh=MHnEIuFoxqivOFqlqe2JujMLNr6o8ryJEBDVHgeAfYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9py1ZLqivo5JvasTFiUpLwLE9/jXBvJsJ9YIf/yrHNpRr6Aq0kW7fOtLY73rIuW2D9Xwt+fPAvBFwSGuYmqAgBnsdcDBPnQa6/6rilVYUGWjJ+41wvO+b3GvYZ/LVmLdpRPE5bqodsyH1pyPUu1yJP2PGLHmiylsWCY8Wvfq+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qrQteQqK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333AAC4CED1;
	Wed,  4 Dec 2024 13:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733319812;
	bh=MHnEIuFoxqivOFqlqe2JujMLNr6o8ryJEBDVHgeAfYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qrQteQqK4t+jsqSchkQ3kaCFoWFrySAJcNZMuTakeYqpnm8ZtH/GUb2zboN6OxYXw
	 eWaWdLfTQiNZCnKjTZ83iAQTJCd6AYxJoWvu3JKOk1lHpUpcQ/1IwgBY1lf5Zodty9
	 6Vow3i3TkgjjP9wXhQB0RoyoKf+8J5GRULg59ZD8ngpNX9zW5xbzLdYJCZWnc7b+fJ
	 gW0to9HCGLbF9b5HXBqohw7JK9+Y0lAQLHZloQhUrbVOu1j/avvKtxaAiFQd0pwyW9
	 7GQqQ6oNs0mj++0/1yyg1r94WDe3bmvrU6Ct7Lt7xNHeKepH6analjuqEfnaWum1me
	 jk+nQ0WXslfsw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tIpf8-00000004ebx-0fAo;
	Wed, 04 Dec 2024 14:43:30 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] MAINTAINERS: fix a couple issues at media input infrastructure
Date: Wed,  4 Dec 2024 14:43:03 +0100
Message-ID: <edb356f1ff58fe5938ffb275aa2574d127bed822.1733319659.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <8f663390c31d6c0c7acec3f39a4a7bf334a01309.1733319659.git.mchehab+huawei@kernel.org>
References: <8f663390c31d6c0c7acec3f39a4a7bf334a01309.1733319659.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The media input infrastructure is missing a record for our maintainer's
entry profile. Also, patchwork link is wrong.

Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

Patch resent, as linux-media was not on its Cc list.


 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..264c0caec2df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14510,8 +14510,9 @@ MEDIA INPUT INFRASTRUCTURE (V4L/DVB)
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+P:	Documentation/driver-api/media/maintainer-entry-profile.rst
 W:	https://linuxtv.org
-Q:	http://patchwork.kernel.org/project/linux-media/list/
+Q:	https://patchwork.linuxtv.org/project/linux-media/list/
 T:	git git://linuxtv.org/media.git
 F:	Documentation/admin-guide/media/
 F:	Documentation/devicetree/bindings/media/
-- 
2.47.1


