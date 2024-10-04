Return-Path: <linux-media+bounces-19110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31584990D47
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 21:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7D2C1F22B87
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2024 19:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C985420720D;
	Fri,  4 Oct 2024 18:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KeIJNft9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327EC207A2E;
	Fri,  4 Oct 2024 18:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728066368; cv=none; b=riTATK6kDy5v+gx2XA2vRxGxsqmpWAJdpaMwVD/Ym/PNWpeN4cNVMkjO1fneLINAzEXcR9AkrYqlos1MGwV/PHJmPEhYA+6XmSdBGT+1Wt99qgAR9AQeJWdaovrEIi67KGQKYk+5QvzErNiP4/eXW3hzwPHHjNovPYJ0lZ87vcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728066368; c=relaxed/simple;
	bh=5rnPl8Du6RiRUmsrEfZ224MyYqh7OTCMlG/Ph1AXil4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UAgaCi4yhBDDTt/oxxf4eZCtWsCXtTKhtflmv5nZvDlCVozilMx7aDf4PO0OSHuOkR4263h568r6Nlprj57BazYfpbs1XTQ1f3q68Sh7NyFL8hidCKhNukQWpkFeLGik1NkP0I4NETeUSpza5SKy9SBAGxMvQKzEXdbeItG+c/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KeIJNft9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E6CC4CEC6;
	Fri,  4 Oct 2024 18:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066368;
	bh=5rnPl8Du6RiRUmsrEfZ224MyYqh7OTCMlG/Ph1AXil4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KeIJNft9gewM4ZVvRbDWBx7gEuxe3H1WSfvLCRcYXHke1kJLlB1WNnk6xg4/Hh8sh
	 wCP1CZWRNLaXMXek9tcWLixkYdIEpygMghSK6HRu4gyMYCOi8v7+Dfv2fs0k2EEd7q
	 zn4Ozl26MtIixG19wagzUO/U2kgDTdeQsyaxCIUFJy5MK+HV0TklCo1CfPKP2gl/jA
	 Ibiy7mfZXYUxpqxvk1ZUfSCYzuKHemd/Gi9hTvCaobBtzSJKj+uEDusRgcUZiIFUTH
	 55RmDFoQKc4nax/0H6N1XOt2ly6Lm8Ph+O3hGqlKALOnplSw/Xd6klu1L/jefk5QEs
	 Ns7EmJFHpU7wA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yunke Cao <yunkec@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 36/58] media: videobuf2-core: clear memory related fields in __vb2_plane_dmabuf_put()
Date: Fri,  4 Oct 2024 14:24:09 -0400
Message-ID: <20241004182503.3672477-36-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004182503.3672477-1-sashal@kernel.org>
References: <20241004182503.3672477-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.54
Content-Transfer-Encoding: 8bit

From: Yunke Cao <yunkec@chromium.org>

[ Upstream commit 6a9c97ab6b7e85697e0b74e86062192a5ffffd99 ]

Clear vb2_plane's memory related fields in __vb2_plane_dmabuf_put(),
including bytesused, length, fd and data_offset.

Remove the duplicated code in __prepare_dmabuf().

Signed-off-by: Yunke Cao <yunkec@chromium.org>
Acked-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 468191438849e..29bfc2bf796b6 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -302,6 +302,10 @@ static void __vb2_plane_dmabuf_put(struct vb2_buffer *vb, struct vb2_plane *p)
 	p->mem_priv = NULL;
 	p->dbuf = NULL;
 	p->dbuf_mapped = 0;
+	p->bytesused = 0;
+	p->length = 0;
+	p->m.fd = 0;
+	p->data_offset = 0;
 }
 
 /*
@@ -1296,10 +1300,6 @@ static int __prepare_dmabuf(struct vb2_buffer *vb)
 
 		/* Release previously acquired memory if present */
 		__vb2_plane_dmabuf_put(vb, &vb->planes[plane]);
-		vb->planes[plane].bytesused = 0;
-		vb->planes[plane].length = 0;
-		vb->planes[plane].m.fd = 0;
-		vb->planes[plane].data_offset = 0;
 
 		/* Acquire each plane's memory */
 		mem_priv = call_ptr_memop(attach_dmabuf,
-- 
2.43.0


