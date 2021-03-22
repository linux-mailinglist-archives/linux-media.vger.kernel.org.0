Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB40344848
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 15:56:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbhCVOzn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 10:55:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:60626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231130AbhCVOzR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 10:55:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27F8D6192D;
        Mon, 22 Mar 2021 14:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616424917;
        bh=av4OEy6Me9jsGo3iTHvfLO8reSSyLBEb0n5B7uJpJxY=;
        h=From:To:Cc:Subject:Date:From;
        b=YJksH+AjAnipQrMkuKHTJVtNSeQTNFr8YCNRPDbwON4LK7anaKE8PFggqMAPMkZSu
         uAUVXRtB4xQfcwSGpIMJrxcFgxqdhtHD54Sx66Coi72GyCChoDB9BZGE9djgMCx16g
         p15V/mGNwzi2PsR9OLu98Y4ShkQ8wml65oT3wJxe0KTQVa4MmdgLMJUkimcvIZVINE
         LnPbT0c8zEIGfz4ATX9NVTFBFIVow9lYG3wvv5on5/0/1HSmYuK0CzdYsQJRKRGWhV
         LF7DXBt/1D2vYkPsDq9lr13hVw9OuyauCVtC2PcA6MJIXyKb28wqTDHzhOW9UWX/Ps
         sKweKxSxEEqEA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lOLxa-006dZD-Cy; Mon, 22 Mar 2021 15:55:14 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH] media: dvb_frontend: don't call dvb_frontend_get_stepsize() twice
Date:   Mon, 22 Mar 2021 15:55:13 +0100
Message-Id: <8d4a554d9cb196e928f16263d5c12fa400076c34.1616424910.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Avoid calling the function twice, as it was just called at the
previous line.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-core/dvb_frontend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 00b361a534ea..6aaa4d5a504d 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -1821,7 +1821,7 @@ static void prepare_tuning_algo_parameters(struct dvb_frontend *fe)
 		case SYS_DTMB:
 			fepriv->min_delay = HZ / 20;
 			fepriv->step_size = dvb_frontend_get_stepsize(fe) * 2;
-			fepriv->max_drift = (dvb_frontend_get_stepsize(fe) * 2) + 1;
+			fepriv->max_drift = fepriv->step_size + 1;
 			break;
 		default:
 			/*
-- 
2.30.2

