Return-Path: <linux-media+bounces-19734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA919A0713
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 12:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B8F328A741
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 10:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95F92076C1;
	Wed, 16 Oct 2024 10:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKrJbifu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D01A206E65;
	Wed, 16 Oct 2024 10:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074158; cv=none; b=XSZrCO/LYjsXk32icgCIG8QBYCwkxXyaIMpxg+swbRMsOLqrJOBlxHiAv27LsaUlIA6cgQANzjzHMlu2fgaHhrYtRaTHInKwWAN/1ag7r1g9XXyXc5STZS63avKL0tsNCPsszRQ3kNE/exc7CPJo0xXGPw7pFu2NzYTqPsEddUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074158; c=relaxed/simple;
	bh=T3NFsk7r7x26FUosflKVUEpxyxcH1IJFyRbpMefuXjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tW6aZrILkovlDxROb9h55nxBBZdedju8D65FsVlPGqBvtsEiuwgskjQPxyvgOiVLfND5vXBFWBDVOhkPrSFGLvhKry+0kl+hC7zpfjNNcgpe6ZeAFuNv6oQTQydgAq6v+CVeuPrDDVn3/51j0ZsgAbpZAWVrH1MwP0RDGIrfL8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKrJbifu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE68C4CECD;
	Wed, 16 Oct 2024 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729074157;
	bh=T3NFsk7r7x26FUosflKVUEpxyxcH1IJFyRbpMefuXjE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DKrJbifuRAS2Bf/DcIJlaIp1Ifjlr2axERW70LB55P5zEeyhu6gzGqibW93kS0HqA
	 AvEPHiJV69/zr29QlrCsM/W/jXFbAe5hoob+VAPeUy1JX7xyX2O7xHFtOVGiN3v3Dq
	 jFMTlFBtimpqj0RsZdOFTCND4jHWDuw3WoSGIMTPyx5g6WmePb5x/3q7T8kODSjMML
	 Uatt5iG4MnXghFajEcxRlB/dgfQ6jDvJt9RN7xeZ+sOOb4CzCl0rDiR0VscaTE5fVy
	 XmpIrTTE2iWlHlBkgmN+j12QsmepXrJvCtZXijf+OmN65rPyYSrIHC+U+lEEfDbl3Y
	 Q0/wFs7tdbxgg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t11Ap-00000004Ymd-28Vn;
	Wed, 16 Oct 2024 12:22:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Kevin Hao <haokexin@gmail.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Philipp Stanner <pstanner@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 04/13] media: dvb_frontend: don't play tricks with underflow values
Date: Wed, 16 Oct 2024 12:22:20 +0200
Message-ID: <6b41097eec702cc61127ada9cf118c98a9e235c5.1729074076.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729074076.git.mchehab+huawei@kernel.org>
References: <cover.1729074076.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

fepriv->auto_sub_step is unsigned. Setting it to -1 is just a
trick to avoid calling continue.

It relies to have this code just afterwards:

	if (!ready) fepriv->auto_sub_step++;

Simplify the code by simply setting it to zero and use
continue to return to the while loop.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-core/dvb_frontend.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index d48f48fda87c..c9283100332a 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -443,8 +443,8 @@ static int dvb_frontend_swzigzag_autotune(struct dvb_frontend *fe, int check_wra
 
 		default:
 			fepriv->auto_step++;
-			fepriv->auto_sub_step = -1; /* it'll be incremented to 0 in a moment */
-			break;
+			fepriv->auto_sub_step = 0;
+			continue;
 		}
 
 		if (!ready) fepriv->auto_sub_step++;
-- 
2.47.0


