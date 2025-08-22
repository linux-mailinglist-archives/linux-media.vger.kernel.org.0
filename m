Return-Path: <linux-media+bounces-40732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C51F0B311E7
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 10:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3874A188A9DD
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 08:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2522EBDF8;
	Fri, 22 Aug 2025 08:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N0cGWGx8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BEF287276;
	Fri, 22 Aug 2025 08:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755851635; cv=none; b=uJjyZPaeRCIk68HZJcHSqe1s21Bw0AZg98lzLWcq/3XV0Y+lCDCnAVQzfZk1egKVe5pFXJgrTDRB54Ivq5AhwnU8nDNfzoFfvEv/N1sXAB/e0ATW10JtPIX8bs9qWWy74CPBebKU+uPynPdC/UWkG77k2A5ETQ0LVvihKA27aqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755851635; c=relaxed/simple;
	bh=183W5O0QxZQWSvlMts7gA8SMvMkEGWItKTM6hzdndNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j8RcACgBgcD5wduMta4l/3rr8Y+Xj15g0tI4wFDynf6HjspwJ69VC/htWc0zb3GFUrorJdXi6/uKu1HUmvc2EPVG9vi/h/Sfaf9TFPtWuRnpqvHdp8P8/nZf0pnn8uw9fb+F8PJIvIvcdyDvYG7IPWWKxrJaOdEBB0g60lKvxDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N0cGWGx8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81EC0C113D0;
	Fri, 22 Aug 2025 08:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755851635;
	bh=183W5O0QxZQWSvlMts7gA8SMvMkEGWItKTM6hzdndNQ=;
	h=From:To:Cc:Subject:Date:From;
	b=N0cGWGx8K7DzK7oOpfKvzgKX2l5Sx4NyG7YlKlr8Glo0mQzP4FTugHO/fAgT9H4mP
	 jRMKqFjIMQJK4cJUiEpXADd0siHC+fYxr42eAp8PAZ1FdfOuqV9o8QiieNRVxihhZi
	 kqrCZLjkGxbsTPpgprwD54aJRy/6DiijVN6Quzz/IPx1yuUETb6vXB0yxZj5C0b0Wh
	 cL8MbUM1mdO+VkjVaS574vIsH8zM0zUU2yxuZ/Clxj/02Bi5me02Kt7pQTf/fWxRAV
	 oOIc+CcEmEgc+XqNatF07ThkRrKYV8Squ8B6VRArBkAFZKPNbXeQmEiOju5A3opt9s
	 o1MkkMEZz54qQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1upNDd-0000000C1Ux-2XhE;
	Fri, 22 Aug 2025 10:33:53 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH v5 0/5] multicommiters model documentation
Date: Fri, 22 Aug 2025 10:33:40 +0200
Message-ID: <cover.1755851331.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

This is a respin over the latest discussions with regards to the media
multicommitters model.

Feel free to reply with tecnical comments to the text, but personal
attacks and CoC violations won't be tolerated this time.

Mauro Carvalho Chehab (5):
  docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign
  MAINTAINERS: fix a couple issues at media input infrastructure
  docs: media: update maintainer-entry-profile for multi-committers
  docs: media: document media multi-committers rules and process
  docs: media: profile: make it clearer about maintainership duties

 Documentation/driver-api/media/index.rst      |   1 +
 .../media/maintainer-entry-profile.rst        | 256 ++++++++++++----
 .../driver-api/media/media-committer.rst      | 280 ++++++++++++++++++
 .../process/maintainer-pgp-guide.rst          |   2 +
 MAINTAINERS                                   |   3 +-
 5 files changed, 490 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/driver-api/media/media-committer.rst

-- 
2.50.1



