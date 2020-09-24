Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 514E52777D9
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 19:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728694AbgIXRbk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 13:31:40 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:33711 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728628AbgIXRbh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 13:31:37 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 24 Sep 2020 10:31:37 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Sep 2020 10:31:35 -0700
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 24 Sep 2020 23:01:17 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 9088D4E7E; Thu, 24 Sep 2020 23:01:16 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH 0/2] Venus: fix handling of crop and s_fmt
Date:   Thu, 24 Sep 2020 23:01:12 +0530
Message-Id: <1600968674-11559-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dikshita Agarwal (1):
  venus: venc: update output format based on capture format.

Stanimir Varbanov (1):
  venus: venc: fix handlig of S_SELECTION and G_SELECTION

 drivers/media/platform/qcom/venus/venc.c | 48 ++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 21 deletions(-)

-- 
1.9.1

