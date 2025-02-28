Return-Path: <linux-media+bounces-27188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E08AA49234
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 08:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A83B516C5A9
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 07:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81691C760D;
	Fri, 28 Feb 2025 07:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJwz3EKn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A5F18CC15;
	Fri, 28 Feb 2025 07:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740727880; cv=none; b=RM7BJ0gQvcgFcUrXmasrkIav40b0WBhSnFTTi58+nknG58QLfpeaCVxXilEbtw0e2fse8j6MHLe1o8WtfJBMDFP5tq5dP7T93XdjQRA29jvzuWQ2Z9uReWCJzOEUMaXbUtULWjG+dSpGpSbEBw3+plpKlaCMAAxzRlAZIuO4Phk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740727880; c=relaxed/simple;
	bh=IE/jyPeNXfYEP6SZ3Uak/xj0jpIdaytm2AGhFaxvJmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feT8OERATzhmyXqk7f3ewLSvYuxcEpiv+BZLrtWKlZ7nGbHYaFoFKmzJIBGGg2LfALAdRWbDGGVLcHIr3UOSCv8ChpYCWCrf/oOerQcvKfPTNyB/dKWs8+vdiF0SOZxATYroeGrOOE2Zyk5XFXtD4VsuL7mLlhsCsYLruoityfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJwz3EKn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AB2C4CEE7;
	Fri, 28 Feb 2025 07:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740727879;
	bh=IE/jyPeNXfYEP6SZ3Uak/xj0jpIdaytm2AGhFaxvJmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cJwz3EKnUXV0q1C0iMSMxRUNxCyuDDm/dIHEt3wvtRKaI7tLJzY/wrZ9/H/aTlZEN
	 tPOyEdUam6ep8mgE7vM/LSCYt1wnl3xB1Ye4kwkmtwd1D/4fml9utmcMqIAh3XHN4V
	 zT2zh7uHEMTmjbnTgVhF2CQynJKcqsfBEdW9cw9geXzBTqa9HSVPkOWtmuJTXLpqgH
	 yTPeki312N/zZl2/9/1bITLFMCD81r1GH2p9kFIaXOHBB7hYGxRl4vicGrBcQDVdvI
	 oRY00Et2xBrDy3plECALasLJ9dPYlzcBoQ7zlc0ckyo7vFm0ncNcnmVPyXQN50okE3
	 LAArHGEC2uT/w==
Date: Fri, 28 Feb 2025 08:31:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Keke Li <keke.li@amlogic.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v6 01/10] dt-bindings: media: Add
 amlogic,c3-mipi-csi2.yaml
Message-ID: <20250228-dodo-of-premium-refinement-1065bb@krzk-bin>
References: <20250227-c3isp-v6-0-f72e19084d0d@amlogic.com>
 <20250227-c3isp-v6-1-f72e19084d0d@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250227-c3isp-v6-1-f72e19084d0d@amlogic.com>

On Thu, Feb 27, 2025 at 03:27:12PM +0800, Keke Li wrote:
> c3-mipi-csi2 is used to receive mipi data from image sensor.
> 
> Signed-off-by: Keke Li <keke.li@amlogic.com>
> ---
>  .../bindings/media/amlogic,c3-mipi-csi2.yaml       | 127 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 133 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


