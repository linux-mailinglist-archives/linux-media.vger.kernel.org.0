Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2A31D42D4
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 03:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728165AbgEOBYq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 21:24:46 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54604 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbgEOBYq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 21:24:46 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61DC126A;
        Fri, 15 May 2020 03:24:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589505884;
        bh=RYd3KrEDade1C0PYv5ABAchKX50NNlyJLQ6Zo570Ook=;
        h=From:To:Cc:Subject:Date:From;
        b=mrsClYrQQH4DmZuQ27/XO4wu5Nk4E9oDUHpLHxAoP4qGDPSDRacCnSi9SCGdPFJId
         aHPCe3GfhZgaXh1SI6BEd7feypxPifM4LzotW100UkAlZft6QrYUXjjS8yXky2Zh9b
         3/WzPdpEcFXtWGE83q7VQkgCSFBfg37LX1vBMS3U=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/8] d-bindings: media: Conversion of Renesas bindings to YAML
Date:   Fri, 15 May 2020 04:24:24 +0300
Message-Id: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series converts the DT bindings for the Renesas R-Car FCP,
FDP1 and VSP1 to YAML. It also updates the bindings based on the
properties that have been added to the DT sources over time but never
documented.

Laurent Pinchart (8):
  dt-bindings: media: renesas,fcp: Convert binding to YAML
  dt-bindings: media: renesas,fcp: Make power-domains mandatory
  dt-bindings: media: renesas,fcp: Add resets and iommus properties
  dt-bindings: media: renesas,fdp1: Convert binding to YAML
  dt-bindings: media: renesas,fdp1: Make power-domains mandatory
  dt-bindings: media: renesas,fdp1: Add resets property
  dt-bindings: media: renesas,vsp1: Convert binding to YAML
  dt-bindings: media: renesas,vsp1: Add power-domains and resets

 .../devicetree/bindings/media/renesas,fcp.txt | 34 -------
 .../bindings/media/renesas,fcp.yaml           | 66 +++++++++++++
 .../bindings/media/renesas,fdp1.txt           | 37 -------
 .../bindings/media/renesas,fdp1.yaml          | 69 +++++++++++++
 .../bindings/media/renesas,vsp1.txt           | 30 ------
 .../bindings/media/renesas,vsp1.yaml          | 97 +++++++++++++++++++
 6 files changed, 232 insertions(+), 101 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,vsp1.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,vsp1.yaml

-- 
Regards,

Laurent Pinchart

