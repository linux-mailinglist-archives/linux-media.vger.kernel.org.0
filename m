Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E75103A9A68
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 14:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232971AbhFPMa5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 08:30:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:49294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232535AbhFPMaq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 08:30:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94CE2613C7;
        Wed, 16 Jun 2021 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623846520;
        bh=oqjheYG9h6Tj93iYGW/qpgENpt3aGXsa0799OrvQ9yI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AlcLOffiFWXL5cRggUltDdgmSWK6JreQRh0+Olh8oMZfUiMTrMymEZkeseIhwfBaU
         +4wOSWMtGOqYlVuXi6TIHcO5OS7ZZ88Ljk0RDP19GXhLkXPYeldowC46VDcU7cTN4x
         c+gklEMaGu5KuWBPOuHjQogcSzK85fqYjSC1Qj1kjW7K27PTlBeTHmiczYkQ25WR4Q
         2n4xyNQFOV8+8n6rvMJkDcMOlqBmblJdt4IWXba6Hkfvq27iAPCv5B5SLzuKmeinZN
         LmqCGUb3AJATNlhbI4+lTaU4mNgUZmotnNWdcuLAdfj0WTmx25hMRnDmUfTKQPl6T/
         kGUS7Pq7VboEw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ltUes-004oiP-7C; Wed, 16 Jun 2021 14:28:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 01/11] media: dvb_ca_en50221: avoid speculation from CA slot
Date:   Wed, 16 Jun 2021 14:28:27 +0200
Message-Id: <77322db90902cd2c9d25fa3d614bf25809e9c609.1623846327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623846327.git.mchehab+huawei@kernel.org>
References: <cover.1623846327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As warned by smatch:
	drivers/media/dvb-core/dvb_ca_en50221.c:1392 dvb_ca_en50221_io_do_ioctl() warn: potential spectre issue 'ca->slot_info' [r] (local cap)

There's a potential of using a CAM ioctl for speculation.

The risk here is minimum, as only a small subset of DVB
boards have CI, with a CAM module installed. Also, exploiting
it would require an user capable of starting a DVB application.

There are probably a lot of easier ways to try to exploit.

Yet, it doesn't harm addressing it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/dvb-core/dvb_ca_en50221.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/dvb-core/dvb_ca_en50221.c b/drivers/media/dvb-core/dvb_ca_en50221.c
index b7e4a3371176..15a08d8c69ef 100644
--- a/drivers/media/dvb-core/dvb_ca_en50221.c
+++ b/drivers/media/dvb-core/dvb_ca_en50221.c
@@ -1386,6 +1386,7 @@ static int dvb_ca_en50221_io_do_ioctl(struct file *file,
 			err = -EINVAL;
 			goto out_unlock;
 		}
+		slot = array_index_nospec(slot, ca->slot_count);
 
 		info->type = CA_CI_LINK;
 		info->flags = 0;
-- 
2.31.1

