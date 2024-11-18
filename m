Return-Path: <linux-media+bounces-21490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BF39D0955
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 07:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0F921F227D8
	for <lists+linux-media@lfdr.de>; Mon, 18 Nov 2024 06:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D6D146A60;
	Mon, 18 Nov 2024 06:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qqRCzjb3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C7A13D24E;
	Mon, 18 Nov 2024 06:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731910169; cv=none; b=TagorF3fszHRYthFrLCUCO4XFaxjTvnuLvR/0BtAeEE72UaIfhGEqHcPrETwfNBTOcYWexjJWJ4lqahvn2szMHAOZk09MTXYWG78wTGe8cFxPpqu6DBbZqdotMuG+yAFg5dOiWOORjkD/lBjO3Pbs8eqmzpvjipp4qGAnVfJdX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731910169; c=relaxed/simple;
	bh=mRK+qaxfY/47SOCaOMfjpA6wwBT7vAq5dtEDY3IjL9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s+z0yOj5P2FXVIObwDerec0p/Nh4JshCUY59KR4VVRl0uOSLoj3KFqixNVTnUZDZSx62DokVbevQSJ+yuTTNBiJyVenxjKRTstZGIM2xZmgCQEvuxamhY9JzU7FIZjGj88vYDcd4nO7aT0BojViVzpEOyUknmRTu5x/re2PHXkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qqRCzjb3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78588C4CECC;
	Mon, 18 Nov 2024 06:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731910169;
	bh=mRK+qaxfY/47SOCaOMfjpA6wwBT7vAq5dtEDY3IjL9U=;
	h=From:To:Cc:Subject:Date:From;
	b=qqRCzjb3Su5/1Mwh7kMi4ksl66jt+vw1XFuNZhXvXhcxaeE3RVA2AqYgugs0DwW9U
	 YxiEJeebNpqFGWC5e2T67azbTsUsVagLpTC8VdR7F6YbYnEaAryA1/444ANqYRSrZb
	 9ZeopGx167JFuQr13JaDt+agHtt4cn8unsIjZMjeJxXmo/Ltj+f9r7WWrI+A/HJXIq
	 RbwRArzqi1TLoDO4KdjiKhVZHze31ugQmcO9jaXk/YSBti7mNMNl5qreDefVA//QfU
	 kdukMPS0G4oEoF8vlHIixLW5jhHBJZJ9TeXKIjSQfP45NUPdQQ6V1LUTtWZPBdACz0
	 QRE3ukzzoqC1g==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tCuww-000000042iY-2s6w;
	Mon, 18 Nov 2024 07:09:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 0/2] Update location of the media tree
Date: Mon, 18 Nov 2024 07:09:17 +0100
Message-ID: <cover.1731910082.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

We're in the process of updating our workflow. With the new process,
we dropped two trees and created a new one (media.git). Update the
references at the Kernel accordingly.

Mauro Carvalho Chehab (2):
  MAINTAINERS: update location of media main tree
  docs: media: update location of the media patches

 Documentation/admin-guide/media/building.rst |   2 +-
 Documentation/admin-guide/media/saa7134.rst  |   2 +-
 MAINTAINERS                                  | 332 +++++++++----------
 3 files changed, 168 insertions(+), 168 deletions(-)

-- 
2.47.0



