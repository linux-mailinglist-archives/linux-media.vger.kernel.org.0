Return-Path: <linux-media+bounces-27505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E79A4E900
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 18:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53E258C0D45
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 16:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46AB2857CB;
	Tue,  4 Mar 2025 16:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWcfLBpg"
X-Original-To: linux-media@vger.kernel.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C73259C97
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 16:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106223; cv=pass; b=dhza7U3AL0N684ZpvkE2duT00ijX5YXzwEjgznm2JKjerEr/yXfIMOkXqy0JYtwPvBbaTSVLeOWKSB+O8QwX3sglDIeOhprMpRsY0+ZM4HYbg/0sB4hIBxdqDCtN61WPK1OVSiMAr8+l0Y6sA5qwEaOUjhq4F4O3RICV7S6fcM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106223; c=relaxed/simple;
	bh=vexmjRShWRkr7S+O8wIzsYn1ODE9j/1sozVgI1TDUjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjeCUITubecpKXF+5J4L2twNp4Yqn7uXxJNim7y0XoI0+P5meVFGrkmLd1/9mW4twGpgQ/ARD1zHYfGSw2D//9keaS5nRWqqEkfCfDXqObh+NNPajLntEGQD/7See6g72qIHD/7cIpnmoztrfkjT2Kon+9L6Tr4YHK8f3iSIOFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWcfLBpg; arc=none smtp.client-ip=209.85.167.53; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; arc=pass smtp.client-ip=160.75.25.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id 0096640D9768
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 19:36:59 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PWcfLBpg
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6h930Mx6zG39G
	for <linux-media@vger.kernel.org>; Tue,  4 Mar 2025 19:34:31 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 8360442736; Tue,  4 Mar 2025 19:34:15 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWcfLBpg
X-Envelope-From: <linux-kernel+bounces-541606-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWcfLBpg
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id DDE4D41D32
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:46:05 +0300 (+03)
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by fgw1.itu.edu.tr (Postfix) with SMTP id 681C83063EFC
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 14:46:05 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C3193B91D9
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF58202986;
	Mon,  3 Mar 2025 11:40:20 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CC3200BBC;
	Mon,  3 Mar 2025 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741002017; cv=none; b=NK2DnzDkaOZeOf/mT5QmIJoLoKEj6HnGqV6+2Gbk+vktV9JHiQDZHowleyLwoKPkynJEM/7D4qjox5265EomH4IzCPv2b9YuCvM6gJbgwbAe3jDEGYMHySM59lbfYSUX5EV2MsDDLYyJ8ft6HfDlxC0VrUQWKokrGw8FZNP3Exk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741002017; c=relaxed/simple;
	bh=vexmjRShWRkr7S+O8wIzsYn1ODE9j/1sozVgI1TDUjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bp3aqvUx8Fb9JqUvHtvCbKIBubOo+WQSm/owfF7NrC6+PbJqsrkPi3/X/xiCHL1fi6fO2P52FIO+zNIFKspKjQmOqXcmU/hyrOUGpyIKof95L+wVEXtzIlU0+bdQkS/TFvcsslSuiw3JiM8yB+1sIKQPhCIBSbkNsavIMiiQWEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWcfLBpg; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5494bc8a526so3717827e87.0;
        Mon, 03 Mar 2025 03:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741002013; x=1741606813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3KshhKLPc3asFmOXQnuU+ysx6yVcCHiVd9RsF7krHs=;
        b=PWcfLBpgbyy01yn5+C0iJvUKDGS3hDiO+8ezodFzKDM1PrDwyXd9c3YpAfyRvgkVKH
         NfJSQQmxBGLNAlvSTtpvDJgaP4lgAuSu19p66EoCpllYBqeU8uyEOLhHF5fmrajxvWdx
         rsZTAuy/YSa46607ao7hsEPAzMlfohqa5KmicpPOViW9yhMxRCDEE6W/eQYRp7Juk/P8
         MxXElLKztOFprUWanUNzCQ9JImc+KGSnqdDu1V5/ujSMxJpk0tzLttGcPERFqt25RT7E
         MK74uQlOpp2Xa4BJ/yQBG99bJ3wfpLUZBIomiPfzmo6Kj+7l3UHfWhAnl1+OHnaKjKTO
         xi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741002013; x=1741606813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3KshhKLPc3asFmOXQnuU+ysx6yVcCHiVd9RsF7krHs=;
        b=U6j6SeiWo/CnWoQm188JMboR12+9RsAqwFLOM/C0mqlvvxckmNz0W8hhjcrk23Zj30
         CijLWU+s/WuagumHVkGAS1IMny4EWCXI6hq2S8YJTbaIM1lvPI9LlRz/hcslvQ6l4nYY
         pMq+LHruy+BejjAKzuYLsVg0qOQAHfkKIHAq2zYp5py0uHDX1rzAF3KgrWFkSTlj7LZ4
         cIrL2s4+y4akda27LroKk9j4oN8KuYLTuHMfhpADRyfd9YvoSgzlRuVoFnOjzoPyOHhG
         Zj8X7g+pzMV8AV+3wZygOXgD2UGGT1mjl7ILLlMqPsrZR1tFRFSxJ9rtEfpxRs3+M6l1
         Hk2g==
