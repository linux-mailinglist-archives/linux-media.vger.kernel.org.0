Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5555321C97
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:17:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbhBVQRZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:17:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhBVQRX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:17:23 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4361EC06178A
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:16:41 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id n8so19641360wrm.10
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:references:in-reply-to
         :user-agent:mime-version:content-transfer-encoding;
        bh=JfoS7b6/sOvQdhiQ4TqWKAxzwfRkbo3cRQSKpQASk6g=;
        b=Y/DvtKO8oaONQpL5G+ZUBUdkYAK5x3McgfepTCzgv16leBTZ1JwM6jKzn55dD41HBU
         KvQZFaZfKAg+qV7cHqJyNbzhAYEK+m2D6F7zYWWJXs/cYANdASp0KeeTMDLOmyThKENf
         EfAb2EDffplRkf7JPnpGu8sIomDhruCDOYVbfXT8AwPOc85qWdJvBHCTTcGd4ERnEAtP
         9XNNxJYLj6cCzznnpJeHSgbBAKhfpfU/dnuO9WrSgexyHLAGrhOVCKnQ6pbFFFjHwyfK
         u4RGL2SmwGqvR24f2zpuxhg8PsPg0FXBVphxKcfcFNwo7a10YzyDOdXbBWakNT/SD8Cn
         C9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:references
         :in-reply-to:user-agent:mime-version:content-transfer-encoding;
        bh=JfoS7b6/sOvQdhiQ4TqWKAxzwfRkbo3cRQSKpQASk6g=;
        b=oJlBnLZlQb1xxt8HdfMNL5yLHMa6nr+EuhR6pKnBS4xv4NQHZFRQ1CfZLqfbCUg90t
         i5ztHEPMuPqal5ykSPrTHWs6zDruXXRked4m44gsL9NkO6Y4NGUusKd9+GwJVLlsrDaV
         9JYIZXPkD4xaCToqUntJF4bdFu6IxSMFNLVJDnnLWjF88Rrv4z9pkupa33QVQCOb1ls7
         A/4YmPHzV6ICwCMIIVzG9G8Z7pdjEumIjWxFreUQYE6lgzS+n1m/oI4K3bn6AkeYvNRe
         h/1CUSmcGCsFYAWVeqtJCz+i96ZZNvj3N+cZGXW5jgODEs42saX4+LRCSaLwJ45li4j9
         7cog==
X-Gm-Message-State: AOAM532qN+ivphGkWhJ1BCLeVqXAS22Qn+RWPZr4hArj9zTNU+qA3RT7
        f3CDkpIlwlrrAXVU6xDEj5SO2Q==
X-Google-Smtp-Source: ABdhPJze7PUB/iMhOeCzbnwQZ0ILac4Yvbp1oX/ft5wHD4R8VP2Ac1Az+dZZ6bOHD17qoIXDYH6Wpg==
X-Received: by 2002:adf:9565:: with SMTP id 92mr22083905wrs.201.1614010599943;
        Mon, 22 Feb 2021 08:16:39 -0800 (PST)
Received: from CTHALPA.outer.uphall.net (cpc1-cmbg20-2-0-cust759.5-4.cable.virginm.net. [86.21.218.248])
        by smtp.gmail.com with ESMTPSA id y16sm28604145wrw.46.2021.02.22.08.16.38
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 22 Feb 2021 08:16:39 -0800 (PST)
From:   John Cox <jc@kynesim.co.uk>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, peng.fan@nxp.com,
        hverkuil-cisco@xs4all.nl, dan.carpenter@oracle.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v2 4/9] media: uapi: Add a control for HANTRO driver
Date:   Mon, 22 Feb 2021 16:16:39 +0000
Message-ID: <9ql73glgbnjaqqsp8ulqenae5n82kfk0o3@4ax.com>
References: <20210218191844.297869-1-benjamin.gaignard@collabora.com> <20210218191844.297869-5-benjamin.gaignard@collabora.com>
In-Reply-To: <20210218191844.297869-5-benjamin.gaignard@collabora.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

>The HEVC HANTRO driver needs to know the number of bits to skip at
>the beginning of the slice header.
>That is a hardware specific requirement so create a dedicated control
>that this purpose.
>
>Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>---
> include/uapi/linux/hantro-v4l2-controls.h | 20 ++++++++++++++++++++
> include/uapi/linux/v4l2-controls.h        |  5 +++++
> 2 files changed, 25 insertions(+)
> create mode 100644 include/uapi/linux/hantro-v4l2-controls.h
>
>diff --git a/include/uapi/linux/hantro-v4l2-controls.h =
b/include/uapi/linux/hantro-v4l2-controls.h
>new file mode 100644
>index 000000000000..30b1999b7af3
>--- /dev/null
>+++ b/include/uapi/linux/hantro-v4l2-controls.h
>@@ -0,0 +1,20 @@
>+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>+
>+#ifndef __UAPI_HANTRO_V4L2_CONYTROLS_H__
>+#define __UAPI_HANTRO_V4L2_CONYTROLS_H__
>+
>+#include <linux/v4l2-controls.h>
>+#include <media/hevc-ctrls.h>
>+
>+#define V4L2_CID_HANTRO_HEVC_EXTRA_DECODE_PARAMS	=
(V4L2_CID_USER_HANTRO_BASE + 0)
>+
>+/**
>+ * struct hantro_hevc_extra_decode_params - extra decode parameters for=
 hantro driver
>+ * @hevc_hdr_skip_lenght:	header first bits offset
>+ */
>+struct hantro_hevc_extra_decode_params {
>+	__u32	hevc_hdr_skip_lenght;
>+	__u8	padding[4];
>+};

Can you clarify how hevc_hdr_skip_length differs from
v4l2_ctrl_hevc_slice_params.data_bit_offset?  At first sight they would
appear to be very similar.

Regards

John Cox

>+#endif
>diff --git a/include/uapi/linux/v4l2-controls.h =
b/include/uapi/linux/v4l2-controls.h
>index 039c0d7add1b..ced7486c7f46 100644
>--- a/include/uapi/linux/v4l2-controls.h
>+++ b/include/uapi/linux/v4l2-controls.h
>@@ -209,6 +209,11 @@ enum v4l2_colorfx {
>  * We reserve 128 controls for this driver.
>  */
> #define V4L2_CID_USER_CCS_BASE			(V4L2_CID_USER_BASE + 0x10f0)
>+/*
>+ * The base for HANTRO driver controls.
>+ * We reserve 32 controls for this driver.
>+ */
>+#define V4L2_CID_USER_HANTRO_BASE		(V4L2_CID_USER_BASE + 0x1170)
>=20
> /* MPEG-class control IDs */
> /* The MPEG controls are applicable to all codec controls
