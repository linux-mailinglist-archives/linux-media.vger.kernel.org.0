Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7D22E0DC5
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 18:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727281AbgLVRQN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 12:16:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbgLVRQM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 12:16:12 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F56CC0613D6
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 09:15:32 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id s26so33628259lfc.8
        for <linux-media@vger.kernel.org>; Tue, 22 Dec 2020 09:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+t30VWISQEaUO03ni9OoufKT5qMufhy8FE/pewRO2X8=;
        b=kTg33JjJh1WDh38CFm4m9gmH/k82b6PZYBJOrOHUVbkmxhYiiXPVK3YtizuBqH7Q+Y
         xgamYWAnWR4e1IvuI3J3qgxbokOwzHGNW6TAInDP6WLSIVM5TiMI6BaCbofaoIqXatfV
         GNie2T3lCQElMJ8qehwzOZu+qThMaAgkLtjDuJCcUIlv6u7Cps86QC90/W7CWSUoH1NN
         2SWhRLU2hQvx1tU/JaE9hggLhMJ+M8uy27IRLQcZEoE+NOY+EYqqP7i6CW5T6nz+xVFz
         0rWEqflA/PwfTLug10iAxJdTWZVePFEesexlcjVRs6/pwaTtLDN362WBqOFCJ60fSm4f
         2gdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+t30VWISQEaUO03ni9OoufKT5qMufhy8FE/pewRO2X8=;
        b=pgBkK5eq7lmrZKYNpcA3b81/QlHb/O5zn1qNzeBT2xKSS56rGKUMB33OlMmPeO38uN
         V8iPLuTogMQ8jKQHR4mzBHdniNw8oBlZWUBxlK+ieq8NmdvtxnQ1qKLKWaFQlZZc0X5x
         pvp7XQPApTqLRQGNAASrvgy9ETTCcQjHO6MevOUzxEkccsNCqlGEOvtlRiJwasrFlpDl
         m5ycXHjyFoAMj7UP3+/VwlffjZqQmyc1F/cqaBPAeWMWlx+Tfk6C6OTPY+86GjN3eMDf
         q7qOdm/FnEi3sc87lZ77ND/RH0Wj9cydJk3LfpOycWbODscrTqgi9PA3U3w5qusubtPh
         zLeA==
X-Gm-Message-State: AOAM5308BPNkOjIp6O588U5Y8OKhCexTqyhNlg3SIK4f9ZdKeTvJKFzA
        h+t7T45ZilPLZxJxrSO7gyfe8rAQY9KQD5yu7zc=
X-Google-Smtp-Source: ABdhPJwSUan49S3+8gyzp+PivoCpPeNcIy2wfYyE29cS8O4lfXdZvNTtxf4OkC33v8Tg+aPcErnFYxL3cGZmMViui3k=
X-Received: by 2002:a05:6512:3288:: with SMTP id p8mr8546559lfe.443.1608657330705;
 Tue, 22 Dec 2020 09:15:30 -0800 (PST)
MIME-Version: 1.0
References: <9e09ca8b-d1bc-eaa9-d296-c4ee98882c06@puri.sm> <X9HpL/qlFxmZi9Vt@pendragon.ideasonboard.com>
 <X9IR7dXOkX2XBCtx@pendragon.ideasonboard.com> <195b62c5-5238-a75e-3206-c54efc309e94@puri.sm>
 <X9JG/d1le9xZlI4i@pendragon.ideasonboard.com> <c13b2f47-7e15-97b6-f523-93afc009ebdf@puri.sm>
 <X+ISOvor/SO55dKw@pendragon.ideasonboard.com>
In-Reply-To: <X+ISOvor/SO55dKw@pendragon.ideasonboard.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 22 Dec 2020 14:15:19 -0300
Message-ID: <CAOMZO5C5agyexPSeOCJmv7BKAYQVr0NTVLr0yEMPZjrjgfyPLg@mail.gmail.com>
Subject: Re: question: CSI on imx8mq with (any) CSI2 camera / experience with mx6s_capture?
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Martin Kepplinger <martin.kepplinger@puri.sm>,
        "rogerio.silva@nxp.com" <rogerio.silva@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        "kernel@puri.sm" <kernel@puri.sm>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Dec 22, 2020 at 12:35 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> I've recently bought an i.MX8MM EVK, with the OV5647 camera module, and
> when I try to capture images, with the NXP kernel, I just don't get any.
> *sigh* I'll have to debug that.

OV5647? The default camera for the imx8mm-evk board is the OV5640.

Regards,

Fabio Estevam
