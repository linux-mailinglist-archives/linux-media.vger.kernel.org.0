Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11A281924DE
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 11:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbgCYKBF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 06:01:05 -0400
Received: from mga17.intel.com ([192.55.52.151]:47002 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726109AbgCYKBE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 06:01:04 -0400
IronPort-SDR: 7mK8EBfLFXsA0WT1iipMo+vWnlAOhEj37KeHdZOnuRtQGjeygLRi3oGsKgdDPeOo23DOcJR629
 pS/SOOepDjog==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2020 03:01:04 -0700
IronPort-SDR: Df9BL9YhXrQ6Iw5Q8oGdllynI4X3BnmYveyWadwicvs13Eq3qdC5+K8g18sKtdJmokOSnwiEkm
 0JTheD4/42DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,303,1580803200"; 
   d="scan'208";a="250364172"
Received: from lduhem-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.249.35.162])
  by orsmga006.jf.intel.com with ESMTP; 25 Mar 2020 03:01:02 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 254EC21F8C; Wed, 25 Mar 2020 12:01:00 +0200 (EET)
Date:   Wed, 25 Mar 2020 12:00:59 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 15/22] media: Kconfig: move media controller core
 select to main Kconfig
Message-ID: <20200325100059.GB22904@kekkonen.localdomain>
References: <cover.1585129041.git.mchehab+huawei@kernel.org>
 <ac58d0e580d93a190e44c79507dd4969679ecb36.1585129041.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac58d0e580d93a190e44c79507dd4969679ecb36.1585129041.git.mchehab+huawei@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Wed, Mar 25, 2020 at 10:49:29AM +0100, Mauro Carvalho Chehab wrote:
> Let's place the main API selections at the media/Kconfig file,
> as this way we can better organize things.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/Kconfig    | 9 +++++++++
>  drivers/media/mc/Kconfig | 9 ---------
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> index d6766085c91b..3872e46545e6 100644
> --- a/drivers/media/Kconfig
> +++ b/drivers/media/Kconfig
> @@ -144,6 +144,15 @@ config VIDEO_DEV
>  	depends on MEDIA_SUPPORT
>  	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || MEDIA_PLATFORM_SUPPORT
>  
> +config MEDIA_CONTROLLER
> +	bool "Media Controller API"
> +	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT
> +	help
> +	  Enable the media controller API used to query media devices internal
> +	  topology and configure it dynamically.
> +
> +	  This API is mostly used by camera interfaces in embedded platforms.
> +
>  source "drivers/media/v4l2-core/Kconfig"
>  
>  #
> diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
> index 3b9795cfcb36..b3579d6c9e32 100644
> --- a/drivers/media/mc/Kconfig
> +++ b/drivers/media/mc/Kconfig
> @@ -3,15 +3,6 @@
>  #	Selectable only for webcam/grabbers, as other drivers don't use it
>  #
>  
> -config MEDIA_CONTROLLER
> -	bool "Media Controller API"
> -	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT
> -	help
> -	  Enable the media controller API used to query media devices internal
> -	  topology and configure it dynamically.
> -
> -	  This API is mostly used by camera interfaces in embedded platforms.
> -
>  config MEDIA_CONTROLLER_DVB
>  	bool "Enable Media controller for DVB (EXPERIMENTAL)"
>  	depends on MEDIA_CONTROLLER && DVB_CORE

This moves the main MC configuration out of the directory but leaves the
rest of the MC configuration under the mc directory. All MC related
configuration is currently in a single place, which makes sense.

I guess you can always have arguments for and against, but my preference is
keeping it as-is.

-- 
Kind regards,

Sakari Ailus
