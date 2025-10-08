Return-Path: <linux-media+bounces-43956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D30BC4F95
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 14:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1E5B135286E
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 12:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8844325392D;
	Wed,  8 Oct 2025 12:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYhDhR3K"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B612264A3
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 12:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759927846; cv=none; b=O0MjiEBla1hxW1ExgYnOLAWEGfEzULT3RbmbgLSt1tXpE1U09socK09y/PQwBMrUcRjoXxjz1wSWzAv6yK5/3b9r/eDPDt9eBT5SrNd06QL43BmhrCmtNVo2ogP8/Va4uqzdf6yUzbSyJTl9Go5ifXzoGva7fQ7PmxcvQL+ewkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759927846; c=relaxed/simple;
	bh=pMiI0ArySMHWujm9aw4NIQy6199AonhyonXLlq7hPHI=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Cc:Content-Type; b=WQTU4TQfONI0zzcEa6tnXlRaXiHvrFJuMBBZJJZAb6T7LliOCwfvc/DrkwsiiUNtXW5H2OSQl3v0nDBBu1JjgQemnzDUFfcLUj+sl0yyKJS4N3Aeq2Yrc6eYp6e5RRhPPnKycGx11rr72zyECwXcSe17oU0A9KvNJpdBGRCZzhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYhDhR3K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36F3C4CEF4;
	Wed,  8 Oct 2025 12:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759927845;
	bh=pMiI0ArySMHWujm9aw4NIQy6199AonhyonXLlq7hPHI=;
	h=Date:From:To:Subject:Cc:From;
	b=gYhDhR3K8lge6HPwlnejPamoKO+GKlGpmiFcykMGe0B08HyWqAaYCmBhgxI93OU0n
	 QyYlyckLuu6A9BsA+MlhBEJ/csY5DZ+8tDvbZH2V7yx5DpNMfjXqTHU3NcNusj+6DR
	 TmrjEvKV3lVvIdxinR4+iksGsi/GdoqFgLi7yuoFyrDU5nqyFZNADKIZe+pKKofl+j
	 jRbj5wVEqmh89HegmVOJkswydMh+nz+hGywOLhFQvobWs6hnQa/rMmdKtE+O8GoSCR
	 vS4bdfia3md5OFKuBKh7rfZXkRbJcKjA/hUKShmwWDBxXE6HDUUYdIRHAVNl5rLjUz
	 G8N2PC+zkI4MQ==
Message-ID: <8afc906b-eb00-49aa-9f04-6debe67b148e@kernel.org>
Date: Wed, 8 Oct 2025 14:50:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
To: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: IPU6 "Transfer FIFO overflow" errors when CPU is idle
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

While testing raw image capture for sensor calibratino on a Dell
XPS 9320 (Raptor Lake, ov01a10, LJCA, IVSC) 

I noticed pretty bad flickering of the images coming from the camera
with the bottom part of the image flickering from the actual image to
fully white. This gets combined with errors like these in dmesg
pointing at an isys/CSI2 receiver problem:

[  144.764888] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-2 error: Transfer FIFO overflow
[  144.764902] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-2 error: Inter-frame long packet
[  144.809886] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-2 error: Inter-frame short packet
[  144.809910] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-2 error: Inter-frame long packet
[  144.834517] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-2 error: Transfer FIFO overflow
[  144.834541] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-2 error: Inter-frame long packet
[  144.876643] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-2 error: Inter-frame short packet
[  144.876665] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-2 error: Inter-frame long packet
...

To reproduce this apply the following diff to libcamera:

diff --git a/src/libcamera/pipeline/simple/simple.cpp b/src/libcamera/pipeline/simple/simple.cpp
index c816cffc..ef336721 100644
--- a/src/libcamera/pipeline/simple/simple.cpp
+++ b/src/libcamera/pipeline/simple/simple.cpp
@@ -253,7 +253,7 @@ namespace {
 static const SimplePipelineInfo supportedDevices[] = {
 	{ "dcmipp", {}, false },
 	{ "imx7-csi", { { "pxp", 1 } }, false },
-	{ "intel-ipu6", {}, true },
+	{ "intel-ipu6", {}, false },
 	{ "intel-ipu7", {}, true },
 	{ "j721e-csi2rx", {}, true },
 	{ "mtk-seninf", { { "mtk-mdp", 3 } }, false },

Build it and then run:

./redhat-linux-build/src/apps/qcam/qcam -r gles

This will disable the softwareISP and instead has qcam using
a shader to debayer/demosaic the image.

The same flickering does not happen when using the softwareISP.

After trying some other things I had a hunch I and thought
maybe the problem is that doing things this way leaves
the CPU mostly idle.

So I ran:

md5sum /dev/zero&

from the terminal to put 1 CPU core at 100% load and then
rerun qcam in raw + shader debayer mode:

./redhat-linux-build/src/apps/qcam/qcam -r gles

And the problem is gone. So I believe that the problem is
that when the CPU is not significantly loaded some other
resource, maybe the ring-bus, maybe the DDR4 RAM speed
is clocked down causing problems for the CSI2 receiver...

Regards,

Hans





