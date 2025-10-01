Return-Path: <linux-media+bounces-43477-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A830BB0DC9
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCCD02A6C7B
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01CF30E0CD;
	Wed,  1 Oct 2025 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rb2bdfB+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7FE2EAB8E;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=YaP9xUYUdLSMTYT6LiG3ar/rIP6U6Z5gIeBCJU1Dq1RY2OvfoYIIljrQHDoCsfjVxd7rZofqbNUYPmYOHY+QskXJ2igOef6ClBqJE+BHVAULXLh85IHQ+8ZeeBAep0MaWeq6D2mPEniMsaQPaM6IRC5otWTFvI3NX+KkxNXbuzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=quJA1Nh80cs+Ipf6Dqjr1VgadIpCqZGsThtJSHhZD4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BJubgdxEhuhxGEEQdw3HkobWUwgvm0uaWM2V1WZ9zfxhtQ51orL77Co7KmMBvClvvVJFqck38gNSjqLw8yB4edM930md3dMg1v1umwsCHEYjamIn8ZShAATEhCqLeA79Y7XEpNPTJ+mQPpqBSrgH68ZIehsm3HTpLKLtt6S1vs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rb2bdfB+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A078C4CEFD;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=quJA1Nh80cs+Ipf6Dqjr1VgadIpCqZGsThtJSHhZD4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rb2bdfB++M0syD5ni5OlXot3bBvsomdW944ZufewB19feYrktlCHh+aDH01Frp9iH
	 4SoeB63am/xxncPSCzVTUFBpKDJqr96sC+qYzO12A18I0GxtVBmRGN/eYOEiKBF7ch
	 YhKgZ5llJ8UAUHisvpMSgZ2Dj5c6aAeZTrV3m9Py3AVklXYOrIrQQ+/8rYOLJkmjah
	 PmUcFsvM+x9Xj4hOhymjaYBDL1Pv+jPIiiaeSHWA4S/1NrHeHV3M12Qox/hyQGBQa3
	 WsqKmxyMn6WJQBmQM4VB+ekUomJ/M/6QY3kBg9Fu2/oocaOgfrbw0Peh62UnKsprIC
	 PKcQs+3c+kuXQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLIV-1Q66;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 08/23] tools: docs: parse_data_structs.py: accept more reftypes
Date: Wed,  1 Oct 2025 16:49:31 +0200
Message-ID: <5c146923d1e3183893f290216fb1378954e2e540.1759329363.git.mchehab+huawei@kernel.org>
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

Current regex is limited to only some c-domain reftypes.
There are several others.

Change the code to pick the name specified there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/lib/parse_data_structs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/docs/lib/parse_data_structs.py b/tools/docs/lib/parse_data_structs.py
index 0d537e989ea7..25361996cd20 100755
--- a/tools/docs/lib/parse_data_structs.py
+++ b/tools/docs/lib/parse_data_structs.py
@@ -214,7 +214,7 @@ class ParseDataStructs:
 
             # Parse reference type when the type is specified
 
-            match = re.match(r"^\:c\:(data|func|macro|type)\:\`(.+)\`", new)
+            match = re.match(r"^\:c\:(\w+)\:\`(.+)\`", new)
             if match:
                 reftype = f":c:{match.group(1)}"
                 new = match.group(2)
-- 
2.51.0


