Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED231E7AD6
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 12:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbgE2KnV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 06:43:21 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:32780 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbgE2KnU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 06:43:20 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04TAgH8T028169;
        Fri, 29 May 2020 10:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=34GkwOFjnKuDdRosh97LtM3Twb65lXU+4CUiRqWV9RY=;
 b=N05ixqSfPvBPVjd9r/rdbRbYgBRoL7mNcQhjjQcUca3ZgUM9KKGigBidTI1vvhW+cOba
 Zo7RMwWkbeqPd42AK9jIepEFE09z05T5EuK9dzQOHHhUrcwyLRzcYYId3mTLyMe2OL1G
 jL2j/ak+M3872QkUEQu02Wv2W50nOy3Squ8AH9zT61OJUh4hvjmr+sZ6TNWxVF0UMObP
 Ra8hqNtM3RzMrY2YSciut16F85h7WmodZfihb3e14Oi2H2KP8hBubN2CLHBgG0vUCDzP
 6Ye4djKgeXGR+6SVSJz+iSKDvuVbmP6cHvfn9AzVOZWNLH6UiH5a9MvOkPoo5ZSlDVfR mQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 318xe1sptw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 29 May 2020 10:43:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04TAelNQ031748;
        Fri, 29 May 2020 10:41:16 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 31a9ku2akd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 29 May 2020 10:41:16 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04TAfD5N031409;
        Fri, 29 May 2020 10:41:13 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 29 May 2020 03:41:13 -0700
Date:   Fri, 29 May 2020 13:41:07 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     mchehab+huawei@kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [bug report] Revert "media: staging: atomisp: Remove driver"
Message-ID: <20200529104107.GA1306497@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9635 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=10 mlxscore=0 adultscore=0
 mlxlogscore=836 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005290085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9635 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=859
 adultscore=0 cotscore=-2147483648 mlxscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 suspectscore=10 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005290085
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Mauro Carvalho Chehab,

The patch ad85094b293e: "Revert "media: staging: atomisp: Remove
driver"" from Apr 19, 2020, leads to the following static checker
warning:

	drivers/staging/media/atomisp/pci/atomisp_acc.c:207 atomisp_acc_load_to_pipe()
	warn: pointer comes from user 'acc_fw->fw->blob.code'

drivers/staging/media/atomisp/pci/atomisp_acc.c
   168  
   169          acc_fw = acc_alloc_fw(user_fw->size);
   170          if (!acc_fw)
   171                  return -ENOMEM;
   172  
   173          if (copy_from_user(acc_fw->fw, user_fw->data, user_fw->size)) {
                                   ^^^^^^^^^^
The acc_fw->fw->blob.code pointer isn't annotated as __user data.
Eventually it gets passed as "data" to int hmm_store() and treated as
a kernel pointer.

Presumably only privileged users can load new firmware so this isn't
a serious security bug...

   174                  acc_free_fw(acc_fw);
   175                  return -EFAULT;
   176          }
   177  
   178          handle = ida_alloc(&asd->acc.ida, GFP_KERNEL);
   179          if (handle < 0) {
   180                  acc_free_fw(acc_fw);
   181                  return -ENOSPC;
   182          }
   183  
   184          user_fw->fw_handle = handle;
   185          acc_fw->handle = handle;
   186          acc_fw->flags = user_fw->flags;
   187          acc_fw->type = user_fw->type;
   188          acc_fw->fw->handle = handle;
   189  
   190          /*
   191           * correct isp firmware type in order ISP firmware can be appended
   192           * to correct pipe properly
   193           */
   194          if (acc_fw->fw->type == ia_css_isp_firmware) {
   195                  static const int type_to_css[] = {
   196                          [ATOMISP_ACC_FW_LOAD_TYPE_OUTPUT] =
   197                          IA_CSS_ACC_OUTPUT,
   198                          [ATOMISP_ACC_FW_LOAD_TYPE_VIEWFINDER] =
   199                          IA_CSS_ACC_VIEWFINDER,
   200                          [ATOMISP_ACC_FW_LOAD_TYPE_STANDALONE] =
   201                          IA_CSS_ACC_STANDALONE,
   202                  };
   203                  acc_fw->fw->info.isp.type = type_to_css[acc_fw->type];
   204          }
   205  
   206          list_add_tail(&acc_fw->list, &asd->acc.fw);
   207          return 0;
   208  }

regards,
dan carpenter
