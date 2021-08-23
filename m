Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB7603F47ED
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 11:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232203AbhHWJvh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 05:51:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhHWJvg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 05:51:36 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B140C061575
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 02:50:54 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id o15so10099358wmr.3
        for <linux-media@vger.kernel.org>; Mon, 23 Aug 2021 02:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=umWt26Jpv6O7JNFnZ9XdBXmi6YoAcAX7J7kh13vDMO8=;
        b=gxbcFWXq1Mo+43J85zFDpyZIdtIonE6YS5VzVjPm5Q0HOXmKRze6V2+RbEAthbv+yf
         Z7cb8P79MjY7UsFjFxVt69iw4/2hqruoh4CeUJJU9ccEzYtDSeA7k//BJ0cUdY/HlOe9
         HVddWz1IMYs/ufAPT6BMwG0mlwd/TkYmdFxSTXqu2nET6Fj9wxCFasdjpFunn2F8lJMg
         QjEoEqhZoVZ+s26joNNOZRLDQe/SzfSwxvVakDc2rGnOyCwBJOuC1g+BSHGNYmHTZV54
         E5ygg7J8sroq4UYZ+Y8cnXaUmiGhn6yRgMTwygmzuJjfWoaNARfYHIRKqNb1opsdbOrD
         F8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=umWt26Jpv6O7JNFnZ9XdBXmi6YoAcAX7J7kh13vDMO8=;
        b=qm/tkKwjQd7kPyk1OwKCacHI1LPPjaDU3iZDuJM0WSlwf9xXVDjLJoFKtXM5K9aHOM
         g5dOexifg5jV8fXBbTAUO9Rv0wfOAkyKPliaShuLNWIlyghVDzXXDPYMd0FfkJ1zCQLK
         8wWbmLrjeWoIG/7zEZzyCamjaHOrE6/p6EfGaB3oQ8DOsiSMCimW5aMtGbMsEsI4Ru4O
         Y9NTYkQEk5aMnpBLxXF0wdJGErpwe/S5AOBX6LVj9iQloKC32FN3FcbivyZuAC5tXR22
         65CwuiQsgI1EapzEiFOm0outT9beGmZ92c+uoPmotjjIVYcMZm6z82oNACYLkVgwOFf3
         nVKQ==
X-Gm-Message-State: AOAM533u5B91GCWVAkRURYGrfnI7WBYkoHt85jK2zNEfFT7vDDs4TeqJ
        xocp/QxrKrz4npZ+Gd2iRWAs+MSBo6CoGw==
X-Google-Smtp-Source: ABdhPJxe/p7wsXZv7KHfMzGU24CSMV07/JHo6jYIi4E3QT23/ik3j0iRx9K3bPXrRojiYlHHRVVG4Q==
X-Received: by 2002:a1c:2086:: with SMTP id g128mr298032wmg.46.1629712252762;
        Mon, 23 Aug 2021 02:50:52 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id n14sm10268730wrr.28.2021.08.23.02.50.52
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 23 Aug 2021 02:50:52 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH] media: hevc: fix pictures lists type
Date:   Mon, 23 Aug 2021 10:50:51 +0100
Message-ID: <02r6ig176o0lqc52nm8rhta7cn5bfn04in@4ax.com>
References: <20210823082949.237716-1-benjamin.gaignard@collabora.com>
In-Reply-To: <20210823082949.237716-1-benjamin.gaignard@collabora.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

>The lists embedded Picture Order Count values which are s32 so their =
type
>most be s32 and not u8.

I'm not convinced that you can't calculate all of those lists from the
info already contained in the DPB array so this is probably redundant
info though I grant that having the list pre-calced might make your life
easier, and the userland side will have calculated the lists to
calculate other required things so it isn't much extra work for it.

Even if you do need the lists wouldn't it be a better idea to have them
as indices into the DPB (you can't have a frame in any of those lists
that isn't in the DPB) which already contains POCs then it will still
fit into u8 and be smaller?

=46ull disclosure: Pi decode doesn't use this info at all so I'm only
arguing from a theoretical point of view - I think it is only relevant
if your h/w is parsing the reference list setups.

Regards

John Cox

>Reported-by: John Cox <jc@kynesim.co.uk>
>Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>---
> Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 6 +++---
> include/media/hevc-ctrls.h                                | 6 +++---
> 2 files changed, 6 insertions(+), 6 deletions(-)
>
>diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst =
b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>index 976d34445a24..db9859ddc8b2 100644
>--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>@@ -3323,15 +3323,15 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
>     * - __u8
>       - ``num_poc_lt_curr``
>       - The number of reference pictures in the long-term set.
>-    * - __u8
>+    * - __s32
>       - ``poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>       - PocStCurrBefore as described in section 8.3.2 "Decoding process=
 for reference
>         picture set.
>-    * - __u8
>+    * - __s32
>       - ``poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>       - PocStCurrAfter as described in section 8.3.2 "Decoding process =
for reference
>         picture set.
>-    * - __u8
>+    * - __s32
>       - ``poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX]``
>       - PocLtCurr as described in section 8.3.2 "Decoding process for =
reference
>         picture set.
>diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>index 781371bff2ad..04cd62e77f25 100644
>--- a/include/media/hevc-ctrls.h
>+++ b/include/media/hevc-ctrls.h
>@@ -219,9 +219,9 @@ struct v4l2_ctrl_hevc_decode_params {
> 	__u8	num_poc_st_curr_before;
> 	__u8	num_poc_st_curr_after;
> 	__u8	num_poc_lt_curr;
>-	__u8	poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>-	__u8	poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>-	__u8	poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>+	__s32	poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>+	__s32	poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
>+	__s32	poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
> 	__u64	flags;
> };
>=20
