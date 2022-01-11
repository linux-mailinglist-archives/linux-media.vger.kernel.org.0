Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38B3948AF4B
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 15:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240955AbiAKOQa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 09:16:30 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.168]:16683 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241536AbiAKOQ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 09:16:29 -0500
X-KPN-MessageId: f944a448-72e8-11ec-8862-005056aba152
Received: from smtp.kpnmail.nl (unknown [10.31.155.40])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id f944a448-72e8-11ec-8862-005056aba152;
        Tue, 11 Jan 2022 15:15:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=0VNHAXmWU74HlVywLpBKiaxyg46pA23UY0SoqLaG6rU=;
        b=mFdYG6vHnU9LbERWdm5ctMR2F5pBOl9Ufgvj2YuOnHFM2Z7q8V4NPYaJWt9x3T0Du6Kevmt1qUzig
         7HL2OQekUBJQRVyqXBRhvmqmcuLpwEJ+sjkowaKxUrx8uOVpjtHHzP0qz8b37IdvWkguR03jyP0JWn
         HdWHCTy+NM112pLQb57Y3OwBVqioASyIAI//wRbC78exLR322uU9mRvRqSaQ201wT7eREcrFD9kzd+
         jWRygC8vtraW7J2bd+/TKwjBqDX4+dr9IBCPjaLBeccvBQ+0xYzb1pVw6ZrTnVzJ/YLMkclECIIfdv
         ygje6yAtzy/Qd/mgPg4lxsYNHsIy77A==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|yZYDlZXeIZBo9OtHYHcgDzc/TtG6Zx8qH+yW8co0HGT55eQuQhTlxkwey6vlUFL
 wRxKLdYCshLDirdj2eLKy7Q==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 10aab5fe-72e9-11ec-b76f-005056ab7584;
        Tue, 11 Jan 2022 15:16:28 +0100 (CET)
Message-ID: <d46884f0-5c7f-aeb2-71b3-2fd664ab81aa@xs4all.nl>
Date:   Tue, 11 Jan 2022 15:16:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH v3] media: meson: vdec: Fix a NULL pointer dereference in
 amvdec_add_ts()
Content-Language: en-US
To:     Qingyang Zhou <zhou1615@umn.edu>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Kangjie Lu <kjlu@umn.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        linux-media@vger.kernel.org
References: <20211214144613.35fec82a@coco.lan>
 <20211215033535.40422-1-zhou1615@umn.edu>
 <368bc1b7-ff86-beaa-6749-afbe5960eaeb@xs4all.nl>
 <CA+Cm_xSOv5NnW5GXcKKGi8bQSvT45iH6=65YJk3EG6uW0c5_Vw@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CA+Cm_xSOv5NnW5GXcKKGi8bQSvT45iH6=65YJk3EG6uW0c5_Vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/01/2022 14:03, Qingyang Zhou wrote:
> Hi Hans:
> 
> Here I certify that this is an origin patch I wrote. I did not copy Neil's patch, and I did not know his patch.
> 
> Neil, please post your original patch here, so everyone can see both patches.

OK, so I have three variants:

Yours:

https://patchwork.linuxtv.org/project/linux-media/patch/20211215033535.40422-1-zhou1615@umn.edu/

v2 from Jiasheng Jiang:

https://patchwork.linuxtv.org/project/linux-media/patch/20211210015620.2143555-1-jiasheng@iscas.ac.cn/

And v1 from Jiasheng Jiang which in the reply contains Neil's patch which is almost identical to
both Jiasheng's v2 and your v3 (it's just missing a return 0).

https://patchwork.linuxtv.org/project/linux-media/patch/20211209085840.2081024-1-jiasheng@iscas.ac.cn/

So this is a case of parallel evolution. But regardless, I do prefer it if Neil can
post the patch: he's the driver maintainer, so I'd be happiest with a patch from him.

Regards,

	Hans

