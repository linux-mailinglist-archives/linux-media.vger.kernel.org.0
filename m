Return-Path: <linux-media+bounces-19919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A439A4D87
	for <lists+linux-media@lfdr.de>; Sat, 19 Oct 2024 13:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9069F1F26F02
	for <lists+linux-media@lfdr.de>; Sat, 19 Oct 2024 11:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC111E411D;
	Sat, 19 Oct 2024 11:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4W16xVT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792C41E3DF9
	for <linux-media@vger.kernel.org>; Sat, 19 Oct 2024 11:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729338673; cv=none; b=U7OaTkjFDYQsqW1Uz1jrLPh1sMQUqWH6LPSDSsdWYIfe+2y2k0kqPe9/0ibDlmEXsGgFFdTmxvivi9xIX3jgU8A52HjwrN7O0eeIJJGY1y9oUY3MNbYDDk4s+wzPbF/lxQgn/Kz5vCkK1Vossmhhne0+b8wyTfv/9e0GF18iDwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729338673; c=relaxed/simple;
	bh=liPGmBp4B9t2kKONYVEGThyCLrvjcgKJ7R1dZhyuDb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5Q70AFLks142SwhUTdWaWuFlvQQ1J9HnXqhQ1WAZHn01DihrtduV4xuhXgdVaTdt+rovXAg8NeyjCkVMwMVJr5q5TTl8Py/oy3kSCEuQAyiU42K5vX42380Rb33oGuXKmGj32QmDy/VuM8np8DKGS32S3ltRDQ/+gQNffjvpMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4W16xVT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729338672; x=1760874672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=liPGmBp4B9t2kKONYVEGThyCLrvjcgKJ7R1dZhyuDb0=;
  b=S4W16xVT4hQsyjOOO50wxi3r4+reG+0oh0oncBBrl/4NnvkRsQYvw7wL
   zIab05J/E3yKoCTIJVyOA3qjUdsb0j03UciPDCpXmIxS5qTGJRsR5p1NW
   O+NFRZwadouGhOFDVeyE1ETAql95hhFROtF7vBpDGtRds/tixiH8iBXrk
   qbgDbKlro11PLqRtyw22HuSgfY/FStTjDprOndAGghzi3lbs65pP1uvh6
   52CeGaFnWbCoKZ/asH3aQLpa6vbLrkUiftNVJRlf0SnvUWXGGIHoCTC03
   2b401yDaUxLacvJhwLdp/Zv9LqrgJlrghUqDIkOnV9nsrmgsUVV3VJQjY
   A==;
X-CSE-ConnectionGUID: w0jawrV3Qg+NlcoXBvRyFw==
X-CSE-MsgGUID: sRT69Yf/SJu649D+aMsHxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28655857"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28655857"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 04:51:11 -0700
X-CSE-ConnectionGUID: M+/pwz/UT3W8qYFpbo4etA==
X-CSE-MsgGUID: tg4/7OoZTAORenrFmn4R8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="116571091"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 04:51:09 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D084C11F802;
	Sat, 19 Oct 2024 14:51:05 +0300 (EEST)
Date: Sat, 19 Oct 2024 11:51:05 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Andy Walls <awalls@md.metrocast.net>, Yong Zhi <yong.zhi@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, Dan Scally <djrscally@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Corentin Labbe <clabbe@baylibre.com>,
	Michael Krufky <mkrufky@linuxtv.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Matt Ranostay <matt@ranostay.sg>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
	Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Devarsh Thakkar <devarsht@ti.com>, Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	=?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Benoit Parrot <bparrot@ti.com>, Jai Luthra <jai.luthra@linux.dev>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 03/10] media: pci: drop vb2_ops_wait_prepare/finish
Message-ID: <ZxOdKQCocqD9Z8Lw@kekkonen.localdomain>
References: <20241014-vb2-wait-v1-0-8c3ee25c618c@xs4all.nl>
 <20241014-vb2-wait-v1-3-8c3ee25c618c@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014-vb2-wait-v1-3-8c3ee25c618c@xs4all.nl>

Hi Hans,

On Mon, Oct 14, 2024 at 05:06:30PM +0200, Hans Verkuil wrote:
> Since commit 88785982a19d ("media: vb2: use lock if wait_prepare/finish
> are NULL") it is no longer needed to set the wait_prepare/finish
> vb2_ops callbacks as long as the lock field in vb2_queue is set.
> 
> Since the vb2_ops_wait_prepare/finish callbacks already rely on that field,
> we can safely drop these callbacks.
> 
> This simplifies the code and this is a step towards the goal of deleting
> these callbacks.
> 
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>

For IPU3 and IPU6:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

