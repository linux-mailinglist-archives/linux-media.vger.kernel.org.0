Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65361DCC03
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 13:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbgEULV6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 07:21:58 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:53948 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728887AbgEULV6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 07:21:58 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04LBLoa1142341;
        Thu, 21 May 2020 11:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=zDxy18VJXMKyiEMNyaTfSbB5Ym8PfYq9SfswI99nuIA=;
 b=c8xNMDVGL5RMNeM39+tJAoMXk61kOfDm6zMxA/j0tZsCRqNUtiMH6D2UTI9ClNeGryYv
 k9YoOQB7CerLJnfoiPsdAn0gfS5pG8zYqIr5EUlbi5ueeL/dHlp/GBwETFklSIfV9pJ+
 dbu+meo1r0gD7QeJ5pA+ASByn/dZnCJRWBpnSPhrLsA0/Gf/4AHwlJVzJZIpEYyeUXY1
 4lFat/mZ6aE9ZhVmXAjJRU+qLrhKcnBw7lrDLYtwIQ8xE/jRI8vY6ldQVO8pZYRaipKY
 HHlIb94xydQH35jtGhh84yHPN1QgaYEamAg/3Na9Wkt1POoN2dOeBmSNIw7o+pxHcB0I iQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 31284m7y7h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 21 May 2020 11:21:50 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04LBDFVv176434;
        Thu, 21 May 2020 11:21:46 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 3150226mmf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 May 2020 11:21:46 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04LBLdYS005721;
        Thu, 21 May 2020 11:21:39 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 21 May 2020 04:21:39 -0700
Date:   Thu, 21 May 2020 14:21:31 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     kjlu@umn.edu, devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] [v2] media: staging: tegra-vde: fix runtime pm imbalance
 on error
Message-ID: <20200521112131.GG30374@kadam>
References: <20200521062746.6656-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521062746.6656-1-dinghao.liu@zju.edu.cn>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9627 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 suspectscore=18 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005210084
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9627 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=18 mlxscore=0
 cotscore=-2147483648 impostorscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005210085
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 21, 2020 at 02:27:45PM +0800, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> the call returns an error code. Thus a pairing decrement is needed
> on the error handling path to keep the counter balanced.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>

Let's stop working around the bug in pm_runtime_get_sync() and write
a replacement for it instead.

regards,
dan carpenter

