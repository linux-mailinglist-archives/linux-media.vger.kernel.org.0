Return-Path: <linux-media+bounces-10402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F238B6B5E
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 09:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A60961C21DBB
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 07:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE87937719;
	Tue, 30 Apr 2024 07:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GQ1Od0rD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8BA1774E
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 07:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714461839; cv=none; b=TfVRghvIsSgKP4Io1xJk5//DudoiDrvgsrARJBQHFqAOt7dhr5eAg/QNmoEWwUcrBukkhUUGgRAyt51aW78zEHMGFWyoMBSd4SqWNmn+UYTcWNUx9TrCDsdWxtM+04jk+f56eQrFp+37wcPPAnvNNc9xat6YbvXyvZpDT+EeDbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714461839; c=relaxed/simple;
	bh=MsxcXqTQ4sJLvw6htSBlDVsoxMOkFXWTIjc6Du+N+sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISs17D8khbsMPRA/ovrcnmcQG0BjgWkxDewRrRpHTGk5Kkn9JCrW17YU1XpzuAf2V+LROGLervCrcF5z4vPTFWBGupYWlnVZIXCsTwLO+x3ZAXLtfzC/c6vmmstvJufl06kiP+PYliYKwp4m5or8+qMFLTuGvC91wOuJr9eC7lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GQ1Od0rD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 249F9552;
	Tue, 30 Apr 2024 09:23:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714461780;
	bh=MsxcXqTQ4sJLvw6htSBlDVsoxMOkFXWTIjc6Du+N+sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQ1Od0rDteD81eqA1GVOmOchnuLxMI1sqb1Ndp5h0D/RL0iiUQGWfYX7b8Uge0kZg
	 3ALJNIfEbzqpVv5JJNhJ8FHrDsXGNk9dujw7g2Un/VePKJ6zTXIMuXSfFyifiiLpD+
	 KMy38tAuy8GwZh4vTpfTXXb38QBIMh7sg5s4HczE=
Date: Tue, 30 Apr 2024 09:23:52 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v4 3/4] media: Documentation: Update link frequency
 driver documentation
Message-ID: <ojsquq4vgzyxubla4uv6ntgm4p7zoqpn5vqqza5dmevxlosy6l@2icfz6thrffp>
References: <20240429190852.1008003-1-sakari.ailus@linux.intel.com>
 <20240429190852.1008003-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240429190852.1008003-4-sakari.ailus@linux.intel.com>

Hi Sakari

On Mon, Apr 29, 2024 at 10:08:51PM +0300, Sakari Ailus wrote:
> Add the get_mbus_config() as the means for conveying the link frequency
> towards the receiver drivers.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/driver-api/media/tx-rx.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> index 29d66a47b56e..2f22a1534da9 100644
> --- a/Documentation/driver-api/media/tx-rx.rst
> +++ b/Documentation/driver-api/media/tx-rx.rst
> @@ -49,6 +49,10 @@ Link frequency
>  The :ref:`V4L2_CID_LINK_FREQ <v4l2-cid-link-freq>` control is used to tell the
>  receiver the frequency of the bus (i.e. it is not the same as the symbol rate).
>
> +For devices where the link frequency is read-only, the link_freq field of struct

A control can be 'read-only' as well.

What about something along the lines of:

For devices where the link frequency doesn't need to be exposed to userspace,
the link_freq field of struct

> +v4l2_mbus_config is recommended over controls for conveying the link frequency
> +to the downstream driver in the pipeline.
> +
>  ``.s_stream()`` callback
>  ^^^^^^^^^^^^^^^^^^^^^^^^
>
> --
> 2.39.2
>
>

