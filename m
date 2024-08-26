Return-Path: <linux-media+bounces-16848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D0D95F7D4
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 19:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B46A1C22060
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 17:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CA4198A10;
	Mon, 26 Aug 2024 17:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gkykcwpO";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="HGB7FcBk"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-39.smtp-out.eu-west-1.amazonses.com (a7-39.smtp-out.eu-west-1.amazonses.com [54.240.7.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9206064A
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 17:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724692815; cv=none; b=F+4lfNgpLPJiFYb2KWgHYl45b6qu7c7eW7nM35KY6NyIygHIzvIssnsPP3q5LHU7nBvNXnC5FZ1tPuriV9OJtdhpR4QP45zjR7IZllyynI88nQV0XBV/TngxvPd6IrP7Xaf3ZEUExn49uMHR7+fy3zgp7oh3XjEMwLm9dDQQHrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724692815; c=relaxed/simple;
	bh=qyWwmn0lkxSdsmYK0mF4Ckrto5uJ1vt8zEl9m6H0VPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qVMU6SR1puzyKL0mI81kqx33KfHy9pIDEeNF80AIUD7o2cIHKLhcUkyDFYKMqmrUV6r6ImxUki17RdKx9iWBBic8729341IaLSSo28ZGIvgYkHbiOcJzB/2Cn9EyHf5CFKbqr0Vr27lwhEs4cNt6m/TM9x/ukxHCCFOSvbDx2pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gkykcwpO; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=HGB7FcBk; arc=none smtp.client-ip=54.240.7.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724692812;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=qyWwmn0lkxSdsmYK0mF4Ckrto5uJ1vt8zEl9m6H0VPM=;
	b=gkykcwpOXZ6fck+OlKbWmAuYvyFwzVshfYvxWN9SjN+AJu/Jc/n6MVt3+GcBsees
	aFaFnvvyHg/hfzHCxBnG4pmC8BTBEFCW8/wdWXrnQRjl3OTC8EqAOI+iytajq1Q5fgs
	G8SKa+9DKuRDihS7C2UQZ1YNmyDLI1KtWqDwVuKMJ3q1oruj/hGwsdgdvaCdCjbXrFn
	L8NlHxaoanbR1hvwYYSpwM0jZlf3fDLszAaYUJaug52r/paiLokT70IBjfnyxSfRR7S
	nVYaWZgDLgcm0sAq+5Rv8/LmrxVEN8oBH2a9L8F28cEo/QrEC5Qg44i866BzwZpQHZh
	fdVpYk8eZg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724692812;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=qyWwmn0lkxSdsmYK0mF4Ckrto5uJ1vt8zEl9m6H0VPM=;
	b=HGB7FcBkqP5vzOyGG0IwiRT5a11MafwIo2jKvDW8TuM5WL5O2CqqXgN2f+APeWfD
	rZbWUcCL1SLZjXj/dICmC5aWshwlLrZBt98ljsRy6YcreiyJk7T9JfPzXIVakof1hSx
	8soUt+XPtIusKW1yMwbMHqNSVuV9Y1FbYOHijk6c=
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v4 0/2] Add tests compliance tests about V4L2_FMTDESC_FLAG_ENUM_ALL flag usage
Date: Mon, 26 Aug 2024 17:20:11 +0000
Message-ID: <010201918fb3cf62-751d12a5-1648-45eb-9060-a9dcd60ef3ba-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.08.26-54.240.7.39

V4L2_FMTDESC_FLAG_ENUM_ALL flag goal is to enumerate all
possible pixel format while ignoring the current configuration.
The series add tests for v4l2-compliance and v4l2-ctl tools.

v4l2-compliance will check is the flag is supported by drivers
and verify if the enumerated list is an upperset of VIDIO_ENUM_FMT
called without the flag.

Add 'all' supoption to vidcap --list-formats(-ext) options to use
V4L2_FMTDESC_FLAG_ENUM_ALL if supported by the driver.

As example, Verisilicon driver support the flag usage and give these
results:
./v4l2-ctl --list-formats -d 1
ioctl: VIDIOC_ENUM_FMT
	Type: Video Capture Multiplanar

	[0]: 'VT12' (Y/UV 4:2:0 (4x4 Linear))
	[1]: 'NV12' (Y/UV 4:2:0)

./v4l2-ctl --list-formats all -d 1
ioctl: VIDIOC_ENUM_FMT
	Type: Video Capture Multiplanar

	[0]: 'VT12' (Y/UV 4:2:0 (4x4 Linear))
	[1]: 'T010' (10-bit Y/UV 4:2:0 (4x4 Linear))
	[2]: 'NV12' (Y/UV 4:2:0)
	[3]: 'P010' (10-bit Y/UV 4:2:0)

so userspace can discover that it support 10-bit formats on capture
queue.

changes in v4:
- Add 'all' option in vidcap, meta and vidout.
- Make 'all' and 'mbus_code' exclusive.
- Simplify 'all' vs 'mbus_code' parsing.

Benjamin Gaignard (2):
  v4l2-compliance: Add test for V4L2_FMTDESC_FLAG_ENUM_ALL flag
  v4l2-ctl-vidcap: Add options to enumerate all pixel formats

 include/linux/videodev2.h                   |  3 ++
 utils/common/cv4l-helpers.h                 |  5 ++-
 utils/v4l2-compliance/v4l2-test-formats.cpp | 35 +++++++++++++++++++++
 utils/v4l2-ctl/v4l2-ctl-meta.cpp            | 34 ++++++++++++++------
 utils/v4l2-ctl/v4l2-ctl-overlay.cpp         |  2 +-
 utils/v4l2-ctl/v4l2-ctl-sdr.cpp             |  4 +--
 utils/v4l2-ctl/v4l2-ctl-vidcap.cpp          | 26 ++++++++++-----
 utils/v4l2-ctl/v4l2-ctl-vidout.cpp          | 27 +++++++++++-----
 utils/v4l2-ctl/v4l2-ctl.cpp                 | 16 ++++++----
 utils/v4l2-ctl/v4l2-ctl.h                   |  4 +--
 10 files changed, 119 insertions(+), 37 deletions(-)

-- 
2.43.0


