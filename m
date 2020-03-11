Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40FF81812B4
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 09:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728488AbgCKIPZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 04:15:25 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:47868 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbgCKIPZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 04:15:25 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02B8DQfd160273;
        Wed, 11 Mar 2020 08:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=BWtgwQqg+qr3NeWwSyT6ZVGkZLlZgwxjgiPe4aYBh90=;
 b=rjVYZkbj4s1R2wAalIOIzTFolVMfQawidhaQngtvCgy6AaF3DYe5S4IwJfZN4flo33uH
 uu5DHJj+QB3XK//F8JDjQUc7K3KgQuGrK3gT5KQH+jh84td1zhjKg3sEOVdC5Tlyp1Nv
 x3uqY4VFhqyb57bfsGtkCeFDf+vVfwEFBS+mXXd60ZFuH8CWk4gq8buV9Hyu5SJ3vRR7
 oXLgBii72RH2NCjc5u465SEmBLWDnr4KQ19OR4RmFt6TgnyW1jrc8q1ffrxImeUyTwCW
 cmN1z6onmZ9LBzeuWc+eIiGJEyPVtpuHQpU3MBeOVsYw76idK42b5/pIg6vvYZ7Yr6Kz +w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2yp7hm6cj6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 11 Mar 2020 08:15:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02B8Ct2N189764;
        Wed, 11 Mar 2020 08:15:21 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2yp8p0us2f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 11 Mar 2020 08:15:21 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02B8FKk8011120;
        Wed, 11 Mar 2020 08:15:20 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 11 Mar 2020 01:15:19 -0700
Date:   Wed, 11 Mar 2020 11:15:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     amasule@codeaurora.org
Cc:     linux-media@vger.kernel.org
Subject: [bug report] media: venus: introduce core selection
Message-ID: <20200311081511.GA7593@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9556 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=1 mlxlogscore=643
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003110053
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9556 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 impostorscore=0
 mlxlogscore=704 suspectscore=1 phishscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003110053
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Aniket Masule,

The patch 4ebf969375bc: "media: venus: introduce core selection" from
Dec 2, 2019, leads to the following static checker warning:

	drivers/media/platform/qcom/venus/vdec.c:968 vdec_start_streaming()
	warn: inconsistent returns 'inst->lock'.

drivers/media/platform/qcom/venus/vdec.c
   943  static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
   944  {
   945          struct venus_inst *inst = vb2_get_drv_priv(q);
   946          int ret;
   947  
   948          mutex_lock(&inst->lock);
   949  
   950          ret = venus_pm_acquire_core(inst);
   951          if (ret)
   952                  return ret;

goto error or just goto unlock?

   953  
   954          if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
   955                  ret = vdec_start_capture(inst);
   956          else
   957                  ret = vdec_start_output(inst);
   958  
   959          if (ret)
   960                  goto error;
   961  
   962          mutex_unlock(&inst->lock);
   963          return 0;
   964  
   965  error:
   966          venus_helper_buffers_done(inst, VB2_BUF_STATE_QUEUED);
   967          mutex_unlock(&inst->lock);
   968          return ret;
   969  }

regards,
dan carpenter
