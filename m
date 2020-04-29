Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC7F1BE3B4
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 18:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgD2QYo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 12:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726423AbgD2QYn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 12:24:43 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201D1C03C1AD
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2020 09:24:43 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id d17so3249318wrg.11
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2020 09:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ADiqVCpvp8u+dzB9ke1O/BxJ8B4T05czfzaYmje6w94=;
        b=nfg9FBtzRkNNFB895zwDXF5h1SCzLtHIHEArxQOIypisEW+sLJeEFFsl5jQZOAQUm1
         Gk2W/HepcONJybmjc7yjUPdCpz45ff/0ZoYTN8+ncWXr18rhjybizCruAH25c3QdQBnC
         InPigL/BxQnpb6RwI+uNMKDmQ+FA65z8S7lVPXLYPDGV6s+r0nmcwrDvCdMxbpkQCay3
         Zj5oe0cn2dguQVi883e+4v3r19aNtH2BbOZK1DfS8UHBvUIdTvlDrKumUW3PHp4MYIpe
         CcIKR8XPnWNp9FFyqHJUNSLb2QZuAFgwmKX+txpPHgeXMyUySi2VEXNcmiY1Lcsm/0fu
         mjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ADiqVCpvp8u+dzB9ke1O/BxJ8B4T05czfzaYmje6w94=;
        b=GrEo2P4CixAxoXulPVO6PBT+eR8KA+HA0gYguzvZdKTzv45GmlDU+7i0/qO5v/MtDn
         zZdiHmECyia3qKpBAnpb4qZWBMOeFlq54KpgICJRu7iTGeSQeJOcO71EeK+mGtsZP3sC
         HFzZTDrsGG05BC2sxBHJfn+l5b1rZ+HTNrkny98AiOOol/NNEWF5Se26IT/DN99dMIGs
         WKzDp+JvSAr9hPtRMUCIB0exQx4lpeXtqF7rcrMCUVSYmfixfsu0G6rJD4RP712j6RPJ
         NhRL/E6jYIhODBgkCUFFB6tAhK4jVve75TthF5zXtqtx2J4v9grc4y8F9rIZpWeWdA+O
         OJpQ==
X-Gm-Message-State: AGi0PubB67OxtFWRZz0J1wnKQImu/r0thC8IkLf54/GY9Q0MmAbuowQZ
        0C7GQ7X9R1XB3dqLfa2p0/ntpg==
X-Google-Smtp-Source: APiQypLrrX5chyfQ776G/ANPebYHVEwsF2r9aqYcDy10DPmWsl+HRRFigDXqGRIWFJXTPDwD5WMOTQ==
X-Received: by 2002:adf:ce02:: with SMTP id p2mr39887093wrn.173.1588177481814;
        Wed, 29 Apr 2020 09:24:41 -0700 (PDT)
Received: from xps7590.local ([37.120.81.28])
        by smtp.gmail.com with ESMTPSA id h2sm32616554wro.9.2020.04.29.09.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:24:41 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v6 v6 0/3] media: ov8856: Add devicetree support
Date:   Wed, 29 Apr 2020 18:24:34 +0200
Message-Id: <20200429162437.2025699-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds devicetree support to the ov8856 driver.
In order to to aid debugging and enable future sensor
modes to be supported, module revision detection is also added.


Dongchun Zhu (1):
  media: dt-bindings: ov8856: Document YAML bindings

Robert Foss (2):
  media: ov8856: Add devicetree support
  media: ov8856: Implement sensor module revision identification

 .../devicetree/bindings/media/i2c/ov8856.yaml | 140 +++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/ov8856.c                    | 190 ++++++++++++++++--
 3 files changed, 317 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml

-- 
2.25.1

