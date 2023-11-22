Return-Path: <linux-media+bounces-726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 448AE7F3F21
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 08:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7663B20D0D
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 07:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CC0BE74;
	Wed, 22 Nov 2023 07:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="K4HfY+V/"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A0010E;
	Tue, 21 Nov 2023 23:44:26 -0800 (PST)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AM6BSjT020627;
	Wed, 22 Nov 2023 08:44:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=selector1; bh=ha15CihN0usIDrZmjsw4S
	CfQIkolylzql2Von2LDFCU=; b=K4HfY+V/sbmE5QduDj+4ChLm2/mmJbC6L0Wm5
	fC+YWfd924xcm8XUoWGTTHvSwONfNZeOGKQV4XnTqk3alPe2j4WAcAsF+Xwc4gqc
	kwtnSeLg+yLNv6lKEQCA6jGaLNjeDzbpGgZ4fYS9cbtmU4jF7HlbTqg0/u4BLPeC
	UPkUGBekyN3MPbqWvZpfWe/PPKvdP5sdrpCV0xL2iJjXBcU+qLefoDJeStN2aAN2
	VP5YFksa1DH3Eo4qnRgQCw+N4RhLsWitYj083gNXjpmxfyv5zlbfbzaOYvjgOmGI
	sWgCyn0SLQiFlniLjtmWPJpxwp7EXdzCFLuRCH3iSHdBVS6jw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uek9a28yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 08:44:10 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D777B10003E;
	Wed, 22 Nov 2023 08:44:09 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CE84D21230F;
	Wed, 22 Nov 2023 08:44:09 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 22 Nov
 2023 08:44:09 +0100
Date: Wed, 22 Nov 2023 08:44:04 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Philipp
 Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Dan Scally
	<dan.scally@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 0/5] Add support for DCMIPP camera interface of
 STMicroelectronics STM32 SoC series
Message-ID: <20231122074404.GA787777@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231120170809.728941-1-alain.volmat@foss.st.com>
 <ZVvNMPfW7OhPByZk@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZVvNMPfW7OhPByZk@kekkonen.localdomain>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_06,2023-11-21_01,2023-05-22_02

Hi Sakari,

On Mon, Nov 20, 2023 at 09:18:40PM +0000, Sakari Ailus wrote:
> Hi Alain,
> 
> On Mon, Nov 20, 2023 at 06:07:56PM +0100, Alain Volmat wrote:
> > This patchset introduces support for Digital Camera Memory Interface
> > Pixel Processor (DCMIPP) of STMicroelectronics STM32 SoC series.
> > 
> > This initial support implements a single capture pipe
> > allowing RGB565, YUV, Y, RAW8 and JPEG capture with
> > frame skipping, prescaling and cropping.
> > 
> > DCMIPP is exposed through 3 subdevices:
> > - dcmipp_dump_parallel: parallel interface handling
> > - dcmipp_dump_postproc: frame skipping, prescaling and cropping control
> > - dcmipp_dump_capture: video device capture node
> > 
> > v7:
> >   - correct byteproc set_fmt handling and compose/crop/fmt handling
> >   - replace few v4l2_subdev_get_try_* into v4l2_subdev_get_pad_*
> 
> Can you rebase this on my my linuxtv.org tree master branch
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/>?
> 
> These will be called v4l2_subdev_state_get_* now.

Ok, serie v8 is now rebased on top of the master branch of your tree.
I'm going to push the rebased gc2145 sensor driver as well in a moment.

Thanks.
Alain

> 
> Thanks.
> 
> -- 
> Regards,
> 
> Sakari Ailus

