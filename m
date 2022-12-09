Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2470648A50
	for <lists+linux-media@lfdr.de>; Fri,  9 Dec 2022 22:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbiLIVsU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Dec 2022 16:48:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiLIVsT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Dec 2022 16:48:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 438CD2676;
        Fri,  9 Dec 2022 13:48:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DE06E6234D;
        Fri,  9 Dec 2022 21:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470CCC433D2;
        Fri,  9 Dec 2022 21:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670622498;
        bh=ubqoDy+JOVxCrTTBNkFzx9mqTGDAzp5B+PUvwUTgenU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=towfbnB/5XzyxHfENeykAeEBdOjaj8c6iS89szASoRQnvVWHT790eddq31VJRhANU
         ZO8NcVNkg+Ni2dUfvabzZ4AZMIq+fL/eD4SnRnlInRt4BDbjAt+ZbKQG38TBVp1n8Z
         P1Q8nDwTDU5/VqyEdTUT4VLByaSDN+RhiaQjL9owNxWAVF+NC4B2eC0i++nbIk4Fg7
         34HGJj76lK2EMbdtUVuhq+Tz3gt055R5+/g5Y/p4WlakRdEgQLNsbvPoPPDUykJL1V
         JQ433hsLFltSBJi8d8HYslKyxsgHoV8AQA952Z6nOF2N5R9kiCtIqt7mrT5OkitkML
         vnjMrJL5AqgGQ==
Received: by mail-vs1-f45.google.com with SMTP id 125so5754843vsi.9;
        Fri, 09 Dec 2022 13:48:18 -0800 (PST)
X-Gm-Message-State: ANoB5plmVKlHNvVlmO5eJlfFNREJnbAMjKCPO000XeZN+mPQmOerYrHn
        F8JfarDM+3G7GtGL6fVfUWxNdS1950esk6JSZQ==
X-Google-Smtp-Source: AA0mqf7mJIRobhMWScsiBsZZQKXfjS2q9Xz9eMV2QhMw3Q5cfXADa4H0dNhmvs4Zh9YtwmVKiubIXOGA16MfsJ1RHc0=
X-Received: by 2002:a05:6102:31ba:b0:3b1:4914:c553 with SMTP id
 d26-20020a05610231ba00b003b14914c553mr9841327vsh.26.1670622497250; Fri, 09
 Dec 2022 13:48:17 -0800 (PST)
MIME-Version: 1.0
References: <20221209084831.000048ab@arducam.com> <167062172117.3886397.15786483410455573972.robh@kernel.org>
In-Reply-To: <167062172117.3886397.15786483410455573972.robh@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 9 Dec 2022 15:48:06 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJeJAQ=d-bq_tKShz5TVJ2czPqPPNSkxPZJZJEK6WnaFw@mail.gmail.com>
Message-ID: <CAL_JsqJeJAQ=d-bq_tKShz5TVJ2czPqPPNSkxPZJZJEK6WnaFw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: media: i2c: Add IMX519 CMOS sensor binding
To:     Lee Jackson <lee.jackson@arducam.com>
Cc:     krzysztof.kozlowski+dt@linaro.org, linux-media@vger.kernel.org,
        s.hauer@pengutronix.de, shawnguo@kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 9, 2022 at 3:35 PM Rob Herring <robh@kernel.org> wrote:
>
>
> On Fri, 09 Dec 2022 08:48:31 +0800, Lee Jackson wrote:
> >
> > Add YAML device tree binding for IMX519 CMOS image sensor, and
> > the relevant MAINTAINERS entries.
> >
> > Signed-off-by: Lee Jackson <lee.jackson@arducam.com>
> > ---
> >  .../bindings/media/i2c/sony,imx519.yaml       | 107 ++++++++++++++++++
> >  MAINTAINERS                                   |   8 ++
> >  2 files changed, 115 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx519.yaml
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Humm, did you Bcc the DT list? Don't do that because replies get lost
from the archives.

Rob
