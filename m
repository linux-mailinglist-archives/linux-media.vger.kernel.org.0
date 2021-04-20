Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BABA73655F1
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 12:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbhDTKOQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 06:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbhDTKOP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 06:14:15 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77985C06174A
        for <linux-media@vger.kernel.org>; Tue, 20 Apr 2021 03:13:44 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id z16so26260032pga.1
        for <linux-media@vger.kernel.org>; Tue, 20 Apr 2021 03:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=IR8CY3CCFkCMpeJH5eKBlolGkz2Kh/kxZ+qJg4+bkRM=;
        b=NEIrZriX35L78rwtZk7WuzZuQli7vnfy4bakqY9M+hyCc7EawhgE+k0oV9YEUtToMY
         aDSbQmTLWTTZ+e93Uxa8u3U9EKpJN4/xXdDGtvVVxeahNlfh7V2aPRLb8uEYMUhGVXUz
         uS2GLpP0lUjgyH2JF0La5GWNIDAa9jp/RR/shtJjguEp2neCLqm3d8gAwj30VnqU0xsp
         L1vza0mpeko8PVJqNSvxKxTYjYwozU7y7BAGG7Xxaft+qLjaFKzNLeUyORL2FBXrxVi9
         DLBzmJMylTvI1QueRldPtvB2UeuQcche7bzNzbLRXtdd5DidEAw7hkM/3qd4QMxNjUQa
         VeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=IR8CY3CCFkCMpeJH5eKBlolGkz2Kh/kxZ+qJg4+bkRM=;
        b=ZGLSMv47NCGmFgSzu/jS0U2b6vzcKlPMzpUEWSDMgVQFzIZHAUoVQKrMum03zz7lXu
         F/5pQMLJG86laMCB0488IH9BHpArt9lw12woXngaXI6GftXDpDM6hc5jKpwZA1azd3IL
         6Y6+iGi3r5CdxgdRbMF12N6madLEZkoebZgU1PMvG0+degKYk/75/Ft3H1vt/vbLqf5f
         O6ukuspyMtSeTPpnRgEFxCaYIRu/ke5cSMjluE9XDYDr/3NC1YqXZOjdA8kTIBLgd+qt
         ggs23iRWkFyqaKylq/rHT3JrQLbC3V66wbq9O8BSUjKBRd8NPxwxpNfTG0yK1/WAL2ez
         YuAA==
X-Gm-Message-State: AOAM530bEunhHFz2/BDTQtbgL7Gc3IY9WR3c1EKVNTduTtFy0RzTqwz4
        TSpOtq8An0XYrAdj9+ezpkI=
X-Google-Smtp-Source: ABdhPJx6Wxf62wtv+TXVAIcmzMdjFsoFXj2LxrQoN3NkmqaQiashmTuHdpN+BeKHAwiQuNVBNAGozQ==
X-Received: by 2002:a62:bd13:0:b029:25c:5ec4:c2f3 with SMTP id a19-20020a62bd130000b029025c5ec4c2f3mr14373110pff.35.1618913623621;
        Tue, 20 Apr 2021 03:13:43 -0700 (PDT)
Received: from ?IPv6:2001:470:1f05:79e:3511:2da7:f80:252d? ([2001:470:1f05:79e:3511:2da7:f80:252d])
        by smtp.gmail.com with ESMTPSA id 205sm14941427pfc.201.2021.04.20.03.13.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Apr 2021 03:13:43 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] v4l-utils: switch remote_subtest arrays to vector
From:   Rosen Penev <rosenp@gmail.com>
X-Mailer: iPhone Mail (16G201)
In-Reply-To: <c206618a-01f4-0cf4-7cdf-4f08a75c1559@xs4all.nl>
Date:   Tue, 20 Apr 2021 03:13:42 -0700
Cc:     linux-media@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <7A4EAA2C-9A31-4A3F-8ABA-8FE4F9D38980@gmail.com>
References: <20210420042714.3720981-1-rosenp@gmail.com> <c206618a-01f4-0cf4-7cdf-4f08a75c1559@xs4all.nl>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


> On Apr 20, 2021, at 02:54, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>=20
> Hi Rosen,
>=20
>> On 20/04/2021 06:27, Rosen Penev wrote:
>> Easier to read and allows removing some boilerplate code. Only a
>> moderate size increase.
>>=20
>> Ran through git clang-format
>=20
> Just to clarify: this is a clean up patch, right? There are no clang fixes=

