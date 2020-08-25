Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F672517A5
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 13:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730048AbgHYLcJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 07:32:09 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:42984 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729759AbgHYLbr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 07:31:47 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07PBTRQS013682;
        Tue, 25 Aug 2020 11:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=AOigmkElw5/51p8jVzrJLxBhSFn0r3ksGjzITxEY3Pw=;
 b=syja+fodV9zkNl/zOyduImjJb4gwwrYn+X++NJU9+aTV8WRhpT6x2Z2z0DIh0p9pnDkd
 A33aQC5g06mfYf4zKzuZgtAQLW5aQFHMIuWY5Cx0Fa+dwR0QDsS0tYpietla9njoTujs
 hiuLbCJ2EjFj3W/wHYtnFbpM+a5D90g3FHRZLwy3IVvmZzwuWYh1UU6ELx0lvUNSsrda
 plR7a+edK2e6RH4/Kkuse3+k4W7q2hpam3BWUd3++h4cbbFRNP9DnJ2mURINNk7zR9Ea
 LezFPAYkpJl30ozEOvieS1EtKfxJ5lEEMVfcgRbm9x0eZD/tUF81Q61jaGbX2nhC44Dy Pw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 333w6trehy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 25 Aug 2020 11:31:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07PBPHv0006213;
        Tue, 25 Aug 2020 11:31:45 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 333r9jefac-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 25 Aug 2020 11:31:45 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07PBVinm021888;
        Tue, 25 Aug 2020 11:31:45 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 25 Aug 2020 04:31:44 -0700
Date:   Tue, 25 Aug 2020 14:31:40 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     mchehab+huawei@kernel.org
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: atomisp: re-enable warnings again
Message-ID: <20200825113140.GA287498@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=3 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008250087
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=3 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008250087
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Mauro Carvalho Chehab,

The patch 5b552b198c25: "media: atomisp: re-enable warnings again"
from May 30, 2020, leads to the following static checker warning:

	drivers/staging/media/atomisp/pci/atomisp_compat_css20.c:714 is_pipe_valid_to_current_run_mode()
	warn: ignoring unreachable code.

drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
   694          switch (asd->run_mode->val) {
   695          case ATOMISP_RUN_MODE_STILL_CAPTURE:
   696                  if (pipe_id == IA_CSS_PIPE_ID_CAPTURE)
   697                          return true;
   698  
   699                  return false;
   700          case ATOMISP_RUN_MODE_PREVIEW:
   701                  if (!asd->continuous_mode->val) {
   702                          if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
   703                                  return true;
   704  
   705                          return false;
   706                  }
   707                  fallthrough;

I bet all these fallthrough annotations should just be "return false;"

   708          case ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE:
   709                  if (pipe_id == IA_CSS_PIPE_ID_CAPTURE ||
   710                      pipe_id == IA_CSS_PIPE_ID_PREVIEW)
   711                          return true;
   712  
   713                  return false;
   714                  fallthrough;

Either way, this one is clearly unreachable.

   715          case ATOMISP_RUN_MODE_VIDEO:
   716                  if (!asd->continuous_mode->val) {
   717                          if (pipe_id == IA_CSS_PIPE_ID_VIDEO ||
   718                              pipe_id == IA_CSS_PIPE_ID_YUVPP)
   719                                  return true;
   720                          else
   721                                  return false;
   722                  }
   723                  fallthrough;
   724          case ATOMISP_RUN_MODE_SDV:
   725                  if (pipe_id == IA_CSS_PIPE_ID_CAPTURE ||
   726                      pipe_id == IA_CSS_PIPE_ID_VIDEO)
   727                          return true;
   728  
   729                  return false;
   730          }

regards,
dan carpenter
