Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE5E582A1
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 14:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfF0Mam (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 08:30:42 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:52838 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbfF0Mal (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 08:30:41 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5RCOK1m031962;
        Thu, 27 Jun 2019 12:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=ipk8d5AQ/zqe9jL5wZSKQYUV3pOPXWHuiuA2nj7XOY8=;
 b=n8itDAK18wwSXLo4BzgEMFFBDuG9OQsmUhltNoZycuwPKS7JEuWwU0aXjBdqlsYKgXeH
 dcgkVqIiBE6ODSLiPNQXRk3rIKgtV46NaQ8AhQpzC/fRadCppaRrcjbtbuwh1wRLXYom
 SnxPjdpQXYSR6kVHq27LHetl1q9Ps7GVT1LS3hxA8r8WvXZgNRlz/V6zCNug2UceGzkS
 uEmBwTe9MLpXlM58WfLodm6iPrBVKHtL7D6zMYvQwHZAvQwZTOKVS1YECgdUET9X/gVl
 w9l8bnNqVHX393ogPgNwjEZ6wwhIL6PoaR+S48FUziqk0+HqTO1wkqQyZpEr3tal3vti 3w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 2t9c9q00y6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jun 2019 12:30:18 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5RCTViM163917;
        Thu, 27 Jun 2019 12:30:17 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2tat7dbggj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jun 2019 12:30:17 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5RCUFHQ016380;
        Thu, 27 Jun 2019 12:30:15 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 27 Jun 2019 05:30:14 -0700
Date:   Thu, 27 Jun 2019 15:30:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Lukas Schneider <lukas.s.schneider@fau.de>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl, st5pub@yandex.ru,
        gabrielfanelli61@gmail.com, code@wizofe.uk,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, Jannik Moritz <jannik.moritz@fau.de>,
        linux-kernel@i4.cs.fau.de
Subject: Re: [PATCH] media: bcm2048: Macros with complex values should be
 enclosed in parentheses
Message-ID: <20190627123006.GC19015@kadam>
References: <20190627121515.32029-1-lukas.s.schneider@fau.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190627121515.32029-1-lukas.s.schneider@fau.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=850
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906270147
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=902 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906270147
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This breaks the build.  :(

regards,
dan carpenter

