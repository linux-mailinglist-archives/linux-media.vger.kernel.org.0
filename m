Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C74B1B5772
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 10:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgDWIqD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 04:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgDWIqC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 04:46:02 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BCD0C03C1AF
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 01:46:02 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id c21so1273091plz.4
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 01:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=AYqeC9EeP+R6/4Y6Q4QXiT7q0B8jaDMcOJWLG+xFpX4=;
        b=f1Hh8eaubp/NoQ1zppg5NxQCj3jVmciq7vTocj2hLpJnRIZvqi0hITrE3FihAfv48B
         UFNl584/EF03rmv1FU+t1hposjDaYwy+lsv/zoT8fdI71A2P29OnIeBnnp3lTlTHDjKd
         Mjk/0OBVxIqyIsEqWcfNa+m6py5kyjm42or+lOGzTIa++rIGQ0GajAEv1IzRTxUxGF2c
         AAY+wsH4HyR9YGOtVqfF2yWRea2RMw9Xc+BPZT102JlcpmTbHtDpHPH2mNnhg5CSx9Pf
         MyBaQL79dlWqyARk/fPzcW9ju6BDXfO3thX6TdLC2jSjvb+czIWVP1HP9p59+wVXPdRX
         eZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=AYqeC9EeP+R6/4Y6Q4QXiT7q0B8jaDMcOJWLG+xFpX4=;
        b=dDRDId7/3i1eZcl3/fIvVURXa+qZGhhCa4v+FdKhlc97+0MfV9f5sQ1CIcnAmgwsuJ
         Ea5rAajbSpEnqdNi2tjBXmzMFZZZdw41VNVMC04/hZzFJVTN5oErDCP+JBv7HrdnA4ut
         rmb8rqSw/V0pv7J/35Oke83cevbA4Y2lK4Fcy96bSxeTFShrB+8XBiXb8S4lEVcdkydE
         KBp3GfrqWYQ2kf6YIiEFqZG25w2xmUyh8uiv32FlgBohp58rcixTD+jc76+LUpesTxIp
         5Lr5uPPHXjz9zx6e0GEjn9zwjvi0DopK3ViceuMNDFLUPtSvoqHX770DkpeCYZtHlteX
         UweQ==
X-Gm-Message-State: AGi0PuarZRjgzehI8vg13Zq2/nTKqnzsj0Ky5iknVOwm/rxu4Z93QLPV
        Sl9u3cBsjCul3KxH5RJ+6Bo=
X-Google-Smtp-Source: APiQypKGIcCS8pTNNwNDG8jykSY7Iy4ZDXt3FjHfKDmsHiUQ8O3s0w8EBK4cOPVuMVHMUqDNyhUutA==
X-Received: by 2002:a17:902:ee15:: with SMTP id z21mr2686105plb.71.1587631561590;
        Thu, 23 Apr 2020 01:46:01 -0700 (PDT)
Received: from [192.168.0.147] (76-14-109-232.rk.wavecable.com. [76.14.109.232])
        by smtp.gmail.com with ESMTPSA id p64sm1682178pjp.7.2020.04.23.01.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 01:46:01 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Rosen Penev <rosenp@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 10/12] utils: fix fallthrough warnings
Date:   Thu, 23 Apr 2020 01:46:00 -0700
Message-Id: <42294EA2-4DCB-438F-A0E6-4954C1E653DE@gmail.com>
References: <469e8b7f-c319-8e3b-9026-0b227dddab97@xs4all.nl>
Cc:     linux-media@vger.kernel.org
In-Reply-To: <469e8b7f-c319-8e3b-9026-0b227dddab97@xs4all.nl>
To:     Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: iPhone Mail (17C54)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



