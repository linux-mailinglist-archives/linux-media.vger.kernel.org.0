Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 504893389B1
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 11:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232834AbhCLKJn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 05:09:43 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:38586 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232987AbhCLKJF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 05:09:05 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12CA73Wi106472;
        Fri, 12 Mar 2021 10:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=RSe4GcuIR2E60/i2v9Hs3sfaAUs2xXtQFx8xPKdbCXo=;
 b=nr62gYgy3eBsGGmBFxyWa6JQsCdmdZjmBpQN+7KRaJcDs4Ma5Akf26J4Hf+7coR+rIju
 /OulA2tsJ359ROVmxLjwhaW2oUfW76sQJK2JZDlrELmxrCg/oJkT5cPwOPQFI7UIuGuQ
 4CiAuoIT1lgkXrjnhJie8OWCEURIgFQs89+ZYME2dN/AK+UcN92d0JHHK3gh/ssOllLQ
 K5uz4A7j8eFFAaNCJLgbRmSwp+gxj4XSjZ3eHrmyskNht0irb3pe71+kE+70qock2R/I
 UpDAHP7J4ENY+7aSebMniwsY00oWvKzsmbvTaAqDmmCYaH1/MIfX6Dl+as4CYtMyHaQF 0w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 373y8c1qdd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 12 Mar 2021 10:09:03 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12CA5DHS084091;
        Fri, 12 Mar 2021 10:09:01 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 374kgwaer3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 12 Mar 2021 10:09:01 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12CA90YF002187;
        Fri, 12 Mar 2021 10:09:00 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 12 Mar 2021 02:08:59 -0800
Date:   Fri, 12 Mar 2021 13:08:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [bug report] Revert "media: staging: atomisp: Remove driver"
Message-ID: <20210312100851.GN21246@kadam>
References: <YEsNoNRz40DSq/4k@mwanda>
 <20210312082152.0c59329e@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312082152.0c59329e@coco.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9920 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103120068
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9920 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 mlxscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103120068
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 12, 2021 at 08:24:33AM +0100, Mauro Carvalho Chehab wrote:
> Hi Dan,
> 
> Em Fri, 12 Mar 2021 09:43:44 +0300
> Dan Carpenter <dan.carpenter@oracle.com> escreveu:
> 
> > Hello Mauro Carvalho Chehab,
> > 
> > The patch ad85094b293e: "Revert "media: staging: atomisp: Remove
> > driver"" from Apr 19, 2020, leads to the following static checker
> > warning:
> > 
> > 	drivers/staging/media/atomisp/pci/atomisp_fops.c:261 atomisp_q_video_buffers_to_css()
> > 	error: buffer overflow 'asd->stream_env[stream_id]->pipes' 6 <= 6
> > 
> > drivers/staging/media/atomisp/pci/atomisp_fops.c
> >    234                  list_del_init(&vb->queue);
> >    235                  vb->state = VIDEOBUF_ACTIVE;
> >    236                  spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
> >    237  
> >    238                  /*
> >    239                   * If there is a per_frame setting to apply on the buffer,
> >    240                   * do it before buffer en-queueing.
> >    241                   */
> >    242                  vm_mem = vb->priv;
> >    243  
> >    244                  param = pipe->frame_params[vb->i];
> >    245                  if (param) {
> >    246                          atomisp_makeup_css_parameters(asd,
> >    247                                                        &asd->params.css_param.update_flag,
> >    248                                                        &param->params);
> >    249                          atomisp_apply_css_parameters(asd, &param->params);
> >    250  
> >    251                          if (param->params.update_flag.dz_config &&
> >    252                              asd->run_mode->val != ATOMISP_RUN_MODE_VIDEO) {
> >    253                                  err = atomisp_calculate_real_zoom_region(asd,
> >    254                                          &param->params.dz_config, css_pipe_id);
> >    255                                  if (!err)
> >    256                                          asd->params.config.dz_config = &param->params.dz_config;
> >    257                          }
> >    258                          atomisp_css_set_isp_config_applied_frame(asd,
> >    259                                  vm_mem->vaddr);
> >    260                          atomisp_css_update_isp_params_on_pipe(asd,
> >    261                                                                asd->stream_env[stream_id].pipes[css_pipe_id]);
> >                                                                                                        ^^^^^^^^^^^
> > Can this be IA_CSS_PIPE_ID_NUM?  It looks that way.  The concern is
> > about the last caller in atomisp_qbuffers_to_css().
> 
> Well, atomisp_q_video_buffers_to_css() should never receive
> IA_CSS_PIPE_ID_NUM in practice.
> 
> See, the atomisp driver uses several different pipelines in order
> to capture images and do different types of image processing (like
> scaling, image improvements and format conversion). Those are
> dynamically set internally inside the driver's code, depending on
> the parameters set via different ioctls before starting to stream.
> 
> On other words, calling the function with IA_CSS_PIPE_ID_NUM is
> invalid.
> 
> So, I guess that the best fix would be to do something like the
> enclosed path.
> 

drivers/staging/media/atomisp/pci/atomisp_fops.c
   411  int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
   412  {
   413          enum ia_css_buffer_type buf_type;
   414          enum ia_css_pipe_id css_capture_pipe_id = IA_CSS_PIPE_ID_NUM;
   415          enum ia_css_pipe_id css_preview_pipe_id = IA_CSS_PIPE_ID_NUM;
   416          enum ia_css_pipe_id css_video_pipe_id = IA_CSS_PIPE_ID_NUM;
   417          enum atomisp_input_stream_id input_stream_id;
   418          struct atomisp_video_pipe *capture_pipe = NULL;
   419          struct atomisp_video_pipe *vf_pipe = NULL;
   420          struct atomisp_video_pipe *preview_pipe = NULL;

At the start of the atomisp_qbuffers_to_css() function we initialize
the pipe_id's to one element outside the array to silence a GCC warning
about unitialized variables.  It would be less confusing to just
initialize it to zero.

regards,
dan carpenter

