Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A95E545CCFC
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351504AbhKXTRS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:17:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:52856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351107AbhKXTQl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:16:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73188610D1;
        Wed, 24 Nov 2021 19:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637781211;
        bh=rsXGcPf9XgkX1szuElTLppvmJPyU9p+Qriu/8wbfjw4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mmCb0c+K0QulsiXzZf3WmTFX4vN8lAeLuai6JkamfeO11dISldKjdjy89ePl9Ozb8
         UWlp3EvEyzmlrNp0RbfrdF+urQVy/kmh0Cf4bkqfULajcp6OCZLxPcfdTn6uQxELcE
         iiGO8JF4CyA7MOnS0rmm+iviKC+urtF0xI38ruvBuvAjDXoTKfMKJmhUXYdTZwpfUu
         LW8q++44Iz5utAM2lcPDCYI0ks4Bax7mOVb3c3T0jnB9T61exjIxP2LmRCm8Ohej8n
         m8e+Vh8EKb8TTtIp7NvQGILCZhX3Ne315kabHJflu6M9OppBjR2y3niB72pXr3yJ8E
         /bEwIWG/NOzQA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mpxhs-004Q5k-L2; Wed, 24 Nov 2021 20:13:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH 13/20] media: adv7604 add _maybe_unused to currently unused functions
Date:   Wed, 24 Nov 2021 20:13:16 +0100
Message-Id: <d9168d0d5961c46ee2691bfea0b093888da7172b.1637781097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several unused helper macros there, meant to parse some
fields.

While there's not wrong with that, it generates clang warnings
with W=1, causing build to break with CONFIG_WERROR.

So, add __maybe_unused to fix such warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/i2c/adv7604.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 44768b59a6ff..be95b2264221 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -398,14 +398,14 @@ static inline int io_write_clr_set(struct v4l2_subdev *sd, u8 reg, u8 mask,
 	return io_write(sd, reg, (io_read(sd, reg) & ~mask) | val);
 }
 
-static inline int avlink_read(struct v4l2_subdev *sd, u8 reg)
+static inline int __maybe_unused avlink_read(struct v4l2_subdev *sd, u8 reg)
 {
 	struct adv76xx_state *state = to_state(sd);
 
 	return adv76xx_read_check(state, ADV7604_PAGE_AVLINK, reg);
 }
 
-static inline int avlink_write(struct v4l2_subdev *sd, u8 reg, u8 val)
+static inline int __maybe_unused avlink_write(struct v4l2_subdev *sd, u8 reg, u8 val)
 {
 	struct adv76xx_state *state = to_state(sd);
 
@@ -439,14 +439,14 @@ static inline int infoframe_read(struct v4l2_subdev *sd, u8 reg)
 	return adv76xx_read_check(state, ADV76XX_PAGE_INFOFRAME, reg);
 }
 
-static inline int infoframe_write(struct v4l2_subdev *sd, u8 reg, u8 val)
+static inline int __maybe_unused infoframe_write(struct v4l2_subdev *sd, u8 reg, u8 val)
 {
 	struct adv76xx_state *state = to_state(sd);
 
 	return regmap_write(state->regmap[ADV76XX_PAGE_INFOFRAME], reg, val);
 }
 
-static inline int afe_read(struct v4l2_subdev *sd, u8 reg)
+static inline int __maybe_unused afe_read(struct v4l2_subdev *sd, u8 reg)
 {
 	struct adv76xx_state *state = to_state(sd);
 
@@ -479,14 +479,14 @@ static inline int rep_write_clr_set(struct v4l2_subdev *sd, u8 reg, u8 mask, u8
 	return rep_write(sd, reg, (rep_read(sd, reg) & ~mask) | val);
 }
 
-static inline int edid_read(struct v4l2_subdev *sd, u8 reg)
+static inline int __maybe_unused edid_read(struct v4l2_subdev *sd, u8 reg)
 {
 	struct adv76xx_state *state = to_state(sd);
 
 	return adv76xx_read_check(state, ADV76XX_PAGE_EDID, reg);
 }
 
-static inline int edid_write(struct v4l2_subdev *sd, u8 reg, u8 val)
+static inline int __maybe_unused edid_write(struct v4l2_subdev *sd, u8 reg, u8 val)
 {
 	struct adv76xx_state *state = to_state(sd);
 
@@ -570,7 +570,7 @@ static inline int hdmi_write_clr_set(struct v4l2_subdev *sd, u8 reg, u8 mask, u8
 	return hdmi_write(sd, reg, (hdmi_read(sd, reg) & ~mask) | val);
 }
 
-static inline int test_write(struct v4l2_subdev *sd, u8 reg, u8 val)
+static inline int __maybe_unused test_write(struct v4l2_subdev *sd, u8 reg, u8 val)
 {
 	struct adv76xx_state *state = to_state(sd);
 
@@ -601,14 +601,14 @@ static inline int cp_write_clr_set(struct v4l2_subdev *sd, u8 reg, u8 mask, u8 v
 	return cp_write(sd, reg, (cp_read(sd, reg) & ~mask) | val);
 }
 
-static inline int vdp_read(struct v4l2_subdev *sd, u8 reg)
+static inline int __maybe_unused vdp_read(struct v4l2_subdev *sd, u8 reg)
 {
 	struct adv76xx_state *state = to_state(sd);
 
 	return adv76xx_read_check(state, ADV7604_PAGE_VDP, reg);
 }
 
-static inline int vdp_write(struct v4l2_subdev *sd, u8 reg, u8 val)
+static inline int __maybe_unused vdp_write(struct v4l2_subdev *sd, u8 reg, u8 val)
 {
 	struct adv76xx_state *state = to_state(sd);
 
-- 
2.33.1

