Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AAFC3761A4
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 10:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235235AbhEGIGK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 04:06:10 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:35836 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233730AbhEGIFs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 04:05:48 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14784Dkj146615;
        Fri, 7 May 2021 08:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=dWUlA5sa2i5VfwmmQWEutVTqdmx21jDBFgxaLD+HaLo=;
 b=X+u57bQmYKU2e+/Ox2+3IqqcNd1mK9DlixCcKTr4O6DEw71C5vGli0WjtjBM2M/iChyM
 xNelaD8ppJAb2OsSbgUO1WnIYeCbIcWwEUPO7scSDHNfdgGNC0qpwmoIqHrCLhU7gnVb
 B4/AhD9ncB6eLs+nlT+rK0F1B550anhemwlc4FucWwud8BgJ+wvgdBDp7rR6ygHXoCrh
 f4cq1F9wC+4JzXmMTPftB754gowIfkJZfvkvcY5WFvcZyGyDeG6xcdV+Os507d7ynnQf
 CB8tPqloQIKS4LXGlDLofxhMM5Y+GGuuq0qZXnm32lXwAW38T56HB4Turd4Hps/QnT/k 3A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 38ctjv0nhr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 May 2021 08:04:46 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14780Utf086033;
        Fri, 7 May 2021 08:04:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38csrsm5uy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 May 2021 08:04:46 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14784j7h113387;
        Fri, 7 May 2021 08:04:45 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 38csrsm5t1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 May 2021 08:04:45 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14784iKk023593;
        Fri, 7 May 2021 08:04:44 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 07 May 2021 01:04:43 -0700
Date:   Fri, 7 May 2021 11:04:36 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     Uladzislau Rezki <urezki@gmail.com>, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] WARNING in __vmalloc_node_range
Message-ID: <20210507080435.GF1922@kadam>
References: <000000000000fdc0be05c1a6d68f@google.com>
 <20210506142210.GA37570@pc638.lan>
 <20210506145722.GC1955@kadam>
 <20210506180053.4770f495@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506180053.4770f495@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: GXfJxJzJ6NKIhaMbUZdgfQ7X0_g3TPzK
X-Proofpoint-GUID: GXfJxJzJ6NKIhaMbUZdgfQ7X0_g3TPzK
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 mlxlogscore=989
 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070058
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 06, 2021 at 06:00:53PM +0300, Pavel Skripkin wrote:
> 
> Hi!
> 
> I've already sent the patch:
> https://patchwork.linuxtv.org/project/linux-media/patch/20210506121211.8556-1-paskripkin@gmail.com/ 
> 

Please, always add a Fixes tag.

Fixes: 4d43e13f723e ("V4L/DVB (4643): Multi-input patch for DVB-USB device")

regards,
dan carpenter

