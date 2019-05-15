Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D495B1E8C6
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2019 09:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbfEOHQG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 03:16:06 -0400
Received: from mga17.intel.com ([192.55.52.151]:38503 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbfEOHQG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 03:16:06 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 May 2019 00:16:06 -0700
X-ExtLoop1: 1
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008.fm.intel.com with ESMTP; 15 May 2019 00:16:02 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 223C720417; Wed, 15 May 2019 10:16:02 +0300 (EEST)
Date:   Wed, 15 May 2019 10:16:02 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] media: v4l2-subdev: Verify arguments in
 v4l2_subdev_call()
Message-ID: <20190515071601.knfdhwofz6ukjmxt@paasikivi.fi.intel.com>
References: <20190514224823.11564-1-jmkrzyszt@gmail.com>
 <20190514224823.11564-2-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190514224823.11564-2-jmkrzyszt@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Janusz,

On Wed, May 15, 2019 at 12:48:21AM +0200, Janusz Krzysztofik wrote:
> -static int check_crop(struct v4l2_subdev *sd, struct v4l2_subdev_crop *crop)
> +static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
>  {
> -	if (crop->which != V4L2_SUBDEV_FORMAT_TRY &&
> -	    crop->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +	if (sd->entity.num_pads && pad >= sd->entity.num_pads)

One more comment.

The num_pads doesn't really tell whether a given op is valid for a device.
Well, in this case it would have to be a bug in the driver, but those do
happen. How about checking for sd->entity.graph_obj.mdev instead? It's
non-NULL if the entity is registered with a media device, i.e. when these
callback functions are supposed to be called.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
