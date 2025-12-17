Return-Path: <linux-media+bounces-48967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D42DCC6900
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 09:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FC673036DAD
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 08:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467B73358A8;
	Wed, 17 Dec 2025 08:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jANs0euw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CF12749FE;
	Wed, 17 Dec 2025 08:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765960039; cv=none; b=o0KvvYsXgRTTIOE5OsiEp4oUD30VPekDEB0Lb4XOtox2r8GvjObfwb2ha12sMnlCmHHkvcw0G2SDHVxB0U78jxdeicIU02+3clsSxIOxN1ZQNsD0zIPTUtL2yERWnfCsGf9aV2GzWdj9srLLf6IJkHzjX296WtKq1hM5E3it7eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765960039; c=relaxed/simple;
	bh=vkyTr1A3ee47MGt3jmyxbLLpMPm/3TRpHZY2VNN3WiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAMf2q8HrUkEuvbCAUilxr1B0yz5rA1MCtrVFeRDWVnSeKgEGGqub+9Xcij7Yl+D0MtXUYU9K3S8wOxzwKfey6yohRC+n6d/Lcx55nf43nnqwIeQBl8KjF4NS5KBL7pFMqibLhxHDe85eJBsQ2drawGS4+D6oQ2ESmgNp/sW8ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jANs0euw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04873C4CEF5;
	Wed, 17 Dec 2025 08:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765960038;
	bh=vkyTr1A3ee47MGt3jmyxbLLpMPm/3TRpHZY2VNN3WiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jANs0euweGCMMhVjNn7VFRmyN5zd6JTImJbg/VlRhhcTj5KgLuueNe/DbIgFmn11v
	 Lz5UCJCqpqW47IHaQLZBy6O/AFl8Bj/aIC/4sBo0mwPgBt8cmVC/J2Vpom2Enn5Dc/
	 iWigHQyZacbWiw85dM9tN0mXCZ4p86E/TYVEJTi5VUNxBH3lqEyRI7HQAocDSOmL51
	 1pL5j4cFVGiey/Xx5OLgsuhreXMbnDgVKwU8QReP2mxmbuAOSIPh2aNinhdpHxH79k
	 B6AGLwHfAGbLZfSBOVH1QD0ilPmVsmSheFoczaQPjgY3GnBo2eWYt5rYYdrbRUKxY8
	 BU/EjUI4y9LgQ==
Date: Wed, 17 Dec 2025 09:27:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alex Tran <alex.t.tran@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: media: i2c: et8ek8: document missing
 crc as optional property
Message-ID: <20251217-fast-ambrosial-angelfish-ee39d2@quoll>
References: <cover.1765782992.git.alex.t.tran@gmail.com>
 <ddb6f986cb54e513ba508fa28fc9d2c8df0e2987.1765782992.git.alex.t.tran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ddb6f986cb54e513ba508fa28fc9d2c8df0e2987.1765782992.git.alex.t.tran@gmail.com>

On Sun, Dec 14, 2025 at 11:58:33PM -0800, Alex Tran wrote:
> Convert the et8ek8 sensor device tree binding from TXT to YAML format.

Commit subject is completely wrong. You are not documenting missing
properties.

> Add the optional crc property to the endpoint node for the et8ek8 sensor.

Why?

> This property enables CRC checksums for the sensor bus and was added to
> match the new driver support for reading it from the device tree.

This does not explain me why.

I asked you first to convert the bindings, not add new properties. If
you add new properties, you must provide justification why binding has
to be changed - see other commits how to do this. Also please read
submitting patches how to split your work into logical chunks.

Best regards,
Krzysztof


