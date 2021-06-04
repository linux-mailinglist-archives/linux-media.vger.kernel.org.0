Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF94C39AF29
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 02:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbhFDAoO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 20:44:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:33292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229576AbhFDAoO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Jun 2021 20:44:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1379E613F3;
        Fri,  4 Jun 2021 00:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622767348;
        bh=s1rtVTHyXwvAr6F8HGorT4iDlSpFIZ24kdWlERtgjew=;
        h=Date:From:To:Cc:Subject:From;
        b=P6dgPKsj2sREfUBkwGL5hIpSpbV+cTTeM7z2OUANyGkTsRq/tiikTfjL9kHnxldPX
         Sjzy6xLe7pEh5r+ldlyva77/vsglEjerFJ7zhborgKr1kj8EfXF5UtEFkZ95dfiwOP
         YQXjSrDmBrtFTmPeSBJjrAJTEoT0tY3Nuf50NqxNd0svVPTrnE1eCGqH2Vkxg62j1K
         ecKckWqLGVcjuSniDyEPe7aScGQeha44vNxyfxG356zfcNqJibA99o7+9IGlcEd3Ak
         vWCzACZ/ZCc2zk60XJwC2OPQFavkvxn6YxdI/cf4Y7AQ4WPHuKBc767me4zSDTbeji
         nxNCJcC85n48Q==
Date:   Thu, 3 Jun 2021 19:43:38 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org, Kees Cook <keescook@chromium.org>
Subject: [PATCH v2][next] media: venus: hfi_msgs.h: Replace one-element
 arrays with flexible-array members
Message-ID: <20210604004338.GA140710@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a regular need in the kernel to provide a way to declare having
a dynamically sized set of trailing elements in a structure. Kernel code
should always use “flexible array members”[1] for these cases. The older
style of one-element or zero-length arrays should no longer be used[2].

Use flexible-array members in struct hfi_msg_sys_property_info_pkt and
hfi_msg_session_property_info_pkt instead of one-element arrays, and
refactor the code accordingly.

Also, this helps with the ongoing efforts to enable -Warray-bounds by
fixing the following warnings:

  CC [M]  drivers/media/platform/qcom/venus/hfi_msgs.o
drivers/media/platform/qcom/venus/hfi_msgs.c: In function ‘hfi_sys_property_info’:
drivers/media/platform/qcom/venus/hfi_msgs.c:246:35: warning: array subscript 1 is above array bounds of ‘u32[1]’ {aka ‘unsigned int[1]’} [-Warray-bounds]
  246 |  if (req_bytes < 128 || !pkt->data[1] || pkt->num_properties > 1)
      |                          ~~~~~~~~~^~~
drivers/media/platform/qcom/venus/hfi_msgs.c: In function ‘hfi_session_prop_info’:
drivers/media/platform/qcom/venus/hfi_msgs.c:342:62: warning: array subscript 1 is above array bounds of ‘u32[1]’ {aka ‘unsigned int[1]’} [-Warray-bounds]
  342 |  if (!req_bytes || req_bytes % sizeof(*buf_req) || !pkt->data[1])
      |                                                     ~~~~~~~~~^~~

[1] https://en.wikipedia.org/wiki/Flexible_array_member
[2] https://www.kernel.org/doc/html/v5.9/process/deprecated.html#zero-length-and-one-element-arrays

Link: https://github.com/KSPP/linux/issues/79
Link: https://github.com/KSPP/linux/issues/109
Co-developed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v2:
 - Fix packet size calculation by adding member _property_ to
   both structutures hfi_msg_sys_property_info_pkt and
   hfi_msg_session_property_info_pkt, and refactor the code
   accordingly.

