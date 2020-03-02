Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6021E17552F
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2020 09:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbgCBIFM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 03:05:12 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:33908 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbgCBIFM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 03:05:12 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0227wOOb149101;
        Mon, 2 Mar 2020 08:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=xo9yVA9MFeivUjBm7ee0vURjQ/8/4ytOphKAYNZ/MC4=;
 b=ngNzwZJIAm8hXx+y2m3F1lQghdAR+vCrzjpXcbHgn9w9DOcXCJUx38zWkeSq/9ubBu2Q
 IqKP2pZ6emZXoxwPWoRAzlSfyuUY2E4XPR7/dv3YHwDK0SSWH2FoOYfXZjUegzCunk2T
 kRLzxVkoTwavOFRzw0+iupBU3oxkyooK76s6yfOZLOVRCIL/g8X1keqL1ZXgka6pY1Se
 uirI9FS2/hRTSGw6dioRrcY5GJJv3NR4MW4U57z5Ccs+GdtLbApfwdGsnnKO9wSvqlcK
 dpGGI0igyH5mbo8pnvsxbwVOcPkvhViiA+hgBj8pjPNpesOD3i9ukOrX6OXcW6WyemeT aQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 2yffwqe1r7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Mar 2020 08:05:06 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0227uvHh112305;
        Mon, 2 Mar 2020 08:05:06 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2yg1gugu13-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Mar 2020 08:05:06 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 022855sT009362;
        Mon, 2 Mar 2020 08:05:05 GMT
Received: from kadam (/41.210.147.242)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 02 Mar 2020 00:05:04 -0800
Date:   Mon, 2 Mar 2020 11:04:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v1] media: staging: tegra-vde: Use
 devm_platform_ioremap_resource_byname()
Message-ID: <20200302080456.GD4140@kadam>
References: <20200227180915.9541-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227180915.9541-1-digetx@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9547 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020060
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9547 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 phishscore=0 clxscore=1011 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003020060
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 27, 2020 at 09:09:15PM +0300, Dmitry Osipenko wrote:
> This helps to make code cleaner a tad.

Please don't start the commit message in the middle of a sentence.
It looks like this for some of us:

https://marc.info/?l=linux-driver-devel&m=158282701430176&w=2

I generally read the subject or the full commit message but seldom
both.

Otherwise the patch looks very good.

regards,
dan carpenter
