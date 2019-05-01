Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FAF41061D
	for <lists+linux-media@lfdr.de>; Wed,  1 May 2019 10:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbfEAI2M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 May 2019 04:28:12 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:35598 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfEAI2M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 May 2019 04:28:12 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x418NMkg058841;
        Wed, 1 May 2019 08:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=PhTlNF+heYlW+EILinKh7e/LDtGxWOqZBTfEGuL8d4o=;
 b=bsD+ubOZOMOiDV/NHQ0T4lMkg0IXeMne2WOl7FDbstTWoNtZ9IXr4cWH2DYECEyesks/
 ZglRDqxKzMBm0thU6vHZEELhTZHFeRWV+cuxbQzKqPhLry+S8lSXoJzIM5GQno92KDvG
 zTBuQsM/Sw27DI4OGyvDza2YO1kQKUed0EIdURNAIVeW6JAZ0F6hnYRYbp0/bBHfmv9z
 Qz7+BhLYRi/tdQ47Z/zzPlQuJbEP1Bcrmo+gXzbZo36ZX0D3Z4PRY+kFL+z85Vl9t+Xb
 d6Dl/ciusVaGqd8kztEdxZrtZ0NhklUQnHgejfAfMwZtcXqrmhSD4U089zBmMxBgLYSj Ig== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 2s6xhy9e4m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 01 May 2019 08:28:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x418R2Or183412;
        Wed, 1 May 2019 08:28:07 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2s6xhge6fu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 01 May 2019 08:28:07 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x418S67k028363;
        Wed, 1 May 2019 08:28:07 GMT
Received: from mwanda (/197.181.221.55)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 01 May 2019 01:28:06 -0700
Date:   Wed, 1 May 2019 11:27:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     manjunath.hadli@ti.com
Cc:     linux-media@vger.kernel.org
Subject: [bug report] [media] davinci: vpfe: add v4l2 video driver support
Message-ID: <20190501082759.GA13767@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9243 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905010056
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9243 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905010056
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[ This is really old, but it looks like a potentially serious security
  bug so we probably want to fix it.  -dan ]

Hello Manjunath Hadli,

The patch 622897da67b3: "[media] davinci: vpfe: add v4l2 video driver
support" from Nov 28, 2012, leads to the following static checker
warning:

	drivers/staging/media/davinci_vpfe/vpfe_video.c:871 vpfe_s_input()
	warn: uncapped user index 'sdinfo->routes[index]'

drivers/staging/media/davinci_vpfe/vpfe_video.c
   821  /*
   822   * vpfe_s_input() - set input which is pointed by input index
   823   * @file: file pointer
   824   * @priv: void pointer
   825   * @index: pointer to unsigned int
   826   *
   827   * set input on external subdev
   828   *
   829   * Return 0 on success, error code otherwise
   830   */
   831  static int vpfe_s_input(struct file *file, void *priv, unsigned int index)
                                                               ^^^^^^^^^^^^^^^^^^
index comes from __video_do_ioctl() -> v4l_s_input() -> vpfe_s_input().
It hasn't been checked.

   832  {
   833          struct vpfe_video_device *video = video_drvdata(file);
   834          struct vpfe_device *vpfe_dev = video->vpfe_dev;
   835          struct vpfe_ext_subdev_info *sdinfo;
   836          struct vpfe_route *route;
   837          struct v4l2_input *inps;
   838          u32 output;
   839          u32 input;
   840          int ret;
   841          int i;
   842  
   843          v4l2_dbg(1, debug, &vpfe_dev->v4l2_dev, "vpfe_s_input\n");
   844  
   845          ret = mutex_lock_interruptible(&video->lock);
   846          if (ret)
   847                  return ret;
   848          /*
   849           * If streaming is started return device busy
   850           * error
   851           */
   852          if (video->started) {
   853                  v4l2_err(&vpfe_dev->v4l2_dev, "Streaming is on\n");
   854                  ret = -EBUSY;
   855                  goto unlock_out;
   856          }
   857  
   858          sdinfo = video->current_ext_subdev;
   859          if (!sdinfo->registered) {
   860                  ret = -EINVAL;
   861                  goto unlock_out;
   862          }
   863          if (vpfe_dev->cfg->setup_input &&
   864                  vpfe_dev->cfg->setup_input(sdinfo->grp_id) < 0) {
   865                  ret = -EFAULT;
   866                  v4l2_dbg(1, debug, &vpfe_dev->v4l2_dev,
   867                            "couldn't setup input for %s\n",
   868                            sdinfo->module_name);
   869                  goto unlock_out;
   870          }
   871          route = &sdinfo->routes[index];

We're potentially reading out of bounds here.  The problem is that we
don't store the size of the ->routes[] array anywhere (it has a sentinal
at the end) so I'm not sure what to check against.

Please CC me on the fix.

   872          if (route && sdinfo->can_route) {
   873                  input = route->input;
   874                  output = route->output;
   875                  ret = v4l2_device_call_until_err(&vpfe_dev->v4l2_dev,
   876                                                   sdinfo->grp_id, video,
   877                                                   s_routing, input, output, 0);
   878                  if (ret) {
   879                          v4l2_dbg(1, debug, &vpfe_dev->v4l2_dev,
   880                                  "s_input:error in setting input in decoder\n");
   881                          ret = -EINVAL;
   882                          goto unlock_out;
   883                  }
   884          }
   885          /* set standards set by subdev in video device */
   886          for (i = 0; i < sdinfo->num_inputs; i++) {
   887                  inps = &sdinfo->inputs[i];
   888                  video->video_dev.tvnorms |= inps->std;
   889          }
   890          video->current_input = index;
   891  unlock_out:
   892          mutex_unlock(&video->lock);
   893          return ret;
   894  }

regards,
dan carpenter
