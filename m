Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFBB9359E79
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 14:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbhDIMTl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 08:19:41 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:38402 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbhDIMTk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Apr 2021 08:19:40 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 139CEsUx040445;
        Fri, 9 Apr 2021 12:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=iEtqHGOBgNLdGGb/+vW7OBft/R5Iwfn+BG/Q2Tx53C8=;
 b=uHcCKU6UrtASgozUkQpH23xJpXavuaO0R+eCoACM8ap6fUYjrnRnK2CGEyJ68GdCgIE8
 iHSbAXQsAr3oUCajo1+VRYXVoMJt89SQJo/CVBsX3I04WhOT6s0f4x2OTmak7PHTyPEz
 whEEOZ72hNHh9FXa2urnwtLBkTr6SydQKmNTsY/4uI/wrg/34G+ZHYNowiEQRskakx11
 692p2PFMAOu5re+t1qTiFSGHTp0RHiNDrIW+U34QRpQgmK+vErj1xzIOt8NxcD/PyUkN
 3ivcS9F56Fy4b5M3IVajXFUbbWfPNSpWdS3d6a3aGbzjwwqooRc17KWkN5ZV4O71JrRB FQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 37rvas97rt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 09 Apr 2021 12:19:26 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 139CG6a8195809;
        Fri, 9 Apr 2021 12:19:24 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 37rvbgygdn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 09 Apr 2021 12:19:24 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 139CJNY4029385;
        Fri, 9 Apr 2021 12:19:23 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 09 Apr 2021 05:19:23 -0700
Date:   Fri, 9 Apr 2021 15:19:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     bryan.odonoghue@linaro.org
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: venus: hfi,pm,firmware: Convert to block
 relative addressing
Message-ID: <YHBGRasttETWBHxW@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9948 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090092
X-Proofpoint-GUID: yddGl9pRVp9M8W9uCx_e_LU6U96EPo85
X-Proofpoint-ORIG-GUID: yddGl9pRVp9M8W9uCx_e_LU6U96EPo85
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9948 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 clxscore=1011
 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090092
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Bryan O'Donoghue,

This is a semi-automatic email about new static checker warnings.

The patch ff2a7013b3e6: "media: venus: hfi,pm,firmware: Convert to 
block relative addressing" from Apr 2, 2021, leads to the following 
Smatch complaint:

    drivers/media/platform/qcom/venus/hfi_venus.c:1100 venus_isr()
    warn: variable dereferenced before check 'hdev' (see line 1097)

drivers/media/platform/qcom/venus/hfi_venus.c
  1096		u32 status;
  1097		void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
                                            ^^^^^^^^^^
  1098		void __iomem *wrapper_base = hdev->core->wrapper_base;
                                             ^^^^^^^^^^
The patch adds new unchecked dereferences before ...

  1099	
  1100		if (!hdev)
                    ^^^^^
... this check.

  1101			return IRQ_NONE;
  1102	

regards,
dan carpenter
