Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52E32690FA4
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 18:56:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbjBIR4Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 12:56:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjBIR4Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 12:56:24 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12E366FB3
        for <linux-media@vger.kernel.org>; Thu,  9 Feb 2023 09:56:20 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id h24so2849011qta.12
        for <linux-media@vger.kernel.org>; Thu, 09 Feb 2023 09:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DF3SHPT7+Nd+faRZqSk/ih12R/u2oE/ePY9rLQ5SmfI=;
        b=fhESxpVm8DZViT9pQmG6zPHNEp9MVFS0XQWT+Zk0Xq8V9bVvvJcQ739LB/MKGAuA0d
         cUkThtmHQ38wDwVovvmjb5S6WZderxqTeTi8nv49d6ViFzA9Aq3RXRxbrDByGsdPUkA7
         wYhmzWVpde08LHnnvJdr5uLS/6BOGeajP0CWUBDrhGnsvagJCL9DqCA3DVECsjIqmmKN
         HFG9IWfB1EYTuFJq2Y9I7EYs4gAMCCUrByVD9f3fEyVPydjuJqduTLLtq/fnmqSx+3HM
         xq2KUo+qq66A1ndigB/RdSf7vxvyHiLTJN3QZls3NLIRv+w5QbgrV2iiyYxKBZL3lJBC
         0pvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DF3SHPT7+Nd+faRZqSk/ih12R/u2oE/ePY9rLQ5SmfI=;
        b=Qt7upapM6vI1EteXBhoSBPltlVi2Z8aIw1xh43CG25oXwmSiImHmUJORy1pdWAb2bI
         Wiu4u3n0l3MrChquVFze3PfosdCFOBoW6mJzyVWnNujKjajCV+ujrvyzR4YQEBexK1yi
         z9jES2LWQipBKtF6WH13zobgBM82frw6yqYNkQdHCjTNRZdxKSGyE3qFnit63JdyxLOu
         oYx7Fa6FEw+Dgbc8PDUGcvqDlkzMZ5HTXIkzB8N7t1BzqnoLmvVDAiArtKFrtjWRhMjh
         WMjqYFbDk9reJ/puZ/X9gJAnu2peGSqMah7VRVyQp5mwZ9XTmFIZ2Vl0h4ykV77UPTgf
         IE9w==
X-Gm-Message-State: AO0yUKVlF3WsRUOUwUdg7TajiYDOZs/ENkbuVN07cEM+FheDJ19J3B/l
        k20L+vaGHww6N5jMMP2nI6IBYA==
X-Google-Smtp-Source: AK7set/bwbtjEyvOsRVvpcnUKszlNCjSe7fKWrhm26gy5bAW3GObZiJIL2NZDVTG7vVhs5VAopBmRA==
X-Received: by 2002:ac8:7455:0:b0:3b9:bc8c:c209 with SMTP id h21-20020ac87455000000b003b9bc8cc209mr3920992qtr.20.1675965380027;
        Thu, 09 Feb 2023 09:56:20 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id s75-20020a37454e000000b006fa22f0494bsm1798346qka.117.2023.02.09.09.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 09:56:19 -0800 (PST)
Message-ID: <44531f980f771272a8a663c2b2d68dce3bf47456.camel@ndufresne.ca>
Subject: Re: [PATCH 0/2] media: v4l: Add Broadcom sand format to the list of
 V4L formats
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl
Date:   Thu, 09 Feb 2023 12:56:18 -0500
In-Reply-To: <20230127153415.83126-1-jc@kynesim.co.uk>
References: <20230127153415.83126-1-jc@kynesim.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 27 janvier 2023 =C3=A0 15:34 +0000, John Cox a =C3=A9crit=C2=A0=
:
> This is in preparation for attempting to upstream the Rpi H265 decoder
> as these formats are the only ones the hardware can decode to. They are
> a column format rather than a tile format but I've added them to the
> list of tiled formats as that seems the closest match.
>=20
> V4L2_PIX_FMT_NV12_C128 matches DRM format NV12 with modifier
> DRM_FORMAT_MOD_BROADCOM_SAND128_COL_HEIGHT(ch) and
> V4L2_PIX_FMT_P030_C128 matches DRM format P030 with the same modifier.

Cause pixel format matching is hard, P030 matches GStreamer NV12_10LE32, fo=
rmat
also found on Xilinx ZynMP CODECs (but without any modifiers so far).

This is just for curiosity, was there any software implementation of these
formats made available publicly ? or have they only been tested in conjunct=
ion
with an importing HW ?

>=20
> John Cox (2):
>   media: v4l: Add Broadcom sand formats to videodev2.h
>   media: v4l: Add documentation for Broadcom sand formats
>=20
>  .../media/v4l/pixfmt-yuv-planar.rst           | 192 ++++++++++++++++++
>  include/uapi/linux/videodev2.h                |   2 +
>  2 files changed, 194 insertions(+)
>=20