> 
> Yours 
> Zhou Qingyang.
> 
> On Tue, Jan 11, 2022 at 5:16 PM Hans Verkuil <hverkuil-cisco@xs4all.nl <mailto:hverkuil-cisco@xs4all.nl>> wrote:
> 
>     Zhou Qingyang, this is exactly the patch Neil wrote, except you just stuck your
>     name on it. Not nice.
> 
>     Neil, can you post your patch with your own Signed-off-by, then I'll take that one.
> 
>     Regards,
> 
>             Hans
> 
>     On 15/12/2021 04:35, Zhou Qingyang wrote:
>     > In amvdec_add_ts(), there is a dereference of kzalloc(), which could lead
>     > to a NULL pointer dereference on failure of kzalloc().
>     >
>     > Fix this bug by adding a NULL check of new_ts.
>     >
>     > This bug was found by a static analyzer[1].
>     >
>     > Builds with CONFIG_VIDEO_MESON_VDEC=m show no new warnings,
>     > and our static analyzer no longer warns about this code.
>     >
>     > Fixes: 876f123b8956 ("media: meson: vdec: bring up to compliance")
>     > Signed-off-by: Zhou Qingyang <zhou1615@umn.edu <mailto:zhou1615@umn.edu>>
>     > ---
>     >
>     > [1] The analysis employs differential checking to identify inconsistent
>     > security operations (e.g., checks or kfrees) between two code paths and
>     > confirms that the inconsistent operations are not recovered in the
>     > current function or the callers, so they constitute bugs.
>     >
>     > Note that, as a bug found by static analysis, it can be a false
>     > positive or hard to trigger. Multiple researchers have cross-reviewed
>     > the bug.
>     >
>     > Changes in v3:
>     >   -  Change the description of patch
>     >   -  Turn the return type from 'void' to 'int'
>     >   -  Check the return value in the caller 'esparser_queue()'
>     >
>     > Changes in v2:
>     >   -  Delete dev_err() message
>     >
>     >  drivers/staging/media/meson/vdec/esparser.c     | 7 ++++++-
>     >  drivers/staging/media/meson/vdec/vdec_helpers.c | 8 ++++++--
>     >  drivers/staging/media/meson/vdec/vdec_helpers.h | 4 ++--
>     >  3 files changed, 14 insertions(+), 5 deletions(-)
>     >
>     > diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
>     > index db7022707ff8..095100a50da8 100644
>     > --- a/drivers/staging/media/meson/vdec/esparser.c
>     > +++ b/drivers/staging/media/meson/vdec/esparser.c
>     > @@ -328,7 +328,12 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
>     > 
>     >       offset = esparser_get_offset(sess);
>     > 
>     > -     amvdec_add_ts(sess, vb->timestamp, vbuf->timecode, offset, vbuf->flags);
>     > +     ret = amvdec_add_ts(sess, vb->timestamp, vbuf->timecode, offset, vbuf->flags);
>     > +     if (!ret) {
>     > +             v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
>     > +             return ret;
>     > +     }
>     > +
>     >       dev_dbg(core->dev, "esparser: ts = %llu pld_size = %u offset = %08X flags = %08X\n",
>     >               vb->timestamp, payload_size, offset, vbuf->flags);
>     > 
>     > diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
>     > index b9125c295d1d..06fd66539797 100644
>     > --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
>     > +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
>     > @@ -227,13 +227,16 @@ int amvdec_set_canvases(struct amvdec_session *sess,
>     >  }
>     >  EXPORT_SYMBOL_GPL(amvdec_set_canvases);
>     > 
>     > -void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
>     > -                struct v4l2_timecode tc, u32 offset, u32 vbuf_flags)
>     > +int amvdec_add_ts(struct amvdec_session *sess, u64 ts,
>     > +               struct v4l2_timecode tc, u32 offset, u32 vbuf_flags)
>     >  {
>     >       struct amvdec_timestamp *new_ts;
>     >       unsigned long flags;
>     > 
>     >       new_ts = kzalloc(sizeof(*new_ts), GFP_KERNEL);
>     > +     if (!new_ts)
>     > +             return -ENOMEM;
>     > +
>     >       new_ts->ts = ts;
>     >       new_ts->tc = tc;
>     >       new_ts->offset = offset;
>     > @@ -242,6 +245,7 @@ void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
>     >       spin_lock_irqsave(&sess->ts_spinlock, flags);
>     >       list_add_tail(&new_ts->list, &sess->timestamps);
>     >       spin_unlock_irqrestore(&sess->ts_spinlock, flags);
>     > +     return 0;
>     >  }
>     >  EXPORT_SYMBOL_GPL(amvdec_add_ts);
>     > 
>     > diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
>     > index 88137d15aa3a..4bf3e61d081b 100644
>     > --- a/drivers/staging/media/meson/vdec/vdec_helpers.h
>     > +++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
>     > @@ -56,8 +56,8 @@ void amvdec_dst_buf_done_offset(struct amvdec_session *sess,
>     >   * @offset: offset in the VIFIFO where the associated packet was written
>     >   * @flags: the vb2_v4l2_buffer flags
>     >   */
>     > -void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
>     > -                struct v4l2_timecode tc, u32 offset, u32 flags);
>     > +int amvdec_add_ts(struct amvdec_session *sess, u64 ts,
>     > +               struct v4l2_timecode tc, u32 offset, u32 flags);
>     >  void amvdec_remove_ts(struct amvdec_session *sess, u64 ts);
>     > 
>     >  /**
> 

