Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB5226371B
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 22:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgIIUHZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 16:07:25 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:36982 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727055AbgIIUHH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Sep 2020 16:07:07 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 089K0VEN064584;
        Wed, 9 Sep 2020 20:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=4fIHZo7kla+jpKFYIjRot223Usuv7Tlceok1GZMsMRM=;
 b=DASL1Xano1yoVJYBqgYgfKew8/2gtYS4ofAqK7VLC22+DPsbGqtlR8bLHRfKjr1HGHeC
 EsqXwSPED9kvu1OfMoKj/DaC+jjirfG0Iwl2dGnzyj7aEoWEWZULmJxWfEfOYqzyPfI6
 diURE//T8aDgLBxQjGA8T0kGz6ctVbLxFYNFvLUoxyWgOeh8kfswHsarlVltnBsvSLxB
 jjWyxONEdyMUDJNq18Zm9FnPO6o5sSvrW8j+1jcvpe+3/Ep74HzQjXfjaS7qwK9NGlRd
 I9EjUbucs4Bkwf5Tu0wf3aSwwHP3H2L4kjnsOZqZcvYLsR+U3t7igPgQm5+I9CZ49NqA +A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 33c2mm41yb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 09 Sep 2020 20:07:01 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 089K6PS2151930;
        Wed, 9 Sep 2020 20:07:00 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 33cmkyfh1e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Sep 2020 20:07:00 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 089K6wEd004866;
        Wed, 9 Sep 2020 20:06:58 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 09 Sep 2020 13:06:58 -0700
Date:   Wed, 9 Sep 2020 23:06:51 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alex Dewar <alex.dewar90@gmail.com>
Cc:     devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: Use kvfree_sensitive in a few
 places
Message-ID: <20200909200651.GB12635@kadam>
References: <20200909195403.225084-1-alex.dewar90@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909195403.225084-1-alex.dewar90@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9739 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=2
 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009090179
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9739 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 suspectscore=2 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009090178
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 09, 2020 at 08:53:50PM +0100, Alex Dewar wrote:
> In the file pci/sh_css_params.c, there are a number of places where
> memset+kvfree is used, where kvfree_sensitive could be used instead. Fix
> these occurrences.

This doesn't say *why* the commit is doing it.  There are two reasons:
The worry with these is that the compiler could optimize away the memset
because it sees the kfree().  Second using kvfree_sensitive() is more
clear and readable.

> 
> Issue identified with Coccinelle.
> 
> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
> ---
>  .../staging/media/atomisp/pci/sh_css_params.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index 2c67c23b3700..d1b5d6608d52 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -4378,8 +4378,7 @@ ia_css_3a_statistics_free(struct ia_css_3a_statistics *me)
>  	if (me) {
>  		kvfree(me->rgby_data);
>  		kvfree(me->data);
> -		memset(me, 0, sizeof(struct ia_css_3a_statistics));
> -		kvfree(me);
> +		kvfree_sensitive(me, sizeof(struct ia_css_3a_statistics));

I don't think ia_css_3a_statistics are sensitive at all.  What we're
trying to protect are things like passwords.  Just delete the memset.

Looking below, I don't think any of these are sensitive so just delete
all the memsets.

regards,
dan carpenter

