Return-Path: <linux-media+bounces-41547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E24B3FBA2
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6232E3AA738
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 10:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEA42EFD80;
	Tue,  2 Sep 2025 10:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cIsb9AGT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C536F2ED85F;
	Tue,  2 Sep 2025 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807349; cv=none; b=YNkyyUsk123y6fgFPXQMztW4eFNW0pREOePe/+VgJLkVO2nBH7np7Q5O9TCigsmBqfH5dQnOPor0JdBgsUWqG0klNcEiotnDsZCcGzhejbz6MB24Q1uPFJJctyQ/4VSEBOHgyighur+zwAxdceKtZ6E6jElRU6NpdJVMebt62uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807349; c=relaxed/simple;
	bh=LAo3nqtn7q1/wRUFDy4gQhzWvEEWIBsqnEMQ6Y0XiwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GrnHb0hduIJscgM3SgP0XO1ogUeHIUJrii7tiwfE5f2tOvnnQaqsJousRVvOMIklSm1IkugbmQ9MgoRhri/EwnNHvZbHBTzTLdc+oGEOF17cIkpnD0vyjaLv21rA/wzFIzD3bN2lzl+ZJSTHJ4105FBU0SB05ujeq3GwNjm5BDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cIsb9AGT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF53C4CEF9;
	Tue,  2 Sep 2025 10:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756807349;
	bh=LAo3nqtn7q1/wRUFDy4gQhzWvEEWIBsqnEMQ6Y0XiwM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cIsb9AGTjJVUl+D1C18BMMjwz5mjvfvoDzuYS2HWE1LGVaADdwgX41cuTiLIiOYVf
	 yc8Hg8bj6Fi0pxbuurdl+E+eFZyL3Sq5El3TX03qtbekay5zHRaZGHexnC2bMNpVds
	 A4akGMKuSVOe4d34zrWEkKoLTPxCfRWNMgokkDuzTYwib0ddnu8fGYjcG2egQ2jsZj
	 PiGlgOpB/cvgCB0nrKmmpk24NzBEc/rqQOY1L5tc2huGmwC2OhTJZ3vz2Y6PI8+xPJ
	 YhQFJMlgpDfryaBlQZqLrOw6G5TTe0Fw4SiIENeqcI207SAMKCXGNo1s2wN5EIpYW7
	 fZ3EDoSgBxyNA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1utNqM-00000003X7t-3v7e;
	Tue, 02 Sep 2025 12:02:26 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Hans Verkuil" <hverkuil@xs4all.nl>,
	"Sakari Ailus" <sakari.ailus@iki.fi>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v5 5/5] docs: media: profile: make it clearer about maintainership duties
Date: Tue,  2 Sep 2025 12:02:22 +0200
Message-ID: <718b1a0c51464d4f4cf1306e68014a239a6263a6.1756807237.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756807237.git.mchehab+huawei@kernel.org>
References: <cover.1756807237.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

During the review of the media committer's profile, it was noticed
that the responsibility for timely review patches was not clear:
such review is expected that all developers listed at MAINTAINERS
with the "M:" tag (e.g. "maintainers" on its broad sense).

This is orthogonal of being a media committer or not. Such duty
is implied at:

	Documentation/admin-guide/reporting-issues.rst

and at the MAINTAINERS header, when it says that even when the
status is "odd fixes", the patches will flow in.

So, let make it explicit at the maintainer-entry-profile that
maintainers need to do timely reviews.

Also, while right now our focus is on granting committer rights to
maintainers, the media-committer model may evolve in the future to
accept other committers that don't have such duties.

So, make it clear at the media-committer.rst that the duties
related to reviewing patches from others are for the drivers
they are maintainers as well.

Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/media/maintainer-entry-profile.rst | 5 +++++
 Documentation/driver-api/media/media-committer.rst          | 6 +++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index 4e6eb1225ade..d6d8ca5eed09 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -184,6 +184,11 @@ b. Committers' workflow: patches are handled by media committers::
 On both workflows, all patches shall be properly reviewed at
 linux-media@vger.kernel.org (LMML) before being merged at media-committers.git.
 
+Such patches will be reviewed timely by the maintainers and reviewers as
+listed in the MAINTAINERS file. The subsystem maintainers will follow one of
+the above workflows, e. g. they will either send a pull request or merge
+patches directly at the media-committers tree.
+
 When patches are picked by patchwork and when merged at media-committers,
 CI bots will check for errors and may provide e-mail feedback about
 patch problems. When this happens, the patch submitter must fix them or
diff --git a/Documentation/driver-api/media/media-committer.rst b/Documentation/driver-api/media/media-committer.rst
index 3d0987a8a93b..0bc038a0fdcc 100644
--- a/Documentation/driver-api/media/media-committer.rst
+++ b/Documentation/driver-api/media/media-committer.rst
@@ -90,9 +90,9 @@ be a part of their maintenance tasks.
 Due to that, to become a committer or a core committer, a consensus between
 all subsystem maintainers is required, as they all need to trust a developer
 well enough to be delegated the responsibility to maintain part of the code
-and to properly review patches from third parties, in a timely manner and
-keeping the status of the reviewed code at https://patchwork.linuxtv.org
-updated.
+and to properly review patches from third parties for the drivers that they
+maintain in a timely manner and keeping the status of the patches at
+https://patchwork.linuxtv.org updated.
 
 .. Note::
 
-- 
2.51.0


