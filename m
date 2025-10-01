Return-Path: <linux-media+bounces-43474-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F19ABBB0DF6
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3976D3C10A1
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA143043B2;
	Wed,  1 Oct 2025 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfM8+kFz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A75B2E7BDF;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=u7GRn1HqrfkX29piAPUG3TtBTQhwglQDO9Ufs6qHTZFXg7L8KAe2MG/JUtFZ3KRbJoqycpT3aNbp3hqrV4VD0aaeQGgAGiSca+k6riC57765wziFHaxr0sMff2oh7vc+g/DcQJjjVhnU2WqyJDYRq3zL4CbsKYUwP7Etafcnz/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=0NUf4P/Q4WR/U/stb2+7dyUV24T2i6L49JbFrd1K4lI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SpU92kJYn58TrEEGmopDiHX0N7os7YYakeEMkrcttqlxb8a6y8aNChCHl9wfpbRiWRg0TAW1WuMoIQu1pMv/rOcWor1z7EYIpubxk+3QmPhwUKCESQ/d1dJQc4gHJpW5mBzn1xkrcfdQYgaO+zwjHqquMwPAdiZMoRtipgJtfHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfM8+kFz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005C7C4CEF1;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=0NUf4P/Q4WR/U/stb2+7dyUV24T2i6L49JbFrd1K4lI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nfM8+kFzQCHIpafaONhCUzNh+UoiKwIDMJiesYk5VPFcjTg6MzlECZi3aDnofHbA3
	 /z4VRSqyuEs2XVLCNrYDkGi9O4jdZehri2BFAuZXeEKxLCtPDs0Le+Tz/09CktDpJa
	 5VrzhBZE6TNMBhpcf1uqrpdhieYx7xXwYyIkq97lO2u5Snb7yA6v6aMysvEZIhjGEb
	 FH7T61Ipai4INmYaLKYejSxKab+IBG5hKL4h82H+B+u+DDFELflLaRybVESU/vnbG6
	 pz8kjnJ/akuoUlg4y+0ZfpEh2hqSdwDU5t1tLpNCBpp0u6WeDt41F54QdxInPcNptd
	 UWTQWJIVk2VNQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLI3-0aim;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 01/23] tools: docs: parse_data_structs.py: drop contents header
Date: Wed,  1 Oct 2025 16:49:24 +0200
Message-ID: <4bf353e5248133a3b0abd82519a38453402fe7c6.1759329363.git.mchehab+huawei@kernel.org>
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

When used in practice, one may want to have multiple header
files on a single rst file, like:

	***********************
	Digital TV uAPI symbols
	***********************

	.. contents:: Table of Contents
	   :depth: 2
	   :local:

	Frontend
	========

	.. kernel-include:: include/uapi/linux/dvb/frontend.h
	    :generate-cross-refs:
	    :toc:

	Demux
	=====

	.. kernel-include:: include/uapi/linux/dvb/dmx.h
	    :generate-cross-refs:
	    :toc:

	...

So, don't add ..contents:: here.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/lib/parse_data_structs.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tools/docs/lib/parse_data_structs.py b/tools/docs/lib/parse_data_structs.py
index a5aa2e182052..6c868f84f029 100755
--- a/tools/docs/lib/parse_data_structs.py
+++ b/tools/docs/lib/parse_data_structs.py
@@ -397,16 +397,10 @@ class ParseDataStructs:
 
     def gen_toc(self):
         """
-        Create a TOC table pointing to each symbol from the header
+        Create a list of symbols to be part of a TOC contents table
         """
         text = []
 
-        # Add header
-        text.append(".. contents:: Table of Contents")
-        text.append("   :depth: 2")
-        text.append("   :local:")
-        text.append("")
-
         # Sort symbol types per description
         symbol_descriptions = []
         for k, v in self.DEF_SYMBOL_TYPES.items():
-- 
2.51.0


