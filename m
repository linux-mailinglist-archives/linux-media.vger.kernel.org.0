Return-Path: <linux-media+bounces-49666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B885CE8FE6
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF4FF300204E
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56F62FFF8D;
	Tue, 30 Dec 2025 08:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KX593vh1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267CF1DED4C;
	Tue, 30 Dec 2025 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767082631; cv=none; b=QRLK/dB1jVoDnRZEibigaQ6N/BPpf+QFnB/lmWb+c45bvW8n0Nti2fN9laBgDykIRibqygOutCOiqxlFWLJtvOWmZJN3EzoFx9BfrZhTpMU5Ves1cr37BHVvyGYmuvSoTyVtJfGK9kPffa9/vHxApEYYmmh7nb19RuDY6XuXdUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767082631; c=relaxed/simple;
	bh=whnHAzmkET8yHodXYIqin7+OK2uZ1QTk9KyJWxaZ+LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xus6scWxYkxjkqQ3Sjh2xef3K5+ArxmqnzbyhA5LsVzhtukIBS9skFHbmsqJdKdBGwpHz9Yc9dYEAFLN/L/O8MMVRmuih9ITQ0GNx3Gqy078Zl+EMxF/nHDP3uQ8haAFJFbj/pGJsCfXfB/bFQaAiIXjbbZWW/eh365+v66/2I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KX593vh1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55183C4CEFB;
	Tue, 30 Dec 2025 08:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767082630;
	bh=whnHAzmkET8yHodXYIqin7+OK2uZ1QTk9KyJWxaZ+LI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KX593vh1elcM2vRfepZ0KP25odd7C8F0mxs++zxuo+tj/iosvspRPUEag0dCiohyR
	 QALrDSe3BJg31D+CoWrNxXkxkkQHSg46KzzYng1QF0DfJ0eikeGrXG8GEcD5UJckDm
	 11sBKi3xekqYU3JaI87FtBhgTPsURR2Up9p6xr1VdGWEeEmLH3Nvl9uqv8iNR3whDp
	 nNQfCvbHH5PownuzDg68VY6v/V1V2TShNRDjIM6S62gF4NgHpsH+pPeRQBxzvfV9OP
	 sk/AHzGfQLD0fh77T+Q0m4dPpeC8g3dqpg3EpLM9/6GhiR9rPMFZMiR2lvUMBrQuCT
	 p++Lvz50Aw6vQ==
Date: Tue, 30 Dec 2025 09:17:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alex Tran <alex.t.tran@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: dt-bindings: i2c: toshiba,et8ek8: Convert
 to DT schema
Message-ID: <20251230-terrier-of-scientific-acceptance-fcbe1f@quoll>
References: <20251225-dt-bindings-et8ek8-omap3isp-v3-0-b027e0db69a5@gmail.com>
 <20251225-dt-bindings-et8ek8-omap3isp-v3-1-b027e0db69a5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251225-dt-bindings-et8ek8-omap3isp-v3-1-b027e0db69a5@gmail.com>

On Thu, Dec 25, 2025 at 01:03:07PM -0800, Alex Tran wrote:
> Convert binding for toshiba,et8ek8 from TXT to YAML format.
> Update MAINTAINERS file accordingly. The binding references
> video-interface-devices.yaml at top level to inherit flash-leds
> property.
> 

You sent this version a bit too fast, before discussion finished.
Nevertheless,

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


