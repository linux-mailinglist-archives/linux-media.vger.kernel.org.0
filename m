Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412E141A0DB
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 22:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236871AbhI0U6w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 16:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236800AbhI0U6v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 16:58:51 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B20EC061765
        for <linux-media@vger.kernel.org>; Mon, 27 Sep 2021 13:57:13 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 67-20020a9d0449000000b00546e5a8062aso26184285otc.9
        for <linux-media@vger.kernel.org>; Mon, 27 Sep 2021 13:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=PlyMlGa7MDqDwyrJ+9Nu78wzBfZgUOD4Mgr0q1/+DtM=;
        b=moPLRYA1b47/e+Ag8chwN5277xtgkL54F4pJjVzJQ8CJvxpDYXlG4JU36cXnciVIJg
         w7LAFtvv3vssN/tsad0nhW1QFW7gKGfSSGJBWoz1eg/Q/IAqVM3+TcIxKWn/73XjSnb7
         mNSOT3Gij3AvCdxttNYIyO7r+uBx7T/hwSQYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=PlyMlGa7MDqDwyrJ+9Nu78wzBfZgUOD4Mgr0q1/+DtM=;
        b=cDv3xMfuFQXV0cgR7fyHR3aY3uwloAs/FnWT/i57boJNWG1ecATdhX7jloTb/0ovUp
         N9ZhICH/R+ieHo+N4z5zsgLlWuNASN5aQO6eiznarirdMVgihd/jhdU6uE+8cWkmvQpj
         +4nFsE2uDZpHJhXBdT2CmYh2fBNhZ50lhx9uj1Mhl8dZm/w5+s8D4fwzM9lN8eLQ1fSL
         8jBxCWQiB/4VT3hFZSHoKhGsmywz+XFL6pZzW5Btnq1Xv/89MLynuq2uD85jzVuqvKRr
         wuFr9lzf1Tcn8ctnjf9aS9+sInKiRyQEs/Z8l+M8iCMxdSRd1bdqG0RDMk/BFTwkvIBm
         MJ1w==
X-Gm-Message-State: AOAM532GU1IXpDPzvX74xl1Q6G2diXYtfVvC9IrHHjH/SX/9nhc0scJ4
        ALA7GLBsmoH4HthENMcPoLKE1ph/ULQqZX8qmFaPBA==
X-Google-Smtp-Source: ABdhPJzetWLzdTY1Zy3XhA67zGHzvF4rx1QkEDk19MmphpfXgqeCf77aOCeShKwuSbYtfHyG4OSseqvUAa7Ch8aqhU8=
X-Received: by 2002:a05:6830:358:: with SMTP id h24mr1721655ote.159.1632776232722;
 Mon, 27 Sep 2021 13:57:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Sep 2021 13:57:12 -0700
MIME-Version: 1.0
In-Reply-To: <1632743197-32291-1-git-send-email-dikshita@codeaurora.org>
References: <1632743197-32291-1-git-send-email-dikshita@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 27 Sep 2021 13:57:12 -0700
Message-ID: <CAE-0n508_+MkVz6t0sWF_q7ofXXWHADQSWZCGxk3rtS=td9=fA@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: media: venus: Add sc7280 dt schema
To:     Dikshita Agarwal <dikshita@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        vgarodia@codeaurora.org, stanimir.varbanov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Dikshita Agarwal (2021-09-27 04:46:37)
> Add a schema description for the venus video encoder/decoder on the sc7280.
>
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
