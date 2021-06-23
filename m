Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE4F3B2376
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 00:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhFWWRy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 18:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbhFWWRo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 18:17:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0FE3C08EB27;
        Wed, 23 Jun 2021 15:12:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A231387F;
        Thu, 24 Jun 2021 00:12:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624486361;
        bh=vol6kpF3aMCgA3x4WowIw9eVw+hdIqAus2kw55MDYxY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dMXQcq5CVQjM+KHZhIk+qm+BeerbmD0wljQWPTO4ILDSGjR0sQ7G0cJ5vj7je84q+
         wSNUGFO6zWu2twX7jkNsl3pLl1tgcmn2c4LY+Ksq71Llds8v3XqOaB+KuWwahHhYw2
         g4zxjKM5rZI3fwEzYD/GDS13Hd7mcJ+CXFahwnAA=
Date:   Thu, 24 Jun 2021 01:12:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: omap3isp: Extract struct group for memcpy() region
Message-ID: <YNOxuybjpLxr6sin@pendragon.ideasonboard.com>
References: <20210616185938.1225218-1-keescook@chromium.org>
 <YMpUR34kFSbiyi+q@pendragon.ideasonboard.com>
 <202106162119.859E9A80B@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202106162119.859E9A80B@keescook>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kees,

On Wed, Jun 16, 2021 at 09:22:23PM -0700, Kees Cook wrote:
> On Wed, Jun 16, 2021 at 10:43:03PM +0300, Laurent Pinchart wrote:
> > On Wed, Jun 16, 2021 at 11:59:38AM -0700, Kees Cook wrote:
> > > Avoid writing past the end of a structure member by wrapping the target
> > > region in a common named structure. This additionally fixes a
> > > misalignment of the copy (since the size of "buf" changes between 64-bit
> > > and 32-bit).
> > 
> > Could you have been mislead by the data64 name ? The difference between
> > omap3isp_stat_data_time and omap3isp_stat_data_time32 is the size of the
> > ts field, using 32-bit timestamps with legacy userspace, and 64-bit
> > timestamps with more recent userspace. In both cases we're dealing with
> > a 32-bit platform, as the omap3isp is not used in any 64-bit ARM SoC.
> > The size of void __user *buf is thus 4 bytes in all cases, as is __u32
> > buf.
> 
> Ah, yes, that's true. I was hitting this on arm64 builds
> (CONFIG_COMPILE_TEST) where __user *buf is 64-bit. So, the "additionally
> fixes" bit above is misleading in the sense that nothing was ever built
> in the real world like that.
> 
> The patch still fixes the compile-time warnings, though.

I What's the compile-time warning ? I tried compiling the driver for
ARM64 and didn't notice any.

