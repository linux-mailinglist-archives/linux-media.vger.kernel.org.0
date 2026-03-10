Return-Path: <linux-media+bounces-55207-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFqsFmI/sGkehgIAu9opvQ
	(envelope-from <linux-media+bounces-55207-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 16:57:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C162541FB
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 16:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 796103189654
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 15:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3717630EF8B;
	Tue, 10 Mar 2026 15:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZUpMtzD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D9430F7EB
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 15:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773156177; cv=none; b=UK/UXMD20T4M5tOXv5EOm5JYls0V+1y3JN/OXw72/UuIaNJg0+wJCYIi6dbfgLpH7cxqF4MhCVVvu1X6h2khUwdKQFxZS1cOQ3kv6twc2ju4tKYd/YTUl/yhajpTbwWjN29hdaCd7GF4XMISckpT26KK8t+nuiY3+md0rOr+zEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773156177; c=relaxed/simple;
	bh=uvWJauKXSefzKSPxaT9L/GktZeqRXABudH6S6maDdGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BG3Ge5F2yit3uyZXKk5AIpP0IXJKiF5EUxJmVzm5mJsNHqKKEpjUkad6+h1hkB534BmfQm63/lbnd+J6CK4W2kpI4aZ5yDeVSrDU5/jwe/UNOaWe4SPV0CZiSu5y41wKdoXfHU3RHelI447+tNUG3cTKxL/cC6It9cLVuxRYEzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZUpMtzD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439c56e822eso7541310f8f.2
        for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 08:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773156174; x=1773760974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uj/zzF5O76r5j948IQp036xrZTnWvC0n34mi6DCs8vA=;
        b=WZUpMtzD6vrHKdLB5ss/KVVjGWfM3hjdDDvWCwiorgEUUfDF9h4pi6XTiTrU196CF0
         LYQAv/uSxoXGtOIlLCnvBCVtjUPlzsQHle6o+ykNf4kHH+6fmPJz3phMQ/2EuWJPnHpW
         1sQyBa9u/Mpwghc3waitGpkANmj2WABLtM7DYpcT442KX0osKSJ67TMCJfcxi9aZkzET
         zUbi9MQ+Rbj0+HqAkq/PVTJ1LYXo3w8f+//pNtJrM6iceE6Jg82Q+VN5ve0+MAvRpdiD
         jExCrtMYSEpNlJoUXZkKnWc1BG/Hdde3xjJM5xkBZB/PAyjfdu37SuQRDoWKepRIj0So
         TyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773156174; x=1773760974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uj/zzF5O76r5j948IQp036xrZTnWvC0n34mi6DCs8vA=;
        b=gikTDdl1pwTIcAllw59tt6T8Grh0NW4x1YKPJtAQEGt+z9DUqdq7C9is/6KM5AhqDu
         Ip/AtVx+p2MIsUo6LMueS/ucsbZQe0ACS92PewrNYA+2jcSeDvq9lyMu2DoxuQF8xcg1
         lAlDh/rLcJJFrp3X0Ds+uMONpD6kkJ2GASUy2sqTjp/eanSXvstQvjG9Hy/O0DI3+Htx
         FaJX7gYoAZlxQ4TnbZuNB0f4J3KxMYmLDpDrE5YmnD/LtBm2Wuu4Y36zUKSC5qLfbwlH
         6DhFKI1+kN6fvx5whAgS/IBCpO65zv/IkvpIkeIZ4680weYE4t0mtqwHA0aBdzzHlfTN
         ovsA==
X-Gm-Message-State: AOJu0YyPSentORLuXWZNTpbJXioiQCJGv+ZvnfpC1YIQ571oG1W9BNCF
	Mv7kPV++glL6u9W2AQNFyCGCc+3YsQ0lgNRWvcXZj3h5QNv+tvdgu+lzBuKxqeqJ
X-Gm-Gg: ATEYQzzt97jLpFoArkUiGAuuHGEbUuaUoMkQSDZ/iFS5ERVF6nFA7C8FelgIFl+dPeK
	6702ls6pv7TjtkKbbNbxNgF4AKOFTx6lMDZaW9FU09ZRILlQ65EouiRmUDy1+bFsAKqJN8RW6z5
	+v1OrP1Ox1FIF2wUEi0A/tbcT3dlv0Cisb9nsbSaqvTAIMO7ZfgHHlFqWyELr8mY36sEg/g2Zgt
	Jw4QISXThd7v5Y8xdv/aNK2VZQaqrX+8UKIcUsbWBvp7DbqwYwClrPHLJHaFzmd+vMhd/AR9sS4
	FhIGXyOpmP8QDg6r0NmXwt0pVLZ6i6H9thjKdDcNcXf/sYencU1Cl0/xWhvOxo4VyO5ILQj8OV3
	bj0nYrNttX3Rnx342Hm1gE/+XFuA+WmDh0RC0YYW36s0U0nS6rgYmSi3WAQvCknAcYUaItrcrSF
	LQBaK64sWBOmFgcnXUH5ndbTxUdTWgSk42v4yVu+Yx
X-Received: by 2002:a05:6000:402b:b0:439:ab3d:1c2e with SMTP id ffacd0b85a97d-439da555617mr27203875f8f.10.1773156174268;
        Tue, 10 Mar 2026 08:22:54 -0700 (PDT)
Received: from sarah-VirtualBox.Dlink ([213.137.77.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae35cf7sm34653806f8f.26.2026.03.10.08.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:22:53 -0700 (PDT)
From: Sarah Gershuni <sarah556726@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sarah Gershuni <sarah556726@gmail.com>
Subject: [PATCH 0/2] v4l2-tracer: fix expected frame length calculation
Date: Tue, 10 Mar 2026 17:20:45 +0200
Message-ID: <20260310152047.4595-1-sarah556726@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C5C162541FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-55207-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sarah556726@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action


This series fixes the calculation of expected frame lengths in v4l2-tracer. 
Previously, the calculation assumed that the stride equals the width and that chroma 
padding follows the end of the plane, which could result in incorrect lengths.

Patch 1/2: add plane_bytesperline to trace_context
- Introduces `plane_bytesperline` to store the stride of each plane, providing the 
  necessary data to compute accurate frame lengths.

Patch 2/2: calculate expected length using v4l2-fwht info
- Computes the frame length per plane correctly, fixing previous inaccuracies.

Together, these patches ensure that v4l2-tracer calculates expected frame lengths 
accurately for all supported pixel formats.

Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>


Sarah Gershuni (2):
  add plane_bytesperline to trace_context
  calculate expected length using v4l2-fwht info

 utils/v4l2-tracer/trace-helper.cpp | 55 ++++++++++++++++++++++--------
 utils/v4l2-tracer/trace.h          |  1 +
 2 files changed, 42 insertions(+), 14 deletions(-)

-- 
2.43.0


