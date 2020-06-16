Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 282C41FAC62
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 11:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgFPJ3l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 05:29:41 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:34220 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgFPJ3l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 05:29:41 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05G9LlaF184942;
        Tue, 16 Jun 2020 09:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=HhjNbtcnq5YIZmqPXhcad1gzpU6iHUeRWNnMYNwnNC4=;
 b=C6LlgFOX0ZN76Edkoddg/6ZsNy9WqWxdOvRTOcx2R7SbrFgu5o3qnF01B5Rugk1jlkFW
 GcJ6inqNR7GLjpwuYleQoaRFkCw/uZ8OeIKiXki2A1qOzVmHbPKE0PN/LwdWWEuHKYYh
 X80tC/jJAqF5I9OAgMGir2jgVI2csKoUE2VnE2HuSd3KgihRUh6HON1OvRN3Dx1aWGbq
 CNM0rgXU8jH78fxJ1DVtRGF8CzZf4+RRcRRbr/6ddRiPmYBY+3IT+evz9hXoHDCkApPZ
 J8LUTLOuiySTSS4tRloU6r6aVcTygWQ6SIBkfCthVM+LFXhi0xnKR2YZULhJR28N4inF kA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 31p6s25prn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 16 Jun 2020 09:29:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05G9N1ex008672;
        Tue, 16 Jun 2020 09:27:36 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 31p6dg299m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 16 Jun 2020 09:27:36 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 05G9RYLu003238;
        Tue, 16 Jun 2020 09:27:35 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 16 Jun 2020 02:27:34 -0700
Date:   Tue, 16 Jun 2020 12:27:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: atomisp: Fix a pointer math problem in dump_sp_dmem()
Message-ID: <20200616092728.GB11940@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9653 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006160069
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9653 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 cotscore=-2147483648 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006160069
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The "io_virt_addr" variable is a u32 pointer and it should be
incremented by one instead of four.  The current code will dump bogus
data and read beyond the end of the buffer.

Fixes: 69a03e36c711 ("media: atomisp: get rid of an iomem abstraction layer")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 7b936e5a5f03..6faf223c6d20 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -682,7 +682,7 @@ void dump_sp_dmem(struct atomisp_device *isp, unsigned int addr,
 	do {
 		data = *io_virt_addr;
 		dev_dbg(isp->dev, "%s, \t [0x%x]:0x%x\n", __func__, addr, data);
-		io_virt_addr += sizeof(u32);
+		io_virt_addr++;
 		size32 -= 1;
 	} while (size32 > 0);
 }
-- 
2.27.0

