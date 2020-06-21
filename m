Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433652027AC
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2020 02:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729001AbgFUAsE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jun 2020 20:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728901AbgFUAsD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jun 2020 20:48:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC61C061794;
        Sat, 20 Jun 2020 17:48:03 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D535532;
        Sun, 21 Jun 2020 02:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592700482;
        bh=AheFJE5DVX4uY8v/JD7skTLoTphtChS1ByYzmSujvZk=;
        h=From:To:Cc:Subject:Date:From;
        b=pxzuNrHE9rBosZr1WxuOmTBOOWmgxkkXTVBJIcHD6d39k0lT/DxYXLNV0m/q73a6Q
         jqiWUuZpVnMksfdqaTgsCwDgKjGbnw02Ik63/Q1kOMZTy7adFlqRUa+Ra+xOvPZh+M
         VNKt48yivZUW1b5qCVoVJk12kwFBSdIyhrAW/XJc=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/8] dt-bindings: media: Conversion of Renesas bindings to YAML
Date:   Sun, 21 Jun 2020 03:47:26 +0300
Message-Id: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series converts the DT bindings for the Renesas R-Car FCP,
FDP1 and VSP1 to YAML. It also updates the bindings based on the
properties that have been added to the DT sources over time but never
documented.

Compared to v1, review comments have been incorporated to fix small
typos and simplify a few comments in the bindings, and MAINTAINERS has
been updated.

Rob, this series has been reviewed by Geert, could you merge it ?
Alternatively you can provide acks and I can send a pull request to get
it merged through the linux-media tree.

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
 MAINTAINERS                                   |  6 +-
 7 files changed, 235 insertions(+), 104 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,fcp.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,vsp1.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,vsp1.yaml

-- 
Regards,

Laurent Pinchart

