Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3133BB47DA
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 09:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387893AbfIQHGa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 03:06:30 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:42342 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729435AbfIQHGa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 03:06:30 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8H73aOt035717;
        Tue, 17 Sep 2019 07:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2019-08-05;
 bh=7QhAkMI4cl6/WKzcvw9yI0WzPjEboA+uQ/aBhBvqx74=;
 b=k3tUrERoWFBT7q1Z0EVM7kLDCi2XWumayWbg3bDHA1YCdwaDWiMgp+iRHH6qBp0sM8TB
 rhC5do/CzgSkcdMvu0tZGOkkgY/Zej8q/L6QK1npHem5YQaaX1dabfeL9kI2lGCZqFZC
 9j1CGS9WmJw/zCF1wOV+eIj4mIdOZEMhkg6pTk6Wt7ZG3GbjCshcICVNh6/RGipA0Or0
 RSiLFvArosDc3Cqafd/2TDaSBkc9ttM0GgyLZjDVITDgzYXyFWMYthNj/U1Ys134HYIv
 we/eV5AJBIakccAxyJmNiJzZKGC1hJd3oai8YaseaS4blAi4jSfKlKMzUKW6DUMs3/GV Pg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 2v0r5pc5pd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 17 Sep 2019 07:06:25 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8H734qo125154;
        Tue, 17 Sep 2019 07:06:25 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 2v2tms8kta-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 17 Sep 2019 07:06:25 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8H76Nas016426;
        Tue, 17 Sep 2019 07:06:23 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 17 Sep 2019 00:06:22 -0700
Date:   Tue, 17 Sep 2019 10:06:13 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Maxime Ripard <mripard@kernel.org>, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: v4l: cadence: Fix how unsued lanes are handled in
 'csi2rx_start()'
Message-ID: <20190917070613.GA2959@kadam>
References: <20190912204450.17625-1-christophe.jaillet@wanadoo.fr>
 <20190913075709.t35ggip624tybd6l@localhost.localdomain>
 <20190916062846.GD18977@kadam>
 <f67787da-dc1c-3e05-c1e2-e8737641dfd0@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f67787da-dc1c-3e05-c1e2-e8737641dfd0@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9382 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=872
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909170077
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9382 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=942 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909170077
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Sep 16, 2019 at 09:24:26PM +0200, Christophe JAILLET wrote:
> Le 16/09/2019 à 08:28, Dan Carpenter a écrit :
> > On Fri, Sep 13, 2019 at 09:57:09AM +0200, Maxime Ripard wrote:
> > > Hi Christophe,
> > > 
> > > On Thu, Sep 12, 2019 at 10:44:50PM +0200, Christophe JAILLET wrote:
> > > > The 2nd parameter of 'find_first_zero_bit()' is a number of bits, not of
> > > > bytes. So use 'BITS_PER_LONG' instead of 'sizeof(lanes_used)'.
> > > > 
> > > > Fixes: 1fc3b37f34f6 ("media: v4l: cadence: Add Cadence MIPI-CSI2 RX driver")
> > > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > > ---
> > > > This patch is purely speculative. Using BITS_PER_LONG looks logical to me,
> > > > but I'm not 100% sure that it is what is expected here. 'csi2rx->max_lanes'
> > > > could also be a good candidate.
> > > Yeah, csi2rx->max_lanes would make more sense in that context. Could
> > > you resend a new version?
> > This is sort of unrelated, but for Smatch purposes the csi2rx->max_lanes
> > comes from the firmware in csi2rx_parse_dt() and it could be any u8
> > value.
> 
> Hi Dan,
> 
> not sure to follow you.
> 
> csi2rx_probe()
>   --> csi2rx_get_resources()
>      -->  ...
>           dev_cfg = readl(csi2rx->base + CSI2RX_DEVICE_CFG_REG);
>           ...
>           csi2rx->max_lanes = dev_cfg & 7;
>           if (csi2rx->max_lanes > CSI2RX_LANES_MAX) {
>              dev_err(&pdev->dev, "Invalid number of lanes: %u\n",
>                      csi2rx->max_lanes);
>              return -EINVAL;
>           }
> 
> So I guess, that we can trust max_lanes because of the 'if (... >
> CSI2RX_LANES_MAX)' check.
> 
> Did I miss something?

Ugh...  I was looking at ->num_lanes and I was also just totally wrong.
Smatch parses that badly.  Smatch actually parses ->max_lanes correctly
though so that's ok.

Sorry for the noise on this.

regards,
dan carpenter

