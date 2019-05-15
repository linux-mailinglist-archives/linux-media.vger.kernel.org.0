Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A51B11E99C
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2019 09:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbfEOH6c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 03:58:32 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:57739 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725876AbfEOH6b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 03:58:31 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id QonyhZzGqsDWyQoo2hrxaP; Wed, 15 May 2019 09:58:30 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/6] cec: various improvements
Date:   Wed, 15 May 2019 09:58:20 +0200
Message-Id: <20190515075826.18073-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfODe+GFDI/2Xjp3U8qugp5DdvyZTCgABHgdc17PVFeMJnr0zXVY/rKYZDalZltvlHLzNMWhsGcRlAesbzQBirxfhP8gvJmj3JQIoUFCIDJ156vTwUc8K
 zLYYy0GHqKEFYbr9aFxuoHAO+o95se8qhw6udW6PnPoBzU1LH6k/Y4w9nHTj+thNXI9SgN/E3CnTvw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series adds a new CEC_MSG_FL_RAW flag to skip all CEC message
checks and transmit the raw message (if called as root).

This is useful when debugging issues with other dubious CEC implementations.

The last patch relaxes an initiator check for Ping and Image/Text View On
messages when there is no HPD.

Currently the initiator is required to be 0xf, but this is not
actually specified anywhere in the CEC specification, and there are
indications that some displays ignore messages with initiator 0xf.

Regards,

	Hans

Hans Verkuil (6):
  cec: cec_transmit_msg_fh: do sanity checks first
  cec: move check from cec_transmit to cec_transmit_msg_fh
  cec-ioc-receive.rst: document CEC_MSG_FL_RAW
  cec: add CEC_MSG_FL_RAW flag and msg_is_raw helper function
  cec: support CEC_MSG_FL_RAW
  cec: allow any initiator for Ping and Image/Text View On

 .../media/uapi/cec/cec-ioc-receive.rst        |  13 +-
 drivers/media/cec/cec-adap.c                  | 112 +++++++++++-------
 drivers/media/cec/cec-api.c                   |   8 --
 drivers/media/cec/cec-priv.h                  |   5 +
 include/uapi/linux/cec.h                      |   1 +
 5 files changed, 90 insertions(+), 49 deletions(-)

-- 
2.20.1

