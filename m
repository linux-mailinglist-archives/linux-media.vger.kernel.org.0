Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 605B33FEAD0
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 10:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244311AbhIBIuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 04:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233362AbhIBIuR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 04:50:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7476C061575
        for <linux-media@vger.kernel.org>; Thu,  2 Sep 2021 01:49:19 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D564532;
        Thu,  2 Sep 2021 10:49:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630572557;
        bh=VNapE0O/vbRtM01hqz/sPCbQjqYVQg7NBy3rUSDqSmc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=McVo7U9K1XxEAGDwbSASp/kxKXOlXVogFZ6vG+QhfNfkC8bNfRzxQ9VrSciPJKDaz
         hdLxbrPvYJGrXAph1ePJw3igPdmu7fiwyqkak95QjGX/zamZDxa3yyp0Rs/nBbTZ1T
         ZRgnLiNEWSeDLFs0IYtZB/BPhVdybPWKOEDTboeQ=
Date:   Thu, 2 Sep 2021 11:49:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org, enric.balletbo@collabora.com,
        acourbot@chromium.org, hsinyi@chromium.org, eizan@chromium.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/3] media: v4l2-ctl: Add support to
 VIDIOC_DQEVENT_TIME32 on non x86_64 arch
Message-ID: <YTCP/HwvU3F2rmL/@pendragon.ideasonboard.com>
References: <20210728100624.16129-1-dafna.hirschfeld@collabora.com>
 <20210728100624.16129-4-dafna.hirschfeld@collabora.com>
 <305a4bb4-fc04-e773-33e6-3c6412949a4e@xs4all.nl>
 <9e491460-7fcd-28b2-68d9-9f022dd9f8ca@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9e491460-7fcd-28b2-68d9-9f022dd9f8ca@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(CC'ing Arnd)

On Thu, Sep 02, 2021 at 10:39:46AM +0200, Hans Verkuil wrote:
> On 02/09/2021 10:24, Hans Verkuil wrote:
> > On 28/07/2021 12:06, Dafna Hirschfeld wrote:
> >> Currently, if the ioctl VIDIOC_DQEVENT_TIME32 is called on e.g. Arm-64
> >> the function 'v4l2_compat_translate_cmd' doesn't have a 'translation'
> >> for the cmd and so 'cmd' is returned as is. This cause
> >> a failure '-ENOTTY' in __video_do_ioctl.
> > 
> > I don't really see how this would happen. As far as I can tell (and admittedly,
> > the code is hard to follow) on such a system there is no need for any 32-bit to
> > 64-bit conversion in v4l2-compat-ioctl32.c since struct v4l2_event_time32 is the
> > same for both architectures.
> > 
> > And in v4l2-ioctl.c VIDIOC_DQEVENT_TIME32 is handled correctly as far as I can
> > tell. Where exactly does the return -ENOTTY happen?
> > 
> > It definitely does not make sense to modify v4l2-compat-ioctl32.c if there is
> > nothing to convert between 32 and 64 bit. If there is a bug, then that should be
> > in v4l2-ioctl.c.
> > 
> > Note that it is perfectly possible that there is a bug for arm64 and this ioctl,
> > since that's the one combination I've never tested since I don't have a test setup
> > for that.
> 
> How did you test this anyway? With which libc/compiler? It would be nice if I could
> test this myself on e.g. a Raspberry Pi.
> 
> Regards,
> 
> 	Hans
> 
> > 
> > Regards,
> > 
> > 	Hans
> > 
> >> This patch fixes it by defining VIDIOC_DQEVENT32_TIME32 to be
> >> VIDIOC_DQEVENT_TIME32 for non x86-64 arch and translates it
> >> to VIDIOC_DQEVENT.
> >> In addition, add a call to put_v4l2_event_time32 to copy the data
> >> to userspace for non x86-64 arch
> >>
> >> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >> ---
> >>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 21 ++++++++++++-------
> >>  include/media/v4l2-ioctl.h                    |  3 +++
> >>  2 files changed, 16 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> >> index 5623003a9705..20a80880d9b7 100644
> >> --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> >> +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> >> @@ -871,9 +871,13 @@ static int put_v4l2_edid32(struct v4l2_edid *p64,
> >>  #define VIDIOC_QUERYBUF32_TIME32	_IOWR('V',  9, struct v4l2_buffer32_time32)
> >>  #define VIDIOC_QBUF32_TIME32		_IOWR('V', 15, struct v4l2_buffer32_time32)
> >>  #define VIDIOC_DQBUF32_TIME32		_IOWR('V', 17, struct v4l2_buffer32_time32)
> >> +
> >>  #ifdef CONFIG_X86_64
> >>  #define	VIDIOC_DQEVENT32_TIME32		_IOR ('V', 89, struct v4l2_event32_time32)
> >> +#else
> >> +#define	VIDIOC_DQEVENT32_TIME32		VIDIOC_DQEVENT_TIME32
> >>  #endif
> >> +
> >>  #define VIDIOC_PREPARE_BUF32_TIME32	_IOWR('V', 93, struct v4l2_buffer32_time32)
> >>  #endif
> >>  
> >> @@ -899,6 +903,8 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
> >>  		return VIDIOC_DQBUF;
> >>  	case VIDIOC_PREPARE_BUF32_TIME32:
> >>  		return VIDIOC_PREPARE_BUF;
> >> +	case VIDIOC_DQEVENT32_TIME32:
> >> +		return VIDIOC_DQEVENT;
> >>  #endif
> >>  	case VIDIOC_QUERYBUF32:
> >>  		return VIDIOC_QUERYBUF;
> >> @@ -927,10 +933,6 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
> >>  #ifdef CONFIG_X86_64
> >>  	case VIDIOC_DQEVENT32:
> >>  		return VIDIOC_DQEVENT;
> >> -#ifdef CONFIG_COMPAT_32BIT_TIME
> >> -	case VIDIOC_DQEVENT32_TIME32:
> >> -		return VIDIOC_DQEVENT;
> >> -#endif
> >>  #endif
> >>  	}
> >>  	return cmd;
> >> @@ -996,6 +998,13 @@ int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd)
> >>  	case VIDIOC_DQBUF32_TIME32:
> >>  	case VIDIOC_PREPARE_BUF32_TIME32:
> >>  		return put_v4l2_buffer32_time32(parg, arg);
> >> +	case VIDIOC_DQEVENT32_TIME32:
> >> +#ifdef CONFIG_X86_64
> >> +		return put_v4l2_event32_time32(parg, arg);
> >> +#else
> >> +		return put_v4l2_event_time32(parg, arg);
> >> +#endif
> >> +
> >>  #endif
> >>  	case VIDIOC_QUERYBUF32:
> >>  	case VIDIOC_QBUF32:
> >> @@ -1023,10 +1032,6 @@ int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd)
> >>  #ifdef CONFIG_X86_64
> >>  	case VIDIOC_DQEVENT32:
> >>  		return put_v4l2_event32(parg, arg);
> >> -#ifdef CONFIG_COMPAT_32BIT_TIME
> >> -	case VIDIOC_DQEVENT32_TIME32:
> >> -		return put_v4l2_event32_time32(parg, arg);
> >> -#endif
> >>  #endif
> >>  	}
> >>  	return 0;
> >> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> >> index 0c209bbbc76f..3840a3ea384c 100644
> >> --- a/include/media/v4l2-ioctl.h
> >> +++ b/include/media/v4l2-ioctl.h
> >> @@ -786,7 +786,10 @@ struct v4l2_buffer_time32 {
> >>  };
> >>  
> >>  /*
> >> + * For architectures other than x86_64, the struct v4l2_event32_time32
> >> + * is the same as v4l2_event_time32.
> >>   * This function is used to copy the struct v4l2_event_time32 to userspace
> >> + * if either the kernel is not 64-bit or if the architecture is other than x86_64.
> >>   */
> >>  int put_v4l2_event_time32(void *parg, void __user *arg);
> >>  

-- 
Regards,

Laurent Pinchart
