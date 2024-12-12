Return-Path: <linux-media+bounces-23339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C50489EEE9A
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 16:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9814216D30C
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 15:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86F9222D7E;
	Thu, 12 Dec 2024 15:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="dAeDmfji"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FF521C166
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 15:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018780; cv=pass; b=oFkztyyZcA8FKfTGjg91n7F9kiiaJaDT/1ZTsh0lY8/KqxIJjHy5k8nV3wXOiiLp0mOptxRudw5mWAbcVVPdJ/qzJ7wEenQyMcrhUWQ6FPXUnqhFYrW0QVlDL01ij6CRl5vrHoZs4KP7UNiJFKHBhSnW0h8nviX72jrB8vIRWvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018780; c=relaxed/simple;
	bh=cmwjENE2n3o4hGZwV3im8A8dYom39pNkcicADhjRKqw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ILBO6Hi+FNGE8vxPGLI0msw4MObLXKcaTXFNG5Eq9g8Nlu+Vt5SZFT45Zwm0F3u6hqWGDmy6mlQTJ8r3tw2fJoxpGf1CS22mdnzaQPQN2sdxKxE5MQA4th2svwlRWUu89c79Wy11q54cn4X+d69BQh6UIOt7iliIReIb2778AyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=dAeDmfji; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1734018776; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=i3CZJg+XDKAod4cKtPOtNr/iR+7BbF3xwFs/c9yHQsjS1f5gDJCBz1VbEomwNRSN+kry9ba4fdboqdgUI7oGHhi398KrlVOrJQBM8jHCGz5EuKJy/kIx1sXpRiU1B0DIPyh5WX7H2JamVRuaccajQ1WBRLWKEIvvQatadaEZgwE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734018776; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=GPuwbqAGqH+0E1vCqq5Bu7jd99UU41mnikhbQRLNwwc=; 
	b=W/pqH4KZsA7H7C7ipCHJCqoPbryt/xhuup0pm+OYyRM7+VGsIXivMcUBwCvRgjAK14HDrode4qWNrwZISa9tx3dthc6dCemAj1Df04Dvd60ykbArCZk0KH/oicZB4//uHac89JqzjIFQzenH3UiRdLFb5i8k8sHAwkaA8uwIZR0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734018776;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=GPuwbqAGqH+0E1vCqq5Bu7jd99UU41mnikhbQRLNwwc=;
	b=dAeDmfji1w6g0fHdl5gX2o1TXtfW/e4c6W4BiXXr0wI6X1pUAXsSWdLf24fKd9Tk
	umBup0x+AXqx8m5r3ERnTS+gUHai9NvYf3aZNHSV/7xDWsImBBzQCxFzuw5jeEogph2
	2JsyuYDi56uYuocBqXf5E0ccQRWifsaBmQ2nJJDg=
Received: by mx.zohomail.com with SMTPS id 1734018775378289.77146583157287;
	Thu, 12 Dec 2024 07:52:55 -0800 (PST)
Date: Thu, 12 Dec 2024 16:52:51 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: linux-media@vger.kernel.org
Subject: [GIT PULL FOR 6.14] Various MDP3 changes
Message-ID: <20241212155251.gbzb73ibvlzpfxsv@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hey Mauro & Hans,

can you pull the following please? I got an okay from Angelo to take the
SOC change as well.

---

The following changes since commit a7f5b36b34824415c28875d615c49a3cf5070615:

   media: qcom: camss: Add support for camss driver on sc7280 (2024-12-12 09:41:09 +0100)

are available in the Git repository at:

   https://gitlab.collabora.com/sebastianfricke/linux.git tags/for-6.14-various-mdp3-changes

for you to fetch changes up to 38ce05cead695b4034300719c453e51ffeea6bc1:

   soc: mediatek: cmdq: Remove cmdq_pkt_finalize() helper function (2024-12-12 11:52:46 +0100)

----------------------------------------------------------------
Various small changes for MTK MDP3

----------------------------------------------------------------
Chun-Kuang Hu (3):
       media: platform: mtk-mdp3: Get fine-grain control of cmdq_pkt_finalize()
       media: platform: mtk-mdp3: Use cmdq_pkt_create() and cmdq_pkt_destroy()
       soc: mediatek: cmdq: Remove cmdq_pkt_finalize() helper function

Nícolas F. R. A. Prado (4):
       media: platform: mtk-mdp3: Use cmdq_pkt_write when no mask is needed
       media: platform: mtk-mdp3: Remove useless variadic arguments from macros
       media: platform: mtk-mdp3: Remove mask parameter from MM_REG_WRITE macro
       media: platform: mtk-mdp3: Remove mask parameter from MM_REG_POLL macro

  .../media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c   |  55 +--
  .../media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h   |   1 +
  .../media/platform/mediatek/mdp3/mtk-mdp3-comp.c   | 537 +++++++++------------
  .../media/platform/mediatek/mdp3/mtk-mdp3-comp.h   |  29 +-
  .../media/platform/mediatek/mdp3/mtk-mdp3-core.c   |   2 +
  .../media/platform/mediatek/mdp3/mtk-mdp3-core.h   |   1 +
  drivers/soc/mediatek/mtk-cmdq-helper.c             |  18 -
  include/linux/soc/mediatek/mtk-cmdq.h              |  13 -
  8 files changed, 264 insertions(+), 392 deletions(-)

Regards,
Sebastian Fricke

