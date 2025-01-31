Return-Path: <linux-media+bounces-25491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0907A240D1
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 17:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9696618841E5
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 16:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADF31E377F;
	Fri, 31 Jan 2025 16:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B5V/7Lw0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2C21EEA44
	for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 16:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341382; cv=none; b=LIWvPc0s6/JOl1/vy9dYhOzqBhhrtoOhbsShmRzJ6FNid9ul/tKnhYOM5MubjN28VBjMS3IWhr//sVRKsl1rY2ZCZ26wh9TCD6fXr8r4ZeBQTnuyE7SeRFS78EWp7cRGzsWHNEemYvRBOodtMy1fz8t/KEStwmb8DhdzTe7jMQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341382; c=relaxed/simple;
	bh=viE1ikQvOXnsoS6pu2VFENLMTWGDx/UT139LfAHiSuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SfL2iwEcXVfUxr/jqeZsRh7Z9yxuuCaL6nJeiLszswPRQO/JoNeWAqGc/533oPZgxzCRaZXIb6snM3Gsrg7G9upNLsNda47kP5A0BKib8Dc41YXJlZKjHhiUOmO6vLyYtp7CCOR/j5XBF2Npa7HOWs2W4QbJZEwhnFEKxsIimrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B5V/7Lw0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2302465;
	Fri, 31 Jan 2025 17:35:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738341307;
	bh=viE1ikQvOXnsoS6pu2VFENLMTWGDx/UT139LfAHiSuo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B5V/7Lw0dCWIPq4prGc5hZQR/co9R1TRHTXODo+VVA6gK57ENIOtAJ1qwKVXaw1tb
	 xFjt6ijLKecFlFxkbHz388NB+TevliaOkOCM4e6Y4I+F6s1kGzcHcLskNhAGOAarrQ
	 hO7OyY6ph7minsp0qjK2UTKMTRedgcfb1Vg/O6us=
Message-ID: <1557bb75-225a-490f-9149-8d78d57f437f@ideasonboard.com>
Date: Fri, 31 Jan 2025 18:36:12 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 9/9] media: v4l: Convert the users of
 v4l2_get_link_freq to call it on a pad
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi
 <yong.zhi@intel.com>, Dan Scally <djrscally@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, hverkuil@xs4all.nl,
 laurent.pinchart@ideasonboard.com, bingbu.cao@intel.com,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>,
 Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benoit Parrot <bparrot@ti.com>, Ricardo Ribalda <ribalda@chromium.org>,
 "Duc-Long, Le" <duclong.linux@gmail.com>
References: <20250120110157.152732-1-sakari.ailus@linux.intel.com>
 <20250120110157.152732-10-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250120110157.152732-10-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/01/2025 13:01, Sakari Ailus wrote:
> Call v4l2_get_link_freq() on a pad, instead of a control handler. This way
> we can soon convert v4l2_get_link_freq() to be callable only on a pad and
> remove the compatibility code.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Naushir Patuck <naush@raspberrypi.com> # rp1-cfe
> Acked-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com> # st-mipid02
> ---
>   drivers/media/i2c/st-mipid02.c                |  5 ++--
>   drivers/media/i2c/tc358746.c                  |  4 ++-
>   drivers/media/pci/intel/ipu3/ipu3-cio2.c      | 11 +++++---
>   drivers/media/platform/cadence/cdns-csi2rx.c  |  4 ++-
>   drivers/media/platform/nxp/imx-mipi-csis.c    |  5 ++--
>   drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 11 ++++++--
>   .../media/platform/qcom/camss/camss-vfe-17x.c |  9 ++++---
>   .../platform/qcom/camss/camss-vfe-gen1.c      |  9 ++++---
>   drivers/media/platform/qcom/camss/camss.c     | 27 +++++++++----------
>   drivers/media/platform/qcom/camss/camss.h     |  2 +-
>   .../media/platform/raspberrypi/rp1-cfe/cfe.c  |  4 ++-
>   drivers/media/platform/st/stm32/stm32-csi.c   |  4 ++-
>   drivers/media/platform/ti/cal/cal-camerarx.c  |  3 ++-
>   drivers/media/platform/ti/cal/cal.c           |  4 ++-
>   drivers/media/platform/ti/cal/cal.h           |  1 +
>   15 files changed, 64 insertions(+), 39 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi


