Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74BE2257AC0
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 15:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgHaNqu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 09:46:50 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:36698 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbgHaNqS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 09:46:18 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07VDipvu082687;
        Mon, 31 Aug 2020 13:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=7XrKIEjokhT39cb4dngP7JBKkU6deHs5tXu4INGwQow=;
 b=KCWN1aD6eukPdtoLctc1Q+Pj9jHE4tn5AxjXIZSjwNIri2p36JYknCZKOAZZX6X5eYSt
 YO7hJNcpfmu0PPyoXxYLxLHduULiUT/3enzYamN2zuy4IUBGYybSc1j4sxRbtTKVoAnk
 NHVqlg6PikYRGwaPcgxVEZ43WNLuuu+jHJZe+2f4oYbAuWqv2hOE7Rd4X8SrJjKfqT5E
 0SbB4/lcJf9F+tGHxhVPPUVbn5AtN0+PDLZdjBLXIaa1uuWOtp0gMwq7el4379tIATe6
 asOJoFeEdPdkN28+QP8qbzxWZBrG8MtGhK2tu/FVhHunzK+e8Fophjj1ggIBYc5b0fr1 wg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 337eeqpb97-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 31 Aug 2020 13:46:06 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07VDjA0q158834;
        Mon, 31 Aug 2020 13:46:05 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 3380kknhsk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 31 Aug 2020 13:46:05 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07VDk4i7003609;
        Mon, 31 Aug 2020 13:46:04 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 31 Aug 2020 06:46:04 -0700
Date:   Mon, 31 Aug 2020 16:45:57 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Cengiz Can <cengiz@kernel.wtf>
Cc:     devel@driverdev.osuosl.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] staging: atomisp: Fix fallthrough keyword warning
Message-ID: <20200831134557.GW8299@kadam>
References: <20200831133011.91258-1-cengiz@kernel.wtf>
 <20200831134021.GV8299@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200831134021.GV8299@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9729 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008310080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9729 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008310080
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Really I think this function is pretty buggy.  It shouldn't be falling
through at all...  I reported it a couple days back so it's possible
that someone is working on a fix already.

regards,
dan carpenter

