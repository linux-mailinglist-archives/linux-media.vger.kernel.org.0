Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0F239DEBB
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 16:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbhFGOav (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 10:30:51 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:41368 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbhFGOav (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Jun 2021 10:30:51 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 157EBPic130318;
        Mon, 7 Jun 2021 14:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=F1YzfAEZX9/5x9xJ6kvArkhlaae95zJ3bBLE30ajF5s=;
 b=lY285pPFOg+p6M6tTsJGN9HxUuJAQJhL67TVZE+AEukVjeVQNE7gWlafnYOBQk5LH1jm
 xEDibYi8LeX0/Lt0/ktiQdWslWxxpY6NzIKbiYmNnqcXhEAWf9nWBJY6/ysz5e9zUKlk
 PHkGrv7DGYxvFxJFmDZpzczElqbgaKb1A1CCZiny3+nu0SoAmj9uXSk4gHkrAN1Q08h8
 qo+jx782PhiM+RHQs2POYcw/fhFZmvxMFe5BDE/bIedKttdPhkiN+RBDC2hA1Lunk4rL
 QzPoRFLvLsY1cBnmWOIXnnNWwGC936Dczpxv8w/mkn1km2vlxq8g0b/glImZ7NCwmcZE Ng== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 3900ps37rt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 14:28:36 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 157EAo4T071460;
        Mon, 7 Jun 2021 14:28:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38yyaa4wud-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 14:28:36 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 157ESZgG127099;
        Mon, 7 Jun 2021 14:28:35 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 38yyaa4wu2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 14:28:35 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 157ESXWJ006837;
        Mon, 7 Jun 2021 14:28:33 GMT
Received: from kadam (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 07 Jun 2021 14:28:32 +0000
Date:   Mon, 7 Jun 2021 17:28:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Yang Yanchao <yangyanchao6@huawei.com>
Cc:     linux-distros@vs.openwall.org, linux-media@vger.kernel.org,
        linux1394-devel@lists.sourceforge.net, mchehab@kernel.org,
        security@kernel.org
Subject: Re: [PATCH] media firewire firedtv-avc fix a buffer overflow in
 avc_ca_pmt()
Message-ID: <20210607142825.GH10983@kadam>
References: <20210607073900.1298-1-yangyanchao6@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607073900.1298-1-yangyanchao6@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: yOn1oklaH1u6TQ3FLHZuISmk545-GmEV
X-Proofpoint-ORIG-GUID: yOn1oklaH1u6TQ3FLHZuISmk545-GmEV
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10008 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 clxscore=1011
 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106070105
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for resending this patch, but you need to preserve the author
and Reported-by tags.

https://lore.kernel.org/linux-media/YHaulytonFcW+lyZ@mwanda/

You changed the check in fdtv_ca_pmt() but I don't understand why you
did that...  But looking at it again, I think neither of us was correct,
instead of "sizeof(msg->msg) - 4" it should be "- data_pos":

	if (data_length > sizeof(msg->msg) - data_pos)
		return -EINVAL;

I will resend a v2.

regards,
dan carpenter

