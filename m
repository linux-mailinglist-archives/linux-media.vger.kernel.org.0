Return-Path: <linux-media+bounces-1334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 673027FD2BB
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 10:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97D931C208CD
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 09:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156C4156CD;
	Wed, 29 Nov 2023 09:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IOha4XHT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 723CF2135
	for <linux-media@vger.kernel.org>; Wed, 29 Nov 2023 01:30:11 -0800 (PST)
Received: from pyrite.hamster-moth.ts.net (h175-177-049-135.catv02.itscom.jp [175.177.49.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1F992B6;
	Wed, 29 Nov 2023 10:29:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701250174;
	bh=nqrEqQSOhAYlctX57th3QWKSG0vRwgH0APQhoICNfyw=;
	h=From:To:Cc:Subject:Date:From;
	b=IOha4XHTmYtNB8c3y3F5DeulKEGuCSkmkxazasAoy344UW4ZFfecosnIVzoAlesHV
	 uLeVVRe6aDPM+kTeizkMBDBZjZ3jx2eHKuLGGXen256NtXpR8ZQlaipFvuILsilbYQ
	 0yzWjwRRwgzeRC2fmaGwb7pN7nHyKs3bOgm/qf2A=
From: Paul Elder <paul.elder@ideasonboard.com>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: kieran.bingham@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH 0/3] media: rkisp1: Misc fixes and debug
Date: Wed, 29 Nov 2023 18:29:53 +0900
Message-Id: <20231129092956.250129-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a small cleanup of the register definitions, as well as
some additions to the debug for the rkisp1 driver.

Paul Elder (3):
  media: rkisp1: regs: Consolidate MI interrupt wrap fields
  media: rkisp1: debug: Add register dump for IS
  media: rkisp1: debug: Count completed frame interrupts

 .../platform/rockchip/rkisp1/rkisp1-common.h  |  1 +
 .../platform/rockchip/rkisp1/rkisp1-debug.c   | 20 +++++++++++++++++++
 .../platform/rockchip/rkisp1/rkisp1-isp.c     |  2 ++
 .../platform/rockchip/rkisp1/rkisp1-regs.h    |  9 +++------
 4 files changed, 26 insertions(+), 6 deletions(-)

-- 
2.39.2


