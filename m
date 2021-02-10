Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 046CF316AA7
	for <lists+linux-media@lfdr.de>; Wed, 10 Feb 2021 17:04:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbhBJQD4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Feb 2021 11:03:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbhBJQDx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Feb 2021 11:03:53 -0500
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E043C0613D6
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 08:03:12 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id p6so1044759qvm.12
        for <linux-media@vger.kernel.org>; Wed, 10 Feb 2021 08:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=vMl09xTYk2AzALOlDDizo3CtDKFHQF/1OYESJTbYIHg=;
        b=MY7Bzkhn+T42ADKv7SQ4rQ8Qqnl4ETe3P4Pt2BITRHMV3Vdh3k9/Km1pq1HPRX9W/t
         zkorU+6gWfq714Nryh19tvtsebphMZOejYl02HNdjjIhpsjZYeiF6COnxBIfQmzUI++q
         7t/Ya43TTTwsBvGPhZP8/W/+kVuOAwlDCi4OkJGk1/UANOuO3jBvLOCojxfP2wAPO1ui
         87Fde9Zq2SqVRu4S50N2Ft+07oCXZASFE5H7x1hDHZOe5jw2Dex6K+kEhmp5oPmPlUHQ
         5FDoFCtPem73WB91W6i1HLGt2FkyCMII5Izct3UqkIF+ju+U9tcjlfJR5ZZpnUWrtpS5
         IYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vMl09xTYk2AzALOlDDizo3CtDKFHQF/1OYESJTbYIHg=;
        b=BLygOdazO05NHD2MDxlwKRhB3ESNadsBag8Y/O2/vZ+KNhDXEhxx24mXOnnbrn9Y16
         lFD8zoK5z/3vIJeeoE3XlV03xR+vN96SgdLmhhRqMLXK/yhLAB1DMqvkQoFvfyHpfHDV
         PnB3ZjOgiFmeAfyrsPLPpDCMSKe3clQc/5BO4OucvLGVBJnD+49e1cPdj/iL2M5bNDLg
         1IDp6oEQ6ON1DPqx4+2rcOXRHnD+i2ThNcLv419OJKOEKSkPEz7ElPUJFyiV5nEzgtzY
         Are8JCZwzC9OeusIEYzDItBVvzspspn3V5Zl7LQ7EiPnXl3ZHtG6YA6J8q6usQlQ5aNg
         Fw7g==
X-Gm-Message-State: AOAM530iwLbAFvt8qBKkQnbB5w3VfSkk2ghJswlou7Io0TOmnzIA3cJ7
        iRGUfzk9eY1PR9Ckoe9AyXq6Hw==
X-Google-Smtp-Source: ABdhPJwKloPRibW3+NS+02RBOsavIVO21dXRly8FSjWsWvAz63HU/pBF+GI07636yktDtlCHCq6SLA==
X-Received: by 2002:ad4:54ad:: with SMTP id r13mr3450326qvy.48.1612972991130;
        Wed, 10 Feb 2021 08:03:11 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id 11sm1798878qkm.25.2021.02.10.08.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 08:03:09 -0800 (PST)
Message-ID: <26407550afb3d5a2ee4b3af4474acdcf4191ed68.camel@ndufresne.ca>
Subject: Re: [PATCH v6 1/2] media: v4l2-ctrl: add controls for long term
 reference.
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>, dikshita@codeaurora.org
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
Date:   Wed, 10 Feb 2021 11:03:08 -0500
In-Reply-To: <2a6bf75f-a44c-e921-55a0-abd6d6eaf67f@xs4all.nl>
References: <1611553919-17919-1-git-send-email-dikshita@codeaurora.org>
         <1611553919-17919-2-git-send-email-dikshita@codeaurora.org>
         <d20ba57f-54a7-5a61-a64b-2d9433b79281@xs4all.nl>
         <6e59d1bee1d0f1b64aab77959bb22e6e@codeaurora.org>
         <2a6bf75f-a44c-e921-55a0-abd6d6eaf67f@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 04 février 2021 à 11:05 +0100, Hans Verkuil a écrit :
