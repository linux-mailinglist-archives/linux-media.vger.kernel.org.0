Return-Path: <linux-media+bounces-38934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B81B1B458
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 15:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D88C81720A4
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 13:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E3E2264D5;
	Tue,  5 Aug 2025 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uqnu1dYd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26877272E5E;
	Tue,  5 Aug 2025 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399457; cv=none; b=HPCYSHC7RoqVoLUCROCbZvrmKbR2Z3k9/iQhzdB7fA/MejvyPrTjdvNQWu2QCM2XzOoHkLMTwY9gA26ocHvj7WV4zbgj/M3fi/qEKkWxcoTJjJVppxZmDk62ex9Uru3H3LxeKVHSNow4W6Hcg1SiZCRrcqeNJrE4u7l1COHus2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399457; c=relaxed/simple;
	bh=M5ollJwl+snM7Hh61RefnyShnCbCwSzQ1DNbZc2gfZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VAT8Q5RFNpP/eVfMSZAVbjrQnoKQjVkkC2Sv8aLLcLIlyQdYsr9gQ6qEIQZB/fbLZ/yagJzpY6KUKUUnrVnUxFt2eYFo9U7Hj+gR8xv0oEa7RTvVi82E42HWbADpJQUPAdQrnW1+k8bzwxSctYlXDs6A72uJo7FjujXQBYgCeiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uqnu1dYd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54829C4CEF0;
	Tue,  5 Aug 2025 13:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399457;
	bh=M5ollJwl+snM7Hh61RefnyShnCbCwSzQ1DNbZc2gfZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uqnu1dYdB8ngCdKj6B8mv6FOLOwXAGhlSqo3S8RL78qm0XtLdBW5It6i5FWfaGUDC
	 KfgrvWywSXh1+c2TuGF6XKpaWtXho40Z/pexA8EN2HJIF4L3GfhSLSNKWFDM9dI8t1
	 4fySi/LUSOk+LZZS5rzVBpmMB/vlNCU4m1kqS7JkmTdbyaHEOizLQX2Baf8AVpmryD
	 jmm2epSB4YfAgZ6ge1ecb1+vtlJsd6BLtHoSkDiETCV8doggAh3+CTNNRNEatMN9sC
	 uQUowIpe1CnZo75hhbSxD0fll+b53SjX/wlpDduZjOJFXtxmveCsKIwv2CG/i1edZz
	 pVS5mYPKb5M0A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-6.15] media: iris: Add handling for corrupt and drop frames
Date: Tue,  5 Aug 2025 09:09:07 -0400
Message-Id: <20250805130945.471732-32-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805130945.471732-1-sashal@kernel.org>
References: <20250805130945.471732-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

[ Upstream commit b791dcfcba3a0c46fb3e2decab31d2340c5dc313 ]

Firmware attach DATACORRUPT/DROP buffer flags for the frames which
needs to be dropped, handle it by setting VB2_BUF_STATE_ERROR for these
buffers before calling buf_done.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # on sa8775p-ride
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now let me analyze what this patch actually does more carefully:

**YES**

This commit should be backported to stable kernel trees for the
following reasons:

## Bug Fix Analysis:

1. **Clear Bug Fix**: The commit fixes a handling issue where the
   firmware signals corrupt or dropped frames via
   `HFI_BUFFERFLAG_DATACORRUPT` and `HFI_BUFFERFLAG_DROP_FRAME` flags,
   but the driver was not properly handling these error conditions.

2. **Data Corruption Prevention**: Without this fix, corrupt video
   frames marked by the firmware would be passed to userspace as valid
   data, potentially causing:
   - Display of corrupted video frames
   - Application crashes when processing invalid data
   - Incorrect timestamp/sequence handling

3. **Minimal and Contained Changes**: The fix is very small and
   targeted:
   - Adds two flag definitions (`HFI_BUFFERFLAG_DATACORRUPT`,
     `HFI_BUFFERFLAG_DROP_FRAME`)
   - Modifies error handling path to properly set `VB2_BUF_STATE_ERROR`
   - Clears payload and timestamp for error frames
   - Returns early to avoid incorrect state updates

