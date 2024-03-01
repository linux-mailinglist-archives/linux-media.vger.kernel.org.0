Return-Path: <linux-media+bounces-6210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA66B86DD24
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 09:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80D68282C1B
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 08:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9482469D31;
	Fri,  1 Mar 2024 08:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="cZ7Opj3f"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F61C2B9D6;
	Fri,  1 Mar 2024 08:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709281927; cv=none; b=faR8VpnhkEncd9HJi/Z4rn+XE/SJl2zs80qnVMauf9NuWaytAs8viwevYmF1Bf+Ghmc2Hkd2zlXiDBLF6LkwrMq+MJFihq7JMLImySN8GeAgZ88Kn3SBR6LjPnvfKA9WkschlfqUcYTBgZnVAdJUr4P7dCCRIH7bQabWRqvkNGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709281927; c=relaxed/simple;
	bh=tXo+3yPFTwnKSAxxXrAIP7alPGiEQwOwRgLL411etiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nLgx4Noo01kT0dOmlVAk+ooaEPYxam3mYQrxAWhYTKLitKCiG7uVZEniV0NH8YwqEj4MIsoCfa9SYeRgou4k7OrDBysPhpjMj2Titp+M9DkFZjBSBEjO8y8i6QCF+y13DDTppbbtR5onP7qrHxMXY67aSldy5IqaoxUVPHLNzoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=cZ7Opj3f; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1709281923; x=1740817923;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tXo+3yPFTwnKSAxxXrAIP7alPGiEQwOwRgLL411etiA=;
  b=cZ7Opj3f1HGipZ8mWY8LM3YxFKbRrggehPRR1oYRVzmyMYBSlqR8My7e
   FM0Iq2/i6lmFFJKz4qpAmxGweF9zyCQ2v/i/EcZxLG3b8AN/zXwQF3UKK
   w4eTI82blK7fKTlwwFHq7ZnZYsC5T3OAJhPbQ6gn8J0mTKT2FiWLzThlr
   0qOtOIrq2/TLRolW/KhueEfNCIpXriAUDBSHKxVht/Q52A5gA0ZstR2dF
   G/cZVfX63Lo4edjOvKMUOP8Yhr6naD1CrL2LaAjWChY4XtQOySlMZriJ+
   IhWw0kGa5LXZ8xiHumI+ZMShLvDmTEz1prnJZNO3ekEfvzr9DTiEboz0c
   g==;
X-IronPort-AV: E=Sophos;i="6.06,195,1705359600"; 
   d="scan'208";a="35680235"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 01 Mar 2024 09:32:00 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6E141280071;
	Fri,  1 Mar 2024 09:32:00 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] media: dt-bindings: nxp, imx8-isi: Allow single port for single pipeline models
Date: Fri, 01 Mar 2024 09:32:00 +0100
Message-ID: <6655016.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <3f82eadb-a475-4ea0-8de3-0bfe0a46a27b@linaro.org>
References: <20240223140445.1885083-1-alexander.stein@ew.tq-group.com> <bf892e5b-be7a-4197-9e68-5199e3aada23@linaro.org> <3f82eadb-a475-4ea0-8de3-0bfe0a46a27b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Krzysztof,

Am Donnerstag, 29. Februar 2024, 19:18:14 CET schrieb Krzysztof Kozlowski:
> On 29/02/2024 19:14, Krzysztof Kozlowski wrote:
> > On 23/02/2024 15:17, Laurent Pinchart wrote:
> >> On Fri, Feb 23, 2024 at 04:16:31PM +0200, Laurent Pinchart wrote:
> >>> Hi Alexander,
> >>>
> >>> Thank you for the patch.
> >>>
> >>> On Fri, Feb 23, 2024 at 03:04:44PM +0100, Alexander Stein wrote:
> >>>> In case the hardware only supports just one pipeline, allow using a
> >>>> single port node as well.
> >>>
> >>> This is frowned upon in DT bindings, as it makes them more complicated
> >>> for little gain. The recommendation is to always use a ports node if a
> >>> device can have multiple ports for at least one of its compatibles.
> >>
> >> And reading the cover letter, I see this causes warnings. I think we
> >> need guidance from Rob on this.
> >=20
> > Here was similar case:
> > https://lore.kernel.org/all/20240227142440.GA3863852-robh@kernel.org/
> > and @Rob recommendation was to just use ports.
> >=20
> > It's true it causes warnings... or I should say - it was causing
> > warnings (one of my last warnings in Samsung DTS for W=3D1).
> >=20
> > I wonder what's the base of this patchset?
> >=20
> > https://lore.kernel.org/linux-samsung-soc/20231122-dtc-warnings-v2-1-bd=
4087325392@kernel.org/
>=20
> Uh, wait, this was not merged, so the warning still appears. Anyway the
> preference is simpler schema, so just "ports".

Okay, thanks for that information. I'll drop this patch then.
Just to be on the same side, this implies that using a single port
in this case ( see patch 3) is not necessary/wanted, no?
If so, I'll drop patch 3 as well.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



