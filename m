Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0605184577
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:04:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgCMLEL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:04:11 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]:54039 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbgCMLEI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:04:08 -0400
Received: by mail-wm1-f51.google.com with SMTP id 25so9443215wmk.3
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2020 04:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w2E4KEZKaVDRYwIZNq87wG0kGHEBrb12/0HT+rY65w0=;
        b=Vjrkrms13ezAAsNBrf4Aw3643PvilA7lHREO2Rje7EPz5HKIhn6PK7nFyIG10khzhI
         gjQgVYI8w2j/TCZmWE4/qsTEYFwgLErPxhhX893U8Qg0gq9D23tV/AanxjmUS6mGI7Nu
         dJ4WZmX8l5nPI005siYUimKql3oZc062Ruvly56AaIpSlKikWM42Xx1/SNfXR456D2Uy
         4Nm2keDF+/LIPRvjYhJV2u7oMLrc19xBe1vjw15IUjIYCoZo/T3dhg3wCCaCvMqdJ7vK
         loIGsgKy0neWEonPTWCs9EQ/OXPNeJ3yGblU/tp9iKqPmCNVyYHyg23E0FwcfUVKbe7H
         A4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w2E4KEZKaVDRYwIZNq87wG0kGHEBrb12/0HT+rY65w0=;
        b=df2oaZNhulAAQ74ed+hqGOav1RkXUyPZZ1sKAPxVZiDGIuesWo4jeRlqrGPQl3k1Le
         r/R5j8NWwUmnIeVN/jXxen8n/fYxwblhqCDVEvH0g3vumDUfA4uPJjqb05GwyEB5BXOw
         oQRswg5UcQ59DbPYg5RG3VMlNhvxqQMrqL+gUai0nuEwlC3EH3gftup5cafGZO6VS51L
         sGAQQbxoCLgetKsATcTJUaxUVYDvVe1tAFIeIjw2dsVMnFs9jmdLBvLsULiMOjWPon2u
         LyFCw/HA4EHaTipKY5NMXE8kT4Zez1j5EoRDSV7td0MDSrsyGiepbHhyDW63OBPBKLd9
         XDhw==
X-Gm-Message-State: ANhLgQ1oU4VUd/Ez4IJPn285UpN7XiJzaRKypyYDjbOMEOuFNqt3gS1V
        BH/SI/LLzTEGtZGd+YAKnmDyCEMayC4=
X-Google-Smtp-Source: ADFU+vt0bW6bGGlAkijDQUDmrP+c49Qo/GdKOBADGoqQJMl248Gzb6VsDZxp8+EgPXENT81KeoRFXw==
X-Received: by 2002:a1c:4f:: with SMTP id 76mr10541710wma.28.1584097446011;
        Fri, 13 Mar 2020 04:04:06 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:c814:5be4:577e:3bd5])
        by smtp.gmail.com with ESMTPSA id r23sm23578052wrr.93.2020.03.13.04.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 04:04:05 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v2 0/3] media: ov8856: Add devicetree support
Date:   Fri, 13 Mar 2020 12:03:47 +0100
Message-Id: <20200313110350.10864-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
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

 .../devicetree/bindings/media/i2c/ov8856.yaml | 133 +++++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/ov8856.c                    | 151 +++++++++++++++++-
 3 files changed, 283 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml

-- 
2.20.1