> However, I don't think anything actually uses any of this code
> regardless. ;)
> 
> > > I actually think this code is completely unused in the real world:
> > > I don't think it could have ever worked, as it would either always
> > > fail (with an uninitialized data->buf_size) or would cause corruption
> > > in userspace due to the copy_to_user() in the call path against an
> > > uninitialized data->buf value:
> > > 
> > > omap3isp_stat_request_statistics_time32(...)
> > >     struct omap3isp_stat_data data64;
> > >     ...
> > >     omap3isp_stat_request_statistics(stat, &data64);
> > > 
> > > int omap3isp_stat_request_statistics(struct ispstat *stat,
> > >                                      struct omap3isp_stat_data *data)
> > >     ...
> > >     buf = isp_stat_buf_get(stat, data);
> > > 
> > > static struct ispstat_buffer *isp_stat_buf_get(struct ispstat *stat,
> > >                                                struct omap3isp_stat_data *data)
> > > ...
> > >     if (buf->buf_size > data->buf_size) {
> > >             ...
> > >             return ERR_PTR(-EINVAL);
> > >     }
> > >     ...
> > >     rval = copy_to_user(data->buf,
> > >                         buf->virt_addr,
> > >                         buf->buf_size);
> > > 
> > > Regardless, additionally initialize data64 to be zero-filled to avoid
> > > undefined behavior.
> > > 
> > > Fixes: 378e3f81cb56 ("media: omap3isp: support 64-bit version of omap3isp_stat_data")
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > ---
> > >  drivers/media/platform/omap3isp/ispstat.c |  5 +--
> > >  include/uapi/linux/omap3isp.h             | 44 +++++++++++++++++------
> > >  2 files changed, 36 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/omap3isp/ispstat.c b/drivers/media/platform/omap3isp/ispstat.c
> > > index 5b9b57f4d9bf..ea8222fed38e 100644
> > > --- a/drivers/media/platform/omap3isp/ispstat.c
> > > +++ b/drivers/media/platform/omap3isp/ispstat.c
> > > @@ -512,7 +512,7 @@ int omap3isp_stat_request_statistics(struct ispstat *stat,
> > >  int omap3isp_stat_request_statistics_time32(struct ispstat *stat,
> > >  					struct omap3isp_stat_data_time32 *data)
> > >  {
> > > -	struct omap3isp_stat_data data64;
> > > +	struct omap3isp_stat_data data64 = { };
> > >  	int ret;
> > >  
> > >  	ret = omap3isp_stat_request_statistics(stat, &data64);
> > > @@ -521,7 +521,8 @@ int omap3isp_stat_request_statistics_time32(struct ispstat *stat,
> > >  
> > >  	data->ts.tv_sec = data64.ts.tv_sec;
> > >  	data->ts.tv_usec = data64.ts.tv_usec;
> > > -	memcpy(&data->buf, &data64.buf, sizeof(*data) - sizeof(data->ts));
> > > +	data->buf = (uintptr_t)data64.buf;
> > > +	memcpy(&data->frame, &data64.buf, sizeof(data->frame));
> > >  
> > >  	return 0;
> > >  }
> > > diff --git a/include/uapi/linux/omap3isp.h b/include/uapi/linux/omap3isp.h
> > > index 87b55755f4ff..0a16af91621f 100644
> > > --- a/include/uapi/linux/omap3isp.h
> > > +++ b/include/uapi/linux/omap3isp.h
> > > @@ -159,13 +159,25 @@ struct omap3isp_h3a_aewb_config {
> > >  };
> > >  
> > >  /**
> > > - * struct omap3isp_stat_data - Statistic data sent to or received from user
> > > - * @ts: Timestamp of returned framestats.
> > > - * @buf: Pointer to pass to user.
> > > + * struct omap3isp_stat_frame - Statistic data without timestamp nor pointer.
> > > + * @buf_size: Size of buffer.
> > >   * @frame_number: Frame number of requested stats.
> > >   * @cur_frame: Current frame number being processed.
> > >   * @config_counter: Number of the configuration associated with the data.
> > >   */
> > > +struct omap3isp_stat_frame {
> > > +	__u32 buf_size;
> > > +	__u16 frame_number;
> > > +	__u16 cur_frame;
> > > +	__u16 config_counter;
> > > +};
> > > +
> > > +/**
> > > + * struct omap3isp_stat_data - Statistic data sent to or received from user
> > > + * @ts: Timestamp of returned framestats.
> > > + * @buf: Pointer to pass to user.
> > > + * @frame: Statistic data for frame.
> > > + */
> > >  struct omap3isp_stat_data {
> > >  #ifdef __KERNEL__
> > >  	struct {
> > > @@ -176,10 +188,15 @@ struct omap3isp_stat_data {
> > >  	struct timeval ts;
> > >  #endif
> > >  	void __user *buf;
> > > -	__u32 buf_size;
> > > -	__u16 frame_number;
> > > -	__u16 cur_frame;
> > > -	__u16 config_counter;
> > > +	union {
> > > +		struct {
> > > +			__u32 buf_size;
> > > +			__u16 frame_number;
> > > +			__u16 cur_frame;
> > > +			__u16 config_counter;
> > > +		};
> > > +		struct omap3isp_stat_frame frame;
> > > +	};
> > >  };
> > >  
> > >  #ifdef __KERNEL__
> > > @@ -189,10 +206,15 @@ struct omap3isp_stat_data_time32 {
> > >  		__s32	tv_usec;
> > >  	} ts;
> > >  	__u32 buf;
> > > -	__u32 buf_size;
> > > -	__u16 frame_number;
> > > -	__u16 cur_frame;
> > > -	__u16 config_counter;
> > > +	union {
> > > +		struct {
> > > +			__u32 buf_size;
> > > +			__u16 frame_number;
> > > +			__u16 cur_frame;
> > > +			__u16 config_counter;
> > > +		};
> > > +		struct omap3isp_stat_frame frame;
> > > +	};
> > >  };
> > >  #endif
> > >  

-- 
Regards,

Laurent Pinchart
