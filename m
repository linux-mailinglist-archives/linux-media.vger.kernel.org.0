Return-Path: <linux-media+bounces-29664-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C10FA815CA
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22B21466EB4
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 19:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E1124501F;
	Tue,  8 Apr 2025 19:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIJg9dG7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A465F81724;
	Tue,  8 Apr 2025 19:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744140735; cv=none; b=S/g+8/SqTc0sU2oefWXRSdw8f2WUD+VtRtwE2YX3LZyZ+kxXUyDUSfYmGZKotf4FT7hLs6r8mBx4dcfYHMuslPFE7lBI39liS4+poHYM7pcQ/U7w9q0S6jT+zAYoTYeVsU8lJuogocrsFp0SzTKUfY07DEF6N8+PThsvEHhFlgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744140735; c=relaxed/simple;
	bh=zhwkWM/eAUTtrdkSMyzsLQKpUlicty0GnkyzTS4rIkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jbzGe/iqiZxmdTWplGPCpcvQg2w0AXBlA0EtLuPMP4W1MRpLNpFKEh5JPrbQrkoRqWat7E3omkoKl4Wlp6wrtUDed5Cs4Pt8v2oYncROqXFu6+R5EiI6R+8DR1/brQ7BSj5mlAAoljHZ0fT8u6ZcO8fsWYA6/jK9B1t8Vq0UPuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIJg9dG7; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394a823036so55173285e9.0;
        Tue, 08 Apr 2025 12:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744140732; x=1744745532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pl0ATeGq438nzIuQxMENq3Y4JqWzzTkGcyEa1PNl2A8=;
        b=cIJg9dG7iXsANfIqOaPldgoJuuIYiHJZxD+Dk205ge2fJgut9Wa1+Qe6U3NE3wmlkX
         QswRq3957jNJEMc2rHaRrrxwKWUwt4CxhppHvL8ICXJTZPGZOXcmzlGmg5UpaB+nkJ8S
         XP30sQ7Am49FtGjIKeq9g3pp28xueimcZvrFDj0XKk8GpjqOnpj1lgB9U49dKg0Msm2I
         GFSr7KH1Yl7sLYU22QbRLvDBlfIcM9ykRjGdPQd6BIBJebOTI1GA3T0HubdNVaRZxhuu
         Rg57zn46Cfl8KsOM8jPtRiELAOySJJHROeTAGSmmOKsDLsBHH3RVUlG/1IDhXMTjKd//
         c6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744140732; x=1744745532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pl0ATeGq438nzIuQxMENq3Y4JqWzzTkGcyEa1PNl2A8=;
        b=uIdGwXz9kQW04iEnBn/CLrYkCEhqblTyB63EwDXW6/shog2hysUN/6ShPj5tltDZOZ
         9jZRz2Xppzxj8G9o3F6B/EZa0ZH2FjbqUxpWit9Jhc50+fxEtJXESblEFOYMrqwVcnSu
         73EW8mLWh0qeN5SZAf/NBrahDvjPeNnYUYysDa5YN8KcaGxX3Z4PhHlM2p9XQ3TxbJZO
         DyoTc3Rxbiefy20LSWllwiToHHZUMQfK6g/eXQMkofKg+WsfdxHVgbfGh4tAuXJISnET
         UYzYCvGmqoe4tHJnU+svqi1xZMyWkqMLzMZvuXTBM8V4rDU0RC0lWZT/fIaZZWOIcrZ+
         P0hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeuk1H/BPVLHo5Vk2Cr4OixTpmNwZvVWqKq2XTr4yCd0p88TB7MIyt/FaOPaLuA3Rri90z2p3U9z5gnf8=@vger.kernel.org, AJvYcCVCY04w6kCcXnfaxIyL04mt7N6x6Wt2XGoZAU6J7RTCXSi37oSI0wrlaZuPwq+uNbuD94+aQQmXi7KV12Xq@vger.kernel.org, AJvYcCVs72hZ+mCgO/y5wLFqrQ/TRPZIkTSY7IgIsFFA8chwQ2HlHTaORQPYxPxods8BNjSW2bimFhYepfjr@vger.kernel.org
X-Gm-Message-State: AOJu0YwmLs2PYmNDZrE45kCVcjP8k74/3RLn45j9HzyZruVxLPgH/6bd
	qUUjDSoDiSGeX+uHWMl8b6cQtrMHICHZxqb8MquLHBzkTKc2luPa
X-Gm-Gg: ASbGnctVJrSPXn93A1HL17vEfhLzrDpkfjzRRL7JevjoTqkLZNHiI4zMKIa7LHSkv/L
	Ldi7z3v5ClzztKFFp8p5ko58WyAaID22z3zYB1SflsYwEK2RKEMcTlqLCrMnsz9zWztxcOS0eZ0
	VdaGTAnw+alq20FQ3vL1caQhGVBqOjM12mPueKD87K08kh55dMCawHhTcFg+Au3Zu7JYGLRUd00
	mql8pRUV+rIPES5MiusQt2FtTC6C7Ebdv55yie7mLqQaEV5ghCVEQhy8aOD/kf9esxXZ3xRVVW/
	DczHRREr+5OywlLgnzFI8ONxGk8OPyknhbYXxQOwyBQbw3mULQcszWQg4YOlizMU4JhN
X-Google-Smtp-Source: AGHT+IFioGoDWxQouq7p3XUHU8n7EF85+kBWEqzPkbW7VVGixsbjDFQnAZBJ4nAWmLLALv50UNItMw==
X-Received: by 2002:a05:600c:4f83:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-43f1ec7cd7bmr3025545e9.7.1744140731733;
        Tue, 08 Apr 2025 12:32:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364ec90sm170209395e9.27.2025.04.08.12.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 12:32:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] media: dt-bindings: Document VSP and FCP for RZ/V2H(P) SoC 
Date: Tue,  8 Apr 2025 20:31:56 +0100
Message-ID: <20250408193158.80936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series documents the VSP and FCP blocks for the RZ/V2H(P) SoC
in the device tree bindings.
The VSP block on the RZ/V2H(P) SoC is identical to the one found on the
RZ/G2L SoC, and the FCPVD block on the RZ/V2H(P) SoC is identical to the
one found on the RZ/G2L SoC.
No driver changes are required, as `renesas,r9a07g044-vsp2` and
`renesas,r9a09g057-fcpvd` will be used as fallback compatible strings
on the RZ/V2H(P) SoC.

Split the patches out of the original series [1] to make it easier to
review.

v1->v2:
- Added Krzysztof's Acked-by tag to both patches.

[1] https://lore.kernel.org/all/20250330210717.46080-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  media: dt-bindings: media: renesas,vsp1: Document RZ/V2H(P)
  media: dt-bindings: media: renesas,fcp: Document RZ/V2H(P) SoC

 Documentation/devicetree/bindings/media/renesas,fcp.yaml  | 2 ++
 Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
 2 files changed, 3 insertions(+)

-- 
2.49.0


