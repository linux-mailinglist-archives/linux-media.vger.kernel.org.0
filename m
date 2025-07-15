Return-Path: <linux-media+bounces-37753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 371FFB054DD
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 10:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 441F816581B
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 08:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940ED275AF2;
	Tue, 15 Jul 2025 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2Sf0Ia2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F702253FE;
	Tue, 15 Jul 2025 08:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752568078; cv=none; b=U25T98MZyiYySzKB9aw+F8mEyJAjL8pU+siRX1G3FBgR91nFpL5EUbwRtt7PoTHILDYZ6UQttQfvz0GmBdUNMXmWiCOWkA2TJBoGeW45AuwZJkQYcPxA6QdhEKlQZYxB7QLl/JALh94uyvLCb8cygxRdv/j/qsiJ3n7g+jFCg+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752568078; c=relaxed/simple;
	bh=QwMb9Ijs4lOjMXbJJpzx0HBGl6inWzxsD74yHFqkYwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBEWqVf8eIWrfOXjJukIV6R2fhxJpMTbQ4i1Q6vJfyd2zFSzvZDR9Z3CTOIEDn4TQOZf+Ld0hd0G3J1QX6HQNHGmhPmoKCrIQIgW4sQO/gkreBGRA4atbO2727JqM5mtU+D5rK/niRN/Ft6xeCIIqLV47sM+9pzkN+pQ70+TzAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2Sf0Ia2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024BDC4CEE3;
	Tue, 15 Jul 2025 08:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752568077;
	bh=QwMb9Ijs4lOjMXbJJpzx0HBGl6inWzxsD74yHFqkYwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2Sf0Ia2hbnlyam8YbsDr3jz6pPwWU39F/FivszZWZ9tD1c+loOLsxiexD1pD2+jS
	 V+wjvc498lQxX1V2WstObKdesy3asAsFIElCmo149cL485iMAxU+VEiLMhatb7Jcv0
	 +NxXazBUNeJNWXIXt0G2WA80d4MFiveKYEluhhgtK0ik+vul6dfW7lH1YmVYSQbVaO
	 4K6EsFuGZoORY8iz+pdIqQeIjQO1UvbXfFotY0swBKnQZQf/yqxeu/NKrE8xgwoOeA
	 25gFmusOjDvQsGgV7qttmAWfbr9qQPnkhDxATLpgE2F8nzgr5Eo2hjOQAtfJ/PmYfv
	 0JfuiQHFL2UpA==
Date: Tue, 15 Jul 2025 10:27:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: i2c: Add Sony IMX355
Message-ID: <20250715-quick-misty-rottweiler-9ae7f7@krzk-bin>
References: <20250714210227.714841-6-mailingradian@gmail.com>
 <20250714210227.714841-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250714210227.714841-7-mailingradian@gmail.com>

On Mon, Jul 14, 2025 at 05:02:29PM -0400, Richard Acayan wrote:
> +  avdd-supply:
> +    description: Analog power supply.
> +
> +  dvdd-supply:
> +    description: Digital power supply.
> +
> +  dovdd-supply:
> +    description: Interface power supply.
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml
> +        unevaluatedProperties: false
> +
> +        required:
> +          - link-frequencies
> +
> +    required:
> +      - endpoint
> +
> +unevaluatedProperties: false

Still wrongly placed. Look at example schema or other bindings, this
goes after required.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks

Still missing supplies. Hardware cannot operate without power. Please
check your datasheet which will describe which supplies are optional.

Best regards,
Krzysztof


