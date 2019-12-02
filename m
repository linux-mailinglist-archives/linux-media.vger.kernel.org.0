Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBA9910F1AD
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2019 21:48:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfLBUsI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Dec 2019 15:48:08 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:53612 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725775AbfLBUsH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Dec 2019 15:48:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=PrJ+9YVDCsa1J/5bRKfNOveC5ktax5tBnyv/khur8RA=; b=Xg7S18K9M4tQWbaubJFU9xXxGc
        M9NqJtcEW5GKOx7jBulkklyjxHT/it28AemsYXAR1B0csEQWJelrln6PsQKf4KdHvAexuwdgLqZk4
        hAJB06KZJF0HtXsMFgQUtFage+TLOz6vbV0uFDxile4r4RZitWAGAIKlFVok9U/j13LU=;
Received: from p200300ccff066f001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff06:6f00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ibsbt-0007pS-Ov; Mon, 02 Dec 2019 21:47:57 +0100
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1ibsbt-0001l8-D1; Mon, 02 Dec 2019 21:47:57 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/2] ARM: dts: imx: pxp for imx6sll
Date:   Mon,  2 Dec 2019 21:47:46 +0100
Message-Id: <20191202204748.6718-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

fix bindings documentation about imx6sll and
add stuff to imx6sll.dtsi to enable pxp.

Andreas Kemnade (2):
  media: dt-bindings: media: fsl-pxp: add missing imx6sll
  ARM: dts: imx6sll: add PXP module

 Documentation/devicetree/bindings/media/fsl-pxp.txt | 2 +-
 arch/arm/boot/dts/imx6sll.dtsi                      | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.20.1

