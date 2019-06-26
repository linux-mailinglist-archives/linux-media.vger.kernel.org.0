Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2E105616B
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 06:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbfFZEZL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 00:25:11 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:33837 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfFZEZL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 00:25:11 -0400
Received: by mail-ed1-f67.google.com with SMTP id s49so1234930edb.1
        for <linux-media@vger.kernel.org>; Tue, 25 Jun 2019 21:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JGn88fpcggP80EkMgEhpFVRWZldlC/S/PfPy9x+l7EY=;
        b=hi8YC5l2qnHJT78/R3Yl+wiWfpyHlT9IXtzh1VS1PICGF31g3Sd4fkgIjvpsp8FRoa
         WlqxY21l97Rs1fnUZYuObwB0GeRk1VP1/z8vP6UQmCvp04MzAgdWJ3ZXXSogouCRq06O
         s597zeVBW3g4IN6wQn6Wu6HlR7dlexDixfOpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JGn88fpcggP80EkMgEhpFVRWZldlC/S/PfPy9x+l7EY=;
        b=YR01KewtpzG9zowlsO4DaKGuG3W74Ug9eBZyEmO/qMYZAmvHGjBQ3ibqkIIUY72SFG
         reMdRixpZsmeHQts2h6BQXGzMtK3XdV0ZC0NB/BIObUdgnylKS/106OjqXoHT7JgF4DS
         CDUgEq/ZYP9pfQQHs5v1/tv3J7rgLQXYuscfWqksLaZD68oTIzvw+npC9f+YQzbZhgqi
         /9OvYO26EmA3Gf/c8p19Vh/P/lbeKsd27i6JNwD3ZZWt8rxpbrveuCM+jJ+ocBQC3Ghx
         wJJ8gNHJEqLtc8HCMAwkFouYm3uQBe0zW3+/qQPccC5h01arOLk3WeCxI20uljL3Nw1T
         fAeg==
X-Gm-Message-State: APjAAAUaVx2frtDwx184L1f+KmlTJRMvRB7zCqCGDcUUxXxC006+YSUM
        o42RysrZpFwYKogv/zvAh3gPX2oNujHcFA==
X-Google-Smtp-Source: APXvYqxt0K11+gesI3JUSzxsZBNw6CyIirC7JMUa8D4aigyo6xICQxYo2BrLWosIci+tWrLfKVd4LQ==
X-Received: by 2002:a17:906:3d69:: with SMTP id r9mr1980708ejf.28.1561523109135;
        Tue, 25 Jun 2019 21:25:09 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id m3sm5091783edi.33.2019.06.25.21.25.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 21:25:07 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id k11so999392wrl.1
        for <linux-media@vger.kernel.org>; Tue, 25 Jun 2019 21:25:07 -0700 (PDT)
X-Received: by 2002:adf:f246:: with SMTP id b6mr1497996wrp.92.1561523106726;
 Tue, 25 Jun 2019 21:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190417104511.21514-1-frederic.chen@mediatek.com>
 <20190417104511.21514-7-frederic.chen@mediatek.com> <20190509094846.GA65444@google.com>
 <1561464978.23799.37.camel@mtksdccf07>
In-Reply-To: <1561464978.23799.37.camel@mtksdccf07>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 26 Jun 2019 13:24:54 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D8WDQJaN8SYKwOXyC9-YPRC1U58HirPVzL5969MSvkgA@mail.gmail.com>
Message-ID: <CAAFQd5D8WDQJaN8SYKwOXyC9-YPRC1U58HirPVzL5969MSvkgA@mail.gmail.com>
Subject: Re: [RFC PATCH V1 6/6] platform: mtk-isp: Add Mediatek DIP driver
To:     Frederic Chen <frederic.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        yuzhao@chromium.org, zwisler@chromium.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= 
        <Sean.Cheng@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
        =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= 
        <christie.yu@mediatek.com>,
        =?UTF-8?B?SG9sbWVzIENoaW91ICjpgrHmjLop?= 
        <holmes.chiou@mediatek.com>,
        Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>,
        =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
        =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        devicetree@vger.kernel.org, Shik Chen <shik@chromium.org>,
        suleiman@chromium.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frederic,

