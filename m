Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8291D223111
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 04:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbgGQCNS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 22:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbgGQCNR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 22:13:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD8EC061755
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2020 19:13:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1830561
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2020 04:13:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594951996;
        bh=3w3he3sU1mhpkF9vXKbpFscYai7qxm3OM3NJcHQ3Cgo=;
        h=Date:From:To:Subject:From;
        b=RfuC8Eps+d4e3CjEQ8SVQj12WrHqLFhT0aq8k0kH0ozm+Qs4/62WhydtFZ/bWxgpT
         Fdv2WtVxxmfXtqrE18jTTbXyxcOg/3E5gb/E3gatn8Ug5vOVU/1FGUB0yJrHHm3XBG
         v5hIVps5nJUD4oV5Ibzhe8nMmbVgUa8VMefTGt7w=
Date:   Fri, 17 Jul 2020 05:13:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.9] Convert Renesas DT bindings to YAML
Message-ID: <20200717021308.GA359@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit 6f01dfb760c027d5dd6199d91ee9599f2676b5c6:

  media: cros-ec-cec: do not bail on device_init_wakeup failure (2020-07-04 12:45:45 +0200)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/v4l2-yaml-20200717

for you to fetch changes up to c87091a878aba5b62fae9f208d0aab47f698e8e6:

  dt-bindings: media: renesas,vsp1: Add power-domains and resets (2020-07-17 05:09:55 +0300)

----------------------------------------------------------------
Convert Renesas DT bindings to YAML

----------------------------------------------------------------
Laurent Pinchart (8):
      dt-bindings: media: renesas,fcp: Convert binding to YAML
      dt-bindings: media: renesas,fcp: Make power-domains mandatory
      dt-bindings: media: renesas,fcp: Add resets and iommus properties
      dt-bindings: media: renesas,fdp1: Convert binding to YAML
      dt-bindings: media: renesas,fdp1: Make power-domains mandatory
      dt-bindings: media: renesas,fdp1: Add resets property
      dt-bindings: media: renesas,vsp1: Convert binding to YAML
      dt-bindings: media: renesas,vsp1: Add power-domains and resets

 .../devicetree/bindings/media/renesas,fcp.txt   | 34 -------
 .../devicetree/bindings/media/renesas,fcp.yaml  | 66 +++++++++++++
 .../devicetree/bindings/media/renesas,fdp1.txt  | 37 -------
 .../devicetree/bindings/media/renesas,fdp1.yaml | 69 +++++++++++++
 .../devicetree/bindings/media/renesas,vsp1.txt  | 30 ------
 .../devicetree/bindings/media/renesas,vsp1.yaml | 97 +++++++++++++++++++
 MAINTAINERS                                     |  6 +-
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
