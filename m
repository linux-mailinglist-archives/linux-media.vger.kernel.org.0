Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F71D4498BE
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 16:48:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241091AbhKHPvZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 10:51:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241079AbhKHPvY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 10:51:24 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF12C061570;
        Mon,  8 Nov 2021 07:48:39 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id n23so15484466pgh.8;
        Mon, 08 Nov 2021 07:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=yS9RVOYSJmLmsjplw6tcopiKSzTd9TMH34xX1w9V238=;
        b=GaG5gwfYDsY6S5gEPFlYty9FkBO0xUxnhHCh5q3oGiw+pVhceO+fm3xYdU3j7hriFf
         zNm/HGCN1t1a6RRGVqGBN/N1UjTSUlRofW/vATUZ/LBDjQHL+cCZuui0mnBHjHrhhn9k
         bYlbxklFvcCtOpA2slWgoGBUPuck+0qBbJf89PX+efcL5mh/8HoibJ1lGMJPfB+ZRzfy
         N9MPizJxzURIQnlTjPiJMO8JEiXHomBXUJAxpGHRsNEaz2bM8DCxGuuSnrdSgaJHjV6J
         +BPYjiCN8qx/mmoyUeaDKf8vPt1LVGemgGgMEur4aQ7KNhk9M/dTyNpE7UT+I1+Op5Wb
         656g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yS9RVOYSJmLmsjplw6tcopiKSzTd9TMH34xX1w9V238=;
        b=uJfZuU+siGgYdrl+VSJgxlhhu4vfFtYvdQKOd3/Q7aFlkZNZri+oqsAVv5c3OJmYDH
         w2DXaXOdz9E1vXnah2xJGFCggvJM+erBADifEX/b/SMrUg1q+Nb4zgXe1Z+nDUgAkVio
         /gzS0pFBulXDJSfXF2mVRQpb5HF06iFR35hmXPPLajZNzkNHOiA03te+6Ig2qoyaC6jH
         z8wHrpkchSzaQm/jDsRdy3IXn7QL8O8gUBK+A+8le94C6Oq2F0RmXWovvMKkizDRQH4m
         wfqxY5OEx/uYgEKMqX+TeeYKCKIRiii1B4Qv4+PDtTIfvUhbGw42CoWjFqZRoZ+gdCDB
         kdSA==
X-Gm-Message-State: AOAM532ZtjI+UymhWcaGiPDdc1zmQqJ2DbC7wSk7WZdSeINSSYmy8l2Z
        X0pCTPbxk3MPTw7Aouu8mzQ=
X-Google-Smtp-Source: ABdhPJzlS6xr6yExAOENTvlx33UuzblttBiBy/PsFjq5pssNpcnIMno4bFDl3z/oWLXnYHwWYScSXQ==
X-Received: by 2002:a05:6a00:170d:b0:49f:9b39:d555 with SMTP id h13-20020a056a00170d00b0049f9b39d555mr393823pfc.27.1636386519115;
        Mon, 08 Nov 2021 07:48:39 -0800 (PST)
Received: from ?IPv6:2400:4052:6980:3800:dba7:2b1f:3f26:a5ec? ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id bt2sm16621345pjb.33.2021.11.08.07.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 07:48:38 -0800 (PST)
Message-ID: <abada89901e0ca11f13d8380de8c1184522eb6db.camel@gmail.com>
Subject: Re: [BUG/RFC PATCH 3/5] [BUG][RFC] media: atomisp: pci: add NULL
 check for asd obtained from atomisp_video_pipe
From:   Tsuchiya Yuto <kitakar@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Date:   Tue, 09 Nov 2021 00:48:33 +0900
In-Reply-To: <20211102130245.GE2794@kadam>
References: <20211017162337.44860-1-kitakar@gmail.com>
         <20211017162337.44860-4-kitakar@gmail.com> <20211102130245.GE2794@kadam>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

<removed Alan from Cc as the mail address not reachable>

On Tue, 2021-11-02 at 16:02 +0300, Dan Carpenter wrote:
> On Mon, Oct 18, 2021 at 01:23:34AM +0900, Tsuchiya Yuto wrote:
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > index 366161cff560..7206d29ba263 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
> > @@ -1715,6 +1715,12 @@ void atomisp_wdt_refresh_pipe(struct atomisp_video_pipe *pipe,
> >  {
> >  	unsigned long next;
> >  
> > +	if(!pipe->asd) {
> 
> Run your patches through scripts/checkpatch.pl.

I'm sorry about this. I did checkpatch for another series I sent earlier,
but forgot this series.

Regards,
Tsuchiya Yuto

> > +		dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
> > +			__func__, pipe->vdev.name);
> > +		return;
> > +	}
> 
> regards,
> dan carpenter
> 


