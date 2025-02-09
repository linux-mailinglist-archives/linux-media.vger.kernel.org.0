Return-Path: <linux-media+bounces-25865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D705A2E0FD
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 22:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 657C41886679
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 21:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8BF241C8A;
	Sun,  9 Feb 2025 21:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjTZN1VC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD571474B8;
	Sun,  9 Feb 2025 21:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739137938; cv=none; b=j4vTSiYYc+hjA1NziYjryAHtsmzPTC2IX25V5Xk1SoXbsYQZJuxbIit1RLgG77ZchiWLI3dhtcKJN5SCJlKKcUcGwYVnTEbQfv3rlUm0FlwyzURhASlTfP/fvzcIpXVQ03aWA9K/PABn0awUWIs1JKGktwhNf51rzKSWYgm1f/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739137938; c=relaxed/simple;
	bh=uLOKFkONbrwKQL0GVTL+RBqZQj2F5LXwTUf/BvmTzYQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FjU4e8iTWwsizzY2b9IkOZOiu4ZFtdouKu8WUz0Ez63rWfS8iE9ocygBQXWwK7CxXS7pp0TS/ZCYvSRe+wpsh5Ro8Auhl2CucdrCUki4xP8IK1BXC0cjlYgWqbLYfoVwY52qWh4HOSq1a2QcTOZ7wzvsqVyZfocWbCLQcBNpRfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjTZN1VC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCB07C4CEDD;
	Sun,  9 Feb 2025 21:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739137937;
	bh=uLOKFkONbrwKQL0GVTL+RBqZQj2F5LXwTUf/BvmTzYQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OjTZN1VCtSWYw8Ihc1ht1u/VWLVtPL+qCcfWCMv4IYJT+MSO6kY5SD59DzC7OS7cT
	 fJf+b6yKbehPHS81fQp5CwdpAPxWE45RzG+pK6WkBCcbHUXOsHQiazOg+hf2Bdiu1Z
	 gOsW4xnGIfYqDw00qv8Ps94lfOTre5/s14y9ClNbd0AD0QR6oeCQv1wZiFD3rf4H5g
	 OwI4IwLmlSx3KbqmNnmd9udILQNlPJQlh4KMeS4oZzLpaRODRWjentZFOtPE+yAHQi
	 TUuXi8+m4CcLzC6r3ecb8bCzfr3xNL3sJk4EjPYFbFGqdSPnqat5EXJFHupvloA/+a
	 qrMDBbrQYOjUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9095C0219B;
	Sun,  9 Feb 2025 21:52:17 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH v3 0/2] media: i2c: dw9719: Add device tree bindings for
 the VCM
Date: Sun, 09 Feb 2025 22:51:56 +0100
Message-Id: <20250209-dw9761dts-v3-0-14d3f00f0585@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHwjqWcC/42QzW7DIBAGX8XiXCxYbH58yntUOWBYBw6OUyBO2
 sjvXuKmUo89joRmh+9BMqaImQzNgyRcY47LuYJ4a4gL9nxCGn1lAgx6BkxSfzNKcl8ydd455hT
 vRm5JfX9JOMX77no/Vp7SMtMSEtpfQ8c564EJ2esWjBKKcho8nhb0eEjogy2tW+aXLOHHtfaUH
 yOZMWe79wzN/13Dyp+60WakFedYhkZPUoJxjNVyIzwIyUF23AnJFCrda27QKDuS5y9CzGVJn/t
 AK+wlry30ny1WqOcdE3rSFqbRdAd7ieUru9DilRy3bfsG+6/qdmoBAAA=
X-Change-ID: 20250206-dw9761dts-cdcc0c714b1a
To: Daniel Scally <djrscally@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739137936; l=1009;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=uLOKFkONbrwKQL0GVTL+RBqZQj2F5LXwTUf/BvmTzYQ=;
 b=IiP+hQdUKjqTHKOqSuxW1WjW+yGfW8hmUydgX6oR5AURPoKBy3XBShxsYFyalzKIFzRVTHQDS
 TolWnwqv4ZYB5rNwKTkTe4pScljy2iThcbsn3Uoipz2JDLP5bH9RXHg
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

Document the Dongwoon DW9719 and DW9761 dt-bindings and add the related
of_match table.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
Changes in v3:
- Add patch to document devicetree bindings
- Add "i2c:" to the subject of the 'Add of_match table' commit message
- Link to v2: https://lore.kernel.org/r/20250208-dw9761dts-v2-1-c038f8a2fb94@apitzsch.eu

Note, there was no v1.

---
André Apitzsch (2):
      dt-bindings: media: i2c: Add DW9719 and DW9761 VCM
      media: i2c: dw9719: Add of_match table

 .../bindings/media/i2c/dongwoon,dw9719.yaml        | 45 ++++++++++++++++++++++
 drivers/media/i2c/dw9719.c                         |  8 ++++
 2 files changed, 53 insertions(+)
---
base-commit: 8f6629c004b193d23612641c3607e785819e97ab
change-id: 20250206-dw9761dts-cdcc0c714b1a
prerequisite-message-id: 20241105203658.29737-1-hdegoede@redhat.com:v1
prerequisite-patch-id: b0a57666bd20b97291583c3052065dc314a37e79

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



