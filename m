Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E95A55C1C5
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 14:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345632AbiF1MOB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 08:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344914AbiF1MN7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 08:13:59 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5C2A2317D
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 05:13:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id F3707CE1FAF
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 12:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E0BC3411D;
        Tue, 28 Jun 2022 12:13:54 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: [PATCH 0/3] v4l2-ctl/compliance: improve array control tests
Date:   Tue, 28 Jun 2022 14:13:49 +0200
Message-Id: <20220628121352.2916813-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The first patch adds support for dynamic array controls. The second
patch add tests for the vivid pixel array control that changes dimensions
when the video format changes. The last patch tests support for the vivid
pixel array control in a request.

It tests the control framework patch series posted here:

https://patchwork.linuxtv.org/project/linux-media/cover/20220628120523.2915913-1-hverkuil-cisco@xs4all.nl/

Regards,

	Hans

Hans Verkuil (3):
  v4l2-compliance/ctl: add dynamic array support
  v4l2-compliance: check vivid pixel array control behavior
  v4l2-compliance: test of vivid's pixel array in requests

 include/linux/videodev2.h                     |   1 +
 utils/common/v4l2-info.cpp                    |   1 +
 utils/v4l2-compliance/v4l2-compliance.h       |   2 +
 utils/v4l2-compliance/v4l2-test-buffers.cpp   | 149 +++++++++++++++++-
 utils/v4l2-compliance/v4l2-test-controls.cpp  | 147 +++++++++++++++++
 .../v4l2-test-input-output.cpp                |  48 ++++++
 utils/v4l2-ctl/v4l2-ctl-common.cpp            |   7 +
 7 files changed, 354 insertions(+), 1 deletion(-)

-- 
2.35.1

