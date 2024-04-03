Return-Path: <linux-media+bounces-8580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF158978DA
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 21:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 043E31C21329
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 19:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61561552F0;
	Wed,  3 Apr 2024 19:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b="jRRmQBjg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-108-mta230.mxroute.com (mail-108-mta230.mxroute.com [136.175.108.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F430154C05
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 19:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.175.108.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712171671; cv=none; b=ETRnZk9gJ1SrVmTbWIjWR9u9KU4IJ323W9yEWEsOCG8mLbIsd4ul2G6Xcwq+hzyQLRnMgWcTlrqPz42NTnADnlLIQDFCnwOGdNnd3ZUrmm5Ibmig2RlY1dR/jgR74fcrkYiW7RGTsvCl5u5+bX0k5H+A8WAeaKffi6jQpVGXPxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712171671; c=relaxed/simple;
	bh=RDV4EuuQRUPtNUbTIxOGfcSTsN69sOlT5Pee3DKH33Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IISdJr0ymiF4h8UbN4lbUypGHFqKKYGFK6FMHsBs3n963ELcwO5UuBI77coYyh1l+zHueLi65Fk6iP9DVmDhLC7cOTLDy7uu7UXYw0sVRgJarkxRgtxnOAGWnGGNXuWecb7T0/4t2/zsvHWmDGBW/79NKbe0IUvPR6PevQZEOv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com; spf=pass smtp.mailfrom=luigi311.com; dkim=pass (2048-bit key) header.d=luigi311.com header.i=@luigi311.com header.b=jRRmQBjg; arc=none smtp.client-ip=136.175.108.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=luigi311.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luigi311.com
Received: from filter006.mxroute.com ([136.175.111.2] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta230.mxroute.com (ZoneMTA) with ESMTPSA id 18ea5624ef20003bea.011
 for <linux-media@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 03 Apr 2024 19:14:27 +0000
X-Zone-Loop: 467d93e2798742ab9f8d9c23b1daf390f9781890c34f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=luigi311.com; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bcqiAtaFkA7M0l8Y8o9d5VCPmPSHyZdW1imoC/gPicM=; b=jRRmQBjgjtpwnlrh5H5qrXJe8t
	hrPJtR9gFIy70lgEKNWi5+eFqFpbsHqvw2m9iAJ7ECTSkJrmro8OHQZp338ZMCT73WJ9xQQZbngS2
	Yh3ucRZaXJA04IogxgEfRNViHpyQhsWNG6mY8KJYHl4IeAXKcPZmvwdV6lIo4c53G0OhEe2DnVkI4
	XxyKRDLBiSpyLwHvsVoVqZALVBrZ8LUw25GfjtS1qgWKuWK9419V3v9TIBwqKjG2Lnye3/nI9MVjr
	a+BrrPgqSjdz9wdjEsBtM36YLmsp930WHM0KNA7W8QTtIJBi8Q046itKyt67DTxX+G2ExEPPJJwM1
	xORPiUDg==;
Message-ID: <d31baabf-ca4c-4ed4-87af-c68d7a3aefed@luigi311.com>
Date: Wed, 3 Apr 2024 13:14:22 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/25] media: i2c: imx258: Follow normal V4L2
 behaviours for clipping exposure
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, dave.stevenson@raspberrypi.com,
 jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 sakari.ailus@linux.intel.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20240403150355.189229-1-git@luigi311.com>
 <20240403150355.189229-11-git@luigi311.com> <Zg2j1XeOhFwO2Nf2@duo.ucw.cz>
Content-Language: en-US
From: Luigi311 <git@luigi311.com>
In-Reply-To: <Zg2j1XeOhFwO2Nf2@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: git@luigi311.com

On 4/3/24 12:45, Pavel Machek wrote:
> On Wed 2024-04-03 09:03:39, git@luigi311.com wrote:
>> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>
>> V4L2 sensor drivers are expected are expected to clip the supported
> 
> Remove one copy of "are expected".
> 
> Best regards,
> 								Pavel
> 

Done

