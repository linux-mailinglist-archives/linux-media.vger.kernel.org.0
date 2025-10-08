Return-Path: <linux-media+bounces-44017-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2BDBC6868
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 22:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97D8119E075D
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 20:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7140C2777FC;
	Wed,  8 Oct 2025 20:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FT41jq1z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C050E1BD9F0;
	Wed,  8 Oct 2025 20:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759953727; cv=none; b=rNl1GIwr2WsILeQBsUwNtC6gBPwg0tKCKRO/ilPV9kUkAgTsc0vufSoU0oK0AfkVCVMR+bDG9SYSBIUQweQK/VUz2nluUf6NY67TciwiIiRzBVdVRn5IAVD1wMd4g/x8sL2Y4OgruFEc5lUu0zBb4pHBTRp/JBWL7ODMhZ/tKtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759953727; c=relaxed/simple;
	bh=aMbDvrx3EREgO2K7HCCjZxn4n3WSKas/BkWCB4L4fSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMZ9JZFKGZc86ZcBrhvaIkUXXsvfyyfsJDILbhwEgX85kfOpRwjoL5VUQxW7/vAHPzty9s5cG1WBqkW96aivFjNQWzD35bPxekfQcPNDqLx//5SFrEvo6CYdAARQfXWy3uIf1dmdhXq2WUHyeVy/LZG+TH+Pw9OJa29Z2xGsluw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FT41jq1z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0053C4CEE7;
	Wed,  8 Oct 2025 20:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759953724;
	bh=aMbDvrx3EREgO2K7HCCjZxn4n3WSKas/BkWCB4L4fSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FT41jq1zHZLp+dueNEQbkMGsxGpcsLjQ64GAnGxbJ/FVi7rwwkFqkSDBU10f/7A6d
	 jnxHrP2utbnQBNp6CWARabDqvXz0gbCr7xJF0Nm1ToPcOufADeYFpPUX3H2eOXnd8b
	 BFsEP5tIKPsxkbA450oWZmBok4HqwnRt+6KlhMzfTgALiqs3S8U1bdgw0rei2u0+gE
	 6crX7ezVugv2GtGlP9EW/orj2iXVIWJMtP8foEDDwsbiviXnx38sC4Chxu9ie1ZM4s
	 TnUiAsDT95MlgoOsSvgAahu5+Gv4ByxrY3ik9UzaBi3aUF1tbziahkafLvg+bwvzH8
	 A4vLXcq7EcRfw==
Date: Wed, 8 Oct 2025 15:02:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: media: i2c: dw9719: Document DW9800K
Message-ID: <175995372201.65103.9928285143941345417.robh@kernel.org>
References: <20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com>
 <20251002-dw9800-driver-v1-1-c305328e44f0@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002-dw9800-driver-v1-1-c305328e44f0@fairphone.com>


On Thu, 02 Oct 2025 12:15:33 +0200, Griffin Kroah-Hartman wrote:
> Document the Dongwoon Anatech DW9800K.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


