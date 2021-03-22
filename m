Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6E46344CF5
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 18:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbhCVRNn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 13:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231613AbhCVRNT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 13:13:19 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9450EC061574
        for <linux-media@vger.kernel.org>; Mon, 22 Mar 2021 10:13:18 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id m12so22441984lfq.10
        for <linux-media@vger.kernel.org>; Mon, 22 Mar 2021 10:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GFaVu1MnyugpEfxIG9P6PUooRk+y/eFHeoPW/aDMj9g=;
        b=BjlutDrjEZn98M3ryC59O7eePwOtOF91Z0MbR21GH5xLbzuWbXZsuasSmSZagYAMGJ
         vHKLCAXzDbjrEWjtqkzH69xTMaTtR/AE6+dSpFLukX/7ZxYLkYcJxoWZNNJCCMWfoJLI
         N0UbSJGzp9dlNDkwvIXw06CAZwBpM3Lwwj1hCvS+O/aU/TC/rgFN1EOO7+26kK2Y5rEg
         B5xlKahOUvYiIVlItayToU5UuiCxUsgSbAlZ6vDCibp88Gm1e1TQpl+WRC19JdCUoSxS
         1Lb5ivY1qfcmbZ6oXNKY2372pZNYrTfEcwE6vm15d9+oOnvvK8U/j0Bsk4D03MyhNdyq
         qW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GFaVu1MnyugpEfxIG9P6PUooRk+y/eFHeoPW/aDMj9g=;
        b=m2pW4p1wwxCcSvlTXruI00xiuyRgh69lgG6P0a+qwPy7Wik4b83JFdhbQa9ZXwWhQ8
         23w0u8FL2XED+pdIMd1rzlpi5X8eBxqYCvPVgtdZqrE7xoy2X6rhd0KADiAdxyB5Llbn
         MUcw7YPPLIHT7MSeUVbDx4fopiteke38dnjmGQ9bOGBLpVyPi0WlcunStu8yLnOlERtq
         daAk4u4K3Cf0kt1H+T7Js2NyOjW0jzzHpjAvwU9t/JsUXA8NUkg96ubr/vWYQ22uef2A
         Y3XDsvHtYjVymjRI2vjR+RmMgym+agmu5yut5vvxdAmplgHwtvF/xJRPX+1yWl21Rs/+
         /oIQ==
X-Gm-Message-State: AOAM531MAQMHBANceVHTo3Ob1Hc3umnmFId60sjSWnic2pjMFIFkr63Z
        sdapC7Fy01y6nFeCehZvfj2vTXO5RXlysgsGQOw=
X-Google-Smtp-Source: ABdhPJw/1PrNSEEqFIxQbF/qkE9w/mvdjk7PEj2S5yRgh9kFumr/HfVv95g9p+Af8+lT7uVouwyiPHZLQrsvcNaUVqI=
X-Received: by 2002:a05:6512:1031:: with SMTP id r17mr182630lfr.583.1616433197074;
 Mon, 22 Mar 2021 10:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DQq0vSkQuikYXxkKofkukGkwE=CBW10+eDPib2vRSHvg@mail.gmail.com>
 <20210322144354.GA31895@pengutronix.de>
In-Reply-To: <20210322144354.GA31895@pengutronix.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 22 Mar 2021 14:13:05 -0300
Message-ID: <CAOMZO5BDcRd=WmUBEb_mWnSbcEmk5o0LUmAw77g_ks9dc05jBg@mail.gmail.com>
Subject: Re: [REGRESSION] video-mux: Probe error on imx6
To:     Philipp Zabel <pza@pengutronix.de>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

On Mon, Mar 22, 2021 at 11:43 AM Philipp Zabel <pza@pengutronix.de> wrote:

> It seems the fwnode parsing got more strict and doesn't ignore the
> dangling endpoints that exist in the i.MX6 dtsis on the video-mux input
> ports anymore.
> I'll send a patch to skip dangling endpoints in the video-mux driver.

Thanks for your patch. It fixes the video-mux probe issue.

Cheers
