Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 468BC2EEA20
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 01:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729110AbhAHAET (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 19:04:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728605AbhAHAET (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 19:04:19 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1647C0612F4
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 16:03:38 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 23so18752846lfg.10
        for <linux-media@vger.kernel.org>; Thu, 07 Jan 2021 16:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7/RmRbyWHwzVZz1tnEk5yUT/5oSZwfzVpl/EcNus+0s=;
        b=HJsMPE5DWy97Wnl5rSGA7L7PD4oOl/s2nldsPgpHoZ8JAJEsEwuV86nYUXOppx9Jvi
         LO2/tBbHiiD/MEeiQUXwWGtk5iiQDRL8Jz7E8N9OSrPB/GqCX40MnG2X3VC5pv7Qu+Ut
         uoHopqAICG65GgrfNMQP3cAJxEmTT9sMndxnXj5GSWGLeR33GWGwOAUvZhTY2zyL7EWK
         WvqKRXGsZipaD3rV1L5Vkb2HUmG5FkSNL853uYHHNQT5pmg87f+ATbCJ+bt/sY42H0fg
         Dwywk78Iwo7/1GN4C6YtxrKVwy9GiH49/G9v3NG3e5hHbGfi9kOA26W3nxZHmSy/E9jg
         01Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7/RmRbyWHwzVZz1tnEk5yUT/5oSZwfzVpl/EcNus+0s=;
        b=p62Z3Pnyg1UsWqL6/DTmQ0CLmFKf4vOoSlWpPf3Fgw93iedXpE18virrNQmyn6pXAn
         lv/2DBeOYUDN8ThXlxFuUVokdnqMskLtyl+shwn/8Kv5IePCjsi0RYwBLRWx4bz/aR1b
         y7q+cY7FO1V+J5irXW9EjXOtjhkOA1NECco8uZaQoZ785HO/IYicINbpuZl9CciG2P6K
         m/eJ5YWFzpmbMjis/hb/cquTezQd/HH0eM4a0qkRzHlB/qkMFXeb5VP5m6jVdHQJkKip
         aUnDt4ltP+S5fd7D58+eOSKkPB0xq31AWGhWt6xBKUXh+H5CXEqiRR27/5q7ypouBZrl
         01NA==
X-Gm-Message-State: AOAM532J6hvs2kVMppqPOp7NKKArL1z0tHOnt/+KsGfD7OC87D+vK3QV
        IhALF/travo+fJVYck8ThppRfmvoRZC9seaCwZpOagNFyZmBlw==
X-Google-Smtp-Source: ABdhPJxZ5ozUH0f/556oJ+GiBNn+svvI+IWHUGimEQgt7y5kq7l224aURUpLFWM8DLX3vs+/bWbC6kk88NoQh6iZXX4=
X-Received: by 2002:a19:4856:: with SMTP id v83mr450994lfa.583.1610064217163;
 Thu, 07 Jan 2021 16:03:37 -0800 (PST)
MIME-Version: 1.0
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <20210105152852.5733-21-laurent.pinchart@ideasonboard.com>
 <e47bf3ba-6d9a-52cf-f232-ce4b02a46e2e@gmail.com> <fbf3aaa4454f2ada8f7b8f5e8b990a4e66577427.camel@pengutronix.de>
In-Reply-To: <fbf3aaa4454f2ada8f7b8f5e8b990a4e66577427.camel@pengutronix.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 7 Jan 2021 21:03:24 -0300
Message-ID: <CAOMZO5B5PcTrs-80BaSfUwmwGXvu8nipLPsXDcTmnX8fRDCB2g@mail.gmail.com>
Subject: Re: [PATCH 20/75] media: imx: capture: Rename ioctl operations with
 legacy prefix
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

On Thu, Jan 7, 2021 at 7:53 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:

> But I don't quite understand why G/S/TRY_FMT should not respect the
> connected subdev source pad's active format. Should MC-centric devices
> allow to set non-working configurations and only error out on stream
> start? Is this documented?
>
> The current "legacy" vb2_ops check the subdev in ENUM_FRAMESIZES and
> ENUM_FRAMEINTERVALS, and in TRY_FMT/S_FMT to determine format and
> possible interlacing options. If the MC-centric ops just drop that,
> there is no way to determine which interlacing combinations are actually
> supported.

You make a good point and it is aligned with what I am seeing here too.

When I tested this series, I noticed a regression on imx6ul-evk
capture and doing a bisect it points to:
media: imx: imx7-media-csi: Disable legacy video node API

Reverting it back to using the legacy API fixed things for me.

When the MC-centric API is used the camera dimensions reported by
Gstreamer are no longer correct.

Regards,

Fabio Estevam
