Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0FB2DE0DD
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 11:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388786AbgLRKT1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 05:19:27 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:40444 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388755AbgLRKT1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 05:19:27 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BIA9mt9017895;
        Fri, 18 Dec 2020 10:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=kKbiZHacAsLci0AQxcwE6GVgwg7HLb2l0eiJcFvmhcA=;
 b=Iaw7mvIW8nvXU57mW4jUzor+VqI1PUxORrgFqPLyy/CJGbSi+rhyb92D2RctjmlKMy47
 9ovXsNr6Yeh7bXJeT3ryuete9UzrZHNJSXIM/3mL/zvd/PDXONblWOzXu4VRAcFwqYkL
 MHF89qJ4dWWgGfKS+Ot/WxtoQjBCCcfEr3nglTIWYVAu+fnWlAu/2xHJnAU7HDY8wvk5
 99yCg8ggXwz26qjRGLe1wBLn7FMviSF2LA/nZmd2BY3sC+p3ns10Aa4L8aSZ9/xbbLIQ
 JQeLo6erXRcOPcz/TCxFPKWOaJGWbNBFcbVKtpBYfBQMTNzUoen3cF+H5/0WukMoYCBe YQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 35ckcbsuwc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Dec 2020 10:18:41 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BIAFKQ8183075;
        Fri, 18 Dec 2020 10:16:40 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 35g3rfytn2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Dec 2020 10:16:40 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BIAGdS7009208;
        Fri, 18 Dec 2020 10:16:39 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 18 Dec 2020 02:16:38 -0800
Date:   Fri, 18 Dec 2020 13:16:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Nigel Christian <nigel.l.christian@gmail.com>
Cc:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, gustavoars@kernel.org,
        linux-media@vger.kernel.org, trivial@kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: cec: fix trivial style warnings
Message-ID: <20201218101630.GM2831@kadam>
References: <20201218063117.GA80700@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201218063117.GA80700@fedora>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180075
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012180074
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 18, 2020 at 01:31:17AM -0500, Nigel Christian wrote:
> Comment has 'then' repeated twice. Let's clean it up.
> Use unsigned int to maintain naming consistency.
> 

Do you use a tool to find the double "then then"?

regards,
dan carpenter

