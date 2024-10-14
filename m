Return-Path: <linux-media+bounces-19533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 230B399C14E
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA3ED28301E
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 07:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18142148FE1;
	Mon, 14 Oct 2024 07:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UeJNpMYH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6767D231CA6;
	Mon, 14 Oct 2024 07:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728891036; cv=none; b=tUuUy3kyoZax0N/B820Va8vNlQaBzglsFCKtjdBVpOt9tHWA7KN8FsT0s9o4aAB/9lk0NrKjGKhGWezoL9c6akVlyrRogj6xkMt6SGWYya8A210w9PQhHUioctRMDLtfS3QncskY56mDEeMY+eJtS/w0wZm8LOi+DMSSjr9kM5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728891036; c=relaxed/simple;
	bh=P3aaTckR145CBhhIT9sxL5MYofyfDXU+6ZGA0hh+3fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awDnEahlxzIpKd6LqABnBj/IvA8plD6RKBD/RziOsEDyRmTSIvCmbgxPoFX7uO4SDz/uOX4Pmt9S3k9pT4QHxL6iTaj93WCzuuQGH4Ukn5djgu+AN6STy9oDw/R3pxZAyqd5abCS/W6ju3eOJF0AA0diqK7E//wAxzhRrgTziHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UeJNpMYH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221B8C4CEC3;
	Mon, 14 Oct 2024 07:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728891036;
	bh=P3aaTckR145CBhhIT9sxL5MYofyfDXU+6ZGA0hh+3fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UeJNpMYHJK8VDuYMGPjRKnIgcyW2UbmJ7bGzi/+k3oAFb5UNImobXQ8IOamcsHZd/
	 RLkjgY49pJgLKhRZ9VO246jbFG7XCxA0sfW2ECtBpJHxebiUAxvzDFZJAHwKbcEhN/
	 Iac6Sys4zv/zkxl3fM4NQJ0fcm3RQ/RErni1yf2iIx258j+41OkKt1WEE2STAGP/Aq
	 X6J5vmdkCxdgUIlrZRIqaQJQ22N9D/MG0Tr3SPedAu3CkfosoOSurK3NXI2lUqb9l1
	 C8H1NUACKLNsMrsIZu4BiTs9QPHpPUiSkVYapTkRlULhfuUTKTTdyOTKaYsRXjJ7i3
	 y7X7mbFcQZNTg==
Date: Mon, 14 Oct 2024 09:30:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: guoniu.zhou@oss.nxp.com
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	jacopo@jmondi.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.d, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: media: nxp,imx8-isi: Add i.MX8ULP
 ISI compatible string
Message-ID: <6skgxfgvnd5f7zx5gcobcvp7krjskupo52c4op25i4qmmgti5w@3tn3hkmh3e2l>
References: <20241012084732.1036652-1-guoniu.zhou@oss.nxp.com>
 <20241012084732.1036652-3-guoniu.zhou@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241012084732.1036652-3-guoniu.zhou@oss.nxp.com>

On Sat, Oct 12, 2024 at 04:47:35PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Are you sure your name includes the dot? Or you just use login as full
name?

> 
> Add the compatible string support for i.MX8ULP ISI.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> ---
>  Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Best regards,
Krzysztof


