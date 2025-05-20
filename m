Return-Path: <linux-media+bounces-32869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 174DCABD0F6
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 09:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 009F81BA1684
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 07:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7F325DB1C;
	Tue, 20 May 2025 07:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BthV8s+Y"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D771DF75A;
	Tue, 20 May 2025 07:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727611; cv=none; b=rq2oumZrKTMXYj1ErN7Nw6MBBVQivYDFOdMgwmcNb6qQbDuB947EU/gbMbVQI4ZjCjm2Ve09Qhs8rdAwt5mbqeXTvZa7KAQR7Xfn3Z0cgPrexQsPfq0DV/ZtSzuXB0wNH5eX0Esdhy56u8LTE6xPPv2CRr/No2o+qQfb1BXZEj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727611; c=relaxed/simple;
	bh=z/flIhiHT0EACRRARD3MJxsYqW8m3KotF9hjzfYli+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7A9l2y7Vb5N4rUPGxKr8ND0Thf0eLUHB4Mez//t3hD/60nfFo/7uxLS8xZW3uHUEQLhc4Wi+zazXcd9BH8PqCIjWQ5Tlqbel6Y7fMM4rBLRPRu/wubLlkjdmwzgQLgJUYmpw8HUqqp2TrO4NVH/O1vKaCRcPgit/QPgsoe76ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BthV8s+Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D4CC4CEE9;
	Tue, 20 May 2025 07:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747727610;
	bh=z/flIhiHT0EACRRARD3MJxsYqW8m3KotF9hjzfYli+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BthV8s+YdLo93Ax6yV+XmUP5g/GHHpa+6gHJvk3cnN2msEYoxgAcLU8lTiLmE140W
	 BJwu0N4jM3+ZIjPzAp8+aLWv8YGqty7dm4D+QIplvtMZ7C15avA4jsEMzd6JUjUkVl
	 buECs55ensQb1/ilwradK7zULs52y0mLvPD3CVAwiIjpQrH8g24IhuSazLKOX4Gm64
	 7/npINvZVL9vyfeYFl3kQ78tkIf/4IteFg+nACB5k/tRw9QQwskEOVdFGHAVXXBRBZ
	 RTzCJ26StTlm5Ue0qLOWqkk/sG5RDwdSWPONmk1qNe2Yq93rRR7Dk9PTiCPMbMfh+r
	 YMP/ueDXseP1Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uHHmv-000000001Ir-2WG8;
	Tue, 20 May 2025 09:53:26 +0200
Date: Tue, 20 May 2025 09:53:25 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
Message-ID: <aCw09Vci12txhYj-@hovoldconsulting.com>
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
 <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
 <4d942a6c-cbff-41ac-af8b-12a1ff5181aa@linaro.org>
 <883eb54a-fcaf-443c-a4d7-e1278fd43f5a@linaro.org>
 <ea9f570c-b135-4a98-91ea-ceeb2f48a0e5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea9f570c-b135-4a98-91ea-ceeb2f48a0e5@linaro.org>

On Tue, May 20, 2025 at 08:06:22AM +0200, Krzysztof Kozlowski wrote:
> On 30/04/2025 10:33, Krzysztof Kozlowski wrote:
> > On 30/04/2025 10:30, Bryan O'Donoghue wrote:
> >> On 30/04/2025 09:19, Krzysztof Kozlowski wrote:
> >>> If anyone wants to know it and cannot deduce from compatible, then add
> >>> debugfs interface.
> >>
> >> dev_dbg(); isn't too offensive really IMO but if it really bothers you 
> >> switching to debugfs would be fine.
> > 
> > Yes, please. Dmesg should be only contain issues or some useful
> > debugging data. Probe success is not useful. It duplicates sysfs and
> > tracing. Version of hardware - well, I am sure it duplicates the compatible.
> 
> To recall: kernel coding style is also clear here:
> "When drivers are working properly they are quiet,"

That's clear and well known (or should be).

> and kernel debugging guide as well:
> "In almost all cases the debug statements shouldn't be upstreamed, as a
> working driver is supposed to be silent."

But this is a very recent addition and questionable when read in
isolation since debug statements are not printed by default. The
preceding sentences do qualify this:

	Permanent debug statements have to be useful for a developer to
	troubleshoot driver misbehavior. Judging that is a bit more of
	an art than a science...

> So I really do not get why this driver deserved exception. Nevertheless
> I think we agreed that these logs can go away, thus I just sent a v2
> with a bit extended commit msg.

Spamming the logs as the driver currently does is clearly broken and
should be fixed. Keeping a hw version dev_dbg() is generally perfectly
fine, though.

Johan

