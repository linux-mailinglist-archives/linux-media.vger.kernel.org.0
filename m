Return-Path: <linux-media+bounces-23330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A02729EEAC4
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 16:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88030169036
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 15:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5667E216E29;
	Thu, 12 Dec 2024 15:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EkasPd6G"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA98E213E97;
	Thu, 12 Dec 2024 15:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734016394; cv=none; b=gl8bfs9f8Ttkrpu4XSiywgK9w/6Cvz5h4/gMocnVRZ0n7w3lOkQr13j8rHRosIuAnuRL1cRlbRO3wzYMm/dArgUMJU2UER/2hTDCZ1TP6CyvIoJfFW+dzC8aatWY0QalXtAJp+fOOyoCK6bYyzn/IM5ZTLnBg2WbYXJpHjMby7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734016394; c=relaxed/simple;
	bh=NWANsmF/ITBIbpg1+qwuCTRxiUW0LDZLWQt2cKbM/78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L+kSTUzmvlpsgZIrDqJTeLV04pUUfoRElpZNB/4cAIXiD85/dr57rtxdEx4YHo0hPbXotbrLWyJBmUcK0PUe5W4y82nLB6AUG4nSw3avbjOn9xI6zRkoDSsNZ6VX9VcWPJFdBZwbrqn5F79mYht8xTxVAxwl3CjP2t5kTsEbzps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EkasPd6G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA47C4CED0;
	Thu, 12 Dec 2024 15:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734016393;
	bh=NWANsmF/ITBIbpg1+qwuCTRxiUW0LDZLWQt2cKbM/78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EkasPd6GpzJYmNrXNDjoQibwSIMWLwYSdvAIkyTddJdNLcFWeQcw0ObetCAafOM8g
	 cHDwajUe/0rOQRXxjS2UaBwrp+KQSes8ZuoClrt9KiaIlX7bQEIv2oYenE3+J7md7H
	 Iaqv8LzvfxGf3takaeW9vS0yITBZd7ywhzBLopxM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Friedrich Vock <friedrich.vock@gmx.de>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 6.12 186/466] dma-fence: Fix reference leak on fence merge failure path
Date: Thu, 12 Dec 2024 15:55:55 +0100
Message-ID: <20241212144314.148026258@linuxfoundation.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212144306.641051666@linuxfoundation.org>
References: <20241212144306.641051666@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

6.12-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

commit 949291c5314009b4f6e252391edbb40fdd5d5414 upstream.

Release all fence references if the output dma-fence-array could not be
allocated.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: 245a4a7b531c ("dma-buf: generalize dma_fence unwrap & merging v3")
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Gustavo Padovan <gustavo@padovan.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: <stable@vger.kernel.org> # v6.0+
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241115102153.1980-2-tursulin@igalia.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/dma-buf/dma-fence-unwrap.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -164,6 +164,8 @@ restart:
 					dma_fence_context_alloc(1),
 					1, false);
 	if (!result) {
+		for (i = 0; i < count; i++)
+			dma_fence_put(array[i]);
 		tmp = NULL;
 		goto return_tmp;
 	}



