Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB61D45468F
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 13:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234880AbhKQMsH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 07:48:07 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:32724 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232278AbhKQMsG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 07:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637152923;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=7Or6MpTJDXx+AWXB1R7vN3QqEV2HePA4Ja4lU2/nA60=;
    b=hJU92DDJaeTWtncjkLuCia/ghdWzlNgsyZA+cMDZrk1uoyxBNFygIyVhsWo8UqxwpJ
    Kt0VWxfpgmMTB75DT+iiQasm0/dR99preC6+KUxhn7tiQ8znkvUfrWLKSDKWchW9A+RJ
    IKvBJfH3tSn39mmQMHaJiSi0rovxaj5MWfWevG8/37l9mtvNuEgB6fHfLqgwdxUMAcTo
    3j1nMpXw+RaqFf4VRMM2W0nmDUsjV87omh6lg6XOXSU4hsxloc2Oh5HY4jaZPwZwP31v
    GANKfATrEmQP3I6ZlXkvz6VJil1CnbkB7TH0xHhcDgOGXL/0QdQYDP29roXXWCJQYEEx
    AllA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrK85lg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.34.5 SBL|AUTH)
    with ESMTPSA id j05669xAHCg2lad
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 17 Nov 2021 13:42:02 +0100 (CET)
Date:   Wed, 17 Nov 2021 13:41:57 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: msm8916: Remove clock-lanes
 property from &camss node
Message-ID: <YZT4lddeEJAOkIc4@gerhold.net>
References: <20211117113800.260741-1-robert.foss@linaro.org>
 <20211117113800.260741-4-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117113800.260741-4-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

small nitpick: The subject would be more clear with
"arm64: dts: qcom: apq8016-sbc: ..." instead of "msm8916: ..." like in
your sdm845-db845c patch, since only apq8016-sbc is modified.

On Wed, Nov 17, 2021 at 12:37:59PM +0100, Robert Foss wrote:
> The clock-lanes property is no longer used as it is not programmable by
> the CSIPHY hardware block of Qcom ISPs and should be removed.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 2 --

Can you rebase this on 5.16-rc1? All of apq8016-sbc.dtsi is now in
apq8016-sbc.dts (the extra dtsi did not have any good use).

Thanks,
Stephan
