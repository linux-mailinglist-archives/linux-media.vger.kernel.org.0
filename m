Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D99EC3B0A30
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 18:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhFVQWx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 12:22:53 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:49845 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbhFVQWw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 12:22:52 -0400
Date:   Tue, 22 Jun 2021 16:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1624378832;
        bh=kHclmWIAffgA/kXrGLvvaaT+S8kN4U+u6KviPAVzP3w=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=cLw4LHAPTPdDOnVC0pkmO4Cw5hYjxBtjrWSpQNPk+HW+opQVov201Cx5tnMFQHy6O
         oNQrek1qAvSI8EiHnfcqz0xPqBSEXAMJYs6QT2sdaF6pf4Xri7DXDMSwvJt912Hsv+
         rRnbo4oVMaFsrNs93k0M6gJfWH9vPjfDy3FeRdPQ=
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: (No Subject)
Message-ID: <p79aCzsVmgW6eKQZNSlglPvO40ulVy4id6jcm7aTk@cp7-web-044.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Date: Tue, 22 Jun 2021 20:08:25 +0400
Subject: [PATCH] media: dt-bindings: media: venus: Add firmware-name

Support for parsing the firmware-name property was added a while ago [1],
but the dt-bindings were never updated with the new property. This patch
adds it to all venus dt-bindings.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

[1]: https://lore.kernel.org/linux-arm-msm/20210126084252.238078-1-stanimir=
.varbanov@linaro.org/
---
 .../devicetree/bindings/media/qcom,msm8916-venus.yaml        | 5 +++++
 .../devicetree/bindings/media/qcom,msm8996-venus.yaml        | 5 +++++
 .../devicetree/bindings/media/qcom,sc7180-venus.yaml         | 5 +++++
 .../devicetree/bindings/media/qcom,sdm845-venus-v2.yaml      | 5 +++++
 .../devicetree/bindings/media/qcom,sdm845-venus.yaml         | 5 +++++
 5 files changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yam=
l b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
index 59ab16ad12f1..cb1b866d9c37 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
@@ -80,6 +80,11 @@ properties:
     required:
       - iommus
=20
+  firmware-name:
+    maxItems: 1
+    description: |
+      Relative firmware image path for venus.
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yam=
l b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
index 199f45217b4a..b8809325138f 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
@@ -107,6 +107,11 @@ properties:
     required:
       - iommus
=20
+  firmware-name:
+    maxItems: 1
+    description: |
+      Relative firmware image path for venus.
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml=
 b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
index 04013e5dd044..ffd3e2850366 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
@@ -99,6 +99,11 @@ properties:
     required:
       - iommus
=20
+  firmware-name:
+    maxItems: 1
+    description: |
+      Relative firmware image path for venus.
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.y=
aml b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
index 04b9af4db191..cd7a5e1374ce 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
@@ -94,6 +94,11 @@ properties:
     required:
       - iommus
=20
+  firmware-name:
+    maxItems: 1
+    description: |
+      Relative firmware image path for venus.
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml=
 b/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
index 680f37726fdf..ae256238a637 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
@@ -108,6 +108,11 @@ properties:
     required:
       - iommus
=20
+  firmware-name:
+    maxItems: 1
+    description: |
+      Relative firmware image path for venus.
+
 required:
   - compatible
   - reg
--=20
2.32.0


