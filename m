Return-Path: <linux-media+bounces-41953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15416B48475
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 08:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C07463A6C15
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 06:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC912E1EE2;
	Mon,  8 Sep 2025 06:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIM5WRix"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F21D258A
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 06:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757314305; cv=none; b=Ebo1/bzKARg1MWcSaU/5QTxPMilBuFxVWf86KL8gHLXo1p/QaaAZLf2E71m2ZIeNiLAamdRtAXu4YA4ZDmIDpGNvq1R+QU20XvF2q7x7/j3hVPvMZs8g/L4GqjPJRu2E7AzUJiq19SLwZeFhSD6TaEIKjL4WZi+mOH0YBOSA1qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757314305; c=relaxed/simple;
	bh=NrwrKeFcYHIO59UOFYm+kQq8SoXUJFTsLliofbq1PLQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=GQqlhYxU961DsPgKJaP+hoZIrGFqnxIsmhsLGhOzg+t+EO+30hOHeOFtd47v7Nd0ZVRIcBliO7jXQLcGHvNrOPirq5CWakjqysOc5LdsfxkB1RdupaaVtvdsKLTa+yAVpkkVAMam3ub+UZeESorhFYOo0NQt8+YUsWviic253zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BIM5WRix; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCDE1C4CEF5
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 06:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757314305;
	bh=NrwrKeFcYHIO59UOFYm+kQq8SoXUJFTsLliofbq1PLQ=;
	h=Date:From:Subject:To:From;
	b=BIM5WRixhrW4YWOdxCL//FOPMXrjfjCAvunPVztcN9HVCrdEETlN6JYmBeJvS4rXU
	 EG0Xel8Vr2HM+7xLg3v3xJi2cOOUtTw9D3JethNlM3hAl0x0Imgkj4H6tb67bYG1eQ
	 9qWmKyFNElRS2O8Q4x8U+L+WlAxHf8z5HY4+iUBD/aYH4OE/gKvx8GMRVfVipFKSmD
	 8rf6CzWnGjNtdX+qcQjMce5tcE7evoiLMQppHhKuoF5jM4rwJmH1mEIoYItQeYcQ/Z
	 b4OPc0DcxRr+gmhNv8ZINuZu9Rps7rJ8sNz66ySqgxkM4tvCXoYKQhjUCkXCkOZqaB
	 Lo35jO9gbudlA==
Message-ID: <25d4b492-7ea1-4a92-887c-ddd7c64dc0c3@kernel.org>
Date: Mon, 8 Sep 2025 08:51:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [PATCH] cec-compliance: fix Vendor Command With ID vivid tests
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The vivid driver handled <Vendor Command With ID> incorrectly
if an unknown Vendor ID was used. This is now fixed, but as a
result the adapter tests in cec-compliance also have to be fixed.

According to the spec, if the given Vendor ID is unknown, then,
if it is a broadcast message, the command must be ignored, and
if it is a directed message, then it should be Feature Aborted.

This patch adds a test for the case of a broadcast message, and
fixes the test for a directed message, checking for Feature Abort
instead of expecting it to be ignored.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
Here is the vivid patch:

https://patchwork.linuxtv.org/project/linux-media/patch/5b0cbda3-0c70-4022-9d88-de9fd372d27d@kernel.org/
---
 utils/cec-compliance/cec-test-adapter.cpp | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-compliance/cec-test-adapter.cpp
index 0743b9b3..18b2a065 100644
--- a/utils/cec-compliance/cec-test-adapter.cpp
+++ b/utils/cec-compliance/cec-test-adapter.cpp
@@ -420,8 +420,8 @@ static int testTransmit(struct node *node)
 				const __u8 *vendor_data;
 				__u8 vendor_cmd = 0x11;

-				// Test that an invalid vendor ID is ignored
-				cec_msg_init(&msg, la, i);
+				// Test that a broadcast of an invalid vendor ID is ignored
+				cec_msg_init(&msg, la, CEC_LOG_ADDR_BROADCAST);
 				cec_msg_vendor_command_with_id(&msg, node->vendor_id + 1, 1, &vendor_cmd);
 				msg.flags = CEC_MSG_FL_REPLY_VENDOR_ID;
 				msg.reply = vendor_cmd + 2;
@@ -429,6 +429,15 @@ static int testTransmit(struct node *node)
 				fail_on_test(!(msg.rx_status & CEC_RX_STATUS_TIMEOUT));
 				fail_on_test(!(msg.flags & CEC_MSG_FL_REPLY_VENDOR_ID));

+				// Test that an invalid vendor ID is feature aborted
+				cec_msg_init(&msg, la, i);
+				cec_msg_vendor_command_with_id(&msg, node->vendor_id + 1, 1, &vendor_cmd);
+				msg.flags = CEC_MSG_FL_REPLY_VENDOR_ID;
+				msg.reply = vendor_cmd + 2;
+				fail_on_test(doioctl(node, CEC_TRANSMIT, &msg));
+				fail_on_test(!(msg.rx_status & CEC_RX_STATUS_FEATURE_ABORT));
+				fail_on_test(!(msg.flags & CEC_MSG_FL_REPLY_VENDOR_ID));
+
 				// The vivid driver will reply with value vendor_cmd + 1, so
 				// waiting for different reply must time out
 				cec_msg_init(&msg, la, i);
-- 
2.47.2