> On Apr 23, 2020, at 1:43 AM, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>=20
> =EF=BB=BFOn 22/04/2020 02:37, Rosen Penev wrote:
>> Comments are not enough for clang. Changed to use the C++ attribute.
>>=20
>> Found with -Wimplicit-fallthrough
>>=20
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>> utils/cec-compliance/cec-compliance.cpp      |  7 +++++++
>> utils/cec-ctl/cec-ctl.cpp                    |  8 +++++++-
>> utils/cec-follower/cec-follower.cpp          |  7 +++++++
>> utils/cec-follower/cec-processing.cpp        |  9 ++++++++-
>> utils/cec-follower/cec-tuner.cpp             | 12 +++++++++---
>> utils/libcecutil/cec-log.cpp                 |  8 +++++++-
>> utils/v4l2-compliance/v4l2-test-colors.cpp   | 16 +++++++++++-----
>> utils/v4l2-compliance/v4l2-test-controls.cpp | 16 +++++++++++-----
>> utils/v4l2-compliance/v4l2-test-formats.cpp  | 10 ++++++++--
>> utils/v4l2-ctl/v4l2-ctl-streaming.cpp        | 10 ++++++++--
>> utils/v4l2-ctl/v4l2-ctl-vbi.cpp              | 10 ++++++++--
>> 11 files changed, 91 insertions(+), 22 deletions(-)
>>=20
>> diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-complian=
ce/cec-compliance.cpp
>> index 1c62b5c9..e9fce337 100644
>> --- a/utils/cec-compliance/cec-compliance.cpp
>> +++ b/utils/cec-compliance/cec-compliance.cpp
>> @@ -24,6 +24,12 @@
>> #include "version.h"
>> #endif
>>=20
>> +#ifdef __clang__
>> +#define FALLTHROUGH [[clang::fallthrough]]
>> +#else
>> +#define FALLTHROUGH [[gnu::fallthrough]]
>> +#endif
>=20
> Yuck, no uppercase please.
>=20
> I am OK with lowercase 'fallthrough', since that's what the linux kernel s=
ettled on
> as well.
>=20
> This #ifdef/#else/#endif is replicated in several sources, so let's put th=
is in a
> header instead.
Which one?
>=20
> Regards,
>=20
>    Hans
>=20
>> +
>> /* Short option list
>>=20
>>    Please keep in alphabetical order.
>> @@ -486,6 +492,7 @@ void sad_decode(struct short_audio_desc *sad, __u32 d=
escriptor)
>>        case SAD_EXT_TYPE_MPEG_H_3D_AUDIO:
>>        case SAD_EXT_TYPE_AC_4:
>>            sad->format_dependent =3D b3 & 0x07;
>> +            FALLTHROUGH;
>>        case SAD_EXT_TYPE_LPCM_3D_AUDIO:
>>            sad->bit_depth_mask =3D b3 & 0x07;
>>            break;
>> diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
>> index f0e31aca..a3698a67 100644
>> --- a/utils/cec-ctl/cec-ctl.cpp
>> +++ b/utils/cec-ctl/cec-ctl.cpp
>> @@ -37,6 +37,12 @@
>>=20
>> #include "cec-ctl.h"
>>=20
>> +#ifdef __clang__
>> +#define FALLTHROUGH [[clang::fallthrough]]
>> +#else
>> +#define FALLTHROUGH [[gnu::fallthrough]]
>> +#endif
>> +
>> static struct timespec start_monotonic;
>> static struct timeval start_timeofday;
>> static bool ignore_la[16];
>> @@ -1967,7 +1973,7 @@ int main(int argc, char **argv)
>>            break;
>>        case OptPhysAddrFromEDIDPoll:
>>            edid_path =3D optarg;
>> -            /* fall-through */
>> +            FALLTHROUGH;
>>        case OptPhysAddrFromEDID:
>>            phys_addr =3D parse_phys_addr_from_edid(optarg);
>>            break;
>> diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec=
-follower.cpp
>> index 1eeae2d4..2d61d5f9 100644
>> --- a/utils/cec-follower/cec-follower.cpp
>> +++ b/utils/cec-follower/cec-follower.cpp
>> @@ -23,6 +23,12 @@
>> #include "version.h"
>> #endif
>>=20
>> +#ifdef __clang__
>> +#define FALLTHROUGH [[clang::fallthrough]]
>> +#else
>> +#define FALLTHROUGH [[gnu::fallthrough]]
>> +#endif
>> +
>> /* Short option list
>>=20
>>    Please keep in alphabetical order.
>> @@ -142,6 +148,7 @@ void sad_encode(const struct short_audio_desc *sad, _=
_u32 *descriptor)
>>        case SAD_EXT_TYPE_MPEG_H_3D_AUDIO:
>>        case SAD_EXT_TYPE_AC_4:
>>            b3 |=3D sad->format_dependent & 0x07;
>> +            FALLTHROUGH;
>>        case SAD_EXT_TYPE_LPCM_3D_AUDIO:
>>            b3 |=3D sad->bit_depth_mask & 0x07;
>>            break;
>> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/c=
ec-processing.cpp
>> index 8e3a33a2..68bfdca3 100644
>> --- a/utils/cec-follower/cec-processing.cpp
>> +++ b/utils/cec-follower/cec-processing.cpp
>> @@ -19,6 +19,12 @@
>>=20
>> #include "cec-follower.h"
>>=20
>> +#ifdef __clang__
>> +#define FALLTHROUGH [[clang::fallthrough]]
>> +#else
>> +#define FALLTHROUGH [[gnu::fallthrough]]
>> +#endif
>> +
>> #define VOLUME_MAX 0x64
>> #define VOLUME_MIN 0
>>=20
>> @@ -352,7 +358,7 @@ static void processMsg(struct node *node, struct cec_=
msg &msg, unsigned me)
>>        if (cec_has_tv(1 << la) && la_info[la].phys_addr =3D=3D 0)
>>            warn("TV (0) at 0.0.0.0 sent Routing Information.");
>>    }
>> -
>> +    FALLTHROUGH;
>>=20
>>        /* System Information */
>>=20
>> @@ -708,6 +714,7 @@ static void processMsg(struct node *node, struct cec_=
msg &msg, unsigned me)
>>        cec_msg_system_audio_mode_status(&msg, node->state.sac_active ? CE=
C_OP_SYS_AUD_STATUS_ON :
>>                         CEC_OP_SYS_AUD_STATUS_OFF);
>>        transmit(node, &msg);
>> +        FALLTHROUGH;
>>    case CEC_MSG_GIVE_AUDIO_STATUS:
>>        if (!cec_has_audiosystem(1 << me))
>>            break;
>> diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tu=
ner.cpp
>> index aa19f55d..af7c6437 100644
>> --- a/utils/cec-follower/cec-tuner.cpp
>> +++ b/utils/cec-follower/cec-tuner.cpp
>> @@ -8,6 +8,12 @@
>>=20
>> #include "cec-follower.h"
>>=20
>> +#ifdef __clang__
>> +#define FALLTHROUGH [[clang::fallthrough]]
>> +#else
>> +#define FALLTHROUGH [[gnu::fallthrough]]
>> +#endif
>> +
>> #define NUM_ANALOG_FREQS 3
>> #define NUM_DIGITAL_CHANS 3
>> #define TOT_ANALOG_FREQS (sizeof(analog_freqs_khz) / sizeof(analog_freqs_=
khz[0][0][0]))
>> @@ -303,21 +309,21 @@ static int digital_get_service_idx(struct cec_op_di=
gital_service_id *digital)
>>    switch (digital->dig_bcast_system) {
>>    case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_T:
>>        is_terrestrial =3D true;
>> -        /* fall through */
>> +        FALLTHROUGH;
>>    case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ARIB_BS:
>>        info =3D &digital_arib_data[is_terrestrial][0];
>>        offset =3D is_terrestrial * NUM_DIGITAL_CHANS;
>>        break;
>>    case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_T:
>>        is_terrestrial =3D true;
>> -        /* fall through */
>> +        FALLTHROUGH;
>>    case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_ATSC_SAT:
>>        info =3D &digital_atsc_data[is_terrestrial][0];
>>        offset =3D (2 + is_terrestrial) * NUM_DIGITAL_CHANS;
>>        break;
>>    case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_T:
>>        is_terrestrial =3D true;
>> -        /* fall through */
>> +        FALLTHROUGH;
>>    case CEC_OP_DIG_SERVICE_BCAST_SYSTEM_DVB_S2:
>>        info =3D &digital_dvb_data[is_terrestrial][0];
>>        offset =3D (4 + is_terrestrial) * NUM_DIGITAL_CHANS;
>> diff --git a/utils/libcecutil/cec-log.cpp b/utils/libcecutil/cec-log.cpp
>> index 28a1ecac..9844ac43 100644
>> --- a/utils/libcecutil/cec-log.cpp
>> +++ b/utils/libcecutil/cec-log.cpp
>> @@ -15,6 +15,12 @@
>> #include "cec-info.h"
>> #include "cec-log.h"
>>=20
>> +#ifdef __clang__
>> +#define FALLTHROUGH [[clang::fallthrough]]
>> +#else
>> +#define FALLTHROUGH [[gnu::fallthrough]]
>> +#endif
>> +
>> static const struct cec_arg arg_u8 =3D {
>>    CEC_ARG_TYPE_U8,
>> };
>> @@ -44,7 +50,7 @@ static void log_arg(const struct cec_arg *arg, const ch=
ar *arg_name, __u32 val)
>>                return;
>>            }
>>        }
>> -        /* fall through */
>> +        FALLTHROUGH;
>>    case CEC_ARG_TYPE_U8:
>>        if (!strcmp(arg_name, "video-latency") ||
>>            !strcmp(arg_name, "audio-out-delay")) {
>> diff --git a/utils/v4l2-compliance/v4l2-test-colors.cpp b/utils/v4l2-comp=
liance/v4l2-test-colors.cpp
>> index 887b198b..d37300e9 100644
>> --- a/utils/v4l2-compliance/v4l2-test-colors.cpp
>> +++ b/utils/v4l2-compliance/v4l2-test-colors.cpp
>> @@ -30,6 +30,12 @@
>> #include <math.h>
>> #include "v4l2-compliance.h"
>>=20
>> +#ifdef __clang__
>> +#define FALLTHROUGH [[clang::fallthrough]]
>> +#else
>> +#define FALLTHROUGH [[gnu::fallthrough]]
>> +#endif
>> +
>> static void setupPlanes(const cv4l_fmt &fmt, __u8 *planes[3])
>> {
>>    if (fmt.g_num_planes() > 1)
>> @@ -328,7 +334,7 @@ static void getColor(const cv4l_fmt &fmt, __u8 * cons=
t planes[3],
>>    case V4L2_PIX_FMT_RGBA444:
>>    case V4L2_PIX_FMT_BGRA444:
>>        c.a =3D (v16 >> 12) / 15.0;
>> -        /* fall through */
>> +        FALLTHROUGH;
>>    case V4L2_PIX_FMT_RGB444:
>>    case V4L2_PIX_FMT_XRGB444:
>>    case V4L2_PIX_FMT_XBGR444:
>> @@ -345,7 +351,7 @@ static void getColor(const cv4l_fmt &fmt, __u8 * cons=
t planes[3],
>>    case V4L2_PIX_FMT_ABGR555:
>>    case V4L2_PIX_FMT_BGRA555:
>>        c.a =3D v16 >> 15;
>> -        /* fall through */
>> +        FALLTHROUGH;
>>    case V4L2_PIX_FMT_YUV555:
>>    case V4L2_PIX_FMT_RGB555:
>>    case V4L2_PIX_FMT_XRGB555:
>> @@ -376,7 +382,7 @@ static void getColor(const cv4l_fmt &fmt, __u8 * cons=
t planes[3],
>>    case V4L2_PIX_FMT_RGBA32:
>>    case V4L2_PIX_FMT_BGRA32:
>>        c.a =3D ((v32 >> 24) & 0xff) / 255.0;
>> -        /* fall through */
>> +        FALLTHROUGH;
>>    default:
>>        c.r =3D ((v32 >> 16) & 0xff) / 255.0;
>>        c.g =3D ((v32 >> 8) & 0xff) / 255.0;
>> @@ -444,7 +450,7 @@ static void getColor(const cv4l_fmt &fmt, __u8 * cons=
t planes[3],
>>        Y =3D (Y - 16.0 / 255.0) * 255.0 / 219.0;
>>        cb *=3D 255.0 / 224.0;
>>        cr *=3D 255.0 / 224.0;
>> -        /* fall through */
>> +        FALLTHROUGH;
>>    case V4L2_YCBCR_ENC_601:
>>    default:
>>        ycbcr2rgb(bt601, Y, cb, cr, c);
>> @@ -453,7 +459,7 @@ static void getColor(const cv4l_fmt &fmt, __u8 * cons=
t planes[3],
>>        Y =3D (Y - 16.0 / 255.0) * 255.0 / 219.0;
>>        cb *=3D 255.0 / 224.0;
>>        cr *=3D 255.0 / 224.0;
>> -        /* fall through */
>> +        FALLTHROUGH;
>>    case V4L2_YCBCR_ENC_709:
>>        ycbcr2rgb(rec709, Y, cb, cr, c);
>>        break;
>> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp b/utils/v4l2-co=
mpliance/v4l2-test-controls.cpp
>> index 251a6049..2de888cf 100644
>> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
>> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
>> @@ -34,6 +34,12 @@
>>=20
>> #define V4L2_CTRL_CLASS_VIVID 0x00f00000
>>=20
>> +#ifdef __clang__
>> +#define FALLTHROUGH [[clang::fallthrough]]
>> +#else
>> +#define FALLTHROUGH [[gnu::fallthrough]]
>> +#endif
>> +
>> static int checkQCtrl(struct node *node, struct test_query_ext_ctrl &qctr=
l)
>> {
>>    struct v4l2_querymenu qmenu;
>> @@ -61,20 +67,20 @@ static int checkQCtrl(struct node *node, struct test_=
query_ext_ctrl &qctrl)
>>    case V4L2_CTRL_TYPE_BOOLEAN:
>>        if (qctrl.maximum > 1)
>>            return fail("invalid boolean max value\n");
>> -        /* fall through */
>> +        FALLTHROUGH;
>>    case V4L2_CTRL_TYPE_MENU:
>>    case V4L2_CTRL_TYPE_INTEGER_MENU:
>>        if (qctrl.step !=3D 1)
>>            return fail("invalid step value %lld\n", qctrl.step);
>>        if (qctrl.minimum < 0)
>>            return fail("min < 0\n");
>> -        /* fall through */
>> +        FALLTHROUGH;
>>    case V4L2_CTRL_TYPE_INTEGER:
>>    case V4L2_CTRL_TYPE_INTEGER64:
>>        if (qctrl.default_value < qctrl.minimum ||
>>            qctrl.default_value > qctrl.maximum)
>>            return fail("def < min || def > max\n");
>> -        /* fall through */
>> +        FALLTHROUGH;
>>    case V4L2_CTRL_TYPE_STRING:
>>        if (qctrl.minimum > qctrl.maximum)
>>            return fail("min > max\n");
>> @@ -116,7 +122,7 @@ static int checkQCtrl(struct node *node, struct test_=
query_ext_ctrl &qctrl)
>>    case V4L2_CTRL_TYPE_BUTTON:
>>        if ((fl & rw_mask) !=3D V4L2_CTRL_FLAG_WRITE_ONLY)
>>            return fail("button control not write only\n");
>> -        /* fall through */
>> +        FALLTHROUGH;
>>    case V4L2_CTRL_TYPE_BOOLEAN:
>>    case V4L2_CTRL_TYPE_MENU:
>>    case V4L2_CTRL_TYPE_INTEGER_MENU:
>> @@ -124,7 +130,7 @@ static int checkQCtrl(struct node *node, struct test_=
query_ext_ctrl &qctrl)
>>    case V4L2_CTRL_TYPE_BITMASK:
>>        if (fl & V4L2_CTRL_FLAG_SLIDER)
>>            return fail("slider makes only sense for integer controls\n");=

>> -        /* fall through */
>> +        FALLTHROUGH;
>>    case V4L2_CTRL_TYPE_INTEGER64:
>>    case V4L2_CTRL_TYPE_INTEGER:
>>        if ((fl & rw_mask) =3D=3D rw_mask)
>> diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-com=
pliance/v4l2-test-formats.cpp
>> index 3fc87316..9e98cf99 100644
>> --- a/utils/v4l2-compliance/v4l2-test-formats.cpp
>> +++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
>> @@ -32,6 +32,12 @@
>> #include <assert.h>
>> #include "v4l2-compliance.h"
>>=20
>> +#ifdef __clang__
>> +#define FALLTHROUGH [[clang::fallthrough]]
>> +#else
>> +#define FALLTHROUGH [[gnu::fallthrough]]
>> +#endif
>> +
>> static const __u32 buftype2cap[] =3D {
>>    0,
>>    V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_VIDEO_M2M,
>> @@ -97,7 +103,7 @@ static int testEnumFrameIntervals(struct node *node, _=
_u32 pixfmt,
>>        case V4L2_FRMIVAL_TYPE_CONTINUOUS:
>>            if (sw->step.numerator !=3D 1 || sw->step.denominator !=3D 1)
>>                return fail("invalid step for continuous frameinterval\n")=
;
>> -            /* fallthrough */
>> +            FALLTHROUGH;
>>        case V4L2_FRMIVAL_TYPE_STEPWISE:
>>            if (frmival.index)
>>                return fail("index must be 0 for stepwise/continuous frame=
intervals\n");
>> @@ -183,7 +189,7 @@ static int testEnumFrameSizes(struct node *node, __u3=
2 pixfmt)
>>        case V4L2_FRMSIZE_TYPE_CONTINUOUS:
>>            if (frmsize.stepwise.step_width !=3D 1 || frmsize.stepwise.ste=
p_height !=3D 1)
>>                return fail("invalid step_width/height for continuous fram=
esize\n");
>> -            /* fallthrough */
>> +            FALLTHROUGH;
>>        case V4L2_FRMSIZE_TYPE_STEPWISE:
>>            if (frmsize.index)
>>                return fail("index must be 0 for stepwise/continuous frame=
sizes\n");
>> diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-=
ctl-streaming.cpp
>> index 6981a3cc..bb464e99 100644
>> --- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>> +++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
>> @@ -24,6 +24,12 @@
>> #include <media-info.h>
>> #include <fwht-ctrls.h>
>>=20
>> +#ifdef __clang__
>> +#define FALLTHROUGH [[clang::fallthrough]]
>> +#else
>> +#define FALLTHROUGH [[gnu::fallthrough]]
>> +#endif
>> +
>> extern "C" {
>> #include "v4l2-tpg.h"
>> }
>> @@ -763,7 +769,7 @@ void streaming_cmd(int ch, char *optarg)
>>        break;
>>    case OptStreamUser:
>>        memory =3D V4L2_MEMORY_USERPTR;
>> -        /* fall through */
>> +        FALLTHROUGH;
>>    case OptStreamMmap:
>>        if (optarg) {
>>            reqbufs_count_cap =3D strtoul(optarg, 0L, 0);
>> @@ -776,7 +782,7 @@ void streaming_cmd(int ch, char *optarg)
>>        break;
>>    case OptStreamOutUser:
>>        out_memory =3D V4L2_MEMORY_USERPTR;
>> -        /* fall through */
>> +        FALLTHROUGH;
>>    case OptStreamOutMmap:
>>        if (optarg) {
>>            reqbufs_count_out =3D strtoul(optarg, 0L, 0);
>> diff --git a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp b/utils/v4l2-ctl/v4l2-ctl-vb=
i.cpp
>> index c5960f78..82d01b58 100644
>> --- a/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
>> +++ b/utils/v4l2-ctl/v4l2-ctl-vbi.cpp
>> @@ -16,6 +16,12 @@
>>=20
>> #include "v4l2-ctl.h"
>>=20
>> +#ifdef __clang__
>> +#define FALLTHROUGH [[clang::fallthrough]]
>> +#else
>> +#define FALLTHROUGH [[gnu::fallthrough]]
>> +#endif
>> +
>> static struct v4l2_format sliced_fmt;      /* set_format/get_format for s=
liced VBI */
>> static struct v4l2_format sliced_fmt_out; /* set_format/get_format for sl=
iced VBI output */
>> static struct v4l2_format raw_fmt;      /* set_format/get_format for VBI *=
/
>> @@ -87,7 +93,7 @@ void vbi_cmd(int ch, char *optarg)
>>    case OptSetSlicedVbiOutFormat:
>>    case OptTrySlicedVbiOutFormat:
>>        sliced =3D &sliced_fmt_out;
>> -        /* fall through */
>> +        FALLTHROUGH;
>>    case OptSetSlicedVbiFormat:
>>    case OptTrySlicedVbiFormat:
>>        sliced->fmt.sliced.service_set =3D 0;
>> @@ -130,7 +136,7 @@ void vbi_cmd(int ch, char *optarg)
>>    case OptSetVbiOutFormat:
>>    case OptTryVbiOutFormat:
>>        raw =3D &raw_fmt_out;
>> -        /* fall through */
>> +        FALLTHROUGH;
>>    case OptSetVbiFormat:
>>    case OptTryVbiFormat:
>>        subs =3D optarg;
>>=20
>=20