JFYI: We are about to be able to globally enable -Warray-bounds and,
these are pretty much the last out-of-bounds warnings in linux-next. :)

 drivers/media/platform/qcom/venus/hfi_msgs.c | 16 ++++++++--------
 drivers/media/platform/qcom/venus/hfi_msgs.h |  6 ++++--
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
index a2d436d407b2..d9fde66f6fa8 100644
--- a/drivers/media/platform/qcom/venus/hfi_msgs.c
+++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
@@ -251,11 +251,11 @@ sys_get_prop_image_version(struct device *dev,
 
 	req_bytes = pkt->hdr.size - sizeof(*pkt);
 
-	if (req_bytes < VER_STR_SZ || !pkt->data[1] || pkt->num_properties > 1)
+	if (req_bytes < VER_STR_SZ || !pkt->data[0] || pkt->num_properties > 1)
 		/* bad packet */
 		return;
 
-	img_ver = (u8 *)&pkt->data[1];
+	img_ver = pkt->data;
 
 	dev_dbg(dev, VDBGL "F/W version: %s\n", img_ver);
 
@@ -277,7 +277,7 @@ static void hfi_sys_property_info(struct venus_core *core,
 		return;
 	}
 
-	switch (pkt->data[0]) {
+	switch (pkt->property) {
 	case HFI_PROPERTY_SYS_IMAGE_VERSION:
 		sys_get_prop_image_version(dev, pkt);
 		break;
@@ -338,7 +338,7 @@ session_get_prop_profile_level(struct hfi_msg_session_property_info_pkt *pkt,
 		/* bad packet */
 		return HFI_ERR_SESSION_INVALID_PARAMETER;
 
-	hfi = (struct hfi_profile_level *)&pkt->data[1];
+	hfi = (struct hfi_profile_level *)&pkt->data[0];
 	profile_level->profile = hfi->profile;
 	profile_level->level = hfi->level;
 
@@ -355,11 +355,11 @@ session_get_prop_buf_req(struct hfi_msg_session_property_info_pkt *pkt,
 
 	req_bytes = pkt->shdr.hdr.size - sizeof(*pkt);
 
-	if (!req_bytes || req_bytes % sizeof(*buf_req) || !pkt->data[1])
+	if (!req_bytes || req_bytes % sizeof(*buf_req) || !pkt->data[0])
 		/* bad packet */
 		return HFI_ERR_SESSION_INVALID_PARAMETER;
 
-	buf_req = (struct hfi_buffer_requirements *)&pkt->data[1];
+	buf_req = (struct hfi_buffer_requirements *)&pkt->data[0];
 	if (!buf_req)
 		return HFI_ERR_SESSION_INVALID_PARAMETER;
 
@@ -391,7 +391,7 @@ static void hfi_session_prop_info(struct venus_core *core,
 		goto done;
 	}
 
-	switch (pkt->data[0]) {
+	switch (pkt->property) {
 	case HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS:
 		memset(hprop->bufreq, 0, sizeof(hprop->bufreq));
 		error = session_get_prop_buf_req(pkt, hprop->bufreq);
@@ -404,7 +404,7 @@ static void hfi_session_prop_info(struct venus_core *core,
 	case HFI_PROPERTY_CONFIG_VDEC_ENTROPY:
 		break;
 	default:
-		dev_dbg(dev, VDBGM "unknown property id:%x\n", pkt->data[0]);
+		dev_dbg(dev, VDBGM "unknown property id:%x\n", pkt->property);
 		return;
 	}
 
diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.h b/drivers/media/platform/qcom/venus/hfi_msgs.h
index 526d9f5b487b..510513697335 100644
--- a/drivers/media/platform/qcom/venus/hfi_msgs.h
+++ b/drivers/media/platform/qcom/venus/hfi_msgs.h
@@ -113,7 +113,8 @@ struct hfi_msg_sys_ping_ack_pkt {
 struct hfi_msg_sys_property_info_pkt {
 	struct hfi_pkt_hdr hdr;
 	u32 num_properties;
-	u32 data[1];
+	u32 property;
+	u8 data[];
 };
 
 struct hfi_msg_session_load_resources_done_pkt {
@@ -233,7 +234,8 @@ struct hfi_msg_session_parse_sequence_header_done_pkt {
 struct hfi_msg_session_property_info_pkt {
 	struct hfi_session_hdr_pkt shdr;
 	u32 num_properties;
-	u32 data[1];
+	u32 property;
+	u8 data[];
 };
 
 struct hfi_msg_session_release_resources_done_pkt {
-- 
2.27.0

