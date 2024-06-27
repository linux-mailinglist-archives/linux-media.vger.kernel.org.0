Return-Path: <linux-media+bounces-14283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A28D91B1F3
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 00:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CF7D1F2419A
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 22:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BA21A0B06;
	Thu, 27 Jun 2024 22:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="phLdBV16"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D248D19EEA9;
	Thu, 27 Jun 2024 22:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719525927; cv=none; b=tHhd6lSpnkFVIkhSTcS4+/Axc0mJbJFm2fCg5I+GjTugV50DeGldPMrZPntPVxPzoQk8xjfmQivXiIV2TdLvVtZY8CNoF2UsJQmqjYY+/UeuYZTTuaj1j7si3J6h+Ro9zvfOkb8r8wd6LFUZtnhcH43PlBUOW2niP1VZ94fS34g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719525927; c=relaxed/simple;
	bh=LDpd5S69xlShHkQj5exdz2U4jvxp6FdmFZSFBGSXxAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dktiFld2CqqxqcU+glklsW1FBiyGGWHbSlcDgTKYdnxgptV/7k/XSSioi6k36AzmMBf4QK9peaMLXINz0cz8HojpqhAJbj9RQWLpreJvmIOF7WMaTYzWJ7enOSHx5gcoDtZ8vfKkT45wLVd8LH2GTGZo/ivbkW9hvDNGRmdNWng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=phLdBV16; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C44C2BBFC;
	Thu, 27 Jun 2024 22:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719525927;
	bh=LDpd5S69xlShHkQj5exdz2U4jvxp6FdmFZSFBGSXxAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=phLdBV16525NK9BN8uCD/GZmc6veiKp0OEgY6P2Ylg9fNTwQW0CL6qLqEk8Q6QfB8
	 xcAswOD2z98fo2ki+lSsJpWRJgwKgthrWcSUptTljpE/ldZZ9j6QjSN8fHkq8FChaZ
	 i8i0C7vQMDJX8tperzuctqrtXJgbYyoxnwpB0FxxwAfeZHJYgOoiqfq8nnYj52dy0D
	 uVU/BSC2nAc88SBvWf2xKd37CZ6WDcT3QIPv2GOrqdLxPKqwhM5lv/NhXCwmbJDDEX
	 f63RThtgZada0oJEjFxnPUI5+pv8UIxAO+5z0zf8nf4ERmct8phSxFmSi7X9asfFEW
	 78hMlzwVabOMA==
Date: Thu, 27 Jun 2024 16:05:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nils Rothaug <nils.rothaug@gmx.de>
Cc: sean@mess.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	hverkuil@xs4all.nl, mchehab@kernel.org
Subject: Re: [PATCH v2 3/5] media: dt-bindings: rc: add rc-mygica-utv3
Message-ID: <171952592367.644250.10062919394954165363.robh@kernel.org>
References: <20240623104647.7697-1-nils.rothaug@gmx.de>
 <20240623104647.7697-4-nils.rothaug@gmx.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240623104647.7697-4-nils.rothaug@gmx.de>


On Sun, 23 Jun 2024 12:46:45 +0200, Nils Rothaug wrote:
> Add a binding for the rc-mygica-utv3 keymap
> 
> Signed-off-by: Nils Rothaug <nils.rothaug@gmx.de>
> ---
>  Documentation/devicetree/bindings/media/rc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


