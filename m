Return-Path: <linux-media+bounces-337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B41077EB2A0
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 15:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1BC6B20BCF
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 14:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F0E41743;
	Tue, 14 Nov 2023 14:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="TQsXN7L1"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4388F43
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 14:41:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014ED1A5;
	Tue, 14 Nov 2023 06:41:06 -0800 (PST)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AEEeLYo032438;
	Tue, 14 Nov 2023 15:40:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=UFmkMOdBwtqRubSgJ1ZELCpM6rhS83undY4oyEx9SLc=; b=TQ
	sXN7L1HvLdUkivHrkQDz2IOE+hIelaKbF2Rusyxm8EmBrKx3emMrgcirZCVUDjos
	6/umuvjaEi+bvTGDnC3YOY4ULGR3SvXl95XZ3UqpCHnobzlcM95tob6zrfU/Qv1y
	tEzW2PC7lt/lNvm3jpbCHaTW25jwPYWqPAom90iWyd0bEtJ/lnB8p9KI3BcA7MPY
	ab4eDo8n4r42QqXYZCYXaaWVcZ6FvbU5GUh/HZddPVpGnmER36na0I+16Q/BCzd2
	pL89X1fZ4pB8yHjXQ7tA8qUCoJ99W3MFBZt03KusjedP27IhXDAS2OG2LL1kV7VG
	nzTrOI79ZweYP2EzIzTA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uam249ufg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 15:40:49 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 853A8100053;
	Tue, 14 Nov 2023 15:40:47 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4FE1021860B;
	Tue, 14 Nov 2023 15:40:47 +0100 (CET)
Received: from [10.129.166.186] (10.129.166.186) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 14 Nov
 2023 15:40:46 +0100
Message-ID: <572eb512-6cc6-45a6-acea-fcd4c5af2678@foss.st.com>
Date: Tue, 14 Nov 2023 15:40:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: st-mipid02: correct format propagation
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
CC: <stable@vger.kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20231113145731.89796-1-alain.volmat@foss.st.com>
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20231113145731.89796-1-alain.volmat@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.129.166.186]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_14,2023-11-09_01,2023-05-22_02

Hello Alain,

Thanks a lot !

On 11/13/23 15:57, Alain Volmat wrote:
> Use a copy of the struct v4l2_subdev_format when propagating
> format from the sink to source pad in order to avoid impacting the
> sink format returned to the application.
> 
> Thanks to Jacopo Mondi for pointing the issue.

Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

> Fixes: 6c01e6f3f27b ("media: st-mipid02: Propagate format from sink to source pad")
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/media/i2c/st-mipid02.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
> index fa27638edc07..dab14787116b 100644
> --- a/drivers/media/i2c/st-mipid02.c
> +++ b/drivers/media/i2c/st-mipid02.c
> @@ -770,6 +770,7 @@ static void mipid02_set_fmt_sink(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_format *format)
>  {
>  	struct mipid02_dev *bridge = to_mipid02_dev(sd);
> +	struct v4l2_subdev_format source_fmt;
>  	struct v4l2_mbus_framefmt *fmt;
>  
>  	format->format.code = get_fmt_code(format->format.code);
> @@ -781,8 +782,12 @@ static void mipid02_set_fmt_sink(struct v4l2_subdev *sd,
>  
>  	*fmt = format->format;
>  
> -	/* Propagate the format change to the source pad */
> -	mipid02_set_fmt_source(sd, sd_state, format);
> +	/*
> +	 * Propagate the format change to the source pad, taking
> +	 * care not to update the format pointer given back to user
> +	 */
> +	source_fmt = *format;
> +	mipid02_set_fmt_source(sd, sd_state, &source_fmt);
>  }
>  
>  static int mipid02_set_fmt(struct v4l2_subdev *sd,

-- 
Regards,

Benjamin

