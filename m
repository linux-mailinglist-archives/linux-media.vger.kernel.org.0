Return-Path: <linux-media+bounces-33690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E93AC92A6
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 17:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C43E1894704
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328812356A3;
	Fri, 30 May 2025 15:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEBxsTKU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37762AF14;
	Fri, 30 May 2025 15:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748619720; cv=none; b=IPOVfJDmN6f/eHnDuI52RQbFfDRuVKj5i+7IcTqGflBWIvA/u4Ym2bQDohXKI9FaiL9isw4ufNF1cNK1Q7AMXFBwrxPwtpLyyAjmPrTJgIUf1z0Fg+ut4MFfjrOS1ycdDPsxKbGpDSPW7bdxiBOjYAH/Nj9JCqwrRn7h208iWCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748619720; c=relaxed/simple;
	bh=LJ2+zOGMQG7AE3Qcc5sJJKA0TfbQFAYdQKxpZpbw4dU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fcLoibICkyOedreYn6Mg6PUYn56gilXAPRaefbUf4R9Ukhvg+l17Le9Vw8B96kQnN5lt5CuyDJm6CcVTC4Igvkglpj5x2odbfHx6YS/fSk8Nm8BxalsPSNEK/AWDKqxVJyesYvWVp0iBWosF8yBI5/Myfcn+oVTfpjH4ma2/S+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEBxsTKU; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a3771c0f8cso1361567f8f.3;
        Fri, 30 May 2025 08:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748619717; x=1749224517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AGFvnzdG+NkB2xDN5JW+MiGzL/AXD084tM7WRjqtBAU=;
        b=nEBxsTKUIZKOUfvse12TquK6JOyZJxO8KkxJrhNJGiwl82C8aW1zlUqIW7boeZjLXJ
         gwCBCQ/gVsPMFF1syixN2A1AK/TJTwhY4KRwIcFth8JHGC28wAUV8QtbmLT5FyCScEyu
         Rn+hLPgRY1RQxmfqTpgnis7fBJVEyJyPm/WXwsBnLQqncTbyoZARdxeic9f9Fxmzh50S
         r2Sv7G6a+Xm8Nh0jxZ6nfZ+4GhSQwkA7YNoRtfXxd5OAYgKsdV0WYuq4bVPAsPEx+qTR
         u7f5LKlnW6iK45HGpOkOQm45n9rKPHaZE1+3L7F0j28oBaoF2Rsqj5/1OcWty0hveUBq
         qryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748619717; x=1749224517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGFvnzdG+NkB2xDN5JW+MiGzL/AXD084tM7WRjqtBAU=;
        b=hPlDSIEHc2PcNtFr9uEFMHVLgghdBvdYUCvYRA+F6l5OoYqLHYyvKicVm+w/lFwO33
         5hR4QfPc6kahno44zLcmDy1oZbvcltC1aVTtjokAN2jl73ucNZYA1S5ruXsdy8LCKX0R
         J6+HVkEY+EvSfLJqU3DYAAHZYLP+DscPAnvGK+LqNEX5gT5VZe+cIAFlcElaJhKTag3C
         4OZvt2KvJoAIKROb+NgyoRRfh5AkzlEcNPRHYa1MWuYBGWe/MU4JD8RM/vzm7fiZece1
         lY/KcmdoF5Vw7xmD55aZlp1Rvp/gveTM6JSpbf+iWH0rm5wcvzNMEva8mZbo1XRZZNrC
         r+Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVaJeuR3FLEBAYO/Peo0qEkniLlGsvGRqsxpyKNY3HO0h2NYK/xfTHUOHfwpm8nGERJ0Dmf/EuB4+FiA+t5fBjkuP0=@vger.kernel.org, AJvYcCVgY5Fg9XfIuJHlLfJp669tpLDAZfWqrVxv0rF2HnCZOvypaK6xIWxFd7G4KhaeDVUjE0pCRr2ngrePgjMv@vger.kernel.org, AJvYcCXMQ1Z62c/lE+Vlc7YWVStM6uDoDWwiz4cWGebnUNOQ5imEePsaVSDXGy6VCHkZD0Rw7tN1/3Byx0sX@vger.kernel.org
X-Gm-Message-State: AOJu0YxY4g8Q+mdaahsaO9s474cOss+HcH1UrffY8gisimjnKIhyvqPT
	G8wFAwDo4JJev8QAmizDb98KDJh1+JvrmbbEZy8YR6ap5QJ/CxGYMjhh
X-Gm-Gg: ASbGnctqiQQZp3VV/UTFop5wv/Durs56AWCOn9B7rw9VM5sLPFfCJB7MlHGwLKANL2B
	Z2l2kbYqQRqLzP0DcjlFCeqK2lpFikzkwfXA0NBD7bUvMYc/+iNwdOiO6KI14feniuNzZnbPEgZ
	E1gOginmSJR3VAQt1u04WV3bIZ8Fe/YUecA8g/GHKxie5gWohxgDDc2xg80Vr7C2TjySVwfk+GY
	6F6s16+HwTkohAtTUxKQUknQH+cU3alHhBUQWvn2IrvGByxLTDrbOAgZsjkG51QOVUo5TLajX06
	iotcZRMVGxq1K+zLjufRKeU8Moe48BUYaIPukFCYX5ZL/LXtVcX5G6Dn5paFA8ByThUXHY/ju69
	fnbZSBQ4k9rd6Xa1MmRa/JOUauboMN0c=
X-Google-Smtp-Source: AGHT+IG5mbTOI0i2uWUfB/V4qDgIbycfObagfxon+rYxpoLqjT9KXN6rx+soYxFnyjRc4wpbZR30Mw==
X-Received: by 2002:a05:6000:1a8a:b0:3a4:eac6:e320 with SMTP id ffacd0b85a97d-3a4f89a5ab7mr2478555f8f.3.1748619716894;
        Fri, 30 May 2025 08:41:56 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8012adesm21507235e9.36.2025.05.30.08.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 08:41:56 -0700 (PDT)
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
Subject: [PATCH 0/2] media: dt-bindings: Document VSP and FCP for RZ/V2N SoC
Date: Fri, 30 May 2025 16:41:46 +0100
Message-ID: <20250530154148.374663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series documents the VSP and FCP blocks for the RZ/V2N SoC
in the device tree bindings.
The VSP block on the RZ/V2N SoC is identical to the one found on the
RZ/G2L SoC, and the FCPVD block on the RZ/V2N SoC is identical to the
one found on the RZ/G2L SoC.
No driver changes are required, as `renesas,r9a07g044-vsp2` and
`renesas,fcpv` will be used as fallback compatible strings on the
RZ/V2N SoC.

Cheers,
Prabhakar

Lad Prabhakar (2):
  media: dt-bindings: media: renesas,fcp: Document RZ/V2N SoC
  media: dt-bindings: media: renesas,vsp1: Document RZ/V2N SoC

 Documentation/devicetree/bindings/media/renesas,fcp.yaml  | 1 +
 Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
 2 files changed, 2 insertions(+)

-- 
2.49.0


