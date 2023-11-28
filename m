Return-Path: <linux-media+bounces-1186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B94DE7FB2B2
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 08:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA86A1C20B9E
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 07:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E73134C8;
	Tue, 28 Nov 2023 07:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="5+dddTwD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD5CD6D;
	Mon, 27 Nov 2023 23:27:09 -0800 (PST)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AS20ROl031456;
	Tue, 28 Nov 2023 08:26:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=selector1; bh=Ssqh7w0gyO7jZ8y3HEvt5
	feOCunBeqJzsQ7BVPvXVNk=; b=5+dddTwDgfGM3saJyJ2k6qe0mmiiWTsiflx7l
	kqL2iTnqTq+4O+DoQXIHkHtH99G7dh2FI4od5yIOQc2E2dolxWOa/4+6JttE3YMy
	Iw9oeL8PFkDMnEnp0E6hBQfvMe2qK7EcZTHg+HorMiLV+cn7/MCjC6yufeuncdds
	AzvFBq06XQV96oLm97nOA0HWhEemuZpWu/sflKcjwH9WT7NfSXo3HdhJX2CWr8ws
	StPHYOGms3pE/b+O9DOaHmU61338bLAKWyeeqmVnYMX2zTeG7m8XZ1MGCVAK0gXK
	3HA3VAINFSdLqUKrXPZMOgfYbJeWw4VNjazVYImuooe+QLZaA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uk951u1j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 08:26:54 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9138910002A;
	Tue, 28 Nov 2023 08:26:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4458D214D20;
	Tue, 28 Nov 2023 08:26:53 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 28 Nov
 2023 08:26:53 +0100
Date: Tue, 28 Nov 2023 08:26:45 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Mugnier
	<benjamin.mugnier@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/7] media: i2c: st-mipid02: use active state to store
 pad formats
Message-ID: <20231128072645.GA1435577@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231125182057.1379357-1-alain.volmat@foss.st.com>
 <20231125182057.1379357-5-alain.volmat@foss.st.com>
 <ZWWLQkjvovzJMc73@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZWWLQkjvovzJMc73@kekkonen.localdomain>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_06,2023-11-27_01,2023-05-22_02

Hi Sakari,

On Tue, Nov 28, 2023 at 06:40:02AM +0000, Sakari Ailus wrote:
> On Sat, Nov 25, 2023 at 07:20:52PM +0100, Alain Volmat wrote:
> > Store formats information within pad allowing to simplify further more
> > the driver (mutex / format store within the driver structure no more
> > necessary).
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> Applied with the following diff:
> 
> diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
> index 7af209905d7b..2cc07b3ed0da 100644
> --- a/drivers/media/i2c/st-mipid02.c
> +++ b/drivers/media/i2c/st-mipid02.c
> @@ -563,8 +563,8 @@ static const struct v4l2_mbus_framefmt default_fmt = {
>  	.height = 480,
>  };
>  
> -static int mipid02_init_cfg(struct v4l2_subdev *sd,
> -			    struct v4l2_subdev_state *state)
> +static int mipid02_init_state(struct v4l2_subdev *sd,
> +			      struct v4l2_subdev_state *state)
>  {
>  	*v4l2_subdev_state_get_format(state, MIPID02_SINK_0) = default_fmt;
>  	/* MIPID02_SINK_1 isn't supported yet */
> @@ -642,7 +642,6 @@ static const struct v4l2_subdev_video_ops mipid02_video_ops = {
>  };
>  
>  static const struct v4l2_subdev_pad_ops mipid02_pad_ops = {
> -	.init_cfg = mipid02_init_cfg,
>  	.enum_mbus_code = mipid02_enum_mbus_code,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = mipid02_set_fmt,
> @@ -653,6 +652,10 @@ static const struct v4l2_subdev_ops mipid02_subdev_ops = {
>  	.pad = &mipid02_pad_ops,
>  };
>  
> +static const struct v4l2_subdev_internal_ops mipid02_subdev_internal_ops = {
> +	.init_state = mipid02_init_state,
> +};
> +
>  static const struct media_entity_operations mipid02_subdev_entity_ops = {
>  	.link_validate = v4l2_subdev_link_validate,
>  };
> @@ -851,6 +854,7 @@ static int mipid02_probe(struct i2c_client *client)
>  
>  	bridge->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>  	bridge->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	bridge->sd.internal_ops = &mipid02_subdev_internal_ops;
>  	bridge->sd.entity.ops = &mipid02_subdev_entity_ops;
>  	bridge->pad[0].flags = MEDIA_PAD_FL_SINK;
>  	bridge->pad[1].flags = MEDIA_PAD_FL_SINK;
> 

Thanks a lot Sakari for taking care of that !!

Regards,
Alain

> -- 
> Sakari Ailus

