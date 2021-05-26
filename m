Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B584D39225F
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 23:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234194AbhEZVzh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 17:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234234AbhEZVzg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 17:55:36 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D74FBC061574
        for <linux-media@vger.kernel.org>; Wed, 26 May 2021 14:54:02 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id df21so3312518edb.3
        for <linux-media@vger.kernel.org>; Wed, 26 May 2021 14:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dFASwcRPIicvqtt8tKyOfZgtkSJ3VXMjXJAX8X8icw4=;
        b=nyaB07OnN0a8HlulmbV6MYy7UFz5JI5HTlnGFqaWHIwEnLdnhf9Kce8z5grcSpJ53Z
         XvmQYFDYrXI6Z+aXfIvCXReQl0jRPJ0guhv20RMT16327A6zDKxQgqdg7LgxqWyqfr2F
         n1snjkzPttUkgMCKyO1359H+/7Tbp+EoWXRKdGnGImiAYdEgWLIW6BkgmFAfVEBcvBOJ
         CS780jYfybtdR23+ZQS9PheNgLU0ZjGVlmo7EakjbDQ3e7A4NMp2oW95Me79P/CCpVsn
         vDkRR+zCQMI8W70nl99JnUF7bIymcNNqp3PmtP7GHbykTvxFzgi1Uh/xTVaKLPx/TF4i
         nVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dFASwcRPIicvqtt8tKyOfZgtkSJ3VXMjXJAX8X8icw4=;
        b=BVhLCsCJ4pByVnDK1oCST+uJWvsZS0Q6KIAzRoh3GLn/NhYO2xzdTzTaiQvSfK+d+J
         bF/84FQsZUxVRk6yBE0dqXdGLHohkjXB/Pm8QbqkCB3nxaAaH73eWcb0jVttnn3rPaLa
         5UTJuyV1d1eyS52+DHtIdGE+9LwIWSN85WQU2WSMaKDjF8fZDzHS+rWzxzGKZ9PmH9bQ
         Blumy0eGdy5T3lLH9cA4SqiQU9SN9cZ6VvaehOi6XLSYQkNvgtKwrvI9fuc2fsTUk7Bz
         urHdEf7AiMvSRB7oydWPt5WGtjTUzXXtjM6DahDJzF+t5dVSuymq3/5pfxAlC0tBqkig
         Iqpw==
X-Gm-Message-State: AOAM530lpAhNpcHaY0kLjI2Z0iPLCgzQlr9EMt9ojMZGOcG3rewkxh8C
        TuZDksi7eRoGG/lPaNnV3aNJa4xVEGzHuIPiM+8=
X-Google-Smtp-Source: ABdhPJwGvOXKgoPV985XE+NkEHXN1My5r3JeG1rfBOIAb5PTKmzfGrarKZj8SxzanX2azfLn4U7C1z3x/3JuSmn1ovk=
X-Received: by 2002:a05:6402:1158:: with SMTP id g24mr343275edw.134.1622066041276;
 Wed, 26 May 2021 14:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210424024739.83762-1-rosenp@gmail.com> <20210424024739.83762-2-rosenp@gmail.com>
 <7fd68e5a-1259-c020-9b9d-baf4f868f98c@xs4all.nl>
