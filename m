Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5538C17FF9F
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgCJN5e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:57:34 -0400
Received: from mail-lf1-f53.google.com ([209.85.167.53]:45589 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgCJN5e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:57:34 -0400
Received: by mail-lf1-f53.google.com with SMTP id b13so10926726lfb.12;
        Tue, 10 Mar 2020 06:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a1V7f1F0LQmjo7Lwkhxv0H2OITNt4DTANxKKHcaVDpM=;
        b=oxgQQElsrxUHhCc9YjPXkd1tmnpRDKrP2gylnsR6DYAg5/FRO3tM2yHIDEpDIRRHKv
         v0mTqFr60upqjPDGSSgbTNZVGy0Gtrw8tXRTiZGWUVmbozdhWNpOY8YHW41xpBJ5pKog
         iuw9inydwR+1ITq+9XwPniSknR7N6dgNcY00owCmIPBUEMaBZ34u13knQFEBk1pYHORI
         cuaBSUXFPqhyYWzjjFA7/DMcAucFdHw06PYnD+Qdc8fzDQxUQcqx0AAquECXRp8b2pJM
         9hFcj8+CdlmAcmbzAsksu3YLBO0ycaSiFHW/9jahGY5H6SUqkt40jAn+DQhELgWlqRq5
         zqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a1V7f1F0LQmjo7Lwkhxv0H2OITNt4DTANxKKHcaVDpM=;
        b=ce02AJPdZXga8U4aw0X5YN1rMSLCN747mmGrfDjgM3Rv1JFHQl2Jb/yAVPhqiq0c1b
         k6TBSEYRpVEpoxrc1hhF6ahIk+SIJ+1fqw+vl1T1N0fYEBOF2eQdN3ME/+yhnRmY+UFJ
         Mq0bBxj+qgXAOBJXlLVD17dg0hw2cgjuUt338/VVIvmFZY8hWjk9rH856DjiFhSyM2QW
         bGxNlDshkuNSrL3KfNNPuspKBal0i2IE/mDxuzwPijf4lXAKR9M1gCv74eAL22GPk1ZH
         KjnoO1j7f+/BR2XfMAj3NHQ0GbJ5CEXHDBPO9TJ0z6h0oPINqkK2dnh41NIPVEpoo4to
         Pi2g==
X-Gm-Message-State: ANhLgQ3d/yHLsB5/TFifhNW6FMCR0VHkFLMeXmSX7yWgjgNOkS/JtsTR
        K90nIv2kW9SahMhbyoljjkHzMflzBagELPV1ooM=
X-Google-Smtp-Source: ADFU+vsInh8fH3rOKgWvw4Sp1i/c3pYIMP6oFihYh35j+7wlxleB92/F9wsbHoy+4eLgsGT19IloKcl8gLA6bIcetZk=
X-Received: by 2002:a05:6512:1054:: with SMTP id c20mr12605269lfb.69.1583848651279;
 Tue, 10 Mar 2020 06:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200310134603.30260-1-robert.foss@linaro.org> <20200310134603.30260-2-robert.foss@linaro.org>
In-Reply-To: <20200310134603.30260-2-robert.foss@linaro.org>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 10 Mar 2020 10:57:22 -0300
Message-ID: <CAOMZO5C9Oj+SmTroE+bSsGcOPpz6se+WOqw1qJU9x6TrzbzZKw@mail.gmail.com>
Subject: Re: [v1 1/3] media: dt-bindings: ov8856: Document YAML bindings
To:     Robert Foss <robert.foss@linaro.org>
Cc:     ben.kao@intel.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan.Cameron@huawei.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On Tue, Mar 10, 2020 at 10:46 AM Robert Foss <robert.foss@linaro.org> wrote:

> +    ov8856: camera-sensor@10 {
> +        compatible = "ovti,ov8856";
> +        reg = <0x10>;
> +        reset-gpios = <&pio 111 GPIO_ACTIVE_HIGH>;

Could you double check this is correct? Other OmniVision sensors have
reset-gpios as active low.

I suspect that the driver has also an inverted logic, so that's why it works.

I don't have access to the datasheet though, so I am just guessing.
