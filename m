Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A72C175E12
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 16:22:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727199AbgCBPWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 10:22:38 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:36374 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbgCBPWi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 10:22:38 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 022Evu5U086099;
        Mon, 2 Mar 2020 15:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=mime-version :
 message-id : date : from : to : cc : subject : references : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=G/kvItGwy0v2Fs3ftwbEd0rVlgOOyAgL4aj7wJ7qNZM=;
 b=EIMWrRJPFCTSlxyodnP+JR3GxBOUIuWyd7a2GHh2qEZGyIOK7tm6Es2IRnu9+UxIr0/W
 BgUDOve59skYLmTgSRy8qJCz3QhHJhtuHbJEw09tVHV5EpjjCiNAUu/k7jFlFIngxAN1
 7/w0Zd9Jegr7vONcmgo5Y7tPkFkJPZcl9dhAFNh2EphBQ4Upnp7awxmdBagwPOAXLt89
 vOwvyZ8ZZrtoBxNaSNVinZaQDGSVUNczekNjAE68JjpLr3Eb8P0MF+2zASrFZbbkF5cK
 PR/RNoBxs/qsmBlDZ0WF4qx5xYr0yfFxV2T5P+gZkGPIAl30ACTI8T6ZU0AhmaR5nbsE Qw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 2yffwqgbv0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Mar 2020 15:22:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 022FKxk9001574;
        Mon, 2 Mar 2020 15:22:29 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 2yg1eh83un-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Mar 2020 15:22:29 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 022FMRdO021370;
        Mon, 2 Mar 2020 15:22:27 GMT
Received: from kadam (/129.205.23.165) by default (Oracle Beehive Gateway
 v4.0) with ESMTP ; Mon, 02 Mar 2020 07:21:23 -0800
USER-AGENT: Mutt/1.9.4 (2018-02-28)
MIME-Version: 1.0
Message-ID: <20200302152058.GB24372@kadam>
Date:   Mon, 2 Mar 2020 07:20:58 -0800 (PST)
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v1] media: staging: tegra-vde: Use
 devm_platform_ioremap_resource_byname()
References: <20200227180915.9541-1-digetx@gmail.com>
 <20200302080456.GD4140@kadam>
 <d748bf2c-e38c-dabb-59ad-39e14813e40a@gmail.com>
In-Reply-To: <d748bf2c-e38c-dabb-59ad-39e14813e40a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9547 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003020110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9547 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003020110
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Mar 02, 2020 at 06:04:20PM +0300, Dmitry Osipenko wrote:
> 02.03.2020 11:04, Dan Carpenter пишет:
> > On Thu, Feb 27, 2020 at 09:09:15PM +0300, Dmitry Osipenko wrote:
> >> This helps to make code cleaner a tad.
> > 
> > Please don't start the commit message in the middle of a sentence.
> 
> Could you please clarify what do you mean by the "middle of a sentence"?
> The commit's message doesn't sound "middle" to me at all.
> 
> > It looks like this for some of us:
> > 
> > https://marc.info/?l=linux-driver-devel&m=158282701430176&w=2
> 
> This link points to this patch, I don't quite understand what you're
> trying to convey here.
> 
> > I generally read the subject or the full commit message but seldom
> > both.
> 
> The commit's title describes the change briefly, while the message gives
> a rational for the change. Usually reviewer should consult the code
> changes themselves for more details.
> 
> Do you have some kind of a email filter that shows only the commit's
> message? Otherwise I'm not sure what's the problem.


The commit message just says "This helps to make code cleaner a tad."
but it doesn't mention devm_platform_ioremap_resource_byname().  That
information is there in the subject but not in the commit message itself.
Take a look at the link I sent you and try to find the subject.  It's
far away from the commit message.

regards,
dan carpenter

