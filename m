Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40146260D4
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2019 11:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729087AbfEVJzz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 May 2019 05:55:55 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:43625 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727464AbfEVJzz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 May 2019 05:55:55 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud8.xs4all.net with ESMTPA
        id TNyQhNk4I0YQeTNyThvAkR; Wed, 22 May 2019 11:55:53 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCHv2 0/7] cec: various improvements
Date:   Wed, 22 May 2019 11:55:43 +0200
Message-Id: <20190522095550.22026-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfDK62QxbSs0xclRzFDPKODNAwOEdBzM+1/kqW6iG0vK1t9o4iX4ADFPmW6Zg9q6P85X2Q0t3hpTJDI5l/7jU4O0JwlYL8aAedeLQZNUuimPA1yY7EgOt
 yunHCRPzvtiWhdtRdBDF0dmuKw9e5PHoiaGG+UCD4cNEhNrwlS6QZdwbK2qezNBd9YRD1q2C4QEY2g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds a new CEC_MSG_FL_RAW flag to skip all CEC message
checks and transmit the raw message (if called as root).

This is useful when debugging issues with other dubious CEC implementations.

It also relaxes an initiator check for Ping and Image/Text View On
messages when there is no HPD.

Currently the initiator is required to be 0xf, but this is not
actually specified anywhere in the CEC specification, and there are
indications that some displays ignore messages with initiator 0xf.

Regards,

	Hans

Changes since v1:

- Added patch 'cec-ioc-g-mode.rst: be more specific when EPERM is returned'
- CEC_MSG_FL_RAW now needs CAP_SYS_RAWIO instead of CAP_NET_ADMIN.
- Improved the cec-ioc-receive.rst documentation.

Hans Verkuil (7):
  cec: cec_transmit_msg_fh: do sanity checks first
  cec: move check from cec_transmit to cec_transmit_msg_fh
  cec: add CEC_MSG_FL_RAW flag and msg_is_raw helper function
  cec-ioc-receive.rst: document CEC_MSG_FL_RAW
  cec: support CEC_MSG_FL_RAW
  cec: allow any initiator for Ping and Image/Text View On
  cec-ioc-g-mode.rst: be more specific when EPERM is returned

 .../media/uapi/cec/cec-ioc-g-mode.rst         |   3 +-
 .../media/uapi/cec/cec-ioc-receive.rst        |  15 ++-
 drivers/media/cec/cec-adap.c                  | 112 +++++++++++-------
 drivers/media/cec/cec-api.c                   |   8 --
 drivers/media/cec/cec-priv.h                  |   5 +
 include/uapi/linux/cec.h                      |   1 +
 6 files changed, 94 insertions(+), 50 deletions(-)

-- 
2.20.1