> here as in your past patches.
Not directly no. I initially wanted to use std::array and constexpr but coul=
d not because of the size parameter. vector is good enough I think.
>=20
>>=20
>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>> ---
>> utils/cec-compliance/cec-compliance.h   |  26 ++--
>> utils/cec-compliance/cec-test-audio.cpp | 171 ++++++++++++---------
>> utils/cec-compliance/cec-test-power.cpp |  17 +--
>> utils/cec-compliance/cec-test.cpp       | 194 ++++++++----------------
>> 4 files changed, 177 insertions(+), 231 deletions(-)
>>=20
>> diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance=
/cec-compliance.h
>> index d87e4f1b7..c948dfb34 100644
>> --- a/utils/cec-compliance/cec-compliance.h
>> +++ b/utils/cec-compliance/cec-compliance.h
>> @@ -19,6 +19,8 @@
>>=20
>> #include <cec-info.h>
>>=20
>> +#include <vector>
>> +
>> #define TAG_AUDIO_RATE_CONTROL        1
>> #define TAG_ARC_CONTROL        (1 << 1)
>> #define TAG_CAP_DISCOVERY_CONTROL    (1 << 2)
>> @@ -456,25 +458,17 @@ void testRemote(struct node *node, unsigned me, uns=
igned la, unsigned test_tags,
>>                bool interactive);
>>=20
>> // cec-test-audio.cpp
>> -extern struct remote_subtest sac_subtests[];
>> -extern const unsigned sac_subtests_size;
>> -extern struct remote_subtest dal_subtests[];
>> -extern const unsigned dal_subtests_size;
>> -extern struct remote_subtest arc_subtests[];
>> -extern const unsigned arc_subtests_size;
>> -extern struct remote_subtest audio_rate_ctl_subtests[];
>> -extern const unsigned audio_rate_ctl_subtests_size;
>> +extern const std::vector<remote_subtest> sac_subtests;
>=20
> I think std::vector<remote_subtest> deserves a 'using' alias declaration.
Well, it=E2=80=99s not that long but OK
>=20
>> +extern const std::vector<remote_subtest> dal_subtests;
>> +extern const std::vector<remote_subtest> arc_subtests;
>> +extern const std::vector<remote_subtest> audio_rate_ctl_subtests;
>>=20
>> // cec-test-power.cpp
>> bool util_interactive_ensure_power_state(struct node *node, unsigned me, u=
nsigned la, bool interactive,
>>                    __u8 target_pwr);
>> -extern struct remote_subtest standby_subtests[];
>> -extern const unsigned standby_subtests_size;
>> -extern struct remote_subtest one_touch_play_subtests[];
>> -extern const unsigned one_touch_play_subtests_size;
>> -extern struct remote_subtest power_status_subtests[];
>> -extern const unsigned power_status_subtests_size;
>> -extern struct remote_subtest standby_resume_subtests[];
>> -extern const unsigned standby_resume_subtests_size;
>> +extern const std::vector<remote_subtest> standby_subtests;
>> +extern const std::vector<remote_subtest> one_touch_play_subtests;
>> +extern const std::vector<remote_subtest> power_status_subtests;
>> +extern const std::vector<remote_subtest> standby_resume_subtests;
>>=20
>> #endif
>> diff --git a/utils/cec-compliance/cec-test-audio.cpp b/utils/cec-complian=
ce/cec-test-audio.cpp
>> index 30b702e74..733549b19 100644
>> --- a/utils/cec-compliance/cec-test-audio.cpp
>> +++ b/utils/cec-compliance/cec-test-audio.cpp
>> @@ -82,14 +82,11 @@ static int dal_req_current_latency_invalid(struct nod=
e *node, unsigned me, unsig
>>   return 0;
>> }
>>=20
>> -struct remote_subtest dal_subtests[] =3D {
>> +const std::vector<remote_subtest> dal_subtests{
>>   { "Request Current Latency", CEC_LOG_ADDR_MASK_ALL, dal_request_current=
_latency },
>>   { "Request Current Latency with invalid PA", CEC_LOG_ADDR_MASK_ALL, dal=
_req_current_latency_invalid },
>> };
>>=20
>> -const unsigned dal_subtests_size =3D ARRAY_SIZE(dal_subtests);
>> -
>> -
>> /* Audio Return Channel Control */
>>=20
>> static __u16 pa_common_mask(__u16 pa1, __u16 pa2)
>> @@ -274,16 +271,13 @@ static int arc_terminate_rx(struct node *node, unsi=
gned me, unsigned la, bool in
>>   return 0;
>> }
>>=20
>> -struct remote_subtest arc_subtests[] =3D {
>> +const std::vector<remote_subtest> arc_subtests{
>>   { "Initiate ARC (RX)", CEC_LOG_ADDR_MASK_ALL, arc_initiate_rx },
>>   { "Terminate ARC (RX)", CEC_LOG_ADDR_MASK_ALL, arc_terminate_rx },
>>   { "Initiate ARC (TX)", CEC_LOG_ADDR_MASK_ALL, arc_initiate_tx },
>>   { "Terminate ARC (TX)", CEC_LOG_ADDR_MASK_ALL, arc_terminate_tx },
>> };
>>=20
>> -const unsigned arc_subtests_size =3D ARRAY_SIZE(arc_subtests);
>> -
>> -
>> /* System Audio Control */
>>=20
>> /*
>> @@ -762,66 +756,99 @@ static int sac_system_audio_mode_req_off(struct nod=
e *node, unsigned me, unsigne
>>   return 0;
>> }
>>=20
>> -struct remote_subtest sac_subtests[] =3D {
>> -    { "Request Short Audio Descriptor",
>> -      CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
>> -      sac_request_sad_probe },
>> -    { "Request Short Audio Descriptor, invalid",
>> -      CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
>> -      sac_request_sad_invalid },
>> -    { "Report Short Audio Descriptor consistency",
>> -      CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
>> -      sac_sad_format_check },
>> -    { "Report Short Audio Descriptor, multiple requests in one",
>> -      CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
>> -      sac_sad_req_multiple },
>> -    { "Set System Audio Mode (directly addressed)",
>> -      CEC_LOG_ADDR_MASK_TV,
>> -      sac_set_system_audio_mode_direct },
>> -    { "Set System Audio Mode (broadcast on)",
>> -      CEC_LOG_ADDR_MASK_TV,
>> -      sac_set_system_audio_mode_broadcast_on },
>> -    { "System Audio Mode Status",
>> -      CEC_LOG_ADDR_MASK_TV,
>> -      sac_system_audio_mode_status },
>> -    { "System Audio Mode Request (on)",
>> -      CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
>> -      sac_system_audio_mode_req_on },
>> -    { "Give System Audio Mode Status",
>> -      CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
>> -      sac_give_system_audio_mode_status },
>> -    { "Give Audio Status",
>> -      CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
>> -      sac_give_audio_status },
>> -    { "User Control Pressed (Volume Up)",
>> -      CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
>> -      sac_user_control_press_vol_up },
>> -    { "User Control Pressed (Volume Down)",
>> -      CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
>> -      sac_user_control_press_vol_down },
>> -    { "User Control Pressed (Mute)",
>> -      CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
>> -      sac_user_control_press_mute },
>> -    { "User Control Pressed (Restore Volume Function)",
>> -      CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
>> -      sac_user_control_press_restore_volume_function },
>> -    { "User Control Pressed (Mute Function)",
>> -      CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
>> -      sac_user_control_press_mute_function },
>> -    { "User Control Released (Audio)",
>> -      CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
>> -      sac_user_control_release },
>> -    { "Set System Audio Mode (broadcast off)",
>> -      CEC_LOG_ADDR_MASK_TV,
>> -      sac_set_system_audio_mode_broadcast_off },
>> -    { "System Audio Mode Request (off)",
>> -      CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
>> -      sac_system_audio_mode_req_off },
>> +const std::vector<remote_subtest> sac_subtests{
>> +    {
>> +        "Request Short Audio Descriptor",
>> +        CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
>> +        sac_request_sad_probe,
>> +    },
>> +    {
>> +        "Request Short Audio Descriptor, invalid",
>> +        CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
>> +        sac_request_sad_invalid,
>> +    },
>> +    {
>> +        "Report Short Audio Descriptor consistency",
>> +        CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
>> +        sac_sad_format_check,
>> +    },
>> +    {
>> +        "Report Short Audio Descriptor, multiple requests in one",
>> +        CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
>> +        sac_sad_req_multiple,
>> +    },
>> +    {
>> +        "Set System Audio Mode (directly addressed)",
>> +        CEC_LOG_ADDR_MASK_TV,
>> +        sac_set_system_audio_mode_direct,
>> +    },
>> +    {
>> +        "Set System Audio Mode (broadcast on)",
>> +        CEC_LOG_ADDR_MASK_TV,
>> +        sac_set_system_audio_mode_broadcast_on,
>> +    },
>> +    {
>> +        "System Audio Mode Status",
>> +        CEC_LOG_ADDR_MASK_TV,
>> +        sac_system_audio_mode_status,
>> +    },
>> +    {
>> +        "System Audio Mode Request (on)",
>> +        CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
>> +        sac_system_audio_mode_req_on,
>> +    },
>> +    {
>> +        "Give System Audio Mode Status",
>> +        CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
>> +        sac_give_system_audio_mode_status,
>> +    },
>> +    {
>> +        "Give Audio Status",
>> +        CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
>> +        sac_give_audio_status,
>> +    },
>> +    {
>> +        "User Control Pressed (Volume Up)",
>> +        CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
>> +        sac_user_control_press_vol_up,
>> +    },
>> +    {
>> +        "User Control Pressed (Volume Down)",
>> +        CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
>> +        sac_user_control_press_vol_down,
>> +    },
>> +    {
>> +        "User Control Pressed (Mute)",
>> +        CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
>> +        sac_user_control_press_mute,
>> +    },
>> +    {
>> +        "User Control Pressed (Restore Volume Function)",
>> +        CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
>> +        sac_user_control_press_restore_volume_function,
>> +    },
>> +    {
>> +        "User Control Pressed (Mute Function)",
>> +        CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
>> +        sac_user_control_press_mute_function,
>> +    },
>> +    {
>> +        "User Control Released (Audio)",
>> +        CEC_LOG_ADDR_MASK_AUDIOSYSTEM | CEC_LOG_ADDR_MASK_TV,
>> +        sac_user_control_release,
>> +    },
>> +    {
>> +        "Set System Audio Mode (broadcast off)",
>> +        CEC_LOG_ADDR_MASK_TV,
>> +        sac_set_system_audio_mode_broadcast_off,
>> +    },
>> +    {
>> +        "System Audio Mode Request (off)",
>> +        CEC_LOG_ADDR_MASK_AUDIOSYSTEM,
>> +        sac_system_audio_mode_req_off,
>> +    },
>> };
>>=20
>> -const unsigned sac_subtests_size =3D ARRAY_SIZE(sac_subtests);
>> -
>> -
>> /* Audio Rate Control */
>>=20
>> /*
>> @@ -848,10 +875,10 @@ static int audio_rate_ctl_set_audio_rate(struct nod=
e *node, unsigned me, unsigne
>>   return OK_PRESUMED;
>> }
>>=20
>> -struct remote_subtest audio_rate_ctl_subtests[] =3D {
>> -    { "Set Audio Rate",
>> -      CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_AD=
DR_MASK_TUNER,
>> -      audio_rate_ctl_set_audio_rate },
>> +const std::vector<remote_subtest> audio_rate_ctl_subtests{
>> +    {
>> +        "Set Audio Rate",
>> +        CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD | CEC_LOG_=
ADDR_MASK_TUNER,
>> +        audio_rate_ctl_set_audio_rate,
>> +    },
>> };
>> -
>> -const unsigned audio_rate_ctl_subtests_size =3D ARRAY_SIZE(audio_rate_ct=
l_subtests);
>> diff --git a/utils/cec-compliance/cec-test-power.cpp b/utils/cec-complian=
ce/cec-test-power.cpp
>> index 42f4d2980..ff17b015e 100644
>> --- a/utils/cec-compliance/cec-test-power.cpp
>> +++ b/utils/cec-compliance/cec-test-power.cpp
>> @@ -6,6 +6,7 @@
>> #include <cerrno>
>> #include <ctime>
>> #include <string>
>> +#include <vector>
>>=20
>> #include <sys/ioctl.h>
>> #include <unistd.h>
>> @@ -95,14 +96,11 @@ static int power_status_report(struct node *node, uns=
igned me, unsigned la, bool
>>   return OK_PRESUMED;
>> }
>>=20
>> -struct remote_subtest power_status_subtests[] =3D {
>> +const std::vector<remote_subtest> power_status_subtests{
>>   { "Give Device Power Status", CEC_LOG_ADDR_MASK_ALL, power_status_give }=
,
>>   { "Report Device Power Status", CEC_LOG_ADDR_MASK_ALL, power_status_rep=
ort },
>> };
>>=20
>> -const unsigned power_status_subtests_size =3D ARRAY_SIZE(power_status_su=
btests);
>> -
>> -
>> /* One Touch Play */
>>=20
>> static int one_touch_play_view_on(struct node *node, unsigned me, unsigne=
d la, bool interactive,
>> @@ -233,7 +231,7 @@ static int one_touch_play_req_active_source(struct no=
de *node, unsigned me, unsi
>>   return 0;
>> }
>>=20
>> -struct remote_subtest one_touch_play_subtests[] =3D {
>> +const std::vector<remote_subtest> one_touch_play_subtests{
>>   { "Image View On", CEC_LOG_ADDR_MASK_TV, one_touch_play_image_view_on }=
,
>>   { "Text View On", CEC_LOG_ADDR_MASK_TV, one_touch_play_text_view_on },
>>   { "Wakeup on Image View On", CEC_LOG_ADDR_MASK_TV, one_touch_play_image=
_view_on_wakeup },
>> @@ -243,9 +241,6 @@ struct remote_subtest one_touch_play_subtests[] =3D {=

>>   { "Active Source and Request Active Source", CEC_LOG_ADDR_MASK_ALL, one=
_touch_play_req_active_source },
>> };
>>=20
>> -const unsigned one_touch_play_subtests_size =3D ARRAY_SIZE(one_touch_pla=
y_subtests);
>> -
>> -
>> /* Standby / Resume */
>>=20
>> /* The default sleep time between power status requests. */
>> @@ -638,7 +633,7 @@ static int power_state_transitions(struct node *node,=
 unsigned me, unsigned la,
>>   return 0;
>> }
>>=20
>> -struct remote_subtest standby_resume_subtests[] =3D {
>> +const std::vector<remote_subtest> standby_resume_subtests{
>>   { "Standby", CEC_LOG_ADDR_MASK_ALL, standby_resume_standby },
>>   { "Repeated Standby message does not wake up", CEC_LOG_ADDR_MASK_ALL, s=
tandby_resume_standby_toggle },
>>   { "Standby: Feature aborts unknown messages", CEC_LOG_ADDR_MASK_ALL, co=
re_unknown, true },
>> @@ -652,10 +647,8 @@ struct remote_subtest standby_resume_subtests[] =3D {=

>>   { "Standby: Get Menu Language", CEC_LOG_ADDR_MASK_ALL, system_info_get_=
menu_lang, true },
>>   { "Standby: Give Device Features", CEC_LOG_ADDR_MASK_ALL, system_info_g=
ive_features, true },
>>   { "No wakeup on Active Source", CEC_LOG_ADDR_MASK_ALL, standby_resume_a=
ctive_source_nowake },
>> -    { "Wake up", CEC_LOG_ADDR_MASK_ALL, standby_resume_wakeup},
>> +    { "Wake up", CEC_LOG_ADDR_MASK_ALL, standby_resume_wakeup },
>>   { "Wake up TV on Image View On", CEC_LOG_ADDR_MASK_TV, standby_resume_w=
akeup_image_view_on },
>>   { "Wake up TV on Text View On", CEC_LOG_ADDR_MASK_TV, standby_resume_wa=
keup_text_view_on },
>>   { "Power State Transitions", CEC_LOG_ADDR_MASK_TV, power_state_transiti=
ons, false, true },
>> };
>> -
>> -const unsigned standby_resume_subtests_size =3D ARRAY_SIZE(standby_resum=
e_subtests);
>> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec=
-test.cpp
>> index 8a9ea2afe..ede52ee1b 100644
>> --- a/utils/cec-compliance/cec-test.cpp
>> +++ b/utils/cec-compliance/cec-test.cpp
>> @@ -13,14 +13,15 @@
>>=20
>> #include "cec-compliance.h"
>>=20
>> -#define test_case(name, tags, subtests) {name, tags, subtests, ARRAY_SIZ=
E(subtests)}
>> -#define test_case_ext(name, tags, subtests) {name, tags, subtests, subte=
sts##_size}
>> +#define test_case(name, tags, subtests) \
>> +    {                               \
>> +        name, tags, subtests,   \
>> +    }
>>=20
>> struct remote_test {
>>   const char *name;
>>   const unsigned tags;
>> -    struct remote_subtest *subtests;
>> -    unsigned num_subtests;
>> +    const std::vector<remote_subtest> &subtests;
>> };
>>=20
>>=20
>> @@ -178,7 +179,7 @@ int system_info_give_features(struct node *node, unsi=
gned me, unsigned la, bool
>>   return 0;
>> }
>>=20
>> -static struct remote_subtest system_info_subtests[] =3D {
>> +static const std::vector<remote_subtest> system_info_subtests{
>>   { "Polling Message", CEC_LOG_ADDR_MASK_ALL, system_info_polling },
>>   { "Give Physical Address", CEC_LOG_ADDR_MASK_ALL, system_info_phys_addr=
 },
>>   { "Give CEC Version", CEC_LOG_ADDR_MASK_ALL, system_info_version },
>> @@ -187,7 +188,6 @@ static struct remote_subtest system_info_subtests[] =3D=
 {
>>   { "Give Device Features", CEC_LOG_ADDR_MASK_ALL, system_info_give_featu=
res },
>> };
>>=20
>> -
>> /* Core behavior */
>>=20
>> int core_unknown(struct node *node, unsigned me, unsigned la, bool intera=
ctive)
>> @@ -237,12 +237,11 @@ int core_abort(struct node *node, unsigned me, unsi=
gned la, bool interactive)
>>   return 0;
>> }
>>=20
>> -static struct remote_subtest core_subtests[] =3D {
>> +static const std::vector<remote_subtest> core_subtests{
>>   { "Feature aborts unknown messages", CEC_LOG_ADDR_MASK_ALL, core_unknow=
n },
>>   { "Feature aborts Abort message", CEC_LOG_ADDR_MASK_ALL, core_abort },
>> };
>>=20
>> -
>> /* Vendor Specific Commands */
>>=20
>> int vendor_specific_commands_id(struct node *node, unsigned me, unsigned l=
a, bool interactive)
>> @@ -265,11 +264,10 @@ int vendor_specific_commands_id(struct node *node, u=
nsigned me, unsigned la, boo
>>   return 0;
>> }
>>=20
>> -static struct remote_subtest vendor_specific_subtests[] =3D {
>> +static const std::vector<remote_subtest> vendor_specific_subtests{
>>   { "Give Device Vendor ID", CEC_LOG_ADDR_MASK_ALL, vendor_specific_comma=
nds_id },
>> };
>>=20
>> -
>> /* Device OSD Transfer */
>>=20
>> static int device_osd_transfer_set(struct node *node, unsigned me, unsign=
ed la, bool interactive)
>> @@ -317,12 +315,11 @@ int device_osd_transfer_give(struct node *node, uns=
igned me, unsigned la, bool i
>>   return 0;
>> }
>>=20
>> -static struct remote_subtest device_osd_transfer_subtests[] =3D {
>> +static const std::vector<remote_subtest> device_osd_transfer_subtests{
>>   { "Set OSD Name", CEC_LOG_ADDR_MASK_ALL, device_osd_transfer_set },
>>   { "Give OSD Name", CEC_LOG_ADDR_MASK_ALL, device_osd_transfer_give },
>> };
>>=20
>> -
>> /* OSD Display */
>>=20
>> static int osd_string_set_default(struct node *node, unsigned me, unsigne=
d la, bool interactive)
>> @@ -418,13 +415,12 @@ static int osd_string_invalid(struct node *node, un=
signed me, unsigned la, bool
>>   return 0;
>> }
>>=20
>> -static struct remote_subtest osd_string_subtests[] =3D {
>> +static const std::vector<remote_subtest> osd_string_subtests{
>>   { "Set OSD String with default timeout", CEC_LOG_ADDR_MASK_TV, osd_stri=
ng_set_default },
>>   { "Set OSD String with no timeout", CEC_LOG_ADDR_MASK_TV, osd_string_se=
t_until_clear },
>>   { "Set OSD String with invalid operand", CEC_LOG_ADDR_MASK_TV, osd_stri=
ng_invalid },
>> };
>>=20
>> -
>> /* Routing Control */
>>=20
>> static int routing_control_inactive_source(struct node *node, unsigned me=
, unsigned la, bool interactive)
>> @@ -525,14 +521,13 @@ static int routing_control_set_stream_path(struct n=
ode *node, unsigned me, unsig
>>   return OK_PRESUMED;
>> }
>>=20
>> -static struct remote_subtest routing_control_subtests[] =3D {
>> +static const std::vector<remote_subtest> routing_control_subtests{
>>   { "Active Source", CEC_LOG_ADDR_MASK_TV, routing_control_active_source }=
,
>>   { "Request Active Source", CEC_LOG_ADDR_MASK_ALL, routing_control_req_a=
ctive_source },
>>   { "Inactive Source", CEC_LOG_ADDR_MASK_TV, routing_control_inactive_sou=
rce },
>>   { "Set Stream Path", CEC_LOG_ADDR_MASK_ALL, routing_control_set_stream_=
path },
>> };
>>=20
>> -
>> /* Remote Control Passthrough */
>>=20
>> static int rc_passthrough_user_ctrl_pressed(struct node *node, unsigned m=
e, unsigned la, bool interactive)
>> @@ -573,12 +568,11 @@ static int rc_passthrough_user_ctrl_released(struct=
 node *node, unsigned me, uns
>>   return OK_PRESUMED;
>> }
>>=20
>> -static struct remote_subtest rc_passthrough_subtests[] =3D {
>> +static const std::vector<remote_subtest> rc_passthrough_subtests{
>>   { "User Control Pressed", CEC_LOG_ADDR_MASK_ALL, rc_passthrough_user_ct=
rl_pressed },
>>   { "User Control Released", CEC_LOG_ADDR_MASK_ALL, rc_passthrough_user_c=
trl_released },
>> };
>>=20
>> -
>> /* Device Menu Control */
>>=20
>> /*
>> @@ -604,13 +598,12 @@ static int dev_menu_ctl_request(struct node *node, u=
nsigned me, unsigned la, boo
>>   return 0;
>> }
>>=20
>> -static struct remote_subtest dev_menu_ctl_subtests[] =3D {
>> +static const std::vector<remote_subtest> dev_menu_ctl_subtests{
>>   { "Menu Request", static_cast<__u16>(~CEC_LOG_ADDR_MASK_TV), dev_menu_c=
tl_request },
>>   { "User Control Pressed", CEC_LOG_ADDR_MASK_ALL, rc_passthrough_user_ct=
rl_pressed },
>>   { "User Control Released", CEC_LOG_ADDR_MASK_ALL, rc_passthrough_user_c=
trl_released },
>> };
>>=20
>> -
>> /* Deck Control */
>>=20
>> /*
>> @@ -704,22 +697,13 @@ static int deck_ctl_play(struct node *node, unsigne=
d me, unsigned la, bool inter
>>   return OK_PRESUMED;
>> }
>>=20
>> -static struct remote_subtest deck_ctl_subtests[] =3D {
>> -    { "Give Deck Status",
>> -      CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
>> -      deck_ctl_give_status },
>> -    { "Deck Status",
>> -      CEC_LOG_ADDR_MASK_ALL,
>> -      deck_ctl_deck_status },
>> -    { "Deck Control",
>> -      CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
>> -      deck_ctl_deck_ctl },
>> -    { "Play",
>> -      CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD,
>> -      deck_ctl_play },
>> +static const std::vector<remote_subtest> deck_ctl_subtests{
>> +    { "Give Deck Status", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK=
_RECORD, deck_ctl_give_status },
>> +    { "Deck Status", CEC_LOG_ADDR_MASK_ALL, deck_ctl_deck_status },
>> +    { "Deck Control", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_REC=
ORD, deck_ctl_deck_ctl },
>> +    { "Play", CEC_LOG_ADDR_MASK_PLAYBACK | CEC_LOG_ADDR_MASK_RECORD, dec=
k_ctl_play },
>> };
>>=20
>> -
>> /* Tuner Control */
>>=20
>> static const char *bcast_type2s(__u8 bcast_type)
>> @@ -912,7 +896,7 @@ static int tuner_ctl_test(struct node *node, unsigned=
 me, unsigned la, bool inte
>>   printf("\t    Finished Channel Scan\n");
>>=20
>>   printf("\t    Start Channel Test\n");
>> -    for (const auto &iter : info_vec) {
>> +    for (auto &&iter : info_vec) {
>>       cec_msg_init(&msg, me, la);
>>       log_tuner_service(iter, "Select ");
>>       if (iter.is_analog)
>> @@ -957,11 +941,10 @@ static int tuner_ctl_test(struct node *node, unsign=
ed me, unsigned la, bool inte
>>   return 0;
>> }
>>=20
>> -static struct remote_subtest tuner_ctl_subtests[] =3D {
>> +static const std::vector<remote_subtest> tuner_ctl_subtests{
>>   { "Tuner Control", CEC_LOG_ADDR_MASK_TUNER | CEC_LOG_ADDR_MASK_TV, tune=
r_ctl_test },
>> };
>>=20
>> -
>> /* One Touch Record */
>>=20
>> /*
>> @@ -1061,14 +1044,13 @@ static int one_touch_rec_status(struct node *node=
, unsigned me, unsigned la, boo
>>   return 0;
>> }
>>=20
>> -static struct remote_subtest one_touch_rec_subtests[] =3D {
>> +static const std::vector<remote_subtest> one_touch_rec_subtests{
>>   { "Record TV Screen", CEC_LOG_ADDR_MASK_TV, one_touch_rec_tv_screen },
>>   { "Record On", CEC_LOG_ADDR_MASK_RECORD, one_touch_rec_on },
>>   { "Record Off", CEC_LOG_ADDR_MASK_RECORD, one_touch_rec_off },
>>   { "Record Status", CEC_LOG_ADDR_MASK_ALL, one_touch_rec_status },
>> };
>>=20
>> -
>> /* Timer Programming */
>>=20
>> /*
>> @@ -1281,7 +1263,7 @@ static int timer_prog_timer_clear_status(struct nod=
e *node, unsigned me, unsigne
>>   return OK_PRESUMED;
>> }
>>=20
>> -static struct remote_subtest timer_prog_subtests[] =3D {
>> +static const std::vector<remote_subtest> timer_prog_subtests{
>>   { "Set Analogue Timer", CEC_LOG_ADDR_MASK_RECORD, timer_prog_set_analog=
_timer },
>>   { "Set Digital Timer", CEC_LOG_ADDR_MASK_RECORD, timer_prog_set_digital=
_timer },
>>   { "Set Timer Program Title", CEC_LOG_ADDR_MASK_RECORD, timer_prog_set_p=
rog_title },
>> @@ -1384,11 +1366,10 @@ static int cdc_hec_discover(struct node *node, un=
signed me, unsigned la, bool pr
>>   return OK_NOT_SUPPORTED;
>> }
>>=20
>> -static struct remote_subtest cdc_subtests[] =3D {
>> +static const std::vector<remote_subtest> cdc_subtests{
>>   { "CDC_HEC_Discover", CEC_LOG_ADDR_MASK_ALL, cdc_hec_discover },
>> };
>>=20
>> -
>> /* Post-test checks */
>>=20
>> static int post_test_check_recognized(struct node *node, unsigned me, uns=
igned la, bool interactive)
>> @@ -1409,79 +1390,34 @@ static int post_test_check_recognized(struct node=
 *node, unsigned me, unsigned l
>>   return 0;
>> }
>>=20
>> -static struct remote_subtest post_test_subtests[] =3D {
>> +static const std::vector<remote_subtest> post_test_subtests{
>>   { "Recognized/unrecognized message consistency", CEC_LOG_ADDR_MASK_ALL,=
 post_test_check_recognized },
>> };
>>=20
>> -
>> -static const struct remote_test tests[] =3D {
>> -    test_case("Core",
>> -          TAG_CORE,
>> -          core_subtests),
>> -    test_case_ext("Give Device Power Status feature",
>> -              TAG_POWER_STATUS,
>> -              power_status_subtests),
>> -    test_case("System Information feature",
>> -          TAG_SYSTEM_INFORMATION,
>> -          system_info_subtests),
>> -    test_case("Vendor Specific Commands feature",
>> -          TAG_VENDOR_SPECIFIC_COMMANDS,
>> -          vendor_specific_subtests),
>> -    test_case("Device OSD Transfer feature",
>> -          TAG_DEVICE_OSD_TRANSFER,
>> -          device_osd_transfer_subtests),
>> -    test_case("OSD String feature",
>> -          TAG_OSD_DISPLAY,
>> -          osd_string_subtests),
>> -    test_case("Remote Control Passthrough feature",
>> -          TAG_REMOTE_CONTROL_PASSTHROUGH,
>> -          rc_passthrough_subtests),
>> -    test_case("Device Menu Control feature",
>> -          TAG_DEVICE_MENU_CONTROL,
>> -          dev_menu_ctl_subtests),
>> -    test_case("Deck Control feature",
>> -          TAG_DECK_CONTROL,
>> -          deck_ctl_subtests),
>> -    test_case("Tuner Control feature",
>> -          TAG_TUNER_CONTROL,
>> -          tuner_ctl_subtests),
>> -    test_case("One Touch Record feature",
>> -          TAG_ONE_TOUCH_RECORD,
>> -          one_touch_rec_subtests),
>> -    test_case("Timer Programming feature",
>> -          TAG_TIMER_PROGRAMMING,
>> -          timer_prog_subtests),
>> -    test_case("Capability Discovery and Control feature",
>> -          TAG_CAP_DISCOVERY_CONTROL,
>> -          cdc_subtests),
>> -    test_case_ext("Dynamic Auto Lipsync feature",
>> -              TAG_DYNAMIC_AUTO_LIPSYNC,
>> -              dal_subtests),
>> -    test_case_ext("Audio Return Channel feature",
>> -              TAG_ARC_CONTROL,
>> -              arc_subtests),
>> -    test_case_ext("System Audio Control feature",
>> -              TAG_SYSTEM_AUDIO_CONTROL,
>> -              sac_subtests),
>> -    test_case_ext("Audio Rate Control feature",
>> -              TAG_AUDIO_RATE_CONTROL,
>> -              audio_rate_ctl_subtests),
>> -    test_case_ext("One Touch Play feature",
>> -              TAG_ONE_TOUCH_PLAY,
>> -              one_touch_play_subtests),
>> -    test_case("Routing Control feature",
>> -          TAG_ROUTING_CONTROL,
>> -          routing_control_subtests),
>> -    test_case_ext("Standby/Resume and Power Status",
>> -              TAG_POWER_STATUS | TAG_STANDBY_RESUME,
>> -              standby_resume_subtests),
>> -    test_case("Post-test checks",
>> -          TAG_CORE,
>> -          post_test_subtests),
>> +static const remote_test tests[] =3D {
>> +    test_case("Core", TAG_CORE, core_subtests),
>> +    test_case("Give Device Power Status feature", TAG_POWER_STATUS, powe=
r_status_subtests),
>> +    test_case("System Information feature", TAG_SYSTEM_INFORMATION, syst=
em_info_subtests),
>> +    test_case("Vendor Specific Commands feature", TAG_VENDOR_SPECIFIC_CO=
MMANDS, vendor_specific_subtests),
>> +    test_case("Device OSD Transfer feature", TAG_DEVICE_OSD_TRANSFER, de=
vice_osd_transfer_subtests),
>> +    test_case("OSD String feature", TAG_OSD_DISPLAY, osd_string_subtests=
),
>> +    test_case("Remote Control Passthrough feature", TAG_REMOTE_CONTROL_P=
ASSTHROUGH, rc_passthrough_subtests),
>> +    test_case("Device Menu Control feature", TAG_DEVICE_MENU_CONTROL, de=
v_menu_ctl_subtests),
>> +    test_case("Deck Control feature", TAG_DECK_CONTROL, deck_ctl_subtest=
s),
>> +    test_case("Tuner Control feature", TAG_TUNER_CONTROL, tuner_ctl_subt=
ests),
>> +    test_case("One Touch Record feature", TAG_ONE_TOUCH_RECORD, one_touc=
h_rec_subtests),
>> +    test_case("Timer Programming feature", TAG_TIMER_PROGRAMMING, timer_=
prog_subtests),
>> +    test_case("Capability Discovery and Control feature", TAG_CAP_DISCOV=
ERY_CONTROL, cdc_subtests),
>> +    test_case("Dynamic Auto Lipsync feature", TAG_DYNAMIC_AUTO_LIPSYNC, d=
al_subtests),
>> +    test_case("Audio Return Channel feature", TAG_ARC_CONTROL, arc_subte=
sts),
>> +    test_case("System Audio Control feature", TAG_SYSTEM_AUDIO_CONTROL, s=
ac_subtests),
>> +    test_case("Audio Rate Control feature", TAG_AUDIO_RATE_CONTROL, audi=
o_rate_ctl_subtests),
>> +    test_case("One Touch Play feature", TAG_ONE_TOUCH_PLAY, one_touch_pl=
ay_subtests),
>> +    test_case("Routing Control feature", TAG_ROUTING_CONTROL, routing_co=
ntrol_subtests),
>> +    test_case("Standby/Resume and Power Status", TAG_POWER_STATUS | TAG_=
STANDBY_RESUME, standby_resume_subtests),
>> +    test_case("Post-test checks", TAG_CORE, post_test_subtests),
>> };
>>=20
>> -static const unsigned num_tests =3D sizeof(tests) / sizeof(struct remote=
_test);
>> -
>> static std::map<std::string, int> mapTests;
>> static std::map<std::string, bool> mapTestsNoWarnings;
>>=20
>> @@ -1489,15 +1425,14 @@ void collectTests()
>> {
>>   std::map<std::string, __u64> mapTestFuncs;
>>=20
>> -    for (const auto &test : tests) {
>> -        for (unsigned j =3D 0; j < test.num_subtests; j++) {
>> -            std::string name =3D safename(test.subtests[j].name);
>> -            auto func =3D (__u64)test.subtests[j].test_fn;
>> +    for (auto &&test : tests) {
>> +        for (auto &&subtest : test.subtests) {
>> +            std::string name =3D safename(subtest.name);
>> +            auto func =3D (__u64)subtest.test_fn;
>>=20
>>           if (mapTestFuncs.find(name) !=3D mapTestFuncs.end() &&
>>               mapTestFuncs[name] !=3D func) {
>> -                fprintf(stderr, "Duplicate subtest name, but different t=
ests: %s\n",
>> -                    test.subtests[j].name);
>> +                fprintf(stderr, "Duplicate subtest name, but different t=
ests: %s\n", subtest.name);
>>               std::exit(EXIT_FAILURE);
>>           }
>>           mapTestFuncs[name] =3D func;
>> @@ -1509,12 +1444,10 @@ void collectTests()
>>=20
>> void listTests()
>> {
>> -    for (const auto &test : tests) {
>> +    for (auto &&test : tests) {
>>       printf("%s:\n", test.name);
>> -        for (unsigned j =3D 0; j < test.num_subtests; j++) {
>> -            std::string name =3D safename(test.subtests[j].name);
>> -
>> -            printf("\t%s\n", name.c_str());
>> +        for (auto &&subtest : test.subtests) {
>> +            printf("\t%s\n", safename(subtest.name).c_str());
>>       }
>>   }
>> }
>> @@ -1553,32 +1486,31 @@ void testRemote(struct node *node, unsigned me, u=
nsigned la, unsigned test_tags,
>>=20
>>   int ret =3D 0;
>>=20
>> -    for (const auto &test : tests) {
>> +    for (auto &&test : tests) {
>=20
> Why use 'auto &&test' instead of 'const auto &test'? Is there a good reaso=
n
> for that? The original is much more readable and from what I understand ju=
st
> as efficient (not that efficiency is an issue here).
>=20
> The same for other occurences of this idiom.
In a different project, I replaced all range loops to use auto&& and got a s=
ize decrease. I don=E2=80=99t have a good explanation for it. Maybe it helps=
 with copy elision which const can sometimes prevent. Not sure.

My understanding of auto&& is that it evaluates to const ref, then ref, then=
 value in that order.
>=20
> Regards,
>=20
>   Hans
>=20
>>       if ((test.tags & test_tags) !=3D test.tags)
>>           continue;
>>=20
>>       printf("\t%s:\n", test.name);
>> -        for (unsigned j =3D 0; j < test.num_subtests; j++) {
>> -            const char *name =3D test.subtests[j].name;
>> +        for (auto &&subtest : test.subtests) {
>> +            const char *name =3D subtest.name;
>>=20
>> -            if (test.subtests[j].for_cec20 &&
>> -                (node->remote[la].cec_version < CEC_OP_CEC_VERSION_2_0 |=
|
>> -                 !node->has_cec20))
>> +            if (subtest.for_cec20 &&
>> +                (node->remote[la].cec_version < CEC_OP_CEC_VERSION_2_0 |=
| !node->has_cec20))
>>               continue;
>>=20
>> -            if (test.subtests[j].in_standby) {
>> +            if (subtest.in_standby) {
>>               struct cec_log_addrs laddrs =3D { };
>>               doioctl(node, CEC_ADAP_G_LOG_ADDRS, &laddrs);
>>=20
>>               if (!laddrs.log_addr_mask)
>>                   continue;
>>           }
>> -            node->in_standby =3D test.subtests[j].in_standby;
>> +            node->in_standby =3D subtest.in_standby;
>>           mode_set_initiator(node);
>>           unsigned old_warnings =3D warnings;
>> -            ret =3D test.subtests[j].test_fn(node, me, la, interactive);=

>> +            ret =3D subtest.test_fn(node, me, la, interactive);
>>           bool has_warnings =3D old_warnings < warnings;
>> -            if (!(test.subtests[j].la_mask & (1 << la)) && !ret)
>> +            if (!(subtest.la_mask & (1 << la)) && !ret)
>>               ret =3D OK_UNEXPECTED;
>>=20
>>           if (mapTests[safename(name)] !=3D DONT_CARE) {
>=20
