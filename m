Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5F481C77B
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 13:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfENLMx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 07:12:53 -0400
Received: from mga05.intel.com ([192.55.52.43]:36324 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725892AbfENLMw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 07:12:52 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 May 2019 04:12:51 -0700
X-ExtLoop1: 1
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007.fm.intel.com with ESMTP; 14 May 2019 04:12:49 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 3792220666; Tue, 14 May 2019 14:12:49 +0300 (EEST)
Date:   Tue, 14 May 2019 14:12:49 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] media: v4l2-subdev: Verify arguments of
 v4l2_subdev_call()
Message-ID: <20190514111248.vtjajwk3jvhvlqzb@paasikivi.fi.intel.com>
References: <20190511101031.4777-1-jmkrzyszt@gmail.com>
 <20190511101031.4777-2-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190511101031.4777-2-jmkrzyszt@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, May 11, 2019 at 12:10:30PM +0200, Janusz Krzysztofik wrote:
> +static int check_get_fmt(struct v4l2_subdev *sd,
> +			 struct v4l2_subdev_pad_config *cfg,
> +			 struct v4l2_subdev_format *format)
> +{
> +	return check_format(sd, format) ? :
> +	       sd->ops->pad->get_fmt(sd, cfg, format);

On naming --- when you're actually calling the function that does the job,
I'd call the wrapper e.g. call_something() instead. The current naming
suggests that only checks are being made.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
