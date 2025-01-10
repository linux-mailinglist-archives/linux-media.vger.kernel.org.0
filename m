Return-Path: <linux-media+bounces-24624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B93DA0969D
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 17:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E46DA188E130
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 16:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A520212B20;
	Fri, 10 Jan 2025 16:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VExMSHCz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14EF20551F;
	Fri, 10 Jan 2025 16:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524946; cv=none; b=jU/zukVgV74P4C5Mg8DLFV8kp5EFbDTwxwP4FgdpzRkVW3PaIbuTrlndb1clOgj4VAiAKFSAE7+S836Erinj3HgwALvfn0RY6F+xIuJQ5AlbquXOHpnIazUxcDZNKCVzmCeZIXcZgR3x88MMF4VelUYFfEb5w4uW9MdviQVj7lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524946; c=relaxed/simple;
	bh=TZdtNZgzKfFSZDkfTfY1nF0VsjVWi6pk4YB+xNa4n7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8eLqccaN4rA/jMo//2O6GGIx9EVn3cRVOnDcO6D2G5PwTN31KrYZ77FX+aFpZ++I3G6+8RaxrxjpKF1U8pU/cQuQBRYuUUlzhMgI9NiXRfZZ0VoS97V+5KtKJFmIuXbE1i7RikHSWX8a3nasEo+qRVNosUl+s/oPjHswdlEr1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VExMSHCz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E656C4CED6;
	Fri, 10 Jan 2025 16:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736524945;
	bh=TZdtNZgzKfFSZDkfTfY1nF0VsjVWi6pk4YB+xNa4n7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VExMSHCzE5s37sT9ikrAm/5ta2nYN0/bR7j1w2UBIcH8o7Jja7RqQy7lMFT8ZGHuo
	 kx+s6Ld7bZ4e5gznnSyGJ4XX4Go7R6NVe8ZNiuNevwFY1XoO7e582AGc14A2iFpin4
	 IF83rQjbjdqikYrZnVKnN+hmi8rOXXmpnnbniABXDxNmmLXpmUlAjhg+iQO+R26g4a
	 m4Iwg/jmNGkYfXyNpbHiHpjsgJUtCKIFArat4bxXA/ZIwTAObS3fu0MzSIJ9R8WEDC
	 2kHHWmzD8g491E7AGPERPLF6J2KV0RLHbt7Jk7lWK1AjnUGiPNqNs5qwRFSBqusdnR
	 uKUHjoB4pmkGw==
Date: Fri, 10 Jan 2025 10:02:24 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/8] dt-bindings: media: clarify stm32 csi & simplify
 example
Message-ID: <173652494400.2948275.17068411464064341962.robh@kernel.org>
References: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
 <20250108-csi_dcmipp_mp25_enhancements-v2-1-05808ce50e41@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-csi_dcmipp_mp25_enhancements-v2-1-05808ce50e41@foss.st.com>


On Wed, 08 Jan 2025 14:16:04 +0100, Alain Volmat wrote:
> Clarify the description of the stm32 CSI by mentioning CSI-2 and D-PHY.
> Remove the bus-type property from the example since this CSI has a D-PHY,
> which is the only bus-type option, making this property redundant.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> ---
> v2: clarify commit message related to bus-type property removal within
>     the example
> ---
>  Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


