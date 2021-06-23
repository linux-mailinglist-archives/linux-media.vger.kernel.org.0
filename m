Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 557023B1669
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 11:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbhFWJGA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 05:06:00 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:4664 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229920AbhFWJF7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 05:05:59 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15N8vkM4005340;
        Wed, 23 Jun 2021 09:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Cv+cJ7tElo4uSdvfpY16g0h7xDbBKSgZE6SdRDxGKQY=;
 b=jJAU9IBpWq7k99m/KirvW79yjuLO7Damjz/KiI+feYbiJyrAmrECI9MC06Ib7QUtObxQ
 Se7OOl8edhG0xgWqvbpONS+Tq6AIHuULFcsNhTGNb4/iAENEZ2mRnXbYnRQuFS32WUWJ
 wu/7K+L7LN4Zc2ISoHy8iun602E8qjTh7/1fM6puVa8YcFpv0P8R+Caw9iqTe6a9275K
 TlxQJIpWoKCzTVweKjBpVOhs6CoC3sdMq1azG4RCHCZyAgDx6qD3DtCi6Vz/AMZ8k++L
 /XCHk64IiSRWUbXsPIfSl0x0UTdooZ60hkhuO02NguyOcXjK4nSn97Bo2f6Z+YyKikV/ Tw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 39ap66ndfw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 23 Jun 2021 09:03:37 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15N8thi4085178;
        Wed, 23 Jun 2021 09:03:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 3996meuyug-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 23 Jun 2021 09:03:37 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15N8xv4s100500;
        Wed, 23 Jun 2021 09:03:36 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 3996meuytn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 23 Jun 2021 09:03:36 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15N93XH0017632;
        Wed, 23 Jun 2021 09:03:33 GMT
Received: from kadam (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 23 Jun 2021 09:03:32 +0000
Date:   Wed, 23 Jun 2021 12:03:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: fix some NULL vs IS_ERR() checks
Message-ID: <20210623090325.GA2116@kadam>
References: <YNH0WU7BcQ/60UNG@mwanda>
 <YNH87qd4eJOR296R@pendragon.ideasonboard.com>
 <20210622155858.GN1861@kadam>
 <YNKdqFNSrSBXVNqo@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNKdqFNSrSBXVNqo@pendragon.ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: I7aKClS1vRGlNSeVEBx9mrKH_DDUNGnO
X-Proofpoint-GUID: I7aKClS1vRGlNSeVEBx9mrKH_DDUNGnO
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 23, 2021 at 05:34:16AM +0300, Laurent Pinchart wrote:
> 
> Do you think an annotation could still help, by making it explicit in
> headers whether a function returns NULL or an error pointer, thus
> helping developers get it right in the first place ?

Not really.  It wouldn't help with Smatch.  I really think error pointer
bugs are handled pretty well currently.  Sometimes I have seen syzbot
find them before the static checkers but I don't see them affecting
users and production kernels.

There are few other things that Smatch looks for like passing positives,
valid pointers or NULLs to PTR_ERR().  I do wish that when functions
return a mix of negative error codes, 0 and 1 that they had comment
explaining what the 1 means.

regards,
dan carpenter