On Tue, Jun 25, 2019 at 9:16 PM Frederic Chen
<frederic.chen@mediatek.com> wrote:
>
> Dear Tomasz,
>
> Would you comment on the following points in further? Thank you for the
> review.
>
> On Thu, 2019-05-09 at 18:48 +0900, Tomasz Figa wrote:
> > Hi Frederic,
> >
>
> [snip]
>
> > > +int mtk_dip_pipe_job_start(struct mtk_dip_pipe *dip_pipe,
> > > +                          struct mtk_dip_pipe_job_info *pipe_job_info)
> > > +{
> > > +       struct platform_device *pdev = dip_pipe->dip_dev->pdev;
> > > +       int ret;
> > > +       int out_img_buf_idx;
> > > +       struct img_ipi_frameparam dip_param;
> > > +       struct mtk_dip_dev_buffer *dev_buf_in;
> > > +       struct mtk_dip_dev_buffer *dev_buf_out;
> > > +       struct mtk_dip_dev_buffer *dev_buf_tuning;
> > > +
> > > +       if (!pipe_job_info) {
> > > +               dev_err(&pdev->dev,
> > > +                       "pipe_job_info(%p) in start can't be NULL\n",
> > > +                       pipe_job_info);
> > > +               return -EINVAL;
> > > +       }
> >
> > This should be impossible to happen.
> >
> > > +
> > > +       /* We need RAW and at least MDP0 or MDP 1 buffer */
> > > +       if (!pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT] ||
> > > +           (!pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE] &&
> > > +                !pipe_job_info->buf_map[MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE])){
> > > +               struct mtk_dip_dev_buffer **map = pipe_job_info->buf_map;
> > > +
> > > +               dev_dbg(&pdev->dev,
> > > +                       "can't trigger job: raw(%p), mdp0(%p), mdp1(%p)\n",
> > > +                       map[MTK_DIP_VIDEO_NODE_ID_RAW_OUT],
> > > +                       map[MTK_DIP_VIDEO_NODE_ID_MDP0_CAPTURE],
> > > +                       map[MTK_DIP_VIDEO_NODE_ID_MDP1_CAPTURE]);
> > > +               return -EINVAL;
> >
> > This must be validated at the time of request_validate. We can't fail at
> > this stage anymore.
>
> After the modification about checking the required buffers in
> req_validate(), we got failed in the following testRequests()
> of V4L2 compliance test. The V4L2 compliance test case doesn't know
> which buffers of the video devices are required and expects that the
> MEDIA_REQUEST_IOC_QUEUE succeed when the request has any valid buffer.
>
> For example, when the request has MDP 0 buffer only, the DIP's
> req_validate() should return an error since it also need a buffer
> from RAW video device, but it make compliance test get failed.
>
> May I still check the required buffers in req_validate() in the next
> patch? I will add some note to explain that the compliance test failed
> item is related to the limitation?
>
> =======================================================
> int testRequests(struct node *node, bool test_streaming)
> // ......
> if (i)
>         fail_on_test(!buf.qbuf(node));
> buf.s_flags(buf.g_flags() | V4L2_BUF_FLAG_REQUEST_FD);
> buf.s_request_fd(buf_req_fds[i]);
> buf.s_field(V4L2_FIELD_ANY);
> fail_on_test(buf.qbuf(node));
> if (v4l_type_is_video(buf.g_type()) && v4l_type_is_output(buf.g_type()))
>         fail_on_test(buf.g_field() == V4L2_FIELD_ANY);
> fail_on_test(buf.querybuf(node, i));
>
> // ......
>
> // LINE 1807 in v4l2-test-buffers.cpp, we will got the  failed here.
> // Since we need one RAW and one MDP0 buffer at least.
> // v4l2-test-buffers.cpp(1807): doioctl_fd(buf_req_fds[i],
> // MEDIA_REQUEST_IOC_QUEUE, 0)
> //      test Requests: FAIL
> fail_on_test(doioctl_fd(buf_req_fds[i], MEDIA_REQUEST_IOC_QUEUE, 0));
> =======================================================
>

Sounds like a limitation of the compliance test. Request API testing
there is still new and possibly just made for simple mem-to-mem
devices.

Hans, the driver always requires some buffers to be given, like the
raw frame input, while other, e.g. downscaled output, are optional.
Any ideas?

> > > +
> > > +static int mtk_dip_vb2_queue_setup(struct vb2_queue *vq,
> > > +                                  unsigned int *num_buffers,
> > > +                                  unsigned int *num_planes,
> > > +                                  unsigned int sizes[],
> > > +                                  struct device *alloc_devs[])
> > > +{
> > > +       struct mtk_dip_pipe *dip_pipe = vb2_get_drv_priv(vq);
> > > +       struct mtk_dip_video_device *node =
> > > +               mtk_dip_vbq_to_node(vq);
> > > +       struct device *dev = &dip_pipe->dip_dev->pdev->dev;
> > > +       struct device *buf_alloc_ctx;
> > > +
>
> [snip]
>
> > > +
> > > +       if (vq->type == V4L2_BUF_TYPE_META_CAPTURE ||
> > > +           vq->type == V4L2_BUF_TYPE_META_OUTPUT)
> > > +               size = fmt->fmt.meta.buffersize;
> > > +       else
> > > +               size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
> > > +
> > > +       if (*num_planes) {
> > > +               if (sizes[0] < size) {
> > > +                       dev_dbg(dev, "%s:%s:%s: size error(user:%d, max:%d)\n",
> > > +                               __func__, dip_pipe->desc->name,
> > > +                               node->desc->name, sizes[0], size);
> > > +                       return -EINVAL;
> > > +               }
> >
> > I don't think this is an error. This is for handling VIDIOC_CREATE_BUFS,
> > which can allocate for any arbitrary format.
> >
> > Whether the size of the buffer is big enough for current format should be
> > checked in .buf_prepare callback.
>
> When executing V4L2 compliance test, we need to check this image size to
> pass the following q.create_bufs() test (LINE:709,
> v4l2-test-buffers.cpp).
>
> ========================================================
> node->g_fmt(fmt, q.g_type());
> //....
> fmt.s_height(fmt.g_height() / 2);
> for (unsigned p = 0; p < fmt.g_num_planes(); p++)
>         fmt.s_sizeimage(fmt.g_sizeimage(p) / 2, p);
>
> // LINE 709 in v4l2-test-buffers.cpp
> // It seems that the driver needs to return EINVAL when the buffer
> //size is smaller than the sizeimage required
>         fail_on_test(q.create_bufs(node, 1, &fmt) != EINVAL);
> ========================================================
>
> The kernel document has some similar description on VIDIOC_CREATE_BUFS.
>
> https://www.kernel.org/doc/html/latest/media/uapi/v4l/vidioc-create-bufs.html
>
> =======================================================
> Usually if the format.pix.sizeimage field is less than the minimum
> required for the given format, then an error will be returned since
> drivers will typically not allow this.
> =======================================================
>
> Should we check the image size of each plane here so that we can pass
> the test?

Note that "given format" there means the format field of
structv4l2_create_buffers, _not_ the currently active format. That's
really strange because we don't get that inside queue_setup.

Hans, how should we handle this in the driver? Right now we just call
vb2_create_bufs(), which doesn't care about anything else than
sizeimage. Do we need to implement our own .vidioc_create_bufs()
handler that validates the sizeimage wrt the other parts of the given
format before calling vb2_create_bufs()?

Another thing is that the spec isn't very precise on this, especially
given the "usually" and "typically" in the description quoted above.

Best regards,
Tomasz
