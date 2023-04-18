Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3452A6E6BC4
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 20:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232572AbjDRSL2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 14:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjDRSL1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 14:11:27 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B71CC3E
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 11:11:18 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id r15so6419476wmo.1
        for <linux-media@vger.kernel.org>; Tue, 18 Apr 2023 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681841477; x=1684433477;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DMgcP9MFsdAN8yCKBrSy/25dv7G/Q0vscVQs09p5j8s=;
        b=jvV/M28+57FDMWzSJdsFY6PFf9AR/7siw3/kkaXUvn5ndnMTqlu4r2mnxbVARyvh2L
         5iMdx5mXLXb2ToFWhYcxWnkimXV+pDhDhNmmSJzx9WZ1RH1YsNWl3TGetdDvCW8xl5Ly
         zsiYdLWpWxt9eqVzvbB3dbGWehLnDq3CXNo5fJNUaO59CejZ0qO3fKtsIcdWirsNLJZl
         gUOyrZ9xBe1s2affK0Od2FrWY6L+ynqQCX5y97Q+bPyvbh+f6Nz7PEXBFNhwmcqKq03X
         QkXzGns1KaKoMJerXmEzBb875X0C8QEWgetIkWbCrYpTGfazXmhjvI9CV+3TylGO7Gm/
         JmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681841477; x=1684433477;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMgcP9MFsdAN8yCKBrSy/25dv7G/Q0vscVQs09p5j8s=;
        b=inJvGL1MRHdxS8gT+V/sUzMJTj+CJ3qam/IoJo6V3Iqos87Rt3R2U8teffYlaP3GTU
         FGitb1vt4Ch1kuocC1wKqpOM+9paoCgpD3ugAGhcaBL9i3Z51NVe/8KZ0DklvI8vwybk
         VLtN3na6Rhutm2iqcCMn0xpVGYknRFykr+XCOWLylXASnCJ/6NAINUw+ggKwkfrUrxDK
         r/AqTX5+uSCbNIzFoxkPSgB7U0XgYDIQXuX26h00GVJ1hCOMS3ME+bw9Xdzse4GP1gRx
         I1+5BV640B/dgSvdwUDZTHYIYfGY2Pf4ARsx4Ug8DjnHvO1rtpvjeochikFtKOfY+koO
         N4Tg==
X-Gm-Message-State: AAQBX9cW4WG7c7CqOh72cYOY6XvpK56v3o3zYlpRkQktYHg1InOxkYyC
        KDcAICDEYEFYNf0rO7ih6vOE
X-Google-Smtp-Source: AKy350Y/hSn1dx9JX6EP4aiodyAYctRlEPn0LIKK8iXuOmFxThlQZZf2gHkqmjrMtPzt6jnzO38+Ag==
X-Received: by 2002:a7b:c30a:0:b0:3dc:4fd7:31e9 with SMTP id k10-20020a7bc30a000000b003dc4fd731e9mr15769036wmj.7.1681841477039;
        Tue, 18 Apr 2023 11:11:17 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id r17-20020a5d4e51000000b002f01e181c4asm13727898wrt.5.2023.04.18.11.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 11:11:16 -0700 (PDT)
From:   Arnaud Vrac <avrac@freebox.fr>
Subject: [PATCH 0/4] Support HDMI CEC on Qualcomm SoCs
Date:   Tue, 18 Apr 2023 20:10:42 +0200
Message-Id: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACLdPmQC/zXNywrCMBCF4Vcps3Yg6QUmvoq4SNKpmUWiZEQKp
 e9uKnb5w/k4GyhXYYVrt0Hlj6g8Swt76SAmXx6MMreG3vSDGS1h1kzOEaY5C0aOaChM5ExYRsv
 QWPDKGKovMR2w8PrGvx5OfexelRdZf9e3+75/AfJnIPmKAAAA
To:     Rob Clark <robdclark@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1793; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=am/H82hqwmU83sVoZuyNqgdTOTTt8SGXNkd+GyuveEU=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkPt02Pmrys1RGf4UYjuW9+8hCzdXDkgPQImhKL
 oA0OHW17S+JAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD7dNgAKCRBxA//ZuzQ0
 q4oiD/9C+EMeFG+BgIyBSdfXlNecAx5BoK0RU2oOMxOuql17z4c+STsni5IYQ4ksuVMuiqjNCKh
 u7NW9edxfnEoaVlO+RfOifXXuUv+DWZnL4Wnjv3CCtYFQr+N5w5Rx2a+BEhHlAYTu6XyX/bY5Xi
 jsht/a/QUjDyWtT3C/40cMxz+hVJKlHkFbyTf4Tp6I0ROeO4bHxGUWL6cQeqPNpWwaW7QZHa5Gm
 bxLkoaQJvA3UsEMPb9dJC/p0D4lk8dS2ne0B2+lGEN6c4Kn+9cBQXNfL3im3oTmwhHfo0W2zX1G
 lu+pN6z83DV0ObBRmHJjZL7/qadtFQIIUbX6YhBh1/q3g7Rpwe2oS1nJmX/a2MIBPD9B/9KjIr1
 ZV01SckN9NGrbQ6Qu5OXqA8MbpKGVX4fetF9TrG+MYnTEDVWE3qnLv/P27Pcvnx0ahE5Oty9mhO
 hZM44VnYVdaQZci6l+BrrEa+LfOp44ASJe2xvRnIpLVn7OPrCr0Vhl5D9KQj63YidTlp6dNL3zV
 i3upwSmxRdqZMlnrwSzo/v3+nCePXsd7YtKpc0NP2a7dZUTCPH/QKgbifnwcraoR0N8EenOBPmS
 +nJ/MmCwDXje1E3H0+YAYioSmiaj0M9v8h38udUJSbp93tF+uN5oWR0GyTuM90nnUMTUa4p+pu/
 8mQzWFJrb+M9nVw==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some Qualcomm SoCs that support HDMI also support CEC, including MSM8996
and MSM8998. The hardware block can handle a single CEC logical address
and broadcast messages.

Port the CEC driver from downstream msm-4.4 kernel. It has been tested
on MSM8998 and passes the cec-compliance tool tests. The equivalent
downstream driver also passed CEC CTS tests using a Quantum Data QD882E
analyzer.

Some registers bitfield definitions were added to make the code clearer,
and those will also be proposed for upstream in the original xml file
from which the header was generated, in the mesa project.

Note HDMI support is not yet included upstream for MSM8998, I would
appreciate if someone can verify this driver at least works on MSM8996,
for which adding the pinctrl nodes for CEC should be sufficient.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
Arnaud Vrac (4):
      drm/msm: add some cec register bitfield details
      drm/msm: add hdmi cec support
      drm/msm: expose edid to hdmi cec adapter
      arm64: dts: qcom: msm8998: add hdmi cec pinctrl nodes

 arch/arm64/boot/dts/qcom/msm8998.dtsi  |  14 ++
 drivers/gpu/drm/msm/Kconfig            |   8 +
 drivers/gpu/drm/msm/Makefile           |   1 +
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  15 ++
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  18 +++
 drivers/gpu/drm/msm/hdmi/hdmi.xml.h    |  62 +++++++-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |   2 +
 drivers/gpu/drm/msm/hdmi/hdmi_cec.c    | 280 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    |  17 +-
 9 files changed, 412 insertions(+), 5 deletions(-)
---
base-commit: e3342532ecd39bbd9c2ab5b9001cec1589bc37e9
change-id: 20230418-msm8998-hdmi-cec-08b5890bf41e

Best regards,
-- 
Arnaud Vrac <avrac@freebox.fr>

