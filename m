Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92514643878
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 23:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbiLEWyp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 17:54:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232805AbiLEWyo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 17:54:44 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5167A1836A
        for <linux-media@vger.kernel.org>; Mon,  5 Dec 2022 14:54:43 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 546BD1B00118
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 00:54:38 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1670280878;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=4itHRuMFVfvGnfwixJpN1jd2pneWjtRu5E1nf5SWiYc=;
        b=ospfGqw8/gcN1yIuMel13EebQvRLzvGwhuBhEq+Vy8i5+4SUJ8ZDjCIsnUpN7TJ9H5+3YN
        /BzMIt/YGUCFyKiCkBDIvuTNE/m/qY4YYFm62c8qJUIGLggXH/suh/YI/1xb0WxzoRSSm5
        cLri0e5Dbsasxvo5b1KCWCMkgGYEizFa73a0J3eRlVSKkZ83i/AWo/VJG2A/BJafmgjRG+
        cpH/r0ZhrbMuc14bH6HqtUSPkDL5pGt4Me1wnbFte8tmG9IIz84MWDXjgZ2KkXyMC1FPs4
        yXJc2J9GGkvZZf8RdOShAuLVNMgPw1whROdkDCIcSeT2wnSD8pBYwtsFCSM8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1670280878;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=4itHRuMFVfvGnfwixJpN1jd2pneWjtRu5E1nf5SWiYc=;
        b=ud/nWB7zXmPbjWYJ+zDfGqUU8/4BWP70dwDN8rhJcVmN2kTAOO5+iBCbaOvpmtObOXRfEu
        qJ8UOgS3wf5RCIlPdYX2eA9mJJ/UN9RhlGEe+74l2Zddb+uoRF5UGTzpufwIKo4Xu2lgka
        f1vnW4+N5cyNg7BxHx/UgTDw0WxxLJyZRJW/fcCrPiYjkKjmWz8TIN67OSQCiGrHVEjxoO
        1Sg+CIe2s7y7OnsuOEQEUHbBTaFruXO0hQvBKMw/DlUjwT8ZMi2kLnUWU0IYnX6GjQfZVt
        KLxksLngjOdB4uijK0lJCz2Jcm4LKhQIOT2NrM9jqj/+GfknLk5AIyPcyozYVA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1670280878; a=rsa-sha256;
        cv=none;
        b=S49tOynV6/0xEAjDgaZe/UWWVDiym975n1fcfW0ADBK/X0e3CgXw+6qcwyCDhD4BXYbIVL
        y64IRSOLY10h24KDrZlWjRq9oAaRn8xIhaNtKekiuIHAj30nlM8dEBGfdjIcdJSWhu5XON
        xMCZLhdgJ0P/usC0nChqoXusAUZOIh2eOwE89cQA+Lngew7n2cgpsWJFSCr3FO0yZmdtIE
        Fx0z0/4lqCQfwOFOqMUez/1uvulIqUgHmcNAiNAIq8EyFxA6QP5W4ItnuwIdyFteVTGjF3
        2tlDevJesawmMRibl5ULipLH4Phlhboo35jBYG/n8JA9k5RHoe3bbrhrQCDsNw==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E0D95634C95
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 00:54:37 +0200 (EET)
Date:   Tue, 6 Dec 2022 00:54:37 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.2] Sensor, Renesas CRU driver fixes
Message-ID: <Y452rTF+tW+mMEPY@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a set of fixes and a few trivial patches for 6.2. In particular, a
number of drivers were missing the MODIFY_LAYOUT flag on flip controls and
there are miscellaneous fixes for a few other drivers. Also included is a
new compatible string for ov9281 sensor in the ov9282 driver.

Please pull.


The following changes since commit 6a5a4514854a637d01c50f5ea17b28f78b31ddb8:

  media: ipu3-cio2: make the bridge depend on i2c (2022-11-25 11:49:20 +0000)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-6.2-4.2-signed

for you to fetch changes up to c9f0604eda9e7c4e874b1272492e503cca8d6439:

  media: i2c: ov08d10: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips (2022-12-05 23:25:39 +0200)

----------------------------------------------------------------
V4L2 patches for 6.2

----------------------------------------------------------------
Alexander Stein (2):
      media: dt-bindings: media: Add compatible for ov9281
      media: i2c: ov9282: Add ov9281 compatible

Dan Carpenter (1):
      media: rzg2l-cru: fix a test for timeout

Dave Stevenson (5):
      media: i2c: ov2680: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
      media: i2c: imx208: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
      media: i2c: imx319: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
      media: i2c: imx355: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
      media: i2c: ov08d10: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips

Guoniu.zhou (2):
      media: ov5640: set correct default link frequency
      media: ov5640: report correct frame rate to user

 .../devicetree/bindings/media/i2c/ovti,ov9282.yaml |  5 ++++-
 drivers/media/i2c/imx208.c                         |  4 ++++
 drivers/media/i2c/imx319.c                         |  4 ++++
 drivers/media/i2c/imx355.c                         |  4 ++++
 drivers/media/i2c/ov08d10.c                        |  5 +++++
 drivers/media/i2c/ov2680.c                         |  2 ++
 drivers/media/i2c/ov5640.c                         | 25 ++++++++++++----------
 drivers/media/i2c/ov9282.c                         |  5 ++++-
 .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |  2 +-
 9 files changed, 42 insertions(+), 14 deletions(-)

-- 
Kind regards,

Sakari Ailus
