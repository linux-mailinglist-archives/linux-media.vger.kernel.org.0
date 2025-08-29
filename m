Return-Path: <linux-media+bounces-41321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B10B3B6D0
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 11:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF3057C44E8
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 09:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1F62EF66E;
	Fri, 29 Aug 2025 09:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkleR4Pw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F21221F0A;
	Fri, 29 Aug 2025 09:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756458930; cv=none; b=RIu2oCv2NgCng4e1ghIH13QqrEIIM07NGjNo7IxnOerhjvqOM0NlQEXlKsIwCk9Ut3tK+d2rmj8c7L376xlzWJEuTQKFKlv4tVNhtVHODOxDv9gk/Ea1pvH/0aO81Dl6LEPkE9cRSXs/mwAEL3QR2KSclAvKLChcz5U7WESMRK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756458930; c=relaxed/simple;
	bh=mKuFDSDETL+hfJzH3p6W6bJR3lZ2usyMBcUI2MQfD0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SfJZWhhZuU0KjlQ9/62SVBurKSSHJsv5yxeo+0m5vlRh7duJaGEvbVFpUf7wSwbs36cFQK+M6EfuKveYntJLHKmIWiNBcCJs5RiNRhC1b40eKjPIFaaHDdWasL4NUhmrI+xtAiPUKDbttHuPW4h2fhPG+I3dtLfQS1HM1ww90Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkleR4Pw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3449C4CEF0;
	Fri, 29 Aug 2025 09:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756458929;
	bh=mKuFDSDETL+hfJzH3p6W6bJR3lZ2usyMBcUI2MQfD0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XkleR4PwcId3e1KVX9gTLGkf4bEOffiiOxv5MVjXEQ4op2U/L5xkcNFucYEagTZbs
	 MCidUiAUBS216V4Y92/iG/QOs8XmvOzLH0L8lbXGreYG2VHvHax0Z8lyCpIfJGKzUW
	 nZDLdVv7Sd961pSpwCDyUN149k+jJV2UwydYIa4FinGldGMvkR6TVcBmFQAaIZ39T4
	 Qq8NjjLsBfSsQTAKg7IaA7ip+3azGFnLAzbOtUFPBmEQZ7sFTXndF/FN7kllODitMD
	 /xF8dKRdp/1eIw6bF4eKDR4MGX0PS6CmcM8chJafXhNtOoeJfWUD1e6H+PExdfVQy7
	 ixReF8RFo0SRg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1urvCY-000000005hQ-3IbB;
	Fri, 29 Aug 2025 11:15:19 +0200
Date: Fri, 29 Aug 2025 11:15:18 +0200
From: Johan Hovold <johan@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: camss NULL-deref on power on with 6.12-rc2
Message-ID: <aLFvpj2co-jFW_GE@hovoldconsulting.com>
References: <Zwjw6XfVWcufMlqM@hovoldconsulting.com>
 <6aa2b8bc-caa5-44ea-8fd9-18c138a942d3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6aa2b8bc-caa5-44ea-8fd9-18c138a942d3@linaro.org>

Hi Vladimir,

On Sun, Aug 24, 2025 at 11:42:26PM +0300, Vladimir Zapolskiy wrote:

> On 10/11/24 12:33, Johan Hovold wrote:

> > This morning I hit the below NULL-deref in camss when booting a 6.12-rc2
> > kernel on the Lenovo ThinkPad X13s.
> > 
> > I booted the same kernel another 50 times without hitting it again it so
> > it may not be a regression, but simply an older, hard to hit bug.
> > 
> > Hopefully you can figure out what went wrong from just staring at the
> > oops and code.

> > [    5.657860] ov5675 24-0010: failed to get HW configuration: -517
> > [    5.676183] vreg_l6q: Bringing 2800000uV into 1800000-1800000uV
> > 
> > [    6.517689] qcom-camss ac5a000.camss: Adding to iommu group 22
> > 
> > [    6.589201] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000030

> > [    6.594868] CPU: 0 UID: 0 PID: 557 Comm: v4l_id Not tainted 6.12.0-rc2 #165
> > [    6.594871] Hardware name: LENOVO 21BYZ9SRUS/21BYZ9SRUS, BIOS N3HET87W (1.59 ) 12/05/2023

> > [    6.594915] Call trace:
> > [    6.594915]  camss_find_sensor+0x20/0x74 [qcom_camss]
> > [    6.594920]  camss_get_pixel_clock+0x18/0x60 [qcom_camss]
> > [    6.594924]  vfe_get+0xb8/0x504 [qcom_camss]
> > [    6.594931]  vfe_set_power+0x30/0x58 [qcom_camss]
> > [    6.594936]  pipeline_pm_power_one+0x13c/0x150 [videodev]
> > [    6.594951]  pipeline_pm_power.part.0+0x58/0xf4 [videodev]
> > [    6.594960]  v4l2_pipeline_pm_use+0x58/0x94 [videodev]
> > [    6.594969]  v4l2_pipeline_pm_get+0x14/0x20 [videodev]
> > [    6.594978]  video_open+0x78/0xf4 [qcom_camss]
> > [    6.594982]  v4l2_open+0x80/0x120 [videodev]
> 
> As you remember the problem has been discussed in the past [1], for
> your information the issue has been indirectly fixed in v6.17-rc1 by
> getting rid of v4l2_pipeline_pm_get() from .open, see commit
> 164202f68203 ("media: qcom: camss: Power pipeline only when streaming").
> 
> Still the old race is left unresolved, and it could lead to a NULL
> pointer dereference, but practically it would be close to impossible to
> reproduce it, since one more step of starting a video stream is needed.

Thanks for the update. Would still be good to fix the underlying issue
properly, especially since I don't think we know exactly how big that
race window is, and also to prevent further hard-to-track down issues
from being introduced later.

Johan

> [1] https://lore.kernel.org/all/aE_hlGHkRZqFFacR@hovoldconsulting.com/

