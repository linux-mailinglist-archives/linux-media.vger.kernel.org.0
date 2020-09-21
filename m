Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B88FD2722D4
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 13:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726815AbgIULnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 07:43:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:60116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726546AbgIULnv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 07:43:51 -0400
Received: from mail.kernel.org (ip5f5ad5b1.dynamic.kabel-deutschland.de [95.90.213.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 531AA21531;
        Mon, 21 Sep 2020 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600688630;
        bh=ASHqD3ESdUqQVFe8R4OYonvZFazZ6+32P0gSR84/YpA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BJZuQYsdRBZnKYSduax3mpwpAfxcaZHNYyoUTR7aW+pWwmN2yT/z2O56GxfUoiRdy
         TZ9stptTyyfW/e6IrKawEzmict+zC/C3a0d1bWU28LiZsuYz7vU3MojeYWFSrW+yFB
         r3VwKTrpxm2M8cu7XQXKzEipdlFWQhlJyEj70X8A=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kKKEW-0004VS-AI; Mon, 21 Sep 2020 13:43:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 9/9] media: vidtv: fix decoding with gstreamer and Vlc
Date:   Mon, 21 Sep 2020 13:43:46 +0200
Message-Id: <a02e94ba9cc2a8cd4802335539b33332a8407fd8.1600688419.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600688419.git.mchehab+huawei@kernel.org>
References: <cover.1600688419.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Neither Vlc nor Gstreamer likes the PES_scrambling_control bits.

In the case of GST, this can be seen with:

	$ GST_DEBUG=2 LANG=C gst-play-1.0 pcm_audio.ts
	...
	0:00:00.097973439 12308 0x55f7ddd155e0 WARN               pesparser pesparse.c:411:mpegts_parse_pes_header: Wrong '0x10' marker before PES_scrambling_control (0x40)
	0:00:00.097987026 12308 0x55f7ddd155e0 WARN                 tsdemux tsdemux.c:2314:gst_ts_demux_parse_pes_header: Error parsing PES header. pid: 0x111 stream_type: 0x6
	...

So, change, it. After such change, the stream now plays
fine with Vlc, Gstreamer, ffmpeg - and with programs
that use such libraries, like Kaffeine.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vidtv/vidtv_pes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_pes.c b/drivers/media/test-drivers/vidtv/vidtv_pes.c
index 57c7ed4fb3b5..2caad64349b3 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_pes.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_pes.c
@@ -137,7 +137,7 @@ static u32 vidtv_pes_write_h(struct pes_header_write_args args)
 	struct vidtv_pes_optional pes_optional    = {};
 	struct pes_header_write_args pts_dts_args = args;
 	u32 stream_id = (args.encoder_id == S302M) ? PRIVATE_STREAM_1_ID : args.stream_id;
-	u16 pes_opt_bitfield = 0x2 << 13;
+	u16 pes_opt_bitfield = 0x01 << 15;
 
 	pes_header.bitfield = cpu_to_be32((PES_START_CODE_PREFIX << 8) | stream_id);
 
-- 
2.26.2

