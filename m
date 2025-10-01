Return-Path: <linux-media+bounces-43493-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F11BB0E14
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C94862A6FB0
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4978330F81B;
	Wed,  1 Oct 2025 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZY55qP6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4759302163;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=iyjh4jfHkaIty4ei3X0z3mbUQvYSHlV47l9uYgkyCt+OyplrsWHBnEXa1zq4pz+R6QMB4lZ2dnC/tFSzAabvP4m3l+mn+sX13kQcPDAa/iddN+mqlB9gr3Gxtoa2qtVOVMT4bci1JDasGNosD+5C/sxvydAXXhlow4v29lxmHZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=ryC8RulKkWB40Miwek8Lr0KemhOIqsU1f4WZR3x9IME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NOfQMwzaikc9Woy9wSVXh1r6w7QctofC1KTi/gpySefxGUBIs0BUkG/qFHODC6gZvV2F3eBN3PBsATyuKWjwnXMDEFGbO7tiwnn2DrvKSw6Wf+lKBdXL9j6u74VEYpYEmnNE4dfTPpkxwCzD45/6AP57BGE+rQErXBhymo7h4K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZY55qP6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60921C19424;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=ryC8RulKkWB40Miwek8Lr0KemhOIqsU1f4WZR3x9IME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jZY55qP6ezdCokgfPTWICBwJRibtd/l9u6v6M70CroGrDjiSvj43Bpx7fd5ZP5eBL
	 PMsCvIlertcHckeSQL7N71Xy/7rvqke0mbnCGrKFOlpelsegR9PJL6P9CwbX4Yi1S4
	 3h6kdBVu8145lSR+kQKVHTfD17HROSd84I0MxKOnsNdMb83ywWdwQ3AWEXV9/j0A/U
	 3iqQhMhGml5m3AeyJwI1M52Sd6iBAshMztJLAz71HU8Jk8OeVJ9CKkePg0Zm2eoeFA
	 jpBpfj7CtbeiS6yg4GQnVVDni9arUxtc5QfvKbCca8s9fipsHughTn3zwCht5P61Vl
	 yUrOYqp/kbf1w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLJD-2eTv;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 19/23] docs: cec: cec.h.rst.exceptions: fix broken references from cec.h
Date: Wed,  1 Oct 2025 16:49:42 +0200
Message-ID: <dd1270dd5d91538cdfb0b087127c53a9f4ba7885.1759329363.git.mchehab+huawei@kernel.org>
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

All references there belong to CEC namespace.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/cec/cec.h.rst.exceptions | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/userspace-api/media/cec/cec.h.rst.exceptions b/Documentation/userspace-api/media/cec/cec.h.rst.exceptions
index 15fa1752d4ef..65e8be062bdb 100644
--- a/Documentation/userspace-api/media/cec/cec.h.rst.exceptions
+++ b/Documentation/userspace-api/media/cec/cec.h.rst.exceptions
@@ -1,5 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
+# All symbols belong to CEC namespace
+namespace CEC
+
 # Ignore header name
 ignore define _CEC_UAPI_H
 
-- 
2.51.0


