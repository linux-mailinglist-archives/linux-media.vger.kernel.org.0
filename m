Return-Path: <linux-media+bounces-26575-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D36B6A3F3F3
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 13:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B735917A754
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 12:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC2F20A5F0;
	Fri, 21 Feb 2025 12:16:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A1D207A15;
	Fri, 21 Feb 2025 12:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740140210; cv=none; b=jWKNyF3Aoq64cJpy+m0gK+thmrBIttnVuzPPjVwscWf29pe1avG1CzQullnz8ykUW50vm35yO2Al9dn4eF2Th3Rvb1qzbmPgfavmOdzbqGS0h9UPJzWwl942yIFoiKPYGYudfMLzIiDwILI0V8Cp3pJHpnWQ/DE/gNi6lF4b9P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740140210; c=relaxed/simple;
	bh=UYwTc4V3WWRG9r7wEqaeAOt+TUd84HFFExHuRaTC2Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=thm0onYFaQuK8POuGVHsyKZ683NIuqLI74BGXLHi4AxZI5poVTePZUDEuSwzYuaScxC1Luy042mtgT0hd7VKYlEq/CasxXcbu/lLVdvZN4zwIzhG7QhAthQUWOhbdAF3FMt03oQlvMXt/gk5Zpr7IdOxg7bvePCNLuJB35pkZY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.digiteq.red (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id D436231596;
	Fri, 21 Feb 2025 13:07:49 +0100 (CET)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH 0/2] MGB4 CMT configuration fixes
Date: Fri, 21 Feb 2025 13:07:41 +0100
Message-ID: <20250221120743.1703-1-tumic@gpxsee.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

This series fixes FPGA Clock Management Tile (CMT) configuration issues
found when working with new infotainment systems.

Martin Tůma (2):
  media: mgb4: Fix CMT registers update logic
  media: mgb4: Fix switched CMT frequency range "magic values" sets

 drivers/media/pci/mgb4/mgb4_cmt.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)


base-commit: b2c4bf0c102084e77ed1b12090d77a76469a6814
-- 
2.48.1


