Return-Path: <linux-media+bounces-42099-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 403BAB4AC25
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 13:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 141ED1B25772
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 11:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9969E322A11;
	Tue,  9 Sep 2025 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Usnv3n9v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443CC3218C7;
	Tue,  9 Sep 2025 11:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417544; cv=none; b=MueSvBRCXsb/sNg3lvbzX7/jJCvUe+VFwhlwyRDNIavnhVhMApQgKFcKXtiIT6RVwwrWepbDvYen7QOCC23QVveT8tqbA6/XaPIuPWe4a6LX+eFSQ6vltiuLdtowuHg2MlwDAnQNkPm5ILIK1ynAst4R4EZl/H+I01Vm2G3h6D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417544; c=relaxed/simple;
	bh=c80NjRWHDw3F9uoZvOa3/Tgt4iXLxuALNqni2N/rDrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LFLSCGs8dPAK3+lg5SdutWBkN6lNG/oqmkXIsTV/+T9MHFFaEKNoLQCwssps/jsao62sC7KGKMmWyCJJlv9ltkOSZ8tDGzHQdX7bneqoIkvoJL4AhrkHWoUBjpaPT4B9ST9qdCWho2jsYa6ZqYr9WuEez9/h1BNvM7wKdXms/j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Usnv3n9v; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb7ae31caso919574566b.3;
        Tue, 09 Sep 2025 04:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757417541; x=1758022341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0vdZghczXQeG40QUaCoqgiKkehxMnEXGzBa1JtcG/Dc=;
        b=Usnv3n9vY0ccbB7xtdtkmhsEJC+8SvPx/EP6noq/xSG7/oYbxsyQ3Saq4txa64khAH
         lV1r3fGPK0BfDAChXGm+s60Y42sgOAuerc6qqVKBfF0aGLgbgTsKSOiBoxkTU7Cc/due
         xqmIjU1h1OlaY3pMb9NTU73hSFuHFl8zJ8dRWU5yO1L/ytGfOzBCa/90pQ1H8XJUdlYB
         HSMee1FPSFHvpWBSgPDvOGit0MTaSsffFPRsQAk5Gv7qDs1lfOt//6051MYHUUN+VSk7
         yGo3nGZMUYMm1X5pHYE7s6Ok45phFIJK3ntmJu+mrQtlsIHyg5tw9BSNLuJYWSH20L4U
         9Sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757417541; x=1758022341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0vdZghczXQeG40QUaCoqgiKkehxMnEXGzBa1JtcG/Dc=;
        b=gm9r0UOuyaTdVKFuismg1MBqfHOdWX1fRIPu4qm611JgMrHO6v0mJ+SntA6SpyhsMY
         4qjoNEkuDdeaR60BBCJ9XuiRrtbzVF1pLUxHqeg1TxxzNC5egY7WOfSJaFz/cOFMS1tl
         PdvroSw1cWNzPV8hp8yMRAXKlYJe75JQMe8GSeQzE+Vp3Q+JYFVmiWVrGkURdQjl2vIN
         y2o+V1rQB9fbcwYquV6at78FXt+vYm9NyQyBR9VfPiRgkgh0gV5jIDERiYoqf94242IY
         XOLIdRsi4ZOwTm5015+cTuFkUJluM384blBtG8oE7Aks57Pauoohr5Blw5HvVO/F04nS
         UfPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdi6/2/Og3X4/scBbzRVDQqtS4rfewMv5piPe3uHjSY3om1q3fpu2mXKY+BizFHFdQcfg48uy4bS97@vger.kernel.org, AJvYcCWE/U2HWBBJa7AQuVMFGV20sJzkYy/NzFPSS+fTvhZPlfiaLrVWSvpMwRAfg4bYTWIrObljBSDGF6VLj6Y4@vger.kernel.org
X-Gm-Message-State: AOJu0YzTerD8F9OBazr7IH5rLfDNx5O1CMvRzWJafGwGjdcY0g2zXyMP
	pgx+YwzipS0SAh//+CJPmp28cdaYVPKEw9Q5XV57GmF9xIU2Nbcrulkcv5yPs7DX
X-Gm-Gg: ASbGncvyy3va0EsxeT+l2growlTaVrSJNCY+SqRq0IzQVC6T7ytShWcplyw+GmJcEES
	WKukGSZCBS4zkjZmprLVCPsACT5IJkerc2HuQll/P+pnukECuV7IFqonMFEOAeBWdhBkN5/Gtyg
	eMIkSL4vPKU7L+3qX1sGMsNMYgZ83hnHfQsDdzGC4yM4UDT4owN4jCQ2RcxTjRybYQ5P/bJ+Yee
	fBvUi+xMXY/de9NcK1dFVX3PFj/J2cJfOGsPvOESTLRFiL9JNrsXhvilCccD7x4VEyze5EcypzE
	7jq19CzdwgbCk2FYELhn8+4oq0mdDWSUh2y2Sh1cUMm+bN7asqT2gHUshAL669YW9rOKM8DjPuf
	V5OSZCjEIVlgD7fJS86/bPR6UupZf6q9d7RO6yBmEbrM=
X-Google-Smtp-Source: AGHT+IEbpXpNJeNS5DvyF7kzO0+4mm3pywTXHByCncKcMoLoowaq9U+kzjW2M47+RgVkRNgauCsxiA==
X-Received: by 2002:a17:907:3d56:b0:b04:5a04:c721 with SMTP id a640c23a62f3a-b04b1409876mr1087165766b.20.1757417541228;
        Tue, 09 Sep 2025 04:32:21 -0700 (PDT)
Received: from avt74j0.fritz.box ([2a02:8109:8617:d700:4bd8:5793:1d49:8ea3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040f1cf4b9sm2289497066b.29.2025.09.09.04.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 04:32:20 -0700 (PDT)
From: Martin Hecht <mhecht73@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	michael.roeder@avnet.eu,
	martin.hecht@avnet.eu,
	Martin Hecht <mhecht73@gmail.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] dt-bindings: media: update email addresses.
Date: Tue,  9 Sep 2025 13:32:14 +0200
Message-ID: <20250909113218.2595516-1-mhecht73@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change from my company email address to gmail.com in devicetree documentation
as well as in alvium driver according MAINTAINERS.

Martin Hecht (2):
  Documentation: devicetree: dt-bindings: media: i2c:
    alliedvision,alvium-csi2
  media: i2c: alvium-csi2

 .../devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml | 2 +-
 drivers/media/i2c/alvium-csi2.c                                 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0


