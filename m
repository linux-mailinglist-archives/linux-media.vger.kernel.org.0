Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3816E7E7649
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 02:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbjKJBEz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Nov 2023 20:04:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjKJBEy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Nov 2023 20:04:54 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46BB83ABA
        for <linux-media@vger.kernel.org>; Thu,  9 Nov 2023 17:04:52 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32dff08bbdbso937972f8f.2
        for <linux-media@vger.kernel.org>; Thu, 09 Nov 2023 17:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699578290; x=1700183090; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bnRFy/M2jUBSi2yJpJIE9XBcd/KDatAYWr+zVtKN5/g=;
        b=LkvUBdATo6+4F5glaGk01LWr4+s6rb8rqdNTCWD241lL+gJm7XqWaDVxlgexDE1gRu
         pMZwUsPSJdQvnY0SV80GeKIpA6TApqgqFqtchTNPm5DXOCD1s2OOMj2swCC04NmjmZty
         CkFhxbo5sWHQVCGRsdd+zv9OjY1GjWjkGLTJkDv4UdJyNEL7/ILLIFkAIaERIRzxAyHk
         Kg+3OvPMhWN6zomqMrFKZg880RRK5hy6tiBYa9qNXVYoAZ9A58RZrCiFWsqaG0lqL4v1
         qD3huZsXw7FSRi207/j9TKf7HuVTTaOzQeO+gXd3cNrbuvW/r00zJU8gKNQmM1+aSymU
         ZtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699578290; x=1700183090;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnRFy/M2jUBSi2yJpJIE9XBcd/KDatAYWr+zVtKN5/g=;
        b=nE4ApwTJgVGpt5O7ZKk3h82i7MbMTTOR7GKXwmsFQA6XbM6BgllpLYilIZ0aNjiJnF
         kE02yB8IXawITVwZ6iVZQ3ZxEwujq5jzzW8bqnKsvMYysUeDenzdksXGTv0VOuRQueug
         5S8rohnhbwKqA+KEwm512lF9k3nhznwXVpRtsdH6VWCTPatof/EMkAKTpYE5OH8VdCyk
         wWncy9daLyDNASnC8ZCRHiz4o4WvkZ5kgLhWu8DsGTIs8LKvOF2f5/cX7D/Gmlvs27Td
         I8zL/iG0vllJygdGsHDTzzDung+1fv0T7BLDlJ4nrjFPSQJzkuw/2pWIc5AUw/GBAdCW
         DKfg==
X-Gm-Message-State: AOJu0YzD66u3NiUFzuqeVRzK04f9ucIb4MxiNE8S4L+0Ve+JTj/w/nkS
        YLZsuJBHcJESfIXK8M73SMo8J2M8JdnihpwKyMPIHg==
X-Google-Smtp-Source: AGHT+IG65IwkOlcXL9Tw+iHoLLZZZ9IFXokPpE0lWYS5v4Z3T00EQAKHzf9QLLE/zHZcTCfvPWbLDA==
X-Received: by 2002:a5d:47ca:0:b0:32d:ad4a:bcef with SMTP id o10-20020a5d47ca000000b0032dad4abcefmr5733784wrc.2.1699578290007;
        Thu, 09 Nov 2023 17:04:50 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id d1-20020a056000114100b00326f0ca3566sm820562wrx.50.2023.11.09.17.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 17:04:49 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v5 0/6] media: qcom: camss: Add sc8280xp support
Date:   Fri, 10 Nov 2023 01:04:45 +0000
Message-Id: <20231110-b4-camss-sc8280xp-v5-0-7f4947cc59c8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK2BTWUC/23OwQoCIRCA4VcJzxnjqKWdeo/o4JiWULuLxlLEv
 nsWBBt5/Afmm3myEnIKhW0XT5bDmErquxp6uWD+7LpT4OlYmyGgFAIEJ8W9u5bCizdo4D5wCIK
 sCISCIqt7Qw4x3T/m/lD7nMqtz4/PiVG8p18NG9ooOHBr7Toq8mSi2l1S53K/6vOJvbkR54RsE
 VgJ2riojqilQ/gj5JzQLUJWQpH0coMxQuMLNSdsi1CV0MZpQx4Bov0hpml6AZ6vujd8AQAA
To:     hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
        matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V5:
- Fixes the lower case 0x0c to 0x0C not sure how Konrad even saw this.
- Drops frequency table to just individual frequencies not full array of
  opps - Konrad

- As explained doesn't change the finding of frequencies.
  Current array size will ensure testing if (freq[x]) succeeds though I
  do agree this should be changed up.

  Plan to restructure struct params for specificity to VFE, CSID and will
  incorporate this change then.
  Link: https://lore.kernel.org/all/e80d4026-a525-48ef-b53a-f1276dd316e6@linaro.org

-  Reset sequence

   Right now the reset works. I agree qcom's downstream has more stuff in
   it. I've logged a task to evaluate expansion of the reset and to test
   across multiple platforms.

   For now not required for this drop.

