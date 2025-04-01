Return-Path: <linux-media+bounces-29112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E3BA7768A
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 10:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07D28162E52
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 08:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1194E1EB197;
	Tue,  1 Apr 2025 08:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="wQxddQIn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-10696.protonmail.ch (mail-10696.protonmail.ch [79.135.106.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885001D90DF
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 08:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496442; cv=none; b=ZNrE6moWy1yXFVPAuLeT5j0Qkk2XYRncFLXjSlhEU1acSlmjLGU0/CuyAaltTcuyx/DQME+mWdwh6frWPtb6Ut0zeupSPEkBZV/83RwfFmox3KULSKujB2XwuYTVz6KS0x3X3cuYWGuXkc7d6lz0nN0vIeRnS3rajkPqn6a/we8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496442; c=relaxed/simple;
	bh=JudEjUY8rc1H61a4v6IzTPt1VlGW7RLw3Rv2ephhw/E=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZsTicz/AC/Juk/BmNWIMgyBKNg/T8VzOTyT7P7l1hOewluMxbyUTYUzKcNwgWt/vL8MxUZ3uDT3yJA9mAIUDCsFK/Y3aVYtoAEV2wA3OhYdVTgwP9p6Uo7sMdP76ZmQxE7BrADs94pvIASDXtKl3lnE/r3NlTmjBr6QwsnYX2Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=wQxddQIn; arc=none smtp.client-ip=79.135.106.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1743496432; x=1743755632;
	bh=JudEjUY8rc1H61a4v6IzTPt1VlGW7RLw3Rv2ephhw/E=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=wQxddQIn/+4/Z6MUgQlYu4IxxdAYN3PvsAWgMeKdAsSMIVcFyQlJfNX0KFWwcFDvN
	 mZYFrhJpthnV5XcV4V8n9YBUk72hmvK9vEXOXcTDIOLDTgdOFh42o2CcV+40TlXeiJ
	 M37O8RDvZJ8RWUF6gXVqzIJgkcwmC5dX+tkTw5tV0UF0Eqfi12wjsKfe9hItUWNFr4
	 9+Ahrri4Grl4HSGYOtQR87R0deaB+jXHLwNuKZ9MF/hZE0AG7+YfiCvszKyeDXZJOR
	 dvX0qdtOWlwL2JHEvrk8jUah1usHHCIQ5IIWvsyWETBqNVKNJyXPFLd7BEBYUVjHuG
	 ou2LeCqtXWP5w==
Date: Tue, 01 Apr 2025 08:33:48 +0000
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Depeng Shao <quic_depengs@quicinc.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Yassine Oudjana <yassine.oudjana@gmail.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: qcom: camss: csiphy-3ph: Make non-Gen2 PHY work again
Message-ID: <20250401083329.314863-1-y.oudjana@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 5378a70212d1c53b7f789ff41c2d1f0330192de0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Commit fbce0ca24c3a ("media: qcom: camss: csiphy-3ph: Move CSIPHY variables
to data field inside csiphy struct") moved a version check that was
previously guarded by a check for Gen2 to csiphy_init without moving the
Gen2 check along with it. Since it was guarded by the Gen2 check, it was
only handling versions that were Gen2 and returned -ENODEV for others since
they shouldn't pass the Gen2 check to begin with.

Check if the CSIPHY is Gen2 before running this version check and assigning
Gen2 lane regs array.

Fixes: fbce0ca24c3a ("media: qcom: camss: csiphy-3ph: Move CSIPHY variables=
 to data field inside csiphy struct")
Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/dri=
vers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index a6cc957b986e..17762aee6dba 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -700,6 +700,9 @@ static int csiphy_init(struct csiphy_device *csiphy)
 =09csiphy->regs =3D regs;
 =09regs->offset =3D 0x800;
=20
+=09if (!csiphy_is_gen2(csiphy->camss->res->version))
+=09=09return 0;
+
 =09switch (csiphy->camss->res->version) {
 =09case CAMSS_845:
 =09=09regs->lane_regs =3D &lane_regs_sdm845[0];
--=20
2.49.0



