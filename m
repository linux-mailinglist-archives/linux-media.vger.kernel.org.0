Return-Path: <linux-media+bounces-29736-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 677A0A8245E
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 14:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9211C4C504B
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 12:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9583D25FA04;
	Wed,  9 Apr 2025 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhqxgiUk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDBB25E471;
	Wed,  9 Apr 2025 12:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744200465; cv=none; b=ELYNddHyzRrDJc+2PYwSMbv5v++z/wWRbGOt4pwRcpuYebJP6HCSdNxk+A8OwWQdBs3bC26sg6EuJGYwrfMsp0/QNF5LfgvuIMe5jaRjOgLDrLI26AsikaF6hFSBYPkcxUgmh3Lo3KDkvRRSty32lB4/YVyOs8pr8ZeQkpMNyMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744200465; c=relaxed/simple;
	bh=FdUb0DPDYi+ttgoinI37K88fuRyaVge7JDVXiVilF7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XcNksFkot4tsp9YKxl1KmiF7mC7B3atWiA9KGb0S7PdoJKUDFpEDg/Pom0cbkJ57O+41zt72UWS7oA/KncJf74Ds4nyUV4AbUaMLsQuMbk5uCwng0v4UnES5Tevjc/UV5nJb7de1MBPWarHCDpbNDXynRtV1SO0HMc/Ik+pvuNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhqxgiUk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3DACC4CEE7;
	Wed,  9 Apr 2025 12:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744200464;
	bh=FdUb0DPDYi+ttgoinI37K88fuRyaVge7JDVXiVilF7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GhqxgiUktLqE62NnlGbCozLGAOy1ebYKCfRTbO1C2V8isrEUvyivtHWOlIWWY3iNe
	 lT7qBhQi0YUXEHd/a3nybBs+okp72WCBqbBHa/gUT5qc5stTjpZBUhmQIEvTFikt5z
	 3QEX/nurLaDWBdA3+xqEX+t36u0MD+4s/DDnE947U63BOSLACxJE4ATzBnB7162kEM
	 uJVlOhBR6ng/gxrCkIJmx2DVTmwcGtpsyRWe122qGV/9UBAusoKc1mqJjzRiizRz4e
	 qqynMSOHuqVH/gL+pm4QM8yBcDL9Jr5dx5FDs1H6jkyRMDbX2Cuq8465NG5c4c31Ao
	 m0BWGZ8ZfmD1w==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Qiang Yu <yuq825@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Melissa Wen <mwen@igalia.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
	Yang Wang <kevinyang.wang@amd.com>,
	Jesse Zhang <jesse.zhang@amd.com>,
	Tim Huang <tim.huang@amd.com>,
	Sathishkumar S <sathishkumar.sundararaju@amd.com>,
	Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Ma Jun <Jun.Ma2@amd.com>,
	Yunxiang Li <Yunxiang.Li@amd.com>,
	Eric Huang <jinhuieric.huang@amd.com>,
	Asad Kamal <asad.kamal@amd.com>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	Jack Xiao <Jack.Xiao@amd.com>,
	Friedrich Vock <friedrich.vock@gmx.de>,
	=?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	etnaviv@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	lima@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] dma-fence: Improve docu for dma_fence_check_and_signal()
Date: Wed,  9 Apr 2025 14:06:38 +0200
Message-ID: <20250409120640.106408-4-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250409120640.106408-2-phasta@kernel.org>
References: <20250409120640.106408-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation of the return value of dma_fence_check_and_signal()
and dma_fence_check_and_signal_locked() reads as if the returned boolean
only describes whether dma_fence_signal() (or similar) has been called
before this function call already. That's not the case, since
dma_fence_ops.signaled() usually just checks through the sequence number
whether the hardware is finished with a fence. That doesn't mean a
signaling function has been called already.

Make the documentation clearer.

Move the Return: documentation to the end, since that's the officially
recommended docu style.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 include/linux/dma-fence.h | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index dc2ad171458b..3df370b2cc7c 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -385,14 +385,21 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence);
  * dma_fence_check_and_signal_locked - Checks a fence and signals it if necessary
  * @fence: the fence to check
  *
- * Returns true if the fence was already signaled, false if not. Since this
- * function doesn't enable signaling, it is not guaranteed to ever return
- * true if dma_fence_add_callback(), dma_fence_wait() or
+ * Checks whether the fence was already signaled, and, if not, whether
+ * &struct dma_fence_ops.signaled indicates that it should be signaled. If so,
+ * the fence gets signaled here.
+ *
+ * Since this function doesn't enable signaling, it is not guaranteed to ever
+ * return true if dma_fence_add_callback(), dma_fence_wait() or
  * dma_fence_enable_sw_signaling() haven't been called before.
  *
  * This function requires &dma_fence.lock to be held.
  *
  * See also dma_fence_check_and_signal().
+ *
+ * Return: true if the fence was already signaled, or if
+ * &struct dma_fence_ops.signaled is implemented and indicates that this fence
+ * can be treated as signaled; false otherwise.
  */
 static inline bool
 dma_fence_check_and_signal_locked(struct dma_fence *fence)
@@ -412,9 +419,12 @@ dma_fence_check_and_signal_locked(struct dma_fence *fence)
  * dma_fence_check_and_signal - Checks a fence and signals it if necessary
  * @fence: the fence to check
  *
- * Returns true if the fence was already signaled, false if not. Since this
- * function doesn't enable signaling, it is not guaranteed to ever return
- * true if dma_fence_add_callback(), dma_fence_wait() or
+ * Checks whether the fence was already signaled, and, if not, whether
+ * &struct dma_fence_ops.signaled indicates that it should be signaled. If so,
+ * the fence gets signaled here.
+ *
+ * Since this function doesn't enable signaling, it is not guaranteed to ever
+ * return true if dma_fence_add_callback(), dma_fence_wait() or
  * dma_fence_enable_sw_signaling() haven't been called before.
  *
  * It's recommended for seqno fences to call dma_fence_signal when the
@@ -423,6 +433,10 @@ dma_fence_check_and_signal_locked(struct dma_fence *fence)
  * value of this function before calling hardware-specific wait instructions.
  *
  * See also dma_fence_check_and_signal_locked().
+ *
+ * Return: true if the fence was already signaled, or if
+ * &struct dma_fence_ops.signaled is implemented and indicates that this fence
+ * can be treated as signaled; false otherwise.
  */
 static inline bool
 dma_fence_check_and_signal(struct dma_fence *fence)
-- 
2.48.1


