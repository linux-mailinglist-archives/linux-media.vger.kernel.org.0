Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7D0E27C23A
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 12:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgI2KTz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 06:19:55 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:37732 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbgI2KTz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 06:19:55 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08TAFVSk114388;
        Tue, 29 Sep 2020 10:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=A5ZqCj7WMvHdn1u3efSOKcSsZKJQJ7jOeeGuOBrk24g=;
 b=C1Ku4OsKn68+rsnuGx1otOPJuVvTv0XFxUNH/Etj8WMmJh0xbXoknTweZTXO/L0ElBhR
 ClequsRorLvOQaBWh2cGSPAneVA8ldV9sODe5oAtfRKFqH+h1e03awXq4VjQiIxpvd5G
 24/cB/sHIOXnHz8g0W17TSHwUHLoe3xL4D533OK+MopxqGqcFWSNwtFj1+JO1jHzGfyy
 +4vZ3Bd1roufzMzgrmgNTraYaEOeH4NUWUK7LFiwy3o7bMahRrTIZIE7mRd5VidoYyxt
 ScMGwf1oe2TQ9moFk5Y3gZ5uBtZ/bRFd5dDVFqyVy/4fbwz1lmvwRXGvDaaj4VAzfR0V fw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 33swkksvcb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 29 Sep 2020 10:19:53 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08TAJB8a121054;
        Tue, 29 Sep 2020 10:19:52 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 33uv2dnr0g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Sep 2020 10:19:52 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08TAJmHu013418;
        Tue, 29 Sep 2020 10:19:48 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 29 Sep 2020 03:19:47 -0700
Date:   Tue, 29 Sep 2020 13:19:42 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     wu000273@umn.edu
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: ti-vpe: Fix a missing check and reference count
 leak
Message-ID: <20200929101942.GA490864@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9758 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=3 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009290090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9758 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=3 mlxlogscore=999 clxscore=1011 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009290090
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Qiushi Wu,

The patch 7dae2aaaf432: "media: ti-vpe: Fix a missing check and
reference count leak" from Jun 14, 2020, leads to the following
static checker warning:

	drivers/media/platform/ti-vpe/vpe.c:2478 vpe_runtime_get()
	warn: pm_runtime_get_sync() also returns 1 on success

drivers/media/platform/ti-vpe/vpe.c
  2470  static int vpe_runtime_get(struct platform_device *pdev)
  2471  {
  2472          int r;
  2473  
  2474          dev_dbg(&pdev->dev, "vpe_runtime_get\n");
  2475  
  2476          r = pm_runtime_get_sync(&pdev->dev);
  2477          WARN_ON(r < 0);
  2478          if (r)
  2479                  pm_runtime_put_noidle(&pdev->dev);

The pm_runtime_get_sync() function is tricky because it can return
either zero or one on the success path.  (So this patch can break the
success path.)

  2480          return r < 0 ? r : 0;
  2481  }

regards,
dan carpenter
