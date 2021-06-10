Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 053C63A244E
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 08:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbhFJGNl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 02:13:41 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:57275 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229740AbhFJGNl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 02:13:41 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rDuml5SfWhqltrDuqlWSSF; Thu, 10 Jun 2021 08:11:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623305504; bh=P2OeFkwNOpkS8x8TMF1SF/nr7rZZKLTA2gQ20AHnSl4=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=We00TN6/+oa4FmPU27rhaXx/XMX9oCVPMr+sJgiuZ7UGgblJTaghXsu8/8AnDgzck
         uucxXpHobTIWyMEHwtDURxLs3tCUaMOtTK8yoJjjgBWNR634jv/In9UuNWmXZw0pQ5
         bXDM3jxCHSo6Zv1P92fJaKeb4nTv8J/l/kNsQkGSTm+KgI/qlgryRSwVcLE7U98Ayu
         50JlnsH5MBu150duX3LE5vwaXMO4+wZebvf5BGKJHZY8aeg1tSpafgW8ZZiYnNTMpP
         TGej5RB1k0d59+jXikFvnMoNlThpzYrgXISG0V1PcFKOu5zYv+OXItkhgNpQO1iUU9
         XXxe8/4wTpoXQ==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] adv7842: remove spurious & and fix vga_edid size
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <2ca8a9d9-c96d-f525-8bd3-5b72f5bbc5ef@xs4all.nl>
Date:   Thu, 10 Jun 2021 08:11:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfApGYGSSqHG2YjLR6a7EJDsVNbbiy0dsG8/Gheed6KRQz3SvOKk5KiKKLImuFIRWICkx/1l7en9VPQc3cYrf7JezpH+oTeLhBvcAi8i4wnuHI/t9KhEN
 /8sVFI0bRhT6mUTV10u5m8hinhaPGcSVO++kEEHsel21MRWWcksWsZ7hurQILyy+0N0q+EzbTB9ez/CLx1599KcAhumDWiRMAyA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No need to use & to get the start address of an array.

Fix the size of vga_edid.edid to a single block (128 bytes) to fix
this smatch error:

adv7842.c:2538 adv7842_set_edid() error: memcpy() '&state->vga_edid.edid' too small (128 vs 512)

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 78e61fe6f2f0..21dde17e6b37 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -2531,20 +2531,20 @@ static int adv7842_set_edid(struct v4l2_subdev *sd, struct v4l2_edid *e)

 	switch (e->pad) {
 	case ADV7842_EDID_PORT_VGA:
-		memset(&state->vga_edid.edid, 0, sizeof(state->vga_edid.edid));
+		memset(state->vga_edid.edid, 0, sizeof(state->vga_edid.edid));
 		state->vga_edid.blocks = e->blocks;
 		state->vga_edid.present = e->blocks ? 0x1 : 0x0;
 		if (e->blocks)
-			memcpy(&state->vga_edid.edid, e->edid, 128 * e->blocks);
+			memcpy(state->vga_edid.edid, e->edid, 128);
 		err = edid_write_vga_segment(sd);
 		break;
 	case ADV7842_EDID_PORT_A:
 	case ADV7842_EDID_PORT_B:
-		memset(&state->hdmi_edid.edid, 0, sizeof(state->hdmi_edid.edid));
+		memset(state->hdmi_edid.edid, 0, sizeof(state->hdmi_edid.edid));
 		state->hdmi_edid.blocks = e->blocks;
 		if (e->blocks) {
 			state->hdmi_edid.present |= 0x04 << e->pad;
-			memcpy(&state->hdmi_edid.edid, e->edid, 128 * e->blocks);
+			memcpy(state->hdmi_edid.edid, e->edid, 128 * e->blocks);
 		} else {
 			state->hdmi_edid.present &= ~(0x04 << e->pad);
 			adv7842_s_detect_tx_5v_ctrl(sd);
