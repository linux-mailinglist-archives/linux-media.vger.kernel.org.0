Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD20E464DDC
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 13:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245019AbhLAMcV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 07:32:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234810AbhLAMcU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 07:32:20 -0500
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C188CC061574
        for <linux-media@vger.kernel.org>; Wed,  1 Dec 2021 04:28:59 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id sOjImcfWcf6qjsOjImEeRc; Wed, 01 Dec 2021 13:28:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1638361737; bh=EokCcdu4ROqtGzlzLBuoEu4HMJ6TJyU20VQjG0GUnx0=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Auar+ZUFrWHQp46xCAN7RzN5NLwI+XOzJ4R+c+Hig0hDwR7+dSaAcd+j/Wog5WKn6
         HRAdrVN2HClOrwxx0Sm9IhgyMpDT2qJtb8cSHw3d3GGzkyODzTlKqYVRAZCkK7DNHS
         bmxZx7ZC2TDkXbQ0KavLiu9vXJzoh49UyKLjaEpWvN6Zd0JwrDIn+41GYnN9XLb7+a
         Wi+RUdkro9I0loxEF0KAK11LdH1BDuQbx4jido92DUpId1tjzOytwtXeCgG4al4uP0
         kUOVoq1Wl+F+BK0q6RoIV5Kju9HGPBhC+Rf0y72yf/qRebXhAx+mL/VTA3fFjiaa2D
         K4TuFxmcpiZ3w==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] cec-pin: drop unused 'enabled' field from struct cec_pin
Message-ID: <e433479f-42e8-bbf1-d661-d8895fc30ceb@xs4all.nl>
Date:   Wed, 1 Dec 2021 13:28:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This field is only set, but never used. Drop it.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-pin-priv.h | 1 -
 drivers/media/cec/core/cec-pin.c      | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/media/cec/core/cec-pin-priv.h b/drivers/media/cec/core/cec-pin-priv.h
index fb101f15865c..7bad5a0b7cb7 100644
--- a/drivers/media/cec/core/cec-pin-priv.h
+++ b/drivers/media/cec/core/cec-pin-priv.h
@@ -170,7 +170,6 @@ struct cec_pin {
 	ktime_t				ts;
 	unsigned int			wait_usecs;
 	u16				la_mask;
-	bool				enabled;
 	bool				monitor_all;
 	bool				rx_eom;
 	bool				enable_irq_failed;
diff --git a/drivers/media/cec/core/cec-pin.c b/drivers/media/cec/core/cec-pin.c
index 178edc85dc92..21f0f749713e 100644
--- a/drivers/media/cec/core/cec-pin.c
+++ b/drivers/media/cec/core/cec-pin.c
@@ -1125,7 +1125,6 @@ static int cec_pin_adap_enable(struct cec_adapter *adap, bool enable)
 {
 	struct cec_pin *pin = adap->pin;

-	pin->enabled = enable;
 	if (enable) {
 		atomic_set(&pin->work_pin_num_events, 0);
 		pin->work_pin_events_rd = pin->work_pin_events_wr = 0;
-- 
2.33.0

