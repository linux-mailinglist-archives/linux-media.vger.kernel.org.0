Return-Path: <linux-media+bounces-49052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EEACCAA87
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 08:31:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4E4E30164D0
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 07:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09ABB2DD608;
	Thu, 18 Dec 2025 07:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wiv8/wkU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE181C5D57;
	Thu, 18 Dec 2025 07:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766043089; cv=none; b=oFRW+ahEJILDJMskChHvwkjLnlAlQiMFfhkNHROeIkW91/OMpRCM0730FywLasFevX+CJGfcTGAGOoIIdAEIhd06ST4e2PFuBU3sE8bqMuIJxflbZg/X24EqIJ02lTzAyw+N/UgYrSqGZzVJHkwF0xGxWPv8J53hQpCzw3IGaW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766043089; c=relaxed/simple;
	bh=0LhaKHWuew0xHh5Oyx7vWGsc2BlaUEq9FHDWgh6l1No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxr1NEFj/jSyp6w76mbDnsOPI5f0G4LaWSOwTGkJCVHYyj96jqMIh0bExl76MPUwWc+yj8MUUi9UqsBUGbH+lew3cka7JQMxrs6hHAc/M7jZgRvlU3237dslMgmwCNyVGRbuXp2dJz/f2w641nsFHL8fYnhzPe13cZHlImZ/1EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wiv8/wkU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC13C4CEFB;
	Thu, 18 Dec 2025 07:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766043088;
	bh=0LhaKHWuew0xHh5Oyx7vWGsc2BlaUEq9FHDWgh6l1No=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wiv8/wkUcN2Z0DJo1SGjSicXLqaE3jFa206Ih5mri6KllCr6kfpJT/QNOkWMDJHXm
	 zqGwhWAdb/yfWQTIDfrEYhli4aN7u5HyOyfJ8G2XFdN1/V4ilrmZsycwVoqbNU76eN
	 l6+RR/fHL3OIV0op0plfjbIiWD99Yb/a7hYx2KWWVkCi7mOiz8SSEAK7cWwwwGJ7xD
	 Y/sSNjw8zsKZK/ZuZb9j54dIJdic/nkzDyJZg9ffMIsHcGN+ShLcPSL0L3I/pMzlUD
	 0F8bG/u74CMWtZ4S6KX7glq0X0C7JXRAF79ZP7IiNf3i6VHvXt7dtWdDl4zImzR+ol
	 0sCoG/wvZimNQ==
Date: Thu, 18 Dec 2025 08:31:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: robh@kernel.org, krzk+dt@kernel.org, sakari.ailus@linux.intel.com, 
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dongcheng Yan <dongcheng.yan@intel.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: media: i2c: Add os05b10 sensor
Message-ID: <20251218-adorable-poetic-chamois-c5ed5a@quoll>
References: <20251216065956.13604-1-himanshu.bhavani@siliconsignals.io>
 <20251216065956.13604-2-himanshu.bhavani@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251216065956.13604-2-himanshu.bhavani@siliconsignals.io>

On Tue, Dec 16, 2025 at 12:29:49PM +0530, Himanshu Bhavani wrote:
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - avdd-supply
> +  - dovdd-supply
> +  - dvdd-supply
> +  - port

Your driver clearly says reset gpio is not optional. Did you test the
code without reset-gpios?

You already got exactly the same comment on other patchset.


Best regards,
Krzysztof


