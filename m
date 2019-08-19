Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5943492613
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 16:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbfHSOF5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 10:05:57 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:41864 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbfHSOF4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 10:05:56 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7DA6825AF0E;
        Tue, 20 Aug 2019 00:05:54 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 5F9ED9406ED; Mon, 19 Aug 2019 16:05:52 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] dt-bindings: sh-mobile-ceu: Rename bindings documentation file
Date:   Mon, 19 Aug 2019 16:05:44 +0200
Message-Id: <20190819140544.19294-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Renesas media binding documentation files uses a naming schema of
'renesas,<module>.txt'. Rename the SH Mobile CEU file to match this pattern.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
Based on v5.3-rc1
---
 .../bindings/media/{sh_mobile_ceu.txt => renesas,sh-mobile-ceu.txt}       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/media/{sh_mobile_ceu.txt => renesas,sh-mobile-ceu.txt} (100%)

diff --git a/Documentation/devicetree/bindings/media/sh_mobile_ceu.txt b/Documentation/devicetree/bindings/media/renesas,sh-mobile-ceu.txt
similarity index 100%
rename from Documentation/devicetree/bindings/media/sh_mobile_ceu.txt
rename to Documentation/devicetree/bindings/media/renesas,sh-mobile-ceu.txt
-- 
2.11.0

