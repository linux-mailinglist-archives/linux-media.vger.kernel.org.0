Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB90C19D569
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 13:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389188AbgDCLCz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 07:02:55 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:50311 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727911AbgDCLCy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 07:02:54 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MsI0I-1j4aOK2k4g-00tmZz; Fri, 03 Apr 2020 13:02:38 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 387CE64FEE7;
        Fri,  3 Apr 2020 11:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 0FNzAkAu7U1m; Fri,  3 Apr 2020 13:02:36 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (unknown [10.8.5.74])
        by mail.cetitecgmbh.com (Postfix) with ESMTPSA id E413864FE1C;
        Fri,  3 Apr 2020 13:02:36 +0200 (CEST)
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 9D617804FB; Fri,  3 Apr 2020 13:02:36 +0200 (CEST)
Date:   Fri, 3 Apr 2020 13:02:36 +0200
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 2/9] media: adv748x: include everything adv748x.h
 needs into the file
Message-ID: <20200403110236.GD6164@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
 <046f909122e03286faf0a8916f30d56259656e14.1585852001.git.alexander.riesen@cetitec.com>
 <b56c7c08-d5f7-0b2a-350c-322401e07005@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b56c7c08-d5f7-0b2a-350c-322401e07005@ideasonboard.com>
X-Provags-ID: V03:K1:T8O+dblCJ1e2U15lbOkjlij5GMMl3LOVr2BRKw66IzeBhsZ2qij
 Kst6QqDYcbzPnd8xHHlehYe1b7AneP2GxwwusfpVeuXdlOjAwYhuuILZ2E4PlyJp3Yv9NFq
 X7N5XdMq8PJtGGqoDQIfzTO9YOBpHB8PaqPqbAaHQ3Fk3ZNBn4KPvDReAf7wSrSsdcfX9V8
 H+3cZgXGhWrR3LyIf8+Bg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2k98zlaMJCo=:vbT7eSJ4i4yoyL2cM7tdLd
 omruHDxfZaqMhjzj2K01MsGbzI1Kw+qdPaHBfkTS09vmeZuLPa2zx0jK4TOmiq/Yh+rWcW9Jd
 cLsIfA8RRqk7G5oXRTlo6DD1tIeokVj61xARuWra1xgoRRB07v3n3hXe211mZ/T/RHTy+PsCX
 j9Dz2islkCuD3FjaQsVC/bvZi+LBg72Ux0TvUsYS3vwBeJ+CRp489Ppr6O5tx8bxBc6z3Yrrf
 6DLqjr+3oOZ5Fwt+MtsMyppSjr+MEHnO4rkkdIV4SbVbOKezm55iNDFpPuAtaoY2bt8A+4yZb
 Z/s/tvs2IizJko3zhuKSr680rlqj43ONc6gPT556AQjncit9l3WY0bz3yDYsYzc49nUNn/TGY
 +romnkkfHtvVVBo/qL0eH4SwYTp3d/MKp1XTaTxtAtZhl8ztEQcG3NVwPilsLwRxTLefWRDRY
 ZTnXSPbnzYHIZxpMgDb+LOrUWqIZj+gMKCt1n1cTI5y2UJ2hO1LsdUIIoWRrXy2zVwasEWTvD
 m/LmD0gpdMl8zat0kElY5qJ1nQ1t//mNCiHQWBJR0UHD4szXxKIuucaImb3oq7XeWaLXc6Xg+
 0hd6wg7JROLtkMK1EAgK7f5Vp5K1/X1JFBcQKrZl9TOXJdz5EBUhQ+Z2oTLIJ8f9fY4ZlEtYz
 d7SN8jSfJnsT20RyWClznH2CZtnMIje9GRWx0pxlHixIBUuRBfSOuJgSyspGjUblAeqKUHgjT
 WLX9R1nK+5/aRr3ehifwssyAhgyrVRd43Z+A8maRGayxnRPwk6wFbm824cftO+zfQZn/esaLK
 x1rpnUtKjOd1wjPAtKxZtlr9vmFLOk9XYMg0K//KPYZ+CoyqO9LsU8ABKjkkIG5XQOINKrU
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kiran,

Kieran Bingham, Fri, Apr 03, 2020 12:48:06 +0200:
> On 02/04/2020 19:34, Alex Riesen wrote:
> > --- a/drivers/media/i2c/adv748x/adv748x-core.c
> > +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> > @@ -10,6 +10,8 @@
> >   *	Kieran Bingham <kieran.bingham@ideasonboard.com>
> >   */
> >  
> > +#include "adv748x.h"
> > +
> >  #include <linux/delay.h>
> >  #include <linux/errno.h>
> >  #include <linux/i2c.h>
> 
> As linux/i2c.h is included in adv748x.h, we can remove this entry.
> 

Corrected in v6.

Thanks for review!
Regards,
Alex

