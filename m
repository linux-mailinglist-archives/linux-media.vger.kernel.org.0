Return-Path: <linux-media+bounces-36512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E5AAF0BFB
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 08:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D9EB446DAF
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 06:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC4C225A31;
	Wed,  2 Jul 2025 06:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRvJ7Awg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673EC224AED;
	Wed,  2 Jul 2025 06:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751439131; cv=none; b=WUVXToHYiwPSA/LvxZjDL1BdlT56GR6I9l37k8rvi5txEYAVfO1RWEPPv8O5bUPEtpi+xZZS7FEvwPS5O4KuKLB8yajaHzwMx8LMYNVqgo77DkHx3WuD+fjq0SLWhlSVZm7QeS9XTjAp/qlsvsoBF1JHEDEr0sWZRf++GK3TJUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751439131; c=relaxed/simple;
	bh=ik/1Wr1Ja/jZ66BxBiH1Qx3ZKgeQvNYazUJ5cj0M7SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArNntGalOF1+f8MK9X8CHspNV2bZJeRhgHihF214tl5Z/Ejj+mnUWPMVMhoLw5ajsTrzvuKRYq54dld1vniMdT6hZBBU+6PrzIlmFsAvIAAo9CcYCS4YPMfDow3KlLz/8wxZgR9f8aQtLUqggphh2rF/L7xpKu4Q1QbZ09NJPuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRvJ7Awg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753AEC4CEF3;
	Wed,  2 Jul 2025 06:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751439130;
	bh=ik/1Wr1Ja/jZ66BxBiH1Qx3ZKgeQvNYazUJ5cj0M7SA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XRvJ7AwgKC0epo76Dj/0OXk9f4FTZhaZabOkJFjvADuy0c5Bi9yY74/BhOdBFzOCp
	 CSkpV3BUaAZgBMM8oFoFO4Eg/56kJubnEE6ATDmTn/r/SewRaqg8E+62oSD9XKoQ/6
	 uCq49FDXG1mZnhTiBzYVjVii1ScxfD3dZXGK8Et9vabsDM1WeowAD26TnV6YZSJ6L5
	 524BkMYSoWVLlHZP2ErepjlgR7Xe6FLkvmZzGZJ32VpLZcI0jpMr9Paqcs1CdqdBS9
	 vdpYSlTeR5M36Nx0kuVxoGnHK4bSLm8kA/mooidlf/8EQKP6/4uAVh953IEiUvAp3m
	 /YjySPeZ0AT3w==
Date: Wed, 2 Jul 2025 06:52:07 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mr Chromebox <mrchromebox@gmail.com>
Subject: Re: [PATCH] media: cros-ec-cec: Add Fizz board variants, so driver
 can detect them
Message-ID: <aGTXF-FQoJx3bMYB@google.com>
References: <20250628181530.873795-1-pedro.nariyoshi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628181530.873795-1-pedro.nariyoshi@gmail.com>

On Sat, Jun 28, 2025 at 02:14:35PM -0400, Pedro Nariyoshi wrote:
> I recently reflashed a Chromebox (Wukong variant of the Fizz board) with
> coreboot and I noticed that the cec driver refused to load with a bit of
> tinkering, I realized that the dmi_match_table was expecting the product
> name to be Fizz, but `dmidecode` reports `Wukong` as the product name. I
> am not sure if this is the best approach, but adding this patch lets me
> load the driver and it works properly.
> 
> Alternatively, we could instead match the DMI_PRODUCT_FAMILY, instead of
> DMI_SYS_VENDOR and DMI_PRODUCT_NAME. In my board at least, that says
> "Google_Fizz".

Yes, please extend the table of `struct cec_dmi_match` and support
DMI_PRODUCT_FAMILY match in cros_ec_cec_find_hdmi_dev().

> I am open to suggestions for alternative solutions and I hope I did't
> break any rules (this is my first kernel patch). (And sorry for the
> previous submissions with errors in the subject line)

Thank you for your patch. You could consider to move most of the additional
information after "---" in your patch (so that they won't be part of the
commit message).

