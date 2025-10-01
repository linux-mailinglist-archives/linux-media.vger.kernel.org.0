Return-Path: <linux-media+bounces-43487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 090B4BB0E3B
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 16:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0652C3A6B04
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 14:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8042FDC54;
	Wed,  1 Oct 2025 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQkAa7rT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B444F3019C4;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759330199; cv=none; b=MPorb5Z2wqAZA2Kq7LRKKY7YTl7WEJP8sE0ylTAcL542G64ZFHUHAG7T9sjP8gGL8Mz7ihLZiR6v9J1sxC6paedgnVjNWZtERT3Kqr6x2Bfc1rfeqq/xWikSiSKUj7XZmhRJWMFnx6o/zmDI2Z3ibt6xaaBVaxWfePoXR6voYQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759330199; c=relaxed/simple;
	bh=5hYRfD9Ktb0lpUHhpM1IvPTtV3P7mHzM9DQlrfcOk14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ouYbNFFmqzudz0PCHsNC1/cO/fNzDw5/JqR2eH6UezqmqDiaTExBHV90W4ECXsY00q4yBf74S7nOQ5zXquHxWlT2R+6syuA6WJAiP+VesFaS2WO+Pn439In4DJ9lrZjOpN5h5WqbzNIFcmTqYQX8LwHeZGmgXpthQWgeCF5Ecps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQkAa7rT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA8AC2BC86;
	Wed,  1 Oct 2025 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759330199;
	bh=5hYRfD9Ktb0lpUHhpM1IvPTtV3P7mHzM9DQlrfcOk14=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BQkAa7rTV9cJmoFcaPy0lQIqv9lfF0zkm7Hq34mIm1s/2rlKOeRoAG4LvYf2jxqPs
	 HIay3ckQ9e1SJomPyk7BNBNV7xYZ55zDD/s1OGzFCTN0T/LH9zuCvJJr/o5F38KvxA
	 prmxcZp9hrc2ivuCQs6aecFgDFRNszrydGuIkGah7PnxXGFBSMPejO5bDmPRZxx4w1
	 CsTqYKoMMaGU6f07+6yi4ei9Kch5pQy1SinROOzJUDKXbfPuszXjWjzjKWHiM2+skl
	 /OQxm7A/ZD20BRICMPffWRPxBFnGMRQZDfj/yNl51SaVDHmlr0k0IghwvoXLm3fQ+9
	 YrrsFu1+og5rw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1v3y9V-0000000BLJP-2yw1;
	Wed, 01 Oct 2025 16:49:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 22/23] docs: media: dvb: headers: warn about broken cross references
Date: Wed,  1 Oct 2025 16:49:45 +0200
Message-ID: <8f98dde399df8b937dadf09168194bacce682c7d.1759329363.git.mchehab+huawei@kernel.org>
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

Enable cross-reference warnings for demux header.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/dvb/headers.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/media/dvb/headers.rst b/Documentation/userspace-api/media/dvb/headers.rst
index 3c492ae109ae..6d69622bf1e0 100644
--- a/Documentation/userspace-api/media/dvb/headers.rst
+++ b/Documentation/userspace-api/media/dvb/headers.rst
@@ -24,6 +24,7 @@ Demux
     :generate-cross-refs:
     :exception-file: dmx.h.rst.exceptions
     :toc:
+    :warn-broken:
 
 Conditional Access
 ==================
-- 
2.51.0


