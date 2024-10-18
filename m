Return-Path: <linux-media+bounces-19832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C43079A34BE
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 07:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16C75B235C1
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 05:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089481714A0;
	Fri, 18 Oct 2024 05:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+Jbzur8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ECD186E38;
	Fri, 18 Oct 2024 05:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729230807; cv=none; b=d7pDcVLcVy3FQzq6MK8MRVdaJekiS9Tmi61awF6ON/uILyErdOHQpinqin3yfOhbG+oXDprfuaA298dgc6nQ2yIyB7Qe3aGM8CLd/avUX3UfEBkbO6tjE+hs4S3JcxSc/w1VNlw1bShxVyiKbvbyAWYL14jxdZwWV9yGSfO3GrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729230807; c=relaxed/simple;
	bh=uzjAOucrKtfD0CkwggkoeV+VI4yHBkB0yUqlDwNCYzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f4BW8tKsw5u9SOnJbm4lk0jP7bbTkYDo9UC8cBfCNsekbdz+Jv50v3209ib9nTo1CZcrImtEy00ReU4FqxrEEsjGYR2iX4e5yygQliWligATFNszTikWUToAYr6PogqBlsevh+kG3HVegtqtgTfKiDkXU1/+6ow1NIzu1HMpvD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+Jbzur8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3281C4CED5;
	Fri, 18 Oct 2024 05:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729230806;
	bh=uzjAOucrKtfD0CkwggkoeV+VI4yHBkB0yUqlDwNCYzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W+Jbzur8gQa3WeSILcq5SqXpKOdpGjQdG3f7ki9BoTgKxUHokuM+vVVi7e0NP/HRI
	 Woumuqvy8nG8scgdsABMF25uDA87eek/M4igOCdBfIt1VT01lI3XKVW7H+A50NEbNo
	 Nxr8HFryDEMTqJ9VdKSfVQFcxsYyrYiq2k6uh8E0Bqy7l+Udfkowcq2aAYcOLJ3Oiu
	 6tAU17lqBYQQV292tcurxgOGRSHhvHSZ78cs41Lq/VHu6YmTBUwlz8PuwmNlwdf/ot
	 zNoqTkEZlzSErlZgTeNp/xwjcwV8rFL0wuTU2cOOeYIDH1wwDhP4QPvAFD8fNC1e3Q
	 NFXAeOJtkf+tA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1t1fvQ-00000005Me9-1a5W;
	Fri, 18 Oct 2024 07:53:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Kevin Hao <haokexin@gmail.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Philipp Stanner <pstanner@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 04/13] media: dvb_frontend: don't play tricks with underflow values
Date: Fri, 18 Oct 2024 07:53:06 +0200
Message-ID: <8d6193ed8d53ce94d595cb431627bbc7783c0e4c.1729230718.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1729230718.git.mchehab+huawei@kernel.org>
References: <cover.1729230718.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

fepriv->auto_sub_step is unsigned. Setting it to -1 is just a
trick to avoid calling continue, as reported by Coverity.

It relies to have this code just afterwards:

	if (!ready) fepriv->auto_sub_step++;

Simplify the code by simply setting it to zero and use
continue to return to the while loop.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
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