4. **No Architectural Changes**: The patch only fixes error handling
   logic without changing any APIs, data structures, or architectural
   design.

5. **Low Risk of Regression**: The changes are defensive - they only
   affect frames already marked as corrupt/dropped by firmware, not the
   normal video processing path.

6. **Important User Impact**: Video playback/recording with corrupt
   frames is a visible user-facing issue that affects quality of
   service.

## Specific Code Analysis:

The key fix in `iris_buffer.c`:
```c
if (buf->flags & V4L2_BUF_FLAG_ERROR) {
    state = VB2_BUF_STATE_ERROR;
    vb2_set_plane_payload(vb2, 0, 0);  // Clear payload
    vb2->timestamp = 0;                 // Clear timestamp
    v4l2_m2m_buf_done(vbuf, state);
    return 0;                           // Early return
}
```

And in `iris_hfi_gen1_response.c`:
```c
if (hfi_flags & HFI_BUFFERFLAG_DATACORRUPT)
    flags |= V4L2_BUF_FLAG_ERROR;

if (hfi_flags & HFI_BUFFERFLAG_DROP_FRAME)
    flags |= V4L2_BUF_FLAG_ERROR;
```

This ensures corrupt frames are properly marked as errors and handled
appropriately rather than being passed as valid data.

## Note on Driver Maturity:
While the iris driver is very new (introduced in February 2025), this
makes the fix even more important for stable backporting as it addresses
a fundamental error handling issue in a newly deployed driver that users
may encounter immediately upon adoption.

 drivers/media/platform/qcom/iris/iris_buffer.c        | 11 ++++++++---
 .../media/platform/qcom/iris/iris_hfi_gen1_defines.h  |  2 ++
 .../media/platform/qcom/iris/iris_hfi_gen1_response.c |  6 ++++++
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index e5c5a564fcb8..7dd5730a867a 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -593,10 +593,13 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 
 	vb2 = &vbuf->vb2_buf;
 
-	if (buf->flags & V4L2_BUF_FLAG_ERROR)
+	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
 		state = VB2_BUF_STATE_ERROR;
-	else
-		state = VB2_BUF_STATE_DONE;
+		vb2_set_plane_payload(vb2, 0, 0);
+		vb2->timestamp = 0;
+		v4l2_m2m_buf_done(vbuf, state);
+		return 0;
+	}
 
 	vbuf->flags |= buf->flags;
 
@@ -616,6 +619,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 			v4l2_m2m_mark_stopped(m2m_ctx);
 		}
 	}
+
+	state = VB2_BUF_STATE_DONE;
 	vb2->timestamp = buf->timestamp;
 	v4l2_m2m_buf_done(vbuf, state);
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 9f246816a286..93b5f838c290 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -117,6 +117,8 @@
 #define HFI_FRAME_NOTCODED				0x7f002000
 #define HFI_FRAME_YUV					0x7f004000
 #define HFI_UNUSED_PICT					0x10000000
+#define HFI_BUFFERFLAG_DATACORRUPT			0x00000008
+#define HFI_BUFFERFLAG_DROP_FRAME			0x20000000
 
 struct hfi_pkt_hdr {
 	u32 size;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index b72d503dd740..91d95eed68aa 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -481,6 +481,12 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
 	buf->attr |= BUF_ATTR_DEQUEUED;
 	buf->attr |= BUF_ATTR_BUFFER_DONE;
 
+	if (hfi_flags & HFI_BUFFERFLAG_DATACORRUPT)
+		flags |= V4L2_BUF_FLAG_ERROR;
+
+	if (hfi_flags & HFI_BUFFERFLAG_DROP_FRAME)
+		flags |= V4L2_BUF_FLAG_ERROR;
+
 	buf->flags |= flags;
 
 	iris_vb2_buffer_done(inst, buf);
-- 
2.39.5


