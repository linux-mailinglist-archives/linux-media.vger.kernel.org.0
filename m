Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B26C78559D
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 12:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233961AbjHWKoy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 06:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbjHWKox (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 06:44:53 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2AB4CD5
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 03:44:50 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31ad779e6b3so4567209f8f.2
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 03:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692787489; x=1693392289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pw7uRDxDHWzanwFWC6cu/Ic6GDG9gB/18ZN2F+qUjNk=;
        b=rcV88RdZlHz0sgmgYKGVveY5Y36LWBZYeTAwZJURHThzo1L+grwdQyxTX+0+E3r/W4
         8LYIB80xP93k3L6UI7F3mxc23P8mxXteumexyr0tjzNAav6mHzKCNghgyS5e9aM8cvtD
         egLuHZvAyE9ZTur3POhtOKJYSYKYFe5PrtJyEt11pcOiV6gzUJuxnNVSgbqb8p1NfUlM
         595NSCqh/iPKDspWSJPdoEbRVcRMt9Od7TyzHQQI/EXTZRCNqTFSITaAIx7iMuByqJfd
         yda/IxLPtuGx3VCFv8B2L6DyDhmhCPd4Jk7cQWO3emdkjPjkJ2ILWNmjvyJKSMU7SKx9
         iEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692787489; x=1693392289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pw7uRDxDHWzanwFWC6cu/Ic6GDG9gB/18ZN2F+qUjNk=;
        b=TkZKT3kSydxcSDoDcVcHICK+VGNP6GQwc7LiwZcHDh7vRt3UfS2jZ3SlCKBPp2Psw+
         JLuQBHMPBGPMvggf4EO3LqldbIcudMw1k6OcQ3ghjjnrHrmfO7oLo0CxLSQUP46CM37c
         klzrRAHVurd9F4/eTFYBFlCueAUhRxYNQyGnZEFsFeBlyyQNi2tBgjdBmrb/r3uA5xYd
         UyQpZl9q7WYr4Voclp4u3JkS2uwo+zXzds58h0Q4Wfc0YGfop95++Rgor0V6oXOEkAFv
         pHys16iYNo46GorBfu9v1tT4DPYM5NnLYQFqiV4kR02U0bcK236XcSUcEnCfnmR9bDcJ
         z2Jw==
X-Gm-Message-State: AOJu0YwOKIJRlbzfjEtLmimWExc3mKKgh3RihmKCR1+LnH01jJN+n+21
        bkmIP5865qmOAi7WHoj7oBoQ1Q==
X-Google-Smtp-Source: AGHT+IFqTpZefIffB9EeZQeRT/4+kTT9Rs1VPpzDq+qAtmn5HLVcgmxta02JnzaOv1j2NOUqz9Unwg==
X-Received: by 2002:adf:f6c7:0:b0:319:8a21:6f9a with SMTP id y7-20020adff6c7000000b003198a216f9amr9454920wrp.63.1692787489193;
        Wed, 23 Aug 2023 03:44:49 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d4204000000b0031c5dda3aedsm6281213wrq.95.2023.08.23.03.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 03:44:48 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/15] media: qcom: camss: Add parameter passing to remove several outstanding bugs
Date:   Wed, 23 Aug 2023 11:44:29 +0100
Message-ID: <20230823104444.1954663-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V3:
- Adds RB/AB as indicated - Konrad
- Replaces >= SDM845 with helper function per discussion - bod/Konrad
- Leaves out constraining VFE clock names sizes. A full pass for resource strings will happen later. - bod
- Clarifies commit log resulting in updated patch title also
  "Add support for setting CSIPHY clock name csiphyX"
  ->
  "Fix support for setting CSIPHY clock name csiphyX"
- Adds patch to remove dead integer return type in vfe_disable()
- Adds patch to comment CSID dt_id meanining which I personally find non-obvious right now - bod

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/commits/09e7805a733b488c5dc19b301eb3b77cb0fad3d6

V2:
- Replaces &camss->res with pointer to res - Konrad
- Squashes patch for NULL removal - Konrad
- Left suggestion on ICC initialisation points alone, doesn't seem to fit Konrad/bod

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-08-07-db410c-rb3-camss-dts-v3+maintenance-bugfixes-v2