> On 04/02/2021 06:01, dikshita@codeaurora.org wrote:
> > On 2021-02-01 16:50, Hans Verkuil wrote:
> > > On 25/01/2021 06:51, Dikshita Agarwal wrote:
> > > > Long Term Reference (LTR) frames are the frames that are encoded
> > > > sometime in the past and stored in the DPB buffer list to be used
> > > > as reference to encode future frames.
> > > > This change adds controls to enable this feature.
> > > > 
> > > > Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> > > > ---
> > > >  .../userspace-api/media/v4l/ext-ctrls-codec.rst        | 18 
> > > > ++++++++++++++++++
> > > >  drivers/media/v4l2-core/v4l2-ctrls.c                   | 14 
> > > > ++++++++++++++
> > > >  include/uapi/linux/v4l2-controls.h                     |  3 +++
> > > >  3 files changed, 35 insertions(+)
> > > > 
> > > > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst 
> > > > b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > index 400774c..a37d460 100644
> > > > --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
> > > > @@ -3637,3 +3637,21 @@ enum v4l2_mpeg_video_hevc_size_of_length_field 
> > > > -
> > > >        - Selecting this value specifies that HEVC slices are expected
> > > >          to be prefixed by Annex B start codes. According to 
> > > > :ref:`hevc`
> > > >          valid start codes can be 3-bytes 0x000001 or 4-bytes 
> > > > 0x00000001.
> > > > +
> > > > +``V4L2_CID_MPEG_VIDEO_LTR_COUNT (integer)``
> > > > +       Specifies the number of Long Term Reference (LTR) frames 
> > > > encoder needs
> > > > +       to generate or keep. This is applicable to the H264 and HEVC 
> > > > encoders.
> > > > +
> > > > +``V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX (integer)``
> > > > +       The current frame is marked as a Long Term Reference (LTR) 
> > > > frame
> > > > +       and given this LTR index which ranges from 0 to LTR_COUNT-1.
> > > > +       This is applicable to the H264 and HEVC encoders and can be 
> > > > applied using
> > > > +       Request API.
> > > 
> > > You mentioned in reply to my comment that the venus driver didn't 
> > > support the
> > > Request API that it is also possible to use it without that API.
> > > 
> > > But that requires more precise documentation. I assume that without the 
> > > Request
> > > API you would set this control, then queue the buffer containing the 
> > > frame this
> > > control should apply to, then wait until it is dequeued. Since that's 
> > > the only
> > > way you can be certain this control is applied to the correct frame.
> > > 
> > > Is this indeed what you do in your application?
> > > 
> > > Regards,
> > > 
> > >         Hans
> > > 
> > Hi Hans,
> > 
> > Yes, It is possible without request API as well in a non-synchronized 
> > way.
> > And we don't need to wait for the frame to be dequeued.
> > The driver implementation ensures that whenever the LTR control is 
> > received,
> > it applies to the frame received after that. Not to frame which would be 
> > encoded next.
> > So that it is at least synchronized between driver & encoder.
> 
> This is highly driver dependent. I'm not even sure this is true for the venus
> driver: if you prequeue, say, 4 output buffers to the encoder and call
> V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX after the second buffer (so it should
> apply to the third), and only after the fourth you call VIDIOC_STREAMON,
> does the venus driver still keep track of the order of the queued buffers
> and when these controls are set? Once STREAMON is called it looks like it
> stays synced since everything is queued into a command queue, if I understand
> the code correctly.
> 
> The problem is that when controls are applied in relation to queued buffers
> is not defined, unless you use the Request API. Typically controls are applied
> immediately, so the venus driver is a bit of an anomaly in that respect.
> 
> You can make an explicit requirement that these controls apply to the next
> queued buffer if no request API is used, but you really must be 100% certain
> that the venus driver does that right (and as mentioned, I have my doubts
> about
> the case where you queue buffers before calling STREAMON).

Do you propose to start usign request for stateful encoder ? If this is the
case, I'd like to remind that it's not always possible to notify encode
completion in request queue order for this type of HW. Reordering might be
implicit in the firmware design, so the driver may not have any notification
until multiple frames have been encoded.

