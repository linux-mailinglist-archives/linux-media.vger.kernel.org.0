Return-Path: <linux-media+bounces-43489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A39BB0DF1
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58F5E1947991
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB8630F7F3;
	Wed,  1 Oct 2025 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9FWHeWl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45403019C5;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=JwqXeaWgXnZr9djoUI4d6rO7XuV9nBZUjaBdjJ6c6rZCaPzKURvWkRsJwzDVenS3KnIhi53Y0el7U+NKtxvIktwNMt3cLZeDM/y4C/ZnZ2wyOPmFrIb43JD73ptaLJhB5VEVO2zXoF7xK/tEERPO4WFzcavi5E90Fp2vTC0tgMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=wOiB4fdcRKJl1c/eblFRQcSPxB6yer1N0ORSeW5mvjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pVTDCXk8agsNR3uroABwpOotv2VC2KEe4bknsUBywY+aaFGQ3Rw86KreMmnV1SmCFTzBCHOeoqgW0INT83sQHUbPeKr1hhToG8EitAvHp1hZEHRvFmo0wC7NF63qmmonusMpQYwvC6dJgBdKVeD94RbIXvqPiWUeDb0KKW23jj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9FWHeWl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629A2C2BCF7;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=wOiB4fdcRKJl1c/eblFRQcSPxB6yer1N0ORSeW5mvjQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F9FWHeWlxIrEXOoYWUxxTdb4R1DcZuJMYTfMszPWXHiiKux82i8DppxAEia3SW+Bi
	 NdNm7oJMA1wLFkBh5NGvNbyVszaaMFYQHk+ZspnycotjTHX4IH2bkz2I/FuY4wN62N
	 xkuyX1NPDJj9e1hmf1wyBRPDB4mp1YMRRlOfeDKj3ehlkeiYjJHuU6Jg50xk67YFTx
	 80p10awlyZTdXGO/0XG8cvcr5/mQe3+KdwFJD3RVErSYRVhtkRo9iyugSkg8LwmlbY
	 wp8N/lh1p/nhnxu1UlSRSib+FPDzo5vM3mI9X0esQXk7ZDgCMdXxakOMlT7bcuKTeQ
	 8HVvfGx7C9i0A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLJH-2lK7;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 20/23] docs: cec: show broken xrefs and show TOC instead of cec.h content
Date: Wed,  1 Oct 2025 16:49:43 +0200
Message-ID: <c587872ca3685213d9f8e88277404c9e253633df.1759329363.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1759329363.git.mchehab+huawei@kernel.org>
References: <cover.1759329363.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Enable xref broken warnings. While here, change the output to
only show cross-references, as there's no need to show the entire cec.h
header at the docs.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/cec/cec-header.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/cec/cec-header.rst b/Documentation/userspace-api/media/cec/cec-header.rst
index f67003bb8740..648498bc7d6f 100644
--- a/Documentation/userspace-api/media/cec/cec-header.rst
+++ b/Documentation/userspace-api/media/cec/cec-header.rst
@@ -2,10 +2,12 @@
 
 .. _cec_header:
 
-***************
-CEC Header File
-***************
+****************
+CEC uAPI Symbols
+****************
 
 .. kernel-include:: include/uapi/linux/cec.h
     :generate-cross-refs:
     :exception-file: cec.h.rst.exceptions
+    :toc:
+    :warn-broken:
-- 
2.51.0


