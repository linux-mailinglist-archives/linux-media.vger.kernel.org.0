Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16C7733D25F
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 12:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237002AbhCPLDA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 07:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237004AbhCPLCd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 07:02:33 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2EEC061762
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 04:02:33 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id v14so15424538pgq.2
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 04:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1LVjUoUKXm7FsxD4sNTz87mVaO1PBBHxa9gw0uYkS4k=;
        b=IpHXM0oXiw4jjywx+X1sTYVH2tWV+/PlIcYbDKGyTm7jkZE7OMeuxf9ctrW60RcmL8
         F6tZ+3RiJBgiEgcStQPnilJ9PrKbrfxlKbxTTiDrCbLbFDcNMQv7Hg2Ky+vwbyPB5BLE
         JehzN3iXDRtsOzC/djFi8HL7RqjVlBvu+n4FEJSMSvTsFaXL/Wii63KsEt+4za9/ZiYq
         6s+v9qRMe4/U8GwMcwTyEeWEi5weZrgQcDe8wUdRwP/UiAtwdAXk8/x0o5NxKXOLRyCz
         63v2QMQ4FMEWto9dOuOIh+RkcO5j0bGT2eCf9sdKFNbXmNmGk7cIghIHx6fSnO5Lob1v
         MYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1LVjUoUKXm7FsxD4sNTz87mVaO1PBBHxa9gw0uYkS4k=;
        b=KvDsEWe7sGd079/mDb4gqQUVNr/XAScTZyx6N6/IUVY4tz6yYtSY2l7nJa5sQlQpnf
         q+BJX/2hDrImmPqTq6oDYeQXVNgWrMnj8pv1yVxo04Y48t611A3rGuX1qeQq/rRF68cb
         oOaVJE3EWAO9BOdIfyzpLBLPD6M0V/447vVfLCeNArV6JPNSSfB16OEraGRXrJ0lih6A
         ijm9PGwjFYkGTvFfLVkaBRaklLjty5qi2aFjeZATT9GMDivTVvpg0Wx7wJGmAhVTo4Ud
         Z9tTSWvbR5mSQesKWRhY6NOX76awAER2b5Wa5WQbjQyVmHexMaUG28gunsCMyzFow25j
         MoTQ==
X-Gm-Message-State: AOAM532Yc0hP2Fn23IW9pK7IUZa/YCEMY5FvfLKGPF8jyDVt+Rr5UBQf
        pq30JZ9rrd0yI+nHovhNRYCMQX7SoZMC8V2L12w78g==
X-Google-Smtp-Source: ABdhPJytwDjMxe8LwG/BHqKor9Zn9/GEW6yMYHEIa7hnTHfy2FDsmrF8YFkhcn/uO9rVH3qYGC1nOyKBKgz94K+bSuU=
X-Received: by 2002:a05:6a00:b54:b029:207:2a04:7b05 with SMTP id
 p20-20020a056a000b54b02902072a047b05mr9353340pfo.12.1615892552290; Tue, 16
 Mar 2021 04:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210315155942.640889-1-robert.foss@linaro.org>
 <20210315155942.640889-7-robert.foss@linaro.org> <d11ad801-e387-dcd8-1737-1cbc69dea046@xs4all.nl>
In-Reply-To: <d11ad801-e387-dcd8-1737-1cbc69dea046@xs4all.nl>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 16 Mar 2021 12:02:21 +0100
Message-ID: <CAG3jFyt6fu6VD8Svrupb7MPKeN7boYeOUcUycs4g2jsZLxdbOA@mail.gmail.com>
Subject: Re: [PATCH v8 06/22] media: camss: Refactor VFE HW version support
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        angelogioacchino.delregno@somainline.org,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey Hans,

Thanks for having a look!

