Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B80722D1841
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 19:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbgLGSNr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 13:13:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgLGSNr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 13:13:47 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D5FC061749
        for <linux-media@vger.kernel.org>; Mon,  7 Dec 2020 10:13:06 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id lb18so58438pjb.5
        for <linux-media@vger.kernel.org>; Mon, 07 Dec 2020 10:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=GM5JYOH/FKUqpm98Q4LGzAP9NniGeon6h7FY522+ZHE=;
        b=lmBK9f4Db/klpOOK6amKYfXRwn0Bhpc2Qm6wRLS1PvYzYV82J6FTgGehulFBGauUkt
         r6YKp5PGmjxfI7quSk43Vai27uXbE/l+RVQ3Ai6DRRPq1Uo1QEk2XC17EtUzfkRuO1Ez
         cj7s35KNXA+MGglkf47ugdLxZrfI17LUkXtic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=GM5JYOH/FKUqpm98Q4LGzAP9NniGeon6h7FY522+ZHE=;
        b=HW3DDZr7eA5EwdH2A+PBn9tNKAIeoXB7/kZDIULnm0v4Ob5Z65wl/QM/pXGWFoNPxi
         exLjf3hFxCSUtib9YRgFzTBkBb7CRGKUOoULGGcGwPtrijPocB/aYJU5xYKfiIlqnk7e
         t6UX8f0dKDynGUz6VhZ3KHkP7nJrSJpUj8iNCxKBtY+R2sdWf70HYKiLgbaPyJZgpOcj
         DWrYEG2B55+woTEzDl+KkpYl/dx3P1J3Iz3iMoxyEHkK8zHBU6p+5K9jFSRdXOTdJOMn
         flBVMyMyznXM6sZDIQ/8jp6ZdOggQJUzLQkygJ2TkJtgy+R4RHpZeiqEsgnuqj8Oper7
         yOpQ==
X-Gm-Message-State: AOAM533jxTK8xcC2g+6UwRJNctqbgC4NbE0cjAsPBr91YO3Ol6/Q2mZS
        Lu5c7QSbp2x1JYv0dxt+PSOgTQ==
X-Google-Smtp-Source: ABdhPJzd5Je4bxNJ+cnyglthmWtlK4int+10tmndI3nRk6ab536UNAuZdrKN4mFmGgawc8EuG59U2w==
X-Received: by 2002:a17:90a:a393:: with SMTP id x19mr80366pjp.68.1607364786560;
        Mon, 07 Dec 2020 10:13:06 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id c133sm3671543pfb.8.2020.12.07.10.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 10:13:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1607321610-25052-1-git-send-email-dikshita@codeaurora.org>
References: <1607321610-25052-1-git-send-email-dikshita@codeaurora.org>
Subject: Re: [PATCH v3] venus: core: add support to dump FW region
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
To:     dikshita@codeaurora.org, linux-media@vger.kernel.org,
        stanimir.varbanov@linaro.org
Date:   Mon, 07 Dec 2020 10:13:03 -0800
Message-ID: <160736478377.1580929.9110917864533891175@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting dikshita@codeaurora.org (2020-12-06 22:13:30)
> From: Dikshita Agarwal <dikshita@codeaurora.org>
>=20
> Add support to dump video FW region during FW crash
> using devcoredump helpers.
>=20
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---

One nit below.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Usually this contains a "Changes from v1" section. What changed?

>  drivers/media/platform/qcom/venus/core.c     | 31 ++++++++++++++++++++++=
++++++
>  drivers/media/platform/qcom/venus/core.h     |  2 ++
>  drivers/media/platform/qcom/venus/firmware.c |  3 +++
>  3 files changed, 36 insertions(+)
>=20
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/pla=
tform/qcom/venus/core.c
> index 5102403..f23923d 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -22,6 +24,33 @@
>  #include "firmware.h"
>  #include "pm_helpers.h"
> =20
> +static void venus_coredump(struct venus_core *core)
> +{
> +       struct device *dev;
> +       phys_addr_t mem_phys;
> +       size_t mem_size;
> +       void *mem_va;
> +       void *data;
> +
> +       dev =3D core->dev;
> +       mem_phys =3D core->fw.mem_phys;
> +       mem_size =3D core->fw.mem_size;
> +
> +       mem_va =3D memremap(mem_phys, mem_size, MEMREMAP_WC);
> +       if (!mem_va)
> +               return;
> +
> +       data =3D vmalloc(mem_size);
> +       if (!data) {
> +               memunmap(mem_va);
> +               return;
> +       }
> +
> +       memcpy(data, mem_va, mem_size);
> +       dev_coredumpv(dev, data, mem_size, GFP_KERNEL);
> +       memunmap(mem_va);

Technically we could unmap right after memcpy() so that the mapping only
exists for the memcpy() and then mem_va isn't "alive" for the
dev_coredumpv() call.

> +}
> +
>  static void venus_event_notify(struct venus_core *core, u32 event)
