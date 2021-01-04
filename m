Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA05A2EA12E
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 00:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbhADX5H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 18:57:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbhADX5G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 18:57:06 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9FBC061574
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 15:56:26 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id a12so68595929lfl.6
        for <linux-media@vger.kernel.org>; Mon, 04 Jan 2021 15:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9Vlzu672s8e7ccrTjrUiZb4tLfi4nc325O3mvhF0pXE=;
        b=ZRhm3U8/C/u8Oe0DiOM0YhJRbBVNCvjL1Z4OdK3FtOGXWOk0zHCqbc994wo17GE66v
         D2qBnwiQg2mBT42+5ewOuF2VZlfRLxux1rj5LsHyC7ujIHQvjQPH0CL+zhuFRMcYkwjU
         jVOg8zb/ghaBZU9GLiqs8Yieg00X8+fGqKeGCnWwQ27nwfg9WvoOZO8GA/husf8fmQgM
         3t1EWcEqYcyBzyxaeprPBeCt6lMu3XDknieciKZDi0jR12/4AA1qOcG0cPh1QKxvN6GX
         iygn2q4XlEi6/iA6glxBVLJ5qnqRK/UglC/OUSlWokEp3l7kBlMS1Icl55ypt2MLaCBk
         5DOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9Vlzu672s8e7ccrTjrUiZb4tLfi4nc325O3mvhF0pXE=;
        b=awCPwj55KnY9vbe9NweX5n4fTpNesAvv93EON8RhJLqDIFm80Qqi/Ku271+Iza6pxE
         d2yK8/E0FTl7cI/ZgUB58OxmFpRJO3LCALktsrjhWBCcXg2V2aiSuR4ldlEGf4nWOYJt
         Ktg/wUcMbRtL7Ur3nbLX8gl+9zHKuf6yfnoenBXcnYut/iEYoahKxnFSu3incmrcQ8pn
         3m4dk/Knel1jKH6vjzQZZcawPV1ouEMo3qV07zp0hfNCkoBIDA2uF62NTZrBXLYpGoqn
         K/o5kGpcpoqk0NYJUcy0SWrBG08XYgc1Cs2SSs6LIAROMI1dOz11QV6YFTz/Ub1mxrGL
         ROzA==
X-Gm-Message-State: AOAM531EXrjtFpBVyTcZ3874ZMBpqUQwDlGRMgOWh8sN56OECGyjYoW9
        ITWVCdi9ZxnvYMIpCCK4NKod1JP9eiyxIg6mqdU=
X-Google-Smtp-Source: ABdhPJxAchw4t3zzlSLCrW3Sq6L/95/9IROkbPhj8bNuKAElfnyFVdKUQTDiUNLmhYyhv2/4dFIsWABNSK8VYnXbgBM=
X-Received: by 2002:a19:d93:: with SMTP id 141mr34268081lfn.229.1609804584862;
 Mon, 04 Jan 2021 15:56:24 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
 <3c42e0cc-0e47-9e8e-993f-f67e9d2924ca@armadeus.com> <CAOMZO5AU2x_a0=UgJM598mAojY-QmgHW61KAo-ePBn08zNFGOA@mail.gmail.com>
In-Reply-To: <CAOMZO5AU2x_a0=UgJM598mAojY-QmgHW61KAo-ePBn08zNFGOA@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 4 Jan 2021 20:56:13 -0300
Message-ID: <CAOMZO5A_WgkOotkALDhfCjhRRxBJ6f6RmUS-yF_YcZV593JWGQ@mail.gmail.com>
Subject: Re: imx6ull capture from OV5640
To:     =?UTF-8?Q?S=C3=A9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi S=C3=A9bastien,

On Mon, Jan 4, 2021 at 8:15 PM Fabio Estevam <festevam@gmail.com> wrote:

> Could you please share your imx6ul board dts file that you used to
> test camera capture?

This dts allows csi to probe fine now:
https://pastebin.com/raw/7GK5dAWD

> Were you able to capture via Gstreamer? If so, please also share the
> media-ctl and gst pipelines that you used.

I am trying to capture via Gstreamer now. If you managed to get it
working, please share your media-ctl setup and Gst pipeline.

Thanks for your help!
