Return-Path: <linux-media+bounces-41548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB002B3FBA0
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8D09163D22
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 10:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD272EF677;
	Tue,  2 Sep 2025 10:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcBNguzN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52F02ED85E;
	Tue,  2 Sep 2025 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807349; cv=none; b=ZlZq3v29QwQAQcbrEsQEj8Wci7i13yeVwchv8YTNEMU+weVP9wJTXO1lF39HNM6umqggHS1Dq4/LchAvhcIeUekAJlU35I1oew/UQ9Xgz0KA0FcaeZuu/n8pNOr+RATaHfTmk5QsUjFzVU4EcF5HeAWKj8ftEQECwXfQdDP3Ax4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807349; c=relaxed/simple;
	bh=n0+3Taf/Y3kIulC+3Cr4t03U8hBxUw4155wqWIOYqLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=owd+6+tyTUx+2d/mOjGw7d86hAfYZnoJo1Ht9GUMh3EJURNGjp/sDnS9fK1Kh8odxA6Hgaia3NIm5LJJF/yxYbH2SURbgAaPvVUlKlfOSU0qlyLGL7iw25A3LYuZytcjBvyiKnmwZnlxNI2PI9j5VJ38mAZh6RVVN8pn7dBbKGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcBNguzN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67865C4CEF5;
	Tue,  2 Sep 2025 10:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756807349;
	bh=n0+3Taf/Y3kIulC+3Cr4t03U8hBxUw4155wqWIOYqLU=;
	h=From:To:Cc:Subject:Date:From;
	b=BcBNguzN9HQQtzY2unIXNrWKi+joVUddGFCKlvH9HrcODm/LTThLopduI/C+/Lwbm
	 oOk7VbXgykenkYJQJYSpwW1EkOZymEQKdQaQG0k2BJWh4SGnlXiejfKKKjQiPGbzik
	 NMFpH2UHTYam5L+MBIP5frbvQUMaNx93quZr8tpT/4SIpvTR9lchhtYTzMc6X4xfu1
	 DVSoF5Pww7U7iDxoqER71UHC4kOmdWy5dGNPnAoJCRbnWo5YYFcB4C7BC53SBx28Er
	 okEZBu0FjDiIiYizzYJolwHDhXSp3XU2Eyg9wNa/Tspz2O5LRYLqdOtE9Bvi3B1yNC
	 C1kXxfjHv9EhA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1utNqM-00000003X7a-3M55;
	Tue, 02 Sep 2025 12:02:26 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH v5 0/5] multicommiters model documentation
Date: Tue,  2 Sep 2025 12:02:17 +0200
Message-ID: <cover.1756807237.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
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

On this version, some texts were improved after Sakari's review.

Mauro Carvalho Chehab (5):
  docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign
  MAINTAINERS: fix a couple issues at media input infrastructure
  docs: media: update maintainer-entry-profile for multi-committers
  docs: media: document media multi-committers rules and process
  docs: media: profile: make it clearer about maintainership duties

 Documentation/driver-api/media/index.rst      |   1 +
 .../media/maintainer-entry-profile.rst        | 263 ++++++++++++----
 .../driver-api/media/media-committer.rst      | 280 ++++++++++++++++++
 .../process/maintainer-pgp-guide.rst          |   2 +
 MAINTAINERS                                   |   3 +-
 5 files changed, 497 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/driver-api/media/media-committer.rst

-- 
2.51.0


