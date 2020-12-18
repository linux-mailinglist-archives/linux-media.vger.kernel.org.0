Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3EF2DE35E
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 14:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725998AbgLRNh2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 08:37:28 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:33758 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgLRNh1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 08:37:27 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BIDUP4Y142631;
        Fri, 18 Dec 2020 13:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=jYM54C+ZwMKMcDc7U7l8Ps9NHc+uVDYjr2Hoi5PdWg4=;
 b=l8quYFXMiMEtjG9HL4hSI+QIPFXwMnCV4LDWh6Hmz1iiXJGOh+VOeYbI7WJE90+Nt+5W
 C8Wp6033E+4Cq2ACIiNN5zk7bE9m+W97geSswBdy0pFep4yeZjIk7L5WC37jyovnsR8b
 S6/f3E9WZpEF1fKug4mZtamEeNFEQC9TNhM4NvnzOcytda9K92RyrUUpo1vcNvtvV3c1
 WDaXelDAW4l054xUbNsZHHK5v0ExfDBR1jQrIAAI2moa0ZMX96kwOJFtpZGmczp4xOol
 cCEslAnnfxh8j2gflK5FIDvPRO2cNbaPUUnLCQlCvClp1WqwpwgN6GwDTbwN+mqur1x4 kA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 35cn9rtb8q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Dec 2020 13:36:43 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BIDVMT5041337;
        Fri, 18 Dec 2020 13:36:42 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 35d7esbqau-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Dec 2020 13:36:42 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BIDaeGj009724;
        Fri, 18 Dec 2020 13:36:40 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 18 Dec 2020 05:36:39 -0800
Date:   Fri, 18 Dec 2020 16:36:31 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Nigel Christian <nigel.l.christian@gmail.com>
Cc:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, gustavoars@kernel.org,
        linux-media@vger.kernel.org, trivial@kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: cec: fix trivial style warnings
Message-ID: <20201218133631.GL2809@kadam>
References: <20201218063117.GA80700@fedora>
 <20201218101630.GM2831@kadam>
 <20201218123558.GA4088@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201218123558.GA4088@fedora>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180095
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9838 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012180095
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 18, 2020 at 07:35:58AM -0500, Nigel Christian wrote:
> On Fri, Dec 18, 2020 at 01:16:30PM +0300, Dan Carpenter wrote:
> > On Fri, Dec 18, 2020 at 01:31:17AM -0500, Nigel Christian wrote:
> > > Comment has 'then' repeated twice. Let's clean it up.
> > > Use unsigned int to maintain naming consistency.
> > > 
> > 
> > Do you use a tool to find the double "then then"?
> > 
> > regards,
> > dan carpenter
> > 
> 
> Started working on nodejs script to run the 'checkpatch.pl -f'
> on directories and filter the output by command line arg.

Ah...  I didn't realize that checkpatch could find this sort of thing.
Thanks!

regards,
dan carpenter

