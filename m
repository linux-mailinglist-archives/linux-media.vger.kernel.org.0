Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3EEC338626
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 07:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232050AbhCLGoF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 01:44:05 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:49970 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232156AbhCLGn4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 01:43:56 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12C6UvrO020225;
        Fri, 12 Mar 2021 06:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=zeE8M9gzyfqZCryYCDtqun06kLY8Iiz5GLGO20PZzS0=;
 b=x0TYv6GH4NxkpUNS7uzazKl39S67LoZMNEosCe62Bdi90TO9dtBqNmD2HSaf0tc0Xlp+
 zO9+AW5l29ijNdWjOMhI/xgm2JGGSF7J/7PxMj+3lcgpXLp+R4axFmo3rgXw+yqUSXvD
 HHrPppFRXSfa5RV9ne35a9LWddnVSpmNi+RfbuO6zVLWnC9ZgLhq35zm6dxuQrFO3rSc
 zfJPwzG1cYfShjmFZlpJ4YMR921k6vUpgoP+RGvtp3Si5DzLJDeV+d6s3HFvXcVRekow
 kJNH6TVmkzuyp/1OFtll4B1EG+p1P+gC2JgMbMtXXMNuXVUrOYA8JoijfOyi1dEJFAIv mA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 37415rh084-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 12 Mar 2021 06:43:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12C6PdfQ005982;
        Fri, 12 Mar 2021 06:43:52 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 374kn3nd94-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 12 Mar 2021 06:43:52 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12C6hpVe001691;
        Fri, 12 Mar 2021 06:43:51 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 11 Mar 2021 22:43:50 -0800
Date:   Fri, 12 Mar 2021 09:43:44 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     mchehab+huawei@kernel.org
Cc:     linux-media@vger.kernel.org
Subject: [bug report] Revert "media: staging: atomisp: Remove driver"
Message-ID: <YEsNoNRz40DSq/4k@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9920 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103120044
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9920 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103120044
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Mauro Carvalho Chehab,

The patch ad85094b293e: "Revert "media: staging: atomisp: Remove
driver"" from Apr 19, 2020, leads to the following static checker
warning:

	drivers/staging/media/atomisp/pci/atomisp_fops.c:261 atomisp_q_video_buffers_to_css()
	error: buffer overflow 'asd->stream_env[stream_id]->pipes' 6 <= 6

drivers/staging/media/atomisp/pci/atomisp_fops.c
   234                  list_del_init(&vb->queue);
   235                  vb->state = VIDEOBUF_ACTIVE;
   236                  spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
   237  
   238                  /*
   239                   * If there is a per_frame setting to apply on the buffer,
   240                   * do it before buffer en-queueing.
   241                   */
   242                  vm_mem = vb->priv;
   243  
   244                  param = pipe->frame_params[vb->i];
   245                  if (param) {
   246                          atomisp_makeup_css_parameters(asd,
   247                                                        &asd->params.css_param.update_flag,
   248                                                        &param->params);
   249                          atomisp_apply_css_parameters(asd, &param->params);
   250  
   251                          if (param->params.update_flag.dz_config &&
   252                              asd->run_mode->val != ATOMISP_RUN_MODE_VIDEO) {
   253                                  err = atomisp_calculate_real_zoom_region(asd,
   254                                          &param->params.dz_config, css_pipe_id);
   255                                  if (!err)
   256                                          asd->params.config.dz_config = &param->params.dz_config;
   257                          }
   258                          atomisp_css_set_isp_config_applied_frame(asd,
   259                                  vm_mem->vaddr);
   260                          atomisp_css_update_isp_params_on_pipe(asd,
   261                                                                asd->stream_env[stream_id].pipes[css_pipe_id]);
                                                                                                       ^^^^^^^^^^^
Can this be IA_CSS_PIPE_ID_NUM?  It looks that way.  The concern is
about the last caller in atomisp_qbuffers_to_css().

   262                          asd->params.dvs_6axis = (struct ia_css_dvs_6axis_config *)
   263                                                  param->params.dvs_6axis;
   264  
   265                          /*
   266                           * WORKAROUND:
   267                           * Because the camera halv3 can't ensure to set zoom
   268                           * region to per_frame setting and global setting at
   269                           * same time and only set zoom region to pre_frame

regards,
dan carpenter