To resume, we can use request for this type of application, no issues, but
userspace may not switch to waiting on the request for completion as this may
have HW specific behaviour. It will have to resort to polling for READ, and
dequeue from capture queue and figure-out after the fact which request are now
complete.

Nicolas

> 
> Regards,
> 
>         Hans
> 
> > 
> > Thanks,
> > Dikshita
> > 
> > > > +       Source Rec. ITU-T H.264 (06/2019); Table 7.9
> > > > +
> > > > +``V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES (bitmask)``
> > > > +       Specifies the Long Term Reference (LTR) frame(s) to be used 
> > > > for
> > > > +       encoding the current frame.
> > > > +       This provides a bitmask which consists of bits [0, 
> > > > LTR_COUNT-1].
> > > > +       This is applicable to the H264 and HEVC encoders and can be 
> > > > applied using
> > > > +       Request API.
> > > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c 
> > > > b/drivers/media/v4l2-core/v4l2-ctrls.c
> > > > index 16ab54f..84c1eb8 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> > > > @@ -950,6 +950,9 @@ const char *v4l2_ctrl_get_name(u32 id)
> > > >         case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:             return
> > > > "Vertical MV 
> > > > Search Range";
> > > >         case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:             return
> > > > "Repeat Sequence 
> > > > Header";
> > > >         case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:               return
> > > > "Force Key Frame";
> > > > +       case V4L2_CID_MPEG_VIDEO_LTR_COUNT:                     return
> > > > "LTR Count";
> > > > +       case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:               return
> > > > "Frame LTR Index";
> > > > +       case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:                return
> > > > "Use LTR Frames";
> > > >         case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:            return
> > > > "MPEG-2 Slice 
> > > > Parameters";
> > > >         case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:            return
> > > > "MPEG-2 
> > > > Quantization Matrices";
> > > >         case V4L2_CID_FWHT_I_FRAME_QP:                          return
> > > > "FWHT I-Frame QP Value";
> > > > @@ -1277,6 +1280,17 @@ void v4l2_ctrl_fill(u32 id, const char **name, 
> > > > enum v4l2_ctrl_type *type,
> > > >         case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
> > > >                 *type = V4L2_CTRL_TYPE_INTEGER;
> > > >                 break;
> > > > +       case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
> > > > +               *type = V4L2_CTRL_TYPE_INTEGER;
> > > > +               break;
> > > > +       case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
> > > > +               *type = V4L2_CTRL_TYPE_INTEGER;
> > > > +               *flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> > > > +               break;
> > > > +       case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
> > > > +               *type = V4L2_CTRL_TYPE_BITMASK;
> > > > +               *flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> > > > +               break;
> > > >         case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
> > > >         case V4L2_CID_PAN_RESET:
> > > >         case V4L2_CID_TILT_RESET:
> > > > diff --git a/include/uapi/linux/v4l2-controls.h 
> > > > b/include/uapi/linux/v4l2-controls.h
> > > > index af8dda2..c0bb87b 100644
> > > > --- a/include/uapi/linux/v4l2-controls.h
> > > > +++ b/include/uapi/linux/v4l2-controls.h
> > > > @@ -422,6 +422,9 @@ enum v4l2_mpeg_video_multi_slice_mode {
> > > >  #define 
> > > > V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE           (V4L2_CID_CODEC_BASE+227
> > > > )
> > > >  #define 
> > > > V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE           (V4L2_CID_CODEC_BASE+228
> > > > )
> > > >  #define 
> > > > V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME             (V4L2_CID_CODEC_BASE+229
> > > > )
> > > > +#define
> > > > V4L2_CID_MPEG_VIDEO_LTR_COUNT                  (V4L2_CID_CODEC_BASE+230)
> > > > +#define 
> > > > V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX             (V4L2_CID_CODEC_BASE+231
> > > > )
> > > > +#define
> > > > V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES             (V4L2_CID_CODEC_BASE+232)
> > > > 
> > > >  /* CIDs for the MPEG-2 Part 2 (H.262) codec */
> > > >  #define
> > > > V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL                        (V4L2_CID_CODEC_B
> > > > ASE+270)
> > > > 
> 


