Return-Path: <linux-media+bounces-45559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A704C09A28
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 18:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3ADE42739E
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 16:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269D730AD04;
	Sat, 25 Oct 2025 16:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSOyGfof"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F901305960;
	Sat, 25 Oct 2025 16:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409556; cv=none; b=oEdokBuqz4JvOGPX7C7m0geNyRaULfuP8L0lbb3puNQfkSjeQUmiQM++C/PMLjaLjhL6DF88m6oTBwcMnLHQn04BvYR8DnWhUOQCjWqBmgU32Q/bBJYtUOvFldNYcaeA+HjvvEUkY+sIqdjtUVOw9b/QTqVJCPIo6xd1CPVx6pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409556; c=relaxed/simple;
	bh=dulCYm1PbxKSibR4bEJrQmC5RZs08G9Vd7f6mLSA1jc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jclO1DlfPCr/LHjUq3XtZmfusZU3kQWlG8j9CyCVyQOiMoCeT0Dxvj70J7ahlfxTqsfCza3qjqFLMLSo/sKADKI7xh4BSf7W0afdzDFXOof6S5Ksrwj7XYDExWe6uFusiPpZr2Kc89gVhzbjQrwOS7N23KT9NLrZVW5zsrsbkQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSOyGfof; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E76C4CEF5;
	Sat, 25 Oct 2025 16:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409556;
	bh=dulCYm1PbxKSibR4bEJrQmC5RZs08G9Vd7f6mLSA1jc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YSOyGfof1Z0cLB1rvoF3BWg3tvaVBFeZXMaHpMsAdzsH0OvnrDLwMy+e+dd63qapc
	 XPb1+yb7sZPP+PcIRH0fQCUoVH2LAcrLyRlYXM9eTKGvcnlZlQT+Y3M7aPfGZdmXQe
	 CDSrSJ9JvCavE/QHrDBlDSZi80790W3bXCT86PYdP+nCXRgigPpMnVhW19qEOQcpsO
	 qOLJkz+8+3z1bmHnTWdoXWJkyRkyFO+Gy8JM8XN5GUN298nm0B4fx0uIpwXkufkrle
	 LL9dVzLJkNNat9elbXqAoZK8EBfY9hmpkorduG+TGkZFSDvySSfrEYStXyuWHd7UH0
	 ZhLlUcozV7O0g==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	bingbu.cao@intel.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.12] media: ipu6: isys: Set embedded data type correctly for metadata formats
Date: Sat, 25 Oct 2025 11:59:54 -0400
Message-ID: <20251025160905.3857885-363-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sakari Ailus <sakari.ailus@linux.intel.com>

[ Upstream commit f5a2826cd50c6fd1af803812d1d910a64ae8e0a1 ]

The IPU6 ISYS driver supported metadata formats but was missing correct
embedded data type in the receiver configuration. Add it now.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## **BACKPORT RECOMMENDATION: YES**

After conducting an exhaustive analysis of this commit, I strongly
recommend backporting it to stable kernel trees (v6.10+).

---

## **DETAILED ANALYSIS**

### **The Bug Identified**

This commit fixes a **genuine implementation bug** in the IPU6 ISYS
driver's metadata format support:

1. **Incomplete Feature Implementation**: Commit `d3bd039cd2a00`
   (January 31, 2024) added "line-based metadata capture support" to the
   IPU6 driver in v6.10. However, the implementation was incomplete:
   - The function `ipu6_isys_mbus_code_to_bpp()` at lines 19-52
     correctly handles metadata formats (META_8, META_10, META_12,
     META_16, META_24)
   - The function `ipu6_isys_mbus_code_to_mipi()` at lines 54-89 **does
     not** handle metadata formats

2. **Consequences of the Bug**:
   - When metadata formats are used, `ipu6_isys_mbus_code_to_mipi()`
     falls through to the default case (line 84-87)
   - This triggers `WARN_ON(1)` causing kernel warning messages in dmesg
   - Returns 0x3f (an invalid MIPI data type) instead of the correct
     `MIPI_CSI2_DT_EMBEDDED_8B` (0x12)
   - The invalid data type gets propagated to firmware at
     `drivers/media/pci/intel/ipu6/ipu6-isys-video.c:477` where
     `input_pin->dt = av->dt`
   - Result: **Metadata capture doesn't work correctly** and hardware is
     misconfigured

3. **Evidence of the Bug**:
   - The driver advertises support for metadata formats in CSI2 receiver
     (`ipu6-isys-csi2.c:45-49`)
   - Maps metadata formats to V4L2 pixel formats (`ipu6-isys-
     video.c:88-95`)
   - But fails to provide correct MIPI data type conversion for these
     formats

