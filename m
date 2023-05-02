Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 057A36F41CF
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 12:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232402AbjEBKhW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 May 2023 06:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234049AbjEBKgb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 May 2023 06:36:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA0640C2
        for <linux-media@vger.kernel.org>; Tue,  2 May 2023 03:36:09 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28F42802;
        Tue,  2 May 2023 12:36:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683023764;
        bh=gL7eDbeheGEyhsaIBQbN8PNTAxD9jV2x3ibNKv4K1JE=;
        h=From:To:Cc:Subject:Date:From;
        b=BF1yaWdnFn1R1m+GQzG/XqgbZ2mkkWSgR8WF09y/nVygXcMRMOxZ4xT+/9EtsPzfN
         wLWIZVQewuH15Z/ElYoOmtaERzF2fT7BGth09VJLXahUOXbJOSlxjuWL5dUWhpEfOL
         XI/vLOU4rSRV8spcHDdr/l46hmmEiozqxHhggj8c=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Mickael Guene <mickael.guene@st.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     hugues.fruchet@foss.st.com, alain.volmat@foss.st.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 0/2] ST MIPID02 bridge format propagation fixes
Date:   Tue,  2 May 2023 11:35:45 +0100
Message-Id: <20230502103547.150918-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all 

This small patchset just fixes some issues with format propagation in the MIPID02
bridge driver, which was either failing to propagate formats from sink to source
pad at all or else propagating the ACTIVE format to the source when the sink's
TRY format was set.

Thanks
Dan

Daniel Scally (2):
  media: i2c: Correct format propagation for st-mipid02
  media: i2c: Propagate format from sink to source pad

 drivers/media/i2c/st-mipid02.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
2.34.1

