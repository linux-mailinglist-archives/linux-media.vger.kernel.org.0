Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD03252B9A8
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 14:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236293AbiERML0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 08:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236298AbiERMLN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 08:11:13 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C4F35DCB
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 05:11:11 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id d15so3260494lfk.5
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 05:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nUFvXB8NXMFcyU7UqQtHGu+yWvXe5nBkItYTmYIGtoU=;
        b=MZncvBXNIASuguQoyC0dPlNo13lla4FLlCdQfqMPgXDOWl7K3C2kzKve6FJd2VIDAe
         kiYnDNFqDIRcs5R7W2ELHMoZlZ7oxCTX4Qc+uHTnhK+xgfZ+5I+xLyqr38V0jlyGbNiu
         g6VWxLp6wpUC5vuGZzR1n5FpZhwQa7lqLGoBTIYqXQJmSxxbuvd7FM/oD0MmKfufD0Qu
         ykfkRT6wRT4+aFJBwuu/IWXXIfphzFJCUaWwSxICOTHhUiBaBa9o0zFgjI2/HkXC7Eja
         uigOojG9GGZdnkQ4D+lGRR9xiH5VnTRW6bBlS52qummqcHrvcuPgnDWh6JOjoxucUWS6
         74OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nUFvXB8NXMFcyU7UqQtHGu+yWvXe5nBkItYTmYIGtoU=;
        b=p5oH/SpJRma1W5Fm9//VbfVBEEjUJQdV//SPh6SfIurs50K9p9bxANzmklPum4waSJ
         kvPGJsn/XQzo8JIysUsu/ETbHLlZaUeTbaaO1tD3Fv9KFYl4hFdWi6W8Bf10G7ajiwvf
         nMS7NdcZHdBjGpbn+8xPPWvsXDmY4PW1nZfY6s0vgg7xEBkk9kttHzN7rdmIhbGb3ThJ
         8x9bhWy4lcbo28FMSqyuP6j6O6kaZn2nPNeO5hbQYOKNWKzYWX2cG9e94hRx20GBVB8n
         tCPwIhQ+VWtgKAutNnn9J4TAnzm/BIymqvF2zsmgku+FuvSuYDyDxAUHc1WLdB+c/c1W
         9e4w==
X-Gm-Message-State: AOAM532Ve6MuMPCOnlgARpuDJTIzo3UfjVhEzo5lUecVdlA5Gp51wD8B
        amzGdxCfSLqZSLhoIuYgM3dEsQ==
X-Google-Smtp-Source: ABdhPJydAp5C4QR31PB6tNqxtPVxmkq1XR/QpCAPPE05LbQTnj16rSElfQrK1y+UDah+wKvJgYaRaA==
X-Received: by 2002:a05:6512:39c1:b0:44a:e25d:47fd with SMTP id k1-20020a05651239c100b0044ae25d47fdmr19960149lfu.580.1652875869362;
        Wed, 18 May 2022 05:11:09 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-b04822-211.dhcp.inet.fi. [176.72.34.211])
        by smtp.gmail.com with ESMTPSA id o8-20020a2ebd88000000b0024f3d1daeccsm194460ljq.84.2022.05.18.05.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 05:11:08 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/2] media: dt-bindings: media: sm8250-camss: Add power-domain-names property
Date:   Wed, 18 May 2022 15:11:02 +0300
Message-Id: <20220518121104.951621-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QCOM SM8250 camera subsystem depends on three power domains, at the moment
all of them are not differentiated one from another, however the power
domains compose a hierarchical structure with vfe0 and vfe1 as subdomains
of titan_top, also managing vfe0 and vfe1 separately allows to get more
fine-grained power control in runtime.

The change relates to my review comment for v2 of CAMSS on SM8250 submission:

   https://lore.kernel.org/all/13ad033e-cd5d-3a8c-b036-50a3ac4245c0@linaro.org/

Apparently it becomes important to manage CAMSS power domains much better for
newer platforms, this referes to platforms with Titan GDSC, for instance CAMSS
on SM8450 has 6 power domains, and dealing with them in bulk is not an option.

There was a note in commit 2f6f8af67203 ("media: camss: Refactor VFE power
domain toggling") about problems with power VFE domains on/off, but perhaps
it's related to the fact that Titan GDSC is a special power domain and VFE
are subdomains, the latter shall not be enabled earlier than the Titan, but
the driver did not construct a proper hierarchy and leaves a room for races.

The change should have no implications on any SM8250 CAMSS users, since
none of the supported in upstream boards enables the camss device tree node.
The correspondent changes in the driver will follow this dt specific series.

Most likely a similar change is required for SDM845 platform, but it would
need additional investigation and testing.

Vladimir Zapolskiy (2):
  media: dt-bindings: media: sm8250-camss: Add power-domain-names property
  arm64: dts: qcom: sm8250: camss: Add power-domain-names property

 .../devicetree/bindings/media/qcom,sm8250-camss.yaml       | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi                       | 1 +
 2 files changed, 8 insertions(+)

-- 
2.33.0

