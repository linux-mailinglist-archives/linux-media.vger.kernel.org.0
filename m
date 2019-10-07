Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCC3ECE704
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 17:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728718AbfJGPOe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 11:14:34 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41264 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728245AbfJGPOd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 11:14:33 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97FETR7005735;
        Mon, 7 Oct 2019 10:14:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570461269;
        bh=YvPsrculAXeGiQIMWJ5mp8WKJXnsxqnJvdgGBLud61A=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=tVySD4ikX006/uetXClacnYftLHNsOgAFpKZLJPZMFsgS7j18WREL/Qw1oAK1H+Eg
         WmnrhFPE7HSJk5r4D28/L/IvLhP9i/k82GhJQRBS6Uca1XOX7a5EdS9lOlzYNM1brO
         6NR85l2Kr2bMLI1xg/cRQ6Znuu6BGEdjoLQeSk5o=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97FEToD031952
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Oct 2019 10:14:29 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 10:14:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 10:14:26 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id x97FESBO014015;
        Mon, 7 Oct 2019 10:14:28 -0500
Date:   Mon, 7 Oct 2019 10:17:03 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [Patch v3 1/3] media: ov5640: add PIXEL_RATE control
Message-ID: <20191007151703.z3eejxuujzt5ruth@ti.com>
References: <20191004172418.2339-1-bparrot@ti.com>
 <20191004172418.2339-2-bparrot@ti.com>
 <20191007080320.GG14917@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191007080320.GG14917@paasikivi.fi.intel.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari Ailus <sakari.ailus@linux.intel.com> wrote on Mon [2019-Oct-07 11:03:20 +0300]:
> On Fri, Oct 04, 2019 at 12:24:16PM -0500, Benoit Parrot wrote:
> > @@ -2657,6 +2669,12 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> >  	/* we can use our own mutex for the ctrl lock */
> >  	hdl->lock = &sensor->lock;
> >  
> > +	/* Clock related controls */
> > +	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE,
> > +					      0, INT_MAX, 1,
> > +					      ov5640_calc_pixel_rate(sensor));
> > +	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 
> Please check ctrls->pixel_rate first; it may be NULL here.

How about I just move this line below "if (hdl->error)" instead?

Benoit
> 
> > +
> >  	/* Auto/manual white balance */
> >  	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
> >  					   V4L2_CID_AUTO_WHITE_BALANCE,
> 
> -- 
> Sakari Ailus
> sakari.ailus@linux.intel.com
