Return-Path: <linux-media+bounces-33692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 981C6AC92AA
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 17:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2486E18944DA
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1326236443;
	Fri, 30 May 2025 15:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFPj6LNc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA921FBE80;
	Fri, 30 May 2025 15:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748619722; cv=none; b=g2SjL76AivpuHoznXDexTiQxzUgOdz3QaoibmUkO/2LvR7CK8j2OudSujlfUmfBroHDMeDI3aTGqsdqVRB/YvaCdBcTMIhNIHBw45h0x0GrK2nVSqCdesUsGHLg3SXxg815qjVBlBLlkUGEbREYAdUB4C0fAq4y8AaDnLD4QE7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748619722; c=relaxed/simple;
	bh=MeqQiNFovLa6yADfHYBksNjX4KGzqRlSRB4EPotTUSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ktYSn/GWcwz4xp6zQqTY4+O9e106URVQg0wL48Q2PguDzZEDBCypjfBtRIe+ksTVbMMTlVkaA0ZWaUtoxw4m2u9ALctYJ2v5pl60BeQ54nV8EZ/7cQrjSv8AguivjUTB2BzYNRUe5KgYxV9bKWCwqxAFLpp2q3b7xzLGBa28CWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFPj6LNc; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4d877dfb3so2282021f8f.1;
        Fri, 30 May 2025 08:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748619718; x=1749224518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+h4CMezyzcJgl8PUNXSJ1OJOFN8RlBS8lSG9U8U+WJU=;
        b=AFPj6LNcOVWuG1ZR5B2ZMSwyNugrNH6bexD+q7DGOO2c0ZTqc054UeS8JKG3dKndJs
         Syiz6DRCVUDWWPIPXiQA412DZUoOFZQYxcOgUribRp5tLemcWGySjjzsJoi8hcKfUusB
         hXCYyuN817RdVA5Xh2I/CqGo0G0F6Iq+bpHwks+TMvJUCco69qhtpr+pwJDzQB9zdt4h
         6oVk/LjzJgHBal1BvHtnM5F9sLBny688+XW72ylYnhmCCVQQyDKvQLQot4u5GNxtO8NV
         Y44zoOAPG51xcvWfnqkOikEcuOfHE9Gmyk4ljlFekg2Noy+a95gHr3A2LvPpIvsDl12X
         /FsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748619718; x=1749224518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+h4CMezyzcJgl8PUNXSJ1OJOFN8RlBS8lSG9U8U+WJU=;
        b=fRAEOXMbSBaADHS3QJ2plxOE+L77JFud9GsJEOTSJ3h/03qK8IKLMX6nXhW2R+RJDS
         fSrC0k5Qjs30Xu/6Ek7aJSH/tDLHy2a2MeEvQDu5EVnBNPG8s4d/cc0akxCb+VLhEwxu
         eTXlzRZ1pCaP4rqf9ha3WkQze2aTOeFUye0algvK/rob/XT4vP9w2CD0dasE4wR2nhe8
         QwCgRgcwrlEoF+F+wgbmVQy7pkitJyhqpo+lcpnxNyyaOfAEAYH9S0/TEjCf7fTDMJ89
         XYRQnHdy4zQMETxh9gUlRS08FnmhC3Z+dUcaLlt2sTiTnGqFq4CXNcBD1aa+LkUhgL++
         xa2w==
X-Forwarded-Encrypted: i=1; AJvYcCUGgINhw8CM7SXxJ5c+z6f22Zwx/14BNwHYZGHi/Mbdeztfgzv4gLnkC4Q7SDIOKiImYK8ok0sh3eAo@vger.kernel.org, AJvYcCW0PzwTYsAPWLxnOs/mU9eE9Byj9EbNPRhoSSa1zuIzyLq4jB2JhDlOSKAc3qYk6GnyllDsFIyqALCYRdqN@vger.kernel.org, AJvYcCWlZ7awgGpxEPxTmDSRBGRM/YRql9o5zrFfT97x/zmfa4toBnlom7TKX7Tno8CS4aBSiYHHZKCaSsX5P15jxbNCVqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEWVc3BE3QUcXvW1nbrSPKQNrVFP+TfjerWVFBpr2arJ1+6zF7
	xQDvuNDW9WHCJBQTHkbT49rxJiBecIQzun3pVsL64m7RbxEMS8fG2j1Kfr9tS8oZ
X-Gm-Gg: ASbGnctCWn+czpzo8SiyshCrUo+q6/Dg606jDZd0aa8VjnVXlINk8lCT+yIkoy3/jfe
	Fr+tkjrNYHEOHfKVddXjIPzViCNnyz3McJ244PKmJ7RelxD5CUpI/W4/ZU+URrRKIxNnbj7B6Oy
	xfRxUdbprcACskyzR4Hf7SOGk+4IInNt3XoASl83s38BzgPnNvImUfjXhGR+1/njRel8Xekw7Kp
	2+fsBorGR3uDPmkFOYOKVKJSaxu7llyPslLQ5Jj6lqI1XPbdlM7NVIc3EfQYOcj02X+C9TLXdWg
	WAKeKWNrRO/64qnTYSRLppXFePhbF6sx7d/c3Pc9XZOpGbb1ZGOkMcRXVHlytHA2TbaGSh3JGBI
	GRPcOxH3HKfW7sl0gz+S4
X-Google-Smtp-Source: AGHT+IE1GTcBDf9P3cq1pMOTj7cxtnKzaYXIq+NZ1F3D73ehOIo7O5q4tiUW1IeXmdm2rAamBtGy5w==
X-Received: by 2002:a5d:5f48:0:b0:3a4:eec8:c9b3 with SMTP id ffacd0b85a97d-3a4f7a627f2mr3274751f8f.23.1748619718307;
        Fri, 30 May 2025 08:41:58 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8012adesm21507235e9.36.2025.05.30.08.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 08:41:57 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] media: dt-bindings: media: renesas,vsp1: Document RZ/V2N SoC
Date: Fri, 30 May 2025 16:41:48 +0100
Message-ID: <20250530154148.374663-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530154148.374663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530154148.374663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The VSPD block on the RZ/V2N SoC is identical to the one found on the
RZ/G2L SoC.

No driver changes are required, as `renesas,r9a07g044-vsp2` will be used
as a fallback compatible string on the RZ/V2N SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 9d03b972f522..722ae14718e0 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - renesas,r9a07g043u-vsp2   # RZ/G2UL
               - renesas,r9a07g054-vsp2    # RZ/V2L
+              - renesas,r9a09g056-vsp2    # RZ/V2N
               - renesas,r9a09g057-vsp2    # RZ/V2H(P)
           - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback
 
-- 
2.49.0


