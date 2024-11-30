Return-Path: <linux-media+bounces-22381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B43DD9DF01C
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2024 12:24:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40966163942
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2024 11:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B21F16DC36;
	Sat, 30 Nov 2024 11:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9J/GEJF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DAF13C695;
	Sat, 30 Nov 2024 11:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732965864; cv=none; b=eXsrsqpEc6q08v6ZvK1YGWahiJRYuMIrkL6I1YL9vKYjBVA+RIwGOwA33OdlR8EAKyomelk/l2l0yYYT5987OJNRcx0dpPXDwZOBki+80VxriPbbN8pkXmP/AxG8g9OYlUtdqP8CvKZH8bg9Cnqm/cz4VLqfp2KJagI6ekm9owM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732965864; c=relaxed/simple;
	bh=Vl8VBtBCpOnRSfLYUzYfGJAf6uFw/2LvcaeM1OyIVHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HpeRlI8r5GAJoiuZ+Ee1uzWU8KrW9awMTI8kKetRnG5SIZfaMOAjVy1O+0/y6EqB7xaVPCm8HbBCTB9qj4tkuvOUhH35CnKA4hE62CoFaee8MAiMHqKJeM9gcvMImP1rGCemxnNSIbjc6NBtZAB9CBCyhkiFuW9OqucK4BRMEKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9J/GEJF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A7BC4CECC;
	Sat, 30 Nov 2024 11:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732965864;
	bh=Vl8VBtBCpOnRSfLYUzYfGJAf6uFw/2LvcaeM1OyIVHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W9J/GEJFVW2qcDgdCocTGV7TnHaAgRdUV8SNGZhWV/7XoHoOv+Wy5na/jVGqczB5r
	 O7qIAJ2OHvszvUnzYQcPL4T1TNfWadZUoI/z+2CF0Kveiyelsci+k4+yYnwz+PbJ7d
	 /hbaXHR1j1zOwE55bK1SWy1QIcIWtav54j5/kFPYCPuzc/an/alPCizScMv0WiSff+
	 YhzfA4J6E8sa/2pGLPyi81N8MESEgVjcCsiHG5TWzYgwPdZrrRF86XrDbF4OL773Lx
	 gDP4YUCjoH6oyPi4So8MCbEHqXONhhfFwsohNk5Hz5KIYLQHA0trO4axSsObLwYDG2
	 7ZgjvOvXPNr8A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tHLaH-00000000cuf-1YWF;
	Sat, 30 Nov 2024 12:24:21 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH] docs: media: profile: make it clearer about maintainership duties
Date: Sat, 30 Nov 2024 12:23:54 +0100
Message-ID: <a864d9f3e04f38ba8ac17985d79b20f86046f190.1732964559.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1732872169.git.mchehab+huawei@kernel.org>
References: <cover.1732872169.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

This pach is against:

https://lore.kernel.org/linux-media/cover.1732872169.git.mchehab+huawei@kernel.org/

During the review of the media committes profile, it was noticed
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

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/media/maintainer-entry-profile.rst | 5 +++++
 Documentation/driver-api/media/media-committer.rst          | 6 +++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index 650803c30c41..6daf71bc72c1 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -147,6 +147,11 @@ b. Committers' workflow: patches are handled by media committers::
 On both workflows, all patches shall be properly reviewed at
 linux-media@vger.kernel.org before being merged at media-committers.git.
 
+Such patches will be timely-reviewed by developers listed as maintainers at
+the MAINTAINERS file. Such maintainers will follow one of the above
+workflows, e. g. they will either send a pull request or merge patches
+directly at the media-committers tree.
+
 When patches are picked by patchwork and when merged at media-committers,
 CI bots will check for errors and may provide e-mail feedback about
 patch problems. When this happens, the patch submitter must fix them
diff --git a/Documentation/driver-api/media/media-committer.rst b/Documentation/driver-api/media/media-committer.rst
index 1756a7af6353..a873ef84fbca 100644
--- a/Documentation/driver-api/media/media-committer.rst
+++ b/Documentation/driver-api/media/media-committer.rst
@@ -87,9 +87,9 @@ be delegating part of their maintenance tasks.
 Due to that, to become a committer or a core committer, a consensus between
 all subsystem maintainers is required, as they all need to trust a developer
 well enough to be delegated the responsibility to maintain part of the code
-and to properly review patches from third parties, in a timely manner and
-keeping the status of the reviewed code at https://patchwork.linuxtv.org
-updated.
+and to properly review patches from third parties for the drivers they are
+maintainers in a timely manner and keeping the status of the reviewed code
+at https://patchwork.linuxtv.org updated.
 
 .. Note::
 
-- 
2.47.1



