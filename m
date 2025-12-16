Return-Path: <linux-media+bounces-48870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E9CCC326D
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 14:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C88F303815F
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 13:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F30354AC7;
	Tue, 16 Dec 2025 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYrmsmXJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62B63328E3;
	Tue, 16 Dec 2025 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887893; cv=none; b=cbZ+b3Jug4FLTFTiPhsbcOwFpcyJC/UyknC70O5HlQWPESBtAM1gKhyYq6Yd97yW11zL3eTnFSvy2COLbDaOAGwzxxpCuU2Yhq/WpiSx8pjV6A0MAYTFANOdQU4pDxziE7M3uneKbi5ysbljMq47sEtwkgwxJwNfNStlsZp9vdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887893; c=relaxed/simple;
	bh=ioJNJf6E3iqakh89UOBaktoghK6qUOL79hbpE/KqCRI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F5RddJzbb2a2ePAFz6GLYduLab1clCZha/Re9WAIZ1SWGmMUnUJ/Z42SJ0+CRJR/no6e3TEo4B5/6cJ1+hN0mwOp63LxXeY47Qh/zDhLt4jXz+6erW2zD38JAPJMeFeikwF6TltF+6uwpIaw3oJoUKNaPHVlIq/aaF5GVNJWgqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYrmsmXJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67597C4CEF5;
	Tue, 16 Dec 2025 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765887893;
	bh=ioJNJf6E3iqakh89UOBaktoghK6qUOL79hbpE/KqCRI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=eYrmsmXJifQuq4tgipaOUEU8ck88EbTH1a7FpxV4cejyxKWqy9C39HDdEkKu9YKTk
	 oRdD9QTjY7j8gDpIcxS/M08FWuUlDlZuRpdePc++W9pyvEjLy/QLG3PKlem1Cv+UVM
	 93a475B1A7cBZJ/kSnwB+UQLmg9OGskZKLMEzHAIjDlIWP5lpuhI5wFVXAAfVGES53
	 /Mc/mJYo4iPJW4bky5Cq2Izzxb3mqe3fGHt79H3VI+Itc1yIu0Eem5h5DIiJSHf7Fz
	 ytdsYjwh1KG7CBZks7Xz0g0Ls0IBDtbAthBSuKt1iQj/FNATXWqnEm3/LQvJYMFcqX
	 yJ/afCWPIxErA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A755D5E127;
	Tue, 16 Dec 2025 12:24:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v3 0/2] Improve older camss supply descriptions
Date: Tue, 16 Dec 2025 13:24:49 +0100
Message-Id: <20251216-docs-camss-fixes-v3-0-c238b6810771@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJFPQWkC/33Nuw7CMAwF0F+pMhMUuzWvif9ADFEe1AMtiquoU
 PXfSbvAgBjvtc71pCQkDqJO1aRSyCzcdyXUm0q51na3oNmXrNAgAQJq3zvRzt5FdOQxiDbREhL
 u4UigCnuksB6KulxLblmGPj3XDxmW9s9YBg2anAEgQzHS8cwjD1v3UstUxm9e/+BYuD3Yxjeew
 O3ch8/z/AbQIwE67QAAAA==
X-Change-ID: 20251212-docs-camss-fixes-0fa525271951
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vikram Sharma <quic_vikramsa@quicinc.com>, 
 Kapatrala Syed <akapatra@quicinc.com>, 
 Hariram Purushothaman <hariramp@quicinc.com>, 
 Richard Acayan <mailingradian@gmail.com>, Bryan O'Donoghue <bod@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1412; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ioJNJf6E3iqakh89UOBaktoghK6qUOL79hbpE/KqCRI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQU+TMUrOS2fCW3hRVB4ctdcSTSInlnWDipJxy
 arm18T5D3+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUFPkwAKCRBgAj/E00kg
 cky3D/0fHzJJ6PiAsMbr8iHCykuCUboqMdggD8hCafYdDg3D4dDCYClmeqPNtWlbKDVZwnKGtok
 0++tHUtd4Z+RyUrtvbjAhzDEvF7OV0WXMaohedlw7XDUU8LOSrrXLErERNPdpVSoPfVho/LJ0zp
 c0iDJ/P7PMQ6RyV6ctFeLrBvCZc9USaSqsdcRgrxJJ8hPbSP1B83VTCkFfQ6zBgtXc0c0gqJEFa
 8G50D/iAL0Ut5MW8mcrH1MYDscmRblwVNwED/BSV7Pkwx6I9Az30up5geEssGP16pD9DfnUrW9R
 r9vsxuMbYHJ2QXv0wHEKmvIVmrjjqop2ShRzdo8fOORg+4fL13QvJZgxnh+nDaMfBMonYlJJ0sx
 5XMHbox4r3sgddBPb4NNR0X0b/Xrzh7yaYstXa+ap8aHfPHaNkcb+vuz9CLEvpecnwCYYD8kXW6
 5vpkQxbaEOIJnv8+LyengGEnnm+WxCr2d6Of55fU5Yfc737k2Fd8bUNyzeCyK7Q8q+0sEvS6T4n
 YBtXS4zmph7I4iskyLGncjLJ5SOXbGuCQwWyRqMscxCxr6MwzXVc60cN+hekVEOLWhDN6nVqHsa
 QmPM7yaK4kiigAYdiuWVymAx0pbI+CcC5xRgV3uwPjeX7FVloHkieRk6FNCU1hY41kcfBygUnzM
 l8GGUskxXUixapQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v3:
- Add commit improving vdda-phy-supply description to match more recent
  bindings.
- Double-checked and specified it's 1.2 V vdda-pll-supply. (Vladimir)
- Link to v2: https://lore.kernel.org/r/20251213-docs-camss-fixes-v2-1-a8a4d4d51c6c@ixit.cz

Changes in v2:
- Applied suggestion to clarify the description. (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20251212-docs-camss-fixes-v1-1-5c011505ff59@ixit.cz

---
David Heidelberg (2):
      media: dt-bindings: Correct camss VDDA PLL supply description
      media: dt-bindings: Update camss VDDA PHY supply description

 Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml  | 4 ++--
 Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml   | 4 ++--
 Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml | 4 ++--
 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml   | 4 ++--
 Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml   | 4 ++--
 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml   | 4 ++--
 Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml   | 2 +-
 7 files changed, 13 insertions(+), 13 deletions(-)
---
base-commit: 563c8dd425b59e44470e28519107b1efc99f4c7b
change-id: 20251212-docs-camss-fixes-0fa525271951

Best regards,
-- 
David Heidelberg <david@ixit.cz>



