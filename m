Return-Path: <linux-media+bounces-45665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 09454C0E29F
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 14:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A987034E44A
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 13:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2382309BE;
	Mon, 27 Oct 2025 13:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObWpbPOS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03CC236A70
	for <linux-media@vger.kernel.org>; Mon, 27 Oct 2025 13:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761573094; cv=none; b=Fd7WacI0fvpF/lfD8kXDWYdYqdb8Yd0Jjc6rKHhJfQ8k55ZbPQG3ir9Cv+ca1pSVcAQI3FUgE7BYFfcM4SUO1cH9uFSaom60vHp+qnWx5D6VdhVuKsELc/FLHIhTCQfGZNH0Rw0JBJlhJg0V4K36PQd2WCC5OhncRweM77byc/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761573094; c=relaxed/simple;
	bh=sefvxqrKFmegZe01RiXa4C75hWl3Eg3to1YMe6HlL1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f4tQjsMNltfFappc2LM5rOjspRIqudw6rw9YSQczeq07wRkgtuX9w/VnWnkI3FO+PTHqQlTPC/nhcdn8NYxwulzjO90OW8ggqSIwDKWY5t0BXutjgnwRa+i47TcZ+M//tm7128oKgcWO2rKbVpirREWfMfbVXa+FSVrbESd94es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObWpbPOS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C969C4CEF1;
	Mon, 27 Oct 2025 13:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761573092;
	bh=sefvxqrKFmegZe01RiXa4C75hWl3Eg3to1YMe6HlL1E=;
	h=From:To:Cc:Subject:Date:From;
	b=ObWpbPOSNw7RMt8TmCLyRGIGNlDw1zenzitNtX+GZeWCcg5xlW4aijZwhX7iTHAcJ
	 T7KUh7hyI7xjfWapzTksZQb/fpxxxD2Wntkx/7EFiekAAOX+4IsbnRGAcL64NTsOCz
	 guX9DiCg4OQKyA7E6RQGCDPU+Otvz7EpX4eW+Oo/s8C0NIgkGyVhVZq0eqKstVRyFV
	 pXjEqmMKdeC6pfRr0bIrKl8X6NWIUNlsUbU1LWTXJ8T3+G6VFoU8UHT0v7Oe7QThiz
	 3lqlEy+LKgtRWO8QMtslnN79hYEN0d6B/ozbcUXMdpIFyAKXn92AeIKeJh8k4i1wjb
	 ILGxxfkSN47nw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCHv6 0/3] docs: media: multicommitters model documentation
Date: Mon, 27 Oct 2025 14:28:30 +0100
Message-ID: <cover.1761571713.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I finally had time to continue Mauro's work on documenting the
multicommitter model.

It is a fairly big overhaul of v5. The most significant change is
that I extended the maintainer profile substantially. A lot of
the committer requirements from the v5 of media-committer.rst were
actually maintainer requirements, so I moved those over to the
maintainer profile.

Patch 1/3 updates maintainer-entry-profile.rst: it introduces the
three Media maintainer levels (Media Maintainer, Media Core Maintainer
and Media Subsystem Maintainer) and what the responsibilities are.

Patch 2/3 adds media-committer.rst: that focusses on the additional
commit rights that can be granted to a Media Maintainer.

Patch 3/3 adds back and updates the list of Media Maintainers that
disappeared in patch 1/3. Please verify this whether the email
addresses are the correct ones, and verify that the areas of responsibility
are correct and that nothing is missing.

It feels much more consistent to me, I'm looking forward to the
review comments.

I have uploaded the documentation with these patches here:

https://hverkuil.home.xs4all.nl/spec/driver-api/maintainer-entry-profile.html
https://hverkuil.home.xs4all.nl/spec/driver-api/media-committer.html

Regards,

	Hans

Hans Verkuil (1):
  docs: media: document Media Maintainers

Mauro Carvalho Chehab (2):
  docs: media: update maintainer-entry-profile for multi-committers
  docs: media: document media multi-committers rules and process

 Documentation/driver-api/media/index.rst      |   1 +
 .../media/maintainer-entry-profile.rst        | 407 +++++++++++++++---
 .../driver-api/media/media-committer.rst      | 196 +++++++++
 3 files changed, 548 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/driver-api/media/media-committer.rst

-- 
2.51.0