In-Reply-To: <7fd68e5a-1259-c020-9b9d-baf4f868f98c@xs4all.nl>
From:   Rosen Penev <rosenp@gmail.com>
Date:   Wed, 26 May 2021 14:54:15 -0700
Message-ID: <CAKxU2N-Ajzm7jZqkf+ssWxzhN0TToTc_2xJPAErB5CchzBNTpw@mail.gmail.com>
Subject: Re: [PATCH 2/2] manual conversions to std::array
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 26, 2021 at 4:15 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 24/04/2021 04:47, Rosen Penev wrote:
> > std::array avoids having to decay the array into a pointer. Also allows
> > using the at() member function for debugging.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  utils/cec-follower/cec-follower.h           |  9 ++---
> >  utils/cec-follower/cec-processing.cpp       | 24 ++++++------
> >  utils/libcecutil/cec-parse.cpp              | 43 +++++++++++----------
> >  utils/v4l2-compliance/v4l2-test-buffers.cpp | 19 ++++-----
> >  utils/v4l2-compliance/v4l2-test-formats.cpp |  4 +-
> >  5 files changed, 49 insertions(+), 50 deletions(-)
> >
> > diff --git a/utils/cec-follower/cec-follower.h b/utils/cec-follower/cec-follower.h
> > index 391b9ab40..b0c9e980d 100644
> > --- a/utils/cec-follower/cec-follower.h
> > +++ b/utils/cec-follower/cec-follower.h
> > @@ -8,6 +8,8 @@
> >  #ifndef _CEC_FOLLOWER_H_
> >  #define _CEC_FOLLOWER_H_
> >
> > +#include <array>
> > +
> >  #include <linux/cec-funcs.h>
> >  #include "cec-htng-funcs.h"
> >
> > @@ -78,14 +80,11 @@ struct node {
> >
> >  struct la_info {
> >       __u64 ts;
> > -     struct {
> > -             unsigned count;
> > -             __u64 ts;
> > -     } feature_aborted[256];
> > +     std::array<std::pair<unsigned, __u64>, 256> feature_aborted;
>
> Ah, no. This turns perfectly understandable 'count' and 'ts' fields
> into vague 'first' and 'second' fields.
I believe the reason I switched to std::pair(which I now learned is a
bad idea) is that I would have to declare the struct and array
separately. But there is a better way to do that.
>
> But to be honest, I see no real benefits at all to this patch. I've decided not
> to take this one.
>
> Sorry about that, but I think normal arrays are perfectly fine.
std::array has several C++ advantages. For example, a size of a C
array is sizeof(a) / sizeof(*a). std::array is a.size(). It can make
the code look a little cleaner while being the same speed(or faster)
than a C style array. Your call though.
>
> Regards,
>
>         Hans
>
> >       __u16 phys_addr;
> >  };
> >
> > -extern struct la_info la_info[15];
> > +extern std::array<struct la_info, 15> la_info;
> >
> >  struct short_audio_desc {
> >       /* Byte 1 */
> > diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
> > index 9acaf7ec9..51eab1ae8 100644
> > --- a/utils/cec-follower/cec-processing.cpp
> > +++ b/utils/cec-follower/cec-processing.cpp
> > @@ -3,6 +3,7 @@
> >   * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> >   */
> >
> > +#include <array>
> >  #include <cerrno>
> >  #include <ctime>
> >  #include <string>
> > @@ -37,7 +38,7 @@ struct cec_enum_values {
> >       __u8 value;
> >  };
> >
> > -struct la_info la_info[15];
> > +std::array<struct la_info, 15> la_info;
> >
> >  static struct timespec start_monotonic;
> >  static struct timeval start_timeofday;
> > @@ -120,8 +121,8 @@ void reply_feature_abort(struct node *node, struct cec_msg *msg, __u8 reason)
> >       if (cec_msg_is_broadcast(msg) || cec_msg_initiator(msg) == CEC_LOG_ADDR_UNREGISTERED)
> >               return;
> >       if (reason == CEC_OP_ABORT_UNRECOGNIZED_OP) {
> > -             la_info[la].feature_aborted[opcode].count++;
> > -             if (la_info[la].feature_aborted[opcode].count == 2) {
> > +             la_info[la].feature_aborted[opcode].first++;
> > +             if (la_info[la].feature_aborted[opcode].first == 2) {
> >                       /* If the Abort Reason was "Unrecognized opcode", the Initiator should not send
> >                          the same message to the same Follower again at that time to avoid saturating
> >                          the bus. */
> > @@ -129,13 +130,11 @@ void reply_feature_abort(struct node *node, struct cec_msg *msg, __u8 reason)
> >                            opcode2s(msg).c_str(), la, cec_la2s(la));
> >                       warn("replying Feature Abort [Unrecognized Opcode] to the same message.\n");
> >               }
> > -     }
> > -     else if (la_info[la].feature_aborted[opcode].count) {
> > +     } else if (la_info[la].feature_aborted[opcode].first) {
> >               warn("Replying Feature Abort with abort reason different than [Unrecognized Opcode]\n");
> >               warn("to message that has previously been replied Feature Abort to with [Unrecognized Opcode].\n");
> > -     }
> > -     else
> > -             la_info[la].feature_aborted[opcode].ts = ts_now;
> > +     } else
> > +             la_info[la].feature_aborted[opcode].second = ts_now;
> >
> >       cec_msg_reply_feature_abort(msg, reason);
> >       transmit(node, msg);
> > @@ -939,7 +938,7 @@ void testProcessing(struct node *node, bool wallclock)
> >                                       node->state.active_source_pa = CEC_PHYS_ADDR_INVALID;
> >                                       me = CEC_LOG_ADDR_INVALID;
> >                               }
> > -                             memset(la_info, 0, sizeof(la_info));
> > +                             la_info = {};
> >                       }
> >               }
> >               if (FD_ISSET(fd, &rd_fds)) {
> > @@ -962,9 +961,8 @@ void testProcessing(struct node *node, bool wallclock)
> >                       if (node->ignore_opcode[msg.msg[1]] & (1 << from))
> >                               continue;
> >
> > -                     if (from != CEC_LOG_ADDR_UNREGISTERED &&
> > -                         la_info[from].feature_aborted[opcode].ts &&
> > -                         ts_to_ms(get_ts() - la_info[from].feature_aborted[opcode].ts) < 200) {
> > +                     if (from != CEC_LOG_ADDR_UNREGISTERED && la_info[from].feature_aborted[opcode].second &&
> > +                         ts_to_ms(get_ts() - la_info[from].feature_aborted[opcode].second) < 200) {
> >                               warn("Received message %s from LA %d (%s) less than 200 ms after\n",
> >                                    opcode2s(&msg).c_str(), from, cec_la2s(from));
> >                               warn("replying Feature Abort (not [Unrecognized Opcode]) to the same message.\n");
> > @@ -1016,7 +1014,7 @@ void testProcessing(struct node *node, bool wallclock)
> >                       transmit(node, &msg);
> >                       if (msg.tx_status & CEC_TX_STATUS_NACK) {
> >                               dev_info("Logical address %d stopped responding to polling message.\n", poll_la);
> > -                             memset(&la_info[poll_la], 0, sizeof(la_info[poll_la]));
> > +                             la_info[poll_la] = {};
> >                               node->remote_la_mask &= ~(1 << poll_la);
> >                               node->remote_phys_addr[poll_la] = CEC_PHYS_ADDR_INVALID;
> >                       }
> > diff --git a/utils/libcecutil/cec-parse.cpp b/utils/libcecutil/cec-parse.cpp
> > index fd37f5b83..f48170500 100644
> > --- a/utils/libcecutil/cec-parse.cpp
> > +++ b/utils/libcecutil/cec-parse.cpp
> > @@ -3,6 +3,7 @@
> >   * Copyright 2019 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> >   */
> >
> > +#include <array>
> >  #include <cctype>
> >  #include <cstring>
> >  #include <string>
> > @@ -108,13 +109,13 @@ static __u32 *args2short_descrs(__u32 descriptor1,
> >                               __u32 descriptor3,
> >                               __u32 descriptor4)
> >  {
> > -     static __u32 descriptors[4];
> > -
> > -     descriptors[0] = descriptor1;
> > -     descriptors[1] = descriptor2;
> > -     descriptors[2] = descriptor3;
> > -     descriptors[3] = descriptor4;
> > -     return descriptors;
> > +     static std::array<__u32, 4> descriptors{
> > +             descriptor1,
> > +             descriptor2,
> > +             descriptor3,
> > +             descriptor4,
> > +     };
> > +     return descriptors.data();
> >  }
> >
> >  static __u8 *args2short_aud_fmt_ids(__u8 audio_format_id1,
> > @@ -122,13 +123,13 @@ static __u8 *args2short_aud_fmt_ids(__u8 audio_format_id1,
> >                                   __u8 audio_format_id3,
> >                                   __u8 audio_format_id4)
> >  {
> > -     static __u8 audio_format_ids[4];
> > -
> > -     audio_format_ids[0] = audio_format_id1;
> > -     audio_format_ids[1] = audio_format_id2;
> > -     audio_format_ids[2] = audio_format_id3;
> > -     audio_format_ids[3] = audio_format_id4;
> > -     return audio_format_ids;
> > +     static std::array<__u8, 4> audio_format_ids{
> > +             audio_format_id1,
> > +             audio_format_id2,
> > +             audio_format_id3,
> > +             audio_format_id4,
> > +     };
> > +     return audio_format_ids.data();
> >  }
> >
> >  static __u8 *args2short_aud_fmt_codes(__u8 audio_format_code1,
> > @@ -136,13 +137,13 @@ static __u8 *args2short_aud_fmt_codes(__u8 audio_format_code1,
> >                                     __u8 audio_format_code3,
> >                                     __u8 audio_format_code4)
> >  {
> > -     static __u8 audio_format_codes[4];
> > -
> > -     audio_format_codes[0] = audio_format_code1;
> > -     audio_format_codes[1] = audio_format_code2;
> > -     audio_format_codes[2] = audio_format_code3;
> > -     audio_format_codes[3] = audio_format_code4;
> > -     return audio_format_codes;
> > +     static std::array<__u8, 4> audio_format_codes{
> > +             audio_format_code1,
> > +             audio_format_code2,
> > +             audio_format_code3,
> > +             audio_format_code4,
> > +     };
> > +     return audio_format_codes.data();
> >  }
> >
> >  int cec_parse_subopt(char **subs, const char * const *subopts, char **value)
> > diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > index e515fea48..5b0c5452b 100644
> > --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> > @@ -36,8 +36,8 @@ static cv4l_fmt cur_fmt;
> >  static cv4l_fmt cur_m2m_fmt;
> >  static int stream_from_fd = -1;
> >  static bool stream_use_hdr;
> > -static unsigned max_bytesused[VIDEO_MAX_PLANES];
> > -static unsigned min_data_offset[VIDEO_MAX_PLANES];
> > +static std::array<unsigned int, VIDEO_MAX_PLANES> max_bytesused;
> > +static std::array<unsigned int, VIDEO_MAX_PLANES> min_data_offset;
> >
> >  bool operator<(struct timeval const& n1, struct timeval const& n2)
> >  {
> > @@ -60,7 +60,7 @@ struct buf_seq {
> >
> >  static struct buf_seq last_seq, last_m2m_seq;
> >
> > -static int buf_req_fds[VIDEO_MAX_FRAME * 2];
> > +static std::array<int, VIDEO_MAX_FRAME * 2> buf_req_fds;
> >
> >  static inline int named_ioctl_fd(int fd, bool trace, const char *cmd_name, unsigned long cmd, void *arg)
> >  {
> > @@ -845,7 +845,7 @@ static int captureBufs(struct node *node, struct node *node_m2m_cap, const cv4l_
> >               cv4l_queue &m2m_q, unsigned frame_count, int pollmode,
> >               unsigned &capture_count)
> >  {
> > -     static constexpr const char *pollmode_str[] = {
> > +     static constexpr std::array<const char *, 3> pollmode_str{
> >               "",
> >               " (select)",
> >               " (epoll)",
> > @@ -1677,8 +1677,8 @@ int testUserPtr(struct node *node, struct node *node_m2m_cap, unsigned frame_cou
> >                       }
> >               }
> >               // captureBufs() will update these values
> > -             memset(max_bytesused, 0, sizeof(max_bytesused));
> > -             memset(min_data_offset, 0xff, sizeof(min_data_offset));
> > +             max_bytesused = {};
> > +             min_data_offset.fill(0xff);
> >
> >               fail_on_test(setupUserPtr(node, q));
> >
> > @@ -2900,9 +2900,10 @@ static void streamFmt(struct node *node, __u32 pixelformat, __u32 w, __u32 h,
> >               return;
> >       }
> >
> > -     v4l2_selection *selections[2][4] = {
> > -             { &min_crop, &max_crop, &min_compose, &max_compose },
> > -             { &min_compose, &max_compose, &min_crop, &max_crop }
> > +     using sel = std::array<v4l2_selection *, 4>;
> > +     std::array<sel, 2> selections{
> > +             sel{ &min_crop, &max_crop, &min_compose, &max_compose },
> > +             sel{ &min_compose, &max_compose, &min_crop, &max_crop },
> >       };
> >
> >       selTest test = createSelTest(node);
> > diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
> > index 3761b1fa9..0ef89544c 100644
> > --- a/utils/v4l2-compliance/v4l2-test-formats.cpp
> > +++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
> > @@ -27,7 +27,7 @@
> >  #include "compiler.h"
> >  #include "v4l2-compliance.h"
> >
> > -static constexpr __u32 buftype2cap[] = {
> > +static constexpr std::array<__u32, 15> buftype2cap{
> >       0,
> >       V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_M2M,
> >       V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_VIDEO_M2M,
> > @@ -1095,7 +1095,7 @@ int testSetFormats(struct node *node)
> >  {
> >       struct v4l2_clip clip, clip_set;
> >       struct v4l2_format fmt, fmt_set;
> > -     struct v4l2_format initial_fmts[V4L2_BUF_TYPE_LAST + 1];
> > +     std::array<v4l2_format, V4L2_BUF_TYPE_LAST + 1> initial_fmts;
> >       int type;
> >       int ret;
> >
> >
>
