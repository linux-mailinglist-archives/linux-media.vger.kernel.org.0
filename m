Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7434D2134
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 20:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244882AbiCHTRD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 14:17:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232050AbiCHTRC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 14:17:02 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 798F54EF43
        for <linux-media@vger.kernel.org>; Tue,  8 Mar 2022 11:16:01 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id gm1so210605qvb.7
        for <linux-media@vger.kernel.org>; Tue, 08 Mar 2022 11:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qzv/br/KGsj2A1mH2FQOzBe9h1eGSCjt5hNFQEHBhMI=;
        b=0flrJiupZia0pz2GPWhnWEtFrotCwJ0ExzowhJshSFUlYnBdDtk1Z5cVHLk/3aWOwG
         vDUV+EEV6R5bT803uLiUgatNa31l5wGSd0vD/0Ak6pfHPeJrCWRw3Ollh3cztAFB234e
         /1pg5mXfURiIAHyecF03MgomqgD7cslT+nqqLRtOgQflUPlzCY2JaW4CeOTtV++MXCsc
         THwlZqSFa4jc7IE3rj0zaYhVQA7enCYWLkLD/bfNIU6q+evk/Mihjx1/HuITYWKA5JPy
         GCFFVNOLJSfYwQXOFMkKMlCNlR6Hdm+OlhevD1NgJr9LuXtzObQPeUWHqV3LNQ9jAfXc
         rZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qzv/br/KGsj2A1mH2FQOzBe9h1eGSCjt5hNFQEHBhMI=;
        b=NSw6OgBk6lq9Ip8R64UZmTHYkhVZC+zVq/MinWthzQDTvk49U40FrVs+Nmthc7z9uv
         nR5KiiwNSofyeP8amFibiNY9bM8Ta0rXUUe+izxSVxLBwyw9ornHpJQEyc5pJj8D1gfq
         kDEnJZk/ncrUIuj8eO3mMqWofSIWR5p3wDMwwXKW+j7BT3awYfdff1mdFBxRKJzrwDLy
         F5l+dvhhgsOA7dXUfRV7PWhfXSofUb2+y9ZkaozvN7dEWpCjayjrdZZGDfY0pjThvPvZ
         BEZPYFhN3UJ/PFYHuZ/RvVsI+WF8BUchR9wlWSZJxiLdEuE/7KmurgbC5vHjSY0tciv8
         5e6w==
X-Gm-Message-State: AOAM531SgG6TS6YHmy+tuNbxKCd9zKt/ZNg2H5IR2NMjy3zO5UBDSZMs
        GkLOCwTcc8WX58XiU0jSyt1Fvw==
X-Google-Smtp-Source: ABdhPJyWAjU0GINN7314HdahgbcSPyisku1OdD0JvCH9A6etDci0bU6B2JrdDf1HIrnDetEjuGObgQ==
X-Received: by 2002:a05:6214:2389:b0:435:ba04:8f18 with SMTP id fw9-20020a056214238900b00435ba048f18mr1467891qvb.4.1646766960630;
        Tue, 08 Mar 2022 11:16:00 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id o21-20020a05620a15d500b006097f0a8e13sm7858880qkm.119.2022.03.08.11.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 11:16:00 -0800 (PST)
Message-ID: <1b2f72c783e7a83956acc788888c539bb83fe995.camel@ndufresne.ca>
Subject: Re: [PATCH v2 6/9] media: uapi: Add a control for DW100 driver
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, stanimir.varbanov@linaro.org,
        laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        robh+dt@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Date:   Tue, 08 Mar 2022 14:15:58 -0500
In-Reply-To: <20220308184829.38242-7-xavier.roumegue@oss.nxp.com>
References: <20220308184829.38242-1-xavier.roumegue@oss.nxp.com>
         <20220308184829.38242-7-xavier.roumegue@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le mardi 08 mars 2022 à 19:48 +0100, Xavier Roumegue a écrit :
> The DW100 driver gets the dewarping mapping as a binary blob from the
> userspace application through a custom control.
> The blob format is hardware specific so create a dedicated control for
> this purpose.
> 
> Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> ---
>  Documentation/userspace-api/media/drivers/dw100.rst |  7 +++++++
>  include/uapi/linux/dw100.h                          | 11 +++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 include/uapi/linux/dw100.h
> 
> diff --git a/Documentation/userspace-api/media/drivers/dw100.rst b/Documentation/userspace-api/media/drivers/dw100.rst
> index 20aeae63a94f..3abad05849ad 100644
> --- a/Documentation/userspace-api/media/drivers/dw100.rst
> +++ b/Documentation/userspace-api/media/drivers/dw100.rst
> @@ -20,4 +20,11 @@ match the expected size inherited from the destination image resolution.
>  More details on the DW100 hardware operations can be found in
>  *chapter 13.15 DeWarp* of IMX8MP_ reference manuel.
>  
> +The Vivante DW100 m2m driver implements the following driver-specific control:
> +
> +``V4L2_CID_DW100_MAPPING (integer)``
> +    Specifies to DW100 driver its dewarping map (aka LUT) blob as described in
> +    *chapter 13.15.2.3 Dewarping Remap* of IMX8MP_ reference manual as an U32
> +    dynamic array.
> +
>  .. _IMX8MP: https://www.nxp.com/webapp/Download?colCode=IMX8MPIEC

This point to a document names "i.MX 8M Plus Applications Processor Datasheet
for Industrial Products" which does not contain that reference.

> diff --git a/include/uapi/linux/dw100.h b/include/uapi/linux/dw100.h
> new file mode 100644
> index 000000000000..0ef926c61cf0
> --- /dev/null
> +++ b/include/uapi/linux/dw100.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +/* Copyright 2022 NXP */
> +
> +#ifndef __UAPI_DW100_H__
> +#define __UAPI_DW100_H__
> +
> +#include <linux/v4l2-controls.h>
> +
> +#define V4L2_CID_DW100_MAPPING		(V4L2_CID_USER_DW100_BASE + 1)
> +
> +#endif

