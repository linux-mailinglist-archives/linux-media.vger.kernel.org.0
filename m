Return-Path: <linux-media+bounces-28784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C43EA715D2
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 12:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A64557A5DEC
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 11:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2691DDA2D;
	Wed, 26 Mar 2025 11:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ibYTr7Mt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978311D79B3;
	Wed, 26 Mar 2025 11:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742988864; cv=none; b=BfF97kvop2Ch87JdfHwAOzDdbgD6VUA9LqspcTfglaKI+l29w71+tbzwk08bapznbZyOtSmcltu0eYY0tBtqfUTxp7HNr7t3AN105K3EBc41VLfA4YydbfVWMdCdhI4uN2OuALu+3kSgJB9P7ebQ+raHirNoWLdWMD+ISsTIAb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742988864; c=relaxed/simple;
	bh=cPNRXbKHXeYbN7MqMsZP5cCAL4pCe92DtlpwCIrTgTU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P+TjxhUqEycQFJa84fV/q+c9sITkj9qP3JxiamuRMrNZs9uzw0+y+nbdkLHAepTK5kFCqimmONdrC78e38UXTiVDaaedLqt6bh7lSSOrpPyd06/9noiyZl7FOhVHbx41gbjIIVyQKnIz/kyLhStoipxYHoY/b5C+AeRUHhdJXtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ibYTr7Mt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 549473A4;
	Wed, 26 Mar 2025 12:32:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742988752;
	bh=cPNRXbKHXeYbN7MqMsZP5cCAL4pCe92DtlpwCIrTgTU=;
	h=From:Subject:Date:To:Cc:From;
	b=ibYTr7MtlScqXZeuS0rszG/NwLkF3XnNV0n+exjUpGpG0evMo1kXC0Zsj7orRaumE
	 BCuPOGbJ7GSpDZppgJzB1ZKvUuXRLAcsOc9vn8P2ilHeRhyvawhGARjjTOYVjFoYcM
	 2+XIgeP4nOpv7MAhK98BeFSFMwGfTF6nEOOErRqQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v7 0/3] media: ti: cal: Add streams support
Date: Wed, 26 Mar 2025 13:34:00 +0200
Message-Id: <20250326-cal-streams-v7-0-659df87ad231@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACjm42cC/3XOzU7EIBSG4VuZsJbmHP4KrrwP44JSsMQpGGiIZ
 tJ7l05iJuq4/JJznrwXUn2JvpLH04UU32KNOfUxPpyIW2x69TTOfRMGjIMGTZ0907oVb9dKJ4N
 cA3PKBEH6x3vxIX5cteeXvkPJK92WfnwzODAEGKUc0CAqQZFueY1Ds+c3H5NPT3H2tuY0ZVvmw
 eX1kJdYt1w+r5lNHP79onZ4GPioEDwYof5qR1iTN8LgL0JSoEJLDDDyILX9h1DfhATOxE9CdYJ
 pZ3iYdABn7hD7vn8BsZiqgH0BAAA=
X-Change-ID: 20230808-cal-streams-b913802c69f4
To: linux-media@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benoit Parrot <bparrot@ti.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2072;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=cPNRXbKHXeYbN7MqMsZP5cCAL4pCe92DtlpwCIrTgTU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4+Y3662s+sdJ/g2Y654Taxe+8sobeJ9mq9YF+
 PxILVgadI2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+PmNwAKCRD6PaqMvJYe
 9d8dD/9lYWtvSO74Oo156BabgTLwsg6WwB6Z8ux4BK2KocMTemKjHt5WNJQKfuLpZpVKCsShcSw
 kK1PnNy+QoCQmFIVRwjpmX9donnrv7FfSv609/F7Yklu7bmrRaY9/bpfqQ+SE3y1PR93x4LQ54d
 IuU31pYMakmyq5wcsS/ukaKFG9T3kl0FElQg8N/rfKOgN8a+eCPlFMeusEluqV4iGSRye10h/Rm
 IsYSZn3TI1rq4OamX4Oj50WVkCUcX42oIh+WXDd2/oReLN6pRLCJvcEowFCHP0StRR2CINQ/axH
 Ftg1MB59JRhuBIEAapMun799RYMX7wFmYhUB/wrs9OjY0JZUKJKoWK3bmZI31gwr0u9/qu8iI4j
 z0U/8Ly4jR5+acf4FmDL1gx4o0xy1gClg1nDiKlXn861mxRZBdyt3PU4ppsuSNYu/qGVSbzpEEb
 KGDO4a3gJxTTuYa4d33envzKGACpcJTkqjyq7RdO5q/zQgpkbMEFYs552B2aOGR2HCih24UhgyI
 89L07BLn38rsLyLY3Nsb1fmjpSTnMo/q1skaKBy3Rj9+GuSSZy6HubuFD821SbYUSfTuBxeZM7Z
 Ny2M7f8qfvI5eVntuBRTXNhMV+ysm7ITD9U/oXNa6f1uUTScC966ZCW72pGPhJmYOZJly90B0+W
 4ToPTfCelU+LluQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

This adds streams support to TI CAL driver (and two minor improvements).

The previous version was sent in 2023, but there has been no changes
except from rebasing to upstream.

 Tomi

---
Changes in v7:
- Add Kieran's RBs
- Fix checkpatch warnings wrt. formatting
- Link to v6: https://lore.kernel.org/r/20250324-cal-streams-v6-0-28c93fb8f0c9@ideasonboard.com

Changes in v6:
- Rebase on top of v4.16-rc7
- Add two small patches (not related to streams as such)
- Dropper the metadata patch for now, to make the series apply to plain
  upstream
- Link to v5: https://lore.kernel.org/r/20230918-cal-streams-v5-0-4851f073f58a@ideasonboard.com

Changes in v5:
- Some improvements in the patch description of the first patch
- Add "media: ti: cal: Add metadata streams support"
- Link to v4: https://lore.kernel.org/r/20230808-cal-streams-v4-1-1f37610e0946@ideasonboard.com

Changes in v4:
- A few minor formatting changes
- Small changes regarding how the code handles metadata formats.
  No metadata formats are supported yet, but we do have some code to
  ensure that metadata formats aren't allowed on video nodes in video
  capture mode. A future patch will enable metadata capture, allowing
  the runtime change of video nodes between video and meta capture.
- Link to v3: https://lore.kernel.org/all/20230302100755.191164-6-tomi.valkeinen@ideasonboard.com/

---
Tomi Valkeinen (3):
      media: ti: cal: Use printk's fourcc formatting
      media: ti: cal: Fix wrong goto on error path
      media: ti: cal: Add streams support

 drivers/media/platform/ti/cal/cal-camerarx.c | 270 +++++++++++++++++++++------
 drivers/media/platform/ti/cal/cal-video.c    | 157 ++++++++++------
 drivers/media/platform/ti/cal/cal.c          |  45 +++--
 drivers/media/platform/ti/cal/cal.h          |   3 +-
 4 files changed, 347 insertions(+), 128 deletions(-)
---
base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
change-id: 20230808-cal-streams-b913802c69f4

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


