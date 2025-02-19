Return-Path: <linux-media+bounces-26415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AEDA3CB21
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 22:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99BA918959F5
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 21:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12C6C253F0B;
	Wed, 19 Feb 2025 21:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmfpLdYY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622241C1F21;
	Wed, 19 Feb 2025 21:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999466; cv=none; b=eyJBn5u2x4wDpOBJEaNFp9ew3I8IVRzLW6OGe3Fp1HRiDYBf9bk76MJEuxdYItLhXSMKia95VC9TbBTC6XKFv1eqmA5XYIJbQRKHPE0eSY+YrtRKI9Xdth6wQQDAFtvx+T+ZuQpC9L6xiIZ0/Puf13iSoYz7A0Kj+fRCqWwk/qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999466; c=relaxed/simple;
	bh=Pmh6rAEMacy/e/5HPBume8GH8tnPNRsNtj0pphZEwDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDRAHVwY2HGExXqbvYav6HEpqb9csfv0VJx9R3zS9209g8GlQnlliGNzGPh4u8LhfjYqwDZOTofN2f6gwcu5pUds0n7MFbcl2dIOE+8oJ703i0LZYLiEe1ioCiDFT6afr82vY7r/E5VxljMXn/p+IfqOpWlkQeY+axso+gIIVJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmfpLdYY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A187EC4CED1;
	Wed, 19 Feb 2025 21:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739999465;
	bh=Pmh6rAEMacy/e/5HPBume8GH8tnPNRsNtj0pphZEwDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gmfpLdYYq+id4TUJRlfAgvMSVQ8iHCPMw99Cf5DU8MidCN+n7n9TAtAIgydd1rx1w
	 NauNcXWJZDsfAzQYlK7jVE4rJBpVtpHUrjoStYUqsdpgcwUSxRS/RKCkLJ+3Eb+oio
	 gsI8WSLOadOSdKdJT54ylvhyfhZhss7t/knHDqkk0FJR8/nCDBz8o8kly3WDn6zpl1
	 sMif8Yktg2FuQC3CMnq01dCDq61uqKEr7GV1s8DUyiLx2HvJR3U3gI+QSuUcX5/lZk
	 YVqRwBUZ9JN0WXrhFQp79VmlPfKWN2yK/3RgiXpkeOdDXhFfcIQNSzCq2LroCrHa4F
	 npkObABfEoxlA==
Date: Wed, 19 Feb 2025 15:11:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Robert Chiras <robert.chiras@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 03/12] media: dt-bindings: Add binding doc for
 i.MX8QXP and i.MX8QM ISI
Message-ID: <173999946401.2961008.13720471519384232924.robh@kernel.org>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-3-324f5105accc@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-3-324f5105accc@nxp.com>


On Mon, 10 Feb 2025 15:59:22 -0500, Frank Li wrote:
> Add binding documentation for i.MX8QXP and i.MX8QM ISI. The clock-names,
> power-domains, and ports differ significantly from the existing
> nxp,imx8-isi.yaml. Create a new file to avoid complex if-else branches.
> 
> Add new file to MAINTAINERS.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v2 to v3
> - none
> change from v1 to v2
> - create new file for 8qm and 8qxp accroding rob's suggestion.
> ---
>  .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 +++++++++++++++++++++
>  .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 103 ++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  3 files changed, 221 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


