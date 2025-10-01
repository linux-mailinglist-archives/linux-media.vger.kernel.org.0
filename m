Return-Path: <linux-media+bounces-43485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C829BB0DC3
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BC677A4BE7
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594E030E83E;
	Wed,  1 Oct 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUmszQtF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921352FD7DF;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=Dnm5BH2UnttMkGomHvZlw0eV6AoWJn6k8twiyUAiqdy2pjddC+BdFGZXWWv+eB6IFocOAZov+W+aZ+G6oK3tBkVtLoWV/dIMz1NsJnwfI96EAzkXlRf/SKfcrhyiP/5woypQejhwdWN4qdFtUZ7oVKIxhAE0oWLuC5E4fpqFd3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=X5d3EN269R0Mk2mv6VYfYFv/qWj0nAYOaSmF+i4NyEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/6Nm8cSjNttD3fpLMIa8XpHO+NKKGo6G5mLDyN0/PdmPhZqv4T0yvoBouGl+HBHw/swCEyHh5VKq5ur2MBNFqDU1vjcxGFN6g1Q4bobbdr2xkGNP6X2EMzPiPKGlEU9Ka5VspRcGSXHp2n27uD2k9VB9sys5Fcbebbil8iWxSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUmszQtF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADBBC2BCC7;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=X5d3EN269R0Mk2mv6VYfYFv/qWj0nAYOaSmF+i4NyEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gUmszQtFk8i8Cj2/omuVvVihBIbJ5PhpxZ0CmGRaijnCgP6yEYPWPdIoOyQW76kAX
	 LDAIsizh7C8X1VTV/2rK2Za8GD30Eg53/PcSu9chPgF3j/h5PeR3Z2UYxsUhuPxO35
	 v+DvDoE1StYi73D3qmRWAgdh8DDBxaNIJJDktq2yqgdwujPD3Q1pz2ds7mTHDdCA9x
	 VRkTb4vyW807Qj2CBxOdxkgNWdC9DXLrySRFipl4ggu6WuwIpNO2wsNQKKNm8iDgyZ
	 NH12CGOZvQaoclWm99aSAya6PE+z9PS1uFCp557/MtVFku18zoD5bhbVCl+VcYMv/m
	 EvIFvlBFRy8iA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLJ1-2K9j;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Yunke Cao <yunkec@google.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 16/23] media: docs: add a missing reference for VIDIOC_QUERY_CTRL
Date: Wed,  1 Oct 2025 16:49:39 +0200
Message-ID: <46f86be6ace28abe83ea9ce6fa6138e40185a23a.1759329363.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1759329363.git.mchehab+huawei@kernel.org>
References: <cover.1759329363.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

This one is missing its c:macro definition.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 3549417c7feb..a8d84806a3c0 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -15,6 +15,8 @@ VIDIOC_QUERYCTRL - VIDIOC_QUERY_EXT_CTRL - VIDIOC_QUERYMENU - Enumerate controls
 Synopsis
 ========
 
+.. c:macro:: VIDIOC_QUERY_CTRL
+
 ``int ioctl(int fd, int VIDIOC_QUERYCTRL, struct v4l2_queryctrl *argp)``
 
 .. c:macro:: VIDIOC_QUERY_EXT_CTRL
-- 
2.51.0


