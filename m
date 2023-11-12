Return-Path: <linux-media+bounces-146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0277E9067
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 14:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE76D1C20A0F
	for <lists+linux-media@lfdr.de>; Sun, 12 Nov 2023 13:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD93914F9F;
	Sun, 12 Nov 2023 13:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fm2pM/F+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEEA8C05
	for <linux-media@vger.kernel.org>; Sun, 12 Nov 2023 13:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781B2C433D9;
	Sun, 12 Nov 2023 13:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699795721;
	bh=87MpR4NZDj5oIZhV9IIhuMLOqHxvviyIklqJneyOJU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fm2pM/F+or4Vv0xEqRtC1oKQtQX1Jwn1t8qCVh9lKWjE94AmA9DsqljfzQiKsBWMP
	 Lncaz5nuCHvb7vTt2wz2HGUKEaQqSUZjRW/8lZ3oZGm1HcJt5LJXPtZvXCjThL2sCp
	 Fsgtaq9KRXIt4cuCg50Sl/0j93yw6K22msij1cjoddGU36d5VMOKd1+oxXJLaqRwmw
	 GAI6WUqAYdrHQm2TrSzE7k83X9ThIG3uYZO/Yhh+hHa5sLUfgvjQXgwRVSs4TsD14N
	 LQYsqoxGd7Z3/x3NrmSklTdshSfBKwmlyt3CkoyozI3h6l2Gk3PuEoXyF5vPauP2Xp
	 VatBGDV0xAYsw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	syzbot+59875ffef5cb9c9b29e9@syzkaller.appspotmail.com,
	"Ricardo B . Marliere" <ricardo@marliere.net>,
	Sean Young <sean@mess.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	gautammenghani201@gmail.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 7/9] media: imon: fix access to invalid resource for the second interface
Date: Sun, 12 Nov 2023 08:28:27 -0500
Message-ID: <20231112132830.176228-7-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231112132830.176228-1-sashal@kernel.org>
References: <20231112132830.176228-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.138
Content-Transfer-Encoding: 8bit

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit a1766a4fd83befa0b34d932d532e7ebb7fab1fa7 ]

imon driver probes two USB interfaces, and at the probe of the second
interface, the driver assumes blindly that the first interface got
bound with the same imon driver.  It's usually true, but it's still
possible that the first interface is bound with another driver via a
malformed descriptor.  Then it may lead to a memory corruption, as
spotted by syzkaller; imon driver accesses the data from drvdata as
struct imon_context object although it's a completely different one
that was assigned by another driver.

This patch adds a sanity check -- whether the first interface is
really bound with the imon driver or not -- for avoiding the problem
above at the probe time.

Reported-by: syzbot+59875ffef5cb9c9b29e9@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/000000000000a838aa0603cc74d6@google.com/
Tested-by: Ricardo B. Marliere <ricardo@marliere.net>
Link: https://lore.kernel.org/r/20230922005152.163640-1-ricardo@marliere.net
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sean Young <sean@mess.org>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/rc/imon.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 72e4bb0fb71ec..4e7c3d889d5ce 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -2427,6 +2427,12 @@ static int imon_probe(struct usb_interface *interface,
 		goto fail;
 	}
 
+	if (first_if->dev.driver != interface->dev.driver) {
+		dev_err(&interface->dev, "inconsistent driver matching\n");
+		ret = -EINVAL;
+		goto fail;
+	}
+
 	if (ifnum == 0) {
 		ictx = imon_init_intf0(interface, id);
 		if (!ictx) {
-- 
2.42.0


