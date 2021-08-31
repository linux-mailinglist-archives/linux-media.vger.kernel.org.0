Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C3C3FC660
	for <lists+linux-media@lfdr.de>; Tue, 31 Aug 2021 13:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241373AbhHaLJH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Aug 2021 07:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241296AbhHaLJE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Aug 2021 07:09:04 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CFB2C061575
        for <linux-media@vger.kernel.org>; Tue, 31 Aug 2021 04:08:08 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id i6so27075348wrv.2
        for <linux-media@vger.kernel.org>; Tue, 31 Aug 2021 04:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=nMRTUAlq+ptR/ckeEvsJ2OY0SDOy9cpq2/OlFIgm97M=;
        b=qsp4c+wN0W3QAqKyb6QGXEW9nPLEAOkKU7RtwLh9zvb06ptChOpvOqSO9lwu3CMekq
         oLBc39IdmcReLrYv8oLeznfogTcijoYweoSDWI7AtjHeE4/v1QVgXZM3SwMEJk8/mpQw
         bcBe1cIi+0ja+JpsWOuO8fbVQXb/Z+zjqrRZ1sM8dHxR7+XtWNBMd45/zAzImTov8mX6
         pgmL2p1g9EE2ariy0meoI+5caNaawlG4IY3RDTXjYzL9zQV48ENYGCe7TDIg50JxbIH2
         M8N8EOcSsT4yA2WzsSwmFGYBDfuuX2FcgeTjjvJ9z3Tbh7e5JoacSRoI/h6pym4CZlfq
         jBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=nMRTUAlq+ptR/ckeEvsJ2OY0SDOy9cpq2/OlFIgm97M=;
        b=ZP8Kc0MN67z4so69sAuw2giBhNVP+93UihOqxbzD2MY3Lnb0x0Hz8rddgt4yIcD0F3
         1RnVxGI/KAg5cpfjCNiNUpOKRXcr1bP0nYn/2aFIz0ptDd2PZ3pyhvLd2RC+ZqTurjoF
         hrMcJQDOH3l8jo2aN9ZlUDPIvY9HOfeUTm6WIiAF4MzN4ne7tG+GhR/mJVR4K6jeSSwg
         7EV6WnBs0cddQI2kr8oC4Rm2tiAl6tsGPKRnxgQ1zZI6GR8jnH6MPO2dOgcdkDK1v7+/
         FBOSmlHuHwjcyZdzXvQwN/pBjz2diC3E+3UZGC5qnyxr7fb2uB0RbfdRkQiHrXKTmxbG
         ZG9Q==
X-Gm-Message-State: AOAM530gAaCPTkgVWzJIU7R97DUPhMFGEFNTg/rhGrJnBHWGDJTQTVTn
        sGwjutJFd2MjgJtDWnbVRnkYeA==
X-Google-Smtp-Source: ABdhPJzXIL3GbSqZDI1inNtMGsjeB9vVKemBahtgKBwRGcrh9KL0DkvZHGv4C8PCZdFxPLuHoEjlgg==
X-Received: by 2002:a5d:6785:: with SMTP id v5mr30524945wru.261.1630408087281;
        Tue, 31 Aug 2021 04:08:07 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id s12sm18338402wru.41.2021.08.31.04.08.06
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 31 Aug 2021 04:08:06 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     mchehab@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH 1/2] media: hevc: Remove RPS named flags
Date:   Tue, 31 Aug 2021 12:08:06 +0100
Message-ID: <4g2sigpsttf80t72c7spdqqjvvijnths2d@4ax.com>
References: <20210831094900.203283-1-benjamin.gaignard@collabora.com> <20210831094900.203283-2-benjamin.gaignard@collabora.com>
In-Reply-To: <20210831094900.203283-2-benjamin.gaignard@collabora.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

>Marking a picture as long-term reference is valid for DPB but not for =
RPS.
>Change flag name to match with it description in HEVC spec chapiter
>"8.3.2 Decoding process for reference picture set".
>Remove the other unused RPS flags.
>
>Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>---
> Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 6 ++----
> drivers/staging/media/hantro/hantro_g2_hevc_dec.c         | 2 +-
> drivers/staging/media/sunxi/cedrus/cedrus_h265.c          | 2 +-
> include/media/hevc-ctrls.h                                | 4 +---
> 4 files changed, 5 insertions(+), 9 deletions(-)
>
>diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst =
b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>index 3865acb9e0fd..eff33c511090 100644
>--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
>@@ -3138,10 +3138,8 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
> 	:c:type:`timeval` in struct :c:type:`v4l2_buffer` to a __u64.
>     * - __u8
>       - ``rps``
>-      - The reference set for the reference frame
>-        (V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_BEFORE,
>-        V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_AFTER or
>-        V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
>+      - Long term flag for the reference frame
>+        (V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
>     * - __u8
>       - ``field_pic``
>       - Whether the reference is a field picture or a frame.

If you are going to remove all the RPS values except for Long Term
wouldn't it be better to rename the field too, either to "flags" or a
bool "is_long_term"?  If we have a field called RPS it really should be
able to have a value for any of the 5 valid Reference Picture Sets that
a DPB entry can belong to.

As a side note, it is important to my code that the DPB array contains
all the DPB entries not just the ones that are in use in this frame.  I
need them so I can track which frames have left the DPB so I can
reuse/free the MV tables associated with them (yes I could keep one for
every entry in the capture Q but that is generally wasteful on memory
and the Pi is often memory constrained). So maybe update the docn on DPB
to make this explicit please? (I suspect that current code does this
anyway as it is generally easier to do than to not.)

John Cox

>diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c =
b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>index 9ea864ca5625..be46b3c28b17 100644
>--- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>+++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
>@@ -503,7 +503,7 @@ static int set_ref(struct hantro_ctx *ctx)
> 		compress_luma_addr =3D luma_addr + compress_luma_offset;
> 		compress_chroma_addr =3D luma_addr + compress_chroma_offset;
>=20
>-		if (dpb[i].rps =3D=3D V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
>+		if (dpb[i].rps =3D=3D V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
> 			dpb_longterm_e |=3D BIT(V4L2_HEVC_DPB_ENTRIES_NUM_MAX - 1 - i);
>=20
> 		/*
>diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c =
b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>index ef0311a16d01..6086cc35e8cc 100644
>--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
>@@ -169,7 +169,7 @@ static void cedrus_h265_ref_pic_list_write(struct =
cedrus_dev *dev,
> 		unsigned int index =3D list[i];
> 		u8 value =3D list[i];
>=20
>-		if (dpb[index].rps =3D=3D V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
>+		if (dpb[index].rps =3D=3D V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
> 			value |=3D VE_DEC_H265_SRAM_REF_PIC_LIST_LT_REF;
>=20
> 		/* Each SRAM word gathers up to 4 references. */
>diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
>index ef63bc205756..f587448ef495 100644
>--- a/include/media/hevc-ctrls.h
>+++ b/include/media/hevc-ctrls.h
>@@ -127,9 +127,7 @@ struct v4l2_ctrl_hevc_pps {
> 	__u64	flags;
> };
>=20
>-#define V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_BEFORE	0x01
>-#define V4L2_HEVC_DPB_ENTRY_RPS_ST_CURR_AFTER	0x02
>-#define V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR		0x03
>+#define V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE	0x01
>=20
> #define V4L2_HEVC_DPB_ENTRIES_NUM_MAX		16
>=20
