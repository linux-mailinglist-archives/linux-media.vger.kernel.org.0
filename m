Return-Path: <linux-media+bounces-42088-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4111AB4A8B9
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 11:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F778188F5B1
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 09:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76427304980;
	Tue,  9 Sep 2025 09:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXZNRZD0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C24D2D97A8;
	Tue,  9 Sep 2025 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757411115; cv=none; b=E7HlbiBghdd34UeaUI7koDShxjbODr8wf0d8G7D4segGdRRaC3ELQcVvbDiMQ1n5X7Xsy4bpcSr+LZ/5YaA8NJpEmJWRmruMl1ABv/h57SdAwPNlRY09o2IKBs+tayuu/JnbnZYf4J+WWgp4MXNkw/UIPvKzB+yE8/TmvPGL3dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757411115; c=relaxed/simple;
	bh=SMv8p1dj53modjE8e/doMjFig0vF2Zi5kPAqtkktXnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=apKDSm5lpysH1BeJzZS49CY3MYXPmUAkvn4fU1zoFiaY+8v/N0WnufMpyBx05r9lg+HKjrXg2+l8ge3UrMRWEJhwFI4WNx/+/wSvokhUlKXs9EUz5QoG7V/nInu0F10X80JINQ4nMVeHrE+iCVNx3TjmFy9qdMMe8tT6NfYaXPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXZNRZD0; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b0431c12df3so930981266b.1;
        Tue, 09 Sep 2025 02:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757411112; x=1758015912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cw0cUbTUphcuoZG9OqGVt8pt7OVfBVIJzzzePPfiUl0=;
        b=GXZNRZD0sBSO2tki4kbQkQAjaH/5QIT4qN/utdhv4oi4Y+8CRiLsSzDWeGJatXSBki
         zonJ0A2A82bYzStCiybGaNjmIEwgkzfi/dh2WDJE/5Yvp9xZ/Cx40fRqWNTR0rkdDVES
         stBiuz9i3Fqv4OU1O1KHumQATy6jwEI6gP9Y9AZLaTOAL/2gFY9RnjbMmnwI0DQ3cr6E
         PRbZcCeeqoV3M/fXk3qpXZKCK8qwIfeC8J/I9MXOsZ5+sZlacSyP+OkIVyee+G8sf4w4
         DiA2miYaz17Lakazj+auxloSCgvPm2BqgjnEDVa5J1k6RqMRskIFePkqAmpFjfeEHDKf
         aqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757411112; x=1758015912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cw0cUbTUphcuoZG9OqGVt8pt7OVfBVIJzzzePPfiUl0=;
        b=VM9WTm2Yv6I36Vs4bxQPYR0r9Vg0ClljunMwRX5rip8yHF2bE/S/TK1d7axnELJ8WB
         RKri8RdDXHKtHuyQhJlXz9dQ5zZSPc73r3ssc8fltjRkyHF5JK7SUTqU9RMB/oDaMugV
         VjLM1J8G5X4AyhRaGb6SPRIhNdQg+Fh1xc+NmnqTfrQ/VYXJEb596aleFERsvEF0NUSR
         WwCTQZJH4cXjTyUMKem2IcNg9A+pDevWXyWufFOHyr/woMCnkwtxn3QQlmDeAw+9zATa
         LjEbScDdO/WvXiG3zW3d7lxh8HCQl+ySygcfw4VUzz6LH4t7LpTCO6vRsgNus1SGJ3bm
         +Clg==
X-Forwarded-Encrypted: i=1; AJvYcCWjjTBcV1/xkszpOs3Kn8G5ROlwZvrKEE5AAxL7NFrpFltu/NP3YaSez0+ZeDuXDRJRyo2fsCHwW8yq57Q9@vger.kernel.org, AJvYcCWuZKew2fkQBEcB49ckHJRdkP/ZfmidJSAJN9YbrSI3vNgYeLboqsBAszYP2O7GIFhotw/7gJbB4zgK@vger.kernel.org
X-Gm-Message-State: AOJu0YwKzg1DX++RzlFC8chXqfTVuWFYt7SiHxK+JfWZBmt0KOQlAwpg
	M3kdXJ4gcmUaYVRuUr3Ajf+ydvsUWHZ2Iy8q3mkQF760S/wkHXioNjT6pv68roRO
X-Gm-Gg: ASbGncscV/pahxD8hIhZ74xL559SUcrTuhlTBqWWIMUsTg6hCr9mRNqzsMF3r1U6+FE
	/CCNc3dFZzY68ijx5ljwJQh/mENkgQANUbBejPxKFPZahd0PbjTpwROYc1FzpL180KD0ydhi/Ka
	FFXDg2akMTIcXUSKcbUp4jwxhHiN/uIYa5SHOI7RgdVcq+ZdqJv2B69gTDscGA0uJDDix5iraB1
	D4cbGqub3m8/asHSQMijqxrnexvqgPgM91Ll7Ms3qqJm0Emcy7agf0CAmTMAbS4ODxuE9Ni3B3M
	OE8JMKL19Vc1U5wPAKa9ZfVAL4ysKyA5J0kAhnMn2c6LtCjTBTTWdKMEE8nW8i6q90U1aHBWjz4
	lSdmc4kl2VQRM9TrgrfbiqBt8fYibsg0i
X-Google-Smtp-Source: AGHT+IF2gUOc/AT7KLsAg19+9zj7vKAmqnwXUD2FZHl3fbkAeyNVIiagjQ7fsaQ9gV4OTxcisaLseg==
X-Received: by 2002:a17:907:1c8c:b0:afe:ed71:80aa with SMTP id a640c23a62f3a-b04b16d6406mr1216546666b.57.1757411112307;
        Tue, 09 Sep 2025 02:45:12 -0700 (PDT)
Received: from avt74j0.fritz.box ([2a02:8109:8617:d700:4bd8:5793:1d49:8ea3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff0971379esm2568706166b.102.2025.09.09.02.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:45:11 -0700 (PDT)
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
Subject: [PATCH v1 0/2] update email addresses.
Date: Tue,  9 Sep 2025 11:44:48 +0200
Message-ID: <20250909094451.2262445-1-mhecht73@gmail.com>
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
  Documentation: devicetree: bindings: media: i2c:
    alliedvision,alvium-csi2
  media: i2c: alvium-csi2

 .../devicetree/bindings/media/i2c/alliedvision,alvium-csi2.yaml | 2 +-
 drivers/media/i2c/alvium-csi2.c                                 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0


