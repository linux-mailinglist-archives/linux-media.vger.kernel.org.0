Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1496B3601E7
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 07:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbhDOFte (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 01:49:34 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:57186 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbhDOFtd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 01:49:33 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13F5k0V1088198;
        Thu, 15 Apr 2021 05:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=UKh2oMINkAlsBGjPrGn33bQfhhfZDzZzi4ZAtWpYPc0=;
 b=fjw1FNNr1MfNeFsutgK/MLCa5vv+we9TUYibZa32Xst2f8Mtee+uh9NARwlXwPdD7x+N
 W4VpR72o7+sFgK0uo/rFAyFbNsVp+Ff0ErsSyfnsRAFEhxuND2/iyapBYW8qWvWYd19W
 hQgFf3qQ7yzAoed1rTMGQsrGftKfNmA/vdgILaQh22RWrESZ/ShSPdldGoFQ1+49ejvk
 ssrtFOsl3y5Vw8TQeEz3xloYx+lSa+rMLcgHQ67mtkyfSnOLg1RRD91hcuR+T4e9Hway
 snRJkTlvjrrvVKwO/U6jhfQhT8pzrQdZ8+Mber9hJR/0ElDW2s+xwzETjV8go73025bU BQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 37u1hbmpgd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 15 Apr 2021 05:49:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13F5dY6M029293;
        Thu, 15 Apr 2021 05:49:00 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 37unsv20mr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 15 Apr 2021 05:49:00 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13F5mwQx020490;
        Thu, 15 Apr 2021 05:48:59 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 14 Apr 2021 22:48:58 -0700
Date:   Thu, 15 Apr 2021 08:48:51 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [PATCH v2] staging: media: atomisp: pci: Format comments
 according to coding-style in file atomisp_cmd.c
Message-ID: <20210415054851.GA6021@kadam>
References: <20210414204244.GA8287@focaruja>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414204244.GA8287@focaruja>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9954 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104150040
X-Proofpoint-GUID: dKV2ZxJwBAw6Zd8HVB_vpCGW5vrpRtn_
X-Proofpoint-ORIG-GUID: dKV2ZxJwBAw6Zd8HVB_vpCGW5vrpRtn_
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9954 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104150040
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 14, 2021 at 05:42:44PM -0300, Aline Santana Cordeiro wrote:
> @@ -90,18 +92,14 @@ struct camera_mipi_info *atomisp_to_sensor_mipi_info(struct v4l2_subdev *sd)
>  	return (struct camera_mipi_info *)v4l2_get_subdev_hostdata(sd);
>  }
>  
> -/*
> - * get struct atomisp_video_pipe from v4l2 video_device
> - */
> +/* get struct atomisp_video_pipe from v4l2 video_device */

This code is obvious and the comment doesn't add anything except noise.
Just delete it.  Same for a lot of the other one line comments
describing functions in this patch.


>  struct atomisp_video_pipe *atomisp_to_video_pipe(struct video_device *dev)
>  {
>  	return (struct atomisp_video_pipe *)
>  	       container_of(dev, struct atomisp_video_pipe, vdev);
>  }
>  
> -/*
> - * get struct atomisp_acc_pipe from v4l2 video_device
> - */
> +/* get struct atomisp_acc_pipe from v4l2 video_device */
>  struct atomisp_acc_pipe *atomisp_to_acc_pipe(struct video_device *dev)
>  {
>  	return (struct atomisp_acc_pipe *)
> @@ -269,7 +267,7 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
>  			    ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE;
>  	}
>  
> -	/* search for the target frequency by looping freq rules*/
> +	/* search for the target frequency by looping freq rules */
>  	for (i = 0; i < dfs->dfs_table_size; i++) {
>  		if (curr_rules.width != dfs->dfs_table[i].width &&
>  		    dfs->dfs_table[i].width != ISP_FREQ_RULE_ANY)
> @@ -307,9 +305,7 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
>  	return ret;
>  }
>  
> -/*
> - * reset and restore ISP
> - */
> +/* reset and restore ISP */

Obvious

>  int atomisp_reset(struct atomisp_device *isp)
>  {
>  	/* Reset ISP by power-cycling it */
> @@ -338,9 +334,7 @@ int atomisp_reset(struct atomisp_device *isp)
>  	return ret;
>  }
>  
> -/*
> - * interrupt disable functions
> - */
> +/* interrupt disable functions */

Obvious

>  static void disable_isp_irq(enum hrt_isp_css_irq irq)
>  {
>  	irq_disable_channel(IRQ0_ID, irq);
> @@ -351,9 +345,7 @@ static void disable_isp_irq(enum hrt_isp_css_irq irq)
>  	cnd_sp_irq_enable(SP0_ID, false);
>  }
>  
> -/*
> - * interrupt clean function
> - */
> +/* interrupt clean function */

Obvious

>  static void clear_isp_irq(enum hrt_isp_css_irq irq)
>  {
>  	irq_clear_all(IRQ0_ID);

[ snip ]

> @@ -1918,10 +1914,7 @@ irqreturn_t atomisp_isr_thread(int irq, void *isp_ptr)
>  	return IRQ_HANDLED;
>  }
>  
> -/*
> - * utils for buffer allocation/free
> - */
> -
> +/* utils for buffer allocation/free */

What?  This one seems actively wrong.

>  int atomisp_get_frame_pgnr(struct atomisp_device *isp,
>  			   const struct ia_css_frame *frame, u32 *p_pgnr)
>  {

etc.

regards,
dan carpenter