V1:
- I forgot to include patch # 14 in V0 of this series.
  This patch leverages previous changes to unwind the fixed polling of
  RDI[0..2] allowing driver data to articulate on a per-VFE basis how many
  RDIs to poll.

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-08-07-db410c-rb3-camss-dts-v3+maintenance-bugfixes-v1

V0:
This second series of bugfixes stacks ontop of the Fixes series sent earlier.

Link: https://lore.kernel.org/linux-arm-msm/20230814141007.3721197-1-bryan.odonoghue@linaro.org/T/#t

Rather than send both series as one giant series, I opted to send a pure
Fixes series above, with this second series a non-backport series i.e. no
Fixes tags in this series.

The existing CAMSS code relies on some hard-coded parameters buried inside
of the driver, instead of passed via compat .data as arguably ought to be
the case.

This brittle model is an extending morass of spaghetti code. More than that
in CAMSS Video Front Ends (VFEs) and the number of Raw Data Interfaces
(RDIs) per VFE can vary from SoC to SoC. Indeed sm8250 has VFE and VFE Lite
blocks which have a different number of RDIs per block.

The use of defines as opposed to per-compat parameters inside of ISRs leads
to either under-polling or over-polling the number of RDIs.

On top of all of that we have some hard-coded statements for clock names
which breaks easily.

We can solve the under/over polling loop problem by transitioning loop
controls from macros to parameters passed via probe().

Similarly and unsurprisingly we can also solve the hard-coded clock problem
by adding some string processing routines that take passed arguments.

There is still some additional maintenance work to be done in this driver
but before adding one more SoC the code needs to be made more extensible
and less brittle.

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/commits/dc346c7f46c0680bcfb84fded6db97497fffe49a

Bryan O'Donoghue (15):
  media: qcom: camss: Amalgamate struct resource with struct
    resource_ispif
  media: qcom: camss: Start to move to module compat matched resources
  media: qcom: camss: Pass icc bandwidth table as a platform parameter
  media: qcom: camss: Pass remainder of variables as resources
  media: qcom: camss: Pass line_num from compat resources
  media: qcom: camss: Assign the correct number of RDIs per VFE
  media: qcom: camss: Capture VFE CSID dependency in a helper function
  media: qcom: camss: Untangle if/else spaghetti in camss
  media: qcom: camss: Improve error printout on icc_get fail
  media: qcom: camss: Allow clocks vfeN vfe_liteN or vfe_lite
  media: qcom: camss: Functionally decompose CSIPHY clock lookups
  media: qcom: camss: Fix support for setting CSIPHY clock name csiphyX
  media: qcom: camss: Support RDI3 for VFE 17x
  media: qcom: camss: Convert vfe_disable() from int to void
  media: qcom: camss: Comment CSID dt_id field

 .../platform/qcom/camss/camss-csid-gen2.c     |   5 +
 .../media/platform/qcom/camss/camss-csid.c    |  40 ++-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |   8 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |  67 ++--
 .../media/platform/qcom/camss/camss-ispif.c   |  32 +-
 .../media/platform/qcom/camss/camss-ispif.h   |   4 +-
 .../media/platform/qcom/camss/camss-vfe-170.c |  22 +-
 .../media/platform/qcom/camss/camss-vfe-4-1.c |   2 -
 .../media/platform/qcom/camss/camss-vfe-4-7.c |   2 -
 .../media/platform/qcom/camss/camss-vfe-4-8.c |   2 -
 .../media/platform/qcom/camss/camss-vfe-480.c |  10 +-
 .../platform/qcom/camss/camss-vfe-gen1.c      |   5 +-
 .../platform/qcom/camss/camss-vfe-gen1.h      |   3 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |  83 +++--
 drivers/media/platform/qcom/camss/camss-vfe.h |   2 +-
 .../media/platform/qcom/camss/camss-video.c   |  16 +-
 drivers/media/platform/qcom/camss/camss.c     | 293 +++++++++---------
 drivers/media/platform/qcom/camss/camss.h     |  31 +-
 18 files changed, 352 insertions(+), 275 deletions(-)

-- 
2.41.0

