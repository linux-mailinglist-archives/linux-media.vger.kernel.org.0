Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53C5F9A030
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 21:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388759AbfHVTjk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 15:39:40 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59186 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387622AbfHVTjk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 15:39:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=v60fBryrKzPTrb2LESAGxhaHHdlsP89G4dCrhZ3F+nc=; b=kFOA450i0enLLAOn4EDC7f6aCy
        f3UBFYag8v62zLyTntpd+mzDwvZPRaVzz0Vs1v7HtnVZEj6O5GYrYNZrRVkex1knmXcAg639C9POm
        2th2NS4+rDLkz/4kaPfxF6FLkRrniiTuTVczio937vr3RIpOoGQ5XKlW+3nvdGqXgO4XaKRotW0bB
        NpRijwlVJUU8zpuMPSrRgYYYtu1sc19Ptzr4Yt1mw5LIuKR4MGZn5smr/Qo2hLJhbXbu2dQvQ0dFO
        LTUa5DbtZxNxMJS2n2Jn9jHBT6+J3A8o0U8nA5txjYH+ofPjn05ptCl/nYLsdCCb5M6EgVG/WsPnA
        zRH0hvIw==;
Received: from [177.133.63.56] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i0svr-0002lV-Kv; Thu, 22 Aug 2019 19:39:39 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1i0svo-0007Id-J8; Thu, 22 Aug 2019 16:39:36 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 7/7] media: ngene: don't try to memcpy from NULL
Date:   Thu, 22 Aug 2019 16:39:34 -0300
Message-Id: <11ef5297a62a8c3cc812495b69398b316e80ad73.1566502743.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <4a411ba155eb062b6575aba0824123c840806c0b.1566502743.git.mchehab+samsung@kernel.org>
References: <4a411ba155eb062b6575aba0824123c840806c0b.1566502743.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[drivers/media/pci/ngene/ngene-i2c.c:122] -> [drivers/media/pci/ngene/ngene-i2c.c:39]: (error) Null pointer dereference: out

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/pci/ngene/ngene-i2c.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/ngene/ngene-i2c.c b/drivers/media/pci/ngene/ngene-i2c.c
index 2e9e9774dc6f..bfdb7286f6f0 100644
--- a/drivers/media/pci/ngene/ngene-i2c.c
+++ b/drivers/media/pci/ngene/ngene-i2c.c
@@ -36,7 +36,10 @@ static int ngene_command_i2c_read(struct ngene *dev, u8 adr,
 	com.cmd.hdr.Opcode = CMD_I2C_READ;
 	com.cmd.hdr.Length = outlen + 3;
 	com.cmd.I2CRead.Device = adr << 1;
-	memcpy(com.cmd.I2CRead.Data, out, outlen);
+
+	if (out)
+		memcpy(com.cmd.I2CRead.Data, out, outlen);
+
 	com.cmd.I2CRead.Data[outlen] = inlen;
 	com.cmd.I2CRead.Data[outlen + 1] = 0;
 	com.in_len = outlen + 3;
-- 
2.21.0

