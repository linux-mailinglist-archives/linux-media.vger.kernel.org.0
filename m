Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03F861B6D60
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 07:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgDXFij (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 01:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726010AbgDXFij (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 01:38:39 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E0D7C09B046
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 22:38:39 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id g14so9724329qts.7
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 22:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=fleKWJiYiR5vKTf1/KbKvBmLV3KIF/zKJR1BUiNMI5U=;
        b=iUmsqjZgO6njBhyLec4kM76hC2BmGpCFZ/DJuY4A7zmGD5TMPESZW68+W3nxzv7Vhf
         u6cHLvaX3p1Gh+9lhbca/bl66KMMhSXYjNCl7tW0+QSvzhh1f8Ba4nkDc7Cs0rshTLog
         OKzG+qkupZBN/hv61NjrkS1GNk2XPoa05QI+e/hR6K48Kndomf08SMXLz0cIA/Sp+fMO
         ke/YhFJWdPXYp638TmKQf7oiM/m9gOpTDoLU4GB3d5FzS41l3fhz4P7483FPz+fIQzsS
         qGwoN5qANwFgxRgkmuM/Y2C1Fl8vOnWJG3PKrtgCn4OItUNYeftvXEntyIERBY5L3+q9
         c0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=fleKWJiYiR5vKTf1/KbKvBmLV3KIF/zKJR1BUiNMI5U=;
        b=M2Szv6daT1HdAyVlMNauWUD4KlSSJKOC6yWm1naXQmsN37VKHCSUNqsYOOFinvqPn2
         ctNqHOx0IRq2kRABJRyzPYlplFJDyBu+wjPCOMFC4YwO65HAv3KJTvweVgc3GiNjMyY3
         SXBZmKjYwGp4hB8Q1CUj9mCAPzQFwk69ucEwb9vIMaRoel6bU+tYUdxFchonq7O7WRe8
         mxwEyuRBNqJmHek6LZT/AR6M60a2VzQfMqrUWOOwJ5foVKRm026P7uIudZJ6GCu0LpwI
         uVSo9lFAa4sbR7MPUCgJnYmwHujbrbX6W7W0KWz8GDJtUUtzmUb+bsi22MZZjm/fHaYT
         3sHw==
X-Gm-Message-State: AGi0PuaYRtiP2Duu5Di67v9RMBp4JVNKjDBgiO4lVJ5mSLds0p4gc4Yr
        v1t4/xRA3kzztwjbTk5us6D8W3yvRbX6C1Bq1EiYsBwYThO+WgLw52bgYVl0+TT/K9qAJlVIQpQ
        0I3UII2AlSHuVXdVwXIopaw7sWGblTwZ980Tzjix/peHmGyaEK5qO1R7KtJoAQCO9RK+BwNU=
X-Google-Smtp-Source: APiQypIIQlkCaX6bJWhHG4kmnfMkCHlcuy1qfAA357aSBf5DIUde8BulJxDuqS/1DEgn1C/NV2X5FLliT9xg
X-Received: by 2002:a05:620a:118b:: with SMTP id b11mr7521950qkk.82.1587706718313;
 Thu, 23 Apr 2020 22:38:38 -0700 (PDT)
Date:   Fri, 24 Apr 2020 01:38:18 -0400
Message-Id: <20200424053819.220276-1-jnchase@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH 1/2] dt-bindings: Add ch7322 as a trivial device
From:   Jeff Chase <jnchase@google.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, robh+dt@kernel.org,
        devicetree@vger.kernel.org, Jeff Chase <jnchase@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ch7322 is a Chrontel CEC controller.

Signed-off-by: Jeff Chase <jnchase@google.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 4165352a590a..ec2ddc6cdf9a 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -48,6 +48,8 @@ properties:
           - capella,cm32181
             # CM3232: Ambient Light Sensor
           - capella,cm3232
+            # CH7322: HDMI-CEC Controller
+          - chrontel,ch7322
             # High-Precision Digital Thermometer
           - dallas,ds1631
             # Total-Elapsed-Time Recorder with Alarm
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index d3891386d671..7794ffccd325 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -187,6 +187,8 @@ patternProperties:
     description: ChipOne
   "^chipspark,.*":
     description: ChipSPARK
+  "^chrontel,.*":
+    description: Chrontel, Inc.
   "^chrp,.*":
     description: Common Hardware Reference Platform
   "^chunghwa,.*":
-- 
2.26.2.303.gf8c07b1a785-goog

