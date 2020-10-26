Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E1C2988D6
	for <lists+linux-media@lfdr.de>; Mon, 26 Oct 2020 09:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1772334AbgJZI4X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Oct 2020 04:56:23 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:58062 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1772330AbgJZI4W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Oct 2020 04:56:22 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09Q8mQJ6159501;
        Mon, 26 Oct 2020 08:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=2e+LVoIyB23J1NkAGnKiTWFanoothvTO+wSfsKbng90=;
 b=iY8/8EpYQqV0V2LvC7DBxuntjeb4dRJynW6g6crUJFH2U2kd2deoieeiqP8TELCcVdWV
 u+4f5AiYD+68D32irJ//mYeqeAORHhKIORxRqty8RgzBccR56Iqy8guPVleGslpj3tHL
 yr/zwIeDYjtye7pD4ZbUCUpgAF1hsO+YG2ap2U1CNNyHHk7KMPIJbEt7ZZAO5d1GIjNZ
 EcgxV23Oi/mw9p453GfoWPdH8D460jCFC3V9/DkN1PdVUZEp/eFK/EanbQYFpqdhgYOo
 p5QmicFqxdo+CvsD2+Qfm6WcAmHjZ76Z5JJht19jL3WkoSjE4+6PoXHAK+/NiQIH8/O9 yA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 34dgm3s778-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 26 Oct 2020 08:55:49 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09Q8oCin105198;
        Mon, 26 Oct 2020 08:53:48 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 34cx1pb4f8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 26 Oct 2020 08:53:48 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09Q8rhIe002665;
        Mon, 26 Oct 2020 08:53:43 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 26 Oct 2020 01:53:42 -0700
Date:   Mon, 26 Oct 2020 11:53:31 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Vinod Koul <vkoul@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Yong Deng <yong.deng@magewell.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kevin.lhopital@hotmail.com
Subject: Re: [PATCH 12/14] media: sunxi: Add support for the A83T MIPI CSI-2
 controller
Message-ID: <20201026085331.GC1042@kadam>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
 <20201023174546.504028-13-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201023174546.504028-13-paul.kocialkowski@bootlin.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9785 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010260064
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9785 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010260064
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 23, 2020 at 07:45:44PM +0200, Paul Kocialkowski wrote:
> +static int sun8i_a83t_mipi_csi2_v4l2_setup(struct sun8i_a83t_mipi_csi2_dev *cdev)
> +{
> +	struct sun8i_a83t_mipi_csi2_video *video = &cdev->video;
> +	struct v4l2_subdev *subdev = &video->subdev;
> +	struct v4l2_async_notifier *notifier = &video->notifier;
> +	struct fwnode_handle *handle;
> +	struct v4l2_fwnode_endpoint *endpoint;
> +	int ret;
> +
> +	/* Subdev */
> +
> +	v4l2_subdev_init(subdev, &sun8i_a83t_mipi_csi2_subdev_ops);
> +	subdev->dev = cdev->dev;
> +	strscpy(subdev->name, MODULE_NAME, sizeof(subdev->name));
> +	v4l2_set_subdevdata(subdev, cdev);
> +
> +	/* Entity */
> +
> +	subdev->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	subdev->entity.ops = &sun8i_a83t_mipi_csi2_entity_ops;
> +
> +	/* Pads */
> +
> +	video->pads[0].flags = MEDIA_PAD_FL_SINK;
> +	video->pads[1].flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&subdev->entity, 2, video->pads);
> +	if (ret)
> +		return ret;
> +
> +	/* Endpoint */
> +
> +	handle = fwnode_graph_get_endpoint_by_id(dev_fwnode(cdev->dev), 0, 0,
> +						 FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!handle)
> +		goto error_media_entity;

Missing error code.

> +
> +	endpoint = &video->endpoint;
> +	endpoint->bus_type = V4L2_MBUS_CSI2_DPHY;
> +
> +	ret = v4l2_fwnode_endpoint_parse(handle, endpoint);
> +	fwnode_handle_put(handle);
> +	if (ret)
> +		goto error_media_entity;
> +
> +	/* Notifier */
> +
> +	v4l2_async_notifier_init(notifier);
> +
> +	ret = v4l2_async_notifier_add_fwnode_remote_subdev(notifier, handle,
> +							   &video->subdev_async);
> +	if (ret)
> +		goto error_media_entity;
> +
> +	video->notifier.ops = &sun8i_a83t_mipi_csi2_notifier_ops;
> +
> +	ret = v4l2_async_subdev_notifier_register(subdev, notifier);
> +	if (ret < 0)
> +		goto error_notifier;
> +
> +	/* Subdev */
> +
> +	ret = v4l2_async_register_subdev(subdev);
> +	if (ret < 0)
> +		goto error_notifier_registered;
> +
> +	return 0;
> +
> +error_notifier_registered:
> +	v4l2_async_notifier_unregister(notifier);
> +error_notifier:
> +	v4l2_async_notifier_cleanup(notifier);
> +error_media_entity:
> +	media_entity_cleanup(&subdev->entity);
> +
> +	return ret;
> +}


regards,
dan carpenter

