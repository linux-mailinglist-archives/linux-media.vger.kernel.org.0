Return-Path: <linux-media+bounces-45096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D05BF3A1E
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 23:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A2FCE4FDD45
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 21:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A5215B971;
	Mon, 20 Oct 2025 21:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aRUdT4vZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E292286D40;
	Mon, 20 Oct 2025 21:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760994267; cv=none; b=dsk/IkbgYqVe4F+D0DLr6Fe1MM25GQ2phberoXD4S+E1T3qrz3I6nvWJ71dAYBGcO9j9lTwjihKU55pBgLlRxJMsK6YdpH4gDKieW3dILlDRRC8nHjZMG0DL7vImqYm0rTTMvOHltmGc67X6iSQ89XvFoZHUNrJQ00BTT0YNOJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760994267; c=relaxed/simple;
	bh=zHkosKVnM0JVpz7KhY5x79jgEf/zbo/B9W1EwqO6+80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/EkvYgvO/7lgQTtxxopXwmG1TnlSfDkCFdStF5paG+GpSjdxgblg1nfkJ5zYczE0zh+E3gLfG5QVKrdpbGKHfMS6z//RfeTcXiEn7gftgm9BcOxt6hHPRzUl/6b2fkDzG8SIRjFTPaUgDS4qzQjGEtCjcSEeU4q01QkR6M+x8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aRUdT4vZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31C4C113D0;
	Mon, 20 Oct 2025 21:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760994267;
	bh=zHkosKVnM0JVpz7KhY5x79jgEf/zbo/B9W1EwqO6+80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aRUdT4vZaUIUjM2/BdKPkaCfvyp48TPe7zYqWSFi0uj5XVwd9oKOGbjgLfqQ9fDgV
	 bPQz1t6K0GA/+TQ7p+kG8Gc3LdhQkmCO8rgtS55u+xvVL2k/mtmdVWjKBdVWEQdM/L
	 wNrxlQo9+wWgiryehhMWHlg5A7ia9J48sOM6HR1qYdWtDdrdxp1LIsB/5JnkHGbMfO
	 5cdQEBhMoSTrosxnuuiO1PXH1I22q4pIN7JYaN3sAzdHXclAYqsq0NsHi3ybx/AN/A
	 tRm6GZRboRGgNPOhpxFj+sri9+XftGzwepG+NMsLs6lPnnEtlfvE+2DKiGCwdG5M1E
	 EGE4kgGjM7cyg==
Date: Mon, 20 Oct 2025 16:04:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/1] dt-bindings: media: Convert ti,tvp5150.txt to yaml
 format.
Message-ID: <176099426460.1822951.14576338144604002524.robh@kernel.org>
References: <20251014185515.2354668-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014185515.2354668-1-Frank.Li@nxp.com>


On Tue, 14 Oct 2025 14:55:09 -0400, Frank Li wrote:
> Convert ti,tvp5150.txt to yaml format.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/media/i2c/ti,tvp5150.txt         | 157 ------------------
>  .../bindings/media/i2c/ti,tvp5150.yaml        | 133 +++++++++++++++
>  2 files changed, 133 insertions(+), 157 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/ti,tvp5150.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,tvp5150.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


