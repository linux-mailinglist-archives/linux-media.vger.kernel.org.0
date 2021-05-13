Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 150C037F391
	for <lists+linux-media@lfdr.de>; Thu, 13 May 2021 09:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbhEMHa6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 May 2021 03:30:58 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:50570 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230151AbhEMHa5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 May 2021 03:30:57 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14D7TBi9001885;
        Thu, 13 May 2021 07:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=BHtquug1M2yss+hf9/2dufpqsD0fg1DEG+oMbnK3C7k=;
 b=u2C8k7asiBxK8ZLCcE8J7Fk3KQ6v/kZnQawrtf8WGPrRc4IjRPMmBn2x6Dt9DIqlYujT
 C4d2QpSDEe70o8aao/ImQNesLK+5CadFCHUfcr0gKHOPhnCOGArrbGw2bZOSH020KL4N
 cBIvjEbNDT3uEVNmH4VPnCvKPjoLoWaTR+rRWSjyeMuqhdCHDLh45oorG22D8GJEF0qb
 1zEeat5i7GrCWASdvfmyHiEvey9YSFoaXFJJyjblTOMAbsl1v5qHNNrwSW6NUiOBE1GT
 wvE/k1zBYrT2myYu8cv+gYbyvr8H0Ii/6Y+jHEqbhtio0rVtNhlvqY4KOmJapAeu3A5Y fg== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 38gpphr5me-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 13 May 2021 07:29:46 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14D7Tjtl120368;
        Thu, 13 May 2021 07:29:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38gpq1pmnv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 13 May 2021 07:29:45 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14D7Titd120317;
        Thu, 13 May 2021 07:29:44 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 38gpq1pmkx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 13 May 2021 07:29:44 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14D7TcOL003657;
        Thu, 13 May 2021 07:29:38 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 13 May 2021 00:29:37 -0700
Date:   Thu, 13 May 2021 10:29:31 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        hverkuil-cisco@xs4all.nl
Subject: Re: [bug report] media: tuners: fix error return code of
 hybrid_tuner_request_state()
Message-ID: <20210513072931.GF1922@kadam>
References: <YJvgLgZAEo5NtM2x@mwanda>
 <20210512141612.GA1922@kadam>
 <ec6ac4ef-057f-22a2-f2be-1773b2c50c8e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec6ac4ef-057f-22a2-f2be-1773b2c50c8e@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: mBLobE7ziw8-pLMoecMQzyg42BbyCaIb
X-Proofpoint-GUID: mBLobE7ziw8-pLMoecMQzyg42BbyCaIb
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 13, 2021 at 10:20:08AM +0800, Jia-Ju Bai wrote:
> Hi Dan,
> 
> Thanks for your report.
> I check the code again, and find that returning zero should indicate an
> error here.
> Good catch of Smatch :)
> 
> Sorry for my mistake in my patch...
> Please revert the incorrect change caused by my patch b9302fa7ed97.

I don't think Mauro and Hans are necessarily going to see this.  Please
send a proper patch that they can apply.  :P

regards,
dan carpenter

