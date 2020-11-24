Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0702C23CC
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 12:08:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732772AbgKXLHq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 06:07:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:33786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732398AbgKXLGf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 06:06:35 -0500
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D925A20888;
        Tue, 24 Nov 2020 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606215991;
        bh=/HunhOVDxN0rAfQsnRYplsgded9ZPhM/rvVrXfIrbG8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wecqf2iDsV7PWP6ErC9mB0LqNq+RpdRIgWtmdgztdP6PM19ZcPYKnvtEwlJp/AKbu
         c4Aboeh6+P2yUG33e2xjByx2Ea2cOx1/9Ggmm3XNCaRv4zFIssK81t1pO07FNA6p84
         MSPiWWGmkvVEjh7Q3daTaTlETOivpYDMaMewYHe0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1khW9U-000FZu-UF; Tue, 24 Nov 2020 12:06:28 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 13/31] media: vidtv: improve EIT data
Date:   Tue, 24 Nov 2020 12:06:09 +0100
Message-Id: <297385af8494f8016ae6aa5eef6b7409e4d50315.1606215584.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606215584.git.mchehab+huawei@kernel.org>
References: <cover.1606215584.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Place some text at EIT data, and use ISO 8859-15 encoding for
the German letter "ü" (u mit umlat) letter.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_channel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_channel.c b/drivers/media/test-drivers/vidtv/vidtv_channel.c
index eba9d9dd0808..84c4f3f25f77 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_channel.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_channel.c
@@ -53,8 +53,8 @@ struct vidtv_channel
 *vidtv_channel_s302m_init(struct vidtv_channel *head, u16 transport_stream_id)
 {
 	const __be32 s302m_fid              = cpu_to_be32(VIDTV_S302M_FORMAT_IDENTIFIER);
-	char *event_text = ENCODING_ISO8859_15 "Beethoven's Für Elise";
-	char *event_name = ENCODING_ISO8859_15 "Beethoven Music";
+	char *event_text = ENCODING_ISO8859_15 "Bagatelle No. 25 in A minor for solo piano, also known as F\xfcr Elise, composed by Ludwig van Beethoven";
+	char *event_name = ENCODING_ISO8859_15 "Ludwig van Beethoven: F\xfcr Elise";
 	struct vidtv_s302m_encoder_init_args encoder_args = {};
 	char *iso_language_code = ENCODING_ISO8859_15 "eng";
 	char *provider = ENCODING_ISO8859_15 "LinuxTV.org";
-- 
2.28.0