On Tue, 16 Mar 2021 at 10:41, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 15/03/2021 16:59, Robert Foss wrote:
> > In order to support Qualcomm ISP hardware architectures that diverge
> > from older architectures, the VFE subdevice driver needs to be refactored
> > to better abstract the different ISP architectures.
> >
> > Gen1 represents the CAMSS ISP architecture. The ISP architecture developed
> > after CAMSS, Titan, will be referred to as Gen2.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> > ---
> >
> >
>
> <snip>
>
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> > index 5bce6736e4bb..ceff4985b1cc 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> > @@ -17,15 +17,26 @@
> >  #include <media/v4l2-subdev.h>
> >
> >  #include "camss-video.h"
> > +#include "camss-vfe-gen1.h"
> >
> >  #define MSM_VFE_PAD_SINK 0
> >  #define MSM_VFE_PAD_SRC 1
> >  #define MSM_VFE_PADS_NUM 2
> >
> > -#define MSM_VFE_LINE_NUM 4
> >  #define MSM_VFE_IMAGE_MASTERS_NUM 7
> >  #define MSM_VFE_COMPOSITE_IRQ_NUM 4
> >
> > +/* VFE halt timeout */
> > +#define VFE_HALT_TIMEOUT_MS 100
> > +/* Frame drop value. VAL + UPDATES - 1 should not exceed 31 */
> > +#define VFE_FRAME_DROP_VAL 30
> > +
> > +#define vfe_line_array(ptr_line)     \
> > +     ((const struct vfe_line (*)[]) &(ptr_line[-(ptr_line->id)]))
>
> I get a checkpatch warning on this:
>
> CHECK: Unnecessary parentheses around ptr_line[-(ptr_line->id)]
> #3612: FILE: drivers/media/platform/qcom/camss/camss-vfe.h:35:
> +       ((const struct vfe_line (*)[]) &(ptr_line[-(ptr_line->id)]))
>
> This should be:
>
>         ((const struct vfe_line (*)[]) &(ptr_line)[-(ptr_line)->id])
>
> The checkpatch message is a bit odd, the real problem here is the missing
> parenthesis around ptr_line: this would cause problems if ptr_line is an
> expression like 'ptr + 5', which would lead to a bad expansion.
>

Ack

