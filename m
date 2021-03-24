Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02604347434
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 10:12:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbhCXJL2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 05:11:28 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:42550 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbhCXJL0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 05:11:26 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12O94mRc012513;
        Wed, 24 Mar 2021 09:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=x7emTuVJV3q/b6jrkqL3n70sQqTTr7N1wLavtKFNKFQ=;
 b=BZFe6yToM/XOlYSmEPER/n30M1pwCpAPee8hDCF8pZE1EBN1fZ+N+JgQj73Cthm1IAyW
 JKLotydZAOXfaBai4c2Ej5K1CgwKDs8DhkZzXFY1C7u9yPnpVjvEyUChYVLI5e7etKMX
 2UoR648aqlzbdwYsIUgEjm3ONwBHolc7KE2F08kbOfr5TIaffVYHbwtBF3AII67Yy+Z/
 aPw2OGo6s+UAnyc2TnunjfoJqH66yhJKevog4OGjgnKJQLuFxtPBHYW/QgYs18zi4aoX
 8hLGV9EM/ROgosbni6wu0jLRaTnayobCTY772Bx5a5UG6r+s1Jq+6rDbVNrzadW0kFWi Rg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 37d8fra18e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 24 Mar 2021 09:11:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12O94qWB014532;
        Wed, 24 Mar 2021 09:11:06 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 37dtyyjudr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 24 Mar 2021 09:11:06 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12O9B2Z5009840;
        Wed, 24 Mar 2021 09:11:03 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 24 Mar 2021 02:11:02 -0700
Date:   Wed, 24 Mar 2021 12:10:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Zhichao Cai <tomstomsczc@163.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        Zhichao Cai <caizhichao@yulong.com>
Subject: Re: [PATCH] drivers:staging: NULL check before some freeing
 functions is not needed.
Message-ID: <20210324091054.GM1717@kadam>
References: <20210324084126.895-1-tomstomsczc@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324084126.895-1-tomstomsczc@163.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9932 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=893 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240072
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9932 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 mlxlogscore=851
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240072
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 24, 2021 at 04:41:26PM +0800, Zhichao Cai wrote:
> From: Zhichao Cai <caizhichao@yulong.com>
> 
> Fixes coccicheck warning:
> drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c:390:2-8: WARNING: NULL check before some freeing functions is not needed.
> drivers/staging/media/atomisp/pci/sh_css_params.c:1579:2-8: WARNING: NULL check before some freeing functions is not needed.
> drivers/staging/media/atomisp/pci/sh_css_params.c:3010:2-8: WARNING: NULL check before some freeing functions is not needed.
> drivers/staging/media/atomisp/pci/atomisp_cmd.c:4269:2-8: WARNING: NULL check before some freeing functions is not needed.
> drivers/staging/media/atomisp/pci/atomisp_cmd.c:4630:2-7: WARNING: NULL check before some freeing functions is not needed.
> drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c:159:4-10: WARNING: NULL check before some freeing functions is not needed.
> 

Some of these have been fixed already.  Please work against linux-next.

regards,
dan carpenter