### **The Fix Evaluation**

**Technical Correctness:**
- Adds 6 case statements for `MEDIA_BUS_FMT_META_*` formats
- Returns `MIPI_CSI2_DT_EMBEDDED_8B` (0x12), which is the **correct MIPI
  CSI-2 data type** per the MIPI CSI-2 specification
  (`include/media/mipi-csi2.h:21`)
- Aligns with standard V4L2/media subsystem conventions for embedded
  data

**Code Changes Analysis:**
```c
// Added lines 85-90:
case MEDIA_BUS_FMT_META_8:
case MEDIA_BUS_FMT_META_10:
case MEDIA_BUS_FMT_META_12:
case MEDIA_BUS_FMT_META_16:
case MEDIA_BUS_FMT_META_24:
    return MIPI_CSI2_DT_EMBEDDED_8B;
```

**Risk Assessment: VERY LOW**
1. **Minimal Scope**: Only 6 lines added to a switch statement
2. **No Regression Risk**: Only affects formats that were **completely
   broken** before (triggering WARN_ON and returning invalid data type)
3. **Self-Contained**: No dependencies, no side effects on existing
   working formats (RGB, YUV, Bayer patterns)
4. **Trivial to Verify**: Basic functional testing would immediately
   confirm correctness

### **Stable Tree Rules Compliance**

Evaluating against Documentation/process/stable-kernel-rules.rst:

✅ **Fixes an important bug**: Metadata capture is advertised but doesn't
work
✅ **Small and obviously correct**: 6 lines, trivial logic
✅ **No complex dependencies**: Self-contained change
✅ **Not theoretical**: Real bug with observable symptoms (WARN_ON,
hardware misconfiguration)
✅ **Affects stable kernels**: Bug present since v6.10

### **Impact Assessment**

**Who is Affected:**
- Users of Intel IPU6 hardware (Tiger Lake, Alder Lake, and newer
  platforms)
- Applications requiring metadata capture (e.g., camera statistics,
  embedded data from sensors)
- Professional camera software and development tools

**Why Low User Reports:**
- **Specialized Feature**: Metadata capture is a niche feature used
  mainly by professional camera applications
- **Recent Addition**: Feature added in v6.10 (2024), relatively new
- **Hardware Availability**: IPU6 hardware is in newer Intel platforms
- **Professional Users**: May have workarounds or simply disabled
  metadata capture

**Note**: Absence of user bug reports does **NOT** mean the bug should
be ignored. The driver claims to support a feature that is fundamentally
broken.

### **Research Findings**

Using the search-specialist agent, I found:
- **No specific user bug reports** for this WARN_ON issue
- **No CVE or security implications**
- **No related fixes or reverts** in the codebase
- The code clearly shows the bug exists and the fix is correct

### **Comparison with Similar Commits**

This commit is similar to other stable-worthy commits that:
- Fix incomplete driver implementations
- Have minimal code changes
- Fix bugs in specialized features
- Prevent kernel warnings (WARN_ON)
- Correct hardware configuration issues

---

## **FINAL RECOMMENDATION**

**YES - This commit SHOULD be backported to stable kernel trees
(v6.10+)**

**Justification:**
1. Fixes a **real, verifiable bug** with observable symptoms
2. Extremely **low risk** - only affects broken functionality
3. **Simple and contained** - 6 lines in a switch statement
4. Provides **correct hardware configuration** per MIPI CSI-2
   specification
5. Eliminates **kernel warnings** (WARN_ON)
6. Completes the metadata format support that was partially implemented
7. No known side effects or regression risks

The fix is so simple, correct, and low-risk that there is no compelling
reason NOT to backport it. Even if metadata capture is a specialized
feature with few current users, having broken functionality in the
kernel is unacceptable when the fix is this straightforward.

 drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
index 0a06de5c739c7..463a0adf9e131 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -81,6 +81,12 @@ unsigned int ipu6_isys_mbus_code_to_mipi(u32 code)
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
 		return MIPI_CSI2_DT_RAW8;
+	case MEDIA_BUS_FMT_META_8:
+	case MEDIA_BUS_FMT_META_10:
+	case MEDIA_BUS_FMT_META_12:
+	case MEDIA_BUS_FMT_META_16:
+	case MEDIA_BUS_FMT_META_24:
+		return MIPI_CSI2_DT_EMBEDDED_8B;
 	default:
 		/* return unavailable MIPI data type - 0x3f */
 		WARN_ON(1);
-- 
2.51.0


