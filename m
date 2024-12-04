Return-Path: <linux-media+bounces-22624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B439E3BB5
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 14:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54882B382FD
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 13:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B80D41EC013;
	Wed,  4 Dec 2024 13:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWJEVs1z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3361E49F;
	Wed,  4 Dec 2024 13:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733320087; cv=none; b=nkkSjQ0bY8yR0EHqdWMarKE7uzD0CK+L9xmJwjAsk/6++RS28uiONRy0VesKFarYsvzheZ9Y7O+e4HAb94xSY0zbGJYPqgDPo93+msuFsuBPNmstve42kMbdL4GChn1tpSXL2FBDlyqS+wbuvARKAZd/Lfi19vNH7u3zh2b+Uqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733320087; c=relaxed/simple;
	bh=qeDEnoh0E2A1j7pmGChTVBMOi74pfwfzdVCdE87fHjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aL1IBbNJ6pXhkuN+MKGbLWa1SNF6ajY5SUhSRxFJ+xx3DwzQZo4ow4Xg+Z3zxJzXf2rgi74C0iqLWoY+NksgIywJikoLxpbpyG4VDxTLofAd6F3Fz6AfHaG+DoW88W28kMTC3oVG44rHm54rQhzscQuJOOwa6+jHbJKTjRavzDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWJEVs1z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F80FC4CECD;
	Wed,  4 Dec 2024 13:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733320086;
	bh=qeDEnoh0E2A1j7pmGChTVBMOi74pfwfzdVCdE87fHjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tWJEVs1zgYe2hNgVoFAvRw0oeGXnE7eJXLfDlkyB2+qAP9gFKa01zN3Dkbw34IqDP
	 NAIOR+30cL6Fe+WVzh7pwlVjHkseEm44yThJz9/F9PhNbj/SSAzlz+oXn8siHQ0Ttn
	 IiNq6CR6boGO0IOUYWoiJNwrIQaGjlzs0lcNRE3XA+hOqdfugVeZtAAv95HnoJ14x0
	 3eZ1KO/mc1qC80g31U9syzX8vYwGidT+Ty+n4XoNsIrPX+SCxWnPa2fgrQe1l2Qgqz
	 omBf2bWq1rUQDikZkuO2Wpqb/QXMjSPFXLRCJpFE40MUO69Dx78o5seKnLXvXfs35l
	 tr77JvvI6r0Jw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tIpjY-00000004eg2-2y0X;
	Wed, 04 Dec 2024 14:48:04 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] MAINTAINERS: fix a couple issues at media input infrastructure
Date: Wed,  4 Dec 2024 14:46:59 +0100
Message-ID: <edb356f1ff58fe5938ffb275aa2574d127bed822.1733319659.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <8f663390c31d6c0c7acec3f39a4a7bf334a01309.1733319659.git.mchehab+huawei@kernel.org>
References: <8f663390c31d6c0c7acec3f39a4a7bf334a01309.1733319659.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The media input infrastructure is missing a record for our maintainer's
entry profile. Also, patchwork link is wrong.

Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

Patch resent a second time, as reference msg ID got wrong.

 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..264c0caec2df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14510,8 +14510,9 @@ MEDIA INPUT INFRASTRUCTURE (V4L/DVB)
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+P:	Documentation/driver-api/media/maintainer-entry-profile.rst
 W:	https://linuxtv.org
-Q:	http://patchwork.kernel.org/project/linux-media/list/
+Q:	https://patchwork.linuxtv.org/project/linux-media/list/
 T:	git git://linuxtv.org/media.git
 F:	Documentation/admin-guide/media/
 F:	Documentation/devicetree/bindings/media/
-- 
2.47.1


