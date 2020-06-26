Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAEDF20AFF1
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 12:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgFZKnQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 06:43:16 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:42038 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgFZKnP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 06:43:15 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05QAg3LP006353;
        Fri, 26 Jun 2020 10:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=KAeR74KPGbL91ldCUeGwZH9ElS5N8jenYFrnbPoEB4Q=;
 b=HJNz3+UEVB+QyPOcrXpHsBfTD3uDunsIVxwQhf/nsMBiRCUb5BrrqW1LdW6SR4i/zNWR
 wki7JIzg4W2x9zAzvVyYwInU77yQ3buOAWMWpGt595mDOD21a5CKYpcLTj41tuaAWF0v
 j/AzYhZzEqUHI628g/Cmpdcl3On2ex1vCRamc/VKiPL7R6TZ59Vz6r0EAlFHGkuvLl1J
 ewBnsEN0AAo3vez9YGcsqsobNlgd57RS/uUiF+kkCpkrMnDYFn6eu0eP/TnJuAE38RK7
 6EM8N8HOWmkjZCReZg/MvE82d0+pR6v4WfJGuVf413e/lNT/R5PmYjh5YowiG4JCuDKv BA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 31uusu5dr0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 26 Jun 2020 10:43:12 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05QAdWjK157369;
        Fri, 26 Jun 2020 10:43:11 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 31uurtywvu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 26 Jun 2020 10:43:11 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05QAh9P2031005;
        Fri, 26 Jun 2020 10:43:09 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 26 Jun 2020 10:43:01 +0000
Date:   Fri, 26 Jun 2020 13:42:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     mchehab+huawei@kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [bug report] Revert "media: staging: atomisp: Remove driver"
Message-ID: <20200626104256.GD314359@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=3 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006260077
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9663 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 bulkscore=0
 cotscore=-2147483648 malwarescore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006260078
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Mauro Carvalho Chehab,

The patch ad85094b293e: "Revert "media: staging: atomisp: Remove
driver"" from Apr 19, 2020, leads to the following static checker
warning:

	drivers/staging/media/atomisp/pci/atomisp_acc.c:506 atomisp_acc_load_extensions()
	warn: iterator used outside loop: 'acc_fw'

drivers/staging/media/atomisp/pci/atomisp_acc.c
   446  int atomisp_acc_load_extensions(struct atomisp_sub_device *asd)
   447  {
   448          struct atomisp_acc_fw *acc_fw;
   449          bool ext_loaded = false;
   450          bool continuous = asd->continuous_mode->val &&
   451                            asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW;
   452          int ret = 0, i = -1;
   453          struct atomisp_device *isp = asd->isp;
   454  
   455          if (asd->acc.pipeline || asd->acc.extension_mode)
   456                  return -EBUSY;
   457  
   458          /* Invalidate caches. FIXME: should flush only necessary buffers */
   459          wbinvd();
   460  
   461          list_for_each_entry(acc_fw, &asd->acc.fw, list) {
   462                  if (acc_fw->type != ATOMISP_ACC_FW_LOAD_TYPE_OUTPUT &&
   463                      acc_fw->type != ATOMISP_ACC_FW_LOAD_TYPE_VIEWFINDER)
   464                          continue;
   465  
   466                  for (i = 0; i < ARRAY_SIZE(acc_flag_to_pipe); i++) {
   467                          /* QoS (ACC pipe) acceleration stages are currently
   468                           * allowed only in continuous mode. Skip them for
   469                           * all other modes. */
   470                          if (!continuous &&
   471                              acc_flag_to_pipe[i].flag ==
   472                              ATOMISP_ACC_FW_LOAD_FL_ACC)
   473                                  continue;
   474  
   475                          if (acc_fw->flags & acc_flag_to_pipe[i].flag) {
   476                                  ret = atomisp_css_load_acc_extension(asd,
   477                                                                       acc_fw->fw,
   478                                                                       acc_flag_to_pipe[i].pipe_id,
   479                                                                       acc_fw->type);
   480                                  if (ret)
   481                                          goto error;

The little loop is intended to clean up a partial iteration from this
goto.

   482  
   483                                  ext_loaded = true;
   484                          }
   485                  }
   486  
   487                  ret = atomisp_css_set_acc_parameters(acc_fw);
   488                  if (ret < 0)
   489                          goto error;

And this one.

   490          }
   491  
   492          if (!ext_loaded)
   493                  return ret;
   494  
   495          ret = atomisp_css_update_stream(asd);
   496          if (ret) {
   497                  dev_err(isp->dev, "%s: update stream failed.\n", __func__);
   498                  goto error;

But if we hit this goto then "i" is non-zero and "acc_fw" is a bogus
pointer.

   499          }
   500  
   501          asd->acc.extension_mode = true;
   502          return 0;
   503  
   504  error:
   505          while (--i >= 0) {
   506                  if (acc_fw->flags & acc_flag_to_pipe[i].flag) {
                            ^^^^^^^^^^^^^

Don't we need to check:

	if (!continuous &&
	    acc_flag_to_pipe[i].flag == ATOMISP_ACC_FW_LOAD_FL_ACC)

?

   507                          atomisp_css_unload_acc_extension(asd, acc_fw->fw,
   508                                                           acc_flag_to_pipe[i].pipe_id);
   509                  }
   510          }
   511  
   512          list_for_each_entry_continue_reverse(acc_fw, &asd->acc.fw, list) {
   513                  if (acc_fw->type != ATOMISP_ACC_FW_LOAD_TYPE_OUTPUT &&
   514                      acc_fw->type != ATOMISP_ACC_FW_LOAD_TYPE_VIEWFINDER)
   515                          continue;
   516  
   517                  for (i = ARRAY_SIZE(acc_flag_to_pipe) - 1; i >= 0; i--) {
   518                          if (!continuous &&
   519                              acc_flag_to_pipe[i].flag ==
   520                              ATOMISP_ACC_FW_LOAD_FL_ACC)
   521                                  continue;
   522                          if (acc_fw->flags & acc_flag_to_pipe[i].flag) {
   523                                  atomisp_css_unload_acc_extension(asd,
   524                                                                   acc_fw->fw,
   525                                                                   acc_flag_to_pipe[i].pipe_id);
   526                          }
   527                  }
   528          }
   529          return ret;
   530  }

regards,
dan carpenter
