Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E32B83C99FE
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 09:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbhGOICe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 04:02:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:40044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230076AbhGOICc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 04:02:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6ABE60FF1;
        Thu, 15 Jul 2021 07:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626335979;
        bh=F2d6pZDd/k4RQziKFXVrRyT3ygLkgNvuOwnd7LZQ97Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qbeMC2ldZNTuY7ea55yX6ICVCrfKrCSnkWKQWmoz/sT4hNY/clOzGxQgQUSlEsFku
         5zKcCRAUIJWMzMO5ExQjfZ1L5Hog/8lyLrGyjYU6Y0zEY3mJ13pLBVj/aR1IKr1zIR
         H1Fllu/ee1MQHTXNkrOgixMBlyzGnKDDtVTILH2rg7HG3t489wCqD3sctYVFvyQSCv
         OBfcI7g36X1MfAFuhBbq7i13gAhGcyr09fv7KC9ju4g0+duNJ4ecbZyCnvOJ+KxvdY
         hMgtAVIz+VG66CHnaD3FVaHJUAFdP31QiBruouAahdvkVnrSE1sCS+mrciF9pZAEs7
         wmVl1msBublaA==
Date:   Thu, 15 Jul 2021 09:59:33 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     YP WU <yp.wu@mediatek.com>
Cc:     <Jason-BF.Huang@mediatek.com>, <Lecopzer.Chen@mediatek.com>,
        <francis.lee@mediatek.com>, <gustavoars@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <leo.hsiao@mediatek.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: How to use "DTV_FE_CAPABILITY" command for Frontend.h of Linux
 DVB
Message-ID: <20210715095933.63dbcd31@coco.lan>
In-Reply-To: <20210709154739.30394-1-yp.wu@mediatek.com>
References: <20210623093312.6f9883a5@coco.lan>
        <20210709154739.30394-1-yp.wu@mediatek.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 9 Jul 2021 23:47:39 +0800
YP WU <yp.wu@mediatek.com> escreveu:

> >From: YP WU <yp.wu@mediatek.com>  
> >>To: <mchehab@kernel.org>
> >>Cc: <Jason-BF.Huang@mediatek.com>, <Lecopzer.Chen@mediatek.com>,
> >>	<francis.lee@mediatek.com>, <gustavoars@kernel.org>,
> >>	<hverkuil-cisco@xs4all.nl>, <leo.hsiao@mediatek.com>,
> >>	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
> >>	<yp.wu@mediatek.com>
> >>Subject: Re: How to use "DTV_FE_CAPABILITY" command for Frontend.h of Linux DVB
> >>Date: Fri, 2 Jul 2021 17:28:34 +0800
> >>Message-ID: <20210702092834.11699-1-yp.wu@mediatek.com> (raw)
> >>In-Reply-To: <20210623093312.6f9883a5@coco.lan>
> >>
> >>Hello, Mr.Mauro,
> >><I need to understand more about the use case.  
> >>-> About use case, I describe below:  
> >>
> >>	For our design of kernel, demod/tuner and LNB are registered to different frontend device nodes.
> >>We want to implement property command to know if the frontend device node is LNB device or demod/tuner device.
> >>If it is LNB device node, the value would return true
> >>If it is demod/tuner device node, the value would return false.
> >> 
> >>Do you have better idea or suggestion for our usage?
> >>Please let me know if your have better suggestion.
> >>Very thank you for your help.
> >>
> >>BRs,
> >>YP  
> 
> Hello, Mr.Mauro,
> 	Frist of all, thanks for your reply.
> Based on previous discussion, we think we can create a new property command to achieve our goal.
> 	A new property command "DTV_FE_LNB_CAPABILITY".
> We can use "FE_GET_PROPERTY" with case "DTV_FE_LNB_CAPABILITY" to get LNB capability.
> We also should add a new variable named "LNB_capability" in dtv_frontend_properties. Like below:
> 	bool LNB_capability;
> If the device node is LNB, LNB_capability should set to TRUE.
> If the device node is demod/tuner, LNB_capability should set to FALSE.
> 
> What's your opinion?
> If you have a better idea or suggestion, please let me know.

It sounds that there are some misunderstanding here, specially when you
mention a "LNB device node".

See this picture:
	https://linuxtv.org/downloads/v4l-dvb-apis-new/_images/typical_media_device.svg

The way the DVB API maps the hardware is that the frontend groups:

	- tuner;
	- demod;
	- Satellite Equipment Control (SEC).

While not explicitly there, LNB is part of the frontend (it is part of 
the SEC, for satellite systems like DVB-S/S2). some tuners may
also have LNBs before them.

So, there's no separate device node for it. Everything is controlled
via the /dev/dvb/frontend* device nodes.

So, it is not clear yet why are you considering to have a separate
devnode for the LNB.

Thanks,
Mauro
