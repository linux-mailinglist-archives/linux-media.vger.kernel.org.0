Return-Path: <linux-media+bounces-11838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F248CDEE1
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 02:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0111D1F21EF3
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 00:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9F9184F;
	Fri, 24 May 2024 00:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="U1B8D+pI"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CAF7F8;
	Fri, 24 May 2024 00:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716510563; cv=none; b=Kj1YT4376Ye8DDCj4Vncjc+8cNZNeb/b72DbnLLB6wQ2pCwcCd2n/yw8cUCKy2y1mVqNa2M72bzc7deU8RhpjamAit4QtORriYKZtyPHc30A0PHaw1RBrOUnlPyVh3rkbKG+FTDPG/xrhd5FYFhaD5qRMlVWiDsCzmkmfoTri7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716510563; c=relaxed/simple;
	bh=nu7jEGkf6DSlYxb7K4YlBVQEqSTkbPMwlIksvRSYbAA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WdZoGEKYQmcC6DEZJnN0DxPZGHk5LrVO8FPjoJer8V0RJYT7xUDwcgpX3ezcOshJN7L9LXQwZ6I4IEg98/JdqRgnf8WoJBDCP8nB6bbblZJGj2V8dooK7yU7C1LZMS8gBwLfLEsCw0EatdBCyR/Or1ERVnd+zOgH58FEEGMohEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=U1B8D+pI; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=+Q9cOPD/2nOKQssDrHqvPWD/p9y4w49ptHPcE2p6lvM=; b=U1B8D+pII8GYaQl9
	Oo5cbDHaBM/Tb/4zRK+IbrgPXrm4vQSqd/ZFOuLyLQY8ZMWHL7lHOOfK4nsOPybct50CpBUZsnbBF
	qSe+Ij9AoBYcibE5PKVCGl+hDDnfWpEXqTsOqakSOIuVQa5MzdvgiEShfITrG++nkUTQ/zwm7vr73
	R5UCtd1E1xSSzf148VEZIuveqHR+Isi4bkfOVB3C4Y2AyWAR9YAexsaJzHD3kS8KNfV0AB21lOrZi
	d+2NifuPNJbKoMlWFS70tRcYHo3DtxsSNWlV9+DHE15iAL4NlbOxAGuTkqf3sPYHTiqpOrJ/5y3Vm
	yxW7J7szdnQzOhBSPg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sAIo9-002K3B-2q;
	Fri, 24 May 2024 00:29:18 +0000
From: linux@treblig.org
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/3] Dead structs in dvb-frontends
Date: Fri, 24 May 2024 01:29:13 +0100
Message-ID: <20240524002916.444598-1-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Clean out a bunch of dead structs in dvb-frontends.
Build tested only.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (3):
  media: dvb-frontends: drx39xyj: remove unused struct 'drxjeq_stat'
  media: dvb-frontends: stv0910: remove unused struct 'sinit_table'
  media: dvb-frontends: dib7000p: remove unused struct 'i2c_device'

 drivers/media/dvb-frontends/dib7000p.c      | 5 -----
 drivers/media/dvb-frontends/drx39xyj/drxj.c | 7 -------
 drivers/media/dvb-frontends/stv0910.c       | 5 -----
 3 files changed, 17 deletions(-)

-- 
2.45.1


