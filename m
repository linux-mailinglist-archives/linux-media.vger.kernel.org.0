Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C741F919E
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 10:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729009AbgFOIgU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 04:36:20 -0400
Received: from mga17.intel.com ([192.55.52.151]:54779 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728649AbgFOIgU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 04:36:20 -0400
IronPort-SDR: AVepICemMQsqfWqocez1wQG33PzWJROdcvHIU+kbH7dyd3wJcXwCusrDVGgKcsn+hBkQcg8zXb
 oCO/t5YRF31A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 01:36:19 -0700
IronPort-SDR: 4Ac4NJiwwZ+NksetaEqoasteemgjosEJjMpHlHdHU/xxK7yhyikgAgIocwSiiTKIvQoYCiSwdo
 WhREz2OWqQHA==
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="308056688"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 01:36:16 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id E4BF020448; Mon, 15 Jun 2020 11:36:14 +0300 (EEST)
Date:   Mon, 15 Jun 2020 11:36:14 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/9] media: v4l2-subdv: Introduce
 [get|set]_mbus_config pad ops
Message-ID: <20200615083614.GQ16711@paasikivi.fi.intel.com>
References: <20200611161651.264633-1-jacopo+renesas@jmondi.org>
 <20200611161651.264633-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611161651.264633-2-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

s/subd\Kv/ev/ in the subject.

On Thu, Jun 11, 2020 at 06:16:43PM +0200, Jacopo Mondi wrote:
> Introduce two new pad operations to allow retrieving and configuring the
> media bus parameters on a subdevice pad.
> 
> The newly introduced operations aims to replace the s/g_mbus_config video
> operations, which have been on their way for deprecation since a long
> time.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  include/media/v4l2-subdev.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index f7fe78a6f65a..90d9dfa92cf0 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -670,6 +670,29 @@ struct v4l2_subdev_pad_config {
>   *
>   * @set_frame_desc: set the low level media bus frame parameters, @fd array
>   *                  may be adjusted by the subdev driver to device capabilities.
> + *
> + * @get_mbus_config: get the media bus configuration of a remote sub-device.
> + *		     The media bus configuration is usually retrieved from the
> + *		     firmware interface at sub-device probe time, immediately
> + *		     applied to the hardware and eventually adjusted by the
> + *		     driver. Remote sub-devices (usually video receivers) shall
> + *		     use this operation to query the transmitting end bus
> + *		     configuration in order to adjust their own one accordingly.
> + *		     Callers should make sure they get the most up-to-date as
> + *		     possible configuration from the remote end, likely calling
> + *		     this operation as close as possible to stream on time. The
> + *		     operation is allowed to fail if the pad index it has been
> + *		     called on is not valid.

Shouldn't it always fail in that case? I.e. s/is allowed to/shall/ .

> + *
> + * @set_mbus_config: set the media bus configuration of a remote sub-device.
> + *		     This operations is intended to allow, in combination with
> + *		     the get_mbus_config operation, the negotiation of media bus
> + *		     configuration parameters between media sub-devices. The
> + *		     operation shall not fail if the requested configuration is
> + *		     not supported, but the driver shall update the content of
> + *		     the %config argument to reflect what has been actually
> + *		     applied to the hardware. The operation is allowed to fail
> + *		     if the pad index it has been called on is not valid.
>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*init_cfg)(struct v4l2_subdev *sd,
> @@ -710,6 +733,10 @@ struct v4l2_subdev_pad_ops {
>  			      struct v4l2_mbus_frame_desc *fd);
>  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
>  			      struct v4l2_mbus_frame_desc *fd);
> +	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> +			       struct v4l2_mbus_config *config);
> +	int (*set_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> +			       struct v4l2_mbus_config *config);
>  };
>  
>  /**

-- 
Kind regards,

Sakari Ailus
