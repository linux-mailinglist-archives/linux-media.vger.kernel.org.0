Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 724AF26D9E5
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 13:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgIQLKy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 07:10:54 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:39598 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgIQLKj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 07:10:39 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08HADek6162111;
        Thu, 17 Sep 2020 10:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=3kOIuaOxFmA1usT1/RfXqAK09LFS7TujyVumCl5N4AA=;
 b=QYoG7s2ruCZliRR9mzKOC+bhevipHAZ/AqCoMjOdzh/3Fvv5Ky94wyDgv3SNkYvfvtEB
 ueuKRR3j9OtXF1gtm2cc0FVdpEzGEL06YqyoSRWd/p3OO/1zaWQccybGAeDFyd14tJcV
 nKP6ppq+9OSgNwMFnCMXHSg7Mfu+3iJbYlT1A7LujuIgXzVM60EW1dqXNEmgFUgit/ms
 fUFVZv42ZBzi3QVxODpNicNmtDZu60FVLq4sSgoMY/V2pulBpEz+NksdFgbBMHLA5CiN
 GDqeqWVAE0nF+7L8vEc3R4bbIEDkyI+ACjze/Y1wi9cAJZeT5xooza1N1NatoQh8Pyha yQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 33gnrr8baj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 17 Sep 2020 10:18:03 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08HAG147131702;
        Thu, 17 Sep 2020 10:16:03 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 33hm34gwyw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Sep 2020 10:16:03 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08HAFlmY017062;
        Thu, 17 Sep 2020 10:15:47 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 17 Sep 2020 10:15:47 +0000
Date:   Thu, 17 Sep 2020 13:15:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dan Scally <djrscally@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org,
        robh@kernel.org, jorhand@linux.microsoft.com,
        linux-media@vger.kernel.org, kieran.bingham@ideasonboard.com,
        linux-kernel@vger.kernel.org, kitakar@gmail.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        mchehab@kernel.org, davem@davemloft.net, tian.shu.qiu@intel.com,
        yong.zhi@intel.com
Subject: Re: [RFC PATCH] Add bridge driver to connect sensors to CIO2 device
 via software nodes on ACPI platforms
Message-ID: <20200917101538.GO4282@kadam>
References: <20200916213618.8003-1-djrscally@gmail.com>
 <20200917075356.GA3333802@kroah.com>
 <d97fb93f-5258-b654-3063-863e81ae7298@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d97fb93f-5258-b654-3063-863e81ae7298@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009170077
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009170077
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 17, 2020 at 10:47:50AM +0100, Dan Scally wrote:
> Hi Greg - thanks for the comments, appreciate it (sorry there's so many,
> I'm new to both C and kernel work)

It's pretty impressive work if you're new to C...

> >
> >> +			return;
> > No error value?
> The prototype for sync_state callbacks is to return void, so my
> understanding is it can't return an error value.  I guess a better thing
> to do might be call another function performing cleanup and unloading
> the driver before the return or something along those lines though.

Yeah.  I suspect you should be using a different callback instead of
->sync_state() but I don't know what... :/

regards,
dan carpenter

