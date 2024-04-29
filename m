Return-Path: <linux-media+bounces-10380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0728D8B61B9
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 21:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0CA61F22248
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 19:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868B313AD39;
	Mon, 29 Apr 2024 19:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SxK0rEYr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EB313AA32
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 19:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714417815; cv=none; b=o5P0qPApkRZp1ASdMN+osIGf3gR49nMpDReTO4BgP8xHhpwS6ro0LVo6++QjcsYdMzPajJtwkb9Ndlj40KKi2aPvUxwpPhVirfNtPhIft1ZKMzTV1yj/9YXJmv7HANaZ7r58QyDq4OePYsatUe78uMVFnKFTT70hVM25x8H55jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714417815; c=relaxed/simple;
	bh=D2y0CxnVad26nnxkpXI+dUUR4zEpuhyFygrqYOQmjVk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E/wGh+7w+XdT+eA62XPgzvyxHD4Jyd294FHreadq+RAJTZRBHAzG1SMzruTbgjb0ug26Sa5dBARIjv/BhUdDHeYY+B6lvcuGP1ugrxsIUFd6aUTdaEErrVJJn88xsdz0pxeB7p7W2cz0LnzXkzbk+n7dJkyq2J848JKYX4pB3Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SxK0rEYr; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714417814; x=1745953814;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D2y0CxnVad26nnxkpXI+dUUR4zEpuhyFygrqYOQmjVk=;
  b=SxK0rEYrAJourltutnqH9nSoKETPJUKFFXMGfuEZDCN8LnO10u+724dN
   FsrY+RP46Wy+EioeObjOcSzPhHdP7tlRFMKXiUABFrhMjJU56qd1lPrRW
   epXPCG9M1NQsqycdF/kh6vaYKDgt168s6ltUTnJESFrDEn2HnvfsHtcCC
   hUO9qKZgjA+XVQxeR1Rjrw6cFzwk64dYCWtaNba7T+0MtYFNLocHotZez
   jcYs9lgrgPdDY44TT9iEB/Y8d+aeYWfSPYlC3338L9iY8FI0QsPvAMaTh
   wfZdKsd9aKL9SzKTxLFC96Eft+hE/dsj0zSHGQo2kUmTlDJHn2yOt6zOk
   g==;
X-CSE-ConnectionGUID: LavtJyFJT4qdmKqLU8HtXw==
X-CSE-MsgGUID: ZmctzV0bQiC6mlrOJvegmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="20714929"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="20714929"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 12:10:13 -0700
X-CSE-ConnectionGUID: cmnruW5sQqKvSa0TfHeBDg==
X-CSE-MsgGUID: 7yvlbII5QtW+DZ/ZIThsRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="26212466"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 12:10:12 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 70C2B11FA8A;
	Mon, 29 Apr 2024 22:10:09 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl
Subject: [PATCH 1/1] media: Documentation: Fix spelling of "blanking"
Date: Mon, 29 Apr 2024 22:10:09 +0300
Message-Id: <20240429191009.1008113-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"Blanking" should be spelled as such, not "balanking". Fix it.

Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-process.rst         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
index b1c2ab2854af..27803dca8d3e 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
@@ -31,7 +31,7 @@ Image Process Control IDs
     Pixel sampling rate in the device's pixel array. This control is
     read-only and its unit is pixels / second.
 
-    Some devices use horizontal and vertical balanking to configure the frame
+    Some devices use horizontal and vertical blanking to configure the frame
     rate. The frame rate can be calculated from the pixel rate, analogue crop
     rectangle as well as horizontal and vertical blanking. The pixel rate
     control may be present in a different sub-device than the blanking controls

base-commit: c28d4921a1e3ce0a0374b7e9d68593be8802c42a
prerequisite-patch-id: a34df4ea7983cf11916d0d718a769a6e7ddb3518
prerequisite-patch-id: 321c9a8a7aace1787c19167deae27f24001d9ec3
prerequisite-patch-id: c443ad20ac7cd8b8f45263d2d42d705b1b226202
prerequisite-patch-id: 556b8a83aefeb3cf1c08e905ee30348ee9df826b
prerequisite-patch-id: 19ac39d744b29717759ded8324df622addd7411c
prerequisite-patch-id: 0cad221fc25a238b2ec96a3ca565690cb65af882
prerequisite-patch-id: 3d3a0b6df473e4871a9449e8fc4c9176395652dd
prerequisite-patch-id: 543d5e82dc5c0760592776ae5487a64ce97cb224
prerequisite-patch-id: 1a831244223ffd39ee8d58019cb05c7bc0f1a1a2
prerequisite-patch-id: 56cff02e9756cb050604bea59708732cb1e16c84
prerequisite-patch-id: 2dd09e7af801370b45dbfd9018dd5d345f0ac049
prerequisite-patch-id: 2125c9514e20597767df9f98b797412f650ef21b
prerequisite-patch-id: 388a17ac5c79ba5a490ec17eb44a6673cd0768c4
prerequisite-patch-id: c3edf2f41d990d44884b9c79a48f2b6cb563830c
prerequisite-patch-id: 0fa19ffba6cbcf216c9f1c602da18f3a463bcf62
prerequisite-patch-id: b8e50829c3f183fc5886210677bb24042824b2c9
prerequisite-patch-id: b69ce963528ce383d231439163f2a2b1e33ad026
prerequisite-patch-id: 86f8edab2eb93c95b21120bc8dafda41199d92a4
prerequisite-patch-id: 69db989707982a370e5ded80949f50c45619b007
prerequisite-patch-id: 74a76c186abb667cc9bb55c1906109d56b24b833
prerequisite-patch-id: 39f8447cf37d6b35b9564b20d38af82080d7fc9a
prerequisite-patch-id: 65c0536e772dab1981f39865054bc50bbaa28af1
prerequisite-patch-id: 41fc1305c9e144a49183b2d7ea6f078006f428ad
prerequisite-patch-id: 9b72246da771f89b73a1fc31be9c702069e01add
prerequisite-patch-id: c40af3e6cb79c53efc1ac13f3b5aa44b9dce9109
prerequisite-patch-id: d5674a8a4c74e0666aa98179071cb901175767e0
prerequisite-patch-id: 0cb5b0092d66967f04d9ff7510f2d27769c93ebc
prerequisite-patch-id: 28b85925740bf9c6b5a46f1e257310eadb4b0a36
prerequisite-patch-id: 21459b87dd2cd3e8f67a497b1ff5e674b11ea356
prerequisite-patch-id: 658641d698ed3795393ba672576a1a30514b8c25
prerequisite-patch-id: ff6c13c2c1616e820777b027020fffcaf03d31b0
prerequisite-patch-id: 61ce7467d38ef974630160614722599d3f29c742
prerequisite-patch-id: b724dcd2b6a41f98ee2ba932ab21ec7692d15674
prerequisite-patch-id: 2e08618be40878e4f5074df87951556d2c4a95a8
prerequisite-patch-id: 8ec7bf808fac7a60cb95365ec0f7ed46c81b93c8
prerequisite-patch-id: 6919e5d8f8627adfab508ffbeffbb0b0b9d12ed3
prerequisite-patch-id: a0106e69f633d29ce60476cc1c271d5ca577dfc9
prerequisite-patch-id: 7b84e33260b01338595c466ac6bf211522abcdc7
prerequisite-patch-id: 1b038a19c0bb8634bc104f048061fd2dce4f43b5
prerequisite-patch-id: 50eda037e23b11d6cb14a853d48f078d0f82edc0
prerequisite-patch-id: bacde5a06f8fcf58e5dab8bc86452a1ffdc2de66
-- 
2.39.2


