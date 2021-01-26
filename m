Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE8FF30430B
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 16:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391263AbhAZPwZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 10:52:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732498AbhAZPwP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 10:52:15 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94436C0698C1
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 07:51:35 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id r4so9973998pls.11
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 07:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PzZyFBzr4f1W011B4gds9g7r9/jftdBns1YRMkXB7G4=;
        b=HOFUATxySjWJF9wDr1dtWEkN+/idvEzn47Zjt9MKZL3qGL1P87LT1q+9u5NM9j7v8k
         obQGW/r4Ddie+9jlcmPuPh9sr+WLnmaHVVwTQCN+5uujt0uwUqUAnkAbW6NLqyp4E8kZ
         N9iYoV0lni2uaomeyhRyfzBxhn/embFLAkuTYk3ScoPKQHYre/uVftOlCqlDZCiwPrAx
         plP9flXyFRkfl07jr/ergkUlOc/odRWH6f3xD2rJuelLWuQaUYnJeyTGEuT8cXc3m7Y+
         mEJuvJzOSPlzZxc2yNKjgCO6FwWi1t3I1BmgOS+mP+WmpcPjZcmEiJAjIfvrixhXKYCh
         YWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PzZyFBzr4f1W011B4gds9g7r9/jftdBns1YRMkXB7G4=;
        b=l0B+NuFj2crklXUSSyKdZx3wS2Z7VCvCFQ/00Ipl+D8lGoUpoJrHp3+p3AgIBtflZb
         zB/dxJffMtqzw9CDAAVp7dezjH9iooHN0GBzuJEN9v9gVgaA2NDuRB6QlXsbDfc4Cylu
         esW1XSU6ho82kBaH9Wx/y2TFdT6CtTyt6DnNzJq3lSr9WCBOhJE7aIV8yz20Cz4FHmr1
         EDYWJhs4WIxvja53Qq86jbJGgCTf06peSk0dk7Lj51mASDgqSSv/gbmApNbSMc1SY1uu
         4bf30LMWMTrSxRFDUhbjY4rn6xmlRHBKrZ0AXBbVQxj08bz7QScg5jQQQZC+bgCaqOKf
         xCQA==
X-Gm-Message-State: AOAM533vmmR09n1HjwOSiFt8hHwRxFeQdpE0XhtGdUbexxTcFBrxmSBk
        Fd9ry46Rc7rd/fneRNsf2e5zGLnw0mTp87MPc+d9iA==
X-Google-Smtp-Source: ABdhPJxT6M1sJ1hYz7Ajt4zTCMc/Fq44WCfGtLRnoQTq/rcNFbTPShvjS86lvm79AzCU2Th24aK0wvSkVq+CXn3YDyY=
X-Received: by 2002:a17:90a:9414:: with SMTP id r20mr413274pjo.222.1611676295029;
 Tue, 26 Jan 2021 07:51:35 -0800 (PST)
MIME-Version: 1.0
References: <20210120134357.1522254-1-robert.foss@linaro.org>
 <20210120134357.1522254-15-robert.foss@linaro.org> <20210122163427.GA922435@robh.at.kernel.org>
In-Reply-To: <20210122163427.GA922435@robh.at.kernel.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 26 Jan 2021 16:51:24 +0100
Message-ID: <CAG3jFysf5D1T7zkEJCR2KXEm+r6AHRiNp-HMk=+CtFyExDyaVQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/22] dt-bindings: media: camss: Add qcom,sdm660-camss binding
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        Vinod Koul <vkoul@kernel.org>, Anson.Huang@nxp.com,
        michael@walle.cc, agx@sigxcpu.org, max.oss.09@gmail.com,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Rob!

On Fri, 22 Jan 2021 at 17:34, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jan 20, 2021 at 02:43:50PM +0100, Robert Foss wrote:
> > Add bindings for qcom,sdm660-camss in order to support the camera
> > subsystem on SDM630/660 and SDA variants.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >
> > Changes since v1:
> >  - Laurent: Reworked driver to use dtschema
>
> Same comments on this one.

I applied the same feedback to msm8916, msm8996, sdm660 & sdm845
bindings in this series.
Thanks!
