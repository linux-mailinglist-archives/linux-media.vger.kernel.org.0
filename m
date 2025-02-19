Return-Path: <linux-media+bounces-26417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4171FA3CB1E
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 22:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A3CA17508F
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 21:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB03253349;
	Wed, 19 Feb 2025 21:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTAWZnXg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8F024E4C4;
	Wed, 19 Feb 2025 21:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999535; cv=none; b=kH9OOdUMaUFXlN56U9+Wy8ByGvS+d9G/dYq/hIzwVtc579i96XWutLeiWgBVE15iDGb8TgD5755rV+Eejp2MEX1jCX2OYJfGr/ekTvQSkCSq1Tvx9A/AhvCzdial4Hx/kBOdHOjy0ZjaGnWzkPamsClN0BfA3ReKeEtPIg6lZKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999535; c=relaxed/simple;
	bh=RH2S874a9p3OcwC5UMWnwGLvCd8mOlpI7+gBBPGe02k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkwiPKMKspobKPegH+WtqoHWdFXM8PzsV9dnv5zhC6wkOE3flu7mI8dbo5hYMY11avrMwcuFoNEA2bUUye+PDVW04FqNSqHgy667kmA5RuOQ4JfUSKJxVGJKGAqXFOTaRewu6JsULHsHGJa0g+m1cAdZZ4ZokwMkKO6Pz3yxVhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eTAWZnXg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56649C4CED1;
	Wed, 19 Feb 2025 21:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739999534;
	bh=RH2S874a9p3OcwC5UMWnwGLvCd8mOlpI7+gBBPGe02k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eTAWZnXgtZ8AVs9p1jhneACdx3Wj7FIOWsubcJNQ8Uq3Lhy/j0COgROUsFS7UeCqV
	 1FIYWON4Zjvnv4HKULOq1JfQREuNZVA94ZvZSwyHaJ0tu5hGKEy8VS2fFQU+CgJJQ6
	 rBbGTIrJTEI4SV03yNjTGiKoVHVs5OAog/OsHyAnzZFmK5KjTD30A/GBDVEIfFLnYc
	 pYdkUTUoTjaJjkJHOuFIc7Ror+Du0xs2yoztCTnTqbDbKiqPa+2KDg4TdpcbcDHzJ/
	 SCpZanryjZLF0LiAVm4rLeDe5tekQ9LsZUPMFxxJBM75sJ4RomBYfciicrYYsAL1Bl
	 wQtSdsIMjXwfg==
Date: Wed, 19 Feb 2025 15:12:13 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Purism Kernel Team <kernel@puri.sm>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Robert Chiras <robert.chiras@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/12] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8QM(QXP) compatible strings
Message-ID: <173999953304.2962619.18320580606066581337.robh@kernel.org>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-6-324f5105accc@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-6-324f5105accc@nxp.com>


On Mon, 10 Feb 2025 15:59:25 -0500, Frank Li wrote:
> From: Robert Chiras <robert.chiras@nxp.com>
> 
> Add compatible strings for i.MX8QM/i.MX8QXP platform. Remove
> fsl,mipi-phy-gpr from required properties and add new reg space, since
> i.MX8QM and i.MX8QXP use dedicate control and status register(csr) space.
> 
> Keep the same restriction for other compatible strings.
> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v2 to v3
> - use dedicate csr register space
> change from v1 to v2
> - remove internal review tags
> - remove reg maxitems:1
> - remove 8ulp part
> - add 8qxp compatible string and make 8qm failback to 8qxp
> - limit reset and power domain number to 1 for 8qxp and 8qm
> - remove power-domains change because 8qm/8qxp only need 1 power domain
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 38 +++++++++++++++++++---
>  1 file changed, 34 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


