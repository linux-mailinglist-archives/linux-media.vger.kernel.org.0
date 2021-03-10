Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3999C333731
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 09:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbhCJIWF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 03:22:05 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:50389 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229632AbhCJIVh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 03:21:37 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Ju60lKI7OC40pJu63lIWI7; Wed, 10 Mar 2021 09:21:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615364496; bh=+lQo+Brb4MfuYctxU4KmpvRL9UbXAOeb6TVZHUlIV/8=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=oZGZ3Thi6yUBjXfKGuzOpV4+HtVaAOhGdasR8Q9Ej88mwzq0xCX9BPTZLoznCkKee
         KNkaOzSVgB4VnPnr8qskr1v14xo/quxJIix99cT0elvroXdV5RtOPQ7JDoU2dbRPpQ
         zpWVM8R0jxYyv/pegLTuWFe67X6Z0DzHFxBo4zdDaORlAm8pztk7i+KgpO7njJYjJY
         jWAmxla5dpCK6yM2gq3JLI3y1f31qbeZvyVB+TMirwFAsPV+VQFV3t6Iwtlw8BG0Ul
         SQtZW6+ANEc6ANM8CKCBKsFwAbfxo1/m7CkEvA8YA1yzVn9Y4hiTe7TafJCyJBrCDx
         VPT13geWFVZpA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Johan Fjeldtvedt <johfjeld@cisco.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] cec/core/cec-notifier: use IS_REACHABLE(CONFIG_I2C)
Message-ID: <4ffc1ae3-c92d-03d9-009a-34365e9715f0@xs4all.nl>
Date:   Wed, 10 Mar 2021 09:21:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfC2/0Dt+vAo/dg0Ucy2a7745ZI//2T5P2ShkWWgEqxHEZN5NkzMvueDDcRK4RJySXmaR/aihNnnukCKkhu8R5+mAihD0tH52hPEaq7UEACXCdz/xUpIQ
 2+7Bq6hn3mP0FprI7Uv4q3bGeZxC9A45JUTaGc/eUrHKq3xR1tiRf7zaUi2J7tCcEUW4CE8E8l77g3T3fe+0u2u7a5EH/PUxrI668o4S7myMkiyBBtB0XvPU
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If CONFIG_I2C=m and CONFIG_CEC_CORE=y then of_find_i2c_device_by_node()
is not reachable. So use IS_REACHABLE instead of IS_ENABLED.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: a62943c145c1 ("media: cec-notifier: also search for HDMI devices on I2C")
Reported-by: kernel test robot <lkp@intel.com>
---
diff --git a/drivers/media/cec/core/cec-notifier.c b/drivers/media/cec/core/cec-notifier.c
index 00bc00f7491f..389dc664b211 100644
--- a/drivers/media/cec/core/cec-notifier.c
+++ b/drivers/media/cec/core/cec-notifier.c
@@ -226,7 +226,7 @@ struct device *cec_notifier_parse_hdmi_phandle(struct device *dev)
 	hdmi_pdev = of_find_device_by_node(np);
 	if (hdmi_pdev)
 		hdmi_dev = &hdmi_pdev->dev;
-#if IS_ENABLED(CONFIG_I2C)
+#if IS_REACHABLE(CONFIG_I2C)
 	if (!hdmi_dev) {
 		struct i2c_client *hdmi_client = of_find_i2c_device_by_node(np);

