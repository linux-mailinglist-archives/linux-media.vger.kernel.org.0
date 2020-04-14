Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7061A76C4
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 11:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437285AbgDNI75 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 04:59:57 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:44130 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437267AbgDNI7s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 04:59:48 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03E8xSgo128474;
        Tue, 14 Apr 2020 08:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=EAe3usIbEQ4RwyhgiOl8ipkDOmr+UhDbllqJssxsJA4=;
 b=BIPGHUNsuFgB3JQzsbTIgWJmpoo6l+Ti18XZzCJK2OwznVScJXmo8t5IrEjN4R4mIZs5
 RsPDUi7RnbAsdwhMc3RAHJ0CCT/RxbVRYU7zzR9NlnrL1GN9MPuWRSljNI5hAJQr5w9a
 BxQYVplIcC2pAR1lJbHYlK9ZG5UNbhrsZdunZSjyOF2Es1vzUcYqCBoaZapcD7XE0pFt
 JsWX8rkaeYhwtbSwTSMqUgS160A/HnX9CfR2rNqLTpaQckaxsGGG7VhTRHadcvkucgH/
 LXtmABBJXq/1txgpEYNyvyFhmdSjsf8euZeDaDoyrBdnHoCU9gkYakEJqi4CPrlt36/e 2w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 30b6hpk69e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Apr 2020 08:59:43 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03E8v50K164561;
        Tue, 14 Apr 2020 08:59:42 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 30cta9mtp4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Apr 2020 08:59:42 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03E8xeg2025462;
        Tue, 14 Apr 2020 08:59:40 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 14 Apr 2020 01:59:39 -0700
Date:   Tue, 14 Apr 2020 11:59:22 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Colin King <colin.king@canonical.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: mantis: remove redundant assignment to variable
 err
Message-ID: <20200414085922.GA1163@kadam>
References: <20200410113913.14430-1-colin.king@canonical.com>
 <CAAEAJfCQaCCoShLPTA+EWUhMXdF6bKAxcOCj2SR5nPXMmk7LQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfCQaCCoShLPTA+EWUhMXdF6bKAxcOCj2SR5nPXMmk7LQg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9590 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004140075
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9590 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 clxscore=1011 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004140075
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 11, 2020 at 07:53:51PM -0300, Ezequiel Garcia wrote:
> There's a redundant err assignment right below here,
> which you can also get rid of:
> 
> -       err = mantis_frontend_power(mantis, POWER_ON);
> +       mantis_frontend_power(mantis, POWER_ON);
> 
> I can't test this, but calling mantis_frontend_power twice
> is possibly redundant.

To me that code really looks like a hack-around for flakey hardware and
I would be afraid to delete it.  But the "err =" could be removed.

> 
> Also, what's the gain from this cleanup? The driver is super
> old, and it seems any modern compiler would be oblivious
> of the redundant assignment.

Eventually we would like to enable that warning by default but there are
still thousands of pointless assignments so it will take years of
small fixes like this.  Generally cleaning up warnings is good.

regards,
dan carpenter

