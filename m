Return-Path: <linux-media+bounces-42026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAC1B49288
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 17:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AF5B189292A
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 15:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F134230C63B;
	Mon,  8 Sep 2025 15:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhTu8Ccf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12956226D0F;
	Mon,  8 Sep 2025 15:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757344058; cv=none; b=c4q5KDxdW5krzV2S2+uV75F/yCVDjmfebETCfy5NobsEHTcPYrWwtmWW6hyUoLWQLe9YHITe2yz6ddSYtKDK8O/eTEx2V6NMLiVxJ/zV6glT+BOKAbw3ALg9Jl6KVcyjgfjf0JJ6Q1SKdxld4JvB+B/21gojO/mB0HfkkDvXxU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757344058; c=relaxed/simple;
	bh=H5N4wjRgkDqnFlonEaPvXEaLaSXJ2fXLmoIe06P1MTk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MDFoXyYQ8cckYbsnf9o6KkU3sl371vQ4O09SWmblJy62+FDp+ooIqzzQ1HcRdMVj1x40Aa/+tLiJ2q8Mbmdz4V5q81lB1pwJik2ArF85aIUuFhbUNKSbHMN3SeZJaKyED/7HchoaW4YuCqcWcNhQMzMGjvYrtMHxcpc016wAuzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhTu8Ccf; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7728a8862ccso3912542b3a.0;
        Mon, 08 Sep 2025 08:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757344056; x=1757948856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1v/nevopYryJ3uwr9+MPbLpeMXJ/woYxaQOCe5ZfhXs=;
        b=GhTu8CcfoJqerc9U97XJ44hpjc6waauGceh++UV496D24oyV8Urh0mv1/qHoDrs+PT
         cN+gkcauuo69hyzvY0bZ+X6rwrBaU70CUPXIOWhmwXahUyEEFMCQiPFzXLRjzv0Kyk6T
         ZmAxOb8HtiMCpse1iXsuTLyVrtYI+YIfakZW9ylUThXkzNHw1HTvNEfdyFtjAzGxw7qv
         lnav7/DtvjZ/Z2wj1fNv/UWnw0NvWLT6IQYnHBbUuGd9ZdTdhQ77jiABTOTXoqTG7VTD
         an7kYW5Z0IDccOyJGnE/EeQEOsIUiZsuPAP28TIshOSfbjn/dDgXnDftpQ+O9TXB44kh
         +IDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757344056; x=1757948856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1v/nevopYryJ3uwr9+MPbLpeMXJ/woYxaQOCe5ZfhXs=;
        b=qMOJrrosMRNYRREcsCRtuQnzK2Ev3mTlRmzQ28EIbDFWn178tVNtY7lR+CJqWF640q
         Z5yH8n8LTy759K5g5CXvZhLWpdBJqcM2JTgpxYaQYm+ZpXg3f4tEh6UnKyyvjo309lTr
         Q8pb464Pg4xn2fGmcg2HWESWb7ORnRSONmwPkoo2M664HiZ7mW87D3Xb364CS34yxyjh
         b5j9uUOYO5694d6mBHi3JjXz5ysjcQ8go6DatVAiC30yVrRNGS05Re5nKrlu3ZE0h9QJ
         PtDullLUvdoJP1EXVkOAdAn5bbQzXGzQVnKxQTH2PzFs9RY7vnenycCNYNYbdMur5ezH
         x32A==
X-Forwarded-Encrypted: i=1; AJvYcCUX5pxX9w5Z2NjyhX733e/fo6KdNOCGTq4hioE4xXDUaoG2hrQohHMBjFMXLGx/MKXdCHxDw3oSVg04q1Y=@vger.kernel.org, AJvYcCWs9LSUcnMUvTbFLsP+klIOLpC7fu59N3uwdgwIZDD+4JawiHJICApwGF0kNNLsAHXFXfAgPJKP@vger.kernel.org
X-Gm-Message-State: AOJu0YxgZ0m/J9P+B+oEFeLRzEfQjfcJAm4IaQgTJDkU2spfAPgOl32o
	/LCKiaBiqCrWKPbV0wULSaTYqHMDcYAcge9vS8z6dDWOrMC1VdrNuQ8h
X-Gm-Gg: ASbGncuQGrkLejPQGMDU2s03QktfYZiZ04QVY4hnoAcyERAXWBrQ/NIp/6z5GSIHEvu
	cw4BeyOHqPXenikZOlNV8poe8nEi2Udunmi3SOxz0WSqZZmZ3s9g4YMAC2CeRuzbBxUhp7Ew/RQ
	CtQso3r5I9AsRVSfSJiMF2LPvMf60Qd6S8tB3gA4s2wz/Mw7w6pBg4+7As0XsH22WoEbLZOQjnr
	L5r5ylOfn2dqI+pq+BkFIYQre4muPqndUrcva/Qp6PY/BR+qIgCtZ1iADSkPMAjUL6FMLvyaP1c
	BrNab+mfLOAg5+Jtl3bJIs30j+Vbzi7ZbhS5c1qR0DRDvL7Qaq0leeijhBMSbqsQHaxpZZ+boh5
	xS+HC5J+KcHmhFoUlox2BSA+eVsFp2UqMY1B2aVfuCeilAXG60Q==
X-Google-Smtp-Source: AGHT+IEh5uNcW2Uoy5V2ckDNYiyBbPPqFLxMnrdRDJzgZKBn1yOD7zvwJgjbIJEgkuGhmmdtgxdpyg==
X-Received: by 2002:a17:902:ce89:b0:240:6fc0:3421 with SMTP id d9443c01a7336-2517427bc80mr129563525ad.3.1757344056141;
        Mon, 08 Sep 2025 08:07:36 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b273e4ad5sm169744005ad.25.2025.09.08.08.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 08:07:35 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	hverkuil+cisco@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	aha310510@gmail.com
Subject: [PATCH v2 0/2] media: az6007: overall refactor to fix bugs
Date: Tue,  9 Sep 2025 00:07:28 +0900
Message-Id: <20250908150730.24560-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series refactors the az6007 driver to address root causes of
persistent bugs that have persisted for some time.

Jeongjun Park (2):
  media: az6007: fix out-of-bounds in az6007_i2c_xfer()
  media: az6007: refactor to properly use dvb-usb-v2

 drivers/media/usb/dvb-usb-v2/az6007.c | 211 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------------------------------------------------------------------------------
 1 file changed, 107 insertions(+), 104 deletions(-)

