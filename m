Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB6E274305
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 15:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgIVN1o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 09:27:44 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:40240 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbgIVN1o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 09:27:44 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08MDP9wb097337;
        Tue, 22 Sep 2020 13:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=wiG3zxQLA/xFWKswr8Rjz6vXQBD/EbXcKYQalDy23nQ=;
 b=dUWSD+WQTXbY6f8xp+nqhei853F11t8Y2qX4PYhGvihLrWBrGWXTaGhc0Bc4BM9QwW9s
 tbOaPHhp4DYpM4hYxifZrFo0MxXZhyl/Mdiv/rxOfUPzNH8lLHyuDnTTztVJ33OjJuq0
 L/Qtwi1GN8e2BCHOKAtnIMUvYVbCEmjZFojrk4+MAuAe1pMN06MnSs4jPUd7tNA/fjFs
 KPV4rld+g9F5MqmYFPWdNnuMzUFBRjC5VmZujvMtP9/e5a6O0TWSg+6E4lvUXsDxjTw3
 mYoEzb94y3Z/dSIoVTgoWEx8T/tOhBroqED40UBloMP8lMEV9yE6bzYKk+kF7YornPzy LA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 33q5rgb23e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Sep 2020 13:27:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08MDPskh103218;
        Tue, 22 Sep 2020 13:27:36 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 33nuw3w8w5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Sep 2020 13:27:36 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08MDRY7E016869;
        Tue, 22 Sep 2020 13:27:35 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 22 Sep 2020 06:27:34 -0700
Date:   Tue, 22 Sep 2020 16:27:27 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alex Dewar <alex.dewar90@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH REBASE 0/3] atomisp: Rebased fixes
Message-ID: <20200922132727.GG4282@kadam>
References: <21f18dc2-a1bc-0a37-0336-fc35170a40e9@gmail.com>
 <20200922090914.20702-1-alex.dewar90@gmail.com>
 <20200922112729.313d454d@coco.lan>
 <f14fac45-d713-a6ee-f0be-906a6d971b43@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f14fac45-d713-a6ee-f0be-906a6d971b43@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9751 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009220105
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9751 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009220105
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Sep 22, 2020 at 12:02:33PM +0100, Alex Dewar wrote:
> On 22/09/2020 10:27, Mauro Carvalho Chehab wrote:
> > Em Tue, 22 Sep 2020 10:09:07 +0100
> > Alex Dewar <alex.dewar90@gmail.com> escreveu:
> > 
> > > Hi Mauro,
> > > 
> > > I've rebased the patches now, but there is a slight hiccup. For patches 2
> > > and 3 of this series there will now be a conflict with commit 9289cdf39992
> > > ("staging: media: atomisp: Convert to GPIO descriptors") in Greg's tree.
> > > 
> > > I'm not sure what the best way to handle this is? The merge conflicts
> > > will be trivial (due to a conversion between the gpio_* and gpiod_*
> > > APIs), but I could alternatively send these last two patches in via
> > > Greg's tree if that's easier for people. Let me know what works.
> > Maybe the best would be to re-send those after the merge window, when
> > both patches will arrive upstream.
> > 
> > Thanks,
> > Mauro
> That sounds more sensible. I've also just noticed that I introduced a bug in
> the first patch when rebasing it :-/, so let's hold off on the whole series
> and I'll do a proper tidy and resend after the next merge window.

Is the bug the memory leak if lm3554_platform_data_func() fails?

regards,
dan carpenter

