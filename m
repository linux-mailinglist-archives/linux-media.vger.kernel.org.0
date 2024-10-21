Return-Path: <linux-media+bounces-20001-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0509A9002
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 21:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F800283B4D
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 19:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1661FCC51;
	Mon, 21 Oct 2024 19:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUuYbEY7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48821FBC9C;
	Mon, 21 Oct 2024 19:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729539621; cv=none; b=m0pL+dsfrrz0GscGeecQpaRJmGWHrcKBklrqUa4jCx3iIh8wOLf6IuajHmyTpaJqR4rmP5VPC0z0NhJz4cIb+Mli3xIASzTCzKJUXs5IEDUFsueIKMqUb+sCXISPqgu73zLcoefpgOztXxZjH1MWSlcXNT20XZ1N8OQziSSUKdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729539621; c=relaxed/simple;
	bh=BA1XUFDisNgsnl2rTJaZEOkc0E8/mqLRc+b+umJQqj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAfVIrO+n1jM25Lg2fzNeX99kczJBpxUY9tX8QJ/L7v6RPPxfrTc3vPS7obd/+I9+QgPGKiRwh+fUqtXsyh1AkonXPb7RLYVURxLu8nfK4X5T7SCqpefXQ05a+bu9nQb+UFDh8mRxqaOpaztRw20kCgzSZOvbnnGvQtd9pBNvIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUuYbEY7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C20C4CEE5;
	Mon, 21 Oct 2024 19:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729539621;
	bh=BA1XUFDisNgsnl2rTJaZEOkc0E8/mqLRc+b+umJQqj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mUuYbEY7+QHQhY+jwZBtKOS3yVlvXMyM1SyeOGGi8We5ZzoR1+YdpXvUbm89Ulnrf
	 PML23CcYCghw6HBoHGtwTMXKqEFdQ9B01C5B8Ra4PO8GXnNNE3arwrJHrmXO3Bq7qt
	 DagZoNgoXcPcCqBSbmHcRyPE9aPR1JbcPv9yv7VuD4XpfiZt2oBiPKfEDaLueTZ3PG
	 sEjlbnpAamDdMqyyXYWDMGqWXdwcRkZVLvgixIMGelBgy8RQg+7e3H1UUniVRZwbjR
	 qfqYDQH5RSGsTARcHlqPoyV096ZJ4Eh1/SSm7ilAMjk8GAbQXOWB46iKcQ3wPvp1zf
	 4GAsLteRzBzmw==
Date: Mon, 21 Oct 2024 14:40:20 -0500
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, krzk+dt@kernel.org,
	conor+dt@kernel.org, quic_jesszhan@quicinc.com, mchehab@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com,
	geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de,
	nfraprado@collabora.com, thierry.reding@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org,
	marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 09/15] dt-bindings: display:
 panel-simple-lvds-dual-ports: Reference lvds-dual-ports.yaml
Message-ID: <20241021194020.GA1011261-robh@kernel.org>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-10-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021064446.263619-10-victor.liu@nxp.com>

On Mon, Oct 21, 2024 at 02:44:40PM +0800, Liu Ying wrote:
> This schema documents LVDS panels with dual links.  lvds-dual-ports.yaml
> documents dual-link LVDS display common properties.  Reference the ports
> property defined in lvds-dual-ports.yaml to save lines.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3:
> * New patch.  (Dmitry)
> 
>  .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)

Squash this with patch 8 then it doesn't look like you are duplicating 
things.

Rob

