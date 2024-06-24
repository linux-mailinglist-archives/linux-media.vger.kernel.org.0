Return-Path: <linux-media+bounces-14035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7C79146C2
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 11:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86DD41F24041
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2024 09:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20161135A51;
	Mon, 24 Jun 2024 09:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BugPHSgH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016C6134407
	for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 09:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719222927; cv=none; b=EZS8WimBHvZmfTPTAR3X4JGIj4WrCEMgn1D4y4BvjimlHqaFTdx33yl6b8ItuZxco72JGK6HMTlLCS2LxjAG8aX8rZgFnKogT6TPj2GaBJLKLelt4okvVjNR3OdqzFJeM2UqfH6vzfLsXr7A3CE0Y9yCU4vuZkx4MIhSCHiFBhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719222927; c=relaxed/simple;
	bh=05XRxdK5KSF9/nWjTvS2qW0gk3XjqLPSY4/AihOYYlQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B/w8Sv2ZeY2toBAZjhHAY1KbVUgrF2khEqhV4l8eTakvyuvpeSCID1RVGrkciU1jYf+5mMp1RXIXr200DD35D7DZRqs0g1RtjD/FSq7kPYDWSHDF4zh9Xn69rA5PKoQmGfw6qCsJeRZmt5Y4n0OMWNjfpyQjaQ6pLOPBk99GfIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BugPHSgH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-421757d217aso45134735e9.3
        for <linux-media@vger.kernel.org>; Mon, 24 Jun 2024 02:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719222924; x=1719827724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuKH1L6SOVF9s069qwn3whS+iN8IefC7VE5uaYSL6oQ=;
        b=BugPHSgHlheYg0AHM7yujzhWoyRAu65tXPq4N1c5lleTR2km6WZKy8i4UadWcfCikA
         b6ykorgu7NHS1Lc3QihvWoSj7aCUK6t8+AVJBLnjTYf6AXJT4WnhcqZsEscIjoryX9bb
         b07SB5YZ/hBc7n3wNTz/95q8kC6DNryaZZFButOzxT9TncdbN5JFh0g39XOg7fq4A7Ez
         afxp+4kWWsMyNxLBju3CEVVOyoxGBaUEpAJH8osTyWlJ4UJmbPwfmfUnyWcYWfXCF1iw
         usjJHpkv7EoFKb8HvOaCdk4e+iMc6Or/GxxRUXinBDMniKisDASqBG/AQ4CMIJdTxQyD
         1XQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719222924; x=1719827724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuKH1L6SOVF9s069qwn3whS+iN8IefC7VE5uaYSL6oQ=;
        b=ICl6toAHwrdJ6Yqx0QXtmgpc2ds/5+4bpc+rG2V31iI3xYBON0Tr6CorHgo7/MxPuU
         9x5Mcy9gMdVeg5aL8b12CaoNHX2HfngSvwNiprJbM+Eo4lIPRtWKidbOe4gZecqjMlmH
         JAeBlaHSmM1ZYQo9Vz5ry02CHfA+zDZsAur5wqvH/gq2ZmzCAIigzyEYXnmDFgDgAsMc
         Bbpn5EKfGTC+6apJ43OtsizWiz5Kv5qzp0U3Js+3EEcf6nj6rJM6ZtoW0ihutf3xUCCi
         VdxU/m8ocJG0284O8zM3KY0olKW5N6iwvu0FJvr09KLhHmBJF/ZGZPn1wkk1L79zgBTW
         z7kg==
X-Gm-Message-State: AOJu0Yz0tuRRLjYkdMTyThTR/DCpjrVDxHHHmIUMllMT7/Lpyxcm45q7
	Rd3CLUflBqCq5tL9Gs2g5/vwQaQee9+TRq+qZZykUZfa6gxPUKbxEdeDvsA=
X-Google-Smtp-Source: AGHT+IGXWU5ZgAY5idFL6bKvQQxVMKxJ03kKoDBrWrlI9wZaiRjokFUYyxYM4AYRO7a+fkSGHMkI2A==
X-Received: by 2002:a05:600c:4f92:b0:424:9612:f738 with SMTP id 5b1f17b1804b1-4249612fb0dmr9225455e9.28.1719222923944;
        Mon, 24 Jun 2024 02:55:23 -0700 (PDT)
Received: from localhost.localdomain ([105.163.2.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b5ca0sm128258475e9.24.2024.06.24.02.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 02:55:23 -0700 (PDT)
From: Dorcas Anono Litunya <anonolitunya@gmail.com>
To: linux-media@vger.kernel.org
Cc: anonolitunya@gmail.com,
	jaffe1@gmail.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 03/10] media: Documentation: vivid.rst: add supports_requests
Date: Mon, 24 Jun 2024 12:52:55 +0300
Message-Id: <20240624095300.745567-4-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624095300.745567-1-anonolitunya@gmail.com>
References: <20240624095300.745567-1-anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

The module option supports_requests was not documented, add it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/admin-guide/media/vivid.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/admin-guide/media/vivid.rst b/Documentation/admin-guide/media/vivid.rst
index d7d5a01f4e59..917b57225939 100644
--- a/Documentation/admin-guide/media/vivid.rst
+++ b/Documentation/admin-guide/media/vivid.rst
@@ -302,6 +302,15 @@ all configurable using the following module options:
 		- 0: forbid hints
 		- 1: allow hints
 
+- supports_requests:
+
+	specifies if the device should support the Request API. There are
+	three possible values, default is 1:
+
+		- 0: no request
+		- 1: supports requests
+		- 2: requires requests
+
 Taken together, all these module options allow you to precisely customize
 the driver behavior and test your application with all sorts of permutations.
 It is also very suitable to emulate hardware that is not yet available, e.g.
-- 
2.34.1


