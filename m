Return-Path: <linux-media+bounces-28041-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7577A5C82F
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 16:41:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 048223B5F9D
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 15:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2848925EF99;
	Tue, 11 Mar 2025 15:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqAW1/kJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7889E3C0B;
	Tue, 11 Mar 2025 15:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741707310; cv=none; b=L81Cd0qYg6DHjPDv6rU6FRm0crkghkkJqMBjWlNb/4tlowxYGHGq5L2K/okIrUjj/yqqtvLKM0F20b4LNRRaJ1yFISRiYAX4Wwlgxg+5bjT2wVgFhyBgTbwECPum8vBduG1QkgRbdvf7RxVUmdAegoCdrAUNevng9ndQ9bGpUA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741707310; c=relaxed/simple;
	bh=+JEq4Ffxe65Jc9kd62uRuMvEGTp/dGw9uOWuo1CXAXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXAqDd5Hurw7fi1Zz0OTA+S+mxtmDSRuEnS3O5CtH9YJs1K9F4d82stbVqH6GtFWPmdmMn9SdeaCSvJwRmyfSpAFuvgcJDx5IaTpIlpLANRwcm0ger1x/LR+S3jUoxEuH+hhrn3px3F65F2t3S+Ko5meMwzA5IDv86g7wwoRMyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqAW1/kJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688E6C4CEE9;
	Tue, 11 Mar 2025 15:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741707310;
	bh=+JEq4Ffxe65Jc9kd62uRuMvEGTp/dGw9uOWuo1CXAXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SqAW1/kJZYuC/ggczRa9QnYSNRbpMvZxzMz8DeMSC94cg/x+1xk1lF5HoMyKJL7g2
	 FOYAcYuStD5DyOQSEdJCwKgRAbRpp7f5yP9JKkT4O7DroZn2DgxEb3XSnRFzZI4e7T
	 WBkWGLeLZGPnVoYO02egrc6w7ur9hqggKOIHXK2vF9do+iwGKZjuuR2iXhv6iQTfzr
	 U+HyQaZ/GqBJk9Eldl80SVPBFDGVSfGjVGUdqMfr9SUWIDlYCcKdkLa2Qw5lPOgPJy
	 jP9wFSTI2zaDfPLU/qf8l3USIploIwu7E5Jd3an4UfeEaxIBo7Z5ZFWVF5j5aGFGyt
	 Uffs1pl/uwXXA==
Date: Tue, 11 Mar 2025 17:35:05 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: media: qcom,sm8550-iris: update power
 domain name
Message-ID: <zssjkvxxv7kionartp6f3y2qh3d4i6gwnhwsrklsfad3t4fy3q@jkehbkx6wcyk>
References: <20250311-dtbinding-v1-0-5c807d33f7ae@quicinc.com>
 <20250311-dtbinding-v1-1-5c807d33f7ae@quicinc.com>
 <7yjj2eemvvvnsgv67d7tueid4h3n3onuou6ammx36am4qhfsal@xam3iamk4er3>
 <c0430086-675d-b58c-4ef9-1bd9ee51d3db@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0430086-675d-b58c-4ef9-1bd9ee51d3db@quicinc.com>

On Tue, Mar 11, 2025 at 08:41:01PM +0530, Vikash Garodia wrote:
> 
> On 3/11/2025 8:37 PM, Dmitry Baryshkov wrote:
> > On Tue, Mar 11, 2025 at 05:33:53PM +0530, Vikash Garodia wrote:
> >> Not all platforms has a collapsible mx, so use the more generic naming
> >> of mx in the binding.
> > 
> > I guess, it wasn't even tested...
> Not sure what made you guess so, let me check why my binding checker did not
> catch the bot reported warning.

Obvious: you are changing the bindings in a non-backwards compatible
way, but you are not changing the example in the same file (and
obviously you are not changing the DTs), which means that this wasn't
tested.

Hint: you can use enum [mx, mxc] instead of const. That would make it
backwards compatible.

> Regards,
> Vikash
> > 
> >>
> >> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> >> ---
> >>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> >> index e424ea84c211f473a799481fd5463a16580187ed..440a0d7cdfe19a1ccedefc207d96b26eed5d6630 100644
> >> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> >> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> >> @@ -28,7 +28,7 @@ properties:
> >>      items:
> >>        - const: venus
> >>        - const: vcodec0
> >> -      - const: mxc
> >> +      - const: mx
> >>        - const: mmcx
> >>  
> >>    clocks:
> >>
> >> -- 
> >> 2.34.1
> >>
> > 

-- 
With best wishes
Dmitry