> Regards,
>
>         Hans
>
> > +
> > +#define to_vfe(ptr_line)     \
> > +     container_of(vfe_line_array(ptr_line), struct vfe_device, line)
> > +
> >  enum vfe_output_state {
> >       VFE_OUTPUT_OFF,
> >       VFE_OUTPUT_RESERVED,
> > @@ -40,23 +51,30 @@ enum vfe_line_id {
> >       VFE_LINE_RDI0 = 0,
> >       VFE_LINE_RDI1 = 1,
> >       VFE_LINE_RDI2 = 2,
> > -     VFE_LINE_PIX = 3
> > +     VFE_LINE_PIX = 3,
> > +     VFE_LINE_NUM_GEN1 = 4,
> > +     VFE_LINE_NUM_MAX = 4
> >  };
> >
> >  struct vfe_output {
> >       u8 wm_num;
> >       u8 wm_idx[3];
> >
> > -     int active_buf;
> >       struct camss_buffer *buf[2];
> >       struct camss_buffer *last_buffer;
> >       struct list_head pending_bufs;
> >
> >       unsigned int drop_update_idx;
> >
> > +     union {
> > +             struct {
> > +                     int active_buf;
> > +                     int wait_sof;
> > +             } gen1;
> > +     };
> >       enum vfe_output_state state;
> >       unsigned int sequence;
> > -     int wait_sof;
> > +
> >       int wait_reg_update;
> >       struct completion sof;
> >       struct completion reg_update;
> > @@ -78,59 +96,19 @@ struct vfe_line {
> >  struct vfe_device;
> >
> >  struct vfe_hw_ops {
> > -     void (*hw_version_read)(struct vfe_device *vfe, struct device *dev);
> > -     u16 (*get_ub_size)(u8 vfe_id);
> > +     void (*enable_irq_common)(struct vfe_device *vfe);
> >       void (*global_reset)(struct vfe_device *vfe);
> > -     void (*halt_request)(struct vfe_device *vfe);
> > -     void (*halt_clear)(struct vfe_device *vfe);
> > -     void (*wm_enable)(struct vfe_device *vfe, u8 wm, u8 enable);
> > -     void (*wm_frame_based)(struct vfe_device *vfe, u8 wm, u8 enable);
> > -     void (*wm_line_based)(struct vfe_device *vfe, u32 wm,
> > -                           struct v4l2_pix_format_mplane *pix,
> > -                           u8 plane, u32 enable);
> > -     void (*wm_set_framedrop_period)(struct vfe_device *vfe, u8 wm, u8 per);
> > -     void (*wm_set_framedrop_pattern)(struct vfe_device *vfe, u8 wm,
> > -                                      u32 pattern);
> > -     void (*wm_set_ub_cfg)(struct vfe_device *vfe, u8 wm, u16 offset,
> > -                           u16 depth);
> > -     void (*bus_reload_wm)(struct vfe_device *vfe, u8 wm);
> > -     void (*wm_set_ping_addr)(struct vfe_device *vfe, u8 wm, u32 addr);
> > -     void (*wm_set_pong_addr)(struct vfe_device *vfe, u8 wm, u32 addr);
> > -     int (*wm_get_ping_pong_status)(struct vfe_device *vfe, u8 wm);
> > -     void (*bus_enable_wr_if)(struct vfe_device *vfe, u8 enable);
> > -     void (*bus_connect_wm_to_rdi)(struct vfe_device *vfe, u8 wm,
> > -                                   enum vfe_line_id id);
> > -     void (*wm_set_subsample)(struct vfe_device *vfe, u8 wm);
> > -     void (*bus_disconnect_wm_from_rdi)(struct vfe_device *vfe, u8 wm,
> > -                                        enum vfe_line_id id);
> > -     void (*set_xbar_cfg)(struct vfe_device *vfe, struct vfe_output *output,
> > -                          u8 enable);
> > -     void (*set_rdi_cid)(struct vfe_device *vfe, enum vfe_line_id id,
> > -                         u8 cid);
> > -     void (*set_realign_cfg)(struct vfe_device *vfe, struct vfe_line *line,
> > -                             u8 enable);
> > +     void (*hw_version_read)(struct vfe_device *vfe, struct device *dev);
> > +     irqreturn_t (*isr)(int irq, void *dev);
> > +     void (*isr_read)(struct vfe_device *vfe, u32 *value0, u32 *value1);
> >       void (*reg_update)(struct vfe_device *vfe, enum vfe_line_id line_id);
> >       void (*reg_update_clear)(struct vfe_device *vfe,
> >                                enum vfe_line_id line_id);
> > -     void (*enable_irq_wm_line)(struct vfe_device *vfe, u8 wm,
> > -                                enum vfe_line_id line_id, u8 enable);
> > -     void (*enable_irq_pix_line)(struct vfe_device *vfe, u8 comp,
> > -                                 enum vfe_line_id line_id, u8 enable);
> > -     void (*enable_irq_common)(struct vfe_device *vfe);
> > -     void (*set_demux_cfg)(struct vfe_device *vfe, struct vfe_line *line);
> > -     void (*set_scale_cfg)(struct vfe_device *vfe, struct vfe_line *line);
> > -     void (*set_crop_cfg)(struct vfe_device *vfe, struct vfe_line *line);
> > -     void (*set_clamp_cfg)(struct vfe_device *vfe);
> > -     void (*set_qos)(struct vfe_device *vfe);
> > -     void (*set_ds)(struct vfe_device *vfe);
> > -     void (*set_cgc_override)(struct vfe_device *vfe, u8 wm, u8 enable);
> > -     void (*set_camif_cfg)(struct vfe_device *vfe, struct vfe_line *line);
> > -     void (*set_camif_cmd)(struct vfe_device *vfe, u8 enable);
> > -     void (*set_module_cfg)(struct vfe_device *vfe, u8 enable);
> > -     int (*camif_wait_for_stop)(struct vfe_device *vfe, struct device *dev);
> > -     void (*isr_read)(struct vfe_device *vfe, u32 *value0, u32 *value1);
> > +     void (*subdev_init)(struct device *dev, struct vfe_device *vfe);
> > +     int (*vfe_disable)(struct vfe_line *line);
> > +     int (*vfe_enable)(struct vfe_line *line);
> > +     int (*vfe_halt)(struct vfe_device *vfe);
> >       void (*violation_read)(struct vfe_device *vfe);
> > -     irqreturn_t (*isr)(int irq, void *dev);
> >  };
> >
> >  struct vfe_isr_ops {
> > @@ -158,11 +136,14 @@ struct vfe_device {
> >       int stream_count;
> >       spinlock_t output_lock;
> >       enum vfe_line_id wm_output_map[MSM_VFE_IMAGE_MASTERS_NUM];
> > -     struct vfe_line line[MSM_VFE_LINE_NUM];
> > +     struct vfe_line line[VFE_LINE_NUM_MAX];
> > +     u8 line_num;
> >       u32 reg_update;
> >       u8 was_streaming;
> >       const struct vfe_hw_ops *ops;
> > +     const struct vfe_hw_ops_gen1 *ops_gen1;
> >       struct vfe_isr_ops isr_ops;
> > +     struct camss_video_ops video_ops;
> >  };
> >
> >  struct resources;
> > @@ -178,6 +159,37 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe);
> >  void msm_vfe_get_vfe_id(struct media_entity *entity, u8 *id);
> >  void msm_vfe_get_vfe_line_id(struct media_entity *entity, enum vfe_line_id *id);
> >
> > +/*
> > + * vfe_buf_add_pending - Add output buffer to list of pending
> > + * @output: VFE output
> > + * @buffer: Video buffer
> > + */
> > +void vfe_buf_add_pending(struct vfe_output *output, struct camss_buffer *buffer);
> > +
> > +struct camss_buffer *vfe_buf_get_pending(struct vfe_output *output);
> > +
> > +/*
> > + * vfe_disable - Disable streaming on VFE line
> > + * @line: VFE line
> > + *
> > + * Return 0 on success or a negative error code otherwise
> > + */
> > +int vfe_disable(struct vfe_line *line);
> > +
> > +int vfe_flush_buffers(struct camss_video *vid, enum vb2_buffer_state state);
> > +
> > +/*
> > + * vfe_isr_comp_done - Process composite image done interrupt
> > + * @vfe: VFE Device
> > + * @comp: Composite image id
> > + */
> > +void vfe_isr_comp_done(struct vfe_device *vfe, u8 comp);
> > +
> > +void vfe_isr_reset_ack(struct vfe_device *vfe);
> > +int vfe_put_output(struct vfe_line *line);
> > +int vfe_release_wm(struct vfe_device *vfe, u8 wm);
> > +int vfe_reserve_wm(struct vfe_device *vfe, enum vfe_line_id line_id);
> > +
> >  extern const struct vfe_hw_ops vfe_ops_4_1;
> >  extern const struct vfe_hw_ops vfe_ops_4_7;
> >  extern const struct vfe_hw_ops vfe_ops_4_8;
> > diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> > index 0c679c97da6d..49e25c837bdc 100644
> > --- a/drivers/media/platform/qcom/camss/camss.c
> > +++ b/drivers/media/platform/qcom/camss/camss.c
> > @@ -881,7 +881,7 @@ static int camss_register_entities(struct camss *camss)
> >
> >               for (i = 0; i < camss->ispif->line_num; i++)
> >                       for (k = 0; k < camss->vfe_num; k++)
> > -                             for (j = 0; j < ARRAY_SIZE(camss->vfe[k].line); j++) {
> > +                             for (j = 0; j < camss->vfe[k].line_num; j++) {
> >                                       struct v4l2_subdev *ispif = &camss->ispif->line[i].subdev;
> >                                       struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
> >
> > @@ -902,7 +902,7 @@ static int camss_register_entities(struct camss *camss)
> >       } else {
> >               for (i = 0; i < camss->csid_num; i++)
> >                       for (k = 0; k < camss->vfe_num; k++)
> > -                             for (j = 0; j < ARRAY_SIZE(camss->vfe[k].line); j++) {
> > +                             for (j = 0; j < camss->vfe[k].line_num; j++) {
> >                                       struct v4l2_subdev *csid = &camss->csid[i].subdev;
> >                                       struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
> >
> >
>
