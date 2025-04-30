Return-Path: <linux-media+bounces-31456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F420FAA4B54
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 14:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CDE91BC6A44
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 12:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EEA41B5EB5;
	Wed, 30 Apr 2025 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCFtQ4tn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C067F25A645;
	Wed, 30 Apr 2025 12:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746016483; cv=none; b=mzeD0o/5ZKdU/2kB+CTuv4DdZ3YV5NfnKRIp/GPLlVEmF1WpFEzv4CpRM2SiWZAuT6rDrYAtUr7F5sytibuPvzuirbp1pYgWSC7jpgm1xE1DF0m7haznVcgfAVkt1oEqshxoWzP9xutd3rtESCFEV36HVE3xqNXWA3wY4VwURE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746016483; c=relaxed/simple;
	bh=2Y6iaA6xQYMGjjrL5kbDu0B9SMb2jzg27qVw96TWwP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L19sQiqYx+6Cknf2QmKmtznq0EKPaFj9jRh0UHyPH1C2eJXacPWhFZ8jyyFd/fadjDlWQ9w4suFdr1FKTXdIA9fChDnzgk9tjz9ksavsbjk/oZjrdMn32KoxZgH9PExqFTlMiA90tcO6nsfmTXW/I11il3wE7npWyRT0X50xFzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCFtQ4tn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9E2C4CEE9;
	Wed, 30 Apr 2025 12:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746016483;
	bh=2Y6iaA6xQYMGjjrL5kbDu0B9SMb2jzg27qVw96TWwP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dCFtQ4tnlkr42GfRkcBc9pZjltQxj2hKhv80O5Y2JVVPrwHzM9m6C7AZjHxjLMZjr
	 OsMM0Vc405ze/4e7iCqVyS7bS1U1REIlVsjHldr4KaL+1h+9PFNz0+DBUYr8dF0/8h
	 cKdXOo2iocZ0dp/BqcYnLLkQBVO5cxTtA3r0lMZOpy0uZ/n3T1ExZkeTxdFOOHIsfz
	 zB/EkJMHsQWlcSGC/nGwestPZiAY2vy3DXUvNOXeJOv2cCoh4HN3aP4EmwG+Yorxt+
	 2fpwb/lQpClcvHIZgkEqyViUC02viWhnqMCU6La5eLJta21jn0QmAloU+jl/+uZnqa
	 hxH0VSR6bJa8Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uA6eE-000000005a7-33p2;
	Wed, 30 Apr 2025 14:34:46 +0200
Date: Wed, 30 Apr 2025 14:34:46 +0200
From: Johan Hovold <johan@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
Message-ID: <aBIY5mkYbBvrBKEQ@hovoldconsulting.com>
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
 <c2ba9738-a383-4a53-a7ad-fc65a97d1c4a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2ba9738-a383-4a53-a7ad-fc65a97d1c4a@linaro.org>

On Wed, Apr 30, 2025 at 09:24:12AM +0100, Bryan O'Donoghue wrote:
> On 30/04/2025 08:25, Johan Hovold wrote:
> > Unfortunately, it seems Bryan missed that this was a regression that
> > should be fixed in 6.15 and only included them in a pull request for 6.16:
> > 
> > 	https://lore.kernel.org/all/20250410233039.77093-1-bod@kernel.org/
> > 
> > Bryan, has your PR been merged? Can you try to get my fixes into 6.15
> > since this is a regression in 6.15-rc1?
> 
> Let me see.. there's a -fixes branch, I think I should be able to PR 
> anything with a Fixes: tag there.

I see now that you added CC stable tags to my commits so the fixes
should trickle back to 6.15 eventually, but for issues introduced in
-rc1 you should try to get them fixed in the same development cycle.

Johan

