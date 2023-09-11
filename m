Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C92A79BF96
	for <lists+linux-media@lfdr.de>; Tue, 12 Sep 2023 02:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbjIKUrK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Sep 2023 16:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235935AbjIKJqj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Sep 2023 05:46:39 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E087E52
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 02:46:35 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31dca134c83so4201515f8f.3
        for <linux-media@vger.kernel.org>; Mon, 11 Sep 2023 02:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694425594; x=1695030394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AR5r3g93Rem7DNpxCNPYXtJX7SM5cWGRWdjy8kq3JwA=;
        b=Zi7/STSV9/g+grLvAxzksLGbxGcNM1rEHZQIPLG8zq6DY0ndvXYAdnnymoVaQzrVu7
         YxmwBSoupqVMP9P6q7HPckZBTC+M4u4fqXnLAmvKhCh0mucQGmNWg/7HU/Dgp+wjzwKI
         PjB2J9Ob/9x4y1szPPDwkpVfjBC8btaZPKY5XqB21xabaHx8HQf8C+AXCxGxImAgHo6l
         ke3ZbUapLFDB3+iBSOY+lbOTjHpubu96F6xSeycY1kSCWKHKpcGpuAXinI44+TqfnUBg
         PJW4p2mYSjhh8HTZN1OmqxVaBXRq/mRR+ckPj9B+oC2L7uVUMGO2fl/m3O0gFiCXalxa
         QdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425594; x=1695030394;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AR5r3g93Rem7DNpxCNPYXtJX7SM5cWGRWdjy8kq3JwA=;
        b=I4aMazRpC31FHlb2bl7it781MwzyaCef+8h85mVEHgFMlIX89cwxKKnVLD/oxjXdqe
         uMQzngTp8nNWbY6Kvlx520UE7HKX+q8D1IcB9+neSu5zjHf2buX15hpmGXoKJIzY7gFh
         pRmezSSkNuzqfI29WZekzU6FK3U/dehxZ5iNOHMpD2NnrTjJJbHoz6AnF/Wb4VSGs1sK
         eDX8Sg7mB+e65g6QYCkuymS4mKMa2IAzYch4psA1VcHFDQWykuoix0uygb4YVZnR1qkM
         h1tm61ClN7xOivKKubVQpgnN5xe21CG42N05mpgexCKHqYCZ3F4ChhGmtFImXAQyqNSa
         MKgw==
X-Gm-Message-State: AOJu0YxHPgWaU69ymvjsXLQRblTVjTdbCG23cfhhQ7Vlykn0GXG8t2hn
        rZ0s9kAqWep9Tf1h/3alYAjz/w==
X-Google-Smtp-Source: AGHT+IHIeeGTixGVLQ3w8IGwO+JDDdkg+e9WcxFRAhz+oDKZn61/9t8brHl2PDw0+BRylOKbkUPiTg==
X-Received: by 2002:adf:ed12:0:b0:317:4cf8:35f9 with SMTP id a18-20020adfed12000000b003174cf835f9mr7111697wro.16.1694425593928;
        Mon, 11 Sep 2023 02:46:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d13-20020adff84d000000b00317909f9985sm9503496wrq.113.2023.09.11.02.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 02:46:33 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        zelong dong <zelong.dong@amlogic.com>
Cc:     linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com
In-Reply-To: <20230825115310.39993-1-zelong.dong@amlogic.com>
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
Subject: Re: (subset) [PATCH 0/3] This patchset adds IR controller driver
 support for
Message-Id: <169442559302.3235506.15361466537260729684.b4-ty@linaro.org>
Date:   Mon, 11 Sep 2023 11:46:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Fri, 25 Aug 2023 19:53:07 +0800, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Meson IR Controller supports hardware decoder in Meson-S4 and later
> SoC. So far, protocol NEC could be decoded by hardware decoder.
> 
> Zelong Dong (3):
>   media: rc: meson-ir: support rc driver type RC_DRIVER_SCANCODE
>   dt-bindings: media: Add compatible for Meson-S4 IR Controller
>   arm64: dts: meson: add IR controller for Meson-S4 SoC
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)

[3/3] arm64: dts: meson: add IR controller for Meson-S4 SoC
      https://git.kernel.org/amlogic/c/dc8bc779feb5e855421215384f23de90a4fcd622

These changes has been applied on the intermediate git tree [1].

The v6.7/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

