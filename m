Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B40E34738F
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 09:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233671AbhCXIWX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 04:22:23 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:60578 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233850AbhCXIVl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 04:21:41 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12O8KlL6013728;
        Wed, 24 Mar 2021 08:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Apl7iBU+rkoAZbuqIafD2/G0po9c8kIFgEDAuBoBx9Y=;
 b=vj9JHeGzgCZLEkvspzvbVoHBN4Pkz1I4YljQPvE2qm1gR8tfrCDHDwnMF+072pkx+xvM
 sZVibBPZ/Q2L+cP7C+GMpbLD/7k6TeGEFb9HRAxoHoHvTAm5Jne4LsTEhuFC0EhGDLxX
 oDtWx0vDQaqe5I+Qo4cH7Rxia9858OCy8OcFys5mzV2K5Hg2hE88S6QEUo1lB3P7WVz9
 OzafDIsdjyUC8XHgwjSbQwSOLpcb+0X5oSAJRkPXqe9lidaL1sslKFqMiTesouEZcNj6
 A9quh2I8UNj6EU4gQX5QuYX6jjjeMALo4U8vC7H2ocKRGB0aAk4MnNfDjLzJ3f9az3Py qQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 37d9pn1rue-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 24 Mar 2021 08:21:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12O8LAQR110096;
        Wed, 24 Mar 2021 08:21:15 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 37dtmqht7e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 24 Mar 2021 08:21:15 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12O8L37j007580;
        Wed, 24 Mar 2021 08:21:03 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 24 Mar 2021 08:21:03 +0000
Date:   Wed, 24 Mar 2021 11:20:55 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     caizhichao <tomstomsczc@163.com>
Cc:     mchehab@kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
        Zhichao Cai <caizhichao@yulong.com>
Subject: Re: [PATCH] drivers:staging: Simplify the if condition
Message-ID: <20210324082055.GL1717@kadam>
References: <20210324054535.1716-1-tomstomsczc@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324054535.1716-1-tomstomsczc@163.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9932 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240065
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9932 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=989 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 clxscore=1011 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240065
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 24, 2021 at 01:45:35PM +0800, caizhichao wrote:
> From: Zhichao Cai <caizhichao@yulong.com>
> 
> Fixes coccicheck warning:
> drivers/staging/media/atomisp/pci/sh_css_params.c:4652:24-26: WARNING !A || A && B is equivalent to !A || B
> 

Thanks, but someone already did this.  Please work against linux-next.

regards,
dan carpenter


