Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6CC14DDC4
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2020 16:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbgA3P04 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jan 2020 10:26:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:46110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727186AbgA3P0z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jan 2020 10:26:55 -0500
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 344442083E;
        Thu, 30 Jan 2020 15:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580398015;
        bh=YjnAL/bGTXUIr0WPqnrvgpQ0zIdLsvbJjuEaH6/zhkQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Czplotu4uxip/C6E/oNc60VZPAfLLViPbUwPxINpVyH7BEBlqCtgyVBnOp2QtrDR3
         hu8y176gfUPKYRVE8ZsOGq2MpRIYLbDUg1DzJ5eOjv4TSRUAfSNcug1SAfIXszlUIS
         P0WrwaWbGnqNeygcIyflQBWqG6S/olZ3uBwDYPoY=
Received: by mail-qk1-f178.google.com with SMTP id q15so3247845qke.9;
        Thu, 30 Jan 2020 07:26:55 -0800 (PST)
X-Gm-Message-State: APjAAAV5HShdL2PqEnk+dBhFb6Nws3g2GO82jU/m6lnhxcvUXtfKPIUe
        mJKlisYz4Sp2qyRmwofS7VrFus3wteR7KibPMg==
X-Google-Smtp-Source: APXvYqwFQOFE7AjB7HrdydN1cq2Bv0ALSQioPG+tb7hj4dPC/A6oB67Zmcj6qnvImljLC9OPV//XNxwUim+Qn0JT4Ig=
X-Received: by 2002:a37:85c4:: with SMTP id h187mr5759809qkd.223.1580398014296;
 Thu, 30 Jan 2020 07:26:54 -0800 (PST)
MIME-Version: 1.0
References: <1579006416-11599-1-git-send-email-dikshita@codeaurora.org> <1579006416-11599-3-git-send-email-dikshita@codeaurora.org>
In-Reply-To: <1579006416-11599-3-git-send-email-dikshita@codeaurora.org>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 30 Jan 2020 09:26:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLHj0H6GC+UwaLM3=LP=a_SGhcOGyUzEfYy=JhVsdVQ7A@mail.gmail.com>
Message-ID: <CAL_JsqLHj0H6GC+UwaLM3=LP=a_SGhcOGyUzEfYy=JhVsdVQ7A@mail.gmail.com>
Subject: Re: [PATCH V4 2/4] dt-bindings: media: venus: Add sc7180 DT schema
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 14, 2020 at 6:54 AM Dikshita Agarwal
<dikshita@codeaurora.org> wrote:
>
> Add new qcom,sc7180-venus DT binding schema.
>
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  .../bindings/media/qcom,sc7180-venus.yaml          | 144 +++++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
