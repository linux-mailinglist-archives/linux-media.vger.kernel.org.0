Return-Path: <linux-media+bounces-19888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 914509A4216
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 17:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A6A8285D05
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 15:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F31A200C8A;
	Fri, 18 Oct 2024 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r6v2Ui0I"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A343D76C61;
	Fri, 18 Oct 2024 15:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729264496; cv=none; b=JPudZrWNSMX2P8DbQtEkivvQIOBgRUodPny92fvHPm/YqeiJgXDtTxVH/EwsUXVFE2MJ3AlUoC7ZJvxpG+1cKeF7cahPt76v5m2pPHYIlG3S+Q7b2UtMTyyuev4O4yrTp+dyXICEMueczdPdIWT3qL2bFPGqxBkrDU5cF7Fj5rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729264496; c=relaxed/simple;
	bh=wGv8jPPiROeuMxdNHPFP2YovhdUZEU8BVdG/fDTbVUk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cAoaq4UoXtpv6BrQsnSj1OthkqjwAQART9AMNGrKrhQhKoyte+ay3vDiB/WKNCAi+2vNZt/jwysHUnInMRuHDKtcoShEeGNXEmlHUfieldxX1T9rZNqEYwYqMo7wgmAbkBexkz3HTEHsJt5J89DrbXD/X9QbkqefZc+snW+3w50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r6v2Ui0I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1663C4CEC3;
	Fri, 18 Oct 2024 15:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729264496;
	bh=wGv8jPPiROeuMxdNHPFP2YovhdUZEU8BVdG/fDTbVUk=;
	h=From:To:Cc:Subject:Date:From;
	b=r6v2Ui0IRj6XKF+J/obS7ioyIJ41+8RMhQmnTdTxUqxRwAMLyD5vNxrj7PQ2VLzwC
	 xtB1VWF2Z9P/miSklSkUTBewkOX4YuyzipIFzjM7e1jgQ5xdDMHf6VHS3tU+Zoy6/C
	 GhAMdJUVeeoqjupZi6bIpf+asTlNfChkyW2femw6bItSD70XgG5Y4K7FMFoIcZ5bRB
	 /FiKp7QVVnPOpMCmEOfg7CIVL5/1SoMFgxeuPox10E89mW5R+GlQ15d7pB1+xgWsEs
	 jgXZmxjX3Ojm1+yyrhP0XAJI8/HRzajHr1T4nrvzTlx26EUQ32IV4kVtjN3A6Lbwny
	 3S1m4tb2P3YgA==
From: Arnd Bergmann <arnd@kernel.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH] media: mediatek: vcodec: mark vdec_vp9_slice_map_counts_eob_coef noinline
Date: Fri, 18 Oct 2024 15:14:42 +0000
Message-Id: <20241018151448.3694052-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

With KASAN enabled, clang fails to optimize the inline version of
vdec_vp9_slice_map_counts_eob_coef() properly, leading to kilobytes
of temporary values spilled to the stack:

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:1526:12: error: stack frame size (2160) exceeds limit (2048) in 'vdec_vp9_slice_update_prob' [-Werror,-Wframe-larger-than]

This seems to affect all versions of clang including the latest (clang-20),
but the degree of stack overhead is different per release.

Marking the function as noinline_for_stack is harmless here and avoids
the problem completely.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I have not come to a conclusion on how exactly clang fails to do this
right, but can provide the .config and/or preprocessed source files
and command line if we think this should be fixed in clang.
---
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index eea709d93820..47c302745c1d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1188,7 +1188,8 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
 	return ret;
 }
 
-static
+/* clang stack usage explodes if this is inlined */
+static noinline_for_stack
 void vdec_vp9_slice_map_counts_eob_coef(unsigned int i, unsigned int j, unsigned int k,
 					struct vdec_vp9_slice_frame_counts *counts,
 					struct v4l2_vp9_frame_symbol_counts *counts_helper)
-- 
2.39.5


