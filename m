Return-Path: <linux-media+bounces-43484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7785CBB0DCE
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B70EB194745A
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5889030E83D;
	Wed,  1 Oct 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxDYs+1z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33D42FDC30;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=ITOfXabg30WqIczHZs+U+zqZMdzs84TAQuRt5a+VtNExcuQXV40V0AWRUUAzozVrNnIyNMgHWuFg5f1LhQuBP5SmVjKudG0FcAYYETT/zN1g+fLJSODo/mkKHmKEl2Xa3XSzU6T9eYtlQUZCRS1yMCEDpkjms9AzlaL71CRhMSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=U4RiYJ5NN8XuOT+nl3nJo1abaKdDCjeKGV3AxWy6uzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SA7ZkJ6pxCk5yo4RXkvmKRFyc0b0qxIU+krgRdexUH0G4LWRKNt+P+E5Uuh8qx3qpXVDPKEuKacnzcMfsjiYsq0Kf4XI+xWjX+5V9yrQF6cayM5QvE9PAWIN9+/zbZUpBuL9HndtyHpgdSBqWj+Nt2MrUcqubSdZWPNo4hlKA9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxDYs+1z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B2BC116C6;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=U4RiYJ5NN8XuOT+nl3nJo1abaKdDCjeKGV3AxWy6uzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YxDYs+1z0+p1hGwKJaOgqMkGW3Ibqjg9GAtNnUKdbaflZP427OnsqT9zJYeA8IPWM
	 qnU0jWQOBkC3sHEECMnDvzZaQRxREebzExjrLxPxoQi41osx9eroeqxdwgV/9IgpeN
	 y8cuZcobJxjz8Irm6IOuyWASbx3CWcmpMI2VhxIG8KqhY3ek7HZ5ILl7fgEeCuIFIR
	 Elze/Ijy+XR4XHh828MmRlEi+3wJiR+Z0bG5OEITB3vPUxBKLgXoadpcwh4KrU1zSI
	 UhI93s10QrXs2gG6SeU5uho8BxLsJTuP3N0bPgqfbtmpVA6BPKG0BPEL1lNfv9JrUU
	 P2SdV2JF9BQdA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLId-1dZf;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 10/23] docs: media: dvb: enable warnings for most headers
Date: Wed,  1 Oct 2025 16:49:33 +0200
Message-ID: <9ae6556ebd47de4f066a149ab0bbe7ce27acf2c4.1759329363.git.mchehab+huawei@kernel.org>
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

Except for two exception rules and dmx.h, the other files
are already handling properly cross references.

Fix the two exception rules for frontend.h, as those are
false-positives:

	include/uapi/linux/dvb/frontend.h:959: WARNING: can't link to: c:type:: FE_GET_PROPERTY
	include/uapi/linux/dvb/frontend.h:933: WARNING: can't link to: c:func:: FE_SET_FRONTEND_TUNE_MODE

The dmx.h are actual issues that will require an extra
patch to fill gaps.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../userspace-api/media/dvb/frontend.h.rst.exceptions        | 5 +++--
 Documentation/userspace-api/media/dvb/headers.rst            | 3 +++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/dvb/frontend.h.rst.exceptions b/Documentation/userspace-api/media/dvb/frontend.h.rst.exceptions
index dcaf5740de7e..cecd4087d4be 100644
--- a/Documentation/userspace-api/media/dvb/frontend.h.rst.exceptions
+++ b/Documentation/userspace-api/media/dvb/frontend.h.rst.exceptions
@@ -28,13 +28,14 @@ ignore define MAX_DTV_STATS
 ignore define DTV_IOCTL_MAX_MSGS
 
 # the same reference is used for both get and set ioctls
-replace ioctl FE_SET_PROPERTY :c:type:`FE_GET_PROPERTY`
+replace ioctl FE_SET_PROPERTY :ref:`FE_GET_PROPERTY`
+replace ioctl FE_GET_PROPERTY :ref:`FE_GET_PROPERTY`
 
 # Typedefs that use the enum reference
 replace typedef fe_sec_voltage_t :c:type:`fe_sec_voltage`
 
 # Replaces for flag constants
-replace define FE_TUNE_MODE_ONESHOT :c:func:`FE_SET_FRONTEND_TUNE_MODE`
+replace define FE_TUNE_MODE_ONESHOT :ref:`FE_SET_FRONTEND_TUNE_MODE`
 replace define LNA_AUTO dtv-lna
 replace define NO_STREAM_ID_FILTER dtv-stream-id
 
diff --git a/Documentation/userspace-api/media/dvb/headers.rst b/Documentation/userspace-api/media/dvb/headers.rst
index e78122944a69..3c492ae109ae 100644
--- a/Documentation/userspace-api/media/dvb/headers.rst
+++ b/Documentation/userspace-api/media/dvb/headers.rst
@@ -15,6 +15,7 @@ Frontend
     :generate-cross-refs:
     :exception-file: frontend.h.rst.exceptions
     :toc:
+    :warn-broken:
 
 Demux
 =====
@@ -31,6 +32,7 @@ Conditional Access
     :generate-cross-refs:
     :exception-file: ca.h.rst.exceptions
     :toc:
+    :warn-broken:
 
 Network
 =======
@@ -39,4 +41,5 @@ Network
     :generate-cross-refs:
     :exception-file: net.h.rst.exceptions
     :toc:
+    :warn-broken:
 
-- 
2.51.0


