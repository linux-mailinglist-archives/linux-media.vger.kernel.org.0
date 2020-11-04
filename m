Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4882A5FA7
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 09:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbgKDIbv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 03:31:51 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:40280 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbgKDIbv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 03:31:51 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A48TlMT174602;
        Wed, 4 Nov 2020 08:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=wOQLF+xJ/7VE4Y0fP7RL7N20/n8UEBSylhe1dmfPQBE=;
 b=m5Al1zUVRnT6KE5dIjwYeLPDlAtF6pphW3zZkSzdDDGL7ZdBTbd+FntZaNEku9lfqpxj
 LTJ6d3Qk56+NPDcl2RAd/nRUxll38d4EaUTxZO8Yfh6PHlQzvpCNJD5FGkzLRc5tc+RA
 Igvl8PdHVOaDd2FzoQMKAdVC6oRlm1zNJXQ3HgQeYFl024q/ao7TD99I1DazqaiZTpDo
 VRRivO4PoAG65qohV2/tJKRvHXMpiv2QX8d/av2gea6tWbHmTDJMXY+22orQxnqV9osW
 z/Y9Bu0pPXCOStImjiLST/coHbW1Mrhu10as0jwzevYXQPkqS3aUjqHiamZsrcJ+71/m iw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 34hhvcdfxa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 04 Nov 2020 08:31:36 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A48OjVt006745;
        Wed, 4 Nov 2020 08:31:35 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 34hw0f0uhx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Nov 2020 08:31:35 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0A48VWeN026301;
        Wed, 4 Nov 2020 08:31:32 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 04 Nov 2020 00:31:31 -0800
Date:   Wed, 4 Nov 2020 11:31:21 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Souptick Joarder <jrdr.linux@gmail.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Daniel Jordan <daniel.m.jordan@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Ira Weiny <ira.weiny@intel.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michel Lespinasse <walken@google.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v2] media: atomisp: Fix error handling path
Message-ID: <20201104083121.GG18329@kadam>
References: <1604455331-28031-1-git-send-email-jrdr.linux@gmail.com>
 <65712450-1ee9-2dd3-cd43-f850807ae203@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65712450-1ee9-2dd3-cd43-f850807ae203@web.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9794 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011040062
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9794 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011040062
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 04, 2020 at 08:15:58AM +0100, Markus Elfring wrote:
> > Fixes: 14a638ab96c5 ("media: atomisp: use pin_user_pages() for memory
> > allocation")
> 
> Please delete a line break for this tag.

Markus, the thing is that we all saw the line break and we just thought
it didn't matter at all...

regards,
dan carpenter
