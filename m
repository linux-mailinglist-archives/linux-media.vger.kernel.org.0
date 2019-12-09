Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5EF21175D8
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 20:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbfLIT3b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 14:29:31 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.171]:13969 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbfLIT3a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 14:29:30 -0500
X-Greylist: delayed 536 seconds by postgrey-1.27 at vger.kernel.org; Mon, 09 Dec 2019 14:29:29 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1575919768;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=PfPi+FbDe8ayFFkfjtOgNAooGXVJwTf4F5we9AjTO7U=;
        b=FX9i9asYIfbnUq++i2NYx1DlJwWkPGI79jdbevsEhm0kKzV38E+cVexaqewrtUHRjZ
        wbZN+FoTen1z0HVGlldAi0uRe0NJ6bUDJeKrfgdAQQn6pln0VhoYJy+2KczYfzoIhC3b
        ZCYKZHgk4sFVEpSIvM171ExgJ8Qtk/7yAPQQ/SBBsk1AYo2LkrOkRiiGuCUDWQm0dnUo
        u3DfI2p/ufGY1QHKUGj5MgB0tqzzWNVxllPfms2q8qs7ZLG47nG9WJuPaPoV7wxkszTX
        GZ6ccy5GeI5EU94plV1l+Nt3HO1lqwkyfniYRhHoRfziv7cJNgMDbklkVwNm6MAkdpRi
        rsGw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQr4OGUPX+1JiWAnI+L0="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.0.2 DYNA|AUTH)
        with ESMTPSA id R01a59vB9JHRbXR
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 9 Dec 2019 20:17:27 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] media: venus: hfi_parser: Ignore HEVC encoding for V1
Date:   Mon,  9 Dec 2019 20:16:52 +0100
Message-Id: <20191209191652.222576-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some older MSM8916 Venus firmware versions also seem to indicate
support for encoding HEVC, even though they really can't.
This will lead to errors later because hfi_session_init() fails
in this case.

HEVC is already ignored for "dec_codecs", so add the same for
"enc_codecs" to make these old firmware versions work correctly.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
This makes Venus work on the Samsung Galaxy S4 Mini VE (MSM8916),
which is stuck on a rather old Venus firmware version (1.6-00040).
The firmware is signed, so unfortunately I'm not aware of a way to upgrade it...
---
 drivers/media/platform/qcom/venus/hfi_parser.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 2293d936e49c..7f515a4b9bd1 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -181,6 +181,7 @@ static void parse_codecs(struct venus_core *core, void *data)
 	if (IS_V1(core)) {
 		core->dec_codecs &= ~HFI_VIDEO_CODEC_HEVC;
 		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
+		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
 	}
 }
 
-- 
2.24.0

