Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C37446CF579
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 23:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjC2VnR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 17:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjC2VnQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 17:43:16 -0400
Received: from www.linuxtv.org (www.linuxtv.org [130.149.80.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF21840C6
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 14:43:15 -0700 (PDT)
Received: from builder.linuxtv.org ([140.211.167.10] helo=slave0)
        by www.linuxtv.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <jenkins@linuxtv.org>)
        id 1phdZa-009Mjv-2K; Wed, 29 Mar 2023 21:43:14 +0000
Received: from ip6-localhost ([::1] helo=localhost.localdomain)
        by slave0 with esmtp (Exim 4.94.2)
        (envelope-from <jenkins@linuxtv.org>)
        id 1phdZW-00AVHa-Q4; Wed, 29 Mar 2023 21:43:10 +0000
From:   Jenkins <jenkins@linuxtv.org>
To:     mchehab@kernel.org, linux-media@vger.kernel.org,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc:     builder@linuxtv.org
Subject: Re: [GIT PULL FOR v6.4] Venus updates (#90896)
Date:   Wed, 29 Mar 2023 21:43:10 +0000
Message-Id: <20230329214310.2503484-1-jenkins@linuxtv.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230329211655.100276-1-stanimir.k.varbanov@gmail.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: builder@linuxtv.org

Pull request: https://patchwork.linuxtv.org/project/linux-media/patch/20230329211655.100276-1-stanimir.k.varbanov@gmail.com/
Build log: https://builder.linuxtv.org/job/patchwork/293481/
Build time: 00:00:00
Link: https://lore.kernel.org/linux-media/20230329211655.100276-1-stanimir.k.varbanov@gmail.com

gpg: Signature made Wed 29 Mar 2023 09:00:32 PM UTC
gpg:                using RSA key E1558C2497CE3CCC2B5AA30F25B55FC81B7035F2
gpg: Good signature from "Stanimir Varbanov <stanimir.varbanov@linaro.org>" [expired]
gpg: Note: This key has expired!
Primary key fingerprint: 34CF E039 8A16 AD93 18FD  D5E8 A6D0 26D8 E358 14D4
     Subkey fingerprint: E155 8C24 97CE 3CCC 2B5A  A30F 25B5 5FC8 1B70 35F2


Build aborted due to a fatal error:
FAILED: patch patch patches/0006-media-dt-bindings-qcom-venus-cleanup.patch doesn't apply:
Applying patch patches/0006-media-dt-bindings-qcom-venus-cleanup.patch
patching file Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
Hunk #1 FAILED at 1.
Hunk #2 FAILED at 97.
2 out of 2 hunks FAILED -- rejects in file Documentation/devicetree/bindings/media/qcom,msm8916-venus.yaml
patching file Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
Hunk #1 FAILED at 1.
Hunk #2 FAILED at 124.
2 out of 2 hunks FAILED -- rejects in file Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
patching file Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
Hunk #1 FAILED at 1.
Hunk #2 FAILED at 116.
2 out of 2 hunks FAILED -- rejects in file Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
patching file Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
Hunk #1 FAILED at 1.
Hunk #2 FAILED at 116.
2 out of 2 hunks FAILED -- rejects in file Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
patching file Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
Hunk #1 FAILED at 1.
Hunk #2 FAILED at 133.
2 out of 2 hunks FAILED -- rejects in file Documentation/devicetree/bindings/media/qcom,sdm660-venus.yaml
patching file Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
Hunk #1 FAILED at 1.
Hunk #2 FAILED at 111.
2 out of 2 hunks FAILED -- rejects in file Documentation/devicetree/bindings/media/qcom,sdm845-venus-v2.yaml
patching file Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
Hunk #1 FAILED at 1.
Hunk #2 FAILED at 125.
2 out of 2 hunks FAILED -- rejects in file Documentation/devicetree/bindings/media/qcom,sdm845-venus.yaml
patching file Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
Hunk #1 FAILED at 1.
Hunk #2 FAILED at 126.
2 out of 2 hunks FAILED -- rejects in file Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
Patch patches/0006-media-dt-bindings-qcom-venus-cleanup.patch can be reverse-applied

