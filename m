Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3496D19A9E5
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2020 13:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732232AbgDALBQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 07:01:16 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:60672 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732026AbgDALBP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Apr 2020 07:01:15 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 031Aqijs155882;
        Wed, 1 Apr 2020 11:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=k/zLhrZsADjqzq+3QwgvoWL1MmcxznVBM92vxIE2puw=;
 b=ONdjM18avmW5dE+LLNFwYJoAAf8ZcTTxtrswiZj9Chf4Ukg35sdE5LaQNyZPIdnF57su
 rNKvBN5B8oAGEUdJBq6uMPAyIVRYctUKe+0FKp7+7y/tFbqasY/4kTGVUJKvY2yHN9j1
 DozpO8Yibrjf7wtChKBzlmYDAipeGswqfWSUMN2qQuUwtppVwbg3mft5tX5fQimrTV1I
 Hzl6BEm73VTbikMd7HxqnIabVego5iqh4N/YbE0oPL0pjj5FFAw2/8ilVAQrRGjreYAv
 1Vuek17GiklF0NZBBKNvbUMVAyhDY12/j938imRsUalvfbg0PRDnkQvrExOJvQb6Ozll Kg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 303aqhn75f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 01 Apr 2020 11:00:18 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 031Ar08g045201;
        Wed, 1 Apr 2020 11:00:18 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 304sjk0hsg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 01 Apr 2020 11:00:17 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 031B07RP031187;
        Wed, 1 Apr 2020 11:00:07 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 01 Apr 2020 04:00:06 -0700
Date:   Wed, 1 Apr 2020 13:59:49 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Helen Koike <helen.koike@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Michal Simek <michal.simek@xilinx.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pavel Machek <pavel@ucw.cz>, devel@driverdev.osuosl.org,
        linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Yong Deng <yong.deng@magewell.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Heungjun Kim <riverful.kim@samsung.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 0/4] media Kconfig reorg - part 2
Message-ID: <20200401105949.GB2001@kadam>
References: <cover.1585151701.git.mchehab+huawei@kernel.org>
 <6fadc6ea-8512-03ba-da30-43c64d7562f6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fadc6ea-8512-03ba-da30-43c64d7562f6@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9577 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 phishscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004010100
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9577 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004010100
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 25, 2020 at 04:36:31PM -0300, Helen Koike wrote:
> Hello,
> 
> On 3/25/20 1:03 PM, Mauro Carvalho Chehab wrote:
> > That's the second part of media Kconfig changes. The entire series is
> > at:
> > 
> > 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=media-kconfig
> 
> I made a quick experiment (using this branch) with someone who works
> with the kernel for his master degree, but doesn't have much experience in kernel development in general.
> I asked him to enable Vimc (from default configs, where multimedia starts disabled).

The whole config system is really outdated.

It should be that this task was done with a command like "kconfig enable
vimc".  It would ask necessary questions and pull in the dependencies
automatically.

Twenty years ago it made sense to go through the menus and select things
one by one.  Does anyone really start from defconfig any more?  Surely
everyone starts with a known working config and just enables specific
options.

I started to hack together some code to create a kconfig program to
enable and disable options.  The problem is that all library code
assumes we want to display menus so it was a lot of work and I gave up.

regards,
dan carpenter

