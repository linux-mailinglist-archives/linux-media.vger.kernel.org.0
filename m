Return-Path: <linux-media+bounces-42473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BACB5594D
	for <lists+linux-media@lfdr.de>; Sat, 13 Sep 2025 00:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D1795C3206
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 22:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80275257452;
	Fri, 12 Sep 2025 22:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8x0rBaY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1C51E5219;
	Fri, 12 Sep 2025 22:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757716621; cv=none; b=T5MOlj1OCafHyvzPbIqEHMp9BPv5IZ0EG8vRbPA8SLPi0+TwYErrjzqNThy1zuYOV83g6LsMc75XcaQq5Yex1ZXVleNjVo2M0RDVFkIYRjy37BN0VYqZaVR06E7kecaSy6IxXOIDB83CBjzP68/vOboQLgWDgQONBX9JkWMrRRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757716621; c=relaxed/simple;
	bh=pJ5KpGIBpB9B6ZFuj3MMR5YL760MACfDzrupXZC4hjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XY6Fkl+WnexhWUYUGQUHeHhVhq+faHBQevdyC8hPZgYTaLKmxZqfqiXoStd6MvwaSVAmOnK43vjxR3P+RG93qT89FAkg0ADLJYtN6WJMG2QEBfNdIwwNe4/fi57SELclleA4j04GcNCkAgn9qC6tBitFZQsjavyEAcBnS0J2tLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8x0rBaY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3F1C4CEF1;
	Fri, 12 Sep 2025 22:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757716621;
	bh=pJ5KpGIBpB9B6ZFuj3MMR5YL760MACfDzrupXZC4hjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J8x0rBaYo5g0f6x2e5ssTTLrOAD+IMebgENm6GuU2bzcA+Dpmz/T0Hr89qMG3h9Ib
	 6CKLy7/4i3kDFyAKKvJSZHDz1xgupSQfzFDZAt9ZM7O5Fny96UAVXXl7ZTZQPyffdU
	 nwUjCKSWDUTwkOC3XdeIOYkffc3hFkQGlt4szliJYbn+Jo90DTDFX+rVcvWdyk/0u8
	 Lb4INoiK2wIkSDBcmmTTkwhCZxNg7E46QwhtcU2Y6Epjlvtqz5OEBeobs2umOViOTv
	 00GJGkuzFSSwV+aXu/7F/Zyz49mO6NWfBEH8NKLNh7Hajf/9WODeK2lRD59YJEGY94
	 QeDMT6O+90ATA==
Date: Fri, 12 Sep 2025 17:36:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicholas Roth <nicholas@rothemail.net>,
	linux-kernel@vger.kernel.org,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] media: dt-bindings: move ovti,ov2659.txt into
 ovti,ov8858.yaml
Message-ID: <175771660336.1541058.3844279363364805613.robh@kernel.org>
References: <20250912183003.1115957-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912183003.1115957-1-Frank.Li@nxp.com>


On Fri, 12 Sep 2025 14:30:02 -0400, Frank Li wrote:
> The properties in ovti,ov2659.txt are the same as ovti,ov8858. So move it
> to this yaml file.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/media/i2c/ovti,ov2659.txt        | 47 -------------------
>  .../bindings/media/i2c/ovti,ov8858.yaml       |  4 +-
>  2 files changed, 3 insertions(+), 48 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