X-Forwarded-Encrypted: i=1; AJvYcCU5hBwdkhnMhEVjJXBUD687PCj/xZ1eagIU1AUNA4Z4UQnjRTcyedAgr4kIwBQQYYsi7BLE75Q1zwNYeok=@vger.kernel.org, AJvYcCUO3DqrszZUvOFfpOAJHD1JBYzOwnY2C2RWYaWhzOb4w1UmdeNxcamPWzY6YiErSZ/j4iUOHhAA@vger.kernel.org
X-Gm-Message-State: AOJu0YxGM+zXt87Cgt/hNxuGiWP2qv/7se0t6yx5hUNFP4lGs/VgHY3v
	8j7P2IS+Bu7205aO2ssZuuA3VXpsh/rnip/QqtcdnUWJff03S0nmp4JE/50H
X-Gm-Gg: ASbGncsyx/8rQ9Q6HUvyifVWGO0xZRQ9k0ocBwAytbpmX1B7It1WN3v+vHlmPsIH/T5
	jlHs2DucZC7KdMbiWRdxvtZoruILHiQ6fn1BEBo35CAnv4NJwvjm1aJlHj/B9iKp9V45IEYL4l1
	JPemHCm4q0sh6QZwC7BZisseNWexQq8GT8ITIe6HGqYkhRGuXdf0lxDniHjyix4t5Uni4fYpeE/
	keHQGuu0e+GDWSCUeYYuXVYVHHzVFVIOPLvBKtahhhr+UYRn0z+ckIMI3VWKwYAfLThyb4eWfBb
	WsWXpX3OksF7J9tdrULTpP6k6R2Rb/KyrniNbXZ2/XZ3UsIsCedngbwVnONTImgluTjnJEM63Jp
	bB5j1IDUwjR3Shj4BCR6Iy7PYQZYR44nkPQY6HZRM
X-Google-Smtp-Source: AGHT+IEbZSAS8VlrLgb63qXjtHIvC4htXmc8dPx7Hmc+Hwrr8Xjf0XYoxC/WEWCfUuOyOIo58FGCyA==
X-Received: by 2002:ac2:4a74:0:b0:549:4e80:6dc0 with SMTP id 2adb3069b0e04-5494e806dc6mr4270805e87.0.1741002012981;
        Mon, 03 Mar 2025 03:40:12 -0800 (PST)
Received: from razdolb.local (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54949de706fsm1125399e87.23.2025.03.03.03.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:40:12 -0800 (PST)
From: Mikhail Rudenko <mike.rudenko@gmail.com>
Date: Mon, 03 Mar 2025 14:40:09 +0300
Subject: [PATCH v4 1/2] media: videobuf2: Fix dmabuf cache sync/flush in
 dma-contig
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-b4-rkisp-noncoherent-v4-1-e32e843fb6ef@gmail.com>
References: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
In-Reply-To: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6h930Mx6zG39G
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741710936.58121@yv20+izdIMvf6NGCUqDZoQ
X-ITU-MailScanner-SpamCheck: not spam

When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
commit 129134e5415d ("media: media/v4l2: remove
V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
no-ops, making cache maintenance for non-coherent dmabufs allocated by
dma-contig impossible.

Fix this by reintroducing dma_sync_sgtable_for_{cpu,device} and
{flush,invalidate}_kernel_vmap_range calls to
vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
buffers.

Fixes: c0acf9cfeee0 ("media: videobuf2: handle V4L2_MEMORY_FLAG_NON_COHERENT flag")
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 .../media/common/videobuf2/videobuf2-dma-contig.c  | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index a13ec569c82f6da2d977222b94af32e74c6c6c82..d41095fe5bd21faf815d6b035d7bc888a84a95d5 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -427,6 +427,17 @@ static int
 vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
 				   enum dma_data_direction direction)
 {
+	struct vb2_dc_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	if (!buf->non_coherent_mem)
+		return 0;
+
+	if (buf->vaddr)
+		invalidate_kernel_vmap_range(buf->vaddr, buf->size);
+
+	dma_sync_sgtable_for_cpu(buf->dev, sgt, direction);
+
 	return 0;
 }
 
@@ -434,6 +445,17 @@ static int
 vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
 				 enum dma_data_direction direction)
 {
+	struct vb2_dc_buf *buf = dbuf->priv;
+	struct sg_table *sgt = buf->dma_sgt;
+
+	if (!buf->non_coherent_mem)
+		return 0;
+
+	if (buf->vaddr)
+		flush_kernel_vmap_range(buf->vaddr, buf->size);
+
+	dma_sync_sgtable_for_device(buf->dev, sgt, direction);
+
 	return 0;
 }
 

-- 
2.48.1



