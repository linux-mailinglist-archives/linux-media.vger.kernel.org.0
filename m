Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD812EA097
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 00:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727394AbhADXQu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 18:16:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727379AbhADXQu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 18:16:50 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB812C061795
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 15:16:09 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id y19so68205177lfa.13
        for <linux-media@vger.kernel.org>; Mon, 04 Jan 2021 15:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=70qboDYiqMfhk39mVT02XFhsqh0dkF0ZUdwKovtXAuw=;
        b=UxIQlBL1c1QKWojy4wGDvvWbDohos1p7AC4PYyH0WAQgR8JWeW8mCbEhfiI9Tw41Dq
         4tGhrgyjVgHEBEmXMiYhnIxPk+0CRntFvXC0avfdVVH5B07F+N/00PExNZAkh4DM5ayu
         v9mxrXY3bS702898xWFhoR5S4jYpEl454Ye4r+O1F79WxEhkS5O3fIGGnaoNjbK7j3EB
         l3LFO1vd1S924DFmMZ0wZ4Qo8q1tfsrs4aA+Ll8S7ziUMgXeUgj+/1esWoP484S4t/g1
         N/XMWpifz1Ok8QAI+kIihC0h2ply+7yNOBsFQUY4Mv7cdmQrZNPsy4Gs0QXNsmoyieoy
         SpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=70qboDYiqMfhk39mVT02XFhsqh0dkF0ZUdwKovtXAuw=;
        b=ZTjO2gCNd29ght1ddBBEiYjVDGyQ0ozhLwDfJMdXRQSmVS8d2TU1WZQKy7X941G0L3
         Q45iXII5ltiGkTc43+91zudlLSL/xg5p1Shor19Hq8uoh0fADlMTLJ6otwe4Wxm9MrSe
         /QQfnRIayq2OCRmGwfFA8GrD9s82rY83V3R7A6Go1gLGIe4dTJi5iFW5Nc153aU6Lykd
         +5hOL28DZXqW3N+2d77BJutWBF9xw0Hy3W5FwcKWQX02SO5J6A3ueCzE64RR+JlCZYOZ
         gc2l7rrtRe7upDRETSmu5fibcwWRyJsv5qpiWFhfGIxtLZC3urX5j/dbfUoxrRCPOnfp
         94gA==
X-Gm-Message-State: AOAM532Ac7QxFb3f8YR3E3r3ZnFNL0S1TqaOy8+JG/jc8ZC66IHRNHdG
        Ezsr73Lb0gp0HgXpBKDpz7CNtGQE+NtyDXD/c80=
X-Google-Smtp-Source: ABdhPJzvEtszRG/3HsrgcDH8n7v2YFMw13OQU6Az2wEdCDf152/kekwQGRyg+aGdnXmOpF+btc2W8eVFNhq4p0ljpAQ=
X-Received: by 2002:a2e:b556:: with SMTP id a22mr35014636ljn.264.1609802168358;
 Mon, 04 Jan 2021 15:16:08 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
 <3c42e0cc-0e47-9e8e-993f-f67e9d2924ca@armadeus.com>
In-Reply-To: <3c42e0cc-0e47-9e8e-993f-f67e9d2924ca@armadeus.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 4 Jan 2021 20:15:56 -0300
Message-ID: <CAOMZO5AU2x_a0=UgJM598mAojY-QmgHW61KAo-ePBn08zNFGOA@mail.gmail.com>
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

On Mon, Jan 4, 2021 at 2:19 PM S=C3=A9bastien Szymanski
<sebastien.szymanski@armadeus.com> wrote:

> Don't you need
>
> bus-type =3D <5>; // V4L2_FWNODE_BUS_TYPE_PARALLEL
>
> in the parallel_from_ov5640 endpoint node ?

Thanks for your suggestion, but I still get the warning and csi does not pr=
obe.

The modified dts is:
https://pastebin.com/raw/xENc5M5q

Could you please share your imx6ul board dts file that you used to
test camera capture?

Were you able to capture via Gstreamer? If so, please also share the
media-ctl and gst pipelines that you used.

Thanks,

Fabio Estevam
