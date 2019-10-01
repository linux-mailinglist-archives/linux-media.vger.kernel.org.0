Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5420C2FAE
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2019 11:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729544AbfJAJJz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Oct 2019 05:09:55 -0400
Received: from gofer.mess.org ([88.97.38.141]:57177 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728892AbfJAJJz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Oct 2019 05:09:55 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 41796C6460; Tue,  1 Oct 2019 10:09:54 +0100 (BST)
Date:   Tue, 1 Oct 2019 10:09:54 +0100
From:   Sean Young <sean@mess.org>
To:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Benson Gui <Benson.Gui@synaptics.com>
Subject: Re: [PATCH] media: rc-map: Sort rc map name MACROs
Message-ID: <20191001090953.GA15901@gofer.mess.org>
References: <20190830152143.4ad42aeb@xhacker.debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830152143.4ad42aeb@xhacker.debian>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Fri, Aug 30, 2019 at 07:33:08AM +0000, Jisheng Zhang wrote:
> Except RC_MAP_SU3000 and RC_MAP_HAUPPAUGE, others are alphabetically
> sorted. Sort names alphabetically.
> 
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> ---
>  include/media/rc-map.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/media/rc-map.h b/include/media/rc-map.h
> index bebd3c4c6338..af71b08be9f2 100644
> --- a/include/media/rc-map.h
> +++ b/include/media/rc-map.h
> @@ -215,6 +215,7 @@ struct rc_map *rc_map_get(const char *name);
>  #define RC_MAP_GENIUS_TVGO_A11MCE        "rc-genius-tvgo-a11mce"
>  #define RC_MAP_GOTVIEW7135               "rc-gotview7135"
>  #define RC_MAP_HAUPPAUGE_NEW             "rc-hauppauge"
> +#define RC_MAP_HAUPPAUGE                 "rc-hauppauge"
>  #define RC_MAP_HISI_POPLAR               "rc-hisi-poplar"
>  #define RC_MAP_HISI_TV_DEMO              "rc-hisi-tv-demo"
>  #define RC_MAP_IMON_MCE                  "rc-imon-mce"
> @@ -253,13 +254,13 @@ struct rc_map *rc_map_get(const char *name);
>  #define RC_MAP_PROTEUS_2309              "rc-proteus-2309"
>  #define RC_MAP_PURPLETV                  "rc-purpletv"
>  #define RC_MAP_PV951                     "rc-pv951"
> -#define RC_MAP_HAUPPAUGE                 "rc-hauppauge"
>  #define RC_MAP_RC5_TV                    "rc-rc5-tv"
>  #define RC_MAP_RC6_MCE                   "rc-rc6-mce"
>  #define RC_MAP_REAL_AUDIO_220_32_KEYS    "rc-real-audio-220-32-keys"
>  #define RC_MAP_REDDO                     "rc-reddo"
>  #define RC_MAP_SNAPSTREAM_FIREFLY        "rc-snapstream-firefly"
>  #define RC_MAP_STREAMZAP                 "rc-streamzap"
> +#define RC_MAP_SU3000                    "rc-su3000"
>  #define RC_MAP_TANGO                     "rc-tango"
>  #define RC_MAP_TBS_NEC                   "rc-tbs-nec"
>  #define RC_MAP_TECHNISAT_TS35            "rc-technisat-ts35"
> @@ -282,7 +283,6 @@ struct rc_map *rc_map_get(const char *name);
>  #define RC_MAP_VIDEOMATE_TV_PVR          "rc-videomate-tv-pvr"
>  #define RC_MAP_WINFAST                   "rc-winfast"
>  #define RC_MAP_WINFAST_USBII_DELUXE      "rc-winfast-usbii-deluxe"
> -#define RC_MAP_SU3000                    "rc-su3000"
>  #define RC_MAP_XBOX_DVD                  "rc-xbox-dvd"
>  #define RC_MAP_ZX_IRDEC                  "rc-zx-irdec"

I'm afraid this doesn't make the list sorted. RC_MAP_X96MAX sorts before
RC_MAP_XBOX_DVD and RC_MAP_PIXELVIEW before RC_MAP_PIXELVIEW_NEW.

Thanks,
Sean
