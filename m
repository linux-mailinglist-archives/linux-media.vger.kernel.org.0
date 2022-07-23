Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B08557F14A
	for <lists+linux-media@lfdr.de>; Sat, 23 Jul 2022 22:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231821AbiGWUOy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Jul 2022 16:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbiGWUOx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Jul 2022 16:14:53 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC09193C4
        for <linux-media@vger.kernel.org>; Sat, 23 Jul 2022 13:14:52 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-31e0d4ad6caso76402007b3.10
        for <linux-media@vger.kernel.org>; Sat, 23 Jul 2022 13:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+X4NC7HMEsTyJEUED99GQac+kPMykk+7iU8zBxRDHGE=;
        b=qD6L0rW129uoghdib0Q9G8iCt4MzIIQDmVLjpfPnLKnsgSTawoDyQnO4okooE5aDjH
         PGyO/dom29KqMpZq6j9xuMMKm4sFvG7xFUIut4S6oljflTY6nl0klEzIv3OPziSgjjeY
         xOCgneGTnmhLdFMK+tLfXMiDUKQQhRjEoXqqTaiMABTY13yeGmidN5pYuMvYpx1w1lsa
         ZmzNxjoBPOWarqC3zEb9fIUw0apPm2cUcD/EoIp8p8LoVRocNRD3o8nnQfWsMofTP42Y
         3CaodP2cejEzVTdjpwqaazlGNow3ql4budzQnfmVvhVnI80//oyi/HZxaFXMcoLlw4EK
         TNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+X4NC7HMEsTyJEUED99GQac+kPMykk+7iU8zBxRDHGE=;
        b=8GO6VgeXh5qo6WnSkafpC4Kpp2QYQCWuPUKGLOhxmxRCpOzDGOojPvbZL0OcGvtlEp
         O1vuPSpS44IPwmMRIzLJmcxK7FYvjehnMui95FSf3ltwcCZtD6UyRdmR10pYSGDyHDv9
         b5Uohgjpd9X0iASnPqfw6DKFEzBsThSfytzj705FjOhTlRLpOTCGTEcN8pnPE/OzKkLY
         vmZiOZmHxJU5JOuL9RBwQX/zblHaCdMbgl//1PtzE87JZMAOcEV4T3ZNtXzbFQtKEtWu
         aFhtJIqnrPQjTSyHH5csGm5AS7lUxBta6pBH8+lAj0f3L7PuNmgRlITFwYVd3ORhd4eR
         3goQ==
X-Gm-Message-State: AJIora+nk0LqVv9OYI3Kgab2CWxxNvyxm5WdykMxDRNkGgPzoz37rS47
        JN3uHBUpzpCv/va0SqjukSwb7HJn2wuYJaSEtrgaPFWiEDs=
X-Google-Smtp-Source: AGRyM1vYUDN9oKNsaAI7c8kYvWmQj0BBWJCpkzl4DX+pkFMOU9ldvjWrh5p69OoFaMiovfrVTmJhy0XPqJxntCk4UyI=
X-Received: by 2002:a81:6503:0:b0:31d:6463:bf1a with SMTP id
 z3-20020a816503000000b0031d6463bf1amr4481917ywb.178.1658607291516; Sat, 23
 Jul 2022 13:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220723155502.127404-1-zhangn1985@qq.com> <tencent_686082BF01D2C0E8027D8CB05DC1C649DA05@qq.com>
In-Reply-To: <tencent_686082BF01D2C0E8027D8CB05DC1C649DA05@qq.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 23 Jul 2022 22:14:40 +0200
Message-ID: <CAFBinCBr=LvMywLJMeSY3bgNPF1tV-Fs4_kFb4jXUm_F20eGng@mail.gmail.com>
Subject: Re: [PATCH 1/2] dts/amlogic: Add MagicBox M16S support
To:     Zhang Ning <zhangn1985@qq.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>, sean@mess.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

great to see this patch!

On Sat, Jul 23, 2022 at 5:56 PM Zhang Ning <zhangn1985@qq.com> wrote:
>
> MagicBox M16S or MagicBox 3Pro is popular Tv box in China.
>
> it's q201_v1 according u-boot log.
> and it's almost same as Q201 reference design.
>
> add a simple dts to support this Tv box.
It would be great if you could add the hardware specs from the
cover-letter here.

[...]
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index 61a6cabb375b..3eac16a4de68 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -123,6 +123,7 @@ properties:
>                - khadas,vim2
>                - kingnovel,r-box-pro
>                - libretech,aml-s912-pc
> +              - magicbox,m16s
>                - minix,neo-u9h
>                - nexbox,a1
>                - tronsmart,vega-s96
The change itself is fine (entries are sorted alphabetically). It
should go into a separate dt-binding patch though.
See commit 3f7dbd336f360a ("dt-bindings: arm: amlogic: add Vero 4K+
bindings") for an example with the correct title and commit message.

[...]
> +       gpio-keys-polled {
> +               compatible = "gpio-keys-polled";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
#address-cells and #size-cells will be dropped in Linux 5.20 in all
existing .dts files, see [0]
Please do the same.

> +               button-power {
Button/Key node labels are updated in 5.20 as well (see [1], but
button-power does match the recommended naming so no change is needed.


Thank you and best regards,
Martin


[0] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/commit/?h=v5.20/arm64-dt&id=4956be9944d1fb23107f27bad8a2cca0fa167443
[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/commit/?h=v5.20/arm64-dt&id=4fd9afd894ebe5831dbd737e6ca7b6de14da7fda
