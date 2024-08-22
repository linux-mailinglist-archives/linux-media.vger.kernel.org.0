Return-Path: <linux-media+bounces-16616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1BD95C02C
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 23:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62B5C1F24DFD
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 21:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EAE1D1F5C;
	Thu, 22 Aug 2024 21:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ndpBjLoE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA8A1D0DFB;
	Thu, 22 Aug 2024 21:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724361892; cv=none; b=KSp6RvKP7TFutwzI/m3WsEOMJu9QInemhJAr0PA7oPnm+Axv6yx08fYFXKTaCDP/0wAmxameBqnVCNH4ZDZWdelQRcc/RBuDjtYgzdkYSOlLPEIux7QycyjtvaCb9u8vtCLaIHVg93bg8tKf/N+MzP5kmo6iIDJCjsMamTWrUL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724361892; c=relaxed/simple;
	bh=YQbDKDfdK0d+VNE+gSLqB+p8Aw3FR9VRxRbFZZX7Nr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k7FCIDAEg5+dWchrEYq9AjAGTe5grd9DRkywsK6qFHC2JPkujpXoRdCftG42upzsrQ7USMqMxcojAOEj78Et/xS7gXQWVdG9CHi+gQV7c4MoP22oYKzN056DdlGOm7hdTUeygzF/WJoV3i640Czh5tsWNgPLZXA18KN8TIV8rUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ndpBjLoE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD178219;
	Thu, 22 Aug 2024 23:23:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724361825;
	bh=YQbDKDfdK0d+VNE+gSLqB+p8Aw3FR9VRxRbFZZX7Nr0=;
	h=From:To:Cc:Subject:Date:From;
	b=ndpBjLoE4cEvMInK3CWKAN8IGOJxo/jfjOt5zI0iZfCE7leQCFB5o74MzXhhjunkc
	 bjn3h/AfKo8x3fP6OChjlNFv6cQ4OCrmqWx6S4qZy1Y0DWHzfI5lcYqMFlTmioWATb
	 V/WcG5wAwc2RVL4gwT4Kxs2JWO13+HgKoJUE7U3w=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 0/4] media: Drop one user of the deprecated graph walk API
Date: Fri, 23 Aug 2024 00:24:39 +0300
Message-ID: <20240822212445.2037-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This small series takes one more step towards dropping the deprecated
graph walk API but moving one of its last two users (in drivers) to the
new pipeline iterators.

Patches 1/4 to 3/4 do the bulk of the work by switching the vsp1 driver
to the new API. Patch 4/4 then replaces documentation of the deprecated
API with documentation of the iterators.

The series has been tested with the VSP and DU test suites, and
introduces no regression.

Laurent Pinchart (4):
  media: vsp1: Build the pipeline after starting it
  media: vsp1: Sort entities in the pipeline
  media: vsp1: Switch to the new pipeline iterators
  media: Documentation: mc: Replace deprecated graph walk API

 Documentation/driver-api/media/mc-core.rst    |  67 +++++----
 .../media/platform/renesas/vsp1/vsp1_entity.c |   1 -
 .../media/platform/renesas/vsp1/vsp1_video.c  | 130 +++++++++++++-----
 3 files changed, 136 insertions(+), 62 deletions(-)


base-commit: a043ea54bbb975ca9239c69fd17f430488d33522
-- 
Regards,

Laurent Pinchart