- _src clocks

  One assumes the reason at some stage in time we didn't have SET_PARENT in
  our CAMCC which meant setting _src clocks was necessary. In any case it
  ought not to be necessary now.

  Removing the _src from existing platforms should be trivial however we
  might find that as a result some of the CAMCC drivers need to be updated.

  That obviously is a separate series.

Link to v4: https://lore.kernel.org/r/20231109-b4-camss-sc8280xp-v4-0-58a58bc200f9@linaro.org
Link to tree: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/b4/camss-sc8280xp-v5

V4:
- Drops all _src clocks and _SRC indexes in series.
  True enough the CAMCC driver has all of the appropriate SET_PARENT flags
  so there's no need to represent _src clocks. - Konrad

- I've opted not to split C-PHY and D-PHY init sequences up unless/until
  we have a C-PHY init sequence upstream. - bod/Konrad

- b4 trailes --update -> + Konrad's Acks

Link to v3: https://lore.kernel.org/r/20231105-b4-camss-sc8280xp-v3-0-4b3c372ff0f4@linaro.org
Link to tree: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/b4/camss-sc8280xp-v4

V3:
- Strip pointer to dependencies from yaml patch
  I was hoping the robot would understand the links but it doesn't -
  Krzysztof

Link to v2: https://lore.kernel.org/r/20231103-b4-camss-sc8280xp-v2-0-b7af4d253a20@linaro.org

b4 base:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/b4/camss-sc8280xp-v3

V2:
- Rebase to capture is_lite flag from named power-domain series
- Amends commit log of final patch to give more detail on rename - Konrad
- Opted not to change switch() statements with returns. - bod/Konrad

Requires CAMCC for sc8280xp which applies to qcom/clk-for-6.7:
https://lore.kernel.org/linux-arm-msm/20231026105345.3376-1-bryan.odonoghue@linaro.org/
b4 shazam 20231026105345.3376-1-bryan.odonoghue@linaro.org

Requires the named power-domain patches which apply to media-tree/*:
https://lore.kernel.org/linux-arm-msm/20231103-b4-camss-named-power-domains-v4-0-33a905359dbc@linaro.org/
b4 shazam e700133b-58f7-4a4d-8e5c-0d04441b789b@linaro.org

Link to v1:
https://lore.kernel.org/r/20231102-b4-camss-sc8280xp-v1-0-9996f4bcb8f4@linaro.org

b4 base:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/b4/camss-sc8280xp-v2

V1:
sc8280xp is the SoC found in the Lenovo X13s. This series adds support to
bring up the CSIPHY, CSID, VFE/RDI interfaces.

A number of precursor patches make this series smaller overall than
previous series.

sc8280xp provides

- 4 x VFE, 4 RDI per VFE
- 4 x VFE Lite, 4 RDI per VFE
- 4 x CSID
- 4 x CSID Lite
- 4 x CSI PHY

I've taken the yaml from a dtsi series and included it here since 1) I sent
the yaml to the wrong person and 2) it already has RB from Krzysztof.

Requires CAMCC for sc8280xp which applies to qcom/clk-for-6.7:
https://lore.kernel.org/linux-arm-msm/20231026105345.3376-1-bryan.odonoghue@linaro.org/
b4 shazam 20231026105345.3376-1-bryan.odonoghue@linaro.org

Requires the named power-domain patches which apply to media-tree/* :
https://lore.kernel.org/linux-arm-msm/20231101-b4-camss-named-power-domains-v3-5-bbdf5f22462a@linaro.org/
b4 shazam 20231101-b4-camss-named-power-domains-v3-5-bbdf5f22462a@linaro.org

To use the camera on x13s with say Google Hangouts or Microsoft Teams you
will need to

1. Run Firefox
2. Update about:config to enable pipewire
3. Use this WIP version of libcamera
   https://gitlab.freedesktop.org/camera/libcamera-softisp

A working bootable tree can be found here:
Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/lenovo-x13s-linux-6.5.y

b4 base:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/b4/camss-sc8280xp

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (6):
      media: dt-bindings: media: camss: Add qcom,sc8280xp-camss binding
      media: qcom: camss: Add CAMSS_SC8280XP enum
      media: qcom: camss: csiphy-3ph: Add Gen2 v1.1 two-phase MIPI CSI-2 DPHY init
      media: qcom: camss: Add sc8280xp resource details
      media: qcom: camss: Add sc8280xp support
      media: qcom: camss: vfe-17x: Rename camss-vfe-170 to camss-vfe-17x

 .../bindings/media/qcom,sc8280xp-camss.yaml        | 512 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile         |   2 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 108 ++++-
 drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
 .../camss/{camss-vfe-170.c => camss-vfe-17x.c}     |   0
 drivers/media/platform/qcom/camss/camss-vfe.c      |  25 +-
 drivers/media/platform/qcom/camss/camss-video.c    |   1 +
 drivers/media/platform/qcom/camss/camss.c          | 307 ++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 9 files changed, 948 insertions(+), 9 deletions(-)
---
base-commit: 89e965e1a58f58cd359472b14c0cc25587bcf264
change-id: 20231101-b4-camss-sc8280xp-0e1b91eb21bf

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>

