Return-Path: <linux-media+bounces-22620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD519E3BD6
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 14:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEBCAB2961A
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 13:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FD01E25E3;
	Wed,  4 Dec 2024 13:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWaz5Bkn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DB08827;
	Wed,  4 Dec 2024 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733319811; cv=none; b=UQCu0vJrTBXvOr8WwUXLj+BOZAm7Pojsnwpw3ENQL6W8DBkr66lYRylmLd6j1yJL0BhEOHIPGzlL3XTm1NUqeRuoLA3QGXnAsHJtqePETleC1I9GpFI9bpQSdBCh/bcVnA1LJGPN/sZsD1+osCRqdydnol7TLl8/lgKjjOGP9nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733319811; c=relaxed/simple;
	bh=R8NnzOD7JNZldivMHQfAB8tX/PLuUz0jZaal8sPcNtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nFlOVJid0mVdBpZNSm2IZDQvz5377KlX8A4tI5zApR3PYT8OTbH/suchDD2lZgBv44p9dpNMoV3g0PqoVBxfGBFL41YDpfAz+QOkx3YodjnrM6RTWAw2tyUnMQ7HSnfV69dEdIubT0k4fIbxn2dMurn+cPD52B8XkSOL6mnQ5PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWaz5Bkn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4573C4CED1;
	Wed,  4 Dec 2024 13:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733319810;
	bh=R8NnzOD7JNZldivMHQfAB8tX/PLuUz0jZaal8sPcNtU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DWaz5BknugmXJa1L9oLaDxnb2e5o2Z7cGn3bwnI1aZNEg9OATozXbe3OARvF9CXO+
	 ZmsImDChURizGvV1SwgHqTDiYxA4YBH6U52kmgslhGIolm9Y+wgiW3dQyoD3VyLb7l
	 x40c07+9U5NeodxZfVot30r38bw7WWGnygYcozwEBLhxsdORWYMmauGAte2/7c3Cli
	 C87F1kXGYSf6yHGpbeAaIci/DQf+0zfoTKhjA+TN8F0a3n5h5Xy5sEdF+XanjfKcY4
	 AaMeG6nf2+SkkVVvcedVzuVcOMFsMGfPIMaSbqh5nI1L89E6AkIykEdRvt7JkFnRvM
	 jqMCMlhPIcuGQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tIpf6-00000004ebt-3HxX;
	Wed, 04 Dec 2024 14:43:28 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH v4 1/5] docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign
Date: Wed,  4 Dec 2024 14:43:02 +0100
Message-ID: <8f663390c31d6c0c7acec3f39a4a7bf334a01309.1733319659.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733218348.git.mchehab+huawei@kernel.org>
References: <cover.1733218348.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The media profile documentation will point to kernel.org sign.
Add a link to it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

Patch resent, as linux-media was not on its Cc list.


 Documentation/process/maintainer-pgp-guide.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documentation/process/maintainer-pgp-guide.rst
index f5277993b195..795ef8d89271 100644
--- a/Documentation/process/maintainer-pgp-guide.rst
+++ b/Documentation/process/maintainer-pgp-guide.rst
@@ -903,6 +903,8 @@ the new default in GnuPG v2). To set it, add (or modify) the
 
     trust-model tofu+pgp
 
+.. _kernel_org_trust_repository:
+
 Using the kernel.org web of trust repository
 --------------------------------------------
 
-- 
2.47.1


