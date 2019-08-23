Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3909AF1B
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 14:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389647AbfHWMVE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 08:21:04 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:51743 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731784AbfHWMVE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 08:21:04 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 18YtikrR6Thuu18Ywiozd6; Fri, 23 Aug 2019 14:21:03 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org
Subject: [PATCHv10 0/2] cec: add the connector info API
Date:   Fri, 23 Aug 2019 14:20:57 +0200
Message-Id: <20190823122059.5270-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKh+SZzZ2rShfi+p8vWdWdkw+bHyBRsIuueZcTujRPG5yVjmn4iotge5YX9orx7VYY7kWh5ODCpy2itE4U2kriexfTmLqTbCENn9vysS3vFjy4SyGKxn
 1K6Pb2YbKI65AtDzG9AgI4U3+vb2RIRlzs3Ljnlg5f+uetyGP5r2OzEyQLHCyM2Qa/pfnPNntYmps+JR4WvQzHtYCCh9eYi1VoyRs1Bcqc0R7zgbyd2Jagyj
 baD77Wx9p6MS9A0G6sj5bDXLad81vctZOnEl0luCHQU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

These two patches add the CEC connector info API.

Note that connector info is currently for drm connectors only.
In the future support for v4l2 connectors will be added as well,
once we actually know how to uniquely identify a HDMI receiver
connector.

Regards,

	Hans

Dariusz Marcinkiewicz (1):
  cec: expose the new connector info API

Hans Verkuil (1):
  cec: document CEC_ADAP_G_CONNECTOR_INFO and capability

 Documentation/media/uapi/cec/cec-funcs.rst    |   1 +
 .../media/uapi/cec/cec-ioc-adap-g-caps.rst    |   6 +-
 .../uapi/cec/cec-ioc-adap-g-conn-info.rst     | 105 ++++++++++++++++++
 .../media/uapi/cec/cec-ioc-dqevent.rst        |   8 ++
 drivers/media/cec/cec-adap.c                  |   2 +
 drivers/media/cec/cec-api.c                   |  20 ++++
 drivers/media/cec/cec-core.c                  |   5 -
 include/media/cec.h                           |  31 ------
 include/uapi/linux/cec.h                      |  40 +++++++
 9 files changed, 181 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst

-- 
2.20.1

