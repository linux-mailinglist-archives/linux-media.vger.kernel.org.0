Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85138F3DEA
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 03:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbfKHCRN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 21:17:13 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:57747 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfKHCRN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Nov 2019 21:17:13 -0500
X-Halon-ID: 7f013cc8-01cd-11ea-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 7f013cc8-01cd-11ea-837a-0050569116f7;
        Fri, 08 Nov 2019 03:14:41 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/3] dt-bindings: rcar-vin: Convert bindings to json-schema
Date:   Fri,  8 Nov 2019 03:16:06 +0100
Message-Id: <20191108021609.2584272-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This series converts the R-Car VIN bindings to json-schema. This is my 
first conversion so I hope I got everything right. The schema is strict 
and additionalProperties=false is set at every level. The change passes 
'make dt_binding_check' and 'make dtbs_check' for all upstream DTS 
files.

Patch 1/3 and 2/3 fixes a few mistakes in the text base bindings before 
converting it to yaml to highlight what changes before the rather large 
conversion. Last 3/3 converts it from text to yaml.

Niklas Söderlund (3):
  dt-bindings: rcar-vin: Remove paragraph about aliases
  dt-bindings: rcar-vin: Document compatibility string for R8A77470
  dt-bindings: rcar-vin: Convert bindings to json-schema

 .../devicetree/bindings/media/renesas,vin.txt | 219 ----------
 .../bindings/media/renesas,vin.yaml           | 409 ++++++++++++++++++
 2 files changed, 409 insertions(+), 219 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/renesas,vin.txt
 create mode 100644 Documentation/devicetree/bindings/media/renesas,vin.yaml

-- 
2.23.0

