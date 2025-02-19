Return-Path: <linux-media+bounces-26414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 193A2A3CAFD
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 22:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E1883A7D6F
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 21:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2907A2566E1;
	Wed, 19 Feb 2025 21:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErG3Mxq6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78765253F04;
	Wed, 19 Feb 2025 21:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999141; cv=none; b=KGaP8vCnbzHjYuFQmfZt1CUZ4hbPq/6HS0++TaQOLLRg0xBfLLHrEKIpqXHHYGu4nEc0nlWSjgBosU8/5aBvYNHRsePt0VN7+byE6unTiJ7M0flUP204cRQkSqEFCR+hW9Icss84cSWMH9kcik3uZgVty7nZn2XmBTIlhzdK6YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999141; c=relaxed/simple;
	bh=GyhV3lcJSOotUArslQ+DPnCWFQF3eyPqRLf5/jkAdJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jeFXPwNbdkWU1Bh44vVowuCXjJNzAAnBOYS6k8wCl31oZRL/5uw2UaPMp7IVeYtnOReSMuM8nLwbEm9kcS1DdmKohz6OyVljnGZQ49p9NbyDSO7v5LT8dTycNMhPr+7hSHjS4TPUJA1x3aiiO+4aHiuSkvmVAlZYn6qJj0+etnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ErG3Mxq6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15279C4CED1;
	Wed, 19 Feb 2025 21:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739999141;
	bh=GyhV3lcJSOotUArslQ+DPnCWFQF3eyPqRLf5/jkAdJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ErG3Mxq616iGCoUz8SrfNnzzTTxqxNXKJjBhfW2Y+qnP1g1utp/sqcAqrrMeVOw+C
	 p8XoON0pwyLN7dkFt70atzLNoDbYtAzpVsa19d7qnCeNxU8lE92rrhBl19/b4YdFXX
	 uqrIbm4x+xRcGYJBmBXcO3yqQ11THTBndYbSp3JthISQuqS9qaH/H5hnKWLriYAlzB
	 sxiyEMfnPeLMSnC7fkrZO23Xs6QGTMkROpFS74Ja4Fs90/v/QfFz6bIGtnzKn9bPD3
	 X5h1GwlH2jpDrLkEGH7BP1oIXrpNi5sIm9UZy/JsJYWeAlRIDabEttNO+bd8MZFMgO
	 z1JM/eKaXON2g==
Date: Wed, 19 Feb 2025 15:05:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Martin Kepplinger <martink@posteo.de>, imx@lists.linux.dev,
	Robert Chiras <robert.chiras@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/12] dt-bindings: firmware: imx: add property
 reset-controller
Message-ID: <173999913941.2953348.10916179903206198002.robh@kernel.org>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-1-324f5105accc@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-1-324f5105accc@nxp.com>


On Mon, 10 Feb 2025 15:59:20 -0500, Frank Li wrote:
> System Controller Firmware(SCU) reset some peripherals, such as CSI. So add
> reset-controller for it.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v2 to v3
> -none
> 
> change from v1 to v2
> - new patch, move reset-controller in top fsl,scu.yaml
> ---
>  Documentation/devicetree/bindings/firmware/fsl,scu.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


