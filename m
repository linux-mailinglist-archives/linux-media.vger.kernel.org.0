Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (unknown [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 276613E467A
	for <lists+linux-media@lfdr.de>; Mon,  9 Aug 2021 15:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235495AbhHINXa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Aug 2021 09:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235476AbhHINXY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Aug 2021 09:23:24 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C88BC06179B
        for <linux-media@vger.kernel.org>; Mon,  9 Aug 2021 06:23:01 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id s184so27510759ios.2
        for <linux-media@vger.kernel.org>; Mon, 09 Aug 2021 06:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7uWEeeVIwkabvXFbQSbMB0l+WQ18TEOP0F9KL7oLcV4=;
        b=kzxgoAcHSAEpDOKRfFM3la8JfHcOEpbYpsm1OaTiBfcoUsEe91W0OzdRqWMA6TPyp+
         ORTCXfkz7d8lQkrptq1L5Dp6Dfz7vzA88Xc1+Sgo58ur0YD1eujbSHOKx/FjR4TAc63o
         Z5cTxfC+Qd403XEHK6cN5C43e1+tKlrbG90+vRPZv6rn+Y4834OMBVWrEhGlyuSdjCQw
         Dvv8llksSXErtUvlSZ84sxHF92m49t57YueA6BvDEgbltYinHMm0HsIeFBFuR3q62ir3
         xFWJLCIyQqVe7KagBDr6PfomY7cwH3HDcTpbI+oB+djpt8lYswjBzmSX00FCJDj9S/o/
         QX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7uWEeeVIwkabvXFbQSbMB0l+WQ18TEOP0F9KL7oLcV4=;
        b=MgAyrFm+yA2kskgRd8VPyDeoxrNhIAKdBx3ysB/n0uUMOBwsFHEiESSoSXw12fld9X
         i6qu6OUIDdoDFiM9o1LC5BibGGRPgWArYTCPi5COimFuaPQIsMCnJW50Z0WU2Br61tpJ
         XSdgFegPary2E59R2fKY3NKYxQZTOKzC+AjFr/JxQh09ZXJtyDqwqs79J/I8fRihnWAp
         teUHX2zdh41JPfjKuyAciIbDZ6BrLzWBUrDisBqT+9q1BdjdvOIEywGr1OQDIyiLBUp9
         G6Isb96I2DN1BVv1yja5LXFJEwAiumaByWVu7e3VLWPEt9XEk/ObLDv6cMfnL7Y7uPyd
         638A==
X-Gm-Message-State: AOAM533+5FoEiXIzeftZk1cLy6Ps9dvaMx58iLhMsB9nwDquo4wC4FMs
        6GEOR9GGciQ0/jhhAGMmDj3X7g9mnxYJXeHTCs2vWA==
X-Google-Smtp-Source: ABdhPJznaXE5wSq3VvvopznVPm+W64eVM6afsZyEwM9m/WJVw/3fsmA3jvAn2pPJrD6gikPRFd3EXh+MTAFFG8XqKq8=
X-Received: by 2002:a02:cf2e:: with SMTP id s14mr23198526jar.74.1628515380854;
 Mon, 09 Aug 2021 06:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210806041530.4170869-1-tzungbi@google.com> <104309d4-0973-cf1f-d61f-731b0642c1cf@xs4all.nl>
In-Reply-To: <104309d4-0973-cf1f-d61f-731b0642c1cf@xs4all.nl>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Mon, 9 Aug 2021 21:22:49 +0800
Message-ID: <CA+Px+wU16dp+g7-kmkT8VcJJ3x8hZv8DxuZiXgt2zzkUMSm_dw@mail.gmail.com>
Subject: Re: [PATCH v7 00/14] media: mtk-vcodec: support for MT8183 decoder
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Yunfei.Dong@mediatek.com, acourbot@chromium.org,
        tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
        dafna.hirschfeld@collabora.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 9, 2021 at 8:31 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> I made a PR for this series, but I would like a follow-up patch that fixes this
> sparse warning:
>
> SPARSE:mtk-vcodec/mtk_vcodec_dec_stateful.c:615:35: warning: symbol 'mtk_vdec_8173_pdata' was not declared. Should it be static?
> SPARSE:mtk-vcodec/mtk_vcodec_dec_stateless.c:346:35: warning: symbol 'mtk_vdec_8183_pdata' was not declared. Should it be static?
>
> mtk_vcodec_dec.h is probably a good header to put the extern declaration.
The follow up fix:
https://patchwork.linuxtv.org/project/linux-media/list/?series=6066
